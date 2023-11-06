SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ FUNCTION(함수) ■■■--
/*
--1. 함수란 하나 이상의 PL/SQL 문으로 구성된 서브루틴으로  
--    코드를 다시 사용할 수 있도록 캡슐화 하는데 사용된다.    
--    오라클에서는 오라클에 정의된 기본 제공 함수를 사용하거나  
--    직접 스토어드 함수를 만들 수 있다. (->사용자 정의 함수)  
--    이 사용자 정의 함수는 시스템 함수처럼 쿼리에서 호출하거나  
--    저장 프로시저처럼 EXECUTE 문을 통해 실행할 수 있다.  
-- *날짜, 숫자등 함수 -> 오라클 내장 함수*  
-- *우리가 직접 지정해서 함수를 불러다 쓸 수 있음*   

--2. 형식 및 구조
``` SQL
CREATE [OR REPLACE] FUNCTION 함수명
[( 매개변수명1 자료형
,  매개변수명2 자료형
)]
RETURN 데이터타입
IS
    -- 주요 변수 선언
BEGIN
    -- 실행문
    ...
    RETURN (값);
    
    [EXCEPTION]
        -- 예외 처리 구문;
END;
```
-- *뷰처럼 함수는 틀을 만들고 끼워넣어 실행하는 것*  

-- *다른 객체들과 달리 오라클의 FUNCTION에서는 **RETURN 데이터타입** 이 있다!*  
-- *EX) 자바 함수 -> 반환자료형 함수명()( ... RETURN XXX;}*  
-- *자바에서는 RETURN이 함수안에 있어서 내용을 모두 확인해야 알 수 있었다*  
-- *자바는 곡물통이 있을 경우 뚜껑을 열어서 내용을 확인해야 곡물인지 알 수 있지만,*  
-- *오라클은 곡물통 밖에 '곡물'이라고 스티커를 붙여 둔 것*  

*/

--※ 사용자 정의 함수(스토어드 함수)는  
--   IN 파라미터(입력 매개변수)만 사용할 수 있으며  
--   반드시 반환될 값의 데이터타입을 RETURN 문에 선언해야 하고,  
--   FUNCTION 은 반드시 단일 값만 반환한다.  

--  *함수는 입력매개변수만 가능하지만*  
--  *프로시저의 경우 입출력매개변수 가능?*  

--  *입력 매개변수, 출력 매개변수, 입출력 매개변수*  
--  *입력매개변수     -> 이거 건네줄테니 이걸로 일하렴.*  
--  *출력매개변수     -> 이거 건네줄테니 작업하고, 여기에 담아 건네주렴.*  
--  *입출력매개변수   -> 이거 건네줄테니 이걸로 작업하고 여기에 담아 건네주렴.*   


--○ TBL_INSA 테이블 전용 성별 확인 함수 정의(생성)  
--   --------------------
--    매개변수 구조(형태) → '771212-1022432' → 'YYMMDD-NNNNNNN'

--   함수명 : FN_GENDER()  
--                     ↑ 주민등록번호 → '771212-1022432'
-- *오라클에서 테이블전용 함수를 구성해야한다                        -> 아님!*  
-- *하이픈('771212-1022432')이 들어간 형태의 함수를 만든다는 의미    -> 맞음!*  

-- 선언부
CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)    -- 매개변수     : 자리수(길이) 지정 안함
RETURN VARCHAR2                                         -- 반환자료형   : 자리수(길이) 지정 안함
-- 정의부
IS
    -- 선언부  -> 주요 변수 선언(및 초기화)
    V_RESULT    VARCHAR2(20);
BEGIN
    -- 실행부  -> 연산 및 처리(그리고 결과값 반환)
    IF ( SUBSTR(V_SSN,8,1) IN ('1','3') )
        THEN V_RESULT := '남자';
    ELSIF ( SUBSTR(V_SSN,8,1) IN ('2','4') )
        THEN V_RESULT := '여자';
    ELSE
        V_RESULT := '성별확인불가';
    END IF;
    
    -- 결과값 반환       CHECK~!!!
    RETURN V_RESULT;
    -- *결과값 반환하지 않으면 넘어가지 않음*  
END;
--==>> Function FN_GENDER이(가) 컴파일되었습니다.

-- *매개변수 여러개도 지정가능*  
-- *CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2, COL1 NUMBER)...*  

-- *SET SERVEROUTPUT ON; 하지 않는 이유: 어제의 과정에서는 결과를 출력하기 위한 것이었고,  
-- *오늘의 실습은 함수를 선언하는 형태이기 때문에 하지 않는다.*  


/* 1-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ 임의의 정수 두 개를 매개변수(입력 파라미터)로 넘겨받아 -> (A,B)  
--   A 의 B 승의 값을 반환하는 사용자 정의 함수를 작성한다.  
--   단, 기존의 오라클 내장 함수를 이용하지 않고, 반복문을 활용하여 작성한다.  
-- 함수명 : FN_POW()  
/*
사용 예)
SELECT FN_POW(10,3)
FROM DUAL;
--==>> 1000
*/

CREATE OR REPLACE FUNCTION FN_POW(V_N1 NUMBER, V_N2 NUMBER)
RETURN NUMBER
IS
    -- 선언부
    V_I      NUMBER := 1;   -- 증가변수
    V_RESULT NUMBER := V_N1;-- 결과값
BEGIN
    -- 실행부    
    LOOP
        EXIT WHEN V_I >= V_N2;
        V_RESULT := V_RESULT * V_N1;
        V_I := V_I + 1;
    END LOOP;
    
    -- 결과값 반환
    RETURN V_RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*
FN_POW(10,3)
    기준 1 * 10 * 10 * 10 -> 1000 -(O)
    기준 0 * 10 * 10 * 10 -> 0    -(X)
*/
CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;    -- 반환 결과값 변수 -> 1로 초기화~!!! CHECK~!!!
    V_NUM       NUMBER;         -- 루프 변수
BEGIN
    -- 반복문 구성
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;   -- V_RESULT *= A;
    END LOOP;
    
    -- 최종 결과값 반환
    RETURN V_RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.
-- *PLSQL의 경우 컴파일 되었다고 해서, 로직이 문제가 없다는 것은 아님*  


/* 2-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_INSA 테이블의 급여 계산 전용 함수를 정의한다.  
--   급여는 <(기본급*12)+수당> 기반으로 연산을 수행한다.  
-- 함수명: FN_PAY(기본급, 수당)  

--BASICPAY
--SUDANG

CREATE OR REPLACE FUNCTION FN_PAY(V_BPAY NUMBER, V_SUDANG NUMBER)
RETURN NUMBER
IS
    V_RESULT NUMBER;
BEGIN
    V_RESULT := V_BPAY*12 + V_SUDANG;
    
    RETURN V_RESULT;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.


/* 2-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE OR REPLACE FUNCTION FN_PAY(VBASICPAY NUMBER, VSUDANG NUMBER)
RETURN NUMBER
IS
    -- 주요 변수 선언
    VRESULT NUMBER;
BEGIN
    -- 연산 및 처리
    VRESULT := (NVL(VBASICPAY,0)*12) + NVL(VSUDANG,0);
    
    -- 최종 결과값 반환
    RETURN VRESULT;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.

-- *기본급 누락, 수락 누락 등이 있으면 -> NULL*  
-- *따라서, 안정적이기 위해 NULL을 고려해 연산 및 처리 하기*  


/* 3-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_INSA 테이블에서
--   입사일을 기준으로 현재까지 근무년수를 반환하는 함수를 정의한다.
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
-- 함수명: FN_WORKYEAR(입사일)
-- *현재의 기준은 내년에 조회하더라도 가능하도록* 

--IBSADATE: 입사일
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN VARCHAR2
IS
    V_RESULT NUMBER;
    V_RESULT2 VARCHAR2(20);
BEGIN
    V_RESULT := TRUNC(MONTHS_BETWEEN(SYSDATE,VIBSADATE)/12,1);
    V_RESULT2 := (TO_CHAR(V_RESULT) ||'='||TRUNC(V_RESULT)||'년'||MOD(V_RESULT,1)*12||'개월');
    
    V_RESULT2 := (TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE,VIBSADATE)/12))||'년')
                 ||(TO_CHAR(TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,VIBSADATE),12)))||'개월');
                 
    RETURN V_RESULT2;
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.

/* 3-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 1
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD'))/12 "RESULT"
FROM DUAL;
--==>> 25.06314046321186778176025487853444842692

-- 2
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD'))/12) || '년' ||
        TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD')),12)) || '개월'
FROM DUAL;
--==>> 25년0개월

-- 3: 년의 소수점 첫째자리까지
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS 
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE) / 12 ,1);
    
    RETURN VRESULT;
END;

-- 4: X년 X개월
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN VARCHAR2
IS 
    VRESULT VARCHAR2(20);
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE) / 12) || '년' ||
               TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,VIBSADATE),12))||'개월';
    
    RETURN VRESULT;
END;

--------------------------------------------------------------------------------
--※ 참고(쿼리문의 유형 분류)

-- 1. INSERT, UPDATE, DELETE, (MERGE)  
--==>> DML(Data Manipulation Language)  
-- *삽입, 갱신, 삭제, (병합)  
-- COMMIT / ROLLBACK 이 필요하다.  

-- 2. CREATE, DROP, ALTER, (TRUNCATE)  
--==>> DDL(Data Definition Language)  
-- *구조적 생성, 삭제, 변경, (잘라내기)*  
-- 실행하면 자동으로 COMMIT 된다.

-- 3. GRANT, REVOKE
--==>> DCL(Date Control Language)
-- 실행하면 자동으로 COMMIT 된다.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Trasaction Control Language)

-- 정적 pl/sql문 -> DML문, TCL문만 사용 가능하다.
-- 동적 pl/sql문 -> DML문, DDL문, DCL문, TCL문 사용가능하다.

--------------------------------------------------------------------------------

--■■■ PROCEDURE(프로시저) ■■■--

-- 1. PL/SQL 에서 가장 대표적인 구조인 스토어드 프로시저는  
--  개발자가 자주 작성해야 하는 업무의 흐름을   
--  미리 작성하여 데이터베이스 내에 저장해 두어다가  
--  필요할 때 마다 호출하여 실행할 수 있도록 처리해 주는 구문이다.  

-- *PL/SQL의 주인공은 프로시저!*  

-- *미리 절차에 의거해 수행하는 것이 함수와 같은데 뭐가 다를까?*  
-- *오라클에서의 함수는 VOID가 리턴자료형이 없다.*  
-- *물론, 프로시저가 리턴자료형인것은 아니지만,*  
-- *RETURN 자료형이 VOID인 것을 생각하면서 그림을 그려보자.*  

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] PROCEDURE 프로시저명
[( 매개변수 IN 데이터타입
,  매개변수 OUT 데이터타입
,  매개변수 INOUT 데이터타입
)]
IS
    [-- 주요 변수 선언]
BEGIN
    -- 실행 구문;
    ...
    [EXCEPTION
        -- 예외 처리 구문;]
END;
*/
-- *매개변수가 없는 프로시저도 존재*  
-- *함수와 다르게 선언부와 IS 사이에 리턴이 없음*  
-- *자바에서는 순차적,절차적이라는 말은 적합하지 않지만.. 메소드안에서는 적합던 것과는 다르게
-- *프로시저에서는 **절차적** 이 중요함*  

--※ FUNCTION 과 비교했을 때 <RETURN 반환자료형> 부분이 존재하지 않으며,
--   <RETURN> 문 자체도 존재하지 않고,
--   프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
--   IN(입력), OUT(출력), INPUT(입출력) 으로 구분된다.

-- 3. 실행(호출)
/*
EXE[CUTE] 프로시저명[(인수1, 인수2, ...)];
*/

--※ 프로시저 실습을 위한 테이블 생성은...
--  **<20231103_02_scott.sql>** 파일 참조~!!!
-- *프로시저를 잘 이해하기 위해서는 복잡한 테이블이어야하는데,*  
-- *이 구조가 논리적으로 맞지 않을 수 있음. -> 이렇게 이해하고 갈 것*  

--~~~~~~~~~~~~~~~

--○ 프로시저 생성  
--   프로시저명: PRC_STUDENT_INSERT(아이디, 패스워드, 이름, 전화, 주소)  

-- *뼈대잡기*  
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( 아이디
, 패스워드
, 이름
, 전화
, 주소
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDW 테이블에 데이터 입력 -> INSERT
    INSERT INTO TBL_IDPW(ID,PW)
    VALUES(V_ID,V_PW);
    
    -- TBL_STUDENTS 테이블에 데이터 입력 -> INSERT
    INSERT INTO TBL_STUDENTS(ID,NAME,TEL,ADDR)
    VALUES(V_ID,V_NAME, V_TEL, V_ADDR);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_INSERT이(가) 컴파일되었습니다.

/* 4-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ 데이터 입력 시 특정 항목의 데이터만 입력하면  
--  내부적으로 다른 추가항목에 대한 처리가 함께 이루어질 수 있도록 하는 프로시저를 작성한다.(생성한다.)  
--  프로시저명: PRC_SUNGJUK_INSERT()  

/*
문제 인식)  
현재 TBL_SUNGJUK 테이블은  
HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE  
(학번, 이름, 국어점수, 영어점수, 수학점수, 총점, 평균, 등급) 컬럼으로 구성되어 있다.  
이 컬럼을 대상으로 특정 항목(학번, 이름, 국어점수, 영어점수, 수학점수)만 입력하면  
추가 항목(총점, 평균, 등급)은 알아서 처리될 수 있도록 프로시저를 구성하라는 것이다.  

실행 예)  
EXEC PRC_SUNGJUC_INSERT(1,'김다슬',90,80,70);  

-> 이와 같은 프로시저 호출로 처리된 결과  

학번 이름   국어점수 영어점수 수학점수  총점  평균  등급  
1    김다슬    90       80       70     240     80    B  
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.TOT%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
  -- 연산
  V_TOT := V_KOR + V_ENG + V_MAT;
  V_AVG := (V_TOT) / 3;
  
  IF V_AVG >= 90
    THEN V_GRADE := 'A';
  ELSIF V_AVG >= 80
    THEN V_GRADE := 'B';
  ELSIF V_AVG >= 70
    THEN V_GRADE := 'C';
  ELSE
    V_GRADE := 'D';
  END IF;

  -- 데이터 입력
  INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
         VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
  
  -- 커밋
  COMMIT;
END;
--==>> Procedure PRC_SUNGJUC_INSERT이(가) 컴파일되었습니다.

/* 4-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( 학번
, 성명
, 국어점수
, 영어점수
, 수학점수
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- 선언부
    -- INSERT 쿼리문을 수행하기 위해 필요한 추가 변수 구성
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 실행부
    -- 선언부에 추가로 선언한 주요 변수들에 값을 담아내야 한다.
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF (V_AVG>=90)
    -- *오라클에서는 괄호()가 있어야 한다는 규칙은 없음, 있어도 상관없음*
        THEN V_GRADE := 'A';
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- INSERT 쿼리문 수행
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUC_INSERT이(가) 컴파일되었습니다.


/* 5-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_SUNGJUCK 테이블에서 특정 학생의 점수  
--  (학번, 국어점수, 영어점수, 수학점수) 데이터 수정 시  
--  총점, 평균, 등급까지 함께 수정되는 프로시저를 생성한다.  
-- 프로시저명: PRC_SUNGJUK_UPDATE()  
/*
실행 예)
EXEC PRC_SUNGJUK_UPDATE(2,50,50,50);

-> 이와 같은 프로시저 호출로 처리된 결과  

학번 이름   국어점수 영어점수 수학점수  총점  평균  등급  
1    김다슬    90       80       70     240     80    B
2    노은하    50       50       50     150     50    F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.TOT%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 연산
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := (V_TOT) / 3;
    
    IF (V_AVG>=90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- 데이터 입력
    UPDATE TBL_SUNGJUK
    SET KOR=V_KOR, ENG=V_ENG, MAT=V_MAT, TOT=V_TOT, AVG=V_AVG, GRADE=V_GRADE
    WHERE HAKBUN = V_HAKBUN;
      
    -- 커밋
    COMMIT;
END;

/* 6-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_STUDENTS 테이블에서 전화번호와 주소 데이터를 수정하는(변경하는) 프로시저를 작성한다.
--  단, ID와 PW가 일치는 경우에만 수정을 진행 할 수 있도록 처리한다.
-- 프로시저명: PRG_STUDENT_UPDATE()
/*
실행 예)
EXEC PRC_STUDENT_UPDATE('moon', 'java000$', '010-9999-9999', '강원도 횡성');
--> 데이터 수정 X

EXEC PRC_STUDENT_UPDATE('moon', 'java006$', '010-9999-9999', '강원도 횡성');
--> 데이터 수정 O
*/

DESC TBL_STUDENTS;

CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
BEGIN
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID
      AND (SELECT PW
            FROM TBL_IDPW
            WHERE ID=V_ID)= V_PW;
      
    COMMIT;
END;

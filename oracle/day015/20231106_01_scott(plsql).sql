SELECT USER
FROM DUAL;
--==>> SCOTT

/* (231103_01_scott(plsql)
    6-문제 & 같이 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 방법1
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
    V_PW2   TBL_IDPW.PW%TYPE;       -- 사용자가 입력한 PW를 담을 변수
    V_FLAG  NUMBER := 0;            -- 패스워드일치:1 / 패스워드불일치:2
BEGIN
    -- 작성개념1) FROM TBL_IDPW를 통해 ID 확인;
    
    -- 작성개념2) 'moon'일 것이다고 가정하고
    --              사용자가 입력한 PW를 받을 수 있도록 작성    
    SELECT PW INTO V_PW2
    FROM TBL_IDPW
    WHERE ID = 'moon';
    
    -- 조건에 따라 분기(사용자 입력PW, 테이블을 통해 얻은 PW - 일치/ 불일치)
    IF (V_PW = V_PW2)       -- 패스워드 일치
        THEN V_FLAG := 1;
    ELSE                    -- 패스워드 불일치
        V_FLAG := 2;
    END IF;
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID
--      AND 패스워드 일치;
      AND V_FLAG = 1;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE이(가) 컴파일되었습니다.


-- 방법2
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
BEGIN
    
    -- 두개의 테이블을 JOIN 해서 업데이트
    UPDATE (SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR    -- 괄호 안의 서브쿼리만 잡아서 조회해보기
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2   
            ON T1.ID = T2.ID) T
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE T.ID = V_ID
      AND T.PW = V_PW;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE이(가) 컴파일되었습니다.

/* 1-문제 & 같이 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.  
--  NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG 으로 구성된 컬럼 중  
--  NUM(사원번호) 을 제외한 항목의 데이터 입력 시   
--  해당 항목의 값은 기존 부여된 사원 번호의 마지막 번호 그 다음 번호를  
--  자동으로 입력 처리할 수 있는 프로시저를 구성한다.  
--  프로시저명 : PRC_INSA_INSERT()
/*
실행 예)
EXEC PRC_INSA_INSERT('최혜인', '970812-2234567', SYSDATE, '서울', '010-2509-1783', '개발부', '대리', 2000000, 2000000) -- 이백만, 이백만
-> 위와 같이 프로시저 호출 및 실행

1061 최혜인 970812-2234567 2023-11-06 서울 010-2509-1783 개발부 대리 2000000 2000000
*/

DESC TBL_INSA;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)
*/
SELECT *
FROM TBL_INSA;

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME      IN TBL_INSA.NAME%TYPE
, V_SSN       IN TBL_INSA.SSN%TYPE
, V_IBSADATE  IN TBL_INSA.IBSADATE%TYPE
, V_CITY      IN TBL_INSA.CITY%TYPE
, V_TEL       IN TBL_INSA.TEL%TYPE
, V_BUSEO     IN TBL_INSA.BUSEO%TYPE
, V_JIKWI     IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY  IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG    IN TBL_INSA.SUDANG%TYPE
)
IS
  V_NUM   TBL_INSA.NUM%TYPE;
BEGIN
    /*
    -- 기존 부여된 사원번호의 마지막 번호
    SELECT MAX(NVL(NUM,0)) INTO NUM
    FROM TBL_INSA;
            
    -- 데이터 입력 쿼리문 구성
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG) 
            VALUES (V_NUM+1, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    -- 커밋
    COMMIT;
    */
    
    -- 기존 부여된 사원번호의 마지막 번호
    SELECT MAX(NVL(NUM,0)) + 1 INTO NUM
    FROM TBL_INSA;
    -- MAX(NVL(NUM,0))은 다른 값은 들어있고, 해당 값이 NULL 일때 사용가능
    -- NVL(MAX(NUM),0) 이 논리적으로 맞음
            
    -- 데이터 입력 쿼리문 구성
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG) 
            VALUES (V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    -- 커밋
    COMMIT;
END;

-- *★★★ 중요 ★★★
/* 2-문제 & 같이 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--※ 20231106_02_scott.sql 파일을 활용하여  
--   TBL_상품, TBL_입고 테이블을 대상으로  
--   TBL_입고 테이블에 데이터 입력 시(즉, 입고 이벤트 발생 시)  
--   TBL_상품 테이블에 해당 상품에 대한 재고수량이 함께 변동될 수 있는 기능을 가진 프로시저를 작성한다.  
--   단, 이 과정에서 입고번호는 자동 증가 처리한다.(시퀀스 사용 안함)  
--   TBL_입고 테이블 구성 컬럼은   
--   입고번호, 상품코드, 입고일자, 입고수량, 입고단가이며  
--   프로시저 호출을 통해 전달할 파라미터는 상품코드, 입고수량, 입고단가이다.  

--   프로시저명 : PRC_입고_INSERT(상품코드, 입고수량, 입고단가)  
--   프로시저명 : PRC_입고_INSERT(H001, 50, 500)  


CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드 IN TBL_상품.상품코드%TYPE
, V_입고수량 IN TBL_입고.입고수량%TYPE
, V_입고단가 IN TBL_입고.입고단가%TYPE
)
IS
    -- 선언부
    -- 아래의 쿼리문을 수행하기 위해 필요한 변수 추가 선언
    V_입고번호 TBL_입고.입고번호%TYPE;
    V_재고수량 TBL_입고.입고단가%TYPE;    
BEGIN
    -- 실행부
    -- 선언한 변수에 값 담아내기
    -- SELECT 쿼리문 수행 -> 입고번호 확인
    SELECT NVL(MAX(입고번호),0) INTO V_입고번호
    FROM TBL_입고;
    
    -- INSERT 쿼리문 수행: 입고 테이블 데이터 삽입
    -- *입고일자는 TABLE의 디폴트 SYSDATE를 가져옴*  
    INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가)
         VALUES ((V_입고번호+1), V_상품코드, V_입고수량, V_입고단가);
         
    -- 기존 재고수량
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- UPDDATE 쿼리문 수행: 상품 테이블 재고수량 업데이트
    UPDATE TBL_상품
    SET 재고수량 = V_재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 예외 처리
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
    -- *이외의 다른 상황이 발생하면, 롤백해라*  
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------

-- ■■■ 프로시저 내에서의 예외 처리 ■■■--

/* 3-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_NUMBER 테이블에 데이터를 입력하는 프로시저를 작성  
--   단, 이 프로시저를 통해 데이터를 입력하는 경우  
--   CITY(지역) 항목에 '서울', '경기', '대전'만 입력이 가능하도록 구성한다.  
--   이 지역 외의 다른 지역을 프로시저 호출을 통해 입력하려는 경우  
--   (즉, 유효하지 않은 데이터 입력을 시도하려는 경우)  
--   예외에 대한 처리를 하려고 한다.  
--   프로시저명: PRC_MEMBER_INSERT()  
/*
실행 예)
EXEC PRC_MEMBER_INSERT('박범구', '010-1111-1111', '서울');
--> 데이터 입력 ○

EXEC PRC_MEMBER_INSERT('김경태', '010-2222-2222', '부산');
--> 데이터 입력 X
*/

SELECT *
FROM TBL_출고;

CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 선언
    V_NUM               TBL_MEMBER.NUM%TYPE;
    
    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR     EXCEPTION;  -- *예외타입, 이름자유롭게 선언 가능*  
BEGIN
    -- 프로시저를 통해 입력 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
    -- 가장 먼저 확인할 수 있도록 코드 구성
    IF (V_CITY NOT IN ('서울', '경기', '대전'))
        -- 예외 발생 CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR;   -- *THRROW: 예외를 발생시키겠다*  
    END IF;

    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(NUM),0) INTO V_NUM
    FROM TBL_MEMBER;

    -- 쿼리문 구성 -> INSERT
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1) ,V_NAME, V_TEL, V_CITY);
    
    -- 예외 처리 구문
    -- *TRY~CATCH: 예외에 대한 분기처리*  
    -- *커밋보다 예외처리구문을 먼저 작성하기*  
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '서울,경기,대전만 입력이 가능합니다.'); -- *오라클 내장 함수*  
            -- *20001부터 사용자 지정 에러코드 지정가능*  
            -- *EXCEPTION 테이블 참조하여 에러코드 넣기*  
            ROLLBACK;
        WHEN OTHERS     -- *기타 다른 에러가 날 경우*  
            THEN ROLLBACK;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.


/* 4-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시) TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.  
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.  
--   또한, 출고수량이 재고수량보다 많은 경우... 출고 액션을 취소할 수 있도록 처리한다.  
--   (출고가 이루어지지 않도록...) -> 예외 처리 활용 CHECK~!!!  
--   프로시저명: PRC_출고_INSERT()  

/*
실행 예)
EXEC PRC_출고_INSERT('H001', 10, 600);
-> 이 시점에서 상품 테이블의 바밤바 재고수량은 70개

EXEC PRC_출고 IWNERT('H001', 80, 600);

-> 에러 발생
-- (20002, 재고부족~!!!)
*/

CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드 IN TBL_출고.상품코드%TYPE
, V_출고수량 IN TBL_출고.출고수량%TYPE
, V_출고단가 IN TBL_출고.출고단가%TYPE
)
IS
    V_NUM               TBL_상품.재고수량%TYPE;
    USER_DEFINE_ERROR2   EXCEPTION;
BEGIN
    SELECT 재고수량 INTO V_NUM
    FROM TBL_상품 
    WHERE 상품코드=V_상품코드;
    
    IF (V_NUM<V_출고수량)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
        VALUES((SELECT NVL(MAX(출고번호),0) +1 FROM TBL_출고), V_상품코드, V_출고수량, V_출고단가);
        
    UPDATE TBL_상품
    SET 재고수량 =  V_NUM - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002,'출고수량이 재고수량보다 많습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
        
    -- 커밋
    COMMIT;
END;

/* 4-문제 & 같이 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드 IN TBL_출고.상품코드%TYPE
, V_출고수량 IN TBL_출고.출고수량%TYPE
, V_출고단가 IN TBL_출고.출고단가%TYPE
)
IS
    -- 주요 변수 선언
    V_출고번호 TBL_출고.출고번호%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
    
    -- 사용자 정의 예외 선언
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 쿼리문 수행 이전에 수행 여부를 확인하는 과정에서
    -- 재고수량 파악 -> 기존 재고를 확인하는 과정이 선행되어야 한다.
    -- 그래야 프로시저 호출 시 넘겨받는 출고수량과 비교가 가능하기 때문...
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- 출고를 정상적으로 진행해줄 것인지에 대한 여부 확인
    -- 위에서 파악한 재고수량보다 현재 프로시저에서 넘겨받은 출고수량이 많으면
    -- 예외발생~!!!
    IF (V_출고수량>V_재고수량)
        -- 예외발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 출고번호얻어내기 -> 위에서 선언한 변수에 값 담아내기
    SELECT NVL(MAX(출고번호),0) + 1 INTO V_출고번호
    FROM TBL_출고;

    -- 쿼리문 구성 -> INSERT(TBL_출고)
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES(V_출고번호, V_상품코드, V_출고수량, V_출고단가);
    
    -- 쿼리문 구성 -> UPDATE(TBL_상품)
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    -- *예외처리는 커밋보다 상위에 있는 것을 실무적인 차원에서 권장함*
    -- *절차적인 언어이기 때문에, 종종 COMMIT 이후 예외처리를 하기도 하는 문제 발생*  
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.


/* 5-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_출고 테이블에서 출고수량을 수정(변경)하는 프로시저를 작성한다.
--   프로시저명: PRC_출고_UPDATE()
/*
실행 예)
EXEC PRC_출고_UPDATE(출고번호, 변경할수량);
*/
-- *출고번호가 잘못되었을 때, 기존 수량를 +, 수정되어야 하는 수량-*  
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( V_출고번호    IN TBL_출고.출고번호%TYPE
, V_변경수량    IN TBL_출고.출고수량%TYPE
)
IS
    V_상품코드 TBL_출고.상품코드%TYPE;
    V_출고수량 TBL_출고.출고수량%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR3 EXCEPTION;
BEGIN
    -- 출고테이블의 상품코드, 출고수량
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- 상품테이블의 재고수량
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    IF ((V_재고수량+V_출고수량)<V_변경수량)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    UPDATE TBL_상품
    SET 재고수량 = (V_재고수량+V_출고수량) - V_변경수량
    WHERE 상품코드 = V_상품코드;
    
    UPDATE TBL_출고
    SET 출고수량 = V_변경수량
    WHERE 출고번호 = V_출고번호;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    COMMIT;
END;


SELECT *
FROM TBL_출고;
--==>>
/*
출고번호	상품코드	출고일자	출고수량	출고단가
1	        H001	    2023-11-06	    20	    600
2	        C001	    2023-11-06	    20	    1500
*/
SELECT *
FROM TBL_상품;
--==>> 
/*
상품코드	상품명	소비자가격	재고수량
H001	    바밤바	    600	    30
H002	    죠스바	    500	    40
*/

-- *변경할 수량을 빼는 것은 재고수량에서 그냥 빼는 것이 아니라,
--  *출고에서 뺀 수량을 더하고 난 다음 빼는 것이다.
/*
1. 출고 테이블에서 V_상품코드, V_출고수량
2. 상품 테이블에서 V_상품코드에 해당하는 재고수량 가져오기
3. (원래 재고수량 + V_출고수량) < 변경할수량
     -> 에러발생
     
4. UPDATE 구문
상품테이블에서 재고수량  = 재고수량 + V_출고수량 - 변경할 수량

5. 예외처리...
*/
/* 5-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
(   -- (1) 매개변수 구성
  V_출고번호    IN TBL_출고.출고번호%TYPE
, V_출고수량    IN TBL_출고.출고수량%TYPE
)
IS
    -- (3) 필요한 변수 선언
    V_상품코드      TBL_상품.상품코드%TYPE;
    V_이전출고수량  TBL_출고.출고수량%TYPE;
    V_재고수량      TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- (4) 선언한 변수에 값 담아내기 *상품코드*
    -- (6) *이전출고수량*
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_이전출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- (8) 출고 정상수행여부 판단 필요
    --     변경 이전의 출고수량 및 현재의 재고수량 확인
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- (9) 파악한 재고수량에 따라데이터 변경 실시 여부 판단
    --     (『재고수량+이전출고수량 < 현재출고수량』 인 상황이라면... 사용자정의예외 발생)
    IF (V_재고수량+V_이전출고수량 < V_출고수량)
        -- THEN 사용자 정의 예외 발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- (2) 수행될 쿼리문 체크(UPDATE->TBL_출고 / UPDATE->TBL_상품)
    UPDATE TBL_출고
    SET 출고수량 = V_출고수량
    WHERE 출고번호 = V_출고번호;
    
    -- (5)
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_이전출고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    -- (10) 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족~!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- (7) 커밋
    COMMIT;
END;
--==>> Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.

SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 팀과제: 현재재고상황을 반영해 트랜잭션 처리
/*
1. PRC_입고_UPDATE(입고번호, 입고수량)
2. PRC_입고_DELETE(입고번호)
3. PRC_출고_DELETE(출고번호)
*/


/* 1-1) 문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 1. PRC_입고_UPDATE(입고번호, 입고수량)
CREATE OR REPLACE PROCEDURE PRC_입고_UPDATE
(   -- (1) 매개변수 구성
  V_입고번호  IN TBL_입고.입고번호%TYPE
, V_입고수량  IN TBL_입고.입고수량%TYPE
)
IS
    -- (3) 필요한 변수 선언
    V_상품코드      TBL_상품.상품코드%TYPE;
    V_이전입고수량  TBL_입고.입고수량%TYPE;
    V_재고수량      TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- (4) 선언한 변수에 값 담아내기 *상품코드*
    -- (6) *이전입고수량*
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_이전입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    -- (8) 입고 정상수행여부 판단 필요
    --     변경 이전의 입고수량 및 현재의 재고수량 확인
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- (9) 파악한 재고수량에 따라데이터 변경 실시 여부 판단
    --     (『(재고수량-이전입고수량 + 현재입고수량) < 0』 인 상황이라면... 사용자정의예외 발생)
    IF ((V_재고수량-V_이전입고수량 + V_입고수량) < 0)
        -- THEN 사용자 정의 예외 발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- (2) 수행될 쿼리문 체크(UPDATE->TBL_입고 / UPDATE->TBL_상품)
    UPDATE TBL_입고
    SET 입고수량 = V_입고수량
    WHERE 입고번호 = V_입고번호;
    
    -- (5)
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_이전입고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- (10) 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;

    -- (7) 커밋
    COMMIT;
END;

/* 1-2) 문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 2. PRC_입고_DELETE(입고번호)
CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
(   -- (1) 매개변수 구성
    V_입고번호    IN TBL_입고.입고번호%TYPE 
)
IS
    -- (3) 필요한 변수 선언
    V_상품코드      TBL_상품.상품코드%TYPE;
    V_입고수량      TBL_입고.입고수량%TYPE;
    V_재고수량      TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- (4) 선언한 변수에 값 담아내기 *상품코드*
    -- (6) *입고수량*
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    -- (8) 입고 정상수행여부 판단 필요
    --     변경 이전의 입고수량 및 현재의 재고수량 확인
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- (9) 파악한 재고수량에 따라데이터 변경 실시 여부 판단
    --     (『(V_재고수량-V_입고수량) < 0』 인 상황이라면... 사용자정의예외 발생)
    IF ((V_재고수량-V_입고수량) < 0)
        -- THEN 사용자 정의 예외 발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- (2) 수행될 쿼리문 체크(DELETE->TBL_입고 / UPDATE->TBL_상품)
    DELETE TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    -- (5)
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- (10) 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;

    -- (7) 커밋
    COMMIT;
END;
--==>> Procedure PRC_입고_UPDATE이(가) 컴파일되었습니다.

/* 1-3) 문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 3. PRC_출고_DELETE(출고번호)
CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
(   -- (1) 매개변수 구성
    V_출고번호    IN TBL_출고.출고번호%TYPE 
)
IS
    -- (3) 필요한 변수 선언
    V_상품코드      TBL_상품.상품코드%TYPE;
    V_출고수량      TBL_출고.출고수량%TYPE;
    V_재고수량      TBL_상품.재고수량%TYPE;
    
--    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- (4) 선언한 변수에 값 담아내기 *상품코드*
    -- (6) *출고수량*
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- (8) 출고 정상수행여부 판단 필요
    --     변경 이전의 출고수량 및 현재의 재고수량 확인
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- (2) 수행될 쿼리문 체크(DELETE->TBL_출고 / UPDATE->TBL_상품)
    DELETE 
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- (5)
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    -- (10) 예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;

    -- (7) 커밋
    COMMIT;
END;
--==>> Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------

--■■■ CURSOR(커서) ■■■--
-- *커서(상자)는 압축해 넣어서 뚜껑을 닫아놓았다가, 뚜껑을 열면 왁~~~!하고 나오는 모양*  
/*
1. 오라클에서는 하나의 레코드가 아닌 여러 레코드로 구성된 작업 영역에서   
    SQL 문을 실행하고 그 과정에서 발생한 정보를 저장하기 위해서 커서(CURSOR)를 사용하며  
    커서에는 암시적인 커서와 명시적인 커서가 있다.  
      
2. 암시적인 커서는 모든 SQL 구문에 존재하며 SQL문 실행 후 오직 하나의 행(ROW)만 출력하게 된다.  
    그러나 SQL문을 실행한 결과물(RESULT SET)이 여러행(ROW)으로 구셩된 경우  
    커서(CURSOR)를 명시적으로 선언해야 여러 행(ROW)을 다룰 수 있다.  
*/
--○ 커서 이용 전 상황(단일 행 접근 시)
SET SERVEROUTPUT ON;
--==>> [스크립트 출력] 작업이 완료되었습니다.(0.063초)

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
END;
--==>> 
/*
홍길동 -- 011-2356-4528

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 커서 이용 전 상황(다중 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
END;
--==>> 에러 발생(01422. 00000 -  "exact fetch returns more than requested number of rows")

/* 2-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- *반복문을 활용해 INSA 테이블 출력*  
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN
    FOR N IN 1001 .. 1061 LOOP
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM = V_NUM;
        
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
    END LOOP;
END;
--==>>
/*
홍길동 -- 011-2356-4528
  :
최혜인 -- 010-2509-1783
*/

/*
일반변수 -> 선언
예외변수 -> 선언

변수명 자료형     -- *이런형태를 취함*  
V_NUM   NUMBER;
U_ERR   EXCEPTION;
커서명  CURSOR;   -- (X)
*/

/*
-- *선생님이 만든 정의(우리끼리는)/ 내부적으로는 선언으로 표현하기도함*  
커서 -> 정의

TABLE   테이블명
INDEX   인덱스명
USER    유저명

CURSOR  커서명   -- (O)
*/
-- *선언과 정의의 쓰임이 변수명-자료형의 위치가 다름*  

--○ 커서 이용 후 상황
DECLARE
    -- 주요 변수 선언
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서 정의  CHECK~!!!
    CURSOR CUR_INSA_SELECT     -- *눌러 담은 모양*  
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    -- 오픈 커서
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 (와~!!!)쏟아져 나오는 데이터들 처리(반복문을 활용하여 처리) 
    LOOP
        -- 한 행 한 행 받아다가 처리하는 행위 -> 가져오다(데려오다)    -> 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- 언제까지??? (EXIT WHEN)
        --  -> 커서에서 더 이상 데이터가 쏟아져 나오지 않는 상태...  -> 『NOTFOUND』
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
    END LOOP;
    
    -- 클로즈 커서
    CLOSE CUR_INSA_SELECT;
    
    -- *오라클 자체 커서의 경우, 오픈해 쓰면 자동으로 닫기 때문에... 클로즈 커서때문에 에러가 나는 경우가 있다.*  
    -- *이럴 대는 클로즈 커서만 주석처리하고 재실행해보기*  
END;

--------------------------------------------------------------------------------

-- ■■■ TRIGGER(트리거) ■■■ --

/*
-- 사전적인 의미: 방아쇠, 촉발시키다, 야기하다, 유발하다.  
-- *부비트랩은 내가 계속 지켜보다가 터트리는 것이 아니라, 설치만 해두고 떠나면 알아서 터지는것이 중요함*  

1. TRIGGER(트리거)란 DML 작업 즉, INSERT, UPDATE, DELETE 작업이 일어날 때 
    자동적으로 실행되는(유발되는, 촉발되는) 객체로  
    이와 같은 특징을 강조하여 DML TRIGGER 라고 부르기도 한다.  
    TRIGGER 는 무결성 뿐 아니라 다음과 같은 작업에도 널리 사용된다.  
    
-- 자동으로 파생된 열 값 생성
-- *선생님이 떠나고 반장에 떠든사람 적는것*  
-- 잘못된 트랜잭션 방지  
-- 복잡한 보안 권한 강제 수행  
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행  
-- *사원정보 등록에서 참조하는 값에 등록된 내용만 등록가능*    
-- *-> 하지만.. 나누어져 있는 상태여서, 제약조건으로 제한 할 수 없을때 사용가능*  
-- 복잡한 업무 규칙 강제 적용  
-- *업무시간에는 메시전 프로그램이 안 돌도록 시스템안에 삽입해 놓은 것/ 업무시간 이후에 접근가능*  
-- 투명한 이벤트 로깅 제공  
-- *자동으로 파생된~이랑 같이 보면 좋음. 로그:기록, 로깅:로그를 남기는 것. INSER, DELETE 기록을 볼 수 있게 하는 것*  
-- 복잡한 감사 제공  
-- *자동으로 파생된~,투명한 이벤트~와 같은 카테고리의 개념*  
-- 동기 테이블 복제 유지관리  
-- *파급력으로 작동해야하는 것*  
-- 테이블 액세스 통계 수집  
-- *자동으로 파생된~,투명한 이벤트~,복잡한 감사~와 같은 카테고리의 개념*  

-- *==============================================*  
-- *공통특징: 사람이 하나하나 관리하기 힘들다*  
-- *==============================================*  

2. TRIGGER(트리거) 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다.
-- *프로시저를 호출하는 형태로 이용X, 사용자가 있는지도 모르고 사용*  

3. 특징 및 종류  
--      - BEFORE STATEMENT   
--      - BEFORE ROW  
--      - AFTER STATEMENT  
--      - AFTER ROW  
-- *앞에서 동작해야하는 트리거: BEFORE, 사후동작: AFTER*  
-- *하나의 케이스에서 동작:STARTEMENT, 모든 행을 스캔할때: ROW*  

4. 형식 및 구조  
*/
/*
CRAETE [OR REPLACE] TRIGGER 트리거명
    [BEFORE | AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명    -- *ON 테이블명: 어디에 장착할지*
    [FOR EACH ROW [WHEN TRIGGER 조건]]               -- *ROW에서 'FOR EACH ROW' 사용(FOR:각각의 행에 대해)*
                                                     -- *STATEMENT에서 'FOR EACH ROW' 삭제*
[DECLARE]
    -- 선언구문;
BEGIN
    -- 실행구문;
END;
*/


-- ■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■--
-- ※ DML 작업에 대한 이벤트 기록  
-- *떠든사람 적기, 떠들기 전에 예측해서 적을 수 없음*  

--○ TRIGGER(트리거) 생성
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
        AFTER                                       -- *사후에 작동*
        INSERT OR UPDATE OR DELETE ON TBL_TEST1     -- *INSERT OR UPDATE OR DELETE: 가 일어나면*   
BEGIN                                               -- *ON TBL_TEST1: 어디를 기준으로 작동하는지*   
    -- 이벤트 종류 구분(조건문을 통한 분기)
    IF(INSERTING)                                   -- **INSERTING**  
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(공통)THEN INSERT~*
            VALUES('INSERT 쿼리가 실행되었습니다.');
    ELSIF (UPDATING)                                -- **UPDATING**
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(공통)THEN INSERT~*
            VALUES('UPDATE 쿼리가 실행되었습니다.');
    ELSIF (DELETING)                                -- **DELETING**
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(공통)THEN INSERT~*
            VALUES('DELETE 쿼리가 실행되었습니다.');
    END IF;
    
    --COMMIT;
    -- ※ TRIGGER 내에서는 COMMIT / ROLLBACK 구문 사용 불가~!!! CHECK~!!!
END;
--==>> Trigger TRG_EVENTLOG이(가) 컴파일되었습니다.


-- ■■■ BEFORE STATEMENT TRIGGER 상황 실습 ■■■--
-- ※ DML 작업 수행 전에 작업에 대한 가능여부 확인  

--○ TRIGGER(트리거) 생성 -> TRG_TEST1_DML
-- *호출해서 쓰는 것이 아니기 때문에 중요하지 않지만,*  
-- *트리거 삭제등을 실행할때 구분지어질 수 있도록 규칙에 맞게 적기*  
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE                                          -- *사전에 작동되어 입력하지 못하게*  
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
--DECLARE
    -- 변수선언..  -- *구문적으로 사용은 가능하나,*
                   -- *사용자의 의지와 상관없이 실행되기 때문에.. 트리거에서 변수선언은 하지 않는다*  
BEGIN
--    IF (작업시간이 오전 9시 이전이거나... 오후 6시 이후라면)
--        THEN 작업을 수행하지 못하게 처리하겠다.
--    END IF;

    IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 9 OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        -- *6시 이후로 작업하지 못하도록... (시간>17) OR (시간>=18)으로 해야함*  
        THEN RAISE_APPLICATION_ERROR(-20003, '작업 시간은 09:00 ~ 18:00 까지만 가능합니다.');
    END IF;
END;
--==>> Trigger TRG_TEST1_DML이(가) 컴파일되었습니다.



-- ■■■ BEFORE ROW TRIGGER 상황 실습 ■■■--
-- ※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델  

--○ TRIGGER(트리거) 생성 -> TRG_TEST2_DELETE
-- *부모테이블에서 지울때 참조되고 있는 자식 데이터 삭제*  
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
        BEFORE
        DELETE ON TBL_TEST2
        FOR EACH ROW                        -- *FOR EACH ROW: 각각 하나씩 확인* 
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;     -- *『:OLD.』
END;
--==>> Trigger TRG_TEST2_DELETE이(가) 컴파일되었습니다.


-- *                UPDATE 시점
-- *--------------------●-------------------------
-- *     『:OLD』                 『:NEW』

-- *사실, UPDATE라는 쿼리문은 오라클에 내부에 존재하지 않음*
-- *UPDATE        ====>> DELETE + INSERT
-- *비효율의 크기 ====>> 'UPDATE * 10' > 'INSERT * 10'

-- ※ 『:OLD』  
--    참조 전 열의 값
--    - INSERT: 입력하기 이전 자료 즉, 입력할 자료
--    - DELETE: 삭제하기 이전 자료 즉, 삭제할 자료

-- ※ UPDATE
--    내부적으로 DELETE 그리고 INSERT 가 결합된 형태
--    UPDATE 하기 이전의 데이터는   『:OLD』
--    UPDATE 수행한 이후의 데이터는 『:NEW』




-- ■■■ AFTER ROW TRIGGER 상황 실습 ■■■--
-- ※ 참조 테이블 관련 트랜잭션 처리  
-- *가장 많이 사용됨*  
-- *프로시저에서 입고,출고를 할 때 관련제고 컨트롤이 중요했는데, AFTER ROW로 가능*  
-- *ROW TRIGGER의 경우 1:다 하나가 여러건에 걸쳐 두루 파장이 일어나야 하는 경우 ROW TRIGGER 사용*  
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_입고
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 + 새로입고되는수량
            WHERE 상품코드 = 새로입고되는상품코드;
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_입고
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 + :NEW.입고수량
            WHERE 상품코드 = :NEW.상품코드;
    END IF;
END;
--==>> Trigger TRG_IBGO이(가) 컴파일되었습니다.


/* 3-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_입고 테이블의 데이터 입력, 수정, 삭제 시
--   TBL_상품 테이블의 재고수량 변동 트리거 작성
--   트리거명: TRG_IBGO
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_입고
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 + :NEW.입고수량
            WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 - :OLD.입고수량 + :NEW.입고수량
            WHERE 상품코드 = :NEW.상품코드;
    ELSIF (DELETING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 - :OLD.입고수량
            WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
--==>> Trigger TRG_IBGO이(가) 컴파일되었습니다.

-- *예외처리에서는 0보다 작아지지 않기 위해서 구문을 작성했지만,*
-- *트리거에서는 0보다 작아지는게 맞음*  

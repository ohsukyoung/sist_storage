SELECT USER
FROM DUAL;
--==>> HR

DESC EMPLOYEES;

--○ %TYPE

-- 1. 특정 테이블에 포함되어 있는 컬럼의 데이터타입(자료형)을 참조하는 데이터 타입  

-- 2. 형식 및 구조  
-- 변수명 테이블.컬럼명%TYPE [:= 초기값];  
-- *변수명 VARCHAR2(30);*  
-- *이미 있는 테이블의 컬럼구조와 데이터타입을 직접 확인하는게 아니라, %TYPE을 통해서 알아서 설정하는 법*  

SET SERVEROUTPUT ON;


-- HR.EMPLOYEES 테이블의 특정 데이터를 변수에 저장
DECLARE
--    V_NAME  VARCHAR2(20);
    V_NAME  EMPLOYEES.FIRST_NAME%TYPE;
    -- *내부적으로 윗줄의 주석같이 오라클이 처리해줌*  
BEGIN
    -- *맞는 방법*  
    SELECT FIRST_NAME INTO V_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
    -- *맞지 않는 방법*
    /*
    V_NAME := (
        SELECT FIRST_NAME
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID = 103);
    */
--    SELECT FIRST_NAME, LAST_NAME INTO V_NAME,V_LASTNAME
    -- *여러셀 가져오는 것도 가능* 

/* 1-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMPLOYEES 테이블을 대상으로 108번 사원(Nancy)의
--   SALARY 를 변수에 담아 출력하는 PL/SQL 구문을 작성한다.
DECLARE
    V_SALARY    EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT SALARY INTO V_SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 108;
    
    DBMS_OUTPUT.PUT_LINE(V_SALARY);
END;
/*
12008


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

/* 2-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMPLOYEES 테이블의 특정 레코드 항목 여러 개를 변숭에 저장
--   103번 사원의 FIRST_NAME, PHONE_NUMBER, EMAIL 항목을 변수에 저장하여 출력
--   Alexander, 590.XXX, AHUNOLD

DESC EMPLOYEES;
/*
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4) 
*/
DECLARE
    -- FIRST_NAME   VARCHAR2(20) 
    -- PHONE_NUMBER VARCHAR2(20)
    -- EMAIL        VARCHAR2(25)
    V_FIRST_NAME    EMPLOYEES.FIRST_NAME%TYPE;
    V_PHONE_NUMBER  EMPLOYEES.PHONE_NUMBER%TYPE;
    V_EMAIL         EMPLOYEES.EMAIL%TYPE;
BEGIN
    SELECT FIRST_NAME,PHONE_NUMBER,EMAIL 
            INTO V_FIRST_NAME, V_PHONE_NUMBER, V_EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME||', '||V_PHONE_NUMBER||', '||V_EMAIL);
END;
--==>> Alexander, 590.423.4567, AHUNOLD

--○ %ROWTYPE

-- 1. 테이블의 레코드와 같은 구조의 구조체 변수를 선언(여러 개의 컬럼)

-- 2. 형식 및 구조
-- 변수명 테이블명%ROWTYPE;

DECLARE
--    V_FIRST_NAME    EMPLOYEES.FIRST_NAME%TYPE;
--    V_PHONE_NUMBER  EMPLOYEES.PHONE_NUMBER%TYPE;
--    V_EMAIL         EMPLOYEES.EMAIL%TYPE;
    -- *각각 선언하는 변수가 많으면, 테이블 자체를 *
    
    V_EMP   EMPLOYEES%ROWTYPE;  --*행에대한 타입을 모두
BEGIN
    SELECT FIRST_NAME,PHONE_NUMBER,EMAIL 
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME||', '||V_EMP.PHONE_NUMBER||', '||V_EMP.EMAIL);    
--    DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME||', '||V_PHONE_NUMBER||', '||V_EMAIL);
END;
--==>> Alexander, 590.423.4567, AHUNOLD

--○ EMPLOYEES 테이블의 전체 레코드 항목 여러 개를 변수에 저장
--   모든 사원의 FIRST_NAME, PHONE_NUMGR,EMAIL 항목을 변수에 저장하여 출력
DECLARE
    V_EMP   EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME||', '||V_EMP.PHONE_NUMBER||', '||V_EMP.EMAIL); 
END;
--==>> 에러 발생
-- (ORA-01422: exact fetch returns more than requested number of rows)
-- *하나의 값만 담을 수 있는데 여러 행의 레코드 값을 담게 되어 에러*

--> 여러 개의 행(ROWS)정보를 얻어와 담을고 하면 
--  단일 변수에 저장하는 것 자체가 불가능해진다.

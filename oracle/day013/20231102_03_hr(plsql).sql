SELECT USER
FROM DUAL;
--==>> HR

DESC EMPLOYEES;

--�� %TYPE

-- 1. Ư�� ���̺� ���ԵǾ� �ִ� �÷��� ������Ÿ��(�ڷ���)�� �����ϴ� ������ Ÿ��  

-- 2. ���� �� ����  
-- ������ ���̺�.�÷���%TYPE [:= �ʱⰪ];  
-- *������ VARCHAR2(30);*  
-- *�̹� �ִ� ���̺��� �÷������� ������Ÿ���� ���� Ȯ���ϴ°� �ƴ϶�, %TYPE�� ���ؼ� �˾Ƽ� �����ϴ� ��*  

SET SERVEROUTPUT ON;


-- HR.EMPLOYEES ���̺��� Ư�� �����͸� ������ ����
DECLARE
--    V_NAME  VARCHAR2(20);
    V_NAME  EMPLOYEES.FIRST_NAME%TYPE;
    -- *���������� ������ �ּ����� ����Ŭ�� ó������*  
BEGIN
    -- *�´� ���*  
    SELECT FIRST_NAME INTO V_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
    -- *���� �ʴ� ���*
    /*
    V_NAME := (
        SELECT FIRST_NAME
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID = 103);
    */
--    SELECT FIRST_NAME, LAST_NAME INTO V_NAME,V_LASTNAME
    -- *������ �������� �͵� ����* 

/* 1-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMPLOYEES ���̺��� ������� 108�� ���(Nancy)��
--   SALARY �� ������ ��� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
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


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

/* 2-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMPLOYEES ���̺��� Ư�� ���ڵ� �׸� ���� ���� ������ ����
--   103�� ����� FIRST_NAME, PHONE_NUMBER, EMAIL �׸��� ������ �����Ͽ� ���
--   Alexander, 590.XXX, AHUNOLD

DESC EMPLOYEES;
/*
�̸�             ��?       ����           
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

--�� %ROWTYPE

-- 1. ���̺��� ���ڵ�� ���� ������ ����ü ������ ����(���� ���� �÷�)

-- 2. ���� �� ����
-- ������ ���̺��%ROWTYPE;

DECLARE
--    V_FIRST_NAME    EMPLOYEES.FIRST_NAME%TYPE;
--    V_PHONE_NUMBER  EMPLOYEES.PHONE_NUMBER%TYPE;
--    V_EMAIL         EMPLOYEES.EMAIL%TYPE;
    -- *���� �����ϴ� ������ ������, ���̺� ��ü�� *
    
    V_EMP   EMPLOYEES%ROWTYPE;  --*�࿡���� Ÿ���� ���
BEGIN
    SELECT FIRST_NAME,PHONE_NUMBER,EMAIL 
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME||', '||V_EMP.PHONE_NUMBER||', '||V_EMP.EMAIL);    
--    DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME||', '||V_PHONE_NUMBER||', '||V_EMAIL);
END;
--==>> Alexander, 590.423.4567, AHUNOLD

--�� EMPLOYEES ���̺��� ��ü ���ڵ� �׸� ���� ���� ������ ����
--   ��� ����� FIRST_NAME, PHONE_NUMGR,EMAIL �׸��� ������ �����Ͽ� ���
DECLARE
    V_EMP   EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME||', '||V_EMP.PHONE_NUMBER||', '||V_EMP.EMAIL); 
END;
--==>> ���� �߻�
-- (ORA-01422: exact fetch returns more than requested number of rows)
-- *�ϳ��� ���� ���� �� �ִµ� ���� ���� ���ڵ� ���� ��� �Ǿ� ����*

--> ���� ���� ��(ROWS)������ ���� ������ �ϸ� 
--  ���� ������ �����ϴ� �� ��ü�� �Ұ���������.

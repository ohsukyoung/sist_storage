SELECT USER
FROM DUAL;
--==>> HR

--�� �� �� �̻��� ���̺� ����(JOIN, ����)

-- ���� 1. (SQL 1992 CODE)
SELECT ���̺��1.�÷���, ���̺��2.�÷���, ���̺��3.�÷���
FROM ���̺��1, ���̺��2, ���̺��3
WHERE ���̺��1.�÷���1 = ���̺��2.�÷���1
  AND ���̺��2.�÷���2 = ���̺��3.�÷���2;


-- ���� 2. (SQL 1999 CODE)
SELECT ���̺��1.�÷���, ���̺��2.�÷���, ���̺��3.�÷���
FROM ���̺��1 JOIN ���̺��2
ON ���̺��1.�÷���1 = ���̺��2.�÷���1
        JOIN ���̺��3
        ON ���̺��2.�÷���2 = ���̺��3.�÷���2;


--�� HR ���� ������ ���̺� �Ǵ� �� ��� ��ȸ
SELECT *
FROM TAB;
/*
TNAME	            TABTYPE	CLUSTERID
COUNTRIES	        TABLE	(null)
DEPARTMENTS	        TABLE	(null)
EMPLOYEES	        TABLE	(null)
EMP_DETAILS_VIEW	VIEW	(null)
JOBS	            TABLE	(null)
JOB_HISTORY	        TABLE	(null)
LOCATIONS	        TABLE	(null)
REGIONS	            TABLE	(null)	
*/

/* 1-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENTS ���̺��� �������
--   �������� �����͸�
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME �׸����� ��ȸ�Ѵ�.
--   E           E          J          D

SELECT *
FROM JOBS;
--** ������ �̸��� �ƴ� ������ ID �� �� ����
/* 19 ��
JOB_ID	JOB_TITLE	                MIN_SALARY	MAX_SALARY
AD_PRES	President	                    20080	40000
AD_VP	Administration Vice President	15000	30000
*/

SELECT *
FROM EMPLOYEES;
-- JOB_ID       -- ���� �÷�
/* 107��
EMPLOYEE_ID	FIRST_NAME	LAST_NAME	EMAIL	    PHONE_NUMBER	HIRE_DATE	JOB_ID	SALARY	COMMISSION_PCT	MANAGER_ID	DEPARTMENT_ID
100	        Steven	    King	    SKING	    515.123.4567	2003-06-17	AD_PRES	24000			                        90
101	        Neena	    Kochhar	    NKOCHHAR	515.123.4568	2005-09-21	AD_VP	17000		                    100	90
*/

SELECT *
FROM DEPARTMENTS;
-- DEPARTMENT_ID    -- ���� �÷�
/* 27��
DEPARTMENT_ID	DEPARTMENT_NAME	MANAGER_ID	LOCATION_ID
10	            Administration	200	        1700
20	            Marketing	    201	        1800
*/

SELECT *
FROM LOCATIONS;
/* 23��
LOCATION_ID	STREET_ADDRESS	        POSTAL_CODE	CITY	STATE_PROVINCE	COUNTRY_ID
1000	    1297 Via Cola di Rie	00989	    Roma	(null)	        IT
1100	    93091 Calle della Testa	10934	    Venice	(null)	        IT
*/

SELECT *
FROM COUNTRIES;
/* 25��
COUNTRY_ID	COUNTRY_NAME	REGION_ID
AR	        Argentina	    2
AU	        Australia	    3
*/

SELECT *
FROM REGIONS;
/* 4��
REGION_ID	REGION_NAME
1	        Europe
2	        Americas
*/
-------------------


SELECT FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME
FROM JOBS J JOIN EMPLOYEES;

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE--, DEPARTMENT_NAME
FROM JOBS J JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID;

--
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM JOBS J JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
    LEFT JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
    
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, DEPARTMENT_NAME
FROM JOBS J, EMPLOYEES E, DEPARTMENTS D
WHERE J.JOB_ID = E.JOB_ID
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

/* 1-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT COUNT(*)
FROM DEPARTMENTS;
--==>> 107

SELECT COUNT(*)
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--==>> 106
--** EMPLOYEES�� 107�̳� JOIN ������ 106�� �Ǿ����Ƿ�
--**, EMPLOYEES���� DEPARTMENT_ID�� ���� �Ѱ����� �����ϱ� ���� OUTER JOIN�� �Ѵ�.

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        JOIN JOBS J
        ON E.JOB_ID = J.JOB_ID;
--** 99�ڵ��� ����: ������ ������ �ִ��� �ܰ踦 ��ư��鼭 ������ ���� �ִ��� Ȯ���� �� �ִ�.
--** ������ �� Ȯ��: ����� �ڵ��� ���� NULL ���� ã�ƺ� ��!
-- ���� 1. (SQL 1992 CODE)
SELECT ���̺��1.�÷���, ���̺��2.�÷���, ���̺��3.�÷���
FROM ���̺��1, ���̺��2, ���̺��3
WHERE ���̺��1.�÷���1 = ���̺��2.�÷���1
  AND ���̺��2.�÷���2 = ���̺��3.�÷���2;
  
/* 2-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*�� EMPLOYEES,      DEPARTMENTS, JOBS,   LOCATIONS, COUNTRIES, REGIONS ���̺��� �������
--   E               D            J       L          C          R
--   JOB_ID                       JOB_ID
--   DEPARTMENT_ID   DEPARTMENT_ID
                     LOCATION_ID          LOCATION_ID
                                          COUNTRY_ID COUNTRY_ID
     MANAGER_ID      MANAGER_ID                      REGION_ID  REGION_ID
--   �������� �����͸� ������ ���� ��ȸ�Ѵ�.
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
--   E           E          J          D                L     C             R
*/

SELECT FIRST_NAME, LAST_NAME, JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE E.JOB_ID = J.JOB_ID
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L
WHERE E.JOB_ID = J.JOB_ID
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND D.LOCATION_ID = L.LOCATION_ID;
-- 92����
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L,COUNTRIES C, REGIONS R
WHERE E.JOB_ID = J.JOB_ID
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);

--  99����
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
    LEFT JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        LEFT JOIN LOCATIONS L
        ON D.LOCATION_ID = L.LOCATION_ID
            LEFT JOIN COUNTRIES C
            ON L.COUNTRY_ID = C.COUNTRY_ID
                LEFT JOIN REGIONS R
                ON C.REGION_ID = R.REGION_ID;


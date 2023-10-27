SELECT USER
FROM DUAL;
--==>> HR

--○ 세 개 이상의 테이블 조인(JOIN, 결합)

-- 형식 1. (SQL 1992 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명1 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;


-- 형식 2. (SQL 1999 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1 JOIN 테이블명2
ON 테이블명1.컬럼명1 = 테이블명2.컬럼명1
        JOIN 테이블명3
        ON 테이블명2.컬럼명2 = 테이블명3.컬럼명2;


--○ HR 계정 소유의 테이블 또는 뷰 목록 조회
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

/* 1-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENTS 테이블을 대상으로
--   직원들의 데이터를
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME 항목으로 조회한다.
--   E           E          J          D

SELECT *
FROM JOBS;
--** 직종의 이름이 아닌 직종의 ID 가 들어가 있음
/* 19 건
JOB_ID	JOB_TITLE	                MIN_SALARY	MAX_SALARY
AD_PRES	President	                    20080	40000
AD_VP	Administration Vice President	15000	30000
*/

SELECT *
FROM EMPLOYEES;
-- JOB_ID       -- 관계 컬럼
/* 107건
EMPLOYEE_ID	FIRST_NAME	LAST_NAME	EMAIL	    PHONE_NUMBER	HIRE_DATE	JOB_ID	SALARY	COMMISSION_PCT	MANAGER_ID	DEPARTMENT_ID
100	        Steven	    King	    SKING	    515.123.4567	2003-06-17	AD_PRES	24000			                        90
101	        Neena	    Kochhar	    NKOCHHAR	515.123.4568	2005-09-21	AD_VP	17000		                    100	90
*/

SELECT *
FROM DEPARTMENTS;
-- DEPARTMENT_ID    -- 관계 컬럼
/* 27건
DEPARTMENT_ID	DEPARTMENT_NAME	MANAGER_ID	LOCATION_ID
10	            Administration	200	        1700
20	            Marketing	    201	        1800
*/

SELECT *
FROM LOCATIONS;
/* 23건
LOCATION_ID	STREET_ADDRESS	        POSTAL_CODE	CITY	STATE_PROVINCE	COUNTRY_ID
1000	    1297 Via Cola di Rie	00989	    Roma	(null)	        IT
1100	    93091 Calle della Testa	10934	    Venice	(null)	        IT
*/

SELECT *
FROM COUNTRIES;
/* 25건
COUNTRY_ID	COUNTRY_NAME	REGION_ID
AR	        Argentina	    2
AU	        Australia	    3
*/

SELECT *
FROM REGIONS;
/* 4건
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

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
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
--** EMPLOYEES는 107이나 JOIN 결합후 106이 되었으므로
--**, EMPLOYEES에서 DEPARTMENT_ID가 없는 한개까지 포함하기 위해 OUTER JOIN을 한다.

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        JOIN JOBS J
        ON E.JOB_ID = J.JOB_ID;
--** 99코드의 장점: 누락된 사항이 있는지 단계를 밟아가면서 누락된 건이 있는지 확인할 수 있다.
--** 누락된 건 확인: 연결된 코드의 값이 NULL 인지 찾아볼 것!
-- 형식 1. (SQL 1992 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명1 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
  
/* 2-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*○ EMPLOYEES,      DEPARTMENTS, JOBS,   LOCATIONS, COUNTRIES, REGIONS 테이블을 대상으로
--   E               D            J       L          C          R
--   JOB_ID                       JOB_ID
--   DEPARTMENT_ID   DEPARTMENT_ID
                     LOCATION_ID          LOCATION_ID
                                          COUNTRY_ID COUNTRY_ID
     MANAGER_ID      MANAGER_ID                      REGION_ID  REGION_ID
--   직원들의 데이터를 다음과 같이 조회한다.
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
-- 92버전
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L,COUNTRIES C, REGIONS R
WHERE E.JOB_ID = J.JOB_ID
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);

--  99버전
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


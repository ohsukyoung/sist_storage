SELECT USER
FROM DUAL;



--■■■ 뷰(VIEW) ■■■--

-- 1. 뷰(VIEW)란 이미 특정한 데이터베이스 내에서 존재하는
--    하나 이상의 테이블에서 사용자가 얻기 원하는 데이터만을
--    정확하고 편하게 가져오기 위하여 사전에 원하는 컬럼들만을 모아서
--    만들어놓은 가상의 테이블로 편의성 및 보안에 목적이 있다.

--    가상의 테이블이란... 뷰가 실제로 존재하는 테이블(객체)이 아니라
--    하나 이상의 테이블에서 파생된 또 다른 정보를 볼 수 있는 방법이라는 의미이며,
--    그 정보를 추출해내는 SQL 문장이라고 볼 수 있다.

/*
- 가상의 테이블?
실제 물리적인 공간(하드디스크) 안에는 테이블도 들어있고, 뷰도 들어있는 형태가 아니며 하드디스크에는 테이블만 들어있다.
실제 데이터는 테이블에만 적재되는 것이고, 뷰(VIEW)는 그 테이블의 데이터들을 투영하여 보여주는 것이며,
뷰(VIEW)를 생성할 때 작성된 쿼리가 뷰를 조회하는 때마다 실행이 되는 것이다!
따라서, 테이블의 데이터가 변경되면 뷰가 데이터 변경 전에 생성되었다고 해도 뷰를 조회해보면
변경된 데이터가 변영된 형태로 조회된다.

- 보안의 목적?
한 테이블에 민감한 컬럼, 민감하지 않은 컬럼이 섞여 있을텐데,
민감하지 않은 컬럼으로만 뷰를 생성하면 사용자에게 민감한 컬럼을 노출시키지 않고 감춰둘 수 있다.
사용자가 뷰만 사용하게 하면 테이블 내부의 민감정보에 대해 알 수가 없고, 임의로 데이터를 변경시킬 수도 없다.
*/


-- 2. 형식 및 구조
-- CREATE [OR REPLACE] VIEW 뷰이름
-- [(ALIAS[, ALIAS, ...])]
-- AS
-- 서브쿼리(SUBQUERY)
-- [WITH CHECK OPTION]      
-- [WITH READ ONLY]      --> 뷰를 열람의 목적으로 사용할지.. 등의 옵션 (어드민 부분이라 지금은 설명 생략하고 패스함)


--○ 뷰(VIEW) 생성

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
        ,C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID;



CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
        ,C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID;
--==>> View VIEW_EMPLOYEES이(가) 생성되었습니다.
--> 뷰를 생성할 수 있는 권한도 뷰에 대한 권한 중에 하나이다!


--○ 뷰(VIEW) 조회
SELECT *
FROM VIEW_EMPLOYEES;


--○ 뷰(VIEW)의 구조 조회
DESC VIEW_EMPLOYEES;
--==>>
/*
이름              널?       유형           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY            NOT NULL VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25)
*/
--> 실제 원본테이블들의 해당 컬럼의 데이터타입이 구성된 방식에 의존함


--○ 뷰(VIEW) 소스 확인 (TIP! 이므로 당분간 의미있게 기억해둘 것)
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME ='VIEW_EMPLOYEES';
--==>>
/*
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
        ,C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID"
*/
--> TEXT 컬럼 : 뷰를 작성할 때의 소스 부분이 보여짐
-- TEXT 컬럼을 활용하여 새 뷰를 CREATE OR REPLACE 할 때 새로 추가하거나 뺄 부분을 쉽게 파악 가능하다.

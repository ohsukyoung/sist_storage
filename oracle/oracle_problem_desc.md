# 🗝️ 문제해설

<BR>

# 페이지 20231018_02_scott.sql
## 1. 문제
--○ EMP 테이블에서 부서번호가 20인 직원들의 데이터들 중
--사원번호, 사원명, 직종, 급여, 부서번호 조회
### 1.2. 답
``` SQL
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE EMPNO = 20;
--==>>
/*
7369	SMITH	CLERK	800	20
7566	JONES	MANAGER	2975	20
7788	SCOTT	ANALYST	3000	20
7876	ADAMS	CLERK	1100	20
7902	FORD	ANALYST	3000	20
*/
```
### 1.3. 해설
``` SQL
SELECT 사원번호, 사원명, 직종, 급여, 부서번호
FROM EMP
WHERE 부서번호가 20;
 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO가 20;
 
--SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
--FROM EMP
--WHERE DEPTNO == 20;
--==>> 에러발생
 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	800	20
7566	JONES	MANAGER	2975	20
7788	SCOTT	ANALYST	3000	20
7876	ADAMS	CLERK	1100	20
7902	FORD	ANALYST	3000	20
*/
```
## 📌 1. 안내
-- ○ EMP 테이블에서 부서번호가 20번과 30번 직원들의 데이터들 중
--사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.
--단, 별칭(ALIAS)을 사용한다.
### 1.2. 안내_답
``` SQL
-- 답01
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE EMPNO = 20 OR EMPNO = 30;
-- 답02
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE EMPNO IN (20,30);
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST	    3000	20
*/
```
### 1.3. 안내_해설
``` SQL
EMP 테이블에서                           -> FROM EMP  
부서번호가 20번과 30번                   -> 조건  
사원번호, 사원명, 직종명, 급여, 부서번호 -> SELECT 컬럼명

SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
FROM EMP
WHERE 부서번호가 20번과 30번;
 
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE DEPTNO가 20 DEPTNO가 30;
 
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE DEPTNO=20 || DEPTNO=30;
--==>> 에러발생
 
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST	    3000	20
*/
```
## 2. 문제
--○ EMP 테이블에서 직종이 CLERK 인 사원들의 데이터를 모두 조회한다.
### 2.2. 답
``` SQL
-- 답01
SELECT *
FROM EMP
WHERE JOB = 'CLERK';
-- 답02
SELECT *
FROM EMP
WHERE JOB IN ('CLERK');
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		    20
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	950		    30
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10
*/
```
### 2.3. 해설
``` SQL
SELECT *
FROM EMP
WHERE JOB IN ('clerk');
--==>> 조회 결과 없음
 
--※ 오라클에서... 입력된 데이터의 값 만큼은...
--  반.드.시 대소문자 구분을 한다.
```
## 3. 문제
--○ EMP 테이블의 구조와 데이터를 확인해서
--    이와 똑같은 데이터가 들어있는 테이블의 구조를 생성한다.
--    (팀별로... EMP1, EMP2, EMP3, EMP4)
--**추가 코멘트) 한 테이블에 대해 여러 처리를 하게 되면 lock 걸림
``` SQL
-- EMP 테이블 구조
EMPNO NUMBER(4)
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2)
```
### 3.2. 답
``` SQL
DESC EMP;
CREATE TABLE EMP4
( EMPNO NUMBER(4)
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2)
);
--==>> Table EMP4이(가) 생성되었습니다.

INSERT INTO EMP4 VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP4 VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP4 VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP4 VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP4 VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP4 VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP4 VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP4 VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP4 VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP4 VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP4 VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP4 VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP4 VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP4 VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
```
### 3.3. 해설
``` SQL
--1. 복사할 대상 테이블 구조 확인
DESCRIBE EMP;
DESC EMP;
/*
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)
*/
 
-- 2. 대상 테이블의 구조에 따라 새로운 테이블 생성
CREATE TABLE EMP5
( EMPNO     NUMBER(4)
, ENAME     VARCHAR2(10)
, JOB       VARCHAR2(9)
, MGR       NUMBER(4)
, HIGEDATE  DATE
, SAL       NUMBER(7,2)
, COMM      NUMBER(7,2)
, DEPTNO    NUMBER(2)
);
 
--3. 대상 테이블의 데이터 조회
SELECT *
FROM EMP;
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17	800		20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	30
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7839	KING	PRESIDENT		1981-11-17	5000		10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30
7876	ADAMS	CLERK	7788	1987-07-13	1100		20
7900	JAMES	CLERK	7698	1981-12-03	950		30
7902	FORD	ANALYST	7566	1981-12-03	3000		20
7934	MILLER	CLERK	7782	1982-01-23	1300		10
*/
 
--4. 대상 테이블의 데이터를 복사할 데이블에 입력
INSERT INTO EMP5 VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP5 VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP5 VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP5 VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP5 VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP5 VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP5 VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP5 VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP5 VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP5 VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP5 VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP5 VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP5 VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP5 VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
 
--5. 확인
SELECT *
FROM EMP5;
 
--6. 커밋
COMMIT;
--==>> 커밋 완료.
```
## 4. 문제
--○ DEPT 테이블을 복사하여 위와 같은 TBL_DEPT 테이블을 생성한다.
### 4.2. 답
``` SQL
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
```
## 5. 문제
--○ TBL_EMP 테이블을 대상으로
--    테이블에 소속된(포함된) 컬럼에 대한커멘트 데이터 입력(설정)
### 5.2. 답
``` SQL
COMMENT ON COLUMN TBL_EMP.EMPNO IS '사원번호';
```
## 6. 문제
--○ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL 인 직원의 
--    사원명, 직종명, 급여, 커미션 항목을 조회한다.
### 6.2. 답
``` SQL
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL;
```
### 6.3. 해설
``` SQL
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = NULL;
--==>> 조회 결과 없음
 
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> 에러
--      (ORA-01722: invalid number) --** 숫자형타입만 올 수 있는데 문자가 왔음
 
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = (NULL);
--==>> 조회 결과 없음
 
--※ NULL은 실제 존재하는 값이 아니기 때문에
--    일반적인 연산자를 활용하여 비교할 수 없다.
--    NULL 을 대상으로 사용할 수 없는 연산자들...
--    >=, <=, =, >, <,
--    같지 않다(3가지): !=, <>, ^=
 
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL;
--==>>
/*
--** (NULL)은 사실 나오지 않음. 시각적으로 표현해준 것
SMITH	CLERK	    800	    (NULL)
JONES	MANAGER	    2975    (NULL)	
BLAKE	MANAGER	    2850	(NULL)
CLARK	MANAGER	    2450	(NULL)
SCOTT	ANALYST	    3000	(NULL)
KING	PRESIDENT	5000	(NULL)
ADAMS	CLERK	    1100	(NULL)
JAMES	CLERK	    950	    (NULL)
FORD	ANALYST	    3000	(NULL)
MILLER	CLERK	    1300	(NULL)
*/
```
## 7. 문제
--○ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 직원들의
--    사원명, 직종명, 부서번호 항목을 조회한다.
### 7.2. 답
``` SQL
SELECT EMPNO, JOB, DEPTNO
FROM TBL_EMP
WHERE DEPTNO != 20;
    
SELECT EMPNO, JOB, DEPTNO
FROM TBL_EMP
WHERE DEPTNO <> 20;
 
SELECT EMPNO, JOB, DEPTNO
FROM TBL_EMP
WHERE DEPTNO ^= 20;
--==>>
/*
7499	SALESMAN	30
7521	SALESMAN	30
7654	SALESMAN	30
7698	MANAGER	30
7782	MANAGER	10
7839	PRESIDENT	10
7844	SALESMAN	30
7900	CLERK	30
7934	CLERK	10
*/
```

<BR>


# 페이지 20231019_01_scott.sql
## 1. 문제
--○ TBL_EMP 테이블에서 커미션이 NULL 이 아닌 직원들의  
--  사원명, 직종명, 급여, 커미션 항목을 조회한다.
### 1.2. 답
``` SQL
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/
 
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--** NOT을 앞으로 옮겨도 논리적으로 가능
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/
```
### 1.3. 해설
``` SQL
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE 커미션이 NULL이 아닌;
 
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM이 NULL이 아닌;
 
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
--WHERE COMM != NULL;
--WHERE COMM <> NULL;
WHERE COMM ^= NULL;
==>> 조회결과 없음
 
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM IS NULL;     -- && -> AND    || -> OR    ! -> NOT
 
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/
 
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--** NOT을 앞으로 옮겨도 논리적으로 가능
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/
```
## 2. 문제
--○ TBL_EMP 테이블에서 모든 사원들의                             -- (*모든사원들:  WHERE 조건이 없다는 뜻*)  
--    사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.  
--    단, 급여(SAL)는 매월 지급한다.  
--    또한, 수당(COMM)은 연 1회 지급하며, 연봉 내역에 포함된다.
### 2.2. 답
``` SQL
-- NULL 이 나오는 답
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션", (SAL*12)+COMM "급여" 
FROM TBL_EMP;
--==>> 값이 나오긴하나,  COMM 이 NULL 인 경우 값이 NULL로 나오는 문제가 도출
-- NVL 버전
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , NVL(SAL*12*COMM, SAL*12) "연봉" 
FROM TBL_EMP;
-- NVL2 버전
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , SAL*12+NVL2(COMM, COMM, 0) "연봉"
FROM TBL_EMP;
```
### 2.3. 해설
``` SQL
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션", 급여*12+연봉 
FROM TBL_EMP;
 
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션", (SAL*12)+COMM "급여" 
FROM TBL_EMP;
--==>> 값이 나오긴하나,  COMM 이 NULL 인 경우 값이 NULL로 나오는 문제가 도출
 
--○ NVL()
--첫 번째 파라미터 값이 NULL 이면, 두 번째 파라미터 값을 반환한다.
--첫 번째 파라미터 앖이 NULL 이 아니면, 그 값을 그대로 반환한다.
SELECT NULL "COL1", NVL(NULL,10) "COL2", NVL(5, 10) "COL3"
FROM DUAL;
--==>> (NULL)	10	5
 
SELECT ENAME "사원명", COMM "수당"
FROM TBL_EMP;
 
SELECT ENAME "사원명", NVL(COMM,1234) "수당"
FROM TBL_EMP;
 
 
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , SAL*12+NVL(COMM,0) "연봉" 
FROM TBL_EMP;
/*
7369	SMITH	800	    (NULL)	9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975	(NULL)	35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	(NULL)	34200
7782	CLARK	2450	(NULL)	29400
7788	SCOTT	3000	(NULL)	36000
7839	KING	5000	(NULL)	60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	(NULL)	13200
7900	JAMES	950		11400
7902	FORD	3000	(NULL)	36000
7934	MILLER	1300	(NULL)	15600
*/
 
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , NVL(SAL*12*COMM, SAL*12) "연봉" 
FROM TBL_EMP;
--○ NVL2()
--> 첫 번째 파라미터 값이 NULL 이 아닌 경우, 두 번째 파라미터 값을 반환하고
--  첫 번째 파라미터 값이 NULL 인 경우, 세 번째 파리미터 값을 반환한다.
SELECT ENAME "사원명", NVL2(COMM, '청기올려', '백기올려')"수당확인"
FROM TBL_EMP;
 
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , NVL2(COMM, SAL*12+COMM, SAL*12) "연봉"
FROM TBL_EMP;
 
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , SAL*12+NVL2(COMM, COMM, 0) "연봉"
FROM TBL_EMP;

```
## 3. 문제
--○ TBL_EMP 테이블에서 모든 사원들의  
--    사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.  
--    단, 급여(SAL)는 매월 지급한다.  
--    또한, 수당(COMM)은 연 1회 지급하며, 연봉 내역에 포함된다.  
### 3.2. 답
``` SQL
SELECT EMPNO, ENAME, SAL, COMMM
    ,COALESCE(SAL*12_COMM, SAL+12, COMM, 0) "연봉"
FROM TBL_EMP;
```
## 4. 문제  
--  ○ TBL_EMP 테이블의 데이터를 활용하여 다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.  
--    <SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다.  
--     SLLEN의 현재 연봉은 19500인데 희망 연봉은 390000이다.     
--     박또치의 현재 연봉은 10인데 희망 연봉은 20이다.>  
--    단, 레코드마다 위와 같은 내용이 한 컬럼에 모두 조회되 수 있도록 처리한다.(희망연봉은 연봉*2)
### 4.1. 답
``` SQL
SELECT ENAME || '의 현재 연봉은 ' || COALESCE(SAL*12+COMM,SAL+12,COMM,0) ||
        '인데 희망 연봉은 ' ||  COALESCE(SAL*12+COMM,SAL+12,COMM,0)*2 || '이다'
FROM TBL_EMP;
```
## 5. 문제
-- ○ TBL_EMP 테이블의 데이터를 활용하여 다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.  
--    <SMITH's 입사일은 1980-12-17이다. 그리고 급여는 800이다.  
--     ALLEN's 입사일은 1981-02-20이다. 그리고 급여는 1600이다.  
--     박또치's 입사일은 2023-10-19이다. 그리고 급여는 0이다.>  
--    단, 레코드마다 위와 같은 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다.  
### 5.2. 답
``` SQL
SELECT ENAME || '''s 입사일은 ' || SYSDATE || '이다.' || '그리고 급여는 ' || NVL(SAL,0) || '이다.'
FROM TBL_EMP;
```
### 5.3. 해설
--※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)  
--    홑따옴표 두 개각 홑따옴표 하나(어퍼스트로피)를 의미한다.  
--    홑따옴표 하나(<'>)는 문자열의 시작을 나타내고,  
--    홑따옴표 두개(<''>)는 문자열 영역 안에서 어퍼스트로피를 나타내며  
--    다시 마지막에 등장하는 홑따옴표 하나(<'>)는 문자열 영역의 종료를 의미하게 되는 것이다.  
## 6. 문제
--※ 실습을 위한 추가 데이터 입력
``` SQL
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '임하성', 'salesman', 7369, SYSDATE,20,100);
```
--○ TBL_EMP 테이블을 대상으로 영업사원(세일즈맨)의  
--    사원번호, 사원명, 직종명을 조회한다.
--    또한, 검색값이 'sALeSmAN' 인 조건으로 검색을 수행하더라도
--    해당 사원들을 조회할 수 있도록 쿼리문을 구성한다.
### 6.2. 답
``` SQL
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	현우기	SALESMAN
8001	다서니	SALESMAN
8002	임하성	salesman
*/
```
### 6.3. 해설
``` SQL
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE 직종이 'sALeSmAN';
 
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = UPPER('sALeSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	현우기	SALESMAN
8001	다서니	SALESMAN
*/
 
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = LOWER('sALeSmAN');
--==>>
/*
8002	임하성	salesman
*/
 
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = LOWER('sALeSmAN') OR JOB = UPPER('sALeSmAN');
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	현우기	SALESMAN
8001	다서니	SALESMAN
8002	임하성	salesman
*/
 
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');
--WHERE LOWER(JOB) = LOWER('sALeSmAN');     -- 가능
--WHERE INITCAP(JOB) = INITCAP('sALeSmAN'); -- 가능
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	현우기	SALESMAN
8001	다서니	SALESMAN
8002	임하성	salesman
*/
```
## 7. 문제
--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의
--    사원명, 직종명, 입사일 항목을 조회한다.
### 7.2. 답
``` SQL
SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28','YYYY-DD-MM');
--==>> MARTIN	SALESMAN	2023-10-19
```
### 7.3. 해설
``` SQL
ELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';  -- 문자타입을 날짜타입으로 자동 형변환
--                ----          -> 숫자타입
--                ----------    -> 문자타입
--    -------                   -> 날짜타입
--==>> MARTIN	SALESMAN	2023-10-19
--** 오라클의 자동형변환을 믿지않아야 한다.
 
DESC TBL_EMP;
 
--○ TO_DATE()
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28','YYYY-MM-DD');
--                        ----------                -> 숫자타입
--                       ------------               -> 문자타입
--               ---------------------------------- -> 날짜타입
--==>> MARTIN	SALESMAN	2023-10-19
```
## 8. 문제
--○ TBL_EMP 테이블에서 입사일이 1921년 9월 28일 이후(해당일 포함)
--    입사한 직원의 사원명, 직종명, 입사일 항목을 조회한다.
### 8.2. 답
``` SQL
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28','YYYY-MM-DD');
```
### 8.3. 해설
``` SQL
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28','YYYY-MM-DD');
 
--※ 오라클에서는 날짜 데이터의 크기 비교가 가능하다.  
--  오라클에서는 날자 데이터에 대한 크기 비교 시 과거보다 미래를 더 큰 값으로 간주한다.
```
## 📌 1. 안내
--○ TBL_EMP 테이블에서 입사일이 1981년 4월 2일 부터 1981년 9월 28일 사이에 입사한 직원들의  
--    사원명, 직종명, 입사일 항목을 조회한다. (해당일 포함)
### 1.2. 안내_답
``` SQL
-- AND 사용
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02','YYYY-MM-DD')
  AND HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--○ BETWEEN ⓐ AND ⓑ
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02','YYYY-MM-DD')
                   AND TO_DATE('1981-09-28','YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	1981-05-01
CLARK	MANAGER	1981-06-09
TURNER	SALESMAN	1981-09-08
*/
-----------●------------------●-------------
--        1981.4.2            1921.9.28
```
## 9. 문제
--○ TBL_SAWON 테이블에서 '이주형' 사원의 데이터를 조회한다.
### 9.2. 답
``` SQL
-- 방법1
SELECT *
FROM TBL_SAWON
WHERE SANAME = '이주형';
--==>> 1014	이주형	9904171234567	2009-11-11	2000
-- 방법2 LIKE
SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '이주형';
--==>> 1014	이주형	9904171234567	2009-11-11	2000
--** 문자열 조회시 LIKE 사용가능
```
## 10. 문제
--○ TBL_SAWON 테이블에서 성씨가 『강』씨인 사람들의
--   사원명, 주민번호, 급여 항목을 조회한다.
### 10.2. 답
``` SQL
SELECT SANAME "사원명", JUBUN "주민번호", SAL "급여";
FROM TBL_SAWON
WHERE 성씨가 '강';
 
SELECT SANAME "사원명", JUBUN "주민번호", SAL "급여"
FROM TBL_SAWON
WHERE SANAME = '강_';
--==>> 조회결과 없음
 
SELECT SANAME "사원명", JUBUN "주민번호", SAL "급여"
FROM TBL_SAWON
WHERE SANAME LIKE '강__';
--==>> 강혜성	9710171234567	3000
 
SELECT SANAME "사원명", JUBUN "주민번호", SAL "급여"
FROM TBL_SAWON
WHERE SANAME LIKE '강%';
--==>> 강혜성	9710171234567	3000
```
## 11. 문제
--○ TBL_SAWON 테이블에서 성씨가 <이>씨인 사원의
--    사원명, 주민번호, 급여 항목을 조회한다.
### 11.2. 답
``` SQL
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이%';
```
## 12. 문제
--○ TBL_SAWON 테이블에서 사원의 이름이 <영>으로 끝나는 사원의
--   사원명, 주민번호, 급여 항목을 조회한다.
### 12.2. 답
``` SQL
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%영';
--** 영 앞에 글자가 없어도 찾음. %는 없는 글자까지 포함.
--==>>
/*
박가영	9511182234567	4000
박나영	9902082234567	4000
*/
```
## 13. 문제
--○ TBL_SAWON 테이블에서 사원의 이름이 '이'라는 글자가
--   하나라도 포함되어 있다면 그 사원의
--   사원번호, 사원명, 급여 항목을 조회한다.
### 13.2. 답
``` SQL
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이%';
--==>>
/*
1005	아이유	1000
1006	이하이	1000
1007	인순이	2000
1009	이이경	1500
1011	이윤수	4000
1014	이주형	2000
*/
```
## 14. 문제
--○ TBL_SAWON 테이블에서 사원의 이름이 '이'라는 글자가
--   두 번 들어있는 사원의 사원번호, 사원명, 급여 항목을 조회한다.
### 14.1. 답
``` SQL
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이%이%';
--==>>
/*
1006	이하이	1000
1009	이이경	1500
*/
```
## 15. 문제
--○ TBL_SAWON 테이블에서 사우너의 이름이 '이'라는 글자가
--   연속으로 두 번 들어있는 사원의
--   사원번호, 사원명, 급여 항목을 조회한다.
### 15.2. 답
``` SQL
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이이%';   
--==>> 1009	이이경	1500
```
## 16. 문제
--○ TBL_SAWON 테이블에서 사원의 이름의 두 번째 글자가 '혜'인 사원의
--   사원번호, 사원명, 급여 항목을 조회한다.
### 16.2. 답
``` SQL
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
--WHERE SANAME LIKE '%혜%';  --(x) 한 글자만 있더라도 검색됨
--WHERE SANAME LIKE '_혜_';  --(△) 가능은 하지만, 3글자가 넘어가면 검색되 지 않음
WHERE SANAME LIKE '-혜%';
--==>>
/*
1001	강혜성	3000
1004	최혜인	5000
*/
```
## 17. 문제
--○ TBL_SAWON 테이블에서 성씨가 '선'씨인 사원의
--   사원번호, 주민번호, 급여 항목을 조회한다.
--** 성 칼럼이 분리되어 있지 않다면, 찾을 수 없음 (EX. 선우라는 성씨가 있음)
### 17.2. 답
``` SQL
SELECT SANO, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '선%'; --(x)
 
--※ 데이터베이스 설계 과정에서
--     성과 이름을 분리하여 처리할 업무 계획이 있다면
--     (지금 당장은 아니더라도...)
--     테이블에서 성 컬럼과 이름 컬럼은 분리하여 구성해야 한다.
```
## 18. 문제
--○ TBL_SAWON 테이블에서 여직원들의
--   사원명, 주민번호, 급여 항목을 조회한다.
### 18.2. 답
``` SQL
SELECT SANAME,JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' OR JUBUN LIKE '______4%';
 
SELECT SANAME,JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______' OR JUBUN LIKE '______4______';
--==>>
/*
박가영	9511182234567	4000
박나영	9902082234567	4000
최혜인	9708112234567	5000
아이유	0502034234567	1000
이하이	0609304234567	1000
인순이	6510102234567	2000
선우용녀	6611112234567	1300
선우선	0606064234567	2000
*/
```
## 19. 문제
--○ 데이터 입력
``` SQL
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('금시계', '순금 99.99% 함유된 최고급 시계');
 
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('은시계', '고객만족도 99.99%을 획득한 최고의 시계');
```
--○ TBL_WATCH 테이블의 BIGO(비고) 컬럼에
--   <99.99%> 라는 글자가 포함된(들어있는) 행(레코드)의
--   데이터를 조회한다.
### 19.2. 답
``` SQL
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%';
--==>>
/*
금시계	순금 99.99% 함유된 최고급 시계
은시계	고객만족도 99.99점을 획득한 최고의 시계
*/
 
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%';
 
-- ESCAPE 
--** 쓰려고 하는 % 앞에 안쓰는 문자를 넣고, ESCAPE 뒤에 '안쓰는문자' 로 작성
--** 안쓰는 문자: $, \, / 등 문법적으로 중복되지 않는 문자
 
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> 금시계	순금 99.99% 함유된 최고급 시계
 
--※ ESCAPE 로 정한 문자의 다음 한 글자를 와일드 카드에서 탈출시켜라..
--   일반적으로 사용 빈도가 낮은  특수문자(특수기호)를 사용한다.
```

<BR>


# 페이지 20231020_01_scott.sql
## 📌 1. 안내
--○ 데이터 수정(UPDATE -> TBL_DEPT) / DEPTNO 50번을 ENAME 연구부, LOC RUDRL로 수정
``` SQL
--○ 데이터 수정 전
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울
*/
```
### 1.2. 안내_답
``` SQL
--○ 데이터 수정(UPDATE -> TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME = '연구부', LOC = 'RUDRL'
WHERE DEPTNO = 50;
--==>>1 행 이(가) 업데이트되었습니다.
 
--○ 데이터 수정 후
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	연구부	RUDRL
*/
```
## 📌 2. 안내
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY DEPTNO ASC;    -- DEPTNO -> 정렬 기준 : 부서번호
                        -- ASC    -> 정렬 유형 : 오름차순(생략가능)
                        -- DESC   -> 정렬 유형 : 내림차순
/*
CLARK	10	MANAGER	2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
JONES	20	MANAGER	2975	35700
FORD	20	ANALYST	3000	36000
ADAMS	20	CLERK	1100	13200
SMITH	20	CLERK	800	9600
SCOTT	20	ANALYST	3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	950	11400
BLAKE	30	MANAGER	2850	34200
MARTIN	30	SALESMAN	1250	16400
*/
```
## 📌 3. 안내
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 연봉 DESC;
--** FROM - WHERE - GRUOP BY - HAVING - SELECT - ORDER BY
--** '연봉'이라는 별칭을 기준으로 정렬가능 -> SELECT 가 ORDER BY보다 앞에 있어서
/*
KING	10	PRESIDENT	5000	60000
FORD	20	ANALYST	    3000	36000
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	    1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
SMITH	20	CLERK	    800	    9600
*/
```
## 📌 4. 안내
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 2; -- 부서번호 오름차순
--> EMP 테이블이 갖고있는 고유한 컬럼 순서(2->ENAME)가 아니라
--  SELECT 처리 되는 두 번째 컬럼(2->DEPTNO, 부서번호)을 기준으로 정렬
--  ASC는 생략된 상태 -> 오름차순 정렬
--  오라클에서 기본 인덱스는 자바와 달리 1부터 시작
--  최종적으로... 현재 <ORDER BY 2>구문은 -> <ORDER BY DEPTNO ASC>이다.
 
--** 2 -> EMP 의 두번째가 아니라, SELECT의 두번째에 해당
--** 2 -> JAVA는 0번부터 부여했지만, ORACLE은 1번부터 부여됨
```
## 📌 5. 안내
``` SQL
SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 3, 4 DESC;
--**    -----  --
--** 오름차순  내림차순
--① 2      -> DEPTNO(부서번호) 기준 오름차순 정렬 
--② 3      -> JOB(직종)        기준 오름차순 정렬
--③ 4 DESC -> SAL(급여)        기준 내림차순 정렬
```
## 📌 6. 안내
--○ CONCAT() : 문자열 기반으로 데이터 결합을 수행하는 함수  
--              오로지 2개의 문자열만 결합시킬 수 있다.
``` SQL
SELECT ENAME || JOB "COL1"
    ,CONCAT(ENAME, JOB) "COL2"
FROM EMP;
/*
SMITHCLERK	SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
*/

SELECT '서로' || '배려하며' || '지내자' "COL1"
    , CONCAT('서로','배려하며','지내자') "COL2"
FROM DUAL;
--==>> 에러발생 (ORA-00909: invalid number of arguments)
```
## 1. 문제
--> 내부적으로 형 변환이 일어나며 결합을 수행하게 된다.  
--  CONCAT() 은 문자열과 문자열을 결합시켜주는 함수이지만  
--  내부적으로 숫자나 날짜를 문자로 변환해주는 과정이 포함되어 있다. 
### 1.2. 답
``` SQL
SELECT ENAME || JOB || EMPNO
    ,CONCAT(ENAME,CONCAT(JOB, EMPNO))
FROM EMP;
--==>>
/*
SMITHCLERK7369	SMITHCLERK7369
ALLENSALESMAN7499	ALLENSALESMAN7499
*/
```
## 2. 문제
--○ TBL_SQWON 테이블에서 성별이 남성인 사원만  
--   사원번호, 사원명, 주민번호, 급여 항목을 조회한다.  
--   단, SUBSTR() 함수를 활용하여 처리할 수 있도록 한다.  
### 2.2. 답
``` SQL
SELECT *
FROM TBL_SAWON
WHERE SUBSTR(JUBUN,7,1) IN (1,3);   --** SUBSTR는 문자타입으로 나옴 자동형변환규칙을 의지한 것(권장x)
 
SELECT *
FROM TBL_SAWON
WHERE SUBSTR(JUBUN,7,1) IN ('1','3');
/*
1001	강혜성	9710171234567	2005-01-03	3000
*/
```
## 📌 7. 안내
-- ○ LENGTH() 글자 수 / LENGTHB() 바이트 수
``` SQL
SELECT ENAME "COL1"
     , LENGTH(ENAME) "COL2"
     , LENGTHB(ENAME) "COL3"
FROM EMP;
/*
SMITH	5	5
*/
```
## 📌 8. 안내
-- 문자열 찾기 (SUBSTR())
--> 첫 번째 파라미터 값에 해당하는 문자열에서... (대상 문자열, TARGET)  
--  두 번째 파리미터 값을 통해 넘겨준 문자열이 등장하는 위치를 찾아라~!!!  
--  세 번째 파라미터 값은 찾기 시작하는 (스캔을 시작하는) 위치  
--  네 번째 파라미터 값은 몇 번째 등장하는 값을 찾을 것인지에 대한 설정 -> (1일 경우 생략 가능)  
--> 마지막 파라미터 값으 생략한 형태로 사용 -> 마지막 파라미터 -> 1
``` SQL
SELECT 'ORACLE ORAHOME BIORA' "COL1"
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "COL2"   -- 1
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "COL3"   -- 8
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "COL4"   -- 8
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2)    "COL5"   -- 8
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 3) "COL6"   -- 0
FROM DUAL;
--==>> ORACLE ORAHOME BIORA	1	8	8	8	0
```
## 📌 9. 안내
-- 문자열 바꾸기 (REVERSE())
-- 대상 문자열을 거꾸로 반환한다. (단, 한글은 제외 - 사용 불가)
``` SQL
SELECT 'ORACLE' "COL1"
      , REVERSE('ORACLE') "COL2"
      , REVERSE('오라클') "COL3"
FROM DUAL;
--==>> ORACLE	ELCARO	???
```
## 3. 문제
``` SQL
SELECT FILENO "파일번호"
     , FILENAME "파일명"
FROM TBL_FILES;
 
/*
   파일번호 파일명
        1	C:\AAA\BBB\CCC\SALES.DOC
        2	C:\AAA\PANMAE.XXLS
        3	D:\RESEARCH.PPT
        4	C:\DOCUMENTS\STUDY.HWP
        5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT
        6	C:\SHARE\F\TEST\FLOWER.PNG
        7	E:\STUDY\ORACLE\20231020_01_SCOTT.SQL
*/
```
--○ TBL_TILES 테이블을 조회하여  
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.  
---> 파일명.확장자  
### 3.2. 답
``` SQL
/* 3-내가 푼 내용1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT FILENO "파일번호"
     , SUBSTR(FILENAME
            , LENGTH(FILENAME) - INSTR(REVERSE(FILENAME), '\',1,1) + 2) 
            "뒤의 슬래쉬~마지막"
FROM TBL_FILES;
 
/* 3-다른사람이 푼 내용1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT FILENO "파일번호"
     , REVERSE(SUBSTR(REVERSE(FILENAME),1, INSTR(REVERSE(FILENAME), '\',1,1)-1)) 
                "뒤집기 3번"
FROM TBL_FILES;
 
/* 3-다른사람이 푼 내용2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT FILENO "파일번호"
      ,SUBSTR(FILENAME,INSTR(FILENAME, '\',-1,1)+1) 
      "-1 뒤에서부터 찾기"
FROM TBL_FILES;
 
/* 3-함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT FILENO "파일번호"
     , REVERSE(FILENAME)
     , SUBSTR(REVERSE(FILENAME),1, INSTR(REVERSE(FILENAME), '\',1)-1)
FROM TBL_FILES;
```
### 3.3. 해설
``` SQL
/* 3-함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT FILENO "파일번호"
     , REVERSE(FILENAME)
     , SUBSTR(REVERSE(FILENAME),1, INSTR(REVERSE(FILENAME), '\',1)-1)
FROM TBL_FILES;
 
/*
1	COD.SELAS               \CCC\BBB\AAA\:C             ->최초 『\』 등장위치 : 10 -> 1~9  추출
2	SLXX.EAMNAP             \AAA\:C                     ->최초 『\』 등장위치 : 12 -> 1~11 추출
3	TPP.HCRAESER            \:D                         ->최초 『\』 등장위치 : 13 -> 1~13 추출
4	PWH.YDUTS               \STNEMUCOD\:C               ->최초 『\』 등장위치 : 10 -> 1~10 추출
5	TXT.LQS                 \KROWEMOH\PMET\STNEMUCOD\:C ->최초 『\』 등장위치 : 8  -> 1~8  추출
6	GNP.REWOLF              \TSET\F\ERAHS\:C            ->최초 『\』 등장위치 : 10 -> 1~10 추출
7	LQS.TTOCS_10_02013202   \ELCARO\YDUTS\:E            ->최초 『\』 등장위치 : 22 -> 1~22 추출
*/
 
SELECT FILENO "파일번호"
    , FILENAME "경로포함파일명"
    , REVERSE(FILENAME) "거꾸로된경로및파일명"
    , SUBSTR(대상문자열, 1, 최초 『\』 등장위치 -1) "거꾸로된파일명"
FROM TBL_FILES;
 
SELECT FILENO "파일번호"
    , FILENAME "경로포함파일명"
    , REVERSE(FILENAME) "거꾸로된경로및파일명"
    , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\',1)-1) "거꾸로된파일명"
FROM TBL_FILES;
/*
1	C:\AAA\BBB\CCC\SALES.DOC	            COD.SELAS\CCC\BBB\AAA\:C	            COD.SELAS
2	C:\AAA\PANMAE.XXLS	                    SLXX.EAMNAP\AAA\:C	                    SLXX.EAMNAP
3	D:\RESEARCH.PPT	                        TPP.HCRAESER\:D	                        TPP.HCRAESER
4	C:\DOCUMENTS\STUDY.HWP	                PWH.YDUTS\STNEMUCOD\:C	                PWH.YDUTS
5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT	    TXT.LQS\KROWEMOH\PMET\STNEMUCOD\:C	    TXT.LQS
6	C:\SHARE\F\TEST\FLOWER.PNG	            GNP.REWOLF\TSET\F\ERAHS\:C	            GNP.REWOLF
7	E:\STUDY\ORACLE\20231020_01_SCOTT.SQL	LQS.TTOCS_10_02013202\ELCARO\YDUTS\:E	LQS.TTOCS_10_02013202
*/
 
SELECT FILENO "파일번호"
    , FILENAME "경로포함파일명"
    , REVERSE(FILENAME) "거꾸로된경로및파일명"
    , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\',1)-1) "거꾸로된파일명"
    , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\',1)-1)) "파일명"
FROM TBL_FILES;
/*
1	C:\AAA\BBB\CCC\SALES.DOC	            COD.SELAS\CCC\BBB\AAA\:C	            COD.SELAS               SALES.DOC
2	C:\AAA\PANMAE.XXLS	                    SLXX.EAMNAP\AAA\:C	                    SLXX.EAMNAP             PANMAE.XXLS
3	D:\RESEARCH.PPT	                        TPP.HCRAESER\:D	                        TPP.HCRAESER            RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP	                PWH.YDUTS\STNEMUCOD\:C	                PWH.YDUTS               STUDY.HWP
5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT	    TXT.LQS\KROWEMOH\PMET\STNEMUCOD\:C	    TXT.LQS                 SQL.TXT
6	C:\SHARE\F\TEST\FLOWER.PNG	            GNP.REWOLF\TSET\F\ERAHS\:C	            GNP.REWOLF              FLOWER.PNG
7	E:\STUDY\ORACLE\20231020_01_SCOTT.SQL	LQS.TTOCS_10_02013202\ELCARO\YDUTS\:E	LQS.TTOCS_10_02013202   20231020_01_SCOTT.SQL
*/
 
SELECT FILENO "파일번호"
    , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\',1)-1)) "파일명"
FROM TBL_FILES;
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	FLOWER.PNG
7	20231020_01_SCOTT.SQL
*/
```
## 📌 11. 안내
-- 문자열 바꾸기 (REVERSE())  
-- 대상 문자열을 거꾸로 반환한다. (단, 한글은 제외 - 사용 불가)  
``` SQL
SELECT 'ORACLE' "COL1"
      , REVERSE('ORACLE') "COL2"
      , REVERSE('오라클') "COL3"
FROM DUAL;
--==>> ORACLE	ELCARO	???
```
## 📌 12. 안내
--왼쪽부터 문자열로 채우기 (LPAD())  
--> Byte 를 확보하여 왼쪽부터 문자열로 채우는 기능을 가진 함수  
``` SQL
SELECT 'ORACLE' "COL1"
    , LPAD('ORACLE',10,'*') "COL2"
FROM DUAL;
--> ① 10Bype 공간을 확보 한다.                 -> 두 번째 파라미터 값에 의해
--  ② 확보한 공간에 'OREACLE' 문자열을 담는다  -> 첫 번째 파라미터 값에 의해
--  ③ 남아있는 Byte 공간을 왼쪽부터 세 번째 파라미터 값으로 채운다.
--  ④ 이렇게 구성된 최종 결과값을 반환한다.
--==>> ORACLE	****ORACLE
```
## 📌 13. 안내
-- 오른쪽부터 문자열로 채우기 (RPAD())  
--> Byte 를 확보하여 오른쪽부터 문자열로 채우는 기능을 가진 함수  
``` SQL
SELECT 'ORACLE' "COL1"
    , RPAD('ORACLE',10,'*') "COL2"
FROM DUAL;
--==>>ORACLE	ORACLE****
```
## 📌 14. 안내
- 문자열 특정문자 확인해 가져오기, 지우기 (LTRIN())   
``` SQL
SELECT 'ORAORAORAORACLEORACLE' "COL1"   -- 오라 오라 오라 오라클 오라클
      , LTRIM('ORAORAORAORACLEORACLE', 'ORA') "COL2" 
      , LTRIM('AAAAAAAAAORACLEORACLE', 'ORA') "COL3"
      , LTRIM('ORAORAORAoRACLEORACLE', 'ORA') "COL4" 
      , LTRIM('ORAORA ORAORACLEORACLE', 'ORA')"COL5" -- 왼쪽 공백 제거
      , LTRIM('                ORACLE', ' ')  "COL6" -- 두 번째 파라미터 생략
      , LTRIM('                ORACLE') "COL7" 
FROM DUAL;
--==>> 
/*
ORAORAORAORACLEORACLE	
CLEORACLE	
CLEORACLE	
oRACLEORACLE	 
ORAORACLEORACLE	
ORACLE	
ORACLE
*/
--**O 확인 'ORA'에 문자존재 O -> 삭제
--**R 확인 'ORA'에 문자존재 O -> 삭제
--**A 확인 'ORA'에 문자존재 O -> 삭제
--              :
--**C 확인 'ORA'에 문자존재 X -> 미삭제, 끝
```
``` SQL
SELECT LTRIM('김이신이김김이이신김김김이김이김박이김신', '김신이') "COL1"
FROM DUAL;
--==>> 박이김신
```
## 📌 15. 안내
-- 문자열 비 완성형 처리 (TRANSLATE())  
--> 첫번째 파라미터 값에 해당하는 문자열을 대상으로  
--  왼쪽부터 **연속적으로 등장**하는 두 번째 파라미터 값에서 지정한 글자와  
--  같은 글자가 등장할 경우 이를 제거한 결과값을 반환한다. **제거 후 남은 결과값 반환**  
--  단, 완성형으로 처리되지 않는다. **하나씩 하나씩 처리함**
``` SQL
--> 1 : 1로 바꿔준다,
SELECT TRANSLATE('MY ORACLE SERVER'
                ,'ABCDEFGHIJKLMNOPQRSTUVWZYZ'
                ,'abcdefghijklmnopqrstuvwzyz') "COL1"
FROM DUAL;
--==>> my oracle server
--** 첫번째 파라미터 값 M
--   -> 두번째 파라미터에서 M 찾기
--   -> 세번째 파라미터에서 같은 위치에 해당하는 m으로 변환
 
SELECT TRANSLATE('010-9322-9643'
                , '0123456789'
                , '공일이삼사오육칠팔구') "COL1"
FROM DUAL;
--==>> 공일공-구삼이이-구육사삼
```
## 📌 16. 안내
-- 바꾸기 (REPLACE())
``` SQL
SELECT REPLACE('MY ORACLE SERVER ORAHOME', 'ORA', '오라') "COL1"
FROM DUAL;
--==>> MY 오라CLE SERVER 오라HOME
```
## 📌 17. 안내
-- 반올림 (ROUND())
``` SQL
SELECT 48.678 "COL1"            -- 48.678
     , ROUND(48.678, 2) "COL2"  -- 48.68     -- 소수점 이하 둘째자리까지 표현 -> 두번째 파라미터
     --** 소수점이하 둘째자리까지 나타내라X
     --** 소수점이하 둘째자리까지 표현해라O
     , ROUND(48.674,2) "COL3"   -- 48.67
     , ROUND(48.674,1) "COL4"   -- 48.7
     , ROUND(48.684,0) "COL5"   -- 49
     , ROUND(48.684)   "COL6"   -- 49         -- 정수까지만 보여달라는 0 생략가능
     , ROUND(48.684,-1)"COL7"   -- 50
     , ROUND(48.684,-2)"COL8"   -- 0
     , ROUND(48.684,-3)"COL9"   -- 0
FROM DUAL;
--==>> 48.678	48.68	48.67	48.7	49
```
## 📌 18. 안내
-- 절삭 (TRUNC())
``` SQL
SELECT 48.678 "COL1"            -- 48.678
     , TRUNC(48.678, 2) "COL2"  -- 48.67     -- 소수점 이하 둘째자리까지 표현 -> 두번째 파라미터
     , TRUNC(48.674,2) "COL3"   -- 48.67
     , TRUNC(48.674,1) "COL4"   -- 48.6
     , TRUNC(48.684,0) "COL5"   -- 48
     , TRUNC(48.684)   "COL6"   -- 48         -- 정수까지만 보여달라는 0 생략가능
     , TRUNC(48.684,-1)"COL7"   -- 40
     , TRUNC(48.684,-2)"COL8"   -- 0
     , TRUNC(48.684,-3)"COL9"   -- 0
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0
```
## 📌 19. 안내
-- 나머지를 반환 (MOB())  -> %
``` SQL
SELECT MOD(5,2) "COL1"
FROM DUAL;
--==>> 1
```
## 📌 20. 안내
-- 제곱의 결과 반환 (POWER())
``` SQL
SELECT POWER(5,3) "COL1"
FROM DUAL;
--==>> 125
--> 5의 3승 결과값으로 반환
```
## 📌 21. 안내
-- 루트 결과값 (SQRT())
``` SQL
SELECT SQRT(2) "COL1"
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
```
## 📌 22. 안내
-- 로그 함수 (LOG())
``` SQL
SELECT LOG(10, 100) "COL1"
      , LOG(10, 20) 
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677
```
## 📌 23. 안내
-- 자연 로그 (LN())
``` SQL
SELECT LN(95) "COL1"
FROM DUAL;
--==>> 4.55387689160054083460978676511404117675
```
## 📌 24. 안내
-- 삼각함수
``` SQL
--○ 삼각함수
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
----==>> 0.8414709848078965066525023216302989996233	
--       0.5403023058681397174009366074429766037354	
--       1.55740772465490223050697480745836017308
 
-->> 각각 싸인, 코싸인, 탄젠트 결과값을 반환한다.
 
--○ 삼각함수의 역함수(범위: -1 ~ 1)
SELECT SIN(0.5), COS(0.5), TAN(0.5)
FROM DUAL;
----==>> 
/*
0.4794255386042030002732879352155713880819	
0.8775825618903727161162815826038296520119	
0.5463024898437905132551794657802853832851
*/
```
## 📌 25. 안내
-- 4.5.12.9. 서명, 부호, 특징 (SIGN())
--> 연산 결과값이 양수이면 1, 0이면 0, 음수이면 -1을 반환한다.  
--> 매출이나 수지에 관련하여 적자 및 흑자의 개념을 가질 때 종종 사용된다.
``` SQL
SELECT SIGN(5-2) "COL1"
    , SIGN(5-5) "COL2"
    , SIGN(5-6) "COL3"
FROM DUAL;
--==>> 1	0	-1
```
## 📌 26. 안내
-- 4.5.12.10. 아스키코드 값 (ASCII() ↔ CHR()/ -> 서로 대응(상응)하는 함수)
``` SQL
SELECT ASCII('A') "COL1"
       , CHR(65) "COL2"
FROM DUAL;
--==>> 65	A
-- <ASCIII()> : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
-- <CHR()>    : 매개변수로 넘겨받은 아스키코드 값으로 해당 문자를 반환한다.
```
## 📌 27. 안내
--※ 날짜 연산의 기본 단위는 일수(DAY)이다~!!! CHECK~!!!
``` SQL
SELECT SYSDATE "COL1"       -- 2023-10-20 15:40:02
     , SYSDATE + 1 "COL2"   -- 2023-10-21 15:40:02
     , SYSDATE - 2 "COL3"   -- 2023-10-18 15:40:02	
     , SYSDATE + 30 "COL4"  -- 2023-11-19 15:40:02
FROM DUAL;
```
--○ 시간 단위 연산
``` SQL
SELECT SYSDATE "COL1"           -- 2023-10-20 15:45:15
     , SYSDATE + 1/24 "COL2"    -- 2023-10-20 16:45:15
     , SYSDATE - 1/24 "COL3"    -- 2023-10-20 14:45:15
FROM DUAL;
--** 1/24 -> 1시간
```
## 4. 문제
--○ 현재시간과... 현재 시간 기준 1일 2시간 3분 4초 후를 조회한다.  
``` SQL
/*
------------------- -------------------
현재 시간           연산 후 시간
------------------- -------------------
2023-10-20 15:43:27 2023-10-21 17:46:31
*/
```
### 4.1. 답
``` SQL
-- 방법 1.
SELECT SYSDATE "현재 시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "연산 후 시간"
FROM DUAL;
--==>> 2023-10-20 16:08:11	2023-10-21 18:11:15
 
-- 방법 2.
SELECT SYSDATE "현재 시간"
     , SYSDATE + ((1*24*60*60) + (2*60*60) + (3*60) + 4)/ (24*60*60) "연산 후 시간"
FROM DUAL;
--==>> 2023-10-20 16:07:57	2023-10-21 18:11:01
```
## 📌 28. 안내
--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 수행하는 과정에서 내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다.
``` SQL
--○ 날짜 - 날짜 -> 일수
SELECT TO_DATE('2024-03-19','YYYY-MM-DD') - TO_DATE('2023-08-22', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 210
 
--○ 데이터 타입의 변환
SELECT TO_DATE('2023-10-20', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 2023-10-20 00:00:00
 
SELECT TO_DATE('2023-10-32', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러발생
--        (ORA-01847: day of month must be between 1 and last day of month)
 
SELECT TO_DATE('2023-02-29', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러 발생(ORA-01839: date not valid for month specified)
 
SELECT TO_DATE('2023-13-20', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러 발생()
```
## 📌 29. 안내
--○ ADD_MONTHS() 개월 수를 더하거나 빼주는 함수
SELECT SYSDATE "COL1"
    , ADD_MONTHS(SYSDATE, 2) "COL2"
    , ADD_MONTHS(SYSDATE, 3) "COL3"
    , ADD_MONTHS(SYSDATE, -2) "COL4"
    , ADD_MONTHS(SYSDATE, -3) "COL5"
FROM DUAL;
--==>> 
/*
2023-10-20 16:19:46 -> 현재	
2023-12-20 16:19:46	-> 2개월 후
2024-01-20 16:19:46	-> 3개월 후
2023-08-20 16:19:46	-> 2개월 전
2023-07-20 16:19:46 -> 3개월 전
*/
## 📌 30. 안내
--○ MONTHS_BETWEEN()
--> 첫 번째 인자값에서 두 번째 인자값을 뺀 개월수를 반환한다.
``` SQL
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31','YYYY-MM-DD')) "COL1"
FROM DUAL;
--==> 256.667209901433691756272401433691756272
```
--> 개월 수의 차이를 반환하는 함수  
--  결과값의 부호가 <->(음수)로 반환되었을 경우에는  
--  첫 번째 인자값에 해당하는 날짜보다  
--  두 번째 인자값에 해당하는 날짜가 <미래>라는 의미로 확인할 수 있다.  


## 5. 문제
--○ 오늘부로.. 정환이가 군대에 다시 끌려간다.  
-- 복무기간은 22개월로 한다.  
### 5.2. 답
``` SQL
-- 1. 전역 일자를 구한다.
SELECT SYSDATE "TODAY"
    , ADD_MONTHS(SYSDATE, 22) "전역일자"
FROM DUAL;
 
-- 하루 꼬박꼬박 3끼 식사를 해야 한다고 가정하면..
-- 정환이가 몇 끼를 먹어야 집에 보내줄까?
 
-- 복무기간 * 3
-- --------
-- (전역일자 - 현재일자)
-- (전역일자 - 현재일자) * 3
 
SELECT SYSDATE "TODAY"
    , ADD_MONTHS(SYSDATE, 22) "전역일자"
    , (ADD_MONTHS(SYSDATE, 22) - SYSDATE)*3 "COL1"
FROM DUAL;
--==>> 2010
```
## 6. 문제
--○ 현재 날짜 및 시간으로부터...  
--   수료일(2024-03-18 18:00:00) 까지  
--   남은 기간을... 다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다. 
/*
-------------------     -------------------    ---- ----- ---- ---
현재 시간               수료일                 일    시간   분  초
-------------------     -------------------    ---- ----- ---- ---
2023-10-20 17:09:10     2024-03-19 18:00:00     140     0   49  50
-------------------     -------------------    ---- ----- ---- ---
분 67분..X
*/
### 6.2. 답
``` SQL
/*SELECT SYSDATE "현재시간"
--     , TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') "수료일"
--     , TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE "수료일-현재"
     , TRUNC(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) "일"  
--     , MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1) "일제외나머지"
--     , MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1)*24 "시간"
     , TRUNC(MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1)*24) "시간"
--     , MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1)*24*60 "분"
     , TRUNC(MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1)*24*60) "분"
     , MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1)*24*60
        --- TRUNC(MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1)*24*60)
     "초"
     , MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1)*24*60
        --- TRUNC(MOD(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE,1)*24*60)
     "초"
FROM DUAL;*/
 
/* 5-다른사람이 푼 내용1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT SYSDATE "현재 시간"
    , TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
    , TRUNC(TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) "일"
    , TRUNC(MOD((TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE)*24,24)) "시간"
    , TRUNC(MOD((TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE)*24*60,60)) "분"
    , TRUNC(MOD((TO_DATE('2024-03-19 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE)*24*60*60,60)) "초"
FROM DUAL;
```

<BR>

# 페이지 20231023_01_scott.sql

## 1. 문제
-- <1일 2시간 3분 4초>를... <초>로 환산하면...
### 1.2. 답
``` SQL
SELECT (1*24*60*60) + (2*60*60) + (3*60) +(4) "초"
FROM DUAL;
--==>> 93784
```
## 2. 문제
-- <93784초>를... 다시 <일, 시간, 분, 초>로 환산하면...
### 2.2. 답
``` SQL
SELECT 93784
     , TRUNC(93784/60/60/24) "일"
     , TRUNC(MOD(93784/60/60,24)) "시간"
     , TRUNC(MOD(93784/60,60)) "분"
     , TRUNC(MOD(93784,60)) "초"
FROM DUAL;
--==>> 93784	1	2	3	4
```
### 2.3. 해설
``` SQL
/*
--** MOD(): 나머지
--** TRUNC(): 절삭을 처리 -> 몫
 
** 121 초 --> 초 계산
   121 / 60       -> 몫 2, 나머지 1
   TRUNC(120/60)  -> 몫 2
   MOD(121,60)    -> 나머지 1
*/
SELECT TRUNC(TRUNC(TRUNC(9378/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC(93784/60)/60),24) "시간"
     , MOD(TRUNC(93784/60),60) "분"
     , MOD(93784,60) "초"
FROM DUAL;
--==>>0	2	3	4
 
-- 수요일까지 남은 기간 확인 (단위: 초)
SELECT 남은일수 * (24*60*60)
FROM DUAL;
 
SELECT 수료일 - 현재일
FROM DUAL;
 
SELECT (수료일 - 현재일) * (24*60*60)
FROM DUAL;
 
SELECT TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE "남은일수"
FROM DUAL;
--==>> 148.350613425925925925925925925925925926
 
SELECT ((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)) "남은일수 초"
FROM DUAL;
--==>> 12817397.00000000000000000000000000000002
 
 
SELECT SYSDATE "현재 시간"
     , TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
     , TRUNC(((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60/60/24) "일"
     , TRUNC(MOD(((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60/60,24)) "시간"
     , TRUNC(MOD(((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60,60)) "분"
     , TRUNC(MOD(((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)),60)) "초"
FROM DUAL;
--==>> 2023-10-23	2024-03-19	148	8	17	13
```
## 3. 문제
--○ 각자 태어난 날짜 및 시각으로부터... 현재까지  
--   얼마만큼의 시간을 살고 있는지...  
--   다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.  
--** 수료일은 미래, 생년월일은 과거에 유의!  
/*
-------------------     -------------------    ---- ----- ---- ---
현재 시간               생년월일               일    시간   분  초
-------------------     -------------------    ---- ----- ---- ---
2023-10-23 09:41:00     1994-12-17 12:00:00     140     0   49  50
-------------------     -------------------    ---- ----- ---- ---
*/
### 3.2. 답
``` SQL
SELECT TRUNC(TRUNC(TRUNC(9378/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC(93784/60)/60),24) "시간"
     , MOD(TRUNC(93784/60),60) "분"
     , TRUNC(MOD(93784,60)) "초"
FROM DUAL;
```
### 3.3. 해설
``` SQL
SELECT SYSDATE "현재시간"
     , TO_DATE('1994-12-17 12:00:00','YYYY-MM-DD HH24-MI-SS') "생년월일"
--     , SYSDATE-TO_DATE('1994-12-17 12:00:00','YYYY-MM-DD HH24-MI-SS') "지난 일수"
--     , (SYSDATE-TO_DATE('1994-12-17 12:00:00','YYYY-MM-DD HH24-MI-SS')) * (24*60*60) "남은일수초"
     , TRUNC(TRUNC((SYSDATE-TO_DATE('1994-12-17 12:00:00','YYYY-MM-DD HH24-MI-SS')) * (24*60*60)/60)/60/24/365) "년"
     , TRUNC(TRUNC((SYSDATE-TO_DATE('1994-12-17 12:00:00','YYYY-MM-DD HH24-MI-SS')) * (24*60*60)/60)/60/24) "일"
     , TRUNC(MOD(TRUNC((SYSDATE-TO_DATE('1994-12-17 12:00:00','YYYY-MM-DD HH24-MI-SS')) * (24*60*60)/60)/60,24)) "시"
     , MOD(TRUNC((SYSDATE-TO_DATE('1994-12-17 12:00:00','YYYY-MM-DD HH24-MI-SS')) * (24*60*60)/60),60) "분"
     , TRUNC(MOD((SYSDATE-TO_DATE('1994-12-17 12:00:00','YYYY-MM-DD HH24-MI-SS')) * (24*60*60),60)) "초"
FROM DUAL;
--==>> 2023-10-23	1994-12-17	28	10536	22	13	30
```
## 4. 문제
--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.
### 4.1. 답
``` SQL
SELECT SYSDATE "현재시간"
     , SYSDATE + (1)+(2/24)+(3/(24*60))+(4/(24*60*60)) "1일2시간3분4초후"
FROM DUAL;
--==>>2023-10-23 11:20:20 
--    2023-10-24 13:22:19
```
## 5. 문제
--○ TBL_SAWON 테이블을 활용하여 다음과 같은 항목을 조회할 수 있도록 쿼리문을 구성한다.
--   <사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 
--   정년퇴직일, 근무일수, 남은일수, 급여, 보너스>
--   단, 현재나이는 만나이 적용 이전 한국나이 계산법에 따라 연산을 수행한다.
--   또한, 정년 퇴직일은 해당 직원의 나이가 한국 나이로 60세가 되는 해의
--   그 직원의 입사 월, 일로 연산을 수행한다.
--   그리고, 보너스는 1000일 이상 2000일 미만 근무한 사원은
--   그 사원의 원래 급여 기준 30% 지급, 2000일 이상 근무한 사원은
--   그 사원의 원래 급여 기준 50% 지급을 할 수 있도록 처리한다.
``` SQL
/* 
 성별 남, 여
 현재나이_ 주민번호 활용
 정년퇴직일_ 해당직원이 언제 60세가 되는지, 입사한 월,일 붙여서
 근무일수_입사날짜부터 지금까지 얼마나 근무
 남은일수 정년퇴직일까지 남은 일수
 보너스_1000일 이상 2000일 미만 근무한 사원 -> 30%
        _2000일 이상 근무 -> 50%
        
EX) 1001	강혜성	9710171234567 남성 27	2005-01-03 2038-01-03 XXXX XXXXX	3000 1500
태어나면 한살 먹고 시작
*/
```
### 5.2. 답
``` SQL
/* 5-내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT SANO "사원번호" , SANAME "사원명", JUBUN "주민번호"
     , DECODE(SUBSTR(JUBUN,7,1),'2','여성','4','여성','남성') "성별"
--     , CASE WHEN SUBSTR(JUBUN,7,1) = '2' OR SUBSTR(JUBUN,7,1) = '4' THEN '여성'
--            WHEN SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3' THEN '남성' 
--            ELSE '제3의 성'
--       END"성별"
--     , DECODE(SUBSTR(JUBUN,7,1),'3',2000,'4',2000,1900) "주번7번째 글자에 따라 달라짐"
     , TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) - TO_NUMBER(DECODE(SUBSTR(JUBUN,7,1),'3',2000,'4',2000,1900)) - TO_NUMBER(SUBSTR(JUBUN,1,2)) +1 "현재나이"
     , HIREDATE "입사일"
     , TO_DATE(TO_CHAR(DECODE(SUBSTR(JUBUN,7,1),'3','20','4','20','19')||SUBSTR(JUBUN,1,2)||SUBSTR(HIREDATE,6,2)||SUBSTR(HIREDATE,9,2)), 'YYYY-MM-DD') + TO_YMINTERVAL('59-00') "정년퇴직일"
     , TRUNC(SYSDATE - HIREDATE) "근무일수"
     , TRUNC(TO_DATE(TO_CHAR(DECODE(SUBSTR(JUBUN,7,1),'3','20','4','20','19')||SUBSTR(JUBUN,1,2)||SUBSTR(HIREDATE,6,2)||SUBSTR(HIREDATE,9,2)), 'YYYY-MM-DD') + TO_YMINTERVAL('59-00') - SYSDATE) "남은일수"
     , SAL "급여"
     , CASE WHEN TRUNC(SYSDATE - HIREDATE) >= 1000 AND TRUNC(SYSDATE - HIREDATE) <=2000 THEN SAL*0.3
            WHEN TRUNC(SYSDATE - HIREDATE) >= 2000 THEN SAL*0.5
            ELSE 0
            END "보너스"
FROM TBL_SAWON;
```
### 5.3. 해설
``` SQL
--   <사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 정년퇴직일, 근무일수, 남은일수, 급여, 보너스>
--사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 급여 먼저 처리
 
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN THEN ELSE END "성별"
FROM TBL_SAWON;
 
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN 주민번호 7번째 자리 1개가 '1' 또는 '3' THEN '남성'
            WHEN 주민번호 7번째 자리 1개가 '2' 또는 '4' THEN '여성'
            ELSE '성별확인불가' 
       END "성별"
FROM TBL_SAWON;
 
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3' THEN '남성'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여성'
            ELSE '성별확인불가' 
       END "성별"
FROM TBL_SAWON;
 
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3' THEN '남성'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여성'
            ELSE '성별확인불가' 
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)
     , CASE WHEN 1900년대 생이라면 THEN 현재년도 - (주민번호앞 두자리+1899) 
            WHEN 2000년대 생이라면 THEN 현재년도 - (주민번호앞 두자리+1999) 
            ELSE '나이확인불가'
       END "현재나이"
FROM TBL_SAWON;
 
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3' THEN '남성'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여성'
            ELSE '성별확인불가' 
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)
     , CASE WHEN 주민번호 SUBSTR(JUBUN,7,1) IN ('1', '2') 
            THEN 현재년도 - (주민번호앞 두자리+1899)
            WHEN 주민번호 SUBSTR(JUBUN,7,1)     
     , CASE WHEN 주민번호 SUBSTR(JUBUN,7,1) IN ('1', '2') 
            THEN 현재년도 - (주민번호앞 두자리+1999) 
            ELSE '나이확인불가'
       END "현재나이"
FROM TBL_SAWON;
 
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3' THEN '남성'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여성'
            ELSE '성별확인불가' 
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899) --** 1899인 이유(+1 해줄예정이기 때문)
            WHEN SUBSTR(JUBUN,7,1) IN ('3', '4')     
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999) --** 1999인 이유(+1 해줄예정이기 때문)
--            ELSE '나이확인불가'
            ELSE -1
       END "현재나이"
FROM TBL_SAWON;
 
-->> 진행을 위해 잠시 설명
 
SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM,0) "연봉", 연봉*2 "연봉두배" --** ORDER BY절은 가능, SELECT의 다음에 파싱되기때문에 가능
FROM EMP;
--==>> 에러 발생(ORA-00904: "연봉": invalid identifier)
 
 
--** 서브쿼리 -> 인라인 뷰
SELECT 사원번호, 사원명, 급여, 수당, 연봉*2 "연봉두배"
FROM
(
    --** 뷰(VIEW)
    SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "수당", SAL*12+NVL(COMM,0) "연봉"
    FROM EMP
);
--** FROM 안에 가상 테이블(뷰)를 만들어두고 SELECT문에서 선언된 이름(EX. "연봉")으로 접근가능,
--** 단, EMPNO 등 이미 선언된 이름으로는 접근 불가능
 
SELECT EMPNO, 사원명, 급여, 수당, 연봉*2 "연봉두배"
FROM
(
    SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "수당", SAL*12NVL(COMM,0) "연봉"
    FROM EMP
);
--==>> 에러발생(ORA-00904: "EMPNO": invalid identifier)
 
 
--○ SYS로 접속하여 SCOTT 계정에 CREATE VIEW 권한을 부여한 후 다시 실행
CREATE VIEW VIEW_EMP
AS
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "수당", SAL*12+NVL(COMM,0) "연봉"
FROM EMP;
--==>> View VIEW_EMP이(가) 생성되었습니다.
 
SELECT *
FROM VIEW_EMP;
 
--** VIEW를 잘못만들었을 때,
--** CREATE OR REPLACE VIEW: VIEW에만 존재, 없다면 만들고 있다면 덮어쓰기 해줘
CREATE OR REPLACE VIEW VIEW_EMP
AS
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "수당", SAL*12+NVL(COMM,0) "연봉"
FROM EMP;
 
SELECT 사원번호, 사원명, 연봉
FROM VIEW_EMP;
 
-->> 이어서 진행
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    -- 정년퇴직일
    -- 정년퇴직년도 -> 해당 직원의 나이가 한국나이로 60세가 되는 해
    -- 현재 나이가... 57세... 3년 후        2023 -> 2026
    -- 현재 나이가... 57세... 32년 후       2023 -> 2055
    -- ADD_MONTHS(SYSDATE, 남은년수*12)
    --                     --------
    --                     60 - 현재나이
    -- ADD_MONTHS(SYSDATE, (60-현재나이)*12) -> 특정날짜
    -- TO_CHAR('특정날짜', 'YYYY')           -> 정년퇴직 년도만 추출
    -- TO_CHAR('입사일', 'MM-DD')            -> 입사월일만 추출
    -- TO_CHAR('특정날짜', 'YYYY') || '-' || TO_CHAR('입사일','MM-DD') -> 정년퇴직일
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    -- 근무일수
    -- 근무일수 = 현재일 - 입사일
    , TRUNC(SYSDATE - T.입사일) "근무일수"    --**여기에서 HIREDATE 하면 안됨(서브쿼리 뷰에서 이미 정의됨)
    -- 남은일수
    -- 남은일수 = 정년퇴직일 - 현재일
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    -- 급여
    , T.급여
    -- 보너스
    -- 보너스는 근무일수가 1000일 이상 2000일 미만 -> 급여의 30%
    --          근무일수가 2000일 이상             -> 급여의 50%
    -- 나머지...(근무일수 1000일 미만)             -> 0
    ------------------------------------------------------------------------------
    -- 보너스는 근무일수가 2000일 이상             -> 급여*0.3
    --          근무일수가 1000일 이상             -> 급여*0.5
    -- 나머지...(근무일수 1000일 미만)             -> 0
    , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여*0.5
           WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여*0.3
           ELSE 0 
      END "보너스"
FROM (
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3' THEN '남성'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여성'
                ELSE '성별확인불가' 
           END "성별"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899) --** 1899인 이유(+1 해줄예정이기 때문)
                WHEN SUBSTR(JUBUN,7,1) IN ('3', '4')     
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999) --** 1999인 이유(+1 해줄예정이기 때문)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;
/*
1001	강혜성	9710171234567	남성	27	2005-01-03	2056-01-03	6867	11759	3000	1500
1002	박가영	9511182234567	여성	29	1999-11-23	2054-11-23	8735	11353	4000	2000
1003	박나영	9902082234567	여성	25	2006-08-10	2058-08-10	6283	12709	4000	2000
1004	최혜인	9708112234567	여성	27	2010-05-06	2056-05-06	4918	11883	5000	2500
1005	아이유	0502034234567	여성	19	2015-10-19	2064-10-19	2926	14971	1000	500
1006	이하이	0609304234567	여성	18	2012-06-17	2065-06-17	4145	15212	1000	500
1007	인순이	6510102234567	여성	59	1999-08-22	2024-08-22	8828	303	2000	1000
1008	선동열	6909101234567	남성	55	1998-01-10	2028-01-10	9417	1539	2000	1000
1009	이이경	0505053234567	남성	19	2011-05-06	2064-05-06	4553	14805	1500	750
1010	선우용녀	6611112234567	여성	58	2000-01-16	2025-01-16	8681	450	1300	650
1011	이윤수	9501061234567	남성	29	2009-09-19	2054-09-19	5147	11288	4000	2000
1012	선우선	0606064234567	여성	18	2011-11-11	2065-11-11	4364	15359	2000	1000
1013	남진	6511111234567	남성	59	1999-11-11	2024-11-11	8747	384	2000	1000
1014	이주형	9904171234567	남성	25	2009-11-11	2058-11-11	5094	12802	2000	1000
1015	남궁민	0202023234567	남성	22	2010-10-10	2061-10-10	4761	13866	2300	1150
*/
 
--** 주석 제거 버전
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    , TRUNC(SYSDATE - T.입사일) "근무일수"
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    , T.급여
    , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여*0.5
           WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여*0.3
           ELSE 0 
      END "보너스"
FROM (
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3' THEN '남성'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여성'
                ELSE '성별확인불가' 
           END "성별"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899) --** 1899인 이유(+1 해줄예정이기 때문)
                WHEN SUBSTR(JUBUN,7,1) IN ('3', '4')     
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999) --** 1999인 이유(+1 해줄예정이기 때문)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;
```
``` SQL
-- 위에서 처리한 내용을 기반으로...
-- 특정 근무일수의 사원을 확인해야 한다거나..
-- 특정 보너스 금액을 받는 사원을 확인해야 할 경우가 발생할 수 있다.
-- (즉, 추가적인 조회 조건이 발생하거나, 업무가 파생되는 경우)
-- 이와 같은 경우.. 해당 쿼리문을 다시 구성해야 하는 번거로움을 줄일 수 있도록 
-- 뷰(VIEW)를 만들어 저장해 둘 수있다.
 
CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    , TRUNC(SYSDATE - T.입사일) "근무일수"
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    , T.급여
    , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여*0.5
           WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여*0.3
           ELSE 0 
      END "보너스"
FROM (
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3' THEN '남성'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여성'
                ELSE '성별확인불가' 
           END "성별"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)
                WHEN SUBSTR(JUBUN,7,1) IN ('3', '4')     
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON이(가) 생성되었습니다.
```
## 6. 문제
--○ 서브쿼리를 활용하여  
--   TBL_SAWON 테이블을 대상으로 다음과 같이 조회할 수 있도록 한다.  
``` SQL
/*
--------------------------------------------
사원명 성별 현재나이 급여 나이보너스
--------------------------------------------
*/
```
--VIEW_SAWON을 이용하는 것이 아님.  
--나이보너스는 현재 나이가 40 이상이면 급여의 70%  
--30세 이상 40세 미만이면 급여의 50%  
--20세 이상 30세 미만이면 급여의 30%로 한다.  
--또한 , 이렇게 완성된 조회 구문을 통해  
--VIEW_SAWON2라는 이름의 뷰를 생성할 수 있도록 한다.  
### 6.2. 답
``` SQL
CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.사원명, T.성별, T.현재나이, T.급여
      , CASE WHEN T.현재나이>=40 THEN T.급여*0.7
             WHEN T.현재나이>=30 THEN T.급여*0.5
             WHEN T.현재나이>=20 THEN T.급여*0.3
             ELSE 0
        END "나이보너스"
FROM(
    SELECT SANAME "사원명"
         , DECODE(SUBSTR(JUBUN,7,1),'2','여자','4','여자','남자') "성별"
         , EXTRACT(YEAR FROM SYSDATE)  - DECODE(SUBSTR(JUBUN,7,1),'1',1900,'2',1900,2000 ) -SUBSTR(JUBUN,1,2) + 1 "현재나이" 
         , SAL "급여"
    FROM TBL_SAWON
) T;
```
### 6.3. 해설
``` SQL
/* 5-함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT SANAME "사원명"
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
            ELSE '성별확인불가'
       END "성별"
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') 
            THEN 현재년도 - (주민등록번호앞두자리 + 1899) 
            WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
            THEN 현재년도 - (주민등록번호앞두자리 + 1999) 
            ELSE -1
       END "현재나이"
FROM TBL_SAWON;
 
SELECT SANAME "사원명"
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
            ELSE '성별확인불가'
       END "성별"
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
            WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) 
            ELSE -1
       END "현재나이"
     , SAL "급여"
FROM TBL_SAWON;
 
SELECT T.*
        , CASE WHEN T.현재나이 >= 40 THEN T.급여*0.7 
               WHEN T.현재나이 >= 30 THEN T.급여*0.5
               WHEN T.현재나이 >= 20 THEN T.급여*0.3
               ELSE 0
          END "나이보너스"
FROM
(
    SELECT SANAME "사원명"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
                ELSE '성별확인불가'
           END "성별"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
                WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) 
                ELSE -1
           END "현재나이"
         , SAL "급여"
    FROM TBL_SAWON
) T;
--==>>
/*
강혜성	남자	27	3000	900
박가영	여자	29	4000	1200
박나영	여자	25	4000	1200
최혜인	여자	27	5000	1500
아이유	여자	19	1000	0
이하이	여자	18	1000	0
인순이	여자	59	2000	1400
선동열	남자	55	2000	1400
이이경	남자	19	1500	0
선우용녀	여자	58	1300	910
이윤수	남자	29	4000	1200
선우선	여자	18	2000	0
남진	남자	59	2000	1400
이주형	남자	25	2000	600
남궁민	남자	22	2300	690
*/
```

<BR>


# 페이지 20231024_01_scott.sql
## 1. 문제
--○ EMP 테이블의 사원 데이터를  
--     사원명, 부서번호, 연봉, 부서내연봉순위, 전체연봉순위 항목으로 조회한다.
### 1.2. 답
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC) "부서내연봉순위"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "전체연봉순위"
FROM EMP;
 
SELECT T.*
     , RANK() OVER(PARTITION BY T."부서번호" ORDER BY T."연봉" DESC) "부서내연봉순위"
     , RANK() OVER(ORDER BY T."연봉" DESC) "전체연봉순위"
FROM
(
     SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
     FROM EMP
) T;
 
/*
KING	10	60000	1	1
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
BLAKE	30	34200	1	5
CLARK	10	29400	2	6
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
MARTIN	30	16400	4	9
MILLER	10	15600	3	10
WARD	30	15500	5	11
ADAMS	20	13200	4	12
JAMES	30	11400	6	13
SMITH	20	9600	5	14
*/
```
## 2. 문제
--○ EMP 테이블에서 전체연봉순위가 1등부터 5등까지만..  
--   사원명, 부서번호, 연봉, 전체연봉순위 항목으로 조회한다.
### 2.2. 답
``` SQL
SELECT T.*
FROM(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
         , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "전체연봉순위"
    FROM EMP
) T
WHERE T."전체연봉순위" BETWEEN 1 AND 5;
 
/* 2-함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
     , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "전체연봉순위"
FROM EMP
WHERE 전체연봉순위 1등부터 5등까지;
 
SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
     , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "전체연봉순위"
FROM EMP
WHERE RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) <= 5;
--==>> 에러발생(ORA-30483: window  functions are not allowed here)
 
--※ 위의 내용은 RANK() OVER() 함수를 WHERE 조건절에서 사용한 경우이며...
--   이 함수는 WHERE 조건절에서 사용할 수 없기 때문에 발생하는 에러이다.
--   이 경우, 우리는 INLINE VIEW 를 활용해서 풀이해야 한다.
 
SELECT T.*
FROM
(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
         , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "전체연봉순위"
    FROM EMP
) T
WHERE T."전체연봉순위" <= 5;
```
## 3. 문제
``` SQL
/*
10	        8750
20	        10875
30	        9400
모든부서	29025
*/
```
-- EMP 테이블을 대상으로 위와 같이 조회되도록 쿼리문을 구성한다.
### 3.2. 답
``` SQL
/* 3- 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT CASE WHEN DEPTNO IS NULL THEN '모든부서'
            ELSE TO_CHAR(DEPTNO)
       END
     , SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
 
SELECT NVL(TO_CHAR(DEPTNO),'모든부서') "부서번호"
     , SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
```
### 3.3. 해설
``` SQL
/* 3-함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'모든부서') "부서번호"
     , SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
 
SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'모든부서') "부서번호"
     , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
모든부서	8700
모든부서	37725
*/
```
## 4. 문제
``` SQL
/*
부서번호	급여합
10	     8750
20	     10875
30	     9400
인턴	 8700
모든부서 37725
*/
```
-- 이와 같이 조회되도록 쿼리문을 구성한다.
### 4.1. 답
``` SQL
SELECT CASE WHEN GROUPING(DEPTNO) = 0 AND DEPTNO IS NOT NULL THEN TO_CHAR(DEPTNO)
            WHEN GROUPING(DEPTNO) = 0 AND DEPTNO IS NULL THEN '인턴'
            WHEN GROUPING(DEPTNO) = 1 THEN '모든부서'
            ELSE '-1'
       END "부서번호"
     , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
 
SELECT NVL(TO_CHAR(DEPTNO), CASE GROUPING(DEPTNO) WHEN 0 THEN '단일부서' ELSE '모든부서' END) "부서기호" 
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
```
### 4.3. 해설
``` SQL
--※힌트
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN '단일부서' ELSE '모든부서' END "부서기호"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
단일부서	8750
단일부서	10875
단일부서	9400
단일부서	8700
모든부서	37725
*/
 
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN DEPTNO ELSE '모든부서' END "부서기호"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> 에러 발생(ORA-00932: inconsistent datatypes: expected NUMBER got CHAR)
 
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN TO_CHAR(DEPTNO) ELSE '모든부서' END "부서기호"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
	8700
모든부서	37725
*/
 
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'인턴') ELSE '모든부서' END "부서기호"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
인턴	8700
모든부서	37725
*/
```
## 5. 문제
--○ TBL_SAWON 테이블을 대상으로  
--   다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
``` SQL
/*
성별       급여합
-------  ---------
남         XXXX
여        XXXXX
모든사원 XXXXXX
*/
```
### 5.2. 답
``` SQL
SELECT NVL(T.성별,'모든사원') "성별", SUM(T.급여) "급여합"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여'
                ELSE '제3의 성'
           END "성별"
         , SAL "급여"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.성별);
 
SELECT CASE GROUPING(T.성별) WHEN 0 THEN T.성별
            ELSE '모든사원'   
       END "성별"
     , SUM(T.급여) "급여합"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여'
                ELSE '제3의 성'
           END "성별"
         , SAL "급여"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.성별);
```
## 6. 문제
--○ TBL_SAWON 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
``` SQL   
/*
연령대     인원수
10          X
20          X
50          X
전체        X
*/
```
### 6.2. 답
``` SQL
오늘 년도 - 생년월일 = 현재나이
SELECT NVL(TO_CHAR(T.연령),'전체') "연령대" , COUNT(T.연령) "인원수"
FROM(
    SELECT TRUNC(EXTRACT(YEAR FROM SYSDATE) - DECODE(SUBSTR(JUBUN,7,1),'3',2000,'4',2000,'1',1900,'2',1900,0) - SUBSTR(JUBUN,1,2) +1,-1) "연령"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.연령);
```
### 6.3. 해설
``` SQL
-- 방법1. -> INLINE VIEW 를 두 번 중첩
SELECT NVL(TO_CHAR(T2.연령대),'전체') "연령대" , COUNT(T2.연령대) "인원수"
FROM
(
    -- 연령대
    SELECT CASE WHEN T1.나이 >= 50 THEN 50
                WHEN T1.나이 >= 40 THEN 40
                WHEN T1.나이 >= 30 THEN 30
                WHEN T1.나이 >= 20 THEN 20
                WHEN T1.나이 >= 10 THEN 10
                ELSE 0
           END "연령대"
    FROM
    (
        -- 나이
        SELECT CASE WHEN SUBSTR(JUBUN, 7,1) IN ('1','2')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899)
            WHEN SUBSTR(JUBUN, 7,1) IN ('3','4')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
            ELSE -1
        END "나이"
        FROM TBL_SAWON
    ) T1
) T2
GROUP BY ROLLUP(T2.연령대);
 
-- 방법2. -> INLINE VIEW 를 한 번만 사용
SELECT CASE GROUPING(T.연령대) WHEN 0 THEN TO_CHAR(T.연령대) 
                               ELSE '전체'
       END "연령대2"
      ,COUNT(*) "인원수"
FROM
(
    SELECT TRUNC(CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899)
                WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
                ELSE -1
           END,-1) "연령대"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.연령대);
```
## 📌 1. 안내
``` SQL
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '전체부서'
      END "부서번호"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '전체직종'
     END "직종"
     , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        전체직종	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        전체직종	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        전체직종	9400
인턴	    CLERK	    3500
인턴	    SALESMAN	5200
인턴	    전체직종	8700
전체부서	전체직종	37725
 
*/
 
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '전체부서'
      END "부서번호"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '전체직종'
     END "직종"
     , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
 
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        전체직종	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        전체직종	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        전체직종	9400
인턴	    CLERK	    3500
인턴	    SALESMAN	5200
인턴	    전체직종	8700
전체부서	ANALYST	    6000
전체부서	CLERK	    7650
전체부서	MANAGER	    8275
전체부서	PRESIDENT	5000
전체부서	SALESMAN	10800
전체부서	전체직종	37725
*/
 
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '전체부서'
      END "부서번호"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '전체직종'
     END "직종"
     , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())
ORDER BY 1,2;
--==>> CUBE()를 사용한 결과와 같은 결과 반환
 
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '전체부서'
      END "부서번호"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '전체직종'
     END "직종"
     , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())
ORDER BY 1,2;
--==>> RULLUP() 를 사용한 결과와 같은 결과 반환
```
## 7. 문제
--○ TBL_EMP 테이블을 대상으로 입사년도별 인원수를 조회한다.
### 7.2. 답
``` SQL
SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도", COUNT(*) "인원"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE);
/*
1982	1
2023	5
1987	2
1980	1
1981	10
*/
```
### 7.3. 해설
``` SQL
SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
 
SELECT TO_CHAR(HIREDATE, 'YYYY') "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY')
ORDER BY 1;
 
SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY')
ORDER BY 1;
--==>> 에러발생: GROUP BY와 SELECT의 형을 맞춰야함
 
SELECT TO_CHAR(HIREDATE, 'YYYY') "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
--==>> 에러발생(ORA-00979: not a GROUP BY expression)
 
SELECT TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY')) "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
--==>> 에러발생(ORA-00979: not a GROUP BY expression)
 
SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0
            THEN TO_CHAR(HIREDATE, 'YYYY')
            ELSE '전체'
        END "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY') --> '전체'를 출력해야 하기 때문에 , EXTRACT(YEAR FROM HIREDATE) 사용x
ORDER BY 1;
```

<BR>

# 페이지 20231025_01_scott.sql
## 1. 문제
--○ EMP 테이블에서 부서번호가 20, 30인 부서를 대상으로  
--   부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다.
### 1.2. 답
``` SQL
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE 부서번호가 20, 30
GROUP BY 부서번호;
 
 
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
*/
-- 부서번호 30은 10000보다 적고, 부서번호 20은 10000보다 많음을 알 수 있음
 
 
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR
AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> 에러 발생
--      (ORA-00934: group function is not allowed here)
 
-- 그룹으로 묶였기 때문에 [DEPTNO IN (20, 30)] 을 일반조건으로 제시할 수 없다
 
 
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;    -- 그룹에 대한 조건
--==>> 30	9400
-- SELECT 문의 PARSING 순서를 유의하면서 HAVING 사용하기
 
 
 
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000
AND DEPTNO IN (20, 30);
```
### 1.3. 해설
``` SQL
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
 
SELECT *
FROM EMP
WHERE DEPTNO IN (20, 30);
-- EMP 테이블 전체를 1차로 메모리에 퍼올림 + 뒷부분 실행 (VS) WHERE절이 있을 경우, 테이블에서 WHERE 절까지 1차로 메모리에 퍼올림 + 뒷부분 실행
-- 쿼리문의 효율성이 극명하게 다름. 두 번째의 방식으로 쿼리문을 구성하는 것이 바람직함
```
## 2. 문제
--○ EMP 테이블을 대상으로  
--   사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다.  
--   단, RANK() 함수를 사용하지 않고, 서브상관쿼리를 사용할 수 있도록 한다.  
### 2.2. 답
``` SQL
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL> 800;             --SMITH 의 급여
--==>> 14                   --SMITH 의 급여 등수(-> 전체급여등수)
 
 
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800             --SMITH 의 급여
  AND DEPTNO = 20;          --SMITH 의 부서번호
--==>> 5                    --SMITH 의 급여 등수(-> 부서내급여등수)
 
 
 
 
SELECT ENAME "사원명", SAL "급여", DEPTNO "부서번호", (1) "부서내급여등수", (1) "전체급여등수"
FROM EMP;
 
SELECT ENAME "사원명", SAL "급여", DEPTNO "부서번호"
    , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > 800
        AND DEPTNO = 20;) "부서내급여등수"
    , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL> 800;) "전체급여등수"
FROM EMP;
 
--> SMITH 씨에 관한 쿼리구문
 
 
SELECT ENAME "사원명", SAL "급여", DEPTNO "부서번호", (1) "부서내급여등수", (1) "전체급여등수"
FROM EMP;
 
SELECT ENAME "사원명", SAL "급여", DEPTNO "부서번호"
    , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL
        AND DEPTNO = E.DEPTNO) "부서내급여등수"
    , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL> E.SAL) "전체급여등수"
FROM EMP E
ORDER BY 3, 5;
--==>>
/*
KING	5000	10	1	1
CLARK	2450	10	2	6
MILLER	1300	10	3	9
SCOTT	3000	20	1	2
FORD	3000	20	1	2
JONES	2975	20	3	4
ADAMS	1100	20	4	12
SMITH	800	    20	5	14
BLAKE	2850	30	1	5
ALLEN	1600	30	2	7
TURNER	1500	30	3	8
MARTIN	1250	30	4	10
WARD	1250	30	4	10
JAMES	950	    30	6	13
*/
```
## 3. 문제
--○ EMP 테이블을 대상으로 입사한 사원의 수가 가장 많았을 때의  
--   입사년월과 인원수를 조회할 수 있도록 쿼리문을 구성한다.  
``` SQL
/*
----------- ---------
입사년월    인원수
----------- ---------
1981-02         2
1981-09         2
1981-12         2
1987-07         2
----------- ---------
*/
```
### 3.2. 답
``` SQL
SELECT ENAME , HIREDATE
FROM EMP
ORDER BY 2;
 
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
        , COUNT(*) "인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
 
/*
1981-05	1
1981-12	2
1982-01	1
1981-09	2
1981-02	2
1981-11	1
1980-12	1
1981-04	1
1987-07	2
1981-06	1
*/
 
-- 방법1)
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
        , COUNT(*) "인원수"
FROM EMP
WHERE COUNT(*) = 2
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> 에러 발생(ORA-00934: group function is not allowed here)
-- WHERE 절에 COUNT 불가능 해서 에러 발생한다.
 
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
        , COUNT(*) "인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 2;
--==>> 
 
/*
1981-12	2
1981-09	2
1981-02	2
1987-07	2
*/
 
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (입사년월 기준 최대 인원);
-- 기존에는 2였던 값을 우리가 직접 넣어주는 것이 아니라
-- 오라클에서 알아서 찾게끔 구성해야 한다.
 
-- 입사년월 기준 최대 인원
SELECT COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
/*
1
2
1
2
2
1
1
1
2
1
*/
 
-- 입사년월 기준 최대 인원수
SELECT MAX(COUNT(*))
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
 
 
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                    FROM EMP
                    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
 
--(입사년월 기준 최대 인원) 을 하고 바꿔준다.(딸깍!)
 
-- 방법2)
SELECT TO_CHAR(HIREDATE,'YYYY-MM') "입사년월"
        , COUNT(*) "인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
 
SELECT T1.입사년월, T1.인원수
FROM
(
    SELECT TO_CHAR(HIREDATE,'YYYY-MM') "입사년월"
            , COUNT(*) "인원수"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) T1
WHERE T1.인원수 = (2);
 
--(2) 자리를 바꿀 수 있도록 코드 짜기
SELECT T1.입사년월, T1.인원수
FROM
(
    SELECT TO_CHAR(HIREDATE,'YYYY-MM') "입사년월"
            , COUNT(*) "인원수"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) T1
WHERE T1.인원수 = (SELECT MAX(T2.인원수)
                    FROM
                    (
                        SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
                            ,COUNT(*) "인원수"
                        FROM EMP
                        GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
                    )T2
                  )
ORDER BY 1;
/*
1981-02	2
1981-09	2
1981-12	2
1987-07	2
*/
 
--방법3)
SELECT T1.입사년월, T1.인원수
FROM
(
    SELECT TO_CHAR(HIREDATE,'YYYY-MM') "입사년월"
            , COUNT(*) "인원수"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) T1
WHERE T1.인원수 = (SELECT MAX(COUNT(*))
                    FROM EMP
                    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
                  )
ORDER BY 1;
```
### 3.3. 해설
``` SQL

```
## 4. 문제
--
### 4.1. 답
``` SQL

```
### 4.3. 해설
``` SQL

```
## 5. 문제
--
### 5.2. 답
``` SQL

```
### 5.3. 해설
``` SQL

```
## 6. 문제
--
### 6.2. 답
``` SQL

```
### 6.3. 해설
``` SQL

```
## 7. 문제
--
### 7.2. 답
``` SQL

```
### 7.3. 해설
``` SQL

```



<br><br>
*******
<br>

<BR>

# 작성샘플

<BR>

# 페이지 20231018_02_scott.sql
## 📌 1. 안내

## 1. 문제
--
### 1.2. 답
``` SQL

```
### 1.3. 해설
``` SQL

```
## 2. 문제
--
### 2.2. 답
``` SQL

```
### 2.3. 해설
``` SQL

```
## 3. 문제
--
### 3.2. 답
``` SQL

```
### 3.3. 해설
``` SQL

```
## 4. 문제
--
### 4.1. 답
``` SQL

```
### 4.3. 해설
``` SQL

```
## 5. 문제
--
### 5.2. 답
``` SQL

```
### 5.3. 해설
``` SQL

```
## 6. 문제
--
### 6.2. 답
``` SQL

```
### 6.3. 해설
``` SQL

```
## 7. 문제
--
### 7.2. 답
``` SQL

```
### 7.3. 해설
``` SQL

```
## 10. 문제
--
### 10.2. 답
``` SQL

```
### 10.3. 해설
``` SQL

```
## 11. 문제
--
### 11.2. 답
``` SQL

```
### 11.3. 해설
``` SQL

```
## 12. 문제
--
### 12.2. 답
``` SQL

```
### 12.3. 해설
``` SQL

```
## 13. 문제
--
### 13.2. 답
``` SQL

```
### 13.3. 해설
``` SQL

```
## 14. 문제
--
### 14.1. 답
``` SQL

```
### 14.3. 해설
``` SQL

```
## 15. 문제
--
### 15.2. 답
``` SQL

```
### 15.3. 해설
``` SQL

```
## 16. 문제
--
### 16.2. 답
``` SQL

```
### 16.3. 해설
``` SQL

```
## 17. 문제
--
### 17.2. 답
``` SQL

```
### 17.3. 해설
``` SQL

```
### 하단 설명
>-- *하단설명내용*

### 표
| 제목1 | 제목2 | 제목3 |
| :--- | :---: | ---: |
| 열1 | 열2 | 열3 |
| 열4 | 열5 | 열6 |

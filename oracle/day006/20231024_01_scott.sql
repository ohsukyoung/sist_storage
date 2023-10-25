SELECT USER
FROM DUAL;
--==>> SCOTT

--------------------------------------------------------------------------------
--○ RANK() -> 등수(순위)를 반환하는 함수

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"   --** 급여 내림차순 기준 등수 매기기
FROM EMP;
--==>>
/*
7839	KING	10	5000	1
7902	FORD	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	4
7698	BLAKE	30	2850	5
7782	CLARK	10	2450	6
7499	ALLEN	30	1600	7
7844	TURNER	30	1500	8
7934	MILLER	10	1300	9
7521	WARD	30	1250	10
7654	MARTIN	30	1250	10
7876	ADAMS	20	1100	12
7900	JAMES	30	950	    13
7369	SMITH	20	800	    14
*/

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP;
/*
7839	KING	10	5000	1	1
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7698	BLAKE	30	2850	1	5
7782	CLARK	10	2450	2	6
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7934	MILLER	10	1300	3	9
7521	WARD	30	1250	4	10
7654	MARTIN	30	1250	4	10
7876	ADAMS	20	1100	4	12
7900	JAMES	30	950	    6	13
7369	SMITH	20	800	    5	14
*/

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP
ORDER BY DEPTNO;
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	6
7934	MILLER	10	1300	3	9
7902	FORD	20	3000	1	2   -> 1
7788	SCOTT	20	3000	1	2   -> 1
7566	JONES	20	2975	3	4   -> 3
7876	ADAMS	20	1100	4	12
7369	SMITH	20	800	    5	14
7698	BLAKE	30	2850	1	5
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7654	MARTIN	30	1250	4	10
7521	WARD	30	1250	4	10
7900	JAMES	30	950	    6	13
*/

--○ DENSE_RANK() -> 서열을 반환하는 함수

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여서열"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "전체급여서열"
FROM EMP
ORDER BY 3,4 DESC;
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	5
7934	MILLER	10	1300	3	8
7902	FORD	20	3000	1	2   -> 1
7788	SCOTT	20	3000	1	2   -> 1
7566	JONES	20	2975	2	3   -> 2
7876	ADAMS	20	1100	3	10
7369	SMITH	20	800	    4	12
7698	BLAKE	30	2850	1	4
7499	ALLEN	30	1600	2	6
7844	TURNER	30	1500	3	7
7654	MARTIN	30	1250	4	9
7521	WARD	30	1250	4	9
7900	JAMES	30	950	    5	11
*/

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMP 테이블의 사원 데이터를
--     사원명, 부서번호, 연봉, 부서내연봉순위, 전체연봉순위 항목으로 조회한다.
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

/* 2-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMP 테이블에서 전체연봉순위가 1등부터 5등까지만..
--   사원명, 부서번호, 연봉, 전체연봉순위 항목으로 조회한다.
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

--○ EMP 테이블에서 각 부서별로 연봉 등수가 1등 부터 2등 까지만 조회한다.
--   사원명, 부서번호, 연봉, 부서내연봉등수, 전체연봉등수 항목을
--   조회할 수 있도록 쿼리문을 구성한다.

SELECT T.*
FROM
(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
         , RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM,0)) DESC) "부서내연봉등수"
         , RANK() OVER(ORDER BY (SAL*12+NVL(COMM,0)) DESC) "전체연봉등수"
    FROM EMP
) T
WHERE T."부서내연봉등수" <=2 ;



SELECT T2.*
FROM
(
    SELECT T1.*
         , RANK() OVER(PARTITION BY T1."부서번호" ORDER BY T1."연봉" DESC) "부서내연봉등수"
         , RANK() OVER(ORDER BY T1."연봉" DESC) "전체연봉등수"
    FROM
    (
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
    FROM EMP
    ) T1
) T2
WHERE T2."부서내연봉등수" <=2 ;
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
FORD	20	36000	1	2
SCOTT	20	36000	1	2
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
*/

--※ 정정
-- LN() 자연 로그 존재함~!!!
SELECT LN(95) "COL1"
FROM DUAL;
--==>> 4.55387689160054083460978676511404117675

--※ 추가
--○ TRIM()
SELECT TRIM('          TEST           ') "COL1"
    , LTRIM('          TEST           ') "COL2"
    , RTRIM('          TEST           ') "COL3"
FROM DUAL;
--==>> TEST	TEST           	          TEST

--■■■ 그룹 함수 ■■■--

-- SUM() 합, AVG() 평균, COUNT() 카운트, MAX() 최대값, MIN() 최소값
-- ,VARIENCE() 분산, STDDEV() 표준편차

--※ 그룹함수의 가장 큰 특징
--   처리해야 할 데이터들 중 NULL이 존재한다면(포함되어 있다면)
--   이 NULL은 제외한 상태로 연산을 수행한다는 것이다.
--   즉, NULL은 연산의 대상에서 제외된다.

--○ SUM() 합
-- EMP 테이블을 대상으로 전체 사원들의 급여 총 합을 조회한다.
SELECT SAL
FROM EMP;
/*
800
1600
1250
2975
1250
2850
2450
3000
5000
1500
1100
950
3000
1300
*/

SELECT SUM(SAL) -- 800 + 1600 + ... + 1300
FROM EMP;
--==>> 29025

SELECT COMM
FROM EMP;
/*
(null)
300
500
(null)
1400
(null)
(null)
(null)
(null)
0
(null)
(null)
(null)
(null)
*/

SELECT SUM(COMM)    -- NULL + 300 + 500 + NULL + ... + NULL --(X)
FROM EMP;
--==>> 2200

--○ COUNT() 행(레코드)의 갯수 조회 -> 데이터가 몇 건인지... 확인...
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)
FROM EMP;
--==>> 4

SELECT COUNT(*)
FROM EMP;
--==>> 14
-- COUNT를 수행할때는 NULL 이 조회에서 빠질 수 있으므로 (*)으로 조회

--○ AVG() 평균 반환
SELECT AVG(SAL) "COL1"
     , SUM(SAL) / COUNT(SAL) "COL2"
     , 29025 / 14 "COL3"
FROM EMP;
--==>> 2073.214285714285714285714285714285714286	2073.214285714285714285714285714285714286

SELECT AVG(COMM) "COL1"
     , SUM(COMM) / COUNT(COMM) "COL2"
     , 2200 / 4 "COL3"  -- NULL을 제외하고 연산
     , 2200 / 14 "COL4" -- 정답
FROM EMP;

--※ 데이터가 NULL인 컬럼의 레코드는 연산 대상에서 제외되기 때문에
-- 주의하여 연산 처리해야 한다.

SELECT SUM(COMM) / COUNT(*) "COL1"
FROM EMP;
--==>> 157.142857142857142857142857142857142857

-- VARIANCE() / STDDEV()
-- ※ 표준편차의 제곱이 분산, 분산의 제곱근이 표준편차

SELECT VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>> 1398313.87362637362637362637362637362637	1182.503223516271699458653359613061928508

SELECT POWER(STDDEV(SAL),2) "COL1"
     , VARIANCE(SAL) "COL2"
FROM EMP;
--==>> 
/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL)) "COL1"
FROM EMP;
--==>> 1182.503223516271699458653359613061928508

-- MAX() / MIN()
-- 최대값 / 최소값 반환
SELECT MAX(SAL) "COL1"
     , MIN(SAL) "COL2"
FROM EMP;
--==>>800

--※ 주의
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> 에러발생(ORA-00937: not a single-group group function)

SELECT ENAME
FROM EMP;

SELECT SUM(SAL)
FROM EMP;
--==>> 29025

SELECT DEPTNO, SUM(SAL) --** DEPTNO : 14건, SUM(SAL)은 단일건
FROM EMP;
--==>> 에러 발생(ORA-00937: not a single-group group function)

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY 1;
/*
10	8750
20	10875
30	9400
*/

SELECT DEPTNO, SAL
FROM EMP
ORDER BY 1;
--==>>
/*
10	2450 ┐
10	5000 │10
10	1300 ┘
20	2975 ┐
20	3000 │
20	1100 │20
20	800  │
20	3000 ┘
30	1250 ┐
30	1500 │
30	1600 │30
30	950  │
30	2850 │
30	1250 ┘
*/

--○ 기존 테이블 제거
DROP TABLE TBL_EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

--○ 실습 테이블 생성(복사)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

--○ 실습 데이터 추가 입력
INSERT INTO TBL_EMP VALUES
(8001, '이윤수', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_EMP VALUES
(8002, '임하성', 'CLERK', 7566, SYSDATE, 2000, 10, NULL);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_EMP VALUES
(8003, '김민지', 'SALESMAN', 7698, SYSDATE, 1700, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_EMP VALUES
(8006, '정현욱', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_EMP VALUES
(8007, '박나영', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT * 
FROM TBL_EMP;
/*
7369	SMITH	CLERK	    7902	1980-12-17	800		(null)  20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	    30
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850	(null)	30
7782	CLARK	MANAGER	    7839	1981-06-09	2450	(null)	10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000	(null)	20
7839	KING	PRESIDENT		    1981-11-17	5000	(null)	10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	    7788	1987-07-13	1100	(null)	20
7900	JAMES	CLERK	    7698	1981-12-03	950		(null)  30
7902	FORD	ANALYST	    7566	1981-12-03	3000	(null)  20
7934	MILLER	CLERK	    7782	1982-01-23	1300	(null)  10
8001	이윤수	CLERK	    7566	2023-10-24	1500	10	    (null)
8002	임하성	CLERK	    7566	2023-10-24	2000	10	    (null)
8003	김민지	SALESMAN	7698	2023-10-24	1700	(null)  (null)	
8006	정현욱	SALESMAN	7698	2023-10-24	2500	(null)  (null)
8007	박나영	SALESMAN	7698	2023-10-24	1000	(null)  (null)
*/

--○ 커밋
COMMIT;

SELECT DEPTNO, SAL, COMM
FROM TBL_EMP
ORDER BY COMM DESC;
/*
20	800	
	1700	
	1000	
10	1300	
20	2975	
30	2850	
10	2450	
20	3000	
10	5000	
	2500	
20	1100	
30	950	
20	3000	
30	1250	1400
30	1250	500
30	1600	300
	1500	10
	2000	10
30	1500	0
*/

-- 오라클에서는 NULL을 가장 큰 값으로 간주한다.
-- (ORACLE 9I 까지는 NULL을 가장 작은 값으로 간주했었다.)
-- (MSSQL 은 NULL을 가장 작은 값으로 간주한다.)

--○ TBL_EMP 테이블을 대상으로 부서별 급여합 조회
--   부서번호, 급여합 항목  조회
SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
/*
10	    8750
20	    10875
30	    9400
(null)	8700     -- 부서번호가 NULL 인 사원들의 급여합
*/

SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
	8700  -- 부서번호가 NULL 인 사원들의 급여합
	37725 -- 모든부서 직원들의 급여합
*/

/*
10	    8750
20	    10875
30	    9400
인턴	8700 
*/

/*
10	    8750
20	    10875
30	    9400
인턴	8700 
*/

/*
10	        8750
20	        10875
30	        9400
인턴	    8700
모든부서	37725
*/

SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
	29025
*/

/* 3- 문제 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*
10	        8750
20	        10875
30	        9400
모든부서	29025
*/
-- EMP 테이블을 대상으로 위와 같이 조회되도록 쿼리문을 구성한다.  

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

-- GROUPING()
SELECT GROUPING(DEPTNO), DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

/*
GROUPING(DEPTNO)	부서번호	급여합
0	                    10	    8750
0	                    20	    10875
0	                    30	    9400
0	                (null)	    8700
1	                (null)	    37725
*/
/*
부서번호	급여합
10	    8750
20	    10875
30	    9400
(null)	    8700
(null)	    37725
*/

/* 4- 문제 & 함께 푼 풀이 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*
부서번호	급여합
10	     8750
20	     10875
30	     9400
인턴	 8700
모든부서 37725
*/
-- 이와 같이 조회되도록 쿼리문을 구성한다.

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

/* 5- 문제 & 함께 푼 풀이 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_SAWON 테이블을 대상으로
--   다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
성별       급여합
-------  ---------
남         XXXX
여        XXXXX
모든사원 XXXXXX
*/
 
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

--○ TBL_SAWON 테이블을 대상으로
--    다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
    
/*
연령대     인원수
10          X
20          X
50          X
전체        X
*/
오늘 년도 - 생년월일 = 현재나이
SELECT NVL(TO_CHAR(T.연령),'전체') "연령대" , COUNT(T.연령) "인원수"
FROM(
    SELECT TRUNC(EXTRACT(YEAR FROM SYSDATE) - DECODE(SUBSTR(JUBUN,7,1),'3',2000,'4',2000,'1',1900,'2',1900,0) - SUBSTR(JUBUN,1,2) +1,-1) "연령"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.연령);

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

SELECT TRUNC(27, -1) "COL1"
FROM DUAL;

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 1,2;
/*
DEPTNO	JOB	SUM(SAL)
10	CLERK	1300
10	MANAGER	2450
10	PRESIDENT	5000
20	ANALYST	6000
20	CLERK	1900
20	MANAGER	2975
30	CLERK	950
30	MANAGER	2850
30	SALESMAN	5600
*/

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
/*
DEPTNO	JOB	        SUM(SAL)
10	    CLERK	    1300    - 10번 부서 CLERK 직종의 급여 합
10	    MANAGER	    2450    - 10번 부서 MANGER 직종의 급여 합
10	    PRESIDENT	5000
10	    (null)	    8750    - 10번 주서 모든 직종의 급여 합
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400
(null)	(null)	    29025   - 모든 직종 모든 부서의 급여 합
*/

--○ CUBE() -> ROLLUP() 보다 더 자세한 결과를 반환받는다.
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
/*
DEPTNO	JOB	SUM(SAL)
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (null)	    8750
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400
(null)	ANALYST	    6000    - 모든 부서 ANALYST 직종의 급여합 -- 추가
(null)	CLERK	    4150    - 모든 부서 CLECK 직종의 급여합
(null)	MANAGER	    8275    - 모든 부서 MANAGER 직종의 급여합
(null)	PRESIDENT	5000    - 모든 부서 PRESIDNT 직종의 급여합
(null)	SALESMAN	5600
(null)	(null)	    29025
*/
-- ※ ROLLUP()과 CUBE() 는 그룹을 묶어주는 방식이 다르다.(차이)

--EX.

--ROLLUP(A,B,C)
-- -> (A,B,C) / (A,B) / (A) / ()

--CUBE(A,B,C)
-- -> (A,B,C) / (A,B) / (A,C) / (B,C) / (A)/ (B)/ (C) {}

--> 윙의 과정(ROLLUP())은 묶음 방식이 다소 모자랄 때가 있고
-- 아래의 과정(CUBE())은 묶음 방식이 다지나칠 때가 있기 때문ㅇ
-- 다음과 같은 방식의 쿼리를 더 많이 사용하게 된다.
-- 다음 작성하는 퀄리는 조회하고 자하는 그룹만
-- <GROUPING SETS>를 사용하여 선택적으로 묶어줌

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

--------------------------------------------------------------------------------
/* 6- 문제 & 함께 푼 풀이 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_EMP 테이블을 대상으로
--   입사년도별 인원수를 조회한다.
SELECT *
FROM TBL_EMP;

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

--** GROUP BY와 조건에 데이터 타입 통일
--** GROUP BY 에서 묶어준 방식을 통일(EX. EXTRACT이면, EXTRACT로)
--** 단순히 형을 맞춘다고 해서 해결되지 않음












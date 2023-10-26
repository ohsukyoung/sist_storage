SELECT USER
FROM DUAL;
--==>> SCOTT


--■■■ HAVING ■■■--

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMP 테이블에서 부서번호가 20, 30인 부서를 대상으로
--   부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다.

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

SELECT *
FROM EMP;

-------------------------

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


--------------------------------------------------------------------------------

--■■■ 중첩 그룹함수 / 분석함수 ■■■--

--※ 그룹함수는 2 LEVEL 까지 중첩해서 사용할 수 있다.
-- 함수는 일반적으로 중첩에 대한 제한이 없는데, 그룹함수는 논리적인 특성상 제한되어있음(이것도 오라클만 중첩되고, 나머지는 중첩도 안됨)

SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
9400
10875
8750
*/

SELECT MAX(SUM(SAL)) "COL1"
FROM EMP
GROUP BY DEPTNO;
--==>> 10875


-- RANK() / DENSE_RANK()
--> 오라클 9i부터 적용되었던 함수 (MSSQL은 아마도 2005부터 적용...)

--> 하위 버전에서는 RANK() 나 DENSE_RANK() 를 사용할 수 없기 때문에
--  이 함수를 활용하지 않는 다른 방법을 찾아야 한다.
--  예를 들어... 급여 순위를 구하고자 한다면...
--  해당 사원의 급여보다 더 큰 값이 몇 개인지 확인한 후
--  확인한 숫자에 『+1』을 추가로 연산해 주면...
--  그 값이 곧 해당 사원의 등수가 된다.


SELECT ENAME, SAL
FROM EMP;
--==>>
/*
SMITH	800
ALLEN	1600
WARD	1250
JONES	2975
MARTIN	1250
BLAKE	2850
CLARK	2450
SCOTT	3000
KING	5000
TURNER	1500
ADAMS	1100
JAMES	950
FORD	3000
MILLER	1300
*/


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;        -- SMITH 의 급여
--==>> 14               -- SMITH 의 등수


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;       -- ALLEN 의 급여
--==>> 7                -- ALLEN 의 등수



--※ 서브 상관 쿼리(=상관 서브 쿼리)

-- 프롬절에 내부쿼리가 들어있는것 = 서브쿼리

-- 메인 쿼리가 있는 테이블의 컬럼이
-- 서브 쿼리의 조건절(WHERE절, HAVING절)에 사용되는 경우
-- 우리는 이 쿼리문을 서브 상관 쿼리(상관 서브 쿼리)라고 부른다.


SELECT ENAME "사원명", SAL "급여", 1 "급여등수"
FROM EMP;

SELECT ENAME "사원명", SAL "급여", (1) "급여등수"
FROM EMP;

SELECT ENAME "사원명", SAL "급여", (SELECT COUNT(*) + 1
                                    FROM EMP
                                    WHERE SAL > 1600;) "급여등수"
FROM EMP;

SELECT E.ENAME "사원명", E.SAL "급여", (SELECT COUNT(*) + 1
                                        FROM EMP
                                        WHERE SAL > E.SAL) "급여등수"
FROM EMP E
ORDER BY 3;
--==>>
/*
KING	5000	1
FORD	3000	2
SCOTT	3000	2
JONES	2975	4
BLAKE	2850	5
CLARK	2450	6
ALLEN	1600	7
TURNER	1500	8
MILLER	1300	9
WARD	1250	10
MARTIN	1250	10
ADAMS	1100	12
JAMES	950	    13
SMITH	800	    14
*/

/* 2-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMP 테이블을 대상으로
--   사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다.
--   단, RANK() 함수를 사용하지 않고, 서브상관쿼리를 사용할 수 있도록 한다.


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


--○ EMP 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
                            - 각 부서 내에서 입사일자별로 누적된 급여의 합
-----------------------------------------------------------------------
사원명   부서번호     입사일      급여     부서내입사별급여누적
-----------------------------------------------------------------------
SMITH     20       1980-12-17     800         800
JONES     20       1981-04-20     2975        3775
FORD      20       1981-12-03     3000        6775

-----------------------------------------------------------------------
*/



SELECT EMP.ENAME "사원명", EMP.DEPTNO "부서번호", EMP.HIREDATE "입사일", EMP.SAL "급여"
, (1) "부서내입사별급여누적"
FROM EMP
ORDER BY 2, 3;


SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
, (1) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;


SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
, (SELECT SUM(E2.SAL) FROM EMP E2 WHERE E2.DEPTNO = E1.DEPTNO) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;


SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
, (SELECT SUM(E2.SAL)
    FROM EMP E2 
    WHERE E2.DEPTNO = E1.DEPTNO
    AND E2.HIREDATE<=E1.HIREDATE) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;
--==>>
/*
CLARK	10	1981-06-09	2450	2450
KING	10	1981-11-17	5000	7450
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	800	    800
JONES	20	1981-04-02	2975	3775
FORD	20	1981-12-03	3000	6775
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	1600
WARD	30	1981-02-22	1250	2850
BLAKE	30	1981-05-01	2850	5700
TURNER	30	1981-09-08	1500	7200
MARTIN	30	1981-09-28	1250	8450
JAMES	30	1981-12-03	950	    9400
*/


SELECT E.ENAME "사원명", E.DEPTNO "부서번호", E.HIREDATE "입사일", E.SAL "급여"
, (SELECT SUM(SAL) FROM EMP WHERE (DEPTNO=E.DEPTNO) AND (HIREDATE<=E.HIREDATE)) "부서내입사별급여누적"
FROM EMP E
ORDER BY 2,3;


/* 3-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMP 테이블을 대상으로
--   입사한 사원의 수가 가장 많았을 때의
--   입사년월과 인원수를 조회할 수 있도록 쿼리문을 구성한다.

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

--------------------------------------------------------------------------------

--■■■ ROW_NUMBER ■■■--

SELECT ENAME "사원명", SAL "급여", HIREDATE "입사일"
FROM EMP;
/*
SMITH	800	    1980-12-17
ALLEN	1600	1981-02-20
WARD	1250	1981-02-22
JONES	2975	1981-04-02
MARTIN	1250	1981-09-28
BLAKE	2850	1981-05-01
CLARK	2450	1981-06-09
SCOTT	3000	1987-07-13
KING	5000	1981-11-17
TURNER	1500	1981-09-08
ADAMS	1100	1987-07-13
JAMES	950	    1981-12-03
FORD	3000	1981-12-03
MILLER	1300	1982-01-23
*/

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "관찰"
    , ENAME "사원명", SAL "급여", HIREDATE "입사일"
FROM EMP;
/*
1	KING	5000	1981-11-17
2	FORD	3000	1981-12-03
3	SCOTT	3000	1987-07-13
4	JONES	2975	1981-04-02
5	BLAKE	2850	1981-05-01
6	CLARK	2450	1981-06-09
7	ALLEN	1600	1981-02-20
8	TURNER	1500	1981-09-08
9	MILLER	1300	1982-01-23
10	WARD	1250	1981-02-22
11	MARTIN	1250	1981-09-28
12	ADAMS	1100	1987-07-13
13	JAMES	 950	1981-12-03
14	SMITH	 800	1980-12-17
*/

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "관찰"
    , ENAME "사원명", SAL "급여", HIREDATE "입사일"
FROM EMP
ORDER BY ENAME;
/*
12	ADAMS	1100	1987-07-13
7	ALLEN	1600	1981-02-20
5	BLAKE	2850	1981-05-01
6	CLARK	2450	1981-06-09
2	FORD	3000	1981-12-03
13	JAMES	 950	1981-12-03
4	JONES	2975	1981-04-02
1	KING	5000	1981-11-17
11	MARTIN	1250	1981-09-28
9	MILLER	1300	1982-01-23
3	SCOTT	3000	1987-07-13
14	SMITH	 800	1980-12-17
8	TURNER	1500	1981-09-08
10	WARD	1250	1981-02-22
*/
-- '관찰'이라고 부여된 번호는 정렬을 바꿔도 고유의 번호처럼 붙어있음을 확인한다.

SELECT ROW_NUMBER() OVER(ORDER BY ENAME) "관찰"
    , ENAME "사원명", SAL "급여", HIREDATE "입사일"
FROM EMP
ORDER BY ENAME;
/*
1	ADAMS	1100	1987-07-13
2	ALLEN	1600	1981-02-20
3	BLAKE	2850	1981-05-01
4	CLARK	2450	1981-06-09
5	FORD	3000	1981-12-03
6	JAMES	 950	1981-12-03
7	JONES	2975	1981-04-02
8	KING	5000	1981-11-17
9	MARTIN	1250	1981-09-28
10	MILLER	1300	1982-01-23
11	SCOTT	3000	1987-07-13
12	SMITH	 800	1980-12-17
13	TURNER	1500	1981-09-08
14	WARD	1250	1981-02-22
*/
-- 정렬한 ENAME을 기준으로 관찰번호 부여했다.(위의 코드와 다른 부분: SELECT의 ORDER BY)

--※ 게시판의 게시물 번호를 SEQUENCE나 IDENTITY를 사용하게 되면
--   게시물을 삭제했을 경우... 삭제한 게시물으리 자리에 다음 번호를 가진
--   게시물이 등록되는 상황이 발생하게 된다.
--   이는... 보안성 측면이나... 미관상 ... 바람직하지 않은 상태일 수 있기 때문에
--   ROW_NUMBER()의 사용을 고려해 볼 수 있다.
--   관리의 목적으로 사용할 때에는 SEQUENCE 나 IDENTITY 를 사용하지만,
--   단순히 게시물을 목록화하여 사용자에게 리스트 형식으로 보여줄 때에는
--   사용하지 않는 것이 바람직할 수 있다.

--   방법1) 중간에 번호가 없는것을 사용자가 알게 된다면(게시물을 삭제하기 때문에)
--   사용자의 입장에서는 필터링을 많이하는 게시판이라고 생각이 들어 신뢰성이 떨어진다.

--   방법2) 기동력을 앞세우기 위해서 사용자에게 보여지는 게시물 번호가 실제 DB번호로 연동하기도 한다.



-- ○ SEQUENCE(시퀀스: 주문번호)
--    -> 사전적인 의미: 1. (일련의) 연속적인 사건들 2. (사건, 행동 등의) 순서

-- ○ 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD   -- 기본적인 시퀀스 생성 구문
START WITH 1                -- 시작값 설정
INCREMENT BY 1              -- 증가값 설정
NOMAXVALUE                  -- 최대값 설정 옵션
NOCACHE;                    -- 캐시 사용 안함 설정 옵션
--==>> Sequence SEQ_BOARD이(가) 생성되었습니다.



-- 캐시란, 입장하기 위해 많은 인원이 한꺼번에 들어가려고 하면 들어갈 수 없을 때
-- 입장권을 뽑아서 입장으로 했을 경우 들어갈 수는 있지만 대기시간이 있을 수 있는데
-- 한꺼번에 여러장을 뽑아서 나누어주는 것과 같다.


--○ 실습 테이블 생성(테이블명: TBL_BOARD)
CREATE TABLE TBL_BOARD                   -- TBL_BOARD 테이블 생성 구문 -> 게시판 테이블
( NO            NUMBER                  -- 게시물 번호           -> X 사용자 작성
, TITLE         VARCHAR2(50)            -- 게시물 제목           -> O
, CONTENTS      VARCHAR2(100)           -- 게시물 내용           -> O
, NAME          VARCHAR2(20)            -- 게시물 작성자         -> △
, PW            VARCHAR2(20)            -- 게시물 패스워드       -> △
, CREATED       DATE DEFAULT SYSDATE    -- 게시물 작성일         -> X
);
--==>> Table TL_BOARD이(가) 생성되었습니다.

--○ 데이터 입력 -> 게시판에 게시물 작성
-- SEQ_BOARD.NEXTVAL: SEQ_BOARD에서 시퀀스의 번호표부여한다.
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '아~~~ 힘들다', '10분만 쉬었다 올께요', '문정환', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '아~ 졸리다', '10분만 자고 올께요', '정한울', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '아~ 웃겨', '하루하루가 재미있어요', '노은하', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '보고싶다', '범구가 너무너무 보고싶어요', '김수환', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '배고파요', '점심을 먹었는데 배고파요', '김민지', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '아직 남아있네요', '두 시간 반이나 남아있네요', '이윤수', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '그만하고싶다', '그냥 넘어갈까....', '김호진', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '아~ 배아파', 'ㅋㅋㅋㅋㅋ', '노은하', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '소근소근', '궁시렁궁시렁', '이윤수', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '모자라요', '아직 잠이 모자라요', '김동민', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

--○ 확인
SELECT *
FROM TBL_BOARD;
/*
1	아~~~ 힘들다	10분만 쉬었다 올께요	    문정환	java006$	2023-10-25 15:26:04
2	아~ 졸리다	    10분만 자고 올께요	        정한울	java006$	2023-10-25 15:28:11
3	아~ 웃겨	    하루하루가 재미있어요	    노은하	java006$	2023-10-25 15:31:02
4	보고싶다	    범구가 너무너무 보고싶어요	김수환	java006$	2023-10-25 15:32:03
5	배고파요	    점심을 먹었는데 배고파요	김민지	java006$	2023-10-25 15:34:01
6	아직 남아있네요	두 시간 반이나 남아있네요	이윤수	java006$	2023-10-25 15:35:23
7	그만하고싶다	그냥 넘어갈까....	        김호진	java006$	2023-10-25 15:38:26
8	아~ 배아파	    ㅋㅋㅋㅋㅋ	                노은하	java006$	2023-10-25 15:39:24
9	소근소근	    궁시렁궁시렁	            이윤수	java006$	2023-10-25 15:40:25
10	모자라요	    아직 잠이 모자라요	        김동민	java006$	2023-10-25 15:41:17
*/

--○ 커밋
COMMIT;
--==>> 커밋완료

--○ 게시물 삭제
SELECT *
FROM TBL_BOARD
WHERE NO=1;

DELETE
FROM TBL_BOARD
WHERE NO=1;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_BOARD
WHERE NO=6;
--==>> 6	아직 남아있네요	두 시간 반이나 남아있네요	이윤수	java006$	2023-10-25 15:35:23

DELETE
FROM TBL_BOARD
WHERE NO=6;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_BOARD
WHERE NO=8;
--==>> 8	아~ 배아파	ㅋㅋㅋㅋㅋ	노은하	java006$	2023-10-25 15:39:24

DELETE
FROM TBL_BOARD
WHERE NO=8;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_BOARD
WHERE NO=10;
--==>> 10	모자라요	아직 잠이 모자라요	김동민	java006$	2023-10-25 15:41:17

DELETE
FROM TBL_BOARD
WHERE NO=10;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 확인
SELECT *
FROM TBL_BOARD;
/*
2	아~ 졸리다	10분만 자고 올께요	정한울	java006$	2023-10-25 15:28:11
3	아~ 웃겨	하루하루가 재미있어요	노은하	java006$	2023-10-25 15:31:02
4	보고싶다	범구가 너무너무 보고싶어요	김수환	java006$	2023-10-25 15:32:03
5	배고파요	점심을 먹었는데 배고파요	김민지	java006$	2023-10-25 15:34:01
7	그만하고싶다	그냥 넘어갈까....	김호진	java006$	2023-10-25 15:38:26
9	소근소근	궁시렁궁시렁	이윤수	java006$	2023-10-25 15:40:25
*/

--○ 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '집중합시다', '저는 전혀 졸리지 않아요', '임하성', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 게시물 삭제
SELECT *
FROM TBL_BOARD
WHERE NO = 7;
--==>> 7	그만하고싶다	그냥 넘어갈까....	김호진	java006$	2023-10-25 15:38:26

DELETE
FROM TBL_BOARD
WHERE NO = 7;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 확인
SELECT *
FROM TBL_BOARD;
/*
2	아~ 졸리다	10분만 자고 올께요	정한울	java006$	2023-10-25 15:28:11
3	아~ 웃겨	하루하루가 재미있어요	노은하	java006$	2023-10-25 15:31:02
4	보고싶다	범구가 너무너무 보고싶어요	김수환	java006$	2023-10-25 15:32:03
5	배고파요	점심을 먹었는데 배고파요	김민지	java006$	2023-10-25 15:34:01
9	소근소근	궁시렁궁시렁	이윤수	java006$	2023-10-25 15:40:25
11	집중합시다	저는 전혀 졸리지 않아요	임하성	java006$	2023-10-25 16:07:05
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 게시판의 게시물 리스트 조회
SELECT NO "글번호", TITLE "제목", NAME "작성자", CREATED "작성일"
FROM TBL_BOARD;
/*
2	아~ 졸리다	정한울	2023-10-25 15:28:11
3	아~ 웃겨	노은하	2023-10-25 15:31:02
4	보고싶다	김수환	2023-10-25 15:32:03
5	배고파요	김민지	2023-10-25 15:34:01
9	소근소근	이윤수	2023-10-25 15:40:25
11	집중합시다	임하성	2023-10-25 16:07:05
*/

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "글번호"
     , TITLE "제목", NAME "작성자", CREATED "작성일"
FROM TBL_BOARD;
/*
1	아~ 졸리다	정한울	2023-10-25 15:28:11
2	아~ 웃겨	노은하	2023-10-25 15:31:02
3	보고싶다	김수환	2023-10-25 15:32:03
4	배고파요	김민지	2023-10-25 15:34:01
5	소근소근	이윤수	2023-10-25 15:40:25
6	집중합시다	임하성	2023-10-25 16:07:05
*/

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "글번호"
     , TITLE "제목", NAME "작성자", CREATED "작성일"
FROM TBL_BOARD
ORDER BY 4 DESC;
/*
6	집중합시다	임하성	2023-10-25 16:07:05
5	소근소근	이윤수	2023-10-25 15:40:25
4	배고파요	김민지	2023-10-25 15:34:01
3	보고싶다	김수환	2023-10-25 15:32:03
2	아~ 웃겨	노은하	2023-10-25 15:31:02
1	아~ 졸리다	정한울	2023-10-25 15:28:11
*/

--------------------------------------------------------------------------------

--■■■ JOIN(조인) ■■■--

--** 조인의 사전적 뜻: 합치다, 결합하다 
--** 92 코드: 92년에 확정되어서 쓰자한 코드
--** 99 코드: 99년에 확정되어서 쓰자한 코드

--**======================================================
--** 결론: 실무에서 모두 쓰이기 때문에... 둘다 알아야 함
--**======================================================

-- 1. SQL 1992 CODE

-- CROSS JOIN
--** 모든 결합 유형이 다 들어있는 코드
SELECT *
FROM EMP, DEPT;     -- EMP 테이블과, DEPT 테이블을 퍼올려라
--> 수학에서 말하는 데카르트 곱(CATERSIAN PRODUCT)
--  두 테이블을 결합한 모든 경우의 수(14 * 4 = 56)
/*EX)
EMPNO	ENAME	JOB	MGR	HIREDATE	SAL	COMM	DEPTNO	DEPTNO_1	DNAME	LOC
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	10	ACCOUNTING	NEW YORK

7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	20	RESEARCH	DALLAS

7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	30	SALES	CHICAGO

7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	40	OPERATIONS	BOSTON*/
--==>> SMITH가 여러가지와 결합해서 보여짐

SELECT *
FROM EMP;

SELECT *
FROM SALGRADE;

SELECT *
FROM DEPT;

SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

-- EQUI JOIN: 서로 정확하게 일치하는 데이터들 끼리 연결하여 결합시키는 결합 방법
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
/*
7782	CLARK	MANAGER	    7839	1981-06-09 00:00:00	2450	(null)	10	10	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT	(null)	1981-11-17 00:00:00	5000	(null)	10	10	ACCOUNTING	NEW YORK
7934	MILLER	CLERK	    7782	1982-01-23 00:00:00	1300	(null)	10	10	ACCOUNTING	NEW YORK
7566	JONES	MANAGER	    7839	1981-04-02 00:00:00	2975	(null)	20	20	RESEARCH	DALLAS
7902	FORD	ANALYST	    7566	1981-12-03 00:00:00	3000	(null)	20	20	RESEARCH	DALLAS
7876	ADAMS	CLERK	    7788	1987-07-13 00:00:00	1100	(null)	20	20	RESEARCH	DALLAS
7369	SMITH	CLERK	    7902	1980-12-17 00:00:00	 800	(null)	20	20	RESEARCH	DALLAS
7788	SCOTT	ANALYST	    7566	1987-07-13 00:00:00	3000	(null)	20	20	RESEARCH	DALLAS
7521	WARD	SALESMAN	7698	1981-02-22 00:00:00	1250	   500	30	30	SALES	    CHICAGO
7844	TURNER	SALESMAN	7698	1981-09-08 00:00:00	1500	     0	30	30	SALES	    CHICAGO
7499	ALLEN	SALESMAN	7698	1981-02-20 00:00:00	1600	   300	30	30	SALES	    CHICAGO
7900	JAMES	CLERK	    7698	1981-12-03 00:00:00	 950	(null)	30	30	SALES	    CHICAGO
7698	BLAKE	MANAGER	    7839	1981-05-01 00:00:00	2850	(null)	30	30	SALES	    CHICAGO
7654	MARTIN	SALESMAN	7698	1981-09-28 00:00:00	1250	  1400	30	30	SALES	    CHICAGO
*/

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>>
/*
7782	CLARK	MANAGER	7839	1981-06-09 00:00:00	2450		10	10	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT		1981-11-17 00:00:00	5000		10	10	ACCOUNTING	NEW YORK
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10	10	ACCOUNTING	NEW YORK
7566	JONES	MANAGER	7839	1981-04-02 00:00:00	2975		20	20	RESEARCH	DALLAS
7902	FORD	ANALYST	7566	1981-12-03 00:00:00	3000		20	20	RESEARCH	DALLAS
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20	20	RESEARCH	DALLAS
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	20	RESEARCH	DALLAS
7788	SCOTT	ANALYST	7566	1987-07-13 00:00:00	3000		20	20	RESEARCH	DALLAS
7521	WARD	SALESMAN	7698	1981-02-22 00:00:00	1250	500	30	30	SALES	CHICAGO
7844	TURNER	SALESMAN	7698	1981-09-08 00:00:00	1500	0	30	30	SALES	CHICAGO
7499	ALLEN	SALESMAN	7698	1981-02-20 00:00:00	1600	300	30	30	SALES	CHICAGO
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	950		30	30	SALES	CHICAGO
7698	BLAKE	MANAGER	7839	1981-05-01 00:00:00	2850		30	30	SALES	CHICAGO
7654	MARTIN	SALESMAN	7698	1981-09-28 00:00:00	1250	1400	30	30	SALES	CHICAGO
*/

-- NON EQUI JOIN: 범위 안에 적합한 것들끼리 연결시키는 결합 방법
--** 정확하게 일치하는 조건으로 조인이 아님

SELECT *
FROM EMP, SALGRADE
WHERE EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL;
--** EMP테이블과 SQLGRADE 테이블을 조합하는데, EMP테이블의 급여가 SALGRADE의 낮은 값부터 SALGRADE테이블의 높은값 사이의 값만 추출한다.

SELECT *
FROM EMP E, SALGRADE S                      --** 결합은 , 콤마로
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;    --** 결합조건은 WHERE에 기재
/*
7369	SMITH	CLERK	    7902	1980-12-17 00:00:00	800		20	1	700	1200
7900	JAMES	CLERK	    7698	1981-12-03 00:00:00	950		30	1	700	1200
7876	ADAMS	CLERK	    7788	1987-07-13 00:00:00	1100		20	1	700	1200
7521	WARD	SALESMAN	7698	1981-02-22 00:00:00	1250	500	30	2	1201	1400
7654	MARTIN	SALESMAN	7698	1981-09-28 00:00:00	1250	1400	30	2	1201	1400
7934	MILLER	CLERK	    7782	1982-01-23 00:00:00	1300		10	2	1201	1400
7844	TURNER	SALESMAN	7698	1981-09-08 00:00:00	1500	0	30	3	1401	2000
7499	ALLEN	SALESMAN	7698	1981-02-20 00:00:00	1600	300	30	3	1401	2000
7782	CLARK	MANAGER	    7839	1981-06-09 00:00:00	2450		10	4	2001	3000
7698	BLAKE	MANAGER	    7839	1981-05-01 00:00:00	2850		30	4	2001	3000
7566	JONES	MANAGER	    7839	1981-04-02 00:00:00	2975		20	4	2001	3000
7788	SCOTT	ANALYST	    7566	1987-07-13 00:00:00	3000		20	4	2001	3000
7902	FORD	ANALYST	    7566	1981-12-03 00:00:00	3000		20	4	2001	3000
7839	KING	PRESIDENT		1981-11-17 00:00:00	5000		10	5	3001	9999
*/

-- EQUI JOIN 시 (+) 를 활용한 결합 방법
SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

INSERT INTO TBL_DEPT VALUES(50, '개발부', '서울');
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;
--==>> 커밋 완료.

FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 총 14건의 데이터가 결합되어 조화된 상황
-- 즉, 부서번호를 갖지 못한 사원들(5) 모두 누락
-- 또한, 소속 사원을 갖지 못한 부서(2) 모두 누락

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--> 총 19 거의 데이터가 결합되어 조회된 상황
-- 소속 사원을 갖지 못한 부서(2) 누락 -------------------------(+)
-- 부서번호를 갖지 못한 사원들(5) 모두 조회
/*
7934	MILLER	CLERK	    7782	1982-01-23 00:00:00	1300		10	10	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT		1981-11-17 00:00:00	5000		10	10	ACCOUNTING	NEW YORK
7782	CLARK	MANAGER	7839	1981-06-09 00:00:00	2450		10	10	ACCOUNTING	NEW YORK
7902	FORD	ANALYST	7566	1981-12-03 00:00:00	3000		20	20	RESEARCH	DALLAS
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20	20	RESEARCH	DALLAS
7788	SCOTT	ANALYST	7566	1987-07-13 00:00:00	3000		20	20	RESEARCH	DALLAS
7566	JONES	MANAGER	7839	1981-04-02 00:00:00	2975		20	20	RESEARCH	DALLAS
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	20	RESEARCH	DALLAS
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	950		30	30	SALES	CHICAGO
7844	TURNER	SALESMAN	7698	1981-09-08 00:00:00	1500	0	30	30	SALES	CHICAGO
7698	BLAKE	MANAGER	7839	1981-05-01 00:00:00	2850		30	30	SALES	CHICAGO
7654	MARTIN	SALESMAN	7698	1981-09-28 00:00:00	1250	1400	30	30	SALES	CHICAGO
7521	WARD	SALESMAN	7698	1981-02-22 00:00:00	1250	500	30	30	SALES	CHICAGO
7499	ALLEN	SALESMAN	7698	1981-02-20 00:00:00	1600	300	30	30	SALES	CHICAGO
8007	박나영	SALESMAN	7698	2023-10-24 14:47:30	1000					
8006	정현욱	SALESMAN	7698	2023-10-24 14:47:30	2500					
8003	김민지	SALESMAN	7698	2023-10-24 14:47:30	1700					
8002	임하성	CLERK	7566	2023-10-24 14:47:30	2000	10				
8001	이윤수	CLERK	7566	2023-10-24 14:47:30	1500	10				
*/

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--> 총 16 건의 데이터가 결합되어 조회된 상황
-- 소속 사원을 갖지 못한 부서(2) 모두 조회
-- 부서번호를 갖지 못한 사원들(5) 누락 -------------------------(+)

--※ <(+)> 가 없는 쪽 테이블의 데이터를 모두 메모리에 적재한 후             -- 기준
--   <(+)> 가 있는 쪽 테이블의 데이터를 하나하나 확인하여 결합시키는 형태로 -- 추가(첨가)
--   JOIN 이 이루어진다.

/*
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	20	RESEARCH	DALLAS
7499	ALLEN	SALESMAN	7698	1981-02-20 00:00:00	1600	300	30	30	SALES	CHICAGO
7521	WARD	SALESMAN	7698	1981-02-22 00:00:00	1250	500	30	30	SALES	CHICAGO
7566	JONES	MANAGER	7839	1981-04-02 00:00:00	2975		20	20	RESEARCH	DALLAS
7654	MARTIN	SALESMAN	7698	1981-09-28 00:00:00	1250	1400	30	30	SALES	CHICAGO
7698	BLAKE	MANAGER	7839	1981-05-01 00:00:00	2850		30	30	SALES	CHICAGO
7782	CLARK	MANAGER	7839	1981-06-09 00:00:00	2450		10	10	ACCOUNTING	NEW YORK
7788	SCOTT	ANALYST	7566	1987-07-13 00:00:00	3000		20	20	RESEARCH	DALLAS
7839	KING	PRESIDENT		1981-11-17 00:00:00	5000		10	10	ACCOUNTING	NEW YORK
7844	TURNER	SALESMAN	7698	1981-09-08 00:00:00	1500	0	30	30	SALES	CHICAGO
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20	20	RESEARCH	DALLAS
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	950		30	30	SALES	CHICAGO
7902	FORD	ANALYST	7566	1981-12-03 00:00:00	3000		20	20	RESEARCH	DALLAS
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10	10	ACCOUNTING	NEW YORK
								50	개발부	서울
								40	OPERATIONS	BOSTON
*/

--이와 같은 이유로...
SELECT *
FROM TBL_EMP E, TBL_DEPT D
FROM E.DEPTNO(+) = D.DEPTNO(+);
-- 이런식의 JOIN은 존재하지 않는다.



-- 2. SQL 1999 CODE             -> <JOIN> 키워드 등장 -> JOIN(결합)의 유형 명시
--** JOIN이라는 키워드가 보인다 ! -> 99코드
--**                    안보인다! -> 92코드
--                              -> <ON> 키워드 등장   -> 결합 조건은 WHERE 대신 ON

-- CROSS JOIN
SELECT *
FROM EMP CROSS JOIN DEPT;

-- INNER JOIN
SELECT *
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

--** 엘리어스(ALIAS- 별칭) 가능
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

--** INNER 생략 가능
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- OUTER JOIN
--** 눈여겨서 봐야할 부분
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- WHERE E.DEPTNO = D.DEPTNO(+);

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- WHERE E.DEPTNO(+) = D.DEPTNO;

SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

--** OUTER 생략가능
SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;


--※ 참고
--1번)
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO
AND E.JOB = 'CLERK';
--> 이와 같은 방법으로 쿼리문을 구성해도
--  조회 결과를 얻는 과정에는 문제가 없다.

--2번)
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'CLERK';
--> 하지만 이와 같은 구성하여
--  조회하는 것을 권장한다.

--**==============================
--** ON: 결합조건
--** WHERE는: 조회조건
--**==============================

--** SELECT 조건 처럼 
--** WHERE 절은 웨어 조건에 맞는 것만 1차적으로 퍼올림
--** 1번) TBL_DEPT 조건 & TBL_EMP 모두 퍼올림
--** 2번) TBL_DEPT 와 TBL_EMP조건에 맞는 것만 퍼올림

/* 4-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ EMP 테이블과 DEPT 테이블을 대상으로
--   직종이 MANAGER와 CLERK 인 사원들만
--   부서번호, 부서명, 사원명, 직종명, 급여 항목을 조회한다.

-- 부서번호,    부서명,    사원명,    직종명,    급여
-- DEPTNO       DNAME       ENAME       JOB      SAL
-- E, D         D           E           E        E

SELECT D.EMPNO "부서번호", D.DNAME "부서명", E.ENAME "사원명", E.JOB "직종명", E.SAL "급여"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB IN ('MANAGER', 'CLERK');
/*
7782	ACCOUNTING	CLARK	MANAGER	2450
7934	ACCOUNTING	MILLER	CLERK	1300
7876	RESEARCH	ADAMS	CLERK	1100
7566	RESEARCH	JONES	MANAGER	2975
7369	RESEARCH	SMITH	CLERK	800
7698	SALES	    BLAKE	MANAGER	2850
7900	SALES	    JAMES	CLERK	950
*/

SELECT 부서번호, 부서명, 사원명, 직종명, 급여
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>> 에러 발생(ORA-00918: column ambiguously defined)
--     두 테이블 간 중복되는 칼럼에 대한
--     소속 테이블을 정해줘야 (명시해줘야) 한다.

--※ 두 테이블 간 중복되는 컬럼에 대해 소속 테이블을 명시하는 경우
--   부모 테이블의 칼럼을 참조할 수 있도록 처리해야 한다.

--** 두개의 테이블이 있을 경우 부모테이블을 가져와서 써야함
--** 부모테이블이란? 
--** EMP의 DEPTNO 값이 여러개 있는데 DEPT는 DEPTNO 값이 하나만 있음 -> 따라서 부모테이블은 DEPTNO

SELECT *
FROM DEPT;      -- 부모테이블

SELECT *
FROM EMP;       -- 자식테이블

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- 두 테이블에 모두 포함되어 있는 중복된 컬럼이 아니더라도
-- 컬럼의 소속 테이블을 명시해 줄 수 있기를 권장한다.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--** 즉, 소속테이블을 명시하지 않으면 해당 SELECT를 찾기위해 여러 테이블을 조회한다.
--** 따라서 소속테이블을 명시함으로써 오라클에게 작업지시를 명확하게 하여, 불필요한 작업을 최소화한다.

--** 아우터조인에서 공통된 데이터를 가져올때 부모테이블이 아니면 셀렉트해서 가져올 수 없다.

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
/*
DEPTNO	DNAME	    ENAME	JOB	    SAL
40  	OPERATIONS	(null)	(null)  (null)  -- DEPTNO가 40	
*/

SELECT E.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--==>>
/*
DEPTNO	DNAME	    ENAME	JOB	    SAL
(null)	OPERATIONS	(null)	(null)  (null)	-- DEPTNO가 (null)
*/
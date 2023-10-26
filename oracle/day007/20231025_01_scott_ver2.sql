SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ HAVING ■■■--


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


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO;

-- 하나에 대한 조건이 아니라, 그룹으로 묶은 것들 각각엗대한 조건이므로 WHERE에 사용할 수 없다.
-- + 그룹에 대한 집계함수에 대한 조건은 HAVING을 통해 작성하도록 한다.
-- HAVING : 그룹에 대한 조건을 명시하는 절이다.



-- WHERE 절에는 그룹 각각에 대한 조건을 명시할 수 없으므로
-- 다음과 같은 에러가 발생했다.
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR 로 구성 가능.
    AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> 에러 발생
--     (ORA-00934: group function is not allowed here)

-- HAVING 절을 통해 그룹에 대한 조건을 명시하자,
-- 에러가 나지 않고 정상적으로 실행되는 것을 관찰 할 수가 있다.


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR 로 구성 가능.
GROUP BY DEPTNO 
HAVING SUM(SAL) < 10000;    -- 그룹에 대한 조건



-- 모든 절을 사용할 때 SELECT 문의 PARSING 순서를 항상 생각하도록 하자.
-- 구문을 작성하는 위치를 항상 준수해야만 한다.



SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR 로 구성 가능.
GROUP BY DEPTNO 
HAVING SUM(SAL) < 10000; 

-- FROM EMP 로 하고, HAVING에 추가 조건을 적용하면...
-- 첫 실행시 EMP 전체를 메모리에 퍼올리지만
-- FROM WHERE DEPTNO IN (20, 30) 으로 하게 되면
-- WHERE 절에 속한 데이터들만 메모리에 퍼올리므로... 
-- 첫 번째로 필요한 메모리들만 퍼올린 후에 후속 처리를 하는 것이 바람직 하므로
-- HAVING 조건에 WHERE 조건을 추가적으로 작성하게 되면 리소스를 더 크게 소모하므로...
-- 이렇게 작성하는 것은 바람직 하지 않다.



SELECT DEPTN, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000
    AND DEPTNO IN (20, 30);
    
SELECT *
FROM EMP;

-- HAVING 절에 추가적으로 20, 30 부서만 가져오도록 조건을 쓰는 것은 바람직하지 않다.
-- 필요한 데이터들은 20, 30 부서에 해당하는 데이터들 뿐인데
-- 첫 실행시 EMP 테이블의 데이터들을 모두 가져오기 때문이다.


    
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;

SELECT *
FROM EMP
WHERE DEPTNO IN (20, 30);

-- WHERE 절에 먼저 조건을 20, 30 부서만 가져오도록 작성하면
-- 필요한 데이터들만 먼저 메모리에 퍼올리므로 리소스 소모가 감소한다.


-- ※ 총정리 ------------------------------------------------------------------
-- HAVING 내부에 20, 30 부서만 가져오는 조건을 모두 작성하는 것이 아니라,
-- WHERE 절에 1차적으로 필요한 데이터들을 구분하는 조건을 먼저 작성한 후에
-- HAVING 절로 추가적인 SUM(SAL) < 10000 조건만을 적용시키는 것이 바람직하다.
-------------------------------------------------------------------------------




--------------------------------------------------------------------------------


--■■■ 중첩 그룹함수 / 분석함수 ■■■--


--※ 그룹 함수는 2 LEVEL 까지 중첩해서 사용할 수 있다.


SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
9400
10875
8750
*/


-- SUM() 집계함수를 다시 MAX() 집계함수로 감싸서 
-- 최종 최댓값 총합을 구한 것을 확인할 수 있다.

SELECT MAX(SUM(SAL)) "COL1"
FROM EMP
GROUP BY DEPTNO;
--==>> 10875




-- RANK() / DENSE_RANK()
-- ORACLE 9i 부터 적용... (MSSQL 2005 부터 적용...)

-- 이전 버전에서 RANK, 석차 구하려면 어떻게 해야하나?

--> 하위 버전에서는 RANK() 나 DENSE_RANK() 를 사용할 수 없기 때문에
--  이 함수를 활용하지 않는 다른 방법을 찾아야 한다.
--  예를 들어... 급여 순위를 구하고자 한다면...
--  해당 사원의 급여보다 더 큰 값이 몇 개인지 확인한 후
--  확인한 숫자에 『+ 1』 을 추가로 연산해 주면...
--  그 값이 곧 해당 사원의 등수가 된다.


SELECT ENAME, SAL
FROM EMP;
-- SMITH 의 SAL : 800
-- ALLEN 의 SAL : 1600


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;        -- SMITH 의 급여
--==>> 14               -- SMITH 의 급여 등수


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;       -- ALLEN 의 급여 
--==>> 7                -- ALLEN 의 급여 등수



-- 정체성은 서브쿼리...
-- 쿼리 안의 또다른 쿼리...
-- 서브 쿼리의 일종으로
-->> ◎ [INLINE VIEW] = 서브 쿼리가 외부 쿼리의 FROM 절에 위치하는 것.

--※ 서브 상관 쿼리(상관 서브 쿼리)
--  메인 쿼리가 있는 테이블의 컬럼이
--  서브 쿼리의 조건절(WHERE절, HAVING절) 에 사용되는 경우
--  우리는 이 쿼리문을 서브 상관 쿼리(상관 서브 쿼리)라고 부른다.


SELECT ENAME "사원명", SAL "급여", 1 "급여등수"
FROM EMP;

SELECT ENAME "사원명", SAL "급여", (1) "급여등수"
FROM EMP;

SELECT ENAME "사원명", SAL "급여",  (SELECT COUNT(*) + 1
                                    FROM EMP
                                    WHERE SAL > 800) "급여등수"
FROM EMP;




SELECT E.ENAME "사원명", E.SAL "급여",  (SELECT COUNT(*) + 1
                                        FROM EMP
                                        WHERE SAL > E.SAL) "급여등수"
FROM EMP E
ORDER BY 3;
--==>> 
/*
KING    	5000	1
FORD	    3000	2
SCOTT	3000	2
JONES	2975	    4
BLAKE	2850	    5
CLARK	2450	    6
ALLEN	1600	7
TURNER	1500	8
MILLER	1300	9
WARD    	1250	    10
MARTIN	1250    	10
ADAMS	1100	12
JAMES	950	    13
SMITH	800	    14

*/


-- 서브 상관 쿼리 내부에서 ("급여등수")
-- SAL > 800(SMITH의 SAL 값) 이었던 조건식을
-- 800 으로 고정된 상태가 아니라, SMITH부터 ~ KING 까지 모두 조회하고자 한다면
-- SAL 이 계속 변경되어야만 한다
-- 따라서, 외부의 FROM EMP 테이블의 EMP에 E라는 ALIAS를 붙여서
-- 서브 상관 커리 내부의 EMP 와, 외부 EMP 테이블을 구분지음으로써
-- E.SAL이 하나씩 변경될 때마다 등수를 비교하여 급여 등수를 확정지을 수 있도록
-- 처리한 것이다.

-- 즉, SELECT 문 안에는 서브 쿼리가 존재할 수 있고, 이를 서브 상관 쿼리라고 하며
-- 외부 메인 쿼리의 테이블과 같은 테이블을 서브 상관 쿼리에서 사용하고 있다면
-- ALIAS 를 사용하여 테이블을 구분지음으로써 원하는 처리를 할 수 있게 되는 것이다...




--○ EMP 테이블을 대상으로
--   사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다.
--   단, RANK() 함수를 사용하지 않고, 서브상관쿼리를 활용할 수 있도록 한다.




SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;


SELECT (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "전체급여등수"
FROM EMP E;


SELECT E.ENAME "사원명", E.SAL "급여", E.DEPTNO "부서번호"
        ,  (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > E.SAL) "전체급여등수"
FROM EMP E;


SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;







SELECT DEPTNO
  , SUM(SAL) "부서별급여"
FROM EMP
GROUP BY DEPTNO;


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;









SELECT E.ENAME "사원명", E.SAL "급여", E.DEPTNO "부서번호"
        ,  (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > E.SAL) "전체급여등수"
        ,  (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > E.SAL
                  AND
                  DEPTNO = E.DEPTNO) "부서내급여등수"
FROM EMP E
ORDER BY 부서번호 ASC, 부서내급여등수 ASC, 전체급여등수 ASC;



SELECT (
            SELECT COUNT(*) + 1
            FROM
            (
                SELECT DEPTNO
                     , SUM(SAL) "부서별급여"
                FROM EMP
                GROUP BY DEPTNO
            ) A
             WHERE T.부서별급여 < A.부서별급여
        ) "부서별급여순위"
        , T.DEPTNO "부서번호"
        , T.부서별급여
        
        
FROM
(    
    SELECT  DEPTNO
            , SUM(SAL) "부서별급여"
    FROM EMP
    GROUP BY DEPTNO
) T
ORDER BY 1 ASC;





SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;    -- SMITH 의 급여
--==>> 14           -- SMITH 의 급여 등수 (→ 전체급여등수)



SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800     -- SMITH 의 급여
  AND DEPTNO = 20;  -- SMITH 의 부서번호
--==>> 5            -- SMITH 의 급여 등수(→ 부서내급여등수)



SELECT ENAME "사원명", SAL "급여", DEPTNO "부서번호"
     , (1) "부서내급여등수"
     , (1) "전체급여등수"
FROM EMP;



-- SMITH의 부서내 급여등수, 전체급여등수
SELECT E.ENAME "사원명", E.SAL "급여", E.DEPTNO "부서번호"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL     -- SMITH 의 급여
          AND DEPTNO = E.DEPTNO) "부서내급여등수"
    
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "전체급여등수"
 
FROM EMP E;



SELECT E.ENAME "사원명", E.SAL "급여", E.DEPTNO "부서번호"
      , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL     -- SMITH 의 급여
          AND DEPTNO = E.DEPTNO) "부서내급여등수"
     
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "전체급여등수"
    
FROM EMP E
ORDER BY 3, 5;
--==>>
/*
KING	5000	10	1	1
CLARK	    2450	10	2	6
MILLER	    1300	10	3	9
SCOTT	    3000	20	1	2
FORD	        3000	20	1	2
JONES	    2975	20	3	4
ADAMS	    1100	20	4	12
SMITH	    800	20	5	14
BLAKE	    2850	30	1	5
ALLEN	    1600	30	2	7
TURNER	    1500	30	3	8
MARTIN	    1250	30	4	10
WARD	        1250	30	4	10
JAMES	    950	30	6	13
*/


SELECT *
FROM EMP
ORDER BY 5;

--○ EMP 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
                                - 각 부서 내에서 입사일자별로 누적된 급여의 합
--------- ------------- -------------- ---------- ----------------------------
 사원명      부서번호        입사일        급여        부서내입사별급여누적
--------- ------------- -------------- ---------- ----------------------------
 SMITH         20         1980-12-17      800             800
 JONES	       20	      1981-04-02	     2975            3775
 FORD          20         1981-12-03     3000            6775
------------------------------------------------------------------------------
 
*/

SELECT E.DEPTNO "부서번호"
         , E.SAL "급여"
         , E.HIREDATE "고용일자"
    
FROM 
(
    SELECT SAL
    FROM EMP
) T
, EMP E
WHERE E.SAL = T.SAL
ORDER BY DEPTNO ASC, HIREDATE ASC;





SELECT E.ENAME "사원명", E.SAL "급여", E.DEPTNO "부서번호"
      , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL     -- SMITH 의 급여
          AND DEPTNO = E.DEPTNO) "부서내급여등수"
     
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "전체급여등수"
    
FROM EMP E
ORDER BY 3, 5;








SELECT E.DEPTNO
    , E.SAL
    , E.ENAME 
    , E.HIREDATE
    ,  (SELECT SUM(SAL) 
        FROM EMP
        WHERE HIREDATE <= E.HIREDATE
              AND
              DEPTNO = E.DEPTNO) "부서내입사별급여누적"
FROM EMP E

ORDER BY DEPTNO ASC, HIREDATE ASC;



SELECT E.DEPTNO
    , E.SAL
    , E.ENAME 
    , E.HIREDATE
    , (SELECT SUM(SAL) 
        FROM EMP
        WHERE HIREDATE <= E.HIREDATE
              AND
              DEPTNO = E.DEPTNO) "부서내입사별급여누적"
FROM EMP E

ORDER BY DEPTNO ASC, HIREDATE ASC;



SELECT  (SELECT CASE WHEN HIREDATE = E.HIREDATE
                     THEN '라라'
                     WHEN HIREDATE < E.HIREDATE
                     THEN '루루'
                     ELSE '하하'
                END
         FROM EMP)
FROM EMP E;




SELECT EMP.ENAME "사원명", EMP.DEPTNO "부서번호", EMP.HIREDATE "입사일", EMP.SAL "급여"
     , (1) "부서내입사별급여누적"
FROM EMP
ORDER BY 2, 3;



SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
     , (1) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;


SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
     , (
        SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO
       ) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;




SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
     , (
        SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO
              AND
              E2.HIREDATE <= E1.HIREDATE
       ) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;

---==>>
/*
사원명	부서번호	입사일	급여	부서내입사별급여누적
CLARK	10	    1981-06-09	    2450	    2450
KING    	10	    1981-11-17	    5000	7450
MILLER	10	    1982-01-23	    1300	8750
SMITH	20	    1980-12-17	    800	    800
JONES	20	    1981-04-02	    2975	    3775
FORD	    20	    1981-12-03	    3000	6775
SCOTT	20	    1987-07-13	    3000	10875
ADAMS	20	    1987-07-13  	1100	10875
ALLEN	30	    1981-02-20	    1600	1600
WARD	    30	    1981-02-22	    1250	    2850
BLAKE	30	    1981-05-01	    2850	    5700
TURNER	30	    1981-09-08	    1500	7200
MARTIN	30	    1981-09-28	    1250	    8450
JAMES	30	    1981-12-03	    950	    9400
*/



--○ EMP 테이블을 대상으로
--  입사한 사원의 수가 가장 많았을 때의
--  입사년월과 인원수를 조회할 수 있도록 쿼리문을 구성한다.

SELECT 입사사원 수 가장많을 때 입사년월,
       입사사원 수 가장많을 때 인원수
FROM EMP;

SELECT EXTRACT(YEAR FROM HIREDATE) "입사일"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE EXTRACT(YEAR FROM HIREDATE) = EXTRACT(YEAR FROM E.HIREDATE);)
FROM EMP E;

SELECT EXTRACT(YEAR FROM HIREDATE)
FROM EMP;




FROM 
(  
    SELECT MAX(T.인원수)
    FROM
    (
        SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
             , COUNT(*) "인원수"
        FROM EMP
        GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
    ) T
) A








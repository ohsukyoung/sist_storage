SELECT USER
FROM DUAL;
--==>> SCOTT

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

--○ 롤백
ROLLBACK;

--○ 커밋을 안해서 수정전으로 돌아감
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울
*/

--○ 데이터 수정
UPDATE TBL_DEPT
SET DNAME = '연구부', LOC = '인천'
WHERE DEPTNO = 50;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ 데이터 수정 확인
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	연구부	인천
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 커밋해서 롤백해도 이전 데이터로 돌아가지 않음
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	연구부	인천
*/

--○ 데이터 삭제(DELETE -> TBL_DEPT)
DELETE TBL_DEPT
WHERE DEPTNO = 50;
--** 바로 삭제하지 않는다!
 
--○ 삭제할 내용 조회
SELECT *
FROM TBL_DEPT
WHERE DEPTNO = 50;
--==>> 50	연구부	인천

--○ 조회 후 삭제
DELETE TBL_DEPT
WHERE DEPTNO = 50;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 삭제 후 조회
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--------------------------------------------------------------------------------

--■■■ ORDER BY 절 ■■■--
--** 어떤 데이터가 먼저나오고 나중에 나오고는 관계형 데이터베이스에서는 크게 연관이 없음
--** 보기 좋으려고 정렬하면 안된다 -> 부하가 많이 걸림

-- FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP;
--==>>
/*
SMITH	20	CLERK	800	9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	2850	34200
CLARK	10	MANAGER	2450	29400
SCOTT	20	ANALYST	3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	1100	13200
JAMES	30	CLERK	950	11400
FORD	20	ANALYST	3000	36000
MILLER	10	CLERK	1300	15600
*/

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

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY DEPTNO;        -- DEPTNO -> 정렬 기준 : 부서번호
                        -- ASC    -> 정렬 유형 : 오름차순 -> 생략가능 ~!!!
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

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY DEPTNO DESC;   -- DEPTNO -> 정렬 기준 : 부서번호
                        -- DESC   -> 정렬 유형 : 내림차순
/*
BLAKE	30	MANAGER	2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	950	11400
SCOTT	20	ANALYST	3000	36000
JONES	20	MANAGER	2975	35700
SMITH	20	CLERK	800	9600
ADAMS	20	CLERK	1100	13200
FORD	20	ANALYST	3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
CLARK	10	MANAGER	2450	29400
*/

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 연봉 DESC;
--** FROM - WHERE - GRUOP BY - HAVING - SELECT - ORDER BY
--** '연봉'이라는 별칭을 기준으로 정렬가능 -> SELECT 가 ORDER BY보다 앞에 있어서
/*
KING	10	PRESIDENT	5000	60000
FORD	20	ANALYST	3000	36000
SCOTT	20	ANALYST	3000	36000
JONES	20	MANAGER	2975	35700
BLAKE	30	MANAGER	2850	34200
CLARK	10	MANAGER	2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	1100	13200
JAMES	30	CLERK	950	11400
SMITH	20	CLERK	800	9600
*/

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







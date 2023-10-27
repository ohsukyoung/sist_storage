SELECT USER
FROM DUAL;

--○ SELF JOIN(자기 조인)

SELECT *
FROM EMP;

/* 1-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- EMP 테이블의 데이터를 다음과 같이 조회할 수 있도록 쿼리문을 구성한다.
/*
---------------------------------------------------------
사원번호 사원명 직종명 관리자번호 관리자명 관리자직종명
7369     SMITH  CLERK   7902      FORD      ANALYST 
*/

SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E2.EMPNO "관리자번호" --E1.MGR "관리자번호" -- 주석처리된 것처럼 작성해도 되지만, 부모에 해당하는 테이블로 작성
     , E2.ENAME "관리자명", E2.JOB "관리자직종명"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO
ORDER BY 1;

SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E2.EMPNO "관리자번호" --E1.MGR "관리자번호" -- 주석처리된 것처럼 작성해도 되지만, 부모에 해당하는 테이블로 작성
     , E2.ENAME "관리자명", E2.JOB "관리자직종명"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
ORDER BY 1;

/*
7369	SMITH	CLERK	    7902	FORD	ANALYST
7499	ALLEN	SALESMAN	7698	BLAKE	MANAGER
7521	WARD	SALESMAN	7698	BLAKE	MANAGER
7566	JONES	MANAGER	    7839	KING	PRESIDENT
7654	MARTIN	SALESMAN	7698	BLAKE	MANAGER
7698	BLAKE	MANAGER	    7839	KING	PRESIDENT
7782	CLARK	MANAGER	    7839	KING	PRESIDENT
7788	SCOTT	ANALYST	    7566	JONES	MANAGER
7839	KING	PRESIDENT	(null)  (null)	(null)	
7844	TURNER	SALESMAN	7698	BLAKE	MANAGER
7876	ADAMS	CLERK	    7788	SCOTT	ANALYST
7900	JAMES	CLERK	    7698	BLAKE	MANAGER
7902	FORD	ANALYST	    7566	JONES	MANAGER
7934	MILLER	CLERK	    7782	CLARK	MANAGER
*/

SELECT *
FROM EMP E1;

SELECT *
FROM EMP E1, EMP E2
WHERE E1.EMPNO = E2.MGR
ORDER BY 1;

SELECT *
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
ORDER BY 1;

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*
---------------------------------------------------------
사원번호 사원명 직종명 관리자번호 관리자명 관리자직종명
EMPNO   ENAME   JOB     MRG        
                        EMPNO     ENAME     JOB
---------------------------------------------------------
7369     SMITH  CLERK   7902      FORD      ANALYST 
-------------------------------E1
                        -------------------------------E2
*/
SELECT 사원번호 사원명 직종명 관리자번호 관리자명 관리자직종명
FROM EMP;

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", EMPNO "관리자번호", ENAME "관리자명", JOB "관리자직종명"
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;
--> KING 이 회사의 대표여서 관리자번호가 NULL 이고, 위의 조건에서는 제외됨

--방법1)
SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E2.EMPNO "관리자번호", E2.ENAME "관리자명", E2.JOB "관리자직종명"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;

--방법2)
SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E2.EMPNO "관리자번호", E2.ENAME "관리자명", E2.JOB "관리자직종명"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);








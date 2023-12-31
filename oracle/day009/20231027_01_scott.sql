SELECT USER
FROM DUAL;

/* 1-문제 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_EMP 테이블에서 수당(커미션, COMM)이 가장 많은 사원의
--   사원번호, 사원명, 부서번호, 직종명, 커미션 항목을 조회한다.

SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM = (모든 직원 중 최고 커미션);

--모든 직원 중 최고 커미션
SELECT MAX(COMM)
FROM TBL_EMP;

--방법1 : MAX 사용
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >= (
                    SELECT MAX(COMM)
                    FROM TBL_EMP
              );
--==>> 7654	MARTIN	30	SALESMAN	1400

--방법2 : ALL 사용
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >=ALL (
                    SELECT COMM     -- 300, 500, (null), 1400, (null)...
                                    --** null 이기 때문에 검색이 되지 않는다.
                    FROM TBL_EMP
                 );
--방법2-1 : NVL을 SELECT 에 사용                 
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >=ALL (
                    SELECT NVL(COMM,0)
                    FROM TBL_EMP
                 );
--방법2-2 : WHERE 절을 사용해 NULL 아닐때 조건 추가             
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >=ALL (
                    SELECT NVL(COMM,0)
                    FROM TBL_EMP
                    WHERE COMM IS NOT NULL
                 );
--==>> 7654	MARTIN	30	SALESMAN	1400


--○ DISTINCT() 중복 행(레코드)을 제거하는 함수 --** 디스팅트

/* 2-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- TBL_EMP 테이블에서 관리자로 등록된 사원의
-- 사원번호, 사원명, 직종명을 조회한다.
--** 관리자(MGR)에 등록된 사원번호를 가진 사원

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = 'MANAGER';

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE 관리자로 등록된 사원;

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE 사원번호 MGR로 등록된 사원;

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN (7902, 7698, 7698, 7839, 7839, NULL, 7698, 7788, 7698, 7566, 7839, 7902); -- 등등..

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN ( SELECT MGR
                 FROM TBL_EMP ); -- 중복값이 들어감
--중복값을 제거하는 DISTINCT
SELECT DISTINCT(MGR)
FROM TBL_EMP;

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN ( SELECT DISTINCT(MGR)
                 FROM TBL_EMP );
                 
SELECT DISTINCT(JOB)
FROM TBL_EMP;

SELECT DISTINCT(DEPTNO)
FROM TBL_EMP;



--** SQL 관련된 내용은 거의 익혔다. 마무리 예정
--** TLSQL??

--------------------------------------------------------------------------------
SELECT *
FROM TBL_SAWON;

--○ TBL_SAWON 테이블 백업(데이터 위주) -> 각 테이블 간의 관계나 제약조건 등은 제외한 상태
--** AS 로 복사한 것은 관계를 제외하고 데이터만 백업한것

CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP이(가) 생성되었습니다.

-- TBL_SAWON 테이블의 데이터들만 백업을 수행
-- 즉, 다른 이름의 테이블로 저장해 둔 상황

--○ 데이터 수정
UPDATE TBL_SAWON
SET SANAME = '똘똘이';
COMMIT;
--** UPDATE와 SET만 사용해서 작업X
--** COMMIT 수행 전에 검색X

/* 3-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--** TBL_SAWON 테이블의 SANAME 값을 TBL_SAWONBACKUP의 SANAME의 값으로 바꾸는 쿼리를 구성한다. 
SELECT *
FROM TBL_SAWON;

ROLLBACK;

SELECT *
FROM TBL_SAWONBACKUP;

SELECT SANAME
FROM TBL_SAWON;

--(도움받아) 내가 푼 풀이
UPDATE TBL_SAWON T1
SET T1.SANAME = (SELECT T2.SANAME
                FROM TBL_SAWONBACKUP T2
                WHERE T1.SANO = T2.SANO);

UPDATE TBL_SAWON
SET SANAME = (SAWONBACKUP 테이블의 각각의 SANAME)
WHERE SANAME = '똘똘이';

--함께 푼 풀이
UPDATE TBL_SAWON
SET SANAME = (SELECT SANAME
                FROM TBL_SAWONBACKUP
                WHERE SANO=TBL_SAWON.SANO)
WHERE SANAME = '똘똘이';
















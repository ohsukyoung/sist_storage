SELECT USER
FROM DUAL;

/* 1-���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� ����(Ŀ�̼�, COMM)�� ���� ���� �����
--   �����ȣ, �����, �μ���ȣ, ������, Ŀ�̼� �׸��� ��ȸ�Ѵ�.

SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM = (��� ���� �� �ְ� Ŀ�̼�);

--��� ���� �� �ְ� Ŀ�̼�
SELECT MAX(COMM)
FROM TBL_EMP;

--���1 : MAX ���
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >= (
                    SELECT MAX(COMM)
                    FROM TBL_EMP
              );
--==>> 7654	MARTIN	30	SALESMAN	1400

--���2 : ALL ���
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >=ALL (
                    SELECT COMM     -- 300, 500, (null), 1400, (null)...
                                    --** null �̱� ������ �˻��� ���� �ʴ´�.
                    FROM TBL_EMP
                 );
--���2-1 : NVL�� SELECT �� ���                 
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >=ALL (
                    SELECT NVL(COMM,0)
                    FROM TBL_EMP
                 );
--���2-2 : WHERE ���� ����� NULL �ƴҶ� ���� �߰�             
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >=ALL (
                    SELECT NVL(COMM,0)
                    FROM TBL_EMP
                    WHERE COMM IS NOT NULL
                 );
--==>> 7654	MARTIN	30	SALESMAN	1400


--�� DISTINCT() �ߺ� ��(���ڵ�)�� �����ϴ� �Լ� --** ����Ʈ

/* 2-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- TBL_EMP ���̺��� �����ڷ� ��ϵ� �����
-- �����ȣ, �����, �������� ��ȸ�Ѵ�.
--** ������(MGR)�� ��ϵ� �����ȣ�� ���� ���

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = 'MANAGER';

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE �����ڷ� ��ϵ� ���;

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE �����ȣ MGR�� ��ϵ� ���;

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN (7902, 7698, 7698, 7839, 7839, NULL, 7698, 7788, 7698, 7566, 7839, 7902); -- ���..

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN ( SELECT MGR
                 FROM TBL_EMP ); -- �ߺ����� ��
--�ߺ����� �����ϴ� DISTINCT
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



--** SQL ���õ� ������ ���� ������. ������ ����
--** TLSQL??

--------------------------------------------------------------------------------
SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺� ���(������ ����) -> �� ���̺� ���� ���質 �������� ���� ������ ����
--** AS �� ������ ���� ���踦 �����ϰ� �����͸� ����Ѱ�

CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP��(��) �����Ǿ����ϴ�.

-- TBL_SAWON ���̺��� �����͵鸸 ����� ����
-- ��, �ٸ� �̸��� ���̺�� ������ �� ��Ȳ

--�� ������ ����
UPDATE TBL_SAWON
SET SANAME = '�ʶ���';
COMMIT;
--** UPDATE�� SET�� ����ؼ� �۾�X
--** COMMIT ���� ���� �˻�X

/* 3-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--** TBL_SAWON ���̺��� SANAME ���� TBL_SAWONBACKUP�� SANAME�� ������ �ٲٴ� ������ �����Ѵ�. 
SELECT *
FROM TBL_SAWON;

ROLLBACK;

SELECT *
FROM TBL_SAWONBACKUP;

SELECT SANAME
FROM TBL_SAWON;

--(����޾�) ���� Ǭ Ǯ��
UPDATE TBL_SAWON T1
SET T1.SANAME = (SELECT T2.SANAME
                FROM TBL_SAWONBACKUP T2
                WHERE T1.SANO = T2.SANO);

UPDATE TBL_SAWON
SET SANAME = (SAWONBACKUP ���̺��� ������ SANAME)
WHERE SANAME = '�ʶ���';

--�Բ� Ǭ Ǯ��
UPDATE TBL_SAWON
SET SANAME = (SELECT SANAME
                FROM TBL_SAWONBACKUP
                WHERE SANO=TBL_SAWON.SANO)
WHERE SANAME = '�ʶ���';
















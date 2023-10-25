SELECT USER
FROM DUAL;
--==>> SCOTT

--------------------------------------------------------------------------------
--�� RANK() -> ���(����)�� ��ȯ�ϴ� �Լ�

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����"   --** �޿� �������� ���� ��� �ű��
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

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
     , RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����"
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

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
     , RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����"
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

--�� DENSE_RANK() -> ������ ��ȯ�ϴ� �Լ�

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����"
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

/* 1-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺��� ��� �����͸�
--     �����, �μ���ȣ, ����, �μ�����������, ��ü�������� �׸����� ��ȸ�Ѵ�.
SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC) "�μ�����������"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
FROM EMP;

SELECT T.*
     , RANK() OVER(PARTITION BY T."�μ���ȣ" ORDER BY T."����" DESC) "�μ�����������"
     , RANK() OVER(ORDER BY T."����" DESC) "��ü��������"
FROM
(
     SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
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

/* 2-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺��� ��ü���������� 1����� 5�������..
--   �����, �μ���ȣ, ����, ��ü�������� �׸����� ��ȸ�Ѵ�.
SELECT T.*
FROM(
    SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
         , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
    FROM EMP
) T
WHERE T."��ü��������" BETWEEN 1 AND 5;

/* 2-�Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
     , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "��ü��������"
FROM EMP
WHERE ��ü�������� 1����� 5�����;

SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
     , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "��ü��������"
FROM EMP
WHERE RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) <= 5;
--==>> �����߻�(ORA-30483: window  functions are not allowed here)

--�� ���� ������ RANK() OVER() �Լ��� WHERE ���������� ����� ����̸�...
--   �� �Լ��� WHERE ���������� ����� �� ���� ������ �߻��ϴ� �����̴�.
--   �� ���, �츮�� INLINE VIEW �� Ȱ���ؼ� Ǯ���ؾ� �Ѵ�.

SELECT T.*
FROM
(
    SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
         , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "��ü��������"
    FROM EMP
) T
WHERE T."��ü��������" <= 5;

--�� EMP ���̺��� �� �μ����� ���� ����� 1�� ���� 2�� ������ ��ȸ�Ѵ�.
--   �����, �μ���ȣ, ����, �μ����������, ��ü������� �׸���
--   ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

SELECT T.*
FROM
(
    SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
         , RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM,0)) DESC) "�μ����������"
         , RANK() OVER(ORDER BY (SAL*12+NVL(COMM,0)) DESC) "��ü�������"
    FROM EMP
) T
WHERE T."�μ����������" <=2 ;



SELECT T2.*
FROM
(
    SELECT T1.*
         , RANK() OVER(PARTITION BY T1."�μ���ȣ" ORDER BY T1."����" DESC) "�μ����������"
         , RANK() OVER(ORDER BY T1."����" DESC) "��ü�������"
    FROM
    (
    SELECT ENAME "�����", DEPTNO "�μ���ȣ", SAL*12+NVL(COMM,0) "����"
    FROM EMP
    ) T1
) T2
WHERE T2."�μ����������" <=2 ;
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
FORD	20	36000	1	2
SCOTT	20	36000	1	2
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
*/

--�� ����
-- LN() �ڿ� �α� ������~!!!
SELECT LN(95) "COL1"
FROM DUAL;
--==>> 4.55387689160054083460978676511404117675

--�� �߰�
--�� TRIM()
SELECT TRIM('          TEST           ') "COL1"
    , LTRIM('          TEST           ') "COL2"
    , RTRIM('          TEST           ') "COL3"
FROM DUAL;
--==>> TEST	TEST           	          TEST

--���� �׷� �Լ� ����--

-- SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪, MIN() �ּҰ�
-- ,VARIENCE() �л�, STDDEV() ǥ������

--�� �׷��Լ��� ���� ū Ư¡
--   ó���ؾ� �� �����͵� �� NULL�� �����Ѵٸ�(���ԵǾ� �ִٸ�)
--   �� NULL�� ������ ���·� ������ �����Ѵٴ� ���̴�.
--   ��, NULL�� ������ ��󿡼� ���ܵȴ�.

--�� SUM() ��
-- EMP ���̺��� ������� ��ü ������� �޿� �� ���� ��ȸ�Ѵ�.
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

--�� COUNT() ��(���ڵ�)�� ���� ��ȸ -> �����Ͱ� �� ������... Ȯ��...
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)
FROM EMP;
--==>> 4

SELECT COUNT(*)
FROM EMP;
--==>> 14
-- COUNT�� �����Ҷ��� NULL �� ��ȸ���� ���� �� �����Ƿ� (*)���� ��ȸ

--�� AVG() ��� ��ȯ
SELECT AVG(SAL) "COL1"
     , SUM(SAL) / COUNT(SAL) "COL2"
     , 29025 / 14 "COL3"
FROM EMP;
--==>> 2073.214285714285714285714285714285714286	2073.214285714285714285714285714285714286

SELECT AVG(COMM) "COL1"
     , SUM(COMM) / COUNT(COMM) "COL2"
     , 2200 / 4 "COL3"  -- NULL�� �����ϰ� ����
     , 2200 / 14 "COL4" -- ����
FROM EMP;

--�� �����Ͱ� NULL�� �÷��� ���ڵ�� ���� ��󿡼� ���ܵǱ� ������
-- �����Ͽ� ���� ó���ؾ� �Ѵ�.

SELECT SUM(COMM) / COUNT(*) "COL1"
FROM EMP;
--==>> 157.142857142857142857142857142857142857

-- VARIANCE() / STDDEV()
-- �� ǥ�������� ������ �л�, �л��� �������� ǥ������

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
-- �ִ밪 / �ּҰ� ��ȯ
SELECT MAX(SAL) "COL1"
     , MIN(SAL) "COL2"
FROM EMP;
--==>>800

--�� ����
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> �����߻�(ORA-00937: not a single-group group function)

SELECT ENAME
FROM EMP;

SELECT SUM(SAL)
FROM EMP;
--==>> 29025

SELECT DEPTNO, SUM(SAL) --** DEPTNO : 14��, SUM(SAL)�� ���ϰ�
FROM EMP;
--==>> ���� �߻�(ORA-00937: not a single-group group function)

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
10	2450 ��
10	5000 ��10
10	1300 ��
20	2975 ��
20	3000 ��
20	1100 ��20
20	800  ��
20	3000 ��
30	1250 ��
30	1500 ��
30	1600 ��30
30	950  ��
30	2850 ��
30	1250 ��
*/

--�� ���� ���̺� ����
DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����(����)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--�� �ǽ� ������ �߰� �Է�
INSERT INTO TBL_EMP VALUES
(8001, '������', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP VALUES
(8002, '���ϼ�', 'CLERK', 7566, SYSDATE, 2000, 10, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP VALUES
(8003, '�����', 'SALESMAN', 7698, SYSDATE, 1700, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP VALUES
(8006, '������', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP VALUES
(8007, '�ڳ���', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
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
8001	������	CLERK	    7566	2023-10-24	1500	10	    (null)
8002	���ϼ�	CLERK	    7566	2023-10-24	2000	10	    (null)
8003	�����	SALESMAN	7698	2023-10-24	1700	(null)  (null)	
8006	������	SALESMAN	7698	2023-10-24	2500	(null)  (null)
8007	�ڳ���	SALESMAN	7698	2023-10-24	1000	(null)  (null)
*/

--�� Ŀ��
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

-- ����Ŭ������ NULL�� ���� ū ������ �����Ѵ�.
-- (ORACLE 9I ������ NULL�� ���� ���� ������ �����߾���.)
-- (MSSQL �� NULL�� ���� ���� ������ �����Ѵ�.)

--�� TBL_EMP ���̺��� ������� �μ��� �޿��� ��ȸ
--   �μ���ȣ, �޿��� �׸�  ��ȸ
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
/*
10	    8750
20	    10875
30	    9400
(null)	8700     -- �μ���ȣ�� NULL �� ������� �޿���
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
	8700  -- �μ���ȣ�� NULL �� ������� �޿���
	37725 -- ���μ� �������� �޿���
*/

/*
10	    8750
20	    10875
30	    9400
����	8700 
*/

/*
10	    8750
20	    10875
30	    9400
����	8700 
*/

/*
10	        8750
20	        10875
30	        9400
����	    8700
���μ�	37725
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
	29025
*/

/* 3- ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*
10	        8750
20	        10875
30	        9400
���μ�	29025
*/
-- EMP ���̺��� ������� ���� ���� ��ȸ�ǵ��� �������� �����Ѵ�.  

/* 3- ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT CASE WHEN DEPTNO IS NULL THEN '���μ�'
            ELSE TO_CHAR(DEPTNO)
       END
     , SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

SELECT NVL(TO_CHAR(DEPTNO),'���μ�') "�μ���ȣ"
     , SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

/* 3-�Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'���μ�') "�μ���ȣ"
     , SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO),'���μ�') "�μ���ȣ"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
���μ�	8700
���μ�	37725
*/

-- GROUPING()
SELECT GROUPING(DEPTNO), DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

/*
GROUPING(DEPTNO)	�μ���ȣ	�޿���
0	                    10	    8750
0	                    20	    10875
0	                    30	    9400
0	                (null)	    8700
1	                (null)	    37725
*/
/*
�μ���ȣ	�޿���
10	    8750
20	    10875
30	    9400
(null)	    8700
(null)	    37725
*/

/* 4- ���� & �Բ� Ǭ Ǯ�� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*
�μ���ȣ	�޿���
10	     8750
20	     10875
30	     9400
����	 8700
���μ� 37725
*/
-- �̿� ���� ��ȸ�ǵ��� �������� �����Ѵ�.

SELECT CASE WHEN GROUPING(DEPTNO) = 0 AND DEPTNO IS NOT NULL THEN TO_CHAR(DEPTNO)
            WHEN GROUPING(DEPTNO) = 0 AND DEPTNO IS NULL THEN '����'
            WHEN GROUPING(DEPTNO) = 1 THEN '���μ�'
            ELSE '-1'
       END "�μ���ȣ"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

SELECT NVL(TO_CHAR(DEPTNO), CASE GROUPING(DEPTNO) WHEN 0 THEN '���Ϻμ�' ELSE '���μ�' END) "�μ���ȣ" 
    , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

--����Ʈ
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN '���Ϻμ�' ELSE '���μ�' END "�μ���ȣ"
    , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
���Ϻμ�	8750
���Ϻμ�	10875
���Ϻμ�	9400
���Ϻμ�	8700
���μ�	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN DEPTNO ELSE '���μ�' END "�μ���ȣ"
    , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> ���� �߻�(ORA-00932: inconsistent datatypes: expected NUMBER got CHAR)

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN TO_CHAR(DEPTNO) ELSE '���μ�' END "�μ���ȣ"
    , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
	8700
���μ�	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'����') ELSE '���μ�' END "�μ���ȣ"
    , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
����	8700
���μ�	37725
*/

/* 5- ���� & �Բ� Ǭ Ǯ�� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� �������
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
����       �޿���
-------  ---------
��         XXXX
��        XXXXX
����� XXXXXX
*/
 
SELECT NVL(T.����,'�����') "����", SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '��'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '��'
                ELSE '��3�� ��'
           END "����"
         , SAL "�޿�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);

SELECT CASE GROUPING(T.����) WHEN 0 THEN T.����
            ELSE '�����'   
       END "����"
     , SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '��'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '��'
                ELSE '��3�� ��'
           END "����"
         , SAL "�޿�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);

--�� TBL_SAWON ���̺��� �������
--    ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
    
/*
���ɴ�     �ο���
10          X
20          X
50          X
��ü        X
*/
���� �⵵ - ������� = ���糪��
SELECT NVL(TO_CHAR(T.����),'��ü') "���ɴ�" , COUNT(T.����) "�ο���"
FROM(
    SELECT TRUNC(EXTRACT(YEAR FROM SYSDATE) - DECODE(SUBSTR(JUBUN,7,1),'3',2000,'4',2000,'1',1900,'2',1900,0) - SUBSTR(JUBUN,1,2) +1,-1) "����"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);

-- ���1. -> INLINE VIEW �� �� �� ��ø
SELECT NVL(TO_CHAR(T2.���ɴ�),'��ü') "���ɴ�" , COUNT(T2.���ɴ�) "�ο���"
FROM
(
    -- ���ɴ�
    SELECT CASE WHEN T1.���� >= 50 THEN 50
                WHEN T1.���� >= 40 THEN 40
                WHEN T1.���� >= 30 THEN 30
                WHEN T1.���� >= 20 THEN 20
                WHEN T1.���� >= 10 THEN 10
                ELSE 0
           END "���ɴ�"
    FROM
    (
        -- ����
        SELECT CASE WHEN SUBSTR(JUBUN, 7,1) IN ('1','2')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899)
            WHEN SUBSTR(JUBUN, 7,1) IN ('3','4')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
            ELSE -1
        END "����"
        FROM TBL_SAWON
    ) T1
) T2
GROUP BY ROLLUP(T2.���ɴ�);

-- ���2. -> INLINE VIEW �� �� ���� ���
SELECT CASE GROUPING(T.���ɴ�) WHEN 0 THEN TO_CHAR(T.���ɴ�) 
                               ELSE '��ü'
       END "���ɴ�2"
      ,COUNT(*) "�ο���"
FROM
(
    SELECT TRUNC(CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899)
                WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
                ELSE -1
           END,-1) "���ɴ�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.���ɴ�);

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
10	    CLERK	    1300    - 10�� �μ� CLERK ������ �޿� ��
10	    MANAGER	    2450    - 10�� �μ� MANGER ������ �޿� ��
10	    PRESIDENT	5000
10	    (null)	    8750    - 10�� �ּ� ��� ������ �޿� ��
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400
(null)	(null)	    29025   - ��� ���� ��� �μ��� �޿� ��
*/

--�� CUBE() -> ROLLUP() ���� �� �ڼ��� ����� ��ȯ�޴´�.
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
(null)	ANALYST	    6000    - ��� �μ� ANALYST ������ �޿��� -- �߰�
(null)	CLERK	    4150    - ��� �μ� CLECK ������ �޿���
(null)	MANAGER	    8275    - ��� �μ� MANAGER ������ �޿���
(null)	PRESIDENT	5000    - ��� �μ� PRESIDNT ������ �޿���
(null)	SALESMAN	5600
(null)	(null)	    29025
*/
-- �� ROLLUP()�� CUBE() �� �׷��� �����ִ� ����� �ٸ���.(����)

--EX.

--ROLLUP(A,B,C)
-- -> (A,B,C) / (A,B) / (A) / ()

--CUBE(A,B,C)
-- -> (A,B,C) / (A,B) / (A,C) / (B,C) / (A)/ (B)/ (C) {}

--> ���� ����(ROLLUP())�� ���� ����� �ټ� ���ڶ� ���� �ְ�
-- �Ʒ��� ����(CUBE())�� ���� ����� ������ĥ ���� �ֱ� ������
-- ������ ���� ����� ������ �� ���� ����ϰ� �ȴ�.
-- ���� �ۼ��ϴ� ������ ��ȸ�ϰ� ���ϴ� �׷츸
-- <GROUPING SETS>�� ����Ͽ� ���������� ������

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
      END "�μ���ȣ"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '��ü����'
     END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	    3500
����	    SALESMAN	5200
����	    ��ü����	8700
��ü�μ�	��ü����	37725

*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
      END "�μ���ȣ"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '��ü����'
     END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;

/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	    3500
����	    SALESMAN	5200
����	    ��ü����	8700
��ü�μ�	ANALYST	    6000
��ü�μ�	CLERK	    7650
��ü�μ�	MANAGER	    8275
��ü�μ�	PRESIDENT	5000
��ü�μ�	SALESMAN	10800
��ü�μ�	��ü����	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
      END "�μ���ȣ"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '��ü����'
     END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())
ORDER BY 1,2;
--==>> CUBE()�� ����� ����� ���� ��� ��ȯ

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
      END "�μ���ȣ"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '��ü����'
     END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())
ORDER BY 1,2;
--==>> RULLUP() �� ����� ����� ���� ��� ��ȯ

--------------------------------------------------------------------------------
/* 6- ���� & �Բ� Ǭ Ǯ�� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� �������
--   �Ի�⵵�� �ο����� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP;

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵", COUNT(*) "�ο�"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE);
/*
1982	1
2023	5
1987	2
1980	1
1981	10
*/

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;

SELECT TO_CHAR(HIREDATE, 'YYYY') "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY')
ORDER BY 1;

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY')
ORDER BY 1;
--==>> �����߻�: GROUP BY�� SELECT�� ���� �������

SELECT TO_CHAR(HIREDATE, 'YYYY') "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
--==>> �����߻�(ORA-00979: not a GROUP BY expression)

SELECT TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY')) "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
--==>> �����߻�(ORA-00979: not a GROUP BY expression)

SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0
            THEN TO_CHAR(HIREDATE, 'YYYY')
            ELSE '��ü'
        END "�Ի�⵵"
    , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY') --> '��ü'�� ����ؾ� �ϱ� ������ , EXTRACT(YEAR FROM HIREDATE) ���x
ORDER BY 1;

--** GROUP BY�� ���ǿ� ������ Ÿ�� ����
--** GROUP BY ���� ������ ����� ����(EX. EXTRACT�̸�, EXTRACT��)
--** �ܼ��� ���� ����ٰ� �ؼ� �ذ���� ����












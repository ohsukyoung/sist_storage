SELECT USER
FROM DUAL;
--==>> SCOTT

/* 20231018-7-���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ����� �ʴ� ��������
--    �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�.
DESC TBL_EMP;

SELECT EMPNO "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE 20�� �μ��� �ٹ����� �ʴ�;

SELECT EMPNO "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE �μ���ȣ�� 20���� �ƴϴ�;

SELECT EMPNO "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE DEPTNO != 20;
    
SELECT EMPNO "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE DEPTNO <> 20;

SELECT EMPNO "�����", JOB "������", DEPTNO "�μ���ȣ"
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

/* 1-���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� Ŀ�̼��� NULL �� �ƴ� ��������
--  �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
/* 1-���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE Ŀ�̼��� NULL�� �ƴ�;

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM�� NULL�� �ƴ�;

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
--WHERE COMM != NULL;
--WHERE COMM <> NULL;
WHERE COMM ^= NULL;
==>> ��ȸ��� ����

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM IS NULL;     -- && -> AND    || -> OR    ! -> NOT

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--** NOT�� ������ �Űܵ� �������� ����
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

/* 2-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� ��� �������                           --** �������:  WHERE ������ ���ٴ� ��
--    �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--    ��, �޿�(SAL)�� �ſ� �����Ѵ�.
--    ����, ����(COMM)�� �� 1ȸ �����ϸ�, ���� ������ ���Եȴ�.
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�", �޿�*12+���� 
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�", (SAL*12)+COMM "�޿�" 
FROM TBL_EMP;
--==>> ���� �������ϳ�,  COMM �� NULL �� ��� ���� NULL�� ������ ������ ����

--�� NVL()
--ù ��° �Ķ���� ���� NULL �̸�, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.
--ù ��° �Ķ���� ���� NULL �� �ƴϸ�, �� ���� �״�� ��ȯ�Ѵ�.
SELECT NULL "COL1", NVL(NULL,10) "COL2", NVL(5, 10) "COL3"
FROM DUAL;
--==>> (NULL)	10	5

SELECT ENAME "�����", COMM "����"
FROM TBL_EMP;

SELECT ENAME "�����", NVL(COMM,1234) "����"
FROM TBL_EMP;


SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
        , SAL*12+NVL(COMM,0) "����" 
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

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
        , NVL(SAL*12*COMM, SAL*12) "����" 
FROM TBL_EMP;

--�� NVL2()
--> ù ��° �Ķ���� ���� NULL �� �ƴ� ���, �� ��° �Ķ���� ���� ��ȯ�ϰ�
--  ù ��° �Ķ���� ���� NULL �� ���, �� ��° �ĸ����� ���� ��ȯ�Ѵ�.
SELECT ENAME "�����", NVL2(COMM, 'û��÷�', '���÷�')"����Ȯ��"
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
        , NVL2(COMM, SAL*12+COMM, SAL*12) "����"
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
        , SAL*12+NVL2(COMM, COMM, 0) "����"
FROM TBL_EMP;

--�� COALESCE()
--> �Ű����� ������ ���� ���·� �����ϰ� Ȱ���Ѵ�.
--  �� �տ� �ִ� �Ű��������� ���ʷ� NULL ���� �ƴ��� Ȯ���Ͽ�
--  NULL �� �ƴ� ��� �� ���� ��ȯ�ϰ�,
--  NULL �� ��쿡�� �� ���� �Ű������� ���� ��ȯ�Ѵ�.
--  NVL()�̳� NVL2() �� ������ ��
--  ��~~~~ �� ����� ���� ����� �� �ִٴ� Ư¡�� ���´�.

SELECT NULL"COL1"
    , COALESCE(NULL, NULL, NULL, 40) "COL2"
    , COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100) "COL3"
    , COALESCE(NULL, NULL, 30, NULL, NULL, 60) "COL4"
    , COALESCE(10, NULL, NULL, NULL, NULL, 60) "COL5"
FROM DUAL;
--==>> 	40	100	30	10

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '��Ѹ�', 'SALESMAN', 7369, SYSDATE, 10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO,COMM)
VALUES(8001, '�ڶ�ġ', 'SALSESMAN',7369, SYSDATE, 10, 10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_EMP;
/*
8000	��Ѹ�	SALESMAN	7369	2023-10-19	(NULL)	(NULL)	10
8001	�ڶ�ġ	SALSESMAN	7369	2023-10-19	(NULL)	10	    10
*/

--�� Ŀ��
COMMIT;
--==> Ŀ�� �Ϸ�.

/* 3-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� ��� �������
--    �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--    ��, �޿�(SAL)�� �ſ� �����Ѵ�.
--    ����, ����(COMM)�� �� 1ȸ �����ϸ�, ���� ������ ���Եȴ�.
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
        ,COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "����"
FROM TBL_EMP;

--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� �÷��� �÷��� ����(����)
SELECT 1,2
FROM DUAL;
--==>> 1	2

SELECT 1+2
FROM DUAL;
--** ������ �����̶�� ���� �����, �ϳ��� �÷��� ������ ���� ��

SELECT '��Ѹ�', '�ڶ�ġ'
FROM DUAL;

SELECT '��Ѹ�' + '�ڶ�ġ'
FROM DUAL;
--=>> �����߻�(ORA-01722: invalid number)

SELECT '��Ѹ�' || '�ڶ�ġ'
FROM DUAL;
--==>> ��Ѹ��ڶ�ġ

SELECT ENAME, JOB
FROM TBL_EMP;

SELECT ENAME || JOB
FROM TBL_EMP;
--==>>
/*
SMITHCLERK
ALLENSALESMAN
WARDSALESMAN
JONESMANAGER
MARTINSALESMAN
BLAKEMANAGER
CLARKMANAGER
SCOTTANALYST
KINGPRESIDENT
TURNERSALESMAN
ADAMSCLERK
JAMESCLERK
FORDANALYST
MILLERCLERK
��Ѹ�SALESMAN
�ڶ�ġSALSESMAN
*/

SELECT '�ູ�̴�', SYSDATE, '�� ���� ', 500, ' ���� ���Ѵ�.'
FROM DUAL;
--==>> �ູ�̴�	2023-10-19 10:41:18	�� ���� 	500	 ���� ���Ѵ�.
--     -------- ------------------- -------     ---- -------------
--      ����Ÿ�� ��¥Ÿ��           ����Ÿ��  ����Ÿ�� ����Ÿ��

--�� ���� ��¥ �� �ð��� ��ȯ�ϴ� �Լ�
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>> 2023-10-19 10:43:40	2023-10-19 10:43:40	23/10/19 10:43:40.000000000

SELECT '�ູ�̴�' || SYSDATE || '�� ���� ' || 500 || ' ���� ���Ѵ�.'
FROM DUAL;
--==>> �ູ�̴�2023-10-19 10:44:55�� ���� 500 ���� ���Ѵ�.

--�� ����Ŭ������ ���� Ÿ���� ���·� ��(TYPE)�� ��ȯ�ϴ� ������ ���� ����
--    ��||�� �� ������ �ָ� ������ �÷��� �÷�(���� �ٸ� ������ ������)��
--    �����ϴ� ���� �����ϴ�.
--    cf) MSSQL ������ ��� �����͸� ���ڿ��� CONVERT �ؾ� �Ѵ�.

�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session��(��) ����Ǿ����ϴ�.


/* 4-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� �����͸� Ȱ���Ͽ�
--    ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.
--    <SMITH�� ���� ������ 9600�ε� ��� ������ 19200�̴�.
--     SLLEN�� ���� ������ 19500�ε� ��� ������ 390000�̴�.
--     
--     �ڶ�ġ�� ���� ������ 10�ε� ��� ������ 20�̴�.> 
--    ��, ���ڵ帶�� ���� ���� ������ �� �÷��� ��� ��ȸ�� �� �ֵ��� ó���Ѵ�.
SELECT *
FROM TBL_EMP;

SELECT ENAME || '�� ���� ������ ' || COALESCE(SAL*12+COMM,SAL*12,COMM,0) || 
              '�ε� ��� ������ ' || COALESCE(SAL*12+COMM,SAL*12,COMM,0)*2 || '�̴�.'
FROM TBL_EMP;

/* 5-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� �����͸� Ȱ���Ͽ�
--    ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.
--    <SMITH's �Ի����� 1980-12-17�̴�. �׸��� �޿��� 800�̴�.
--     ALLEN's �Ի����� 1981-02-20�̴�. �׸��� �޿��� 1600�̴�.
--     
--     �ڶ�ġ's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 0�̴�.>
--    ��, ���ڵ帶�� ���� ���� ������ �� �÷��� ��� ��ȸ�� �� �ֵ��� ó���Ѵ�.
SELECT ENAME || '''s �Ի����� ' || SYSDATE || '�̴�. �׸��� �޿��� ' || NVL(SAL,0) || '�̴�.' 
FROM TBL_EMP;

--�� ���ڿ��� ��Ÿ���� Ȭ����ǥ ���̿���(���۰� ��)
--    Ȭ����ǥ �� ���� Ȭ����ǥ �ϳ�(���۽�Ʈ����)�� �ǹ��Ѵ�.
--    Ȭ����ǥ �ϳ�(<'>)�� ���ڿ��� ������ ��Ÿ����,
--    Ȭ����ǥ �ΰ�(<''>)�� ���ڿ� ���� �ȿ��� ���۽�Ʈ���Ǹ� ��Ÿ����
--    �ٽ� �������� �����ϴ� Ȭ����ǥ �ϳ�(<'>)�� ���ڿ� ������ ���Ḧ �ǹ��ϰ� �Ǵ� ���̴�.
    
--==>>
/*
SMITH's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 800�̴�.
ALLEN's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 1600�̴�.
WARD's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 1250�̴�.
JONES's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 2975�̴�.
MARTIN's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 1250�̴�.
BLAKE's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 2850�̴�.
CLARK's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 2450�̴�.
SCOTT's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 3000�̴�.
KING's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 5000�̴�.
TURNER's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 1500�̴�.
ADAMS's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 1100�̴�.
JAMES's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 950�̴�.
FORD's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 3000�̴�.
MILLER's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 1300�̴�.
��Ѹ�'s �Ի����� 2023-10-19�̴�. �׸��� �޿��� 0�̴�.
�ڶ�ġ's �Ի����� 2023-10-19�̴�. �׸��� �޿��� 0�̴�.
*/

SELECT *
FROM TBL_EMP
WHERE JOB = 'SALESMAN';
--==>>
/*
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	    30
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
8000	��Ѹ�	SALESMAN	7369	2023-10-19	(NULL)	(NULL)	10
*/

SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';
--==>> ��ȸ��� ����

SELECT *
FROM TBL_EMP
WHERE JOB = 'Salesman';
--==>> ��ȸ��� ����

--�� UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "COL1"
    , UPPER('oRaCLe') "COL2"
    , LOWER('oRaCLe') "COL3"
    , INITCAP('oRaCLe') "COL3"
FROM DUAL;
--==>>oRaCLe	ORACLE	oracle	Oracle
--UPPER() �� ��� �빮�ڷ� ��ȯ
--LOWER() �� ��� �ҹ��ڷ� ��ȯ
--INITCAP() �� ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ

--�� �ǽ��� ���� �߰� ������ �Է�
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '���ϼ�', 'salesman', 7369, SYSDATE,20,100);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_EMP;
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
8000	��Ѹ�	SALESMAN	7369	2023-10-19			10 -> �����
8001	�ڶ�ġ	SALSESMAN	7369	2023-10-19		10	10 -> �ټ���
8002	���ϼ�	salesman	7369	2023-10-19		100	20
*/
     
/* 6-���� & ����Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� ������� �������(�������)��
--    �����ȣ, �����, �������� ��ȸ�Ѵ�.
--    ����, �˻����� 'sALeSmAN' �� �������� �˻��� �����ϴ���
--    �ش� ������� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������"
FROM TBL_EMP
WHERE JOB = UPPER('sALeSmAN') OR JOB = LOWER('sALeSmAN');

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������"
FROM TBL_EMP
WHERE UPPER(JOB) = 'SALESMAN';

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������"
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	�����	SALESMAN
8001	�ټ���	SALESMAN
8002	���ϼ�	salesman
*/

/* 6-���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE ������ 'sALeSmAN';

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = UPPER('sALeSmAN');
==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	�����	SALESMAN
8001	�ټ���	SALESMAN
*/

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = LOWER('sALeSmAN');
--==>>
/*
8002	���ϼ�	salesman
*/

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = LOWER('sALeSmAN') OR JOB = UPPER('sALeSmAN');
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	�����	SALESMAN
8001	�ټ���	SALESMAN
8002	���ϼ�	salesman
*/

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');
--WHERE LOWER(JOB) = LOWER('sALeSmAN');     -- ����
--WHERE INITCAP(JOB) = INITCAP('sALeSmAN'); -- ����
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	�����	SALESMAN
8001	�ټ���	SALESMAN
8002	���ϼ�	salesman
*/

/* 7-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� �Ի��� ������
--    �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';  -- ����Ÿ���� ��¥Ÿ������ �ڵ� ����ȯ
--                ----          -> ����Ÿ��
--                ----------    -> ����Ÿ��
--    -------                   -> ��¥Ÿ��
--==>> MARTIN	SALESMAN	2023-10-19
--** ����Ŭ�� �ڵ�����ȯ�� �����ʾƾ� �Ѵ�.

DESC TBL_EMP;

--�� TO_DATE()
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28','YYYY-MM-DD');
--                        ----------                -> ����Ÿ��
--                       ------------               -> ����Ÿ��
--               ---------------------------------- -> ��¥Ÿ��
--==>> MARTIN	SALESMAN	2023-10-19

/* 8-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� �Ի����� 1921�� 9�� 28�� ����(�ش��� ����)
--    �Ի��� ������ �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28','YYYY-MM-DD');

--�� ����Ŭ������ ��¥ �������� ũ�� �񱳰� �����ϴ�.
--  ����Ŭ������ ���� �����Ϳ� ���� ũ�� �� ��
--  ���ź��� �̷��� �� ū ������ �����Ѵ�.

--�� TBL_EMP ���̺��� �Ի����� 1981�� 4�� 2�� ����
--    1981�� 9�� 28�� ���̿� �Ի��� ��������
--    �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�. (�ش��� ����)

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
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

--�� BETWEEN �� AND ��
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
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
-----------��------------------��-------------
--        1981.4.2            1921.9.28

--�� TBL_EMP ���̺��� �޿�(SAL)�� 2450 ���� 3000 ������ �������� ��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2450 AND 3000;
--==>>
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7902	FORD	ANALYST	7566	1981-12-03	3000		20
*/
-----------��------------------��-------------
--        2450                3000

--�� TBL_EMP ���̺��� �������� �̸���
--    'C'�� �����ϴ� �̸����� 'S'�� �����ϴ� �̸��� ���
--     ��� �׸��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
-----------��------------------��-------------    --** ������ �迭 ����('S'�θ� �̸��� �ִٸ� �˻���)
--        'C'                 'S'
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7839	KING	PRESIDENT		1981-11-17	5000		10
7900	JAMES	CLERK	7698	1981-12-03	950		30
7902	FORD	ANALYST	7566	1981-12-03	3000		20
7934	MILLER	CLERK	7782	1982-01-23	1300		10
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
/*
7369	SMITH	CLERK	7902	1980-12-17	800		20
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	30
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7839	KING	PRESIDENT		1981-11-17	5000		10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30
7900	JAMES	CLERK	7698	1981-12-03	950		30
7902	FORD	ANALYST	7566	1981-12-03	3000		20
7934	MILLER	CLERK	7782	1982-01-23	1300		10
*/

--�� <BTWEEN �� AND ��>�� ��¥��, ������, ������ �����Ϳ� ��� ����ȴ�.
--    ��, �������� ��� �ƽ�Ű�ڵ� ������ �ٸ��� ������(������ �迭)
--    �빮�ڰ� ���ʿ� ��ġ�ϰ�, �ҹ��ڰ� �� �ʿ� ��ġ�Ѵ�.
--    ����, <BTWEEN �� AND ��>�� �ش� ������ ����Ǵ� ��������
--    ���� ���������δ� �ε�ȣ �������� ���·� �ٲ�� ���� ó���Ѵ�.

--�� ASCOO()
--�Ű������� �ʰܹ��� �ش� ������ �ƽ�Ű �ڵ� ���� ��ȯ�Ѵ�.
SELECT ASCII('A') "COL1"
      ,ASCII('B') "COL2"
      ,ASCII('a') "COL3"
      ,ASCII('b') "COL4"
--FROM DUAL;
--==>>65	66	97	98

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN'
   OR JOB = 'CLOERK';

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'CLOERK');

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB =ANY ('SALESMAN', 'CLOERK');

--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�.
--    ������, �� ���� ������(OR)�� ���� ������ ó���ǳ�.(���� �� �ȵ�����...)
--    ���� �޸𸮿� ���� ������ �ƴ϶� CPU�� ���� �����̹Ƿ�
--    �� �κб��� �����Ͽ� �������� �����ϰ� �Ǵ� ��찡 ���� �ʴ�.
--    -> <IN> <=ANY>�� �� ��Ȳ���� ��� ���� ���� ȿ���� ��������.
--        �̸� ��δ� ���������� <OR> ������ ����Ǿ� ���� ó�� �ȴ�.

-------------------------------------------------------------------------------
--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO      NUMBER(4)
, SANAME    VARCHAR2(30)
, JUBUN     CHAR(13)
, HIREDATE  DATE        DEFAULT SYSDATE
, SAL     NUMBER(10)
);
--==>> Table TBL_SAWON��(��) �����Ǿ����ϴ�.



SELECT *
FROM TBL_SAWON;
--==>> ��ȸ��� ����

DESC TBL_SAWON;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SNAME       VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10) 
*/

--�� ������ ���̺� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '������', '9710171234567', TO_DATE('2005-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '�ڰ���', '9511182234567', TO_DATE('1999-11-23', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '�ڳ���', '9902082234567', TO_DATE('2006-08-10', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '������', '9708112234567', TO_DATE('2015-10-19', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '������', '0502034234567', TO_DATE('2010-05-06', 'YYYY-MM-DD'), 1000); 

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '������', '0609304234567', TO_DATE('2012-06-17', 'YYYY-MM-DD'), 1000); 

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '�μ���', '6510102234567', TO_DATE('1999-08-22', 'YYYY-MM-DD'), 2000); 

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '������', '6909101234567', TO_DATE('1998-01-10', 'YYYY-MM-DD'), 2000); 

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '���̰�', '0505053234567', TO_DATE('2011-05-06', 'YYYY-MM-DD'), 1500); 

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '������', '6611112234567', TO_DATE('2000-01-16', 'YYYY-MM-DD'), 1300);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '������', '9501061234567', TO_DATE('2009-09-19', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '���켱', '0606064234567', TO_DATE('2011-11-11', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '����', '6511111234567', TO_DATE('1999-11-11', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '������', '9904171234567', TO_DATE('2009-11-11', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '���ù�', '0202023234567', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 2300);

--�� Ȯ��
SELECT *
FROM TBL_SAWON;
/*
1001	������	9710171234567	2005-01-03	3000
1002	�ڰ���	9511182234567	1999-11-23	4000
1003	�ڳ���	9902082234567	2006-08-10	4000
1004	������	9708112234567	2010-05-06	5000
1005	������	0502034234567	2015-10-19	1000
1006	������	0609304234567	2012-06-17	1000
1007	�μ���	6510102234567	1999-08-22	2000
1008	������	6909101234567	1998-01-10	2000
1009	���̰�	0505053234567	2011-05-06	1500
1010	������	6611112234567	2000-01-16	1300
1011	������	9501061234567	2009-09-19	4000
1012	���켱	0606064234567	2011-11-11	2000
1013	����	6511111234567	1999-11-11	2000
1014	������	9904171234567	2009-11-11	2000
1015	���ù�	0202023234567	2010-10-10	2300
*/

/*
1. Ȯ��
SELECT *
FROM ���̺��
WHERE SANO = 1005;

2. ����
UPDATE ���̺��
SET ������ ����
WHERE SANO = 1005;
*/

--�� Ŀ��
COMMIT;
-- Ŀ�� �Ϸ�.

/* 9-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� '������' ����� �����͸� ��ȸ�Ѵ�.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '������';
--==>> 1014	������	9904171234567	2009-11-11	2000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '������';
--==>> 1014	������	9904171234567	2009-11-11	2000
--** ���ڿ� ��ȸ�� LIKE ��밡��

--�� LIKE : ���� -> �����ϴ�
--          �λ� -> ~�� ����, ~ó��

--�� WILD CARD(CHARACTER) -> ��3%��
--   ��LIKE�� �� �Բ� ���Ǵ� ��%���� ��� ���ڸ� �ǹ��ϰ�
--   ��LIKE�� �� �Բ� ���Ǵ� ��_���� �ƹ� ���� �� ���� �ǹ��Ѵ�.


/* 10-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ������ ���������� �������
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�";
FROM TBL_SAWON
WHERE ������ '��';

SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME = '��_';
--==>> ��ȸ��� ����

SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>> ������	9710171234567	3000

SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>> ������	9710171234567	3000

/* 11-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ������ <��>���� �����
--    �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
   
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';

/* 12-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ����� �̸��� <��>���� ������ �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
--** �� �տ� ���ڰ� ��� ã��. %�� ���� ���ڱ��� ����.
--==>>
/*
�ڰ���	9511182234567	4000
�ڳ���	9902082234567	4000
*/

/* 13-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ����� �̸��� '��'��� ���ڰ�
--   �ϳ��� ���ԵǾ� �ִٸ� �� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
   
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
--==>>
/*
1005	������	1000
1006	������	1000
1007	�μ���	2000
1009	���̰�	1500
1011	������	4000
1014	������	2000
*/

/* 14-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ����� �̸��� '��'��� ���ڰ�
--   �� �� ����ִ� ����� �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';
--==>>
/*
1006	������	1000
1009	���̰�	1500
*/

/* 15-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ������ �̸��� '��'��� ���ڰ�
--   �������� �� �� ����ִ� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';   
--==>> 1009	���̰�	1500

/* 16-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ����� �̸��� �� ��° ���ڰ� '��'�� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
--WHERE SANAME LIKE '%��%';  --(x) �� ���ڸ� �ִ��� �˻���
--WHERE SANAME LIKE '_��_';  --(��) ������ ������, 3���ڰ� �Ѿ�� �˻��� �� ����
WHERE SANAME LIKE '-��%';
--==>>
/*
1001	������	3000
1004	������	5000
*/

/* 17-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ������ '��'���� �����
--   �����ȣ, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--** �� Į���� �и��Ǿ� ���� �ʴٸ�, ã�� �� ���� (EX. ������ ������ ����)
SELECT SANO, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%'; --(x)

--�� �����ͺ��̽� ���� ��������
--     ���� �̸��� �и��Ͽ� ó���� ���� ��ȹ�� �ִٸ�
--     (���� ������ �ƴϴ���...)
--     ���̺��� �� �÷��� �̸� �÷��� �и��Ͽ� �����ؾ� �Ѵ�.

/* 18-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SAWON ���̺��� ����������
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME,JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' OR JUBUN LIKE '______4%';

SELECT SANAME,JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______' OR JUBUN LIKE '______4______';
--==>>
/*
�ڰ���	9511182234567	4000
�ڳ���	9902082234567	4000
������	9708112234567	5000
������	0502034234567	1000
������	0609304234567	1000
�μ���	6510102234567	2000
������	6611112234567	1300
���켱	0606064234567	2000
*/

SELECT *
FROM TBL_SAWON;

--�� �ǽ� ���̺� ����(TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NAME    VARCHAR2(20)
, BIGO          VARCHAR2(100)
);
--==>> Table TABL_WATCH��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_WATCH;

/* 19-���� & �Բ�Ǭ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� ������ �Է�
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('�ݽð�', '���� 99.99% ������ �ְ�� �ð�');

INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('���ð�', '�������� 99.99%�� ȹ���� �ְ��� �ð�');

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� TBL_WATCH ���̺��� BIGO(���) �÷���
--   <99.99%> ��� ���ڰ� ���Ե�(����ִ�) ��(���ڵ�)��
--   �����͸� ��ȸ�Ѵ�.
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%';
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�������� 99.99���� ȹ���� �ְ��� �ð�
*/

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%';

-- ESCAPE 
--** ������ �ϴ� % �տ� �Ⱦ��� ���ڸ� �ְ�, ESCAPE �ڿ� '�Ⱦ��¹���' �� �ۼ�
--** �Ⱦ��� ����: $, \, / �� ���������� �ߺ����� �ʴ� ����

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

--�� ESCAPE �� ���� ������ ���� �� ���ڸ� ���ϵ� ī�忡�� Ż����Ѷ�..
--   �Ϲ������� ��� �󵵰� ����  Ư������(Ư����ȣ)�� ����Ѵ�.

--------------------------------------------------------------------------------

--���� COMMIT / ROLLBACK ����--

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ������ �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

/* 
** ���̺��� ������-�ϵ��ũ
            ����-���̺����̽� �� �������
   ���̺� ������ �Է��� �����ߴ� �ϴ���, 
            ���� �ϵ��ũ�� ���������� ����Ȱ� �ƴ�, �޸𸮻� ���� �� ��
*/

--50�� ���ߺ� ����...
--�� �����ʹ� TBL_DEPT ���̺��� ����Ǿ� �ִ�
--�ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴϴ�.
--�޸�(RAM) �� �Էµ� ���̴�.

--�� �ѹ�
ROLLBACK;   -- ���̺�ȿ��� 

SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/
-- 50�� ���ߺ� ����... �� ���� �����Ͱ� �ҽ� �Ǿ����� Ȯ��(�������� ����)

--�� �ٽõ����� �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_DEPT;

-- 50�� ���ߺ� ����...
-- �� �����ʹ� TBL_DEPT ���̺��� ������ �մ� �ϵ��ũ �� ����� ���� �ƴ϶�
--�޸�(RAM) �� �Էµ� ���̴�.
--�̸�... ���� �ϵ��ũ �� ���������� ����� ��Ȳ�� Ȯ���ϱ� ���ؼ��� 
--COMMIT�� �����ؾ� �Ѵ�.

COMMIT;
--==>> Ŀ�� �Ϸ�

--�� Ŀ�� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

ROLLBACK;
--==>> �ѹ� �Ϸ�.

-- �ѹ�(ROLLBACK)�� �����Ͽ������� �ұ��ϰ�
-- 50�� ������... �� �� ���´� �ҽǵ��� �ʾ����� Ȯ��

--�� COMMIT �� ������ ���ķ� DML(INSERT, UPDATE, DELETE) ������ ����
--   ����� �����͸� �ּ��� �� �ִ� �� ��...
--   DML ����� ����� �� COMMIT�� �����ϰ� ���� ROLLBACK�� �����غ���
--   �ƹ��ҿ��� ����.

--�� ������ ����(UPDATE -> TBL_DEPT)
--** COMMIT �̳� ROLLBACK ���� �ξ� �߿��� �̾߱�
--** CREATE, ALTER �� AUTO COMMIT!! �����ϱ�!!
UPDATE TBL_DEPT
SET DNAME = '������', LOC = '���'
FROM DEPTNO = 50;















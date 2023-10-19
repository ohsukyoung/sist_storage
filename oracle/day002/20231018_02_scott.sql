--�� ����� ���� Ȯ��
SELECT USER
FROM DUAL;
--=>> SCOTT

--�� ���̺� ����(DEPT)
CREATE TABLE DEPT
( DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY
, DNAME VARCHAR2(14)
, LOC VARCHAR2(13) 
) ;
--==>> Table DEPT��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(EMP)
CREATE TABLE EMP
( EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
--==>> Table EMP��(��) �����Ǿ����ϴ�.


INSERT INTO DEPT VALUES	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES	(40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 18

--�� ���̺� ����(BONUS)
CREATE TABLE BONUS
( ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, SAL NUMBER
, COMM NUMBER
) ;
--==>> Table BONUS��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(SALGRADE)
CREATE TABLE SALGRADE
( GRADE NUMBER
, LOSAL NUMBER
, HISAL NUMBER 
);
--==>> Table SALGRADE��(��) �����Ǿ����ϴ�.


INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� SCOTT ������ ���� �ִ�(�����ϰ� �ִ�) ���̺� ��ȸ
SELECT *
FROM TAB;
--==>> 
/*
BONUS	    TABLE	
DEPT	    TABLE	
EMP	        TABLE	
SALGRADE	TABLE	
*/

SELECT *
FROM USER_TABLES;
--==>>
--** � ���̺� ������ �� �ִ���, �� �� �ִ��� ��ȸ
/*
DEPT	    USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
EMP	        USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
BONUS	    USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
SALGRADE	USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
*/

--�� ������ ��ȸ�� ������ ���̺����
--    � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	USERS
EMP	USERS
BONUS	USERS
SALGRADE	USERS
*/

--�� ���̺� ����(TBL_EXAMPLE1)
CREATE TABLE TBL_EXAMPLE1
( NO    NUMBER(4)
, NAME  VARCHAR2(20)
, ADDR  VARCHAR2(20)
);
--==>> Table TBL_EXAMPLE1��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(TBL_EXAMPLE2)
CREATE TABLE TBL_EXAMPLE2
( NO    NUMBER(4)
, NAME  VARCHAR2(20)
, ADDR  VARCHAR2(20)
) TABLESPACE TBS_EDUA;
--==>> Table TBL_EXAMPLE2��(��) �����Ǿ����ϴ�.
--** TBS_EDUA: ���� �������� ���̺����̽��� ����

--�� TBL_EXAMPLE1 �� TBL_EXAMPLE2 ���̺���
--    ���� � ���̺� �����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	        USERS
EMP	            USERS
BONUS	        USERS
SALGRADE	    USERS
TBL_EXAMPLE1	USERS
TBL_EXAMPLE2	TBS_EDUA
*/

-------------------------------------------------------------------------------
--���� ������ �����ͺ��̽�(RDBMS) ����--

--������ �����͸� ���̺��� ���·� ������� �����س��� ����
--�׸��� �̵� ������ ���̺� ���� ���踦 �����Ͽ� ������� ���� ����

/*=====================================
 �� SELECT ���� ó��(PARSING) ����

    SELECT      �÷���     -- �� ��
    FROM        ���̺��   -- �� ��
    WHERE       ������     -- �� +
    GROUP BY    ��         -- �� +
    HAVING      ������     -- �� +
    ORDER BY    ��         -- �� +
=====================================*/
--** ���̺� �����̽����� FROM�� ���� ���� ã��
--** FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY
--** 1,5�� �ݵ�� �־����
--** +�� �ܵ����� ���簡��
-------------------------------------------------------------------------------

--�� SCOTT ������ ���̺� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
BONUS	        TABLE	-- ���ʽ�(BONUS) ������ ���̺�
DEPT	        TABLE	-- �μ�(DEPARTMENTS) ������ ���̺�
EMP	            TABLE	-- ���(EMPLOYEES) ������ ���̺�
SALGRADE	    TABLE	-- �޿�(SAL) ������ ���̺�

TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
*/

--�� �� ���̺��� ������ ��ȸ
SELECT *
FROM BONUS;
--==>> ��ȸ ��� ����(��ȸ�� �����Ͱ� �������� ����)


SELECT *
FROM DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/



SELECT *
FROM EMP;
--==>>
/*
EMPNO      ENAME    JOB     MGR     HIGEDATE    SAL COMMI   DEPTNO
�����ȣ �̸�     ����     ������  �Ի���     �޿�     ����   �μ���ȣ
7369	SMITH	CLERK	    7902	80/12/17	800		        20
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	    30
7566	JONES	MANAGER 	7839	81/04/02	2975		    20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7698	BLAKE	MANAGER	    7839	81/05/01	2850		    30
7782	CLARK	MANAGER	    7839	81/06/09	2450		    10
7788	SCOTT	ANALYST	    7566	87/07/13	3000		    20
7839	KING	PRESIDENT		    81/11/17	5000		    10
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    30
7876	ADAMS	CLERK	    7788	87/07/13	1100		    20
7900	JAMES	CLERK	    7698	81/12/03	950		        30
7902	FORD	ANALYST	    7566	81/12/03	3000		    20
7934	MILLER	CLERK	    7782	82/01/23	1300		    10
*/

SELECT *
FROM SALGRADE;
--==>>
/*
2	1201	1400
3	1401	2000
4	2001	3000
1	700	    1200
2	1201	1400
3	1401	2000
4	2001	3000
5	3001	9999
*/

SELECT *
FROM TBL_EXAMPLE1;
--==>> ��ȸ ��� ����(��ȸ�� �����Ͱ� �������� ����)

SELECT *
FROM TBL_EXAMPLE2;
--==>> ��ȸ ��� ����(��ȸ�� �����Ͱ� �������� ����)

SELECT *
FROM SALGRADE;
--==>> 
/*
1	700	    1200
2	1201	1400
3	1401	2000
4	2001	3000
5	3001	9999
*/


--�� DEPT ���̺� �����ϴ� �÷��� ���� Ȯ��
DESCRIBE DEPT;
--==>>
/*
�̸�     ��?       ����       --** ��? : NULL ���� ���� �÷�����    
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
*/

-- DEPTNO   DNAME  LOC
-- �μ���ȣ �μ��� �μ���ġ
----------------------------
-- 10       �λ��   ����    -> ������ �Է� ����
-- 20                ����    -> ������ �Է� ����
--          ���ߺ�   ���    -> ������ �Է� �Ұ�~!!!

--------------------------------------------------------------------------------
--���� ����Ŭ�� �ֿ� �ڷ���(DATA TYPE) ����--
/*
cf) MSSQL ������ ���� ǥ�� Ÿ��
    tinyint     0 ~ 255             1byte
    smallint    -32.768 ~ 32.767    2byte
    int         -21�� ~ 21��        4byte
    bigint      ��ûŭ              8byte
    
    MSSQL ������ �Ǽ� ǥ�� Ÿ��
    float, real
    
    MSSQL ������ ���� ǥ�� Ÿ��
    decimal, numeric
    
    MSSQL ������ ���� ǥ�� Ÿ��
    char, varchar, Nvarchar
    
�� ORACLE �� ���� ǥ�� Ÿ���� �� ������ ���ϵǾ� �ִ�.

1. ������ NUMBER       -> -10�� 38��-1 ~ 10�� 38��
          NUMBER(3)    -> -999  ~ 999       --** ���̸� ����ؾ� �޸� ���� ����
          NUMBER(4)    -> -9999 ~ 9999
          NUMBER(4,1)  -> -999.9 ~ 999.9    --** �ι�° �ڸ�: �Ҽ��� ���� �ڸ�
          
�� ORACLE �� ���� ǥ�� Ÿ��

2. ������ CHAR         -> ������ ũ��
                          (������ ������ ũ�� �Ҹ�)
                          
          CHAR(10)     <-��- '������'       6Byte ������ 10Byte �� �Ҹ�      --** 10����Ʈ�� ���� �� �ִ� ���ڿ� ����                
          CHAR(10)     <---- '���ȫ�浿'   10Byte
          CHAR(10)     <---- '�����ȫ�浿' 10Byte �� �ʰ��ϹǷ� �Է� �Ұ�
          
                          
          VARCHAR2     -> ������ ũ��
                          (��Ȳ�� ���� ũ�Ⱑ ����)
          VARCHAR2(10)  <-��- '������'       6Byte
          VARCHAR2(10)  <---- '���ȫ�浿'   10Byte
          VARCHAR2(10)  <---- '�����ȫ�浿' 10Byte �� �ʰ��ϹǷ� �Է� �Ұ�
          
          //** CHAR�� VARCHAR2���� ȿ������ -> �����Ϳܿ� �����Ϳ� ���� ������ VARCHAR2�� �� ŭ
          
          NCHAR        -> �����ڵ� ��� ������ ũ��(���ڼ�)
          NCHAR(10)     <---- 10����
          
          NVARCHAR2    -> �����ڵ� ��� ������ ũ��(���ڼ�)
          NVARCHAR2(10) <---- 10����
          
3. ��¥�� DATE



          
          
*/
SELECT HIREDATE
FROM EMP;
--==>>
/*
1980-12-17
*/

--ALTER SESSION SET NLS_DATE_FORMAT='MM/DD';
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--** 23/10/18 11:47:20
-- �ڹٿ� ���� �ٸ��ϱ� ����Ŭ���� ȯ����� �ߴٰ� �ϴ��� 
-- ��¥ ������ �ٸ��� ���� �� ����

--DESCRIBE EMP; --���� DESCRIBE = DESC
DESC EMP;
/*
�̸�       ��?       ����           
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

SELECT SYSDATE
FROM DUAL;
--==>> 2023-10-18
--** Oracle �����ͺ��̽����� ���� ��¥�� �ð��� ��ȯ�ϴ� �Լ�

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE
FROM DUAL;
--==>> 2023-10-18 12:05:20

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.
--** 24�ø� �������� �ð� ������ EX. ���� 1�� ->13

SELECT SYSDATE
FROM DUAL;
--==>> 2023-10-18 12:05:20
--==>>2023-10-18 14:05:55

--�� EMP ���̺��� �����ȣ, �����, �޿�, Ŀ�̼� �����͸� ��ȸ�Ѵ�.
SELECT EMPNO, ENAME, SAL, COMM
FROM EMP;
--==>> 
/*
7369	SMITH	800	
7499	ALLEN	1600	300
7521	WARD	1250	500
7566	JONES	2975	
7654	MARTIN	1250	1400
7698	BLAKE	2850	
7782	CLARK	2450	
7788	SCOTT	3000	
7839	KING	5000	
7844	TURNER	1500	0
7876	ADAMS	1100	
7900	JAMES	950	
7902	FORD	3000	
7934	MILLER	1300	
*/

/* 1-���� & �Բ�Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺��� �μ���ȣ�� 20�� �������� �����͵� ��
--�����ȣ, �����, ����, �޿�, �μ���ȣ ��ȸ
SELECT �����ȣ, �����, ����, �޿�, �μ���ȣ
FROM EMP
WHERE �μ���ȣ�� 20;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO�� 20;

--SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
--FROM EMP
--WHERE DEPTNO == 20;
--==>> �����߻�

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

SELECT EMPNO AS "�����ȣ", ENAME "�����" , JOB ������, SAL "��   ��", DEPTNO "�μ� ��ȣ" 
FROM EMP;
--�� ���̺��� ��ȸ�ϴ� ��������
--�� �÷��� �̸����� ��Ī(ALIAS)�� �ο��� �� �ִ�.
--�⺻ ������ ������ ���÷��� AS "��Ī�̸�"���� ���·� �ۼ��Ǹ�
--�� ��, ��AS���� ������ �����ϴ�.
--����, ��Ī �̸��� ���δ� ��""���� ������ ����������
--��""�� �� ������ ��� ��Ī ������ ������ ����� �� ����.
--������ ������ �ش� �÷��� ǥ���� ���� ������ �ǹ��ϹǷ�
--��Ī�� �̸� ���ο� ������ ����ؾ� �� ���
--��""�� �� ����Ͽ� ��Ī�� �ο��� �� �ֵ��� �Ѵ�.

/* EMPNO AS "�����ȣ" : SQL������ ���ڿ��� '(��������ǥ)������, AS(��Ī)�� �������� "(ū����ǥ)
                      '�Ͻ� �����߻�(ORA-00923: FROM keyword not found where expected)
 ENAME "�����"      : AS ���� ����
 JOB ������          : " ���� ����
 SAL "��   ��"       : ��Ī�ȿ� ������ ���� �� " �����Ұ�*/


--�� EMP ���̺��� �μ���ȣ�� 20���� 30�� �������� �����͵� ��
--�����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
--��, ��Ī(ALIAS)�� ����Ѵ�.
/*
EMP ���̺���                           -> FROM EMP
�μ���ȣ�� 20���� 30��                   -> ����
�����ȣ, �����, ������, �޿�, �μ���ȣ -> SELECT �÷���
*/
SELECT �����ȣ, �����, ������, �޿�, �μ���ȣ
FROM EMP
WHERE �μ���ȣ�� 20���� 30��;

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO�� 20 DEPTNO�� 30;

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO=20 || DEPTNO=30;
--==>> �����߻�

SELECT EMPNO �����ȣ, ENAME �����, JOB ������, SAL �޿�, DEPTNO �μ���ȣ
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

--�� ���� ������ IN �����ڸ� Ȱ���Ͽ�
--   ������ ���� ó���� �� ������
--   �� ������ ó������� ���� ����� ��ȯ�Ѵ�.

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO IN (20,30);
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

/* 2-���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺��� ������ CLERK �� ������� �����͸� ��� ��ȸ�Ѵ�.
SELECT *
FROM EMP
WHERE JOB = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		    20
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	950		    30
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10
*/

/* 2-�Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
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

SELECT *
FROM EMP
WHERE JOB IN ('clerk');
--==>> ��ȸ ��� ����

--�� ����Ŭ����... �Էµ� �������� �� ��ŭ��...
--  ��.��.�� ��ҹ��� ������ �Ѵ�.

--�� EMP ���̺��� ������ CLERK �� ����� ��
--    20�� �μ��� �ٹ��ϴ� �������
--    �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
--    ALIAS ���~!!!
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	800	    20
7876	ADAMS	CLERK	1100	20
*/

/* 3-���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺��� ������ �����͸� Ȯ���ؼ�
--    �̿� �Ȱ��� �����Ͱ� ����ִ� ���̺��� ������ �����Ѵ�.
--    (������... EMP1, EMP2, EMP3, EMP4)
--**�߰� �ڸ�Ʈ) �� ���̺� ���� ���� ó���� �ϰ� �Ǹ� lock �ɸ�

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
--==>> Table EMP4��(��) �����Ǿ����ϴ�.

INSERT INTO EMP4 VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP4 VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP4 VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM EMP4;

DROP TABLE EMP4;

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

COMMIT;



/* 3-�Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--1. ������ ��� ���̺� ���� Ȯ��
DESCRIBE EMP;
DESC EMP;
/*
�̸�       ��?       ����           
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

-- 2. ��� ���̺��� ������ ���� ���ο� ���̺� ����
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

--3. ��� ���̺��� ������ ��ȸ
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

--4. ��� ���̺��� �����͸� ������ ���̺� �Է�
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

--5. Ȯ��
SELECT *
FROM EMP5;

--6. Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


--�� ��� ���̺��� ���뿡 ���� ���̺� ����(TBL_EMP)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� ������ ��ȸ
SELECT *
FROM TBL_EMP;


/* 4-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� DEPT ���̺��� �����Ͽ� ���� ���� TBL_DEPT ���̺��� �����Ѵ�.
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ���̺��� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
/*
DEPT	        TABLE	
EMP	            TABLE	
BONUS	        TABLE	
TBL_EMP	        TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
SALGRADE	    TABLE	
EMP4	        TABLE	
TBL_DEPT	    TABLE	
EMP5	        TABLE	
*/

--�� ���̺� ������ Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '��� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� �� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--** Ŀ��Ʈ�� �ȴ޾Ƶ� ũ�� ���������, ���� ���ϱ� ��������� �� �� �ְ� ���� �����ϱ⿡�� ����.
--==>>
/*
EMP5	        TABLE	
TBL_DEPT	    TABLE	
EMP4	        TABLE	
SALGRADE	    TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EMP	        TABLE	��� ����
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--�� TBL_DEPT ���̺��� ������� ���̺� ������ Ŀ��Ʈ ������ �Է�
-- -> �μ� ����
COMMENT ON TABLE TBL_DEPT IS '�μ� ����';

--�� Ŀ��Ʈ ������ �Է� �� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
/*
EMP5	        TABLE	
TBL_DEPT	    TABLE	�μ� ����
EMP4	        TABLE	
SALGRADE	    TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EMP	        TABLE	��� ����
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--�� ������ ����
PURGE RECYCLEBIN;

--�� �÷�(COLUMN) ������ Ŀ��Ʈ ������ �Է�
SELECT *
FROM USER_COL_COMMENTS;

/*
TBL_EMP	    HIREDATE	
EMP4	    EMPNO	
SALGRADE	HISAL	
DEPT	    LOC	
BONUS	    COMM	
TBL_EMP	    ENAME	
BIN$IhHBS6pBRP627poXcYfBUA==$0	DEPTNO	
EMP4	    COMM	
EMP5	    ENAME	
EMP5	    JOB	
EMP	        DEPTNO	
TBL_DEPT	LOC	
TBL_DEPT	DNAME	
EMP	EMPNO	
BIN$LrMQjHLGTNOvSHA+mwIy/Q==$0	MGR	
DEPT	    DEPTNO	
DEPT	    DNAME	
TBL_EMP	    DEPTNO	
TBL_EMP	    EMPNO	
TBL_EMP	    JOB	
TBL_EXAMPLE2	NO	
TBL_EMP 	MGR	
BONUS	    JOB	
TBL_EXAMPLE1	NO	
EMP5	    DEPTNO	
EMP4	    DEPTNO	
EMP5	    MGR	
EMP	        ENAME	
BIN$LrMQjHLGTNOvSHA+mwIy/Q==$0	ENAME	
BIN$IhHBS6pBRP627poXcYfBUA==$0	HIREDATE	
BIN$LrMQjHLGTNOvSHA+mwIy/Q==$0	EMPNO	
EMP5	    COMM	
EMP	        JOB	
TBL_EXAMPLE2	NAME	
BONUS	    SAL	
EMP	        SAL	
BIN$LrMQjHLGTNOvSHA+mwIy/Q==$0	HIREDATE	
TBL_EMP	    SAL	
EMP4	    ENAME	
SALGRADE	GRADE	
EMP5	    SAL	
EMP5	    EMPNO	
TBL_DEPT	DEPTNO	
SALGRADE	LOSAL	
BIN$IhHBS6pBRP627poXcYfBUA==$0	COMM	
TBL_EXAMPLE1	NAME	
EMP4	    SAL	
TBL_EMP	    COMM	
EMP4	HIREDATE	
BIN$IhHBS6pBRP627poXcYfBUA==$0	JOB	
BIN$LrMQjHLGTNOvSHA+mwIy/Q==$0	JOB	
EMP	COMM	
EMP4	JOB	
BIN$IhHBS6pBRP627poXcYfBUA==$0	EMPNO	
TBL_EXAMPLE1	ADDR	
EMP4	MGR	
TBL_EXAMPLE2	ADDR	
EMP	HIREDATE	
BIN$LrMQjHLGTNOvSHA+mwIy/Q==$0	SAL	
EMP	MGR	
BIN$LrMQjHLGTNOvSHA+mwIy/Q==$0	COMM	
BIN$IhHBS6pBRP627poXcYfBUA==$0	ENAME	
BIN$IhHBS6pBRP627poXcYfBUA==$0	MGR	
BIN$LrMQjHLGTNOvSHA+mwIy/Q==$0	DEPTNO	
EMP5	HIGEDATE	
BONUS	ENAME	
BIN$IhHBS6pBRP627poXcYfBUA==$0	SAL	
*/

SELECT *
FROM TAB;

DROP TABLE TBL_EXAMPLE1;
--==>> Table TBL_EXAMPLE1��(��) �����Ǿ����ϴ�.

SELECT *
FROM TAB;
/*
BIN$tv4dttSlRmKaJ8c/NyW9qg==$0	TABLE	
BONUS	TABLE	
DEPT	TABLE	
EMP	    TABLE	
EMP4	TABLE	
EMP5	TABLE	
SALGRADE	TABLE	
TBL_DEPT	TABLE	
TBL_EMP	    TABLE	
TBL_EXAMPLE2	TABLE	
*/

-- ������ ����
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

SELECT *
FROM TAB;

--�� �÷�(COLUMN) ������ Ŀ��Ʈ ������ Ȯ��(TBL_DEPT ���̺� �Ҽӵ� �÷��鸸 ��ȸ)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBl_DEPT';  -- �����߰�
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

--COMMENT �ۼ�����1) COMMENT ON TABLE ���̺�� IS 'Ŀ��Ʈ';

--�� ���̺� �Ҽӵ� �÷��� ���� Ŀ��Ʈ ������ �Է�
COMMENT ON COLUMN TBl_DEPT.DEPTNO IS '�μ� ��ȣ';
--==>> Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBl_DEPT.DNAME IS '�μ� �̸�';
--==>> Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ� ��ġ';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';
/*
TBL_DEPT	DEPTNO	�μ� ��ȣ
TBL_DEPT	DNAME	�μ� �̸�
TBL_DEPT	LOC	�μ� ��ġ
*/

/* 5-���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� �������
--    ���̺� �Ҽӵ�(���Ե�) �÷��� ����Ŀ��Ʈ ������ �Է�(����)
DESC TBL_EMP;
--��� ��ȣ, ��� �̸�, ���� �̸�, ������ �����ȣ, �Ի���, �޿�, ����, �μ� ��ȣ
COMMENT ON COLUMN TBL_EMP.EMPNO IS '��� ��ȣ';
COMMENT ON COLUMN TBL_EMP.ENAME IS '��� �̸�';
COMMENT ON COLUMN TBL_EMP.JOB IS '���� �̸�';
COMMENT ON COLUMN TBL_EMP.MGR IS '������ �����ȣ';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN TBL_EMP.SAL IS '�޿�';
COMMENT ON COLUMN TBL_EMP.COMM IS '����';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '�μ���ȣ';

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_EMP';
/*
TBL_EMP	EMPNO	��� ��ȣ
TBL_EMP	ENAME	��� �̸�
TBL_EMP	JOB	���� �̸�
TBL_EMP	MGR	������ �����ȣ
TBL_EMP	HIREDATE	�Ի���
TBL_EMP	SAL	�޿�
TBL_EMP	COMM	����
TBL_EMP	DEPTNO	�μ���ȣ
*/


--���� �÷� ������ �߰� �� ���� ����--

SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺� �ֹε�Ϲ�ȣ �����͸� ���� �� �ִ� �÷� �߰�
--** ���̺��� ������ �ٲ�� ������ ALTER
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

SELECT '01012341234'
FROM DUAL;
--==>> 01012341234
--** ����Ÿ��

SELECT 01012341234
FROM DUAL;
--==>> 1012341234
--** ����Ÿ��

--�� TBL_EMP ���̺��� ���� Ȯ��
DESC TBL_EMP;
/*
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
SSN         CHAR(13)
*/
--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� ����(�߰�)�� ������ Ȯ��

--�� ���̺� ������ �÷��� ������ ���������� �ǹ� ����.
--** �󸶵��� SELECT�� ���ϴ� ������� ���� �� �ֱ� ������

SELECT *
FROM TBL_EMP;

SELECT EMPNO, ENAME, SSN
FROM TBL_EMP;

--�� TBL_EMP ���̺� �߰��� SSN(�ֹι�ȣ) �÷� ����
--** �÷��� �����Ǵ� ���� ������, ���̺��� ���忡���� ����Ǵ� ��
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

-- Ȯ��
DESC TBL_EMP;

SELECT *
FROM TBL_EMP;
--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� ����(����)�Ǿ����� Ȯ��.

--** ���������� ���� CREATE
--**            ���� ALTER
--**            ���� DROP
--
--** ������     ���� INSERT
--**            ����
--**            ���� DELETE

DELETE TBL_EMP;
--==>> 14�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--> ���̺��� ����(����, Ʋ)�� �״�� �����ִ� ���¿���
--    �����͸� ��� �ҽ�(����)�� ��Ȳ���� Ȯ��

DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--==>> �����߻�
--    (ORA-00942: table or view does not exist)
--> ���̺� ��ü�� ���ŵ� ��Ȳ

--�� ���̺� �ٽ� ����(����)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--�� NULL �� ó��
SELECT 10, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 10	12	8	20	5

--SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
--FROM DUAL;
--==>> (NULL) (NULL) (NULL-2), (NULL/2)				
--** ������ ���� ������ ����

--�� ���� ���
--    NULL�� ������ ���� �ǹ��ϸ�... ���� �������� �ʴ� ���̱� ������
--    �� NULL �� ���꿡 ���Ե� ���...
--    �� ����� ������ NULL
--** ������ ���ϸ�, NULL�� ������ ��

/* 6-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� Ŀ�̼�(COMM, ����)�� NULL �� ������ 
--    �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = NULL;
--==>> ��ȸ ��� ����

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> ����
--      (ORA-01722: invalid number) --** ������Ÿ�Ը� �� �� �ִµ� ���ڰ� ����

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = (NULL);
--==>> ��ȸ ��� ����

--�� NULL�� ���� �����ϴ� ���� �ƴϱ� ������
--    �Ϲ����� �����ڸ� Ȱ���Ͽ� ���� �� ����.
--    NULL �� ������� ����� �� ���� �����ڵ�...
--    >=, <=, =, >, <,
--    ���� �ʴ�(3����): !=, <>, ^=

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL;
--==>>
/*
--** (NULL)�� ��� ������ ����. �ð������� ǥ������ ��
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

/* 7-���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ����� �ʴ� ��������
--    �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�.
DESC TBL_EMP;

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



SELECT USER
FROM DUAL;
--==>> SCOTT
 
DROP TABLE EMPLOYEE;
DROP TABLE REGION;
DROP TABLE POSITION;
DROP TABLE DEPARTMENT;
DROP SEQUENCE EMPLOYEESEQ;
DROP SEQUENCE REGIONSEQ;
DROP SEQUENCE POSITIONSEQ;
DROP SEQUENCE DEPARTMENTSEQ;
 
 
--�� �ǽ� ���̺� ���� (���� : REGION)
CREATE TABLE REGION
( REGIONID      NUMBER          --���� ���̵� -- PK
, REGIONNAME    VARCHAR2(30)    -- ���� ��
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION��(��) �����Ǿ����ϴ�.
 
--�� ������ ���� (���� : REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ��(��) �����Ǿ����ϴ�.
 
--�� ���� ������ �Է�
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '��õ');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '�뱸');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 6
 
--�� ���� ����Ʈ Ȯ��
SELECT REGIONID, REGIONNAME
FROM REGION;
--> �� �� ����
SELECT REGIONID, REGIONNAME FROM REGION
;
--==>>
/*
1	����
2	���
3	��õ
4	����
5	����
6	�뱸
*/
 
--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
--�� �ǽ� ���̺� ���� (���� : POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          -- ���� ���̵� - PK
, POSITIONNAME  VARCHAR2(30)    -- ���� ��
, MINBASICPAY   NUMBER          -- �ּ� �⺻��
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION��(��) �����Ǿ����ϴ�.
 
--�� ������ ���� (���� : POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ��(��) �����Ǿ����ϴ�.
 
--�� ���� ������ �Է�
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '���', 1000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '�븮', 2000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '����', 3000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '����', 4000000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
 
--�� ���� ����Ʈ Ȯ��
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;
--> �� �� ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
--==>>
/*
1	���	1000000
2	�븮	2000000
3	����	3000000
4	����	4000000
*/
 
--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
--�� �ǽ� ���̺� ���� (�μ�)
CREATE TABLE DEPARTMENT
( DEPARTMENTID  NUMBER
, DEPARTMENTNAME    VARCHAR2(30)
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT��(��) �����Ǿ����ϴ�.
 
--�� ������ ����
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ��(��) �����Ǿ����ϴ�.
 
--�� �μ� ������ �Է�
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '���ߺ�');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '��ȹ��');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '������');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '�����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4
 
--�� �μ� ����Ʈ Ȯ��
SELECT DEPARTMENTID, DEPARTMENTNAME
FROM DEPARTMENT;
--> �� �� ����
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
--==>>
/*
1	���ߺ�
2	��ȹ��
3	������
4	�����
*/
 
--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
--�� �ǽ� ���̺� ���� (����: EMPLOYEE)
--�����ȣ, �����, �ֹι�ȣ, �������, ������, ��ȭ��ȣ, �μ�, ����, ����, �⺻��, ����
CREATE TABLE EMPLOYEE
(EMPLOYEEID     NUMBER                  -- �����ȣ   --PK
, NAME          VARCHAR2(30)            -- ��� ��
, SSN           VARCHAR2(20)            -- �ֹι�ȣ   -- ��ȣȭ ��� ���� (TYPE CHECK~!!!)
, BIRTHDAY      DATE                    -- �������
, LUNAR         NUMBER(1) DEFAULT 0     -- ������
, TELEPHONE     VARCHAR2(40)            -- ��ȭ��ȣ
, DEPARTMENTID  NUMBER                  -- �μ� ���̵� -- FK
, POSITIONID    NUMBER                  -- ���� ���̵� -- FK
, REGIONID      NUMBER                  -- ���� ���̵� -- FK
, BASICPAY      NUMBER                  -- �⺻��
, EXTRAPAY      NUMBER                  -- ����
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY (EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY (POSITIONID)
              REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
              REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE��(��) �����Ǿ����ϴ�.
 
--�� ������ ���� (���� : EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==> Sequence EMPLOYEESEQ��(��) �����Ǿ����ϴ�.
 
 
 
--�� ���� ������ �Է� (������ ���)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN , BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '������', CRYPTPACK.ENCRYPT('9710171234567', '9710171234567')
        , TO_DATE('1997-10-17', 'YYYY-MM-DD'), 0, '010-6380-7047', 1, 2, 1
        , 2500000, 1500000);  -- �̹���ʸ�, ����ʸ�
--=>> 1 �� ��(��) ���ԵǾ����ϴ�.
 
 
 
--�� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.
 
 
--�� Ȯ��
SELECT *
FROM EMPLOYEE;
--==>> 1	������	?o??^????	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000
 
--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
DESC EMPLOYEE;
--==>>
/*
�̸�           ��?       ����           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
SSN                   VARCHAR2(20) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER      
*/
 
--�� ���� ������ ��ȸ ������ ����
 
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
     , E.POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
     , E.REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID=E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;
--==>> 1	������	?o??^????	1997-10-17	0	���	010-6380-7047	1	���ߺ�	2	�븮	1	����	2500000	1500000	4000000
 
--�� �� ���� (EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
     , E.POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
     , E.REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID=E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�
 
 
--�� ���� ������ ��ȸ ������ ����
--   ��, ���� ������ ���� ���ɿ���(DELCHECK) Ȯ�� ����
 
SELECT R.REGIONID, R.REGIONNAME
    , (SELECT COUNT(*)
       FROM EMPLOYEE
       WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
--==>>
/*
  REGIONID REGIONNAME                       DELCHECK
---------- ------------------------------ ----------
         1 ����                                    1
         2 ���                                    0
         3 ��õ                                    0
         4 ����                                    0
         5 ����                                    0
         6 �뱸                                    0
*/
 
--> ������� ���� �����ʹ� ������ �Ұ����� ��Ȳ�̸�
--  ����⡻ ����õ�� �������� �����֡� ���뱸�� �� ���� �����ʹ�
--  ������ ������ ��Ȳ���� �Ǻ� �� �� �ִ� ������
 
 
--�� �� ���� (REGIONVIEW)
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT R.REGIONID, R.REGIONNAME
    , (SELECT COUNT(*)
       FROM EMPLOYEE
       WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
--==>> View REGIONVIEW��(��) �����Ǿ����ϴ�.
 
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW
;
 
 
--�� ���� ������ ��ȸ ������ ����
--   ��, ���� ������ ���� ���ɿ���(DELCHECK) Ȯ�� ����
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     ,(SELECT COUNT(*)
       FROM EMPLOYEE
       WHERE POSITIONID=P.POSITIONID ) AS DELCHECK
FROM POSITION P;
--==>>
/*
POSITIONID POSITIONNAME                   MINBASICPAY   DELCHECK
---------- ------------------------------ ----------- ----------
         1 ���                               1000000          0
         2 �븮                               2000000          1  �� ���� �Ұ�
         3 ����                               3000000          0
         4 ����                               4000000          0
*/
 
--�� �� ���� (POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     ,(SELECT COUNT(*)
       FROM EMPLOYEE
       WHERE POSITIONID=P.POSITIONID ) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW��(��) �����Ǿ����ϴ�.
 
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITIONVIEW
;
 
--�� �μ� ������ ��ȸ ������ ����
--   ��, �μ� ������ ���� ���ɿ��� Ȯ�� ����
 
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE   
        WHERE DEPARTMENTID=D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>>
/*
DEPARTMENTID DEPARTMENTNAME                   DELCHECK
------------ ------------------------------ ----------
           1 ���ߺ�                                  1
           2 ��ȹ��                                  0
           3 ������                                  0
           4 �����                                  0
*/
 
--�� �� ����(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
    , ( SELECT COUNT(*)
        FROM EMPLOYEE   
        WHERE DEPARTMENTID=D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW��(��) �����Ǿ����ϴ�.
 
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW
;
 
 
--�� ������ �ּ� �⺻�� ��ȸ ������ ����
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     --���
--> �� �� ����
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000
 
--------------------------------------------------------------------------
 
--�� �α���, �α׾ƿ� ���� �߰�
 
-- ID �� PW �÷� �����͸� ��� �ִ� ���̺��� ���� �� �������� �ʴ� ��Ȳ�̴�.
-- �̿� �����Ͽ� EMPLOYEEID(������̵�)�� SSN(�ֹι�ȣ) �� 7�ڸ��� ���ڸ�
-- ���� ���̵�, �н������ �̿��� �� �ֵ��� �����Ѵ�.
 
--�� ���� ���̺� ���� ����
--�� 
-- EMPLOYEE(���� ������) ���̺��� SSN(�ֹι�ȣ) �÷��� �и��Ѵ�.
-- SSN--------------------> SSN1 , SSN2
-- SSN1 �� �ֹι�ȣ �� 6�ڸ�
-- SSN2 �� �ֹι�ȣ �� 7�ڸ� �� ��ȣȭ ���� �� PW Ȱ��
 
--��
-- EMPLOYEE(���� ������) ���̺��� GRADE(���) �÷��� �߰��Ѵ�.
-- GRADE �� 0:������, 1:�Ϲݻ��
 
--�� �÷� ���� SSN �� SSN1, SSN2
 
-- �÷� �߰�
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.
 
SELECT *
FROM EMPLOYEE;
 
 
-- SSN �� ��ȣȭ('9710171234567', '9710171234567')
 
-- SSN1 �� SUBSTR(��ȣȭ(�������, '9710171234567'), 1, 6) �� '971017'
-- SSN2 �� ��ȣȭ(SUBSTR(��ȣȭ(�������, '9710171234567'), 7, 7), SUBSTR(��ȣȭ(�������, '9710171234567')) �� ��ȣȭ�� '1234567'
 
UPDATE EMPLOYEE
SET SSN1 = SUBSTR(CRYPTPACK.DECRYPT(SSN, '9710171234567'), 1, 6)
   ,SSN2 = CRYPTPACK.ENCRYPT(SUBSTR(CRYPTPACK.DECRYPT(SSN, '9710171234567'), 7, 7)
                             , SUBSTR(CRYPTPACK.DECRYPT(SSN, '9710171234567'),7 ,7) );
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
 
SELECT *
FROM EMPLOYEE;
--==>> 1	������	?o??^????	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???
 
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
-- ���� �ֹι�ȣ(SSN) �÷� ����
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.
 
DESC EMPLOYEE;
--==>>
/*
�̸�           ��?       ����           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER       
SSN1                  CHAR(6)      
SSN2                  VARCHAR2(50) 
*/
 
-- �÷� �߰� �� GRADE �� �⺻�� 1 �� �Ϲݻ������ ����
--                             0 �� �����ڷ� ����
 
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.
 
SELECT *
FROM EMPLOYEE;
--==>> 1	������	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	1
 
 
--�� ���� ������ �Է�
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY, SSN1, SSN2)
VALUES(EMPLOYEESEQ.NEXTVAL, '������', TO_DATE('1999-02-11', 'YYYY-MM-DD'), 1
        , '010-6678-9867', 1, 1, 1, 1500000, 1500000
        , '990211', CRYPTPACK.ENCRYPT('1234567', '1234567'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--> �� �� ����
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY, SSN1, SSN2) VALUES(EMPLOYEESEQ.NEXTVAL, '������', TO_DATE('1999-02-11', 'YYYY-MM-DD'), 1, '010-6678-9867', 1, 1, 1, 1500000, 1500000, '990211', CRYPTPACK.ENCRYPT('1234567', '1234567'))
;
 
 
SELECT *
FROM EMPLOYEE;
--==>>
/*
1	������	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	1
2	������	1999-02-11	1	010-6678-9867	1	1	1	1500000	1500000	990211	=o???	1
*/
 
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
 
-- ������ ����� �����ڷ� �Ӹ�
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
 
SELECT *
FROM EMPLOYEE;
--==>>
/*
1	������	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	0
2	������	1999-02-11	1	010-6678-9867	1	1	1	1500000	1500000	990211	=o???	1
*/
 
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
--�� ���̺��� ������ �����߱� ������
--   �̸� ������� ������ ��(VIEW)�� ���� ���� ���� �ۼ�(����)
--�� �� ����(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE AS TELEPHONE
     , E.DEPARTMENTID AS DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
     , E.POSITIONID AS POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
     , E.REGIONID AS REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID=E.REGIONID) AS REGIONNAME
     , E.BASICPAY AS BASICPAY
     , E.EXTRAPAY AS EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
     , E.GRADE AS GRADE
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�.
 
DESC EMPLOYEEVIEW;
--==>>
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
EMPLOYEEID     NOT NULL NUMBER       
NAME                    VARCHAR2(30) 
SSN                     CHAR(6)      
BIRTHDAY                VARCHAR2(10) 
LUNAR                   NUMBER(1)    
LUNARNAME               VARCHAR2(6)  
TELEPHONE               VARCHAR2(40) 
DEPARTMENTID            NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
POSITIONID              NUMBER       
POSITIONNAME            VARCHAR2(30) 
REGIONID                NUMBER       
REGIONNAME              VARCHAR2(30) 
BASICPAY                NUMBER       
EXTRAPAY                NUMBER       
PAY                     NUMBER       
GRADE                   NUMBER(1)    
*/
 
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY, GRADE
FROM EMPLOYEEVIEW;
 
SELECT *
FROM EMPLOYEE;
--==>>
/*1	������	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	0
2	������	1999-02-11	1	010-6678-9867	1	1	1	1500000	1500000	990211	=o???	1
*/
 
SELECT *
FROM EMPLOYEEVIEW;
--==>>
/*
1	������	971017	1997-10-17	0	���	010-6380-7047	1	���ߺ�	2	�븮	1	����	2500000	1500000	4000000	0
2	������	990211	1999-02-11	1	����	010-6678-9867	1	���ߺ�	1	���	1	����	1500000	1500000	3000000	1
*/
 
 
--�� �Ϲ� ��� �α��� ������
--   (ID �� EMPLOYEEID / PW �� SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID='�Է�ID���ڿ�'
  AND SSN2=(SELECT SSN2
            FROM EMPLOYEE
            WHERE EMPLOYEEID='�Է�ID���ڿ�');
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2=(SELECT SSN2
            FROM EMPLOYEE
            WHERE EMPLOYEEID=2);
--==>> ������
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234568', '1234568');
--==>> ��ȸ ��� ���� �� �α��� ����
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567', '1234567');
--==>> ������ �� �α��� ����
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=[�Է�ID]
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=[�Է�ID]) = CRYPTPACK.ENCRYPT([�Է�PW], [�Է�PW]);
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=[�Է�ID]
  AND SSN2 = CRYPTPACK.ENCRYPT([�Է�PW], [�Է�PW]);
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567');
--==>> ������
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=[�Է�ID]
  AND SSN2 = CRYPTPACK.ENCRYPT([�Է�PW], [�Է�PW]);
--> �� �� ����
 
--�� �Ϲݻ�� �α��� �� �� ������ ����
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=[�Է�ID] AND SSN2 = CRYPTPACK.ENCRYPT([�Է�PW], [�Է�PW])
;
 
 
--�� ������ �α��� ������
--   (ID �� EMPLOYEEID / PW �� SSN2 / GRADE �� 0)
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE = 0;
--==>> ��ȸ ��� ���� �� ������ �α��� ����
 
 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE = 0;
--==>> ������ �� ������ �α��� ����
 
--�� ������ �α��� �� �� ������ ����
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=[�Է�ID] AND SSN2 = CRYPTPACK.ENCRYPT([�Է�PW], [�Է�PW]) AND GRADE = 0
;
 
--�� ���� ������ ���� ������ ����
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> �� �� ����
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
 
--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.
 
--�� ���� ������ ���� ������ ����
UPDATE EMPLOYEE
SET NAME='������'
  , BIRTHDAY=TO_DATE('1999-02-11', 'YYYY-MM-DD')
  , LUNAR=1
  , TELEPHONE='010-6678-9867'
  , DEPARTMENTID=1
  , POSITIONID=1
  , REGIONID=2
  , BASICPAY=1500000
  , EXTRAPAY=1500000
  , SSN1='990211'
  , SSN2=CRYPTPACK.ENCRYPT('1234568', '1234568')
  , GRADE=1
WHERE EMPLOYEEID=2;
--> �� �� ����
UPDATE EMPLOYEE SET NAME='������', BIRTHDAY=TO_DATE('1999-02-11', 'YYYY-MM-DD'), LUNAR=1, TELEPHONE='010-6678-9867', DEPARTMENTID=1, POSITIONID=1, REGIONID=2, BASICPAY=1500000, EXTRAPAY=1500000, SSN1='990211', SSN2=CRYPTPACK.ENCRYPT('1234568', '1234568'), GRADE=1 WHERE EMPLOYEEID=2
;
 
 
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
 
SELECT*
FROM EMPLOYEEVIEW;
--==>>
/*
1	������	971017	1997-10-17	0	���	010-6380-7047	1	���ߺ�	2	�븮	1	����	2500000	1500000	4000000	0
2	������	990211	1999-02-11	1	����	010-6678-9867	1	���ߺ�	1	���	2	���	1500000	1500000	3000000	1
*/
 
SELECT *
FROM EMPLOYEE;
--==>>
/*
1	������	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	0
2	������	1999-02-11	1	010-6678-9867	1	1	2	1500000	1500000	990211	????	1
*/
 
--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
--�� ��ü �μ� ����Ʈ ��ȸ ������ ����(DEPARTMENTVIEW)
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK
FROM DEPARTMENTVIEW
ORDER BY DEPARTMENTID;
--> �� �� ����
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;
--==>>
/*
1	���ߺ�	2
2	��ȹ��	0
3	������	0
4	�����	0
*/
 
--�� �μ� ������ �Է� ������ ���� (DEPARTMENT)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '�ѹ���')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
 
-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
--�� �μ� ������ ���� ������ ���� (DEPARMENT)
DELETE
FROM DEPARTMENT
WHERE DEPARTMENTID=3;
--> �� �� ����
DELETE FROM DEPARTMENT WHERE DEPARTMENTID=3
;
 
-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.
 
--�� �μ� ������ ���� ������ ����(DEPARTMENT)
UPDATE DEPARTMENT
SET DEPARTMENTNAME='�ڿ���'
WHERE DEPARTMENTID=2;
 
--> �� �� ����
UPDATE DEPARTMENT SET DEPARTMENTNAME='�ڿ���' WHERE DEPARTMENTID=2
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
 
-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.
 
--�� ���� ����Ʈ ��ȸ ������ ����(REGIONVIEW)
SELECT REGIONID, REGIONNAME, DELCHECK
FROM REGIONVIEW
ORDER BY REGIONID;
--> �� �� ����
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW ORDER BY REGIONID
;
--==>>
/*
1	����	1
2	���	1
3	��õ	0
4	����	0
5	����	0
6	�뱸	0
*/
 
--�� ���� ������ ��� ������ ����(REGION)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
 
SELECT *
FROM REGIONVIEW;
--==>>
/*
1	����	1
2	���	1
3	��õ	0
4	����	0
5	����	0
6	�뱸	0
7	����	0
*/
 
--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
--�� ���� ������ ���� ������ ����(REGION)
DELETE
FROM REGION
WHERE REGIONID=3;
--> �� �� ����
DELETE FROM REGION WHERE REGIONID=3
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
 
--�ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.
 
--�� ���� ������ ���� ������ ����(REGION)
UPDATE REGION
SET REGIONNAME='����'
WHERE REGIONID=4;
--> �� �� ����
UPDATE REGION SET REGIONNAME='����' WHERE REGIONID=4
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
 
--Ŀ��
COMMIT;
--==>>Ŀ�� �Ϸ�.
 
--�� ��ü ���� ����Ʈ ��ȸ ������ ����(POSITIONVIEW)
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK
FROM POSITIONVIEW
ORDER BY POSITIONID;
--> �� �� ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;
--==>>
/*
1	���	1000000	1
2	�븮	2000000	1
3	����	3000000	0
4	����	4000000	0
*/
 
--�� ���� ������ �Է� ������ ����(POSITION)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '��', 5000000)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
 
--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
 
--�� ���� ������ ���� ������ ����(POSITION)
DELETE
FROM POSITION
WHERE POSITIONID=5;
--> �� �� ����
DELETE FROM POSITION WHERE POSITIONID=5
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
 
-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.
 
--�� ���� ������ ���� ������ ����(POSITION)
UPDATE POSITION
SET POSITIONNAME='����', MINBASICPAY=2000000
WHERE POSITIONID=2;
--> �� �� ����
UPDATE POSITION SET POSITIONNAME='����', MINBASICPAY=2000000 WHERE POSITIONID=2
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
 
--�ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.
 
--�� ���� �˻� ������ ����(���̵� Ȱ���Ͽ� ���� ������ �˻�)
SELECT EMPLOYEEID, NAME, SSN1
        , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
        , LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY
FROM EMPLOYEE
WHERE EMPLOYEEID=1;
--> �� �� ����
SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=1
;
--==>> 1	������	971017	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000
 
DESC EMPLOYEEVIEW;
DESC EMPLOYEE;
 
-- �μ��˻�
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW WHERE DEPARTMENTID =1
;
 
-- �����˻�
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW WHERE REGIONID=1
;
 
-- �����˻�
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW WHERE POSITIONID=1
;
 
commit;
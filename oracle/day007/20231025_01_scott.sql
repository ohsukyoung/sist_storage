SELECT USER
FROM DUAL;
--==>> SCOTT


--���� HAVING ����--

/* 1-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺��� �μ���ȣ�� 20, 30�� �μ��� �������
--   �μ��� �� �޿��� 10000 ���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�.

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE �μ���ȣ�� 20, 30
GROUP BY �μ���ȣ;


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
*/
-- �μ���ȣ 30�� 10000���� ����, �μ���ȣ 20�� 10000���� ������ �� �� ����


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR
AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> ���� �߻�
--      (ORA-00934: group function is not allowed here)

-- �׷����� ������ ������ [DEPTNO IN (20, 30)] �� �Ϲ��������� ������ �� ����
 

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;    -- �׷쿡 ���� ����
--==>> 30	9400
-- SELECT ���� PARSING ������ �����ϸ鼭 HAVING ����ϱ�



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
-- EMP ���̺� ��ü�� 1���� �޸𸮿� �ۿø� + �޺κ� ���� (VS) WHERE���� ���� ���, ���̺��� WHERE ������ 1���� �޸𸮿� �ۿø� + �޺κ� ����
-- �������� ȿ������ �ظ��ϰ� �ٸ�. �� ��°�� ������� �������� �����ϴ� ���� �ٶ�����


--------------------------------------------------------------------------------

--���� ��ø �׷��Լ� / �м��Լ� ����--

--�� �׷��Լ��� 2 LEVEL ���� ��ø�ؼ� ����� �� �ִ�.
-- �Լ��� �Ϲ������� ��ø�� ���� ������ ���µ�, �׷��Լ��� ������ Ư���� ���ѵǾ�����(�̰͵� ����Ŭ�� ��ø�ǰ�, �������� ��ø�� �ȵ�)

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
--> ����Ŭ 9i���� ����Ǿ��� �Լ� (MSSQL�� �Ƹ��� 2005���� ����...)

--> ���� ���������� RANK() �� DENSE_RANK() �� ����� �� ���� ������
--  �� �Լ��� Ȱ������ �ʴ� �ٸ� ����� ã�ƾ� �Ѵ�.
--  ���� ���... �޿� ������ ���ϰ��� �Ѵٸ�...
--  �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� ��
--  Ȯ���� ���ڿ� ��+1���� �߰��� ������ �ָ�...
--  �� ���� �� �ش� ����� ����� �ȴ�.


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
WHERE SAL > 800;        -- SMITH �� �޿�
--==>> 14               -- SMITH �� ���


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;       -- ALLEN �� �޿�
--==>> 7                -- ALLEN �� ���



--�� ���� ��� ����(=��� ���� ����)

-- �������� ���������� ����ִ°� = ��������

-- ���� ������ �ִ� ���̺��� �÷���
-- ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
-- �츮�� �� �������� ���� ��� ����(��� ���� ����)��� �θ���.


SELECT ENAME "�����", SAL "�޿�", 1 "�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�", (1) "�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�", (SELECT COUNT(*) + 1
                                    FROM EMP
                                    WHERE SAL > 1600;) "�޿����"
FROM EMP;

SELECT E.ENAME "�����", E.SAL "�޿�", (SELECT COUNT(*) + 1
                                        FROM EMP
                                        WHERE SAL > E.SAL) "�޿����"
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

/* 2-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺��� �������
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
--   ��, RANK() �Լ��� ������� �ʰ�, ������������ ����� �� �ֵ��� �Ѵ�.


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL> 800;             --SMITH �� �޿�
--==>> 14                   --SMITH �� �޿� ���(-> ��ü�޿����)


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800             --SMITH �� �޿�
  AND DEPTNO = 20;          --SMITH �� �μ���ȣ
--==>> 5                    --SMITH �� �޿� ���(-> �μ����޿����)




SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ", (1) "�μ����޿����", (1) "��ü�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ"
    , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > 800
        AND DEPTNO = 20;) "�μ����޿����"
    , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL> 800;) "��ü�޿����"
FROM EMP;

--> SMITH ���� ���� ��������


SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ", (1) "�μ����޿����", (1) "��ü�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ"
    , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL
        AND DEPTNO = E.DEPTNO) "�μ����޿����"
    , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL> E.SAL) "��ü�޿����"
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


--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
                            - �� �μ� ������ �Ի����ں��� ������ �޿��� ��
-----------------------------------------------------------------------
�����   �μ���ȣ     �Ի���      �޿�     �μ����Ի纰�޿�����
-----------------------------------------------------------------------
SMITH     20       1980-12-17     800         800
JONES     20       1981-04-20     2975        3775
FORD      20       1981-12-03     3000        6775

-----------------------------------------------------------------------
*/



SELECT EMP.ENAME "�����", EMP.DEPTNO "�μ���ȣ", EMP.HIREDATE "�Ի���", EMP.SAL "�޿�"
, (1) "�μ����Ի纰�޿�����"
FROM EMP
ORDER BY 2, 3;


SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
, (1) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;


SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
, (SELECT SUM(E2.SAL) FROM EMP E2 WHERE E2.DEPTNO = E1.DEPTNO) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;


SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
, (SELECT SUM(E2.SAL)
    FROM EMP E2 
    WHERE E2.DEPTNO = E1.DEPTNO
    AND E2.HIREDATE<=E1.HIREDATE) "�μ����Ի纰�޿�����"
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


SELECT E.ENAME "�����", E.DEPTNO "�μ���ȣ", E.HIREDATE "�Ի���", E.SAL "�޿�"
, (SELECT SUM(SAL) FROM EMP WHERE (DEPTNO=E.DEPTNO) AND (HIREDATE<=E.HIREDATE)) "�μ����Ի纰�޿�����"
FROM EMP E
ORDER BY 2,3;


/* 3-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺��� �������
--   �Ի��� ����� ���� ���� ������ ����
--   �Ի����� �ο����� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

/*
----------- ---------
�Ի���    �ο���
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

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
        , COUNT(*) "�ο���"
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

-- ���1)
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
        , COUNT(*) "�ο���"
FROM EMP
WHERE COUNT(*) = 2
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> ���� �߻�(ORA-00934: group function is not allowed here)
-- WHERE ���� COUNT �Ұ��� �ؼ� ���� �߻��Ѵ�.

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
        , COUNT(*) "�ο���"
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
HAVING COUNT(*) = (�Ի��� ���� �ִ� �ο�);
-- �������� 2���� ���� �츮�� ���� �־��ִ� ���� �ƴ϶�
-- ����Ŭ���� �˾Ƽ� ã�Բ� �����ؾ� �Ѵ�.

-- �Ի��� ���� �ִ� �ο�
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

-- �Ի��� ���� �ִ� �ο���
SELECT MAX(COUNT(*))
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');


FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                    FROM EMP
                    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));

--(�Ի��� ���� �ִ� �ο�) �� �ϰ� �ٲ��ش�.(����!)

-- ���2)
SELECT TO_CHAR(HIREDATE,'YYYY-MM') "�Ի���"
        , COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');

SELECT T1.�Ի���, T1.�ο���
FROM
(
    SELECT TO_CHAR(HIREDATE,'YYYY-MM') "�Ի���"
            , COUNT(*) "�ο���"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) T1
WHERE T1.�ο��� = (2);

--(2) �ڸ��� �ٲ� �� �ֵ��� �ڵ� ¥��
SELECT T1.�Ի���, T1.�ο���
FROM
(
    SELECT TO_CHAR(HIREDATE,'YYYY-MM') "�Ի���"
            , COUNT(*) "�ο���"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) T1
WHERE T1.�ο��� = (SELECT MAX(T2.�ο���)
                    FROM
                    (
                        SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
                            ,COUNT(*) "�ο���"
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

--���3)
SELECT T1.�Ի���, T1.�ο���
FROM
(
    SELECT TO_CHAR(HIREDATE,'YYYY-MM') "�Ի���"
            , COUNT(*) "�ο���"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) T1
WHERE T1.�ο��� = (SELECT MAX(COUNT(*))
                    FROM EMP
                    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
                  )
ORDER BY 1;

--------------------------------------------------------------------------------

--���� ROW_NUMBER ����--

SELECT ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
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

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "����"
    , ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
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

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "����"
    , ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
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
-- '����'�̶�� �ο��� ��ȣ�� ������ �ٲ㵵 ������ ��ȣó�� �پ������� Ȯ���Ѵ�.

SELECT ROW_NUMBER() OVER(ORDER BY ENAME) "����"
    , ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
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
-- ������ ENAME�� �������� ������ȣ �ο��ߴ�.(���� �ڵ�� �ٸ� �κ�: SELECT�� ORDER BY)

--�� �Խ����� �Խù� ��ȣ�� SEQUENCE�� IDENTITY�� ����ϰ� �Ǹ�
--   �Խù��� �������� ���... ������ �Խù����� �ڸ��� ���� ��ȣ�� ����
--   �Խù��� ��ϵǴ� ��Ȳ�� �߻��ϰ� �ȴ�.
--   �̴�... ���ȼ� �����̳�... �̰��� ... �ٶ������� ���� ������ �� �ֱ� ������
--   ROW_NUMBER()�� ����� ����� �� �� �ִ�.
--   ������ �������� ����� ������ SEQUENCE �� IDENTITY �� ���������,
--   �ܼ��� �Խù��� ���ȭ�Ͽ� ����ڿ��� ����Ʈ �������� ������ ������
--   ������� �ʴ� ���� �ٶ����� �� �ִ�.

--   ���1) �߰��� ��ȣ�� ���°��� ����ڰ� �˰� �ȴٸ�(�Խù��� �����ϱ� ������)
--   ������� ���忡���� ���͸��� �����ϴ� �Խ����̶�� ������ ��� �ŷڼ��� ��������.

--   ���2) �⵿���� �ռ���� ���ؼ� ����ڿ��� �������� �Խù� ��ȣ�� ���� DB��ȣ�� �����ϱ⵵ �Ѵ�.



-- �� SEQUENCE(������: �ֹ���ȣ)
--    -> �������� �ǹ�: 1. (�Ϸ���) �������� ��ǵ� 2. (���, �ൿ ����) ����

-- �� ������ ����
CREATE SEQUENCE SEQ_BOARD   -- �⺻���� ������ ���� ����
START WITH 1                -- ���۰� ����
INCREMENT BY 1              -- ������ ����
NOMAXVALUE                  -- �ִ밪 ���� �ɼ�
NOCACHE;                    -- ĳ�� ��� ���� ���� �ɼ�
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.



-- ĳ�ö�, �����ϱ� ���� ���� �ο��� �Ѳ����� ������ �ϸ� �� �� ���� ��
-- ������� �̾Ƽ� �������� ���� ��� �� ���� ������ ���ð��� ���� �� �ִµ�
-- �Ѳ����� �������� �̾Ƽ� �������ִ� �Ͱ� ����.


--�� �ǽ� ���̺� ����(���̺��: TBL_BOARD)
CREATE TABLE TBL_BOARD                   -- TBL_BOARD ���̺� ���� ���� -> �Խ��� ���̺�
( NO            NUMBER                  -- �Խù� ��ȣ           -> X ����� �ۼ�
, TITLE         VARCHAR2(50)            -- �Խù� ����           -> O
, CONTENTS      VARCHAR2(100)           -- �Խù� ����           -> O
, NAME          VARCHAR2(20)            -- �Խù� �ۼ���         -> ��
, PW            VARCHAR2(20)            -- �Խù� �н�����       -> ��
, CREATED       DATE DEFAULT SYSDATE    -- �Խù� �ۼ���         -> X
);
--==>> Table TL_BOARD��(��) �����Ǿ����ϴ�.

--�� ������ �Է� -> �Խ��ǿ� �Խù� �ۼ�
-- SEQ_BOARD.NEXTVAL: SEQ_BOARD���� �������� ��ȣǥ�ο��Ѵ�.
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '��~~~ �����', '10�и� ������ �ò���', '����ȯ', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '��~ ������', '10�и� �ڰ� �ò���', '���ѿ�', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '��~ ����', '�Ϸ��Ϸ簡 ����־��', '������', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����ʹ�', '������ �ʹ��ʹ� ����;��', '���ȯ', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����Ŀ�', '������ �Ծ��µ� ����Ŀ�', '�����', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '���� �����ֳ׿�', '�� �ð� ���̳� �����ֳ׿�', '������', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�׸��ϰ�ʹ�', '�׳� �Ѿ��....', '��ȣ��', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '��~ �����', '����������', '������', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ұټұ�', '�ý÷��ý÷�', '������', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '���ڶ��', '���� ���� ���ڶ��', '�赿��', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

--�� Ȯ��
SELECT *
FROM TBL_BOARD;
/*
1	��~~~ �����	10�и� ������ �ò���	    ����ȯ	java006$	2023-10-25 15:26:04
2	��~ ������	    10�и� �ڰ� �ò���	        ���ѿ�	java006$	2023-10-25 15:28:11
3	��~ ����	    �Ϸ��Ϸ簡 ����־��	    ������	java006$	2023-10-25 15:31:02
4	����ʹ�	    ������ �ʹ��ʹ� ����;��	���ȯ	java006$	2023-10-25 15:32:03
5	����Ŀ�	    ������ �Ծ��µ� ����Ŀ�	�����	java006$	2023-10-25 15:34:01
6	���� �����ֳ׿�	�� �ð� ���̳� �����ֳ׿�	������	java006$	2023-10-25 15:35:23
7	�׸��ϰ�ʹ�	�׳� �Ѿ��....	        ��ȣ��	java006$	2023-10-25 15:38:26
8	��~ �����	    ����������	                ������	java006$	2023-10-25 15:39:24
9	�ұټұ�	    �ý÷��ý÷�	            ������	java006$	2023-10-25 15:40:25
10	���ڶ��	    ���� ���� ���ڶ��	        �赿��	java006$	2023-10-25 15:41:17
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�ԿϷ�

--�� �Խù� ����
SELECT *
FROM TBL_BOARD
WHERE NO=1;

DELETE
FROM TBL_BOARD
WHERE NO=1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_BOARD
WHERE NO=6;
--==>> 6	���� �����ֳ׿�	�� �ð� ���̳� �����ֳ׿�	������	java006$	2023-10-25 15:35:23

DELETE
FROM TBL_BOARD
WHERE NO=6;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_BOARD
WHERE NO=8;
--==>> 8	��~ �����	����������	������	java006$	2023-10-25 15:39:24

DELETE
FROM TBL_BOARD
WHERE NO=8;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_BOARD
WHERE NO=10;
--==>> 10	���ڶ��	���� ���� ���ڶ��	�赿��	java006$	2023-10-25 15:41:17

DELETE
FROM TBL_BOARD
WHERE NO=10;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_BOARD;
/*
2	��~ ������	10�и� �ڰ� �ò���	���ѿ�	java006$	2023-10-25 15:28:11
3	��~ ����	�Ϸ��Ϸ簡 ����־��	������	java006$	2023-10-25 15:31:02
4	����ʹ�	������ �ʹ��ʹ� ����;��	���ȯ	java006$	2023-10-25 15:32:03
5	����Ŀ�	������ �Ծ��µ� ����Ŀ�	�����	java006$	2023-10-25 15:34:01
7	�׸��ϰ�ʹ�	�׳� �Ѿ��....	��ȣ��	java006$	2023-10-25 15:38:26
9	�ұټұ�	�ý÷��ý÷�	������	java006$	2023-10-25 15:40:25
*/

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����սô�', '���� ���� ������ �ʾƿ�', '���ϼ�', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� �Խù� ����
SELECT *
FROM TBL_BOARD
WHERE NO = 7;
--==>> 7	�׸��ϰ�ʹ�	�׳� �Ѿ��....	��ȣ��	java006$	2023-10-25 15:38:26

DELETE
FROM TBL_BOARD
WHERE NO = 7;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_BOARD;
/*
2	��~ ������	10�и� �ڰ� �ò���	���ѿ�	java006$	2023-10-25 15:28:11
3	��~ ����	�Ϸ��Ϸ簡 ����־��	������	java006$	2023-10-25 15:31:02
4	����ʹ�	������ �ʹ��ʹ� ����;��	���ȯ	java006$	2023-10-25 15:32:03
5	����Ŀ�	������ �Ծ��µ� ����Ŀ�	�����	java006$	2023-10-25 15:34:01
9	�ұټұ�	�ý÷��ý÷�	������	java006$	2023-10-25 15:40:25
11	�����սô�	���� ���� ������ �ʾƿ�	���ϼ�	java006$	2023-10-25 16:07:05
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �Խ����� �Խù� ����Ʈ ��ȸ
SELECT NO "�۹�ȣ", TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD;
/*
2	��~ ������	���ѿ�	2023-10-25 15:28:11
3	��~ ����	������	2023-10-25 15:31:02
4	����ʹ�	���ȯ	2023-10-25 15:32:03
5	����Ŀ�	�����	2023-10-25 15:34:01
9	�ұټұ�	������	2023-10-25 15:40:25
11	�����սô�	���ϼ�	2023-10-25 16:07:05
*/

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
     , TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD;
/*
1	��~ ������	���ѿ�	2023-10-25 15:28:11
2	��~ ����	������	2023-10-25 15:31:02
3	����ʹ�	���ȯ	2023-10-25 15:32:03
4	����Ŀ�	�����	2023-10-25 15:34:01
5	�ұټұ�	������	2023-10-25 15:40:25
6	�����սô�	���ϼ�	2023-10-25 16:07:05
*/

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
     , TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
/*
6	�����սô�	���ϼ�	2023-10-25 16:07:05
5	�ұټұ�	������	2023-10-25 15:40:25
4	����Ŀ�	�����	2023-10-25 15:34:01
3	����ʹ�	���ȯ	2023-10-25 15:32:03
2	��~ ����	������	2023-10-25 15:31:02
1	��~ ������	���ѿ�	2023-10-25 15:28:11
*/

--------------------------------------------------------------------------------

--���� JOIN(����) ����--

--** ������ ������ ��: ��ġ��, �����ϴ� 
--** 92 �ڵ�: 92�⿡ Ȯ���Ǿ ������ �ڵ�
--** 99 �ڵ�: 99�⿡ Ȯ���Ǿ ������ �ڵ�

--**======================================================
--** ���: �ǹ����� ��� ���̱� ������... �Ѵ� �˾ƾ� ��
--**======================================================

-- 1. SQL 1992 CODE

-- CROSS JOIN
--** ��� ���� ������ �� ����ִ� �ڵ�
SELECT *
FROM EMP, DEPT;     -- EMP ���̺��, DEPT ���̺��� �ۿ÷���
--> ���п��� ���ϴ� ��ī��Ʈ ��(CATERSIAN PRODUCT)
--  �� ���̺��� ������ ��� ����� ��(14 * 4 = 56)
/*EX)
EMPNO	ENAME	JOB	MGR	HIREDATE	SAL	COMM	DEPTNO	DEPTNO_1	DNAME	LOC
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	10	ACCOUNTING	NEW YORK

7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	20	RESEARCH	DALLAS

7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	30	SALES	CHICAGO

7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	40	OPERATIONS	BOSTON*/
--==>> SMITH�� ���������� �����ؼ� ������

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

-- EQUI JOIN: ���� ��Ȯ�ϰ� ��ġ�ϴ� �����͵� ���� �����Ͽ� ���ս�Ű�� ���� ���
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

-- NON EQUI JOIN: ���� �ȿ� ������ �͵鳢�� �����Ű�� ���� ���
--** ��Ȯ�ϰ� ��ġ�ϴ� �������� ������ �ƴ�

SELECT *
FROM EMP, SALGRADE
WHERE EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL;
--** EMP���̺�� SQLGRADE ���̺��� �����ϴµ�, EMP���̺��� �޿��� SALGRADE�� ���� ������ SALGRADE���̺��� ������ ������ ���� �����Ѵ�.

SELECT *
FROM EMP E, SALGRADE S                      --** ������ , �޸���
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;    --** ���������� WHERE�� ����
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

-- EQUI JOIN �� (+) �� Ȱ���� ���� ���
SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� 14���� �����Ͱ� ���յǾ� ��ȭ�� ��Ȳ
-- ��, �μ���ȣ�� ���� ���� �����(5) ��� ����
-- ����, �Ҽ� ����� ���� ���� �μ�(2) ��� ����

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--> �� 19 ���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
-- �Ҽ� ����� ���� ���� �μ�(2) ���� -------------------------(+)
-- �μ���ȣ�� ���� ���� �����(5) ��� ��ȸ
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
8007	�ڳ���	SALESMAN	7698	2023-10-24 14:47:30	1000					
8006	������	SALESMAN	7698	2023-10-24 14:47:30	2500					
8003	�����	SALESMAN	7698	2023-10-24 14:47:30	1700					
8002	���ϼ�	CLERK	7566	2023-10-24 14:47:30	2000	10				
8001	������	CLERK	7566	2023-10-24 14:47:30	1500	10				
*/

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--> �� 16 ���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
-- �Ҽ� ����� ���� ���� �μ�(2) ��� ��ȸ
-- �μ���ȣ�� ���� ���� �����(5) ���� -------------------------(+)

--�� <(+)> �� ���� �� ���̺��� �����͸� ��� �޸𸮿� ������ ��             -- ����
--   <(+)> �� �ִ� �� ���̺��� �����͸� �ϳ��ϳ� Ȯ���Ͽ� ���ս�Ű�� ���·� -- �߰�(÷��)
--   JOIN �� �̷������.

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
								50	���ߺ�	����
								40	OPERATIONS	BOSTON
*/

--�̿� ���� ������...
SELECT *
FROM TBL_EMP E, TBL_DEPT D
FROM E.DEPTNO(+) = D.DEPTNO(+);
-- �̷����� JOIN�� �������� �ʴ´�.



-- 2. SQL 1999 CODE             -> <JOIN> Ű���� ���� -> JOIN(����)�� ���� ���
--** JOIN�̶�� Ű���尡 ���δ� ! -> 99�ڵ�
--**                    �Ⱥ��δ�! -> 92�ڵ�
--                              -> <ON> Ű���� ����   -> ���� ������ WHERE ��� ON

-- CROSS JOIN
SELECT *
FROM EMP CROSS JOIN DEPT;

-- INNER JOIN
SELECT *
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

--** �����(ALIAS- ��Ī) ����
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

--** INNER ���� ����
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- OUTER JOIN
--** �����ܼ� ������ �κ�
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

--** OUTER ��������
SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;


--�� ����
--1��)
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO
AND E.JOB = 'CLERK';
--> �̿� ���� ������� �������� �����ص�
--  ��ȸ ����� ��� �������� ������ ����.

--2��)
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'CLERK';
--> ������ �̿� ���� �����Ͽ�
--  ��ȸ�ϴ� ���� �����Ѵ�.

--**==============================
--** ON: ��������
--** WHERE��: ��ȸ����
--**==============================

--** SELECT ���� ó�� 
--** WHERE ���� ���� ���ǿ� �´� �͸� 1�������� �ۿø�
--** 1��) TBL_DEPT ���� & TBL_EMP ��� �ۿø�
--** 2��) TBL_DEPT �� TBL_EMP���ǿ� �´� �͸� �ۿø�

/* 4-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� EMP ���̺�� DEPT ���̺��� �������
--   ������ MANAGER�� CLERK �� ����鸸
--   �μ���ȣ, �μ���, �����, ������, �޿� �׸��� ��ȸ�Ѵ�.

-- �μ���ȣ,    �μ���,    �����,    ������,    �޿�
-- DEPTNO       DNAME       ENAME       JOB      SAL
-- E, D         D           E           E        E

SELECT D.EMPNO "�μ���ȣ", D.DNAME "�μ���", E.ENAME "�����", E.JOB "������", E.SAL "�޿�"
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

SELECT �μ���ȣ, �μ���, �����, ������, �޿�
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>> ���� �߻�(ORA-00918: column ambiguously defined)
--     �� ���̺� �� �ߺ��Ǵ� Į���� ����
--     �Ҽ� ���̺��� ������� (��������) �Ѵ�.

--�� �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--   �θ� ���̺��� Į���� ������ �� �ֵ��� ó���ؾ� �Ѵ�.

--** �ΰ��� ���̺��� ���� ��� �θ����̺��� �����ͼ� �����
--** �θ����̺��̶�? 
--** EMP�� DEPTNO ���� ������ �ִµ� DEPT�� DEPTNO ���� �ϳ��� ���� -> ���� �θ����̺��� DEPTNO

SELECT *
FROM DEPT;      -- �θ����̺�

SELECT *
FROM EMP;       -- �ڽ����̺�

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- �� ���̺� ��� ���ԵǾ� �ִ� �ߺ��� �÷��� �ƴϴ���
-- �÷��� �Ҽ� ���̺��� ����� �� �� �ֱ⸦ �����Ѵ�.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--** ��, �Ҽ����̺��� ������� ������ �ش� SELECT�� ã������ ���� ���̺��� ��ȸ�Ѵ�.
--** ���� �Ҽ����̺��� ��������ν� ����Ŭ���� �۾����ø� ��Ȯ�ϰ� �Ͽ�, ���ʿ��� �۾��� �ּ�ȭ�Ѵ�.

--** �ƿ������ο��� ����� �����͸� �����ö� �θ����̺��� �ƴϸ� ����Ʈ�ؼ� ������ �� ����.

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
/*
DEPTNO	DNAME	    ENAME	JOB	    SAL
40  	OPERATIONS	(null)	(null)  (null)  -- DEPTNO�� 40	
*/

SELECT E.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--==>>
/*
DEPTNO	DNAME	    ENAME	JOB	    SAL
(null)	OPERATIONS	(null)	(null)  (null)	-- DEPTNO�� (null)
*/
SELECT USER
FROM DUAL;
--==>> SCOTT

--���� HAVING ����--


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


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO;

-- �ϳ��� ���� ������ �ƴ϶�, �׷����� ���� �͵� �����o���� �����̹Ƿ� WHERE�� ����� �� ����.
-- + �׷쿡 ���� �����Լ��� ���� ������ HAVING�� ���� �ۼ��ϵ��� �Ѵ�.
-- HAVING : �׷쿡 ���� ������ ����ϴ� ���̴�.



-- WHERE ������ �׷� ������ ���� ������ ����� �� �����Ƿ�
-- ������ ���� ������ �߻��ߴ�.
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR �� ���� ����.
    AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> ���� �߻�
--     (ORA-00934: group function is not allowed here)

-- HAVING ���� ���� �׷쿡 ���� ������ �������,
-- ������ ���� �ʰ� ���������� ����Ǵ� ���� ���� �� ���� �ִ�.


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR �� ���� ����.
GROUP BY DEPTNO 
HAVING SUM(SAL) < 10000;    -- �׷쿡 ���� ����



-- ��� ���� ����� �� SELECT ���� PARSING ������ �׻� �����ϵ��� ����.
-- ������ �ۼ��ϴ� ��ġ�� �׻� �ؼ��ؾ߸� �Ѵ�.



SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR �� ���� ����.
GROUP BY DEPTNO 
HAVING SUM(SAL) < 10000; 

-- FROM EMP �� �ϰ�, HAVING�� �߰� ������ �����ϸ�...
-- ù ����� EMP ��ü�� �޸𸮿� �ۿø�����
-- FROM WHERE DEPTNO IN (20, 30) ���� �ϰ� �Ǹ�
-- WHERE ���� ���� �����͵鸸 �޸𸮿� �ۿø��Ƿ�... 
-- ù ��°�� �ʿ��� �޸𸮵鸸 �ۿø� �Ŀ� �ļ� ó���� �ϴ� ���� �ٶ��� �ϹǷ�
-- HAVING ���ǿ� WHERE ������ �߰������� �ۼ��ϰ� �Ǹ� ���ҽ��� �� ũ�� �Ҹ��ϹǷ�...
-- �̷��� �ۼ��ϴ� ���� �ٶ��� ���� �ʴ�.



SELECT DEPTN, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000
    AND DEPTNO IN (20, 30);
    
SELECT *
FROM EMP;

-- HAVING ���� �߰������� 20, 30 �μ��� ���������� ������ ���� ���� �ٶ������� �ʴ�.
-- �ʿ��� �����͵��� 20, 30 �μ��� �ش��ϴ� �����͵� ���ε�
-- ù ����� EMP ���̺��� �����͵��� ��� �������� �����̴�.


    
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;

SELECT *
FROM EMP
WHERE DEPTNO IN (20, 30);

-- WHERE ���� ���� ������ 20, 30 �μ��� ���������� �ۼ��ϸ�
-- �ʿ��� �����͵鸸 ���� �޸𸮿� �ۿø��Ƿ� ���ҽ� �Ҹ� �����Ѵ�.


-- �� ������ ------------------------------------------------------------------
-- HAVING ���ο� 20, 30 �μ��� �������� ������ ��� �ۼ��ϴ� ���� �ƴ϶�,
-- WHERE ���� 1�������� �ʿ��� �����͵��� �����ϴ� ������ ���� �ۼ��� �Ŀ�
-- HAVING ���� �߰����� SUM(SAL) < 10000 ���Ǹ��� �����Ű�� ���� �ٶ����ϴ�.
-------------------------------------------------------------------------------




--------------------------------------------------------------------------------


--���� ��ø �׷��Լ� / �м��Լ� ����--


--�� �׷� �Լ��� 2 LEVEL ���� ��ø�ؼ� ����� �� �ִ�.


SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
9400
10875
8750
*/


-- SUM() �����Լ��� �ٽ� MAX() �����Լ��� ���μ� 
-- ���� �ִ� ������ ���� ���� Ȯ���� �� �ִ�.

SELECT MAX(SUM(SAL)) "COL1"
FROM EMP
GROUP BY DEPTNO;
--==>> 10875




-- RANK() / DENSE_RANK()
-- ORACLE 9i ���� ����... (MSSQL 2005 ���� ����...)

-- ���� �������� RANK, ���� ���Ϸ��� ��� �ؾ��ϳ�?

--> ���� ���������� RANK() �� DENSE_RANK() �� ����� �� ���� ������
--  �� �Լ��� Ȱ������ �ʴ� �ٸ� ����� ã�ƾ� �Ѵ�.
--  ���� ���... �޿� ������ ���ϰ��� �Ѵٸ�...
--  �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� ��
--  Ȯ���� ���ڿ� ��+ 1�� �� �߰��� ������ �ָ�...
--  �� ���� �� �ش� ����� ����� �ȴ�.


SELECT ENAME, SAL
FROM EMP;
-- SMITH �� SAL : 800
-- ALLEN �� SAL : 1600


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;        -- SMITH �� �޿�
--==>> 14               -- SMITH �� �޿� ���


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;       -- ALLEN �� �޿� 
--==>> 7                -- ALLEN �� �޿� ���



-- ��ü���� ��������...
-- ���� ���� �Ǵٸ� ����...
-- ���� ������ ��������
-->> �� [INLINE VIEW] = ���� ������ �ܺ� ������ FROM ���� ��ġ�ϴ� ��.

--�� ���� ��� ����(��� ���� ����)
--  ���� ������ �ִ� ���̺��� �÷���
--  ���� ������ ������(WHERE��, HAVING��) �� ���Ǵ� ���
--  �츮�� �� �������� ���� ��� ����(��� ���� ����)��� �θ���.


SELECT ENAME "�����", SAL "�޿�", 1 "�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�", (1) "�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�",  (SELECT COUNT(*) + 1
                                    FROM EMP
                                    WHERE SAL > 800) "�޿����"
FROM EMP;




SELECT E.ENAME "�����", E.SAL "�޿�",  (SELECT COUNT(*) + 1
                                        FROM EMP
                                        WHERE SAL > E.SAL) "�޿����"
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


-- ���� ��� ���� ���ο��� ("�޿����")
-- SAL > 800(SMITH�� SAL ��) �̾��� ���ǽ���
-- 800 ���� ������ ���°� �ƴ϶�, SMITH���� ~ KING ���� ��� ��ȸ�ϰ��� �Ѵٸ�
-- SAL �� ��� ����Ǿ�߸� �Ѵ�
-- ����, �ܺ��� FROM EMP ���̺��� EMP�� E��� ALIAS�� �ٿ���
-- ���� ��� Ŀ�� ������ EMP ��, �ܺ� EMP ���̺��� �����������ν�
-- E.SAL�� �ϳ��� ����� ������ ����� ���Ͽ� �޿� ����� Ȯ������ �� �ֵ���
-- ó���� ���̴�.

-- ��, SELECT �� �ȿ��� ���� ������ ������ �� �ְ�, �̸� ���� ��� ������� �ϸ�
-- �ܺ� ���� ������ ���̺�� ���� ���̺��� ���� ��� �������� ����ϰ� �ִٸ�
-- ALIAS �� ����Ͽ� ���̺��� �����������ν� ���ϴ� ó���� �� �� �ְ� �Ǵ� ���̴�...




--�� EMP ���̺��� �������
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
--   ��, RANK() �Լ��� ������� �ʰ�, ������������ Ȱ���� �� �ֵ��� �Ѵ�.




SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;


SELECT (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "��ü�޿����"
FROM EMP E;


SELECT E.ENAME "�����", E.SAL "�޿�", E.DEPTNO "�μ���ȣ"
        ,  (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > E.SAL) "��ü�޿����"
FROM EMP E;


SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;







SELECT DEPTNO
  , SUM(SAL) "�μ����޿�"
FROM EMP
GROUP BY DEPTNO;


SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;









SELECT E.ENAME "�����", E.SAL "�޿�", E.DEPTNO "�μ���ȣ"
        ,  (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > E.SAL) "��ü�޿����"
        ,  (SELECT COUNT(*) + 1
            FROM EMP
            WHERE SAL > E.SAL
                  AND
                  DEPTNO = E.DEPTNO) "�μ����޿����"
FROM EMP E
ORDER BY �μ���ȣ ASC, �μ����޿���� ASC, ��ü�޿���� ASC;



SELECT (
            SELECT COUNT(*) + 1
            FROM
            (
                SELECT DEPTNO
                     , SUM(SAL) "�μ����޿�"
                FROM EMP
                GROUP BY DEPTNO
            ) A
             WHERE T.�μ����޿� < A.�μ����޿�
        ) "�μ����޿�����"
        , T.DEPTNO "�μ���ȣ"
        , T.�μ����޿�
        
        
FROM
(    
    SELECT  DEPTNO
            , SUM(SAL) "�μ����޿�"
    FROM EMP
    GROUP BY DEPTNO
) T
ORDER BY 1 ASC;





SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;    -- SMITH �� �޿�
--==>> 14           -- SMITH �� �޿� ��� (�� ��ü�޿����)



SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800     -- SMITH �� �޿�
  AND DEPTNO = 20;  -- SMITH �� �μ���ȣ
--==>> 5            -- SMITH �� �޿� ���(�� �μ����޿����)



SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ"
     , (1) "�μ����޿����"
     , (1) "��ü�޿����"
FROM EMP;



-- SMITH�� �μ��� �޿����, ��ü�޿����
SELECT E.ENAME "�����", E.SAL "�޿�", E.DEPTNO "�μ���ȣ"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL     -- SMITH �� �޿�
          AND DEPTNO = E.DEPTNO) "�μ����޿����"
    
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "��ü�޿����"
 
FROM EMP E;



SELECT E.ENAME "�����", E.SAL "�޿�", E.DEPTNO "�μ���ȣ"
      , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL     -- SMITH �� �޿�
          AND DEPTNO = E.DEPTNO) "�μ����޿����"
     
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "��ü�޿����"
    
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

--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
                                - �� �μ� ������ �Ի����ں��� ������ �޿��� ��
--------- ------------- -------------- ---------- ----------------------------
 �����      �μ���ȣ        �Ի���        �޿�        �μ����Ի纰�޿�����
--------- ------------- -------------- ---------- ----------------------------
 SMITH         20         1980-12-17      800             800
 JONES	       20	      1981-04-02	     2975            3775
 FORD          20         1981-12-03     3000            6775
------------------------------------------------------------------------------
 
*/

SELECT E.DEPTNO "�μ���ȣ"
         , E.SAL "�޿�"
         , E.HIREDATE "�������"
    
FROM 
(
    SELECT SAL
    FROM EMP
) T
, EMP E
WHERE E.SAL = T.SAL
ORDER BY DEPTNO ASC, HIREDATE ASC;





SELECT E.ENAME "�����", E.SAL "�޿�", E.DEPTNO "�μ���ȣ"
      , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL     -- SMITH �� �޿�
          AND DEPTNO = E.DEPTNO) "�μ����޿����"
     
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "��ü�޿����"
    
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
              DEPTNO = E.DEPTNO) "�μ����Ի纰�޿�����"
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
              DEPTNO = E.DEPTNO) "�μ����Ի纰�޿�����"
FROM EMP E

ORDER BY DEPTNO ASC, HIREDATE ASC;



SELECT  (SELECT CASE WHEN HIREDATE = E.HIREDATE
                     THEN '���'
                     WHEN HIREDATE < E.HIREDATE
                     THEN '���'
                     ELSE '����'
                END
         FROM EMP)
FROM EMP E;




SELECT EMP.ENAME "�����", EMP.DEPTNO "�μ���ȣ", EMP.HIREDATE "�Ի���", EMP.SAL "�޿�"
     , (1) "�μ����Ի纰�޿�����"
FROM EMP
ORDER BY 2, 3;



SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (1) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;


SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (
        SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO
       ) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;




SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (
        SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO
              AND
              E2.HIREDATE <= E1.HIREDATE
       ) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;

---==>>
/*
�����	�μ���ȣ	�Ի���	�޿�	�μ����Ի纰�޿�����
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



--�� EMP ���̺��� �������
--  �Ի��� ����� ���� ���� ������ ����
--  �Ի����� �ο����� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

SELECT �Ի��� �� ���帹�� �� �Ի���,
       �Ի��� �� ���帹�� �� �ο���
FROM EMP;

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի���"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE EXTRACT(YEAR FROM HIREDATE) = EXTRACT(YEAR FROM E.HIREDATE);)
FROM EMP E;

SELECT EXTRACT(YEAR FROM HIREDATE)
FROM EMP;




FROM 
(  
    SELECT MAX(T.�ο���)
    FROM
    (
        SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
             , COUNT(*) "�ο���"
        FROM EMP
        GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
    ) T
) A








SELECT USER
FROM DUAL;

--�� SELF JOIN(�ڱ� ����)

SELECT *
FROM EMP;

/* 1-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- EMP ���̺��� �����͸� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
---------------------------------------------------------
�����ȣ ����� ������ �����ڹ�ȣ �����ڸ� ������������
7369     SMITH  CLERK   7902      FORD      ANALYST 
*/

SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E2.EMPNO "�����ڹ�ȣ" --E1.MGR "�����ڹ�ȣ" -- �ּ�ó���� ��ó�� �ۼ��ص� ������, �θ� �ش��ϴ� ���̺�� �ۼ�
     , E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO
ORDER BY 1;

SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E2.EMPNO "�����ڹ�ȣ" --E1.MGR "�����ڹ�ȣ" -- �ּ�ó���� ��ó�� �ۼ��ص� ������, �θ� �ش��ϴ� ���̺�� �ۼ�
     , E2.ENAME "�����ڸ�", E2.JOB "������������"
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

/* 1-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*
---------------------------------------------------------
�����ȣ ����� ������ �����ڹ�ȣ �����ڸ� ������������
EMPNO   ENAME   JOB     MRG        
                        EMPNO     ENAME     JOB
---------------------------------------------------------
7369     SMITH  CLERK   7902      FORD      ANALYST 
-------------------------------E1
                        -------------------------------E2
*/
SELECT �����ȣ ����� ������ �����ڹ�ȣ �����ڸ� ������������
FROM EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", EMPNO "�����ڹ�ȣ", ENAME "�����ڸ�", JOB "������������"
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;
--> KING �� ȸ���� ��ǥ���� �����ڹ�ȣ�� NULL �̰�, ���� ���ǿ����� ���ܵ�

--���1)
SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E2.EMPNO "�����ڹ�ȣ", E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;

--���2)
SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E2.EMPNO "�����ڹ�ȣ", E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);








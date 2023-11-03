SELECT USER
FROM DUAL;



--���� ��(VIEW) ����--

-- 1. ��(VIEW)�� �̹� Ư���� �����ͺ��̽� ������ �����ϴ�
--    �ϳ� �̻��� ���̺��� ����ڰ� ��� ���ϴ� �����͸���
--    ��Ȯ�ϰ� ���ϰ� �������� ���Ͽ� ������ ���ϴ� �÷��鸸�� ��Ƽ�
--    �������� ������ ���̺�� ���Ǽ� �� ���ȿ� ������ �ִ�.

--    ������ ���̺��̶�... �䰡 ������ �����ϴ� ���̺�(��ü)�� �ƴ϶�
--    �ϳ� �̻��� ���̺��� �Ļ��� �� �ٸ� ������ �� �� �ִ� ����̶�� �ǹ��̸�,
--    �� ������ �����س��� SQL �����̶�� �� �� �ִ�.

/*
- ������ ���̺�?
���� �������� ����(�ϵ��ũ) �ȿ��� ���̺� ����ְ�, �䵵 ����ִ� ���°� �ƴϸ� �ϵ��ũ���� ���̺� ����ִ�.
���� �����ʹ� ���̺��� ����Ǵ� ���̰�, ��(VIEW)�� �� ���̺��� �����͵��� �����Ͽ� �����ִ� ���̸�,
��(VIEW)�� ������ �� �ۼ��� ������ �並 ��ȸ�ϴ� ������ ������ �Ǵ� ���̴�!
����, ���̺��� �����Ͱ� ����Ǹ� �䰡 ������ ���� ���� �����Ǿ��ٰ� �ص� �並 ��ȸ�غ���
����� �����Ͱ� ������ ���·� ��ȸ�ȴ�.

- ������ ����?
�� ���̺� �ΰ��� �÷�, �ΰ����� ���� �÷��� ���� �����ٵ�,
�ΰ����� ���� �÷����θ� �並 �����ϸ� ����ڿ��� �ΰ��� �÷��� �����Ű�� �ʰ� ����� �� �ִ�.
����ڰ� �丸 ����ϰ� �ϸ� ���̺� ������ �ΰ������� ���� �� ���� ����, ���Ƿ� �����͸� �����ų ���� ����.
*/


-- 2. ���� �� ����
-- CREATE [OR REPLACE] VIEW ���̸�
-- [(ALIAS[, ALIAS, ...])]
-- AS
-- ��������(SUBQUERY)
-- [WITH CHECK OPTION]      
-- [WITH READ ONLY]      --> �並 ������ �������� �������.. ���� �ɼ� (���� �κ��̶� ������ ���� �����ϰ� �н���)


--�� ��(VIEW) ����

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
        ,C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID;



CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
        ,C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID;
--==>> View VIEW_EMPLOYEES��(��) �����Ǿ����ϴ�.
--> �並 ������ �� �ִ� ���ѵ� �信 ���� ���� �߿� �ϳ��̴�!


--�� ��(VIEW) ��ȸ
SELECT *
FROM VIEW_EMPLOYEES;


--�� ��(VIEW)�� ���� ��ȸ
DESC VIEW_EMPLOYEES;
--==>>
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY            NOT NULL VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25)
*/
--> ���� �������̺���� �ش� �÷��� ������Ÿ���� ������ ��Ŀ� ������


--�� ��(VIEW) �ҽ� Ȯ�� (TIP! �̹Ƿ� ��а� �ǹ��ְ� ����ص� ��)
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME ='VIEW_EMPLOYEES';
--==>>
/*
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
        ,C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID"
*/
--> TEXT �÷� : �並 �ۼ��� ���� �ҽ� �κ��� ������
-- TEXT �÷��� Ȱ���Ͽ� �� �並 CREATE OR REPLACE �� �� ���� �߰��ϰų� �� �κ��� ���� �ľ� �����ϴ�.

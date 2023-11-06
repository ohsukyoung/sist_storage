SELECT USER
FROM DUAL;
--==>> SCOTT

--���� FUNCTION(�Լ�) ����--
/*
--1. �Լ��� �ϳ� �̻��� PL/SQL ������ ������ �����ƾ����  
--    �ڵ带 �ٽ� ����� �� �ֵ��� ĸ��ȭ �ϴµ� ���ȴ�.    
--    ����Ŭ������ ����Ŭ�� ���ǵ� �⺻ ���� �Լ��� ����ϰų�  
--    ���� ������ �Լ��� ���� �� �ִ�. (->����� ���� �Լ�)  
--    �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�  
--    ���� ���ν���ó�� EXECUTE ���� ���� ������ �� �ִ�.  
-- *��¥, ���ڵ� �Լ� -> ����Ŭ ���� �Լ�*  
-- *�츮�� ���� �����ؼ� �Լ��� �ҷ��� �� �� ����*   

--2. ���� �� ����
``` SQL
CREATE [OR REPLACE] FUNCTION �Լ���
[( �Ű�������1 �ڷ���
,  �Ű�������2 �ڷ���
)]
RETURN ������Ÿ��
IS
    -- �ֿ� ���� ����
BEGIN
    -- ���๮
    ...
    RETURN (��);
    
    [EXCEPTION]
        -- ���� ó�� ����;
END;
```
-- *��ó�� �Լ��� Ʋ�� ����� �����־� �����ϴ� ��*  

-- *�ٸ� ��ü��� �޸� ����Ŭ�� FUNCTION������ **RETURN ������Ÿ��** �� �ִ�!*  
-- *EX) �ڹ� �Լ� -> ��ȯ�ڷ��� �Լ���()( ... RETURN XXX;}*  
-- *�ڹٿ����� RETURN�� �Լ��ȿ� �־ ������ ��� Ȯ���ؾ� �� �� �־���*  
-- *�ڹٴ� ����� ���� ��� �Ѳ��� ��� ������ Ȯ���ؾ� ����� �� �� ������,*  
-- *����Ŭ�� ��� �ۿ� '�'�̶�� ��ƼĿ�� �ٿ� �� ��*  

*/

--�� ����� ���� �Լ�(������ �Լ�)��  
--   IN �Ķ����(�Է� �Ű�����)�� ����� �� ������  
--   �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN ���� �����ؾ� �ϰ�,  
--   FUNCTION �� �ݵ�� ���� ���� ��ȯ�Ѵ�.  

--  *�Լ��� �Է¸Ű������� ����������*  
--  *���ν����� ��� ����¸Ű����� ����?*  

--  *�Է� �Ű�����, ��� �Ű�����, ����� �Ű�����*  
--  *�Է¸Ű�����     -> �̰� �ǳ����״� �̰ɷ� ���Ϸ�.*  
--  *��¸Ű�����     -> �̰� �ǳ����״� �۾��ϰ�, ���⿡ ��� �ǳ��ַ�.*  
--  *����¸Ű�����   -> �̰� �ǳ����״� �̰ɷ� �۾��ϰ� ���⿡ ��� �ǳ��ַ�.*   


--�� TBL_INSA ���̺� ���� ���� Ȯ�� �Լ� ����(����)  
--   --------------------
--    �Ű����� ����(����) �� '771212-1022432' �� 'YYMMDD-NNNNNNN'

--   �Լ��� : FN_GENDER()  
--                     �� �ֹε�Ϲ�ȣ �� '771212-1022432'
-- *����Ŭ���� ���̺����� �Լ��� �����ؾ��Ѵ�                        -> �ƴ�!*  
-- *������('771212-1022432')�� �� ������ �Լ��� ����ٴ� �ǹ�    -> ����!*  

-- �����
CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)    -- �Ű�����     : �ڸ���(����) ���� ����
RETURN VARCHAR2                                         -- ��ȯ�ڷ���   : �ڸ���(����) ���� ����
-- ���Ǻ�
IS
    -- �����  -> �ֿ� ���� ����(�� �ʱ�ȭ)
    V_RESULT    VARCHAR2(20);
BEGIN
    -- �����  -> ���� �� ó��(�׸��� ����� ��ȯ)
    IF ( SUBSTR(V_SSN,8,1) IN ('1','3') )
        THEN V_RESULT := '����';
    ELSIF ( SUBSTR(V_SSN,8,1) IN ('2','4') )
        THEN V_RESULT := '����';
    ELSE
        V_RESULT := '����Ȯ�κҰ�';
    END IF;
    
    -- ����� ��ȯ       CHECK~!!!
    RETURN V_RESULT;
    -- *����� ��ȯ���� ������ �Ѿ�� ����*  
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.

-- *�Ű����� �������� ��������*  
-- *CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2, COL1 NUMBER)...*  

-- *SET SERVEROUTPUT ON; ���� �ʴ� ����: ������ ���������� ����� ����ϱ� ���� ���̾���,  
-- *������ �ǽ��� �Լ��� �����ϴ� �����̱� ������ ���� �ʴ´�.*  


/* 1-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� ������ ���� �� ���� �Ű�����(�Է� �Ķ����)�� �Ѱܹ޾� -> (A,B)  
--   A �� B ���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.  
--   ��, ������ ����Ŭ ���� �Լ��� �̿����� �ʰ�, �ݺ����� Ȱ���Ͽ� �ۼ��Ѵ�.  
-- �Լ��� : FN_POW()  
/*
��� ��)
SELECT FN_POW(10,3)
FROM DUAL;
--==>> 1000
*/

CREATE OR REPLACE FUNCTION FN_POW(V_N1 NUMBER, V_N2 NUMBER)
RETURN NUMBER
IS
    -- �����
    V_I      NUMBER := 1;   -- ��������
    V_RESULT NUMBER := V_N1;-- �����
BEGIN
    -- �����    
    LOOP
        EXIT WHEN V_I >= V_N2;
        V_RESULT := V_RESULT * V_N1;
        V_I := V_I + 1;
    END LOOP;
    
    -- ����� ��ȯ
    RETURN V_RESULT;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.

/* 1-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*
FN_POW(10,3)
    ���� 1 * 10 * 10 * 10 -> 1000 -(O)
    ���� 0 * 10 * 10 * 10 -> 0    -(X)
*/
CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;    -- ��ȯ ����� ���� -> 1�� �ʱ�ȭ~!!! CHECK~!!!
    V_NUM       NUMBER;         -- ���� ����
BEGIN
    -- �ݺ��� ����
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;   -- V_RESULT *= A;
    END LOOP;
    
    -- ���� ����� ��ȯ
    RETURN V_RESULT;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.
-- *PLSQL�� ��� ������ �Ǿ��ٰ� �ؼ�, ������ ������ ���ٴ� ���� �ƴ�*  


/* 2-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.  
--   �޿��� <(�⺻��*12)+����> ������� ������ �����Ѵ�.  
-- �Լ���: FN_PAY(�⺻��, ����)  

--BASICPAY
--SUDANG

CREATE OR REPLACE FUNCTION FN_PAY(V_BPAY NUMBER, V_SUDANG NUMBER)
RETURN NUMBER
IS
    V_RESULT NUMBER;
BEGIN
    V_RESULT := V_BPAY*12 + V_SUDANG;
    
    RETURN V_RESULT;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.


/* 2-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE OR REPLACE FUNCTION FN_PAY(VBASICPAY NUMBER, VSUDANG NUMBER)
RETURN NUMBER
IS
    -- �ֿ� ���� ����
    VRESULT NUMBER;
BEGIN
    -- ���� �� ó��
    VRESULT := (NVL(VBASICPAY,0)*12) + NVL(VSUDANG,0);
    
    -- ���� ����� ��ȯ
    RETURN VRESULT;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.

-- *�⺻�� ����, ���� ���� ���� ������ -> NULL*  
-- *����, �������̱� ���� NULL�� ����� ���� �� ó�� �ϱ�*  


/* 3-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_INSA ���̺���
--   �Ի����� �������� ������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
--   ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
-- �Լ���: FN_WORKYEAR(�Ի���)
-- *������ ������ ���⿡ ��ȸ�ϴ��� �����ϵ���* 

--IBSADATE: �Ի���
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN VARCHAR2
IS
    V_RESULT NUMBER;
    V_RESULT2 VARCHAR2(20);
BEGIN
    V_RESULT := TRUNC(MONTHS_BETWEEN(SYSDATE,VIBSADATE)/12,1);
    V_RESULT2 := (TO_CHAR(V_RESULT) ||'='||TRUNC(V_RESULT)||'��'||MOD(V_RESULT,1)*12||'����');
    
    V_RESULT2 := (TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE,VIBSADATE)/12))||'��')
                 ||(TO_CHAR(TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,VIBSADATE),12)))||'����');
                 
    RETURN V_RESULT2;
END;
--==>> Function FN_WORKYEAR��(��) �����ϵǾ����ϴ�.

/* 3-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 1
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD'))/12 "RESULT"
FROM DUAL;
--==>> 25.06314046321186778176025487853444842692

-- 2
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD'))/12) || '��' ||
        TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD')),12)) || '����'
FROM DUAL;
--==>> 25��0����

-- 3: ���� �Ҽ��� ù°�ڸ�����
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS 
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE) / 12 ,1);
    
    RETURN VRESULT;
END;

-- 4: X�� X����
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN VARCHAR2
IS 
    VRESULT VARCHAR2(20);
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE) / 12) || '��' ||
               TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,VIBSADATE),12))||'����';
    
    RETURN VRESULT;
END;

--------------------------------------------------------------------------------
--�� ����(�������� ���� �з�)

-- 1. INSERT, UPDATE, DELETE, (MERGE)  
--==>> DML(Data Manipulation Language)  
-- *����, ����, ����, (����)  
-- COMMIT / ROLLBACK �� �ʿ��ϴ�.  

-- 2. CREATE, DROP, ALTER, (TRUNCATE)  
--==>> DDL(Data Definition Language)  
-- *������ ����, ����, ����, (�߶󳻱�)*  
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 3. GRANT, REVOKE
--==>> DCL(Date Control Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Trasaction Control Language)

-- ���� pl/sql�� -> DML��, TCL���� ��� �����ϴ�.
-- ���� pl/sql�� -> DML��, DDL��, DCL��, TCL�� ��밡���ϴ�.

--------------------------------------------------------------------------------

--���� PROCEDURE(���ν���) ����--

-- 1. PL/SQL ���� ���� ��ǥ���� ������ ������ ���ν�����  
--  �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��   
--  �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ�ٰ�  
--  �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó���� �ִ� �����̴�.  

-- *PL/SQL�� ���ΰ��� ���ν���!*  

-- *�̸� ������ �ǰ��� �����ϴ� ���� �Լ��� ������ ���� �ٸ���?*  
-- *����Ŭ������ �Լ��� VOID�� �����ڷ����� ����.*  
-- *����, ���ν����� �����ڷ����ΰ��� �ƴ�����,*  
-- *RETURN �ڷ����� VOID�� ���� �����ϸ鼭 �׸��� �׷�����.*  

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[( �Ű����� IN ������Ÿ��
,  �Ű����� OUT ������Ÿ��
,  �Ű����� INOUT ������Ÿ��
)]
IS
    [-- �ֿ� ���� ����]
BEGIN
    -- ���� ����;
    ...
    [EXCEPTION
        -- ���� ó�� ����;]
END;
*/
-- *�Ű������� ���� ���ν����� ����*  
-- *�Լ��� �ٸ��� ����ο� IS ���̿� ������ ����*  
-- *�ڹٿ����� ������,�������̶�� ���� �������� ������.. �޼ҵ�ȿ����� ���մ� �Ͱ��� �ٸ���
-- *���ν��������� **������** �� �߿���*  

--�� FUNCTION �� ������ �� <RETURN ��ȯ�ڷ���> �κ��� �������� ������,
--   <RETURN> �� ��ü�� �������� �ʰ�,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--   IN(�Է�), OUT(���), INPUT(�����) ���� ���еȴ�.

-- 3. ����(ȣ��)
/*
EXE[CUTE] ���ν�����[(�μ�1, �μ�2, ...)];
*/

--�� ���ν��� �ǽ��� ���� ���̺� ������...
--  **<20231103_02_scott.sql>** ���� ����~!!!
-- *���ν����� �� �����ϱ� ���ؼ��� ������ ���̺��̾���ϴµ�,*  
-- *�� ������ �������� ���� ���� �� ����. -> �̷��� �����ϰ� �� ��*  

--~~~~~~~~~~~~~~~

--�� ���ν��� ����  
--   ���ν�����: PRC_STUDENT_INSERT(���̵�, �н�����, �̸�, ��ȭ, �ּ�)  

-- *�������*  
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( ���̵�
, �н�����
, �̸�
, ��ȭ
, �ּ�
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDW ���̺� ������ �Է� -> INSERT
    INSERT INTO TBL_IDPW(ID,PW)
    VALUES(V_ID,V_PW);
    
    -- TBL_STUDENTS ���̺� ������ �Է� -> INSERT
    INSERT INTO TBL_STUDENTS(ID,NAME,TEL,ADDR)
    VALUES(V_ID,V_NAME, V_TEL, V_ADDR);
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_INSERT��(��) �����ϵǾ����ϴ�.

/* 4-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� ������ �Է� �� Ư�� �׸��� �����͸� �Է��ϸ�  
--  ���������� �ٸ� �߰��׸� ���� ó���� �Բ� �̷���� �� �ֵ��� �ϴ� ���ν����� �ۼ��Ѵ�.(�����Ѵ�.)  
--  ���ν�����: PRC_SUNGJUK_INSERT()  

/*
���� �ν�)  
���� TBL_SUNGJUK ���̺���  
HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE  
(�й�, �̸�, ��������, ��������, ��������, ����, ���, ���) �÷����� �����Ǿ� �ִ�.  
�� �÷��� ������� Ư�� �׸�(�й�, �̸�, ��������, ��������, ��������)�� �Է��ϸ�  
�߰� �׸�(����, ���, ���)�� �˾Ƽ� ó���� �� �ֵ��� ���ν����� �����϶�� ���̴�.  

���� ��)  
EXEC PRC_SUNGJUC_INSERT(1,'��ٽ�',90,80,70);  

-> �̿� ���� ���ν��� ȣ��� ó���� ���  

�й� �̸�   �������� �������� ��������  ����  ���  ���  
1    ��ٽ�    90       80       70     240     80    B  
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.TOT%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
  -- ����
  V_TOT := V_KOR + V_ENG + V_MAT;
  V_AVG := (V_TOT) / 3;
  
  IF V_AVG >= 90
    THEN V_GRADE := 'A';
  ELSIF V_AVG >= 80
    THEN V_GRADE := 'B';
  ELSIF V_AVG >= 70
    THEN V_GRADE := 'C';
  ELSE
    V_GRADE := 'D';
  END IF;

  -- ������ �Է�
  INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
         VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
  
  -- Ŀ��
  COMMIT;
END;
--==>> Procedure PRC_SUNGJUC_INSERT��(��) �����ϵǾ����ϴ�.

/* 4-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( �й�
, ����
, ��������
, ��������
, ��������
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- �����
    -- INSERT �������� �����ϱ� ���� �ʿ��� �߰� ���� ����
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- �����
    -- ����ο� �߰��� ������ �ֿ� �����鿡 ���� ��Ƴ��� �Ѵ�.
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF (V_AVG>=90)
    -- *����Ŭ������ ��ȣ()�� �־�� �Ѵٴ� ��Ģ�� ����, �־ �������*
        THEN V_GRADE := 'A';
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- INSERT ������ ����
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUC_INSERT��(��) �����ϵǾ����ϴ�.


/* 5-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_SUNGJUCK ���̺��� Ư�� �л��� ����  
--  (�й�, ��������, ��������, ��������) ������ ���� ��  
--  ����, ���, ��ޱ��� �Բ� �����Ǵ� ���ν����� �����Ѵ�.  
-- ���ν�����: PRC_SUNGJUK_UPDATE()  
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(2,50,50,50);

-> �̿� ���� ���ν��� ȣ��� ó���� ���  

�й� �̸�   �������� �������� ��������  ����  ���  ���  
1    ��ٽ�    90       80       70     240     80    B
2    ������    50       50       50     150     50    F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.TOT%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- ����
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := (V_TOT) / 3;
    
    IF (V_AVG>=90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- ������ �Է�
    UPDATE TBL_SUNGJUK
    SET KOR=V_KOR, ENG=V_ENG, MAT=V_MAT, TOT=V_TOT, AVG=V_AVG, GRADE=V_GRADE
    WHERE HAKBUN = V_HAKBUN;
      
    -- Ŀ��
    COMMIT;
END;

/* 6-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_STUDENTS ���̺��� ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�) ���ν����� �ۼ��Ѵ�.
--  ��, ID�� PW�� ��ġ�� ��쿡�� ������ ���� �� �� �ֵ��� ó���Ѵ�.
-- ���ν�����: PRG_STUDENT_UPDATE()
/*
���� ��)
EXEC PRC_STUDENT_UPDATE('moon', 'java000$', '010-9999-9999', '������ Ⱦ��');
--> ������ ���� X

EXEC PRC_STUDENT_UPDATE('moon', 'java006$', '010-9999-9999', '������ Ⱦ��');
--> ������ ���� O
*/

DESC TBL_STUDENTS;

CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
BEGIN
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID
      AND (SELECT PW
            FROM TBL_IDPW
            WHERE ID=V_ID)= V_PW;
      
    COMMIT;
END;

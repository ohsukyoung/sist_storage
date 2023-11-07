SELECT USER
FROM DUAL;
--==>> SCOTT

/* (231103_01_scott(pqlsql)
    6-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- ���1
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
    V_PW2   TBL_IDPW.PW%TYPE;       -- ����ڰ� �Է��� PW�� ���� ����
    V_FLAG  NUMBER := 0;            -- �н�������ġ:1 / �н��������ġ:2
BEGIN
    -- �ۼ�����1) FROM TBL_IDPW�� ���� ID Ȯ��;
    
    -- �ۼ�����2) 'moon'�� ���̴ٰ� �����ϰ�
    --              ����ڰ� �Է��� PW�� ���� �� �ֵ��� �ۼ�    
    SELECT PW INTO V_PW2
    FROM TBL_IDPW
    WHERE ID = 'moon';
    
    -- ���ǿ� ���� �б�(����� �Է�PW, ���̺��� ���� ���� PW - ��ġ/ ����ġ)
    IF (V_PW = V_PW2)       -- �н����� ��ġ
        THEN V_FLAG := 1;
    ELSE                    -- �н����� ����ġ
        V_FLAG := 2;
    END IF;
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID
--      AND �н����� ��ġ;
      AND V_FLAG = 1;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE��(��) �����ϵǾ����ϴ�.


-- ���2
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
BEGIN
    
    -- �ΰ��� ���̺��� JOIN �ؼ� ������Ʈ
    UPDATE (SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR    -- ��ȣ ���� ���������� ��Ƽ� ��ȸ�غ���
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2   
            ON T1.ID = T2.ID) T
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE T.ID = V_ID
      AND T.PW = V_PW;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE��(��) �����ϵǾ����ϴ�.

/* 1-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.  
--  NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG ���� ������ �÷� ��  
--  NUM(�����ȣ) �� ������ �׸��� ������ �Է� ��   
--  �ش� �׸��� ���� ���� �ο��� ��� ��ȣ�� ������ ��ȣ �� ���� ��ȣ��  
--  �ڵ����� �Է� ó���� �� �ִ� ���ν����� �����Ѵ�.  
--  ���ν����� : PRC_INSA_INSERT()
/*
���� ��)
EXEC PRC_INSA_INSERT('������', '970812-2234567', SYSDATE, '����', '010-2509-1783', '���ߺ�', '�븮', 2000000, 2000000) -- �̹鸸, �̹鸸
-> ���� ���� ���ν��� ȣ�� �� ����

1061 ������ 970812-2234567 2023-11-06 ���� 010-2509-1783 ���ߺ� �븮 2000000 2000000
*/

DESC TBL_INSA;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)
*/
SELECT *
FROM TBL_INSA;

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME      IN TBL_INSA.NAME%TYPE
, V_SSN       IN TBL_INSA.SSN%TYPE
, V_IBSADATE  IN TBL_INSA.IBSADATE%TYPE
, V_CITY      IN TBL_INSA.CITY%TYPE
, V_TEL       IN TBL_INSA.TEL%TYPE
, V_BUSEO     IN TBL_INSA.BUSEO%TYPE
, V_JIKWI     IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY  IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG    IN TBL_INSA.SUDANG%TYPE
)
IS
  V_NUM   TBL_INSA.NUM%TYPE;
BEGIN
    /*
    -- ���� �ο��� �����ȣ�� ������ ��ȣ
    SELECT MAX(NVL(NUM,0)) INTO NUM
    FROM TBL_INSA;
            
    -- ������ �Է� ������ ����
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG) 
            VALUES (V_NUM+1, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    -- Ŀ��
    COMMIT;
    */
    
    -- ���� �ο��� �����ȣ�� ������ ��ȣ
    SELECT MAX(NVL(NUM,0)) + 1 INTO NUM
    FROM TBL_INSA;
    -- MAX(NVL(NUM,0))�� �ٸ� ���� ����ְ�, �ش� ���� NULL �϶� ��밡��
    -- NVL(MAX(NUM),0) �� �������� ����
            
    -- ������ �Է� ������ ����
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG) 
            VALUES (V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    -- Ŀ��
    COMMIT;
END;

-- *�ڡڡ� �߿� �ڡڡ�
/* 2-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� 20231106_02_scott.sql ������ Ȱ���Ͽ�  
--   TBL_��ǰ, TBL_�԰� ���̺��� �������  
--   TBL_�԰� ���̺� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)  
--   TBL_��ǰ ���̺� �ش� ��ǰ�� ���� �������� �Բ� ������ �� �ִ� ����� ���� ���ν����� �ۼ��Ѵ�.  
--   ��, �� �������� �԰��ȣ�� �ڵ� ���� ó���Ѵ�.(������ ��� ����)  
--   TBL_�԰� ���̺� ���� �÷���   
--   �԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ��̸�  
--   ���ν��� ȣ���� ���� ������ �Ķ���ʹ� ��ǰ�ڵ�, �԰����, �԰�ܰ��̴�.  

--   ���ν����� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰����, �԰�ܰ�)  
--   ���ν����� : PRC_�԰�_INSERT(H001, 50, 500)  


CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ� IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_�԰���� IN TBL_�԰�.�԰����%TYPE
, V_�԰�ܰ� IN TBL_�԰�.�԰�ܰ�%TYPE
)
IS
    -- �����
    -- �Ʒ��� �������� �����ϱ� ���� �ʿ��� ���� �߰� ����
    V_�԰��ȣ TBL_�԰�.�԰��ȣ%TYPE;
    V_������ TBL_�԰�.�԰�ܰ�%TYPE;    
BEGIN
    -- �����
    -- ������ ������ �� ��Ƴ���
    -- SELECT ������ ���� -> �԰��ȣ Ȯ��
    SELECT NVL(MAX(�԰��ȣ),0) INTO V_�԰��ȣ
    FROM TBL_�԰�;
    
    -- INSERT ������ ����: �԰� ���̺� ������ ����
    -- *�԰����ڴ� TABLE�� ����Ʈ SYSDATE�� ������*  
    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�)
         VALUES ((V_�԰��ȣ+1), V_��ǰ�ڵ�, V_�԰����, V_�԰�ܰ�);
         
    -- ���� ������
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- UPDDATE ������ ����: ��ǰ ���̺� ������ ������Ʈ
    UPDATE TBL_��ǰ
    SET ������ = V_������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ���� ó��
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
    -- *�̿��� �ٸ� ��Ȳ�� �߻��ϸ�, �ѹ��ض�*  
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------

-- ���� ���ν��� �������� ���� ó�� ����--

/* 3-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_NUMBER ���̺� �����͸� �Է��ϴ� ���ν����� �ۼ�  
--   ��, �� ���ν����� ���� �����͸� �Է��ϴ� ���  
--   CITY(����) �׸� '����', '���', '����'�� �Է��� �����ϵ��� �����Ѵ�.  
--   �� ���� ���� �ٸ� ������ ���ν��� ȣ���� ���� �Է��Ϸ��� ���  
--   (��, ��ȿ���� ���� ������ �Է��� �õ��Ϸ��� ���)  
--   ���ܿ� ���� ó���� �Ϸ��� �Ѵ�.  
--   ���ν�����: PRC_MEMBER_INSERT()  
/*
���� ��)
EXEC PRC_MEMBER_INSERT('�ڹ���', '010-1111-1111', '����');
--> ������ �Է� ��

EXEC PRC_MEMBER_INSERT('�����', '010-2222-2222', '�λ�');
--> ������ �Է� X
*/

SELECT *
FROM TBL_���;

CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- ���� ������ ������ ������ ���� �ʿ��� ���� ����
    V_NUM               TBL_MEMBER.NUM%TYPE;
    
    -- ����� ���� ���ܿ� ���� ���� ���� CHECK~!!!
    USER_DEFINE_ERROR     EXCEPTION;  -- *����Ÿ��, �̸������Ӱ� ���� ����*  
BEGIN
    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ���������� �ƴ����� ���θ�
    -- ���� ���� Ȯ���� �� �ֵ��� �ڵ� ����
    IF (V_CITY NOT IN ('����', '���', '����'))
        -- ���� �߻� CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR;   -- *THRROW: ���ܸ� �߻���Ű�ڴ�*  
    END IF;

    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(NUM),0) INTO V_NUM
    FROM TBL_MEMBER;

    -- ������ ���� -> INSERT
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1) ,V_NAME, V_TEL, V_CITY);
    
    -- ���� ó�� ����
    -- *TRY~CATCH: ���ܿ� ���� �б�ó��*  
    -- *Ŀ�Ժ��� ����ó�������� ���� �ۼ��ϱ�*  
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '����,���,������ �Է��� �����մϴ�.'); -- *����Ŭ ���� �Լ�*  
            -- *20001���� ����� ���� �����ڵ� ��������*  
            -- *EXCEPTION ���̺� �����Ͽ� �����ڵ� �ֱ�*  
            ROLLBACK;
        WHEN OTHERS     -- *��Ÿ �ٸ� ������ �� ���*  
            THEN ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_MEMBER_INSERT��(��) �����ϵǾ����ϴ�.


/* 4-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_��� ���̺� ������ �Է� ��(��, ��� �̺�Ʈ �߻� ��) TBL_��ǰ ���̺��� �������� �����Ǵ� ���ν����� �ۼ��Ѵ�.  
--   ��, ����ȣ�� �԰��ȣ�� ���������� �ڵ� ����.  
--   ����, �������� ���������� ���� ���... ��� �׼��� ����� �� �ֵ��� ó���Ѵ�.  
--   (��� �̷������ �ʵ���...) -> ���� ó�� Ȱ�� CHECK~!!!  
--   ���ν�����: PRC_���_INSERT()  

/*
���� ��)
EXEC PRC_���_INSERT('H001', 10, 600);
-> �� �������� ��ǰ ���̺��� �ٹ�� �������� 70��

EXEC PRC_��� IWNERT('H001', 80, 600);

-> ���� �߻�
-- (20002, ������~!!!)
*/

CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ� IN TBL_���.��ǰ�ڵ�%TYPE
, V_������ IN TBL_���.������%TYPE
, V_���ܰ� IN TBL_���.���ܰ�%TYPE
)
IS
    V_NUM               TBL_��ǰ.������%TYPE;
    USER_DEFINE_ERROR2   EXCEPTION;
BEGIN
    SELECT ������ INTO V_NUM
    FROM TBL_��ǰ 
    WHERE ��ǰ�ڵ�=V_��ǰ�ڵ�;
    
    IF (V_NUM<V_������)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, ������, ���ܰ�)
        VALUES((SELECT NVL(MAX(����ȣ),0) +1 FROM TBL_���), V_��ǰ�ڵ�, V_������, V_���ܰ�);
        
    UPDATE TBL_��ǰ
    SET ������ =  V_NUM - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002,'�������� ���������� �����ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
        
    -- Ŀ��
    COMMIT;
END;

/* 4-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ� IN TBL_���.��ǰ�ڵ�%TYPE
, V_������ IN TBL_���.������%TYPE
, V_���ܰ� IN TBL_���.���ܰ�%TYPE
)
IS
    -- �ֿ� ���� ����
    V_����ȣ TBL_���.����ȣ%TYPE;
    V_������ TBL_��ǰ.������%TYPE;
    
    -- ����� ���� ���� ����
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- ������ ���� ������ ���� ���θ� Ȯ���ϴ� ��������
    -- ������ �ľ� -> ���� ��� Ȯ���ϴ� ������ ����Ǿ�� �Ѵ�.
    -- �׷��� ���ν��� ȣ�� �� �Ѱܹ޴� �������� �񱳰� �����ϱ� ����...
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ��� ���������� �������� �������� ���� ���� Ȯ��
    -- ������ �ľ��� ���������� ���� ���ν������� �Ѱܹ��� �������� ������
    -- ���ܹ߻�~!!!
    IF (V_������>V_������)
        -- ���ܹ߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ����ȣ���� -> ������ ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(����ȣ),0) + 1 INTO V_����ȣ
    FROM TBL_���;

    -- ������ ���� -> INSERT(TBL_���)
    INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, ������, ���ܰ�)
    VALUES(V_����ȣ, V_��ǰ�ڵ�, V_������, V_���ܰ�);
    
    -- ������ ���� -> UPDATE(TBL_��ǰ)
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- *����ó���� Ŀ�Ժ��� ������ �ִ� ���� �ǹ����� �������� ������*
    -- *�������� ����̱� ������, ���� COMMIT ���� ����ó���� �ϱ⵵ �ϴ� ���� �߻�*  
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '������~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.


/* 5-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_��� ���̺��� �������� ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν�����: PRC_���_UPDATE()
/*
���� ��)
EXEC PRC_���_UPDATE(����ȣ, �����Ҽ���);
*/
-- *����ȣ�� �߸��Ǿ��� ��, ���� ������ +, �����Ǿ�� �ϴ� ����-*  
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( V_����ȣ    IN TBL_���.����ȣ%TYPE
, V_�������    IN TBL_���.������%TYPE
)
IS
    V_��ǰ�ڵ� TBL_���.��ǰ�ڵ�%TYPE;
    V_������ TBL_���.������%TYPE;
    V_������ TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR3 EXCEPTION;
BEGIN
    -- ������̺��� ��ǰ�ڵ�, ������
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- ��ǰ���̺��� ������
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    IF ((V_������+V_������)<V_�������)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    UPDATE TBL_��ǰ
    SET ������ = (V_������+V_������) - V_�������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    UPDATE TBL_���
    SET ������ = V_�������
    WHERE ����ȣ = V_����ȣ;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20002, '������~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    COMMIT;
END;


SELECT *
FROM TBL_���;
--==>>
/*
����ȣ	��ǰ�ڵ�	�������	������	���ܰ�
1	        H001	    2023-11-06	    20	    600
2	        C001	    2023-11-06	    20	    1500
*/
SELECT *
FROM TBL_��ǰ;
--==>> 
/*
��ǰ�ڵ�	��ǰ��	�Һ��ڰ���	������
H001	    �ٹ��	    600	    30
H002	    �ҽ���	    500	    40
*/

-- *������ ������ ���� ���� ���������� �׳� ���� ���� �ƴ϶�,
--  *����� �� ������ ���ϰ� �� ���� ���� ���̴�.
/*
1. ��� ���̺��� V_��ǰ�ڵ�, V_������
2. ��ǰ ���̺��� V_��ǰ�ڵ忡 �ش��ϴ� ������ ��������
3. (���� ������ + V_������) < �����Ҽ���
     -> �����߻�
     
4. UPDATE ����
��ǰ���̺��� ������  = ������ + V_������ - ������ ����

5. ����ó��...
*/
/* 5-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
(   -- (1) �Ű����� ����
  V_����ȣ    IN TBL_���.����ȣ%TYPE
, V_������    IN TBL_���.������%TYPE
)
IS
    -- (3) �ʿ��� ���� ����
    V_��ǰ�ڵ�      TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_����������  TBL_���.������%TYPE;
    V_������      TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- (4) ������ ������ �� ��Ƴ��� *��ǰ�ڵ�*
    -- (6) *����������*
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_����������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- (8) ��� ������࿩�� �Ǵ� �ʿ�
    --     ���� ������ ������ �� ������ ������ Ȯ��
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- (9) �ľ��� �������� �������� ���� �ǽ� ���� �Ǵ�
    --     (��������+���������� < ������������ �� ��Ȳ�̶��... ��������ǿ��� �߻�)
    IF (V_������+V_���������� < V_������)
        -- THEN ����� ���� ���� �߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- (2) ����� ������ üũ(UPDATE->TBL_��� / UPDATE->TBL_��ǰ)
    UPDATE TBL_���
    SET ������ = V_������
    WHERE ����ȣ = V_����ȣ;
    
    -- (5)
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_���������� - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- (10) ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '������~!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- (7) Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.

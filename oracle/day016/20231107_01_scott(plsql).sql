SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ������: ��������Ȳ�� �ݿ��� Ʈ����� ó��
/*
1. PRC_�԰�_UPDATE(�԰��ȣ, �԰����)
2. PRC_�԰�_DELETE(�԰��ȣ)
3. PRC_���_DELETE(����ȣ)
*/


/* 1-1) ���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 1. PRC_�԰�_UPDATE(�԰��ȣ, �԰����)
CREATE OR REPLACE PROCEDURE PRC_�԰�_UPDATE
(   -- (1) �Ű����� ����
  V_�԰��ȣ  IN TBL_�԰�.�԰��ȣ%TYPE
, V_�԰����  IN TBL_�԰�.�԰����%TYPE
)
IS
    -- (3) �ʿ��� ���� ����
    V_��ǰ�ڵ�      TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_�����԰����  TBL_�԰�.�԰����%TYPE;
    V_������      TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- (4) ������ ������ �� ��Ƴ��� *��ǰ�ڵ�*
    -- (6) *�����԰����*
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�����԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- (8) �԰� ������࿩�� �Ǵ� �ʿ�
    --     ���� ������ �԰���� �� ������ ������ Ȯ��
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- (9) �ľ��� �������� �������� ���� �ǽ� ���� �Ǵ�
    --     (��(������-�����԰���� + �����԰����) < 0�� �� ��Ȳ�̶��... ��������ǿ��� �߻�)
    IF ((V_������-V_�����԰���� + V_�԰����) < 0)
        -- THEN ����� ���� ���� �߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- (2) ����� ������ üũ(UPDATE->TBL_�԰� / UPDATE->TBL_��ǰ)
    UPDATE TBL_�԰�
    SET �԰���� = V_�԰����
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- (5)
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_�����԰���� + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- (10) ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '������~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;

    -- (7) Ŀ��
    COMMIT;
END;

/* 1-2) ���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 2. PRC_�԰�_DELETE(�԰��ȣ)
CREATE OR REPLACE PROCEDURE PRC_�԰�_DELETE
(   -- (1) �Ű����� ����
    V_�԰��ȣ    IN TBL_�԰�.�԰��ȣ%TYPE 
)
IS
    -- (3) �ʿ��� ���� ����
    V_��ǰ�ڵ�      TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_�԰����      TBL_�԰�.�԰����%TYPE;
    V_������      TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- (4) ������ ������ �� ��Ƴ��� *��ǰ�ڵ�*
    -- (6) *�԰����*
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- (8) �԰� ������࿩�� �Ǵ� �ʿ�
    --     ���� ������ �԰���� �� ������ ������ Ȯ��
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- (9) �ľ��� �������� �������� ���� �ǽ� ���� �Ǵ�
    --     (��(V_������-V_�԰����) < 0�� �� ��Ȳ�̶��... ��������ǿ��� �߻�)
    IF ((V_������-V_�԰����) < 0)
        -- THEN ����� ���� ���� �߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- (2) ����� ������ üũ(DELETE->TBL_�԰� / UPDATE->TBL_��ǰ)
    DELETE TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- (5)
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- (10) ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '������~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;

    -- (7) Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_�԰�_UPDATE��(��) �����ϵǾ����ϴ�.

/* 1-3) ���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 3. PRC_���_DELETE(����ȣ)
CREATE OR REPLACE PROCEDURE PRC_���_DELETE
(   -- (1) �Ű����� ����
    V_����ȣ    IN TBL_���.����ȣ%TYPE 
)
IS
    -- (3) �ʿ��� ���� ����
    V_��ǰ�ڵ�      TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_������      TBL_���.������%TYPE;
    V_������      TBL_��ǰ.������%TYPE;
    
--    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- (4) ������ ������ �� ��Ƴ��� *��ǰ�ڵ�*
    -- (6) *������*
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- (8) ��� ������࿩�� �Ǵ� �ʿ�
    --     ���� ������ ������ �� ������ ������ Ȯ��
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- (2) ����� ������ üũ(DELETE->TBL_��� / UPDATE->TBL_��ǰ)
    DELETE 
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- (5)
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- (10) ����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;

    -- (7) Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------

--���� CURSOR(Ŀ��) ����--
-- *Ŀ��(����)�� ������ �־ �Ѳ��� �ݾƳ��Ҵٰ�, �Ѳ��� ���� ��~~~!�ϰ� ������ ���*  
/*
1. ����Ŭ������ �ϳ��� ���ڵ尡 �ƴ� ���� ���ڵ�� ������ �۾� ��������   
    SQL ���� �����ϰ� �� �������� �߻��� ������ �����ϱ� ���ؼ� Ŀ��(CURSOR)�� ����ϸ�  
    Ŀ������ �Ͻ����� Ŀ���� ������� Ŀ���� �ִ�.  
      
2. �Ͻ����� Ŀ���� ��� SQL ������ �����ϸ� SQL�� ���� �� ���� �ϳ��� ��(ROW)�� ����ϰ� �ȴ�.  
    �׷��� SQL���� ������ �����(RESULT SET)�� ������(ROW)���� ���͵� ���  
    Ŀ��(CURSOR)�� ��������� �����ؾ� ���� ��(ROW)�� �ٷ� �� �ִ�.  
*/
--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
SET SERVEROUTPUT ON;
--==>> [��ũ��Ʈ ���] �۾��� �Ϸ�Ǿ����ϴ�.(0.063��)

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
END;
--==>> 
/*
ȫ�浿 -- 011-2356-4528

PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
END;
--==>> ���� �߻�(01422. 00000 -  "exact fetch returns more than requested number of rows")

/* 2-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- *�ݺ����� Ȱ���� INSA ���̺� ���*  
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN
    FOR N IN 1001 .. 1061 LOOP
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM = V_NUM;
        
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
    END LOOP;
END;
--==>>
/*
ȫ�浿 -- 011-2356-4528
  :
������ -- 010-2509-1783
*/

/*
�Ϲݺ��� -> ����
���ܺ��� -> ����

������ �ڷ���     -- *�̷����¸� ����*  
V_NUM   NUMBER;
U_ERR   EXCEPTION;
Ŀ����  CURSOR;   -- (X)
*/

/*
-- *�������� ���� ����(�츮������)/ ���������δ� �������� ǥ���ϱ⵵��*  
Ŀ�� -> ����

TABLE   ���̺��
INDEX   �ε�����
USER    ������

CURSOR  Ŀ����   -- (O)
*/
-- *����� ������ ������ ������-�ڷ����� ��ġ�� �ٸ�*  

--�� Ŀ�� �̿� �� ��Ȳ
DECLARE
    -- �ֿ� ���� ����
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
    
    -- Ŀ�� �̿��� ���� Ŀ�� ����  CHECK~!!!
    CURSOR CUR_INSA_SELECT     -- *���� ���� ���*  
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    -- ���� Ŀ��
    OPEN CUR_INSA_SELECT;
    
    -- Ŀ�� ���� �� (��~!!!)����� ������ �����͵� ó��(�ݺ����� Ȱ���Ͽ� ó��) 
    LOOP
        -- �� �� �� �� �޾ƴٰ� ó���ϴ� ���� -> ��������(��������)    -> ��FETCH��
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- ��������??? (EXIT WHEN)
        --  -> Ŀ������ �� �̻� �����Ͱ� ����� ������ �ʴ� ����...  -> ��NOTFOUND��
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- ���
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
    END LOOP;
    
    -- Ŭ���� Ŀ��
    CLOSE CUR_INSA_SELECT;
    
    -- *����Ŭ ��ü Ŀ���� ���, ������ ���� �ڵ����� �ݱ� ������... Ŭ���� Ŀ�������� ������ ���� ��찡 �ִ�.*  
    -- *�̷� ��� Ŭ���� Ŀ���� �ּ�ó���ϰ� ������غ���*  
END;

--------------------------------------------------------------------------------

-- ���� TRIGGER(Ʈ����) ���� --

/*
-- �������� �ǹ�: ��Ƽ�, �˹߽�Ű��, �߱��ϴ�, �����ϴ�.  
-- *�κ�Ʈ���� ���� ��� ���Ѻ��ٰ� ��Ʈ���� ���� �ƴ϶�, ��ġ�� �صΰ� ������ �˾Ƽ� �����°��� �߿���*  

1. TRIGGER(Ʈ����)�� DML �۾� ��, INSERT, UPDATE, DELETE �۾��� �Ͼ �� 
    �ڵ������� ����Ǵ�(���ߵǴ�, �˹ߵǴ�) ��ü��  
    �̿� ���� Ư¡�� �����Ͽ� DML TRIGGER ��� �θ��⵵ �Ѵ�.  
    TRIGGER �� ���Ἲ �� �ƴ϶� ������ ���� �۾����� �θ� ���ȴ�.  
    
-- �ڵ����� �Ļ��� �� �� ����
-- *�������� ������ ���忡 ������ ���°�*  
-- �߸��� Ʈ����� ����  
-- ������ ���� ���� ���� ����  
-- �л� �����ͺ��̽� ��� �󿡼� ���� ���Ἲ ���� ����  
-- *������� ��Ͽ��� �����ϴ� ���� ��ϵ� ���븸 ��ϰ���*    
-- *-> ������.. �������� �ִ� ���¿���, ������������ ���� �� �� ������ ��밡��*  
-- ������ ���� ��Ģ ���� ����  
-- *�����ð����� �޽��� ���α׷��� �� ������ �ý��۾ȿ� ������ ���� ��/ �����ð� ���Ŀ� ���ٰ���*  
-- ������ �̺�Ʈ �α� ����  
-- *�ڵ����� �Ļ���~�̶� ���� ���� ����. �α�:���, �α�:�α׸� ����� ��. INSER, DELETE ����� �� �� �ְ� �ϴ� ��*  
-- ������ ���� ����  
-- *�ڵ����� �Ļ���~,������ �̺�Ʈ~�� ���� ī�װ��� ����*  
-- ���� ���̺� ���� ��������  
-- *�ı޷����� �۵��ؾ��ϴ� ��*  
-- ���̺� �׼��� ��� ����  
-- *�ڵ����� �Ļ���~,������ �̺�Ʈ~,������ ����~�� ���� ī�װ��� ����*  

-- *==============================================*  
-- *����Ư¡: ����� �ϳ��ϳ� �����ϱ� �����*  
-- *==============================================*  

2. TRIGGER(Ʈ����) �������� COMMIT, ROLLBACK ���� ����� �� ����.
-- *���ν����� ȣ���ϴ� ���·� �̿�X, ����ڰ� �ִ����� �𸣰� ���*  

3. Ư¡ �� ����  
--      - BEFORE STATEMENT   
--      - BEFORE ROW  
--      - AFTER STATEMENT  
--      - AFTER ROW  
-- *�տ��� �����ؾ��ϴ� Ʈ����: BEFORE, ���ĵ���: AFTER*  
-- *�ϳ��� ���̽����� ����:STARTEMENT, ��� ���� ��ĵ�Ҷ�: ROW*  

4. ���� �� ����  
*/
/*
CRAETE [OR REPLACE] TRIGGER Ʈ���Ÿ�
    [BEFORE | AFTER]
    �̺�Ʈ1 [OR �̺�Ʈ2 [OR �̺�Ʈ3]] ON ���̺��    -- *ON ���̺��: ��� ��������*
    [FOR EACH ROW [WHEN TRIGGER ����]]               -- *ROW���� 'FOR EACH ROW' ���(FOR:������ �࿡ ����)*
                                                     -- *STATEMENT���� 'FOR EACH ROW' ����*
[DECLARE]
    -- ���𱸹�;
BEGIN
    -- ���౸��;
END;
*/


-- ���� AFTER STATEMENT TRIGGER ��Ȳ �ǽ� ����--
-- �� DML �۾��� ���� �̺�Ʈ ���  
-- *������ ����, ����� ���� �����ؼ� ���� �� ����*  

--�� TRIGGER(Ʈ����) ����
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
        AFTER                                       -- *���Ŀ� �۵�*
        INSERT OR UPDATE OR DELETE ON TBL_TEST1     -- *INSERT OR UPDATE OR DELETE: �� �Ͼ��*   
BEGIN                                               -- *ON TBL_TEST1: ��� �������� �۵��ϴ���*   
    -- �̺�Ʈ ���� ����(���ǹ��� ���� �б�)
    IF(INSERTING)                                   -- **INSERTING**  
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(����)THEN INSERT~*
            VALUES('INSERT ������ ����Ǿ����ϴ�.');
    ELSIF (UPDATING)                                -- **UPDATING**
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(����)THEN INSERT~*
            VALUES('UPDATE ������ ����Ǿ����ϴ�.');
    ELSIF (DELETING)                                -- **DELETING**
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(����)THEN INSERT~*
            VALUES('DELETE ������ ����Ǿ����ϴ�.');
    END IF;
    
    --COMMIT;
    -- �� TRIGGER �������� COMMIT / ROLLBACK ���� ��� �Ұ�~!!! CHECK~!!!
END;
--==>> Trigger TRG_EVENTLOG��(��) �����ϵǾ����ϴ�.


-- ���� BEFORE STATEMENT TRIGGER ��Ȳ �ǽ� ����--
-- �� DML �۾� ���� ���� �۾��� ���� ���ɿ��� Ȯ��  

--�� TRIGGER(Ʈ����) ���� -> TRG_TEST1_DML
-- *ȣ���ؼ� ���� ���� �ƴϱ� ������ �߿����� ������,*  
-- *Ʈ���� �������� �����Ҷ� ���������� �� �ֵ��� ��Ģ�� �°� ����*  
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE                                          -- *������ �۵��Ǿ� �Է����� ���ϰ�*  
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
--DECLARE
    -- ��������..  -- *���������� ����� �����ϳ�,*
                   -- *������� ������ ������� ����Ǳ� ������.. Ʈ���ſ��� ���������� ���� �ʴ´�*  
BEGIN
--    IF (�۾��ð��� ���� 9�� �����̰ų�... ���� 6�� ���Ķ��)
--        THEN �۾��� �������� ���ϰ� ó���ϰڴ�.
--    END IF;

    IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 9 OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        -- *6�� ���ķ� �۾����� ���ϵ���... (�ð�>17) OR (�ð�>=18)���� �ؾ���*  
        THEN RAISE_APPLICATION_ERROR(-20003, '�۾� �ð��� 09:00 ~ 18:00 ������ �����մϴ�.');
    END IF;
END;
--==>> Trigger TRG_TEST1_DML��(��) �����ϵǾ����ϴ�.



-- ���� BEFORE ROW TRIGGER ��Ȳ �ǽ� ����--
-- �� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��  

--�� TRIGGER(Ʈ����) ���� -> TRG_TEST2_DELETE
-- *�θ����̺��� ���ﶧ �����ǰ� �ִ� �ڽ� ������ ����*  
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
        BEFORE
        DELETE ON TBL_TEST2
        FOR EACH ROW                        -- *FOR EACH ROW: ���� �ϳ��� Ȯ��* 
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;     -- *��:OLD.��
END;
--==>> Trigger TRG_TEST2_DELETE��(��) �����ϵǾ����ϴ�.


-- *                UPDATE ����
-- *--------------------��-------------------------
-- *     ��:OLD��                 ��:NEW��

-- *���, UPDATE��� �������� ����Ŭ�� ���ο� �������� ����*
-- *UPDATE        ====>> DELETE + INSERT
-- *��ȿ���� ũ�� ====>> 'UPDATE * 10' > 'INSERT * 10'

-- �� ��:OLD��  
--    ���� �� ���� ��
--    - INSERT: �Է��ϱ� ���� �ڷ� ��, �Է��� �ڷ�
--    - DELETE: �����ϱ� ���� �ڷ� ��, ������ �ڷ�

-- �� UPDATE
--    ���������� DELETE �׸��� INSERT �� ���յ� ����
--    UPDATE �ϱ� ������ �����ʹ�   ��:OLD��
--    UPDATE ������ ������ �����ʹ� ��:NEW��




-- ���� AFTER ROW TRIGGER ��Ȳ �ǽ� ����--
-- �� ���� ���̺� ���� Ʈ����� ó��  
-- *���� ���� ����*  
-- *���ν������� �԰�,��� �� �� �������� ��Ʈ���� �߿��ߴµ�, AFTER ROW�� ����*  
-- *ROW TRIGGER�� ��� 1:�� �ϳ��� �����ǿ� ���� �η� ������ �Ͼ�� �ϴ� ��� ROW TRIGGER ���*  
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_�԰�
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
            SET ������ = ������ + �����԰�Ǵ¼���
            WHERE ��ǰ�ڵ� = �����԰�Ǵ»�ǰ�ڵ�;
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_�԰�
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
            SET ������ = ������ + :NEW.�԰����
            WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.


/* 3-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_�԰� ���̺��� ������ �Է�, ����, ���� ��
--   TBL_��ǰ ���̺��� ������ ���� Ʈ���� �ۼ�
--   Ʈ���Ÿ�: TRG_IBGO
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_�԰�
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
            SET ������ = ������ + :NEW.�԰����
            WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (UPDATING)
        THEN UPDATE TBL_��ǰ
            SET ������ = ������ - :OLD.�԰���� + :NEW.�԰����
            WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (DELETING)
        THEN UPDATE TBL_��ǰ
            SET ������ = ������ - :OLD.�԰����
            WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.

-- *����ó�������� 0���� �۾����� �ʱ� ���ؼ� ������ �ۼ�������,*
-- *Ʈ���ſ����� 0���� �۾����°� ����*  

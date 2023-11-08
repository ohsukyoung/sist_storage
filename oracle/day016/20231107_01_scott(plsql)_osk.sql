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



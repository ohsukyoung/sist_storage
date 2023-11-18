-- Ʈ����
--����(PROF) ������ ������
CREATE OR REPLACE TRIGGER TRG_PRF_DELETE_01
    BEFORE
    DELETE ON PROF                -- ���� ���̺� Ʈ���� ����
    FOR EACH ROW
DECLARE
    V_PRF_CHECK       PROF.PRF_NO%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT COUNT(*)     INTO V_PRF_CHECK
    FROM CR_DETAIL
    WHERE PRF_NO = :OLD.PRF_NO;
    
    IF (V_PRF_CHECK != 0)
        -- �������� ������ ��� ����X
        THEN RAISE USER_DEFINE_ERROR;
    ELSE
        DELETE    -- ��������T
        FROM CR_DETAIL
        WHERE PRF_NO = :OLD.PRF_NO;
    END IF;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�������� �����Դϴ�.');
END;



--��������(CR_DETAIL) ������ ���� ��
CREATE OR REPLACE TRIGGER TRG_CRD_DELETE_01
    BEFORE
    DELETE ON CR_DETAIL                -- �������� ���̺� Ʈ���� ����
    FOR EACH ROW
BEGIN
    DELETE     -- ���񰳼�T
    FROM SUB_DETAIL
    WHERE CR_NO = :OLD.CR_NO;
    
    DELETE     -- ������ûT
    FROM APPLY
    WHERE CR_NO = :OLD.CR_NO;

END;



--���񰳼�(SUB_DETAIL) ������ ���� ��
CREATE OR REPLACE TRIGGER TRG_SBD_DELETE_01
    BEFORE
    DELETE ON SUB_DETAIL                -- ���񰳼� ���̺� Ʈ���� ����
    FOR EACH ROW
BEGIN
    
    DELETE     -- ����ó�� T
    FROM SCORE
    WHERE SUB_NO = :OLD.SUB_NO;

END;


--------------�л����� ������-----------------
--�л� (STUDENTS) ������ ���� ��
CREATE OR REPLACE TRIGGER TRG_STU_DELETE_01
    BEFORE
    DELETE ON STUDENTS
    FOR EACH ROW
BEGIN
    DELETE      -- ������ûT
    FROM APPLY
    WHERE STD_NO = :OLD.STD_NO;
END;



-- ������û(APPLY) ������ ���� ��
CREATE OR REPLACE TRIGGER TRG_APL_DELETE_01
    BEFORE
    DELETE ON APPLY
    FOR EACH ROW
BEGIN
    DELETE     -- ����ó��T
    FROM SCORE
    WHERE APPLY_NO = :OLD.APPLY_NO;
    
    DELETE     -- �ߵ�Ż��T
    FROM FAIL
    WHERE APPLY_NO = :OLD.APPLY_NO;
END;

--���ǽ�(CLASSROOM) ������ ������
CREATE OR REPLACE TRIGGER TRG_CLR_DELETE_01
    BEFORE
    DELETE ON CLASSROOM
    FOR EACH ROW
BEGIN
    DELETE     -- ��������T
    FROM CR_DETAIL
    WHERE ROOM_NO = :OLD.ROOM_NO;
END;



--����(COURSE) ������ ������
CREATE OR REPLACE TRIGGER TRG_COS_DELETE_01
    BEFORE
    DELETE ON COURSE
    FOR EACH ROW
BEGIN
    DELETE     -- ����T
    FROM CR_DETAIL
    WHERE COURSE_NO = :OLD.COURSE_NO;
END;


--����(SUBJECT) ������ ������
CREATE OR REPLACE TRIGGER TRG_SBJ_DELETE_01
    BEFORE
    DELETE ON SUBJECT
    FOR EACH ROW
BEGIN
    DELETE     -- ����T
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = :OLD.SUBJECT_NO;
END;

--�ߵ�Ż������(FAIL_REASON) ������ ������
CREATE OR REPLACE TRIGGER TRG_FAR_DELETE_01
    BEFORE
    DELETE ON FAIL_REASON
    FOR EACH ROW
BEGIN 
    DELETE  
    FROM FAIL       -- �ߵ�Ż�� T
    WHERE FR_NO = :OLD.FR_NO;
END;

-- ����(BOOK) ������ ���� ��
CREATE OR REPLACE TRIGGER TRG_BOK_DELETE_01
    BEFORE
    DELETE ON BOOK
    FOR EACH ROW
BEGIN
    DELETE
    FROM SUB_DETAIL     -- ���񰳼�T
    WHERE BOOK_NO = :OLD.BOOK_NO;

END;



--DROP TRIGGER TRG_PROF_DELETE;

-- �����Ǿ��ִ� Ʈ���� ��ȸ ����
SELECT TRIGGER_NAME
FROM USER_TRIGGERS;

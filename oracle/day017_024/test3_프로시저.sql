-- ���ν��� 
-- ���������� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_ADMIN_PW
( V_ADMIN_NO IN ADMIN.ADMIN_NO%TYPE         -- ������ �ڵ�
, V_ADMIN_NAME IN ADMIN.ADMIN_NAME%TYPE     -- ������ �̸�
, V_ADMIN_ID IN ADMIN.ADMIN_ID%TYPE         -- ������ ���̵�
, V_ADMIN_SSN IN ADMIN.ADMIN_SSN%TYPE       -- ������ �ֹι�ȣ
)
IS
    V_ADMIN_PW  ADMIN.ADMIN_PW%TYPE;        -- ������ �н����带 ���� ���� 
BEGIN

    -- �Է��� �ֹι�ȣ ���ڸ��� �н������ ����
    V_ADMIN_PW:=SUBSTR(V_ADMIN_SSN, 8);    
    
    -- INSERT
    INSERT INTO ADMIN(ADMIN_NO, ADMIN_NAME, ADMIN_ID, ADMIN_PW, ADMIN_SSN) 
    VALUES (V_ADMIN_NO, V_ADMIN_NAME, V_ADMIN_ID, V_ADMIN_PW, V_ADMIN_SSN);
    
    -- Ŀ��
    COMMIT;
    
END;

-- ���������� UPDATE ���ν���
CREATE OR REPLACE PROCEDURE PRC_ADMIN_UPDATE
( V_ADMIN_NO IN ADMIN.ADMIN_NO%TYPE         -- ������ �ڵ�
, V_ADMIN_NAME IN ADMIN.ADMIN_NAME%TYPE     -- ������ �̸�
, V_ADMIN_PW    IN ADMIN.ADMIN_PW%TYPE      -- ������ �н�����
)
IS
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR   EXCEPTION;
    
    AD_COUNT    NUMBER;
BEGIN

    SELECT COUNT(ADMIN_NO) INTO AD_COUNT
    FROM ADMIN
    WHERE ADMIN_NO = V_ADMIN_NO;
    
    IF (AD_COUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- UPDATE
    UPDATE ADMIN
    SET ADMIN_NAME = V_ADMIN_NAME, ADMIN_PW = V_ADMIN_PW
    WHERE ADMIN_NO = V_ADMIN_NO;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '�Է��� �������ڵ�� �������� �ʽ��ϴ�.');
                 ROLLBACK;
    -- Ŀ��
    COMMIT;
    
END;



-- �������� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_PROF_PW
( V_PRF_NO IN PROF.PRF_NO%TYPE          -- ������ �ڵ�
, V_PRF_NAME IN PROF.PRF_NAME%TYPE      -- ������ �̸�
, V_PRF_ID IN PROF.PRF_ID%TYPE          -- ������ ���̵�
, V_PRF_SSN IN PROF.PRF_SSN%TYPE        -- ������ �ֹι�ȣ
, V_PRF_TEL IN PROF.PRF_SSN%TYPE        -- ������ ��ȭ��ȣ
)
IS
    V_PRF_PW  PROF.PRF_PW%TYPE;         -- ������ �н����带 ���� ���� ����
BEGIN

    -- �Է��� �ֹι�ȣ ���ڸ��� �н������ ����
    V_PRF_PW:=SUBSTR(V_PRF_SSN, 8);     
    
    -- INSERT
    INSERT INTO PROF(PRF_NO, PRF_NAME, PRF_ID, PRF_PW, PRF_SSN, PRF_TEL) 
    VALUES (V_PRF_NO, V_PRF_NAME, V_PRF_ID, V_PRF_PW, V_PRF_SSN, V_PRF_TEL);
    
    -- Ŀ��
    COMMIT;
    
END;

-- �������� UPDATE ���ν���
CREATE OR REPLACE PROCEDURE PRC_PROF_UPDATE
( V_PRF_NO IN PROF.PRF_NO%TYPE          -- ������ �ڵ�
, V_PRF_NAME IN PROF.PRF_NAME%TYPE      -- ������ �̸�
, V_PRF_PW IN PROF.PRF_PW%TYPE          -- ������ �н�����
, V_PRF_TEL IN PROF.PRF_SSN%TYPE        -- ������ ��ȭ��ȣ
)
IS
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR   EXCEPTION;
    
    PF_COUNT    NUMBER;
BEGIN

    SELECT COUNT(PRF_NO) INTO PF_COUNT
    FROM PROF
    WHERE PRF_NO = V_PRF_NO;
    
    IF (PF_COUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- UPDATE
    UPDATE PROF
    SET PRF_NAME = V_PRF_NAME, PRF_PW = V_PRF_PW, PRF_TEL = V_PRF_TEL
    WHERE PRF_NO = V_PRF_NO;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�Է��� �����ڵ�� �������� �ʽ��ϴ�.');
                 ROLLBACK;
    -- Ŀ��
    --COMMIT;
    
END;


-- �л����� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_PW
( V_STD_NO      IN STUDENTS.STD_NO%TYPE         -- �л� �ڵ�
, V_STD_NAME    IN STUDENTS.STD_NAME%TYPE       -- �л� �̸�
, V_STD_ID      IN STUDENTS.STD_ID%TYPE         -- �л� ���̵�
, V_STD_SSN     IN STUDENTS.STD_SSN%TYPE        -- �л� �ֹι�ȣ
, V_STD_TEL     IN STUDENTS.STD_TEL%TYPE        -- �л� ��ȭ��ȣ
)
IS
    V_STD_PW  STUDENTS.STD_PW%TYPE;             -- �л��� �н����带 ���� ���� ����
BEGIN
    
    -- �Է��� �ֹι�ȣ ���ڸ��� �н������ ����
    V_STD_PW:=SUBSTR(V_STD_SSN, 8);     
    
    -- INSERT
    INSERT INTO STUDENTS(STD_NO, STD_NAME, STD_ID, STD_PW, STD_SSN, STD_TEL)
    VALUES (V_STD_NO, V_STD_NAME, V_STD_ID, V_STD_PW, V_STD_SSN, V_STD_TEL);
    
    -- Ŀ��
    COMMIT;
    
END;

-- �л����� UPDATE ���ν���
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_STD_NO      IN STUDENTS.STD_NO%TYPE         -- �л� �ڵ�
, V_STD_NAME    IN STUDENTS.STD_NAME%TYPE       -- �л� �̸�
, V_STD_PW      IN STUDENTS.STD_PW%TYPE         -- �л� �н�����  
, V_STD_TEL     IN STUDENTS.STD_TEL%TYPE        -- �л� ��ȭ��ȣ
)
IS
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR   EXCEPTION;
    
    STD_COUNT    NUMBER;
BEGIN

    SELECT COUNT(STD_NO) INTO STD_COUNT
    FROM STUDENTS
    WHERE STD_NO = V_STD_NO;
    
    IF (STD_COUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- UPDATE
    UPDATE STUDENTS
    SET STD_NAME = V_STD_NAME, STD_PW = V_STD_PW, STD_TEL = V_STD_TEL
    WHERE STD_NO = V_STD_NO;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '�Է��� �л��ڵ�� �������� �ʽ��ϴ�.');
                 ROLLBACK;
    -- Ŀ��
    --COMMIT;
    
END;

-- �������� INSERT ���ν��� 
--> ������ �����ϴ� ���ν���
--  (�̹� ������ ���� ���� ���ǽ��̰ų� �����ڶ�� �� �Ⱓ���� ������ �������� �ʾƾ� �Ѵ�.)         
CREATE OR REPLACE PROCEDURE PRC_CR_DETAIL_INSERT
( V_CR_NO       IN CR_DETAIL.CR_NO%TYPE         -- �������� �ڵ�
, V_CR_BEGIN    IN CR_DETAIL.CR_BEGIN%TYPE      -- �������� ������
, V_CR_END      IN CR_DETAIL.CR_END%TYPE        -- �������� ������
, V_COURSE_NO   IN CR_DETAIL.COURSE_NO%TYPE     -- ���� �ڵ�
, V_ROOM_NO     IN CR_DETAIL.ROOM_NO%TYPE       -- ���ǽ� �ڵ�
, V_PRF_NO      IN CR_DETAIL.PRF_NO%TYPE        -- ���� �ڵ�
)
IS
    -- �ߺ�üũ ����
    JUNG_CHECK NUMBER := 0;     -- ���� Ȯ�� �� ����     
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    
     -- (���� �����Ⱓ, ���� ���ǽ�) �Ǵ� (���� �����Ⱓ, ���� ����)�� ��� ī��Ʈ
    SELECT COUNT(*) INTO JUNG_CHECK
    FROM CR_DETAIL
    WHERE (V_CR_BEGIN BETWEEN CR_BEGIN AND CR_END OR V_CR_END BETWEEN CR_BEGIN AND CR_END OR V_CR_BEGIN >= V_CR_END) 
    AND (ROOM_NO = V_ROOM_NO OR PRF_NO = V_PRF_NO);
    
    -- ī��Ʈ�� �ö󰡸� ���� �߻�
    IF JUNG_CHECK > 0 THEN 
        RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- INSERT
    INSERT INTO CR_DETAIL(CR_NO, CR_BEGIN, CR_END, COURSE_NO, ROOM_NO, PRF_NO)
    VALUES(V_CR_NO, V_CR_BEGIN, V_CR_END, V_COURSE_NO, V_ROOM_NO, V_PRF_NO);
    
    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20001, '�ߺ��� ������ Ȯ�����ּ���!');
                 ROLLBACK;
                 
    -- Ŀ��
    COMMIT;           

END;



-- �������� INSERT ���ν��� 
--> ������ �����ϴ� ���ν���
/*  (�̹� ������ ���� �� 
        (1) �����ڵ� O / ����Ⱓ O / �����ڵ� O
        (2) �����ڵ� X / ����Ⱓ O / �����ڵ� O
        (3) �����ڵ� O / ����Ⱓ O / �����ڵ� X
    ���� ���ǿ� �ش�Ǹ� �������� �ʾƾ� �Ѵ�.)         
*/
CREATE OR REPLACE PROCEDURE PRC_SUB_DETAIL_INSERT
( V_SUB_NO       IN SUB_DETAIL.SUB_NO%TYPE      -- ���񰳼��ڵ�
, V_SUB_BEGIN    IN SUB_DETAIL.SUB_BEGIN%TYPE   -- �����������
, V_SUB_END      IN SUB_DETAIL.SUB_END%TYPE     -- ������������
, V_SUBJECT_NO   IN SUBJECT.SUBJECT_NO%TYPE     -- �����ڵ�
, V_BOOK_NO      IN BOOK.BOOK_NO%TYPE           -- �����ڵ�
, V_CR_NO        IN CR_DETAIL.CR_NO%TYPE        -- ���������ڵ�
)
IS
    -- �ߺ�üũ ����
    SUB_CHECK NUMBER := 0;  
    SUB_CHECK1 NUMBER := 0;
    SUB_CHECK2 NUMBER := 0;
    CR_CHECK NUMBER := 0;
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR   EXCEPTION;   
    USER_DEFINE_ERROR1   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION;
    USER_DEFINE_ERROR4   EXCEPTION;
BEGIN
    
    -- �����ڵ尡 ����, ����Ⱓ�� ����, �����ڵ尡 ������ ī��Ʈ
    SELECT COUNT(*) INTO SUB_CHECK
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = V_SUBJECT_NO 
      AND ((V_SUB_BEGIN BETWEEN SUB_BEGIN AND SUB_END) OR (V_SUB_END BETWEEN SUB_BEGIN AND SUB_END))
      AND CR_NO = V_CR_NO;      
    
    -- �����ڵ尡 �ٸ���, ����Ⱓ�� ����, �����ڵ尡 ������ ī��Ʈ
    SELECT COUNT(*) INTO SUB_CHECK1
    FROM SUB_DETAIL
    WHERE SUBJECT_NO != V_SUBJECT_NO
      AND ((V_SUB_BEGIN BETWEEN SUB_BEGIN AND SUB_END) OR (V_SUB_END BETWEEN SUB_BEGIN AND SUB_END))  
      AND CR_NO = V_CR_NO;  
    
    -- �����ڵ尡 ����, �����ڵ尡 ����, ����Ⱓ�� �ٸ��� ī��Ʈ
    SELECT COUNT(*) INTO SUB_CHECK2
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = V_SUBJECT_NO
      AND ((V_SUB_BEGIN <= SUB_BEGIN OR V_SUB_BEGIN <= SUB_END) OR (V_SUB_END <= SUB_BEGIN OR V_SUB_END <= SUB_END))  
      AND CR_NO = V_CR_NO;  
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (SUB_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR;
    ELSIF (SUB_CHECK1 > 0)
        THEN RAISE USER_DEFINE_ERROR1;
    ELSIF (SUB_CHECK2 > 0)
        THEN RAISE USER_DEFINE_ERROR2;
    ELSIF (V_SUB_END <= V_SUB_BEGIN)
        THEN RAISE USER_DEFINE_ERROR3;
     ELSE
        -- �����Ⱓ �� ����Ⱓ�� ���ԵǴ��� ī��Ʈ Ȯ��
        SELECT COUNT(*) INTO CR_CHECK
        FROM CR_DETAIL
        WHERE CR_NO = V_CR_NO
          AND ((V_SUB_BEGIN BETWEEN CR_BEGIN AND CR_END) AND (V_SUB_END BETWEEN CR_BEGIN AND CR_END));
        
        -- �����Ⱓ �� ����Ⱓ�� ���Եȴٸ� (��, ī��Ʈ�� �ö󰣴ٸ�)
        IF CR_CHECK > 0
            THEN
            -- INSERT
            INSERT INTO SUB_DETAIL(SUB_NO, SUB_BEGIN, SUB_END, SUBJECT_NO, BOOK_NO, CR_NO)
            VALUES(V_SUB_NO, V_SUB_BEGIN, V_SUB_END, V_SUBJECT_NO, V_BOOK_NO, V_CR_NO);
            -- �����Ⱓ �� ����Ⱓ�� ���Ե��� �ʴ´ٸ� ���� �߻�
            ELSE
                RAISE USER_DEFINE_ERROR4;
        END IF;
    END IF;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '������ ������ �ߺ��� ����� �Ⱓ�� �����մϴ�.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20003, '������ ������ �ߺ��� �Ⱓ�� �����մϴ�.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20004, '������ ������ �ߺ��� ������ �����մϴ�.');
                 ROLLBACK; 
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20005, '������������ ��������Ϻ��� ���� �� �����ϴ�.');
                 ROLLBACK; 
         WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20006, '����Ⱓ�� �����Ⱓ ���� ���� �մϴ�.');
                 ROLLBACK; 
    
    -- Ŀ��             
    COMMIT;
    
END;


-- �������� UPDATE ���ν���   
CREATE OR REPLACE PROCEDURE PRC_CR_DETAIL_UPDATE
( V_CR_NO IN CR_DETAIL.CR_NO%TYPE               -- ���������ڵ�
, V_CR_BEGIN IN CR_DETAIL.CR_BEGIN%TYPE         -- ����������
, V_CR_END IN CR_DETAIL.CR_END%TYPE             -- ����������
, V_COURSE_NO   IN CR_DETAIL.COURSE_NO%TYPE     -- �����ڵ�
, V_ROOM_NO IN CR_DETAIL.ROOM_NO%TYPE           -- ���ǽ��ڵ�
, V_PRF_NO IN CR_DETAIL.PRF_NO%TYPE             -- �����ڵ�
)
IS
    -- �ߺ�üũ ���� 
    JUNG_CHECK      NUMBER := 0;
    DATE_JUNG_CHECK NUMBER := 0;
    CR_CHECK        NUMBER;
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;

BEGIN
    -- �Է��� ���������ڵ� ���翩�� Ȯ��
    SELECT COUNT(CR_NO) INTO CR_CHECK
    FROM CR_DETAIL
    WHERE CR_NO = V_CR_NO;
    
    -- �Է��� ���������ڵ尡 �������� �ʴ´ٸ� �����߻�
    IF (CR_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- �ش� ������ �������� �ʾҴµ� ������ ���� ������ ���
    -- �ش� ������ ����Ǿ��µ� ������ ������� ���� ���
    SELECT COUNT(*)     INTO DATE_JUNG_CHECK
    FROM CR_DETAIL C, SUB_DETAIL S
    WHERE C.CR_NO = S.CR_NO
      AND S.CR_NO = V_CR_NO
      AND (V_CR_BEGIN<=(SELECT MIN(SUB_BEGIN)
                        FROM SUB_DETAIL
                        WHERE CR_NO = V_CR_NO)) 
      AND (V_CR_END>=(SELECT MAX(SUB_END)
                        FROM SUB_DETAIL
                        WHERE CR_NO = V_CR_NO));
    
    
    -- �����ڵ尡 �ٸ���, ����Ⱓ, ���ǽ�, �����ڰ� ���� ��� �ߺ�üũ
    SELECT COUNT(*) INTO JUNG_CHECK
    FROM CR_DETAIL
    WHERE (V_CR_BEGIN BETWEEN CR_BEGIN AND CR_END OR V_CR_END BETWEEN CR_BEGIN AND CR_END)
    AND (ROOM_NO = V_ROOM_NO OR PRF_NO = V_PRF_NO)
    AND CR_NO != V_CR_NO;
    
    -- �����ڵ尡 �ٸ���, ����Ⱓ, ���ǽ�, �����ڰ� ���� ��� ���� �߻�
    IF (JUNG_CHECK > 0) THEN
        RAISE USER_DEFINE_ERROR;
    -- �ش� ������ �������� �ʾҴµ� ������ ���� ������ ���
    -- �ش� ������ ����Ǿ��µ� ������ ������� ���� ��� ���� �߻�
    ELSIF (DATE_JUNG_CHECK <= 0) THEN
        RAISE USER_DEFINE_ERROR1;
    END IF;
    
    -- UPDATE
    UPDATE CR_DETAIL
    SET CR_BEGIN=V_CR_BEGIN, CR_END=V_CR_END, COURSE_NO=V_COURSE_NO, ROOM_NO=V_ROOM_NO, PRF_NO=V_PRF_NO
    WHERE CR_NO = V_CR_NO;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20007, '�ߺ��� ������ Ȯ�����ּ���.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20008, '�����Ⱓ�� �ٽ� Ȯ�����ּ���.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20009, '�Է��� ���������ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
    -- Ŀ��
    COMMIT;
END;



-- �������� UPDATE ���ν���
CREATE OR REPLACE PROCEDURE PRC_SUB_DETAIL_UPDATE
( V_SUB_NO       IN SUB_DETAIL.SUB_NO%TYPE      -- ���񰳼��ڵ�
, V_SUB_BEGIN    IN SUB_DETAIL.SUB_BEGIN%TYPE   -- ���������
, V_SUB_END      IN SUB_DETAIL.SUB_END%TYPE     -- ����������
, V_SUBJECT_NO   IN SUBJECT.SUBJECT_NO%TYPE     -- �����ڵ�
, V_BOOK_NO     IN BOOK.BOOK_NO%TYPE            -- �����ڵ�
, V_CR_NO      IN CR_DETAIL.CR_NO%TYPE          -- ���������ڵ�
)
IS
    -- �ߺ�üũ ����
    SUB_CHECK       NUMBER := 0;
    SUB_CHECK1      NUMBER := 0;
    SUB_CHECK2      NUMBER := 0;
    CR_CHECK        NUMBER := 0;
    DATE_JUNG_CHECK NUMBER := 0;
    SD_CHECK        NUMBER;
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR   EXCEPTION;   
    USER_DEFINE_ERROR1   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION;
    USER_DEFINE_ERROR4   EXCEPTION;
BEGIN
    
    -- �Է��� ���������ڵ� ���翩�� Ȯ��
    SELECT COUNT(SUB_NO) INTO SD_CHECK
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO;
    
    -- �Է��� ���������ڵ尡 �������� �ʴ´ٸ� �����߻�
    IF (SD_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR4;
    END IF;
    
    -- �ش� ������ �������� �ʾҴµ� ������ ���� ������ ���
    -- �ش� ������ ����Ǿ��µ� ������ ������� ���� ���
    SELECT COUNT(*)     INTO DATE_JUNG_CHECK
    FROM CR_DETAIL C, SUB_DETAIL S
    WHERE C.CR_NO = S.CR_NO
      AND S.CR_NO = V_CR_NO
      AND (V_SUB_BEGIN >= C.CR_BEGIN)
      AND (V_SUB_END <= C.CR_END);
    
    -- �����ڵ尡 ����, ����Ⱓ�� ����, �����ڵ尡 ������ ī��Ʈ
    SELECT COUNT(*) INTO SUB_CHECK
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = V_SUBJECT_NO 
      AND ((V_SUB_BEGIN BETWEEN SUB_BEGIN AND SUB_END) OR (V_SUB_END BETWEEN SUB_BEGIN AND SUB_END)) 
      AND CR_NO = V_CR_NO    
      AND SUB_NO != V_SUB_NO;
    
    -- �����ڵ尡 �ٸ���, ����Ⱓ�� ����, �����ڵ尡 ������ ī��Ʈ
    SELECT COUNT(*) INTO SUB_CHECK1
    FROM SUB_DETAIL
    WHERE SUBJECT_NO != V_SUBJECT_NO 
      AND ((V_SUB_BEGIN BETWEEN SUB_BEGIN AND SUB_END) OR (V_SUB_END BETWEEN SUB_BEGIN AND SUB_END))    
      AND CR_NO = V_CR_NO    
      AND SUB_NO != V_SUB_NO;
      
    -- �����ڵ尡 ����, �����ڵ尡 ����, ����Ⱓ�� �ٸ��� ī��Ʈ  
    SELECT COUNT(*) INTO SUB_CHECK2
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = V_SUBJECT_NO 
      AND ((V_SUB_BEGIN <= SUB_BEGIN OR V_SUB_BEGIN <= SUB_END) OR (V_SUB_END <= SUB_BEGIN OR V_SUB_END <= SUB_END))   
      AND CR_NO = V_CR_NO     
      AND SUB_NO != V_SUB_NO;
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (SUB_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR;
    ELSIF (SUB_CHECK1 > 0)
        THEN RAISE USER_DEFINE_ERROR1;
    ELSIF (SUB_CHECK2 > 0)
        THEN RAISE USER_DEFINE_ERROR2;
    ELSIF (DATE_JUNG_CHECK <= 0)
        THEN RAISE USER_DEFINE_ERROR3;
    ELSE
        -- �����Ⱓ �� ����Ⱓ�� ���ԵǴ��� ī��Ʈ Ȯ��
        SELECT COUNT(*) INTO CR_CHECK
        FROM CR_DETAIL
        WHERE CR_NO = V_CR_NO
          AND ((V_SUB_BEGIN BETWEEN CR_BEGIN AND CR_END) AND (V_SUB_END BETWEEN CR_BEGIN AND CR_END));
        -- �����Ⱓ �� ����Ⱓ�� ���Եȴٸ� (��, ī��Ʈ�� �ö󰣴ٸ�)
        IF CR_CHECK > 0
            THEN
                -- UPDATE
                UPDATE SUB_DETAIL
                SET SUB_BEGIN=V_SUB_BEGIN, SUB_END=V_SUB_END, SUBJECT_NO=V_SUBJECT_NO, BOOK_NO=V_BOOK_NO, CR_NO=V_CR_NO
                WHERE SUB_NO = V_SUB_NO;
            -- �����Ⱓ �� ����Ⱓ�� ���Ե��� �ʴ´ٸ� ���� �߻�
            ELSE
                RAISE USER_DEFINE_ERROR2;
        END IF;
    END IF;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005, '����, �Ⱓ Ȯ�� ���');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '�Ⱓ Ȯ�� ���');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '����, ���� Ȯ�� ���');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20008, '���� Ȯ�� ���');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20009, '�Է��� ���������ڵ�� �������� �ʽ��ϴ�.');
                 ROLLBACK;
    -- Ŀ��             
    COMMIT;
    
END;


-- �����Է� UPDATE ���ν���
CREATE OR REPLACE PROCEDURE PRC_SD_UPDATE
( V_SUB_NO          IN SUB_DETAIL.SUB_NO%TYPE           -- ���񰳼��ڵ�
, V_ATTEND_POINT    IN SUB_DETAIL.ATTEND_POINT%TYPE     -- ��� ����
, V_WRITE_POINT     IN SUB_DETAIL.WRITE_POINT%TYPE      -- �ʱ� ����
, V_PRACTICE_POINT  IN SUB_DETAIL.PRACTICE_POINT%TYPE   -- �Ǳ� ����
)
IS
    -- �ߺ�üũ ����
    SUBJECTNO_JUNGCHECK   NUMBER := 0;
    SCORE_JUNGCHECK     NUMBER := 0;
    SD_CHECK            NUMBER;
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    USER_DEFINE_ERROR3 EXCEPTION;
    USER_DEFINE_ERROR4 EXCEPTION;
    
BEGIN
    
    -- �Է��� ���������ڵ� ���翩�� Ȯ��
    SELECT COUNT(SUB_NO) INTO SD_CHECK
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO;
    
    -- �Է��� ���������ڵ尡 �������� �ʴ´ٸ� �����߻�
    IF (SD_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR4;
    END IF;
    
    
    -- ������ �Է��� ���� ���� ���� Ȯ��
    SELECT COUNT(SUB_NO) INTO SUBJECTNO_JUNGCHECK
    FROM SUB_DETAIL
    WHERE V_SUB_NO IN SUB_NO;
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (SUBJECTNO_JUNGCHECK = 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;   
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�   
    IF(V_ATTEND_POINT + V_WRITE_POINT + V_PRACTICE_POINT <>100)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ������ �Է��� ������ ����ó���� ���� ���
    SELECT COUNT(SCORE_NO) INTO SCORE_JUNGCHECK
    FROM SCORE
    WHERE SUB_NO = V_SUB_NO;
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (SCORE_JUNGCHECK > 0)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    -- UPDATE
    UPDATE SUB_DETAIL
    SET ATTEND_POINT = V_ATTEND_POINT, WRITE_POINT = V_WRITE_POINT, PRACTICE_POINT = V_PRACTICE_POINT
    WHERE SUB_NO = V_SUB_NO;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '������ �ٽ� �Է��ϼ���.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20006, '�������� �ʴ� �����Դϴ�.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20007, '�̹� ����ó���� �Ϸ�� �����Դϴ�.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20009, '�Է��� ���������ڵ�� �������� �ʽ��ϴ�.');
                 ROLLBACK;
    -- Ŀ��      
    COMMIT;
END;


-- ������û INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_APPLY_INSERT
( V_APPLY_NO    IN APPLY.APPLY_NO%TYPE      -- ������û�ڵ�    
, V_CR_NO       IN CR_DETAIL.CR_NO%TYPE     -- ���������ڵ�
, V_STD_NO      IN STUDENTS.STD_NO%TYPE     -- �л��ڵ�
)
IS
    -- �ߺ�üũ ����
    APPLY_CHECK NUMBER := 0;
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;

BEGIN

    -- �� �л��� �� ������ ������û�� �� �� ����!
    -- �̹� ������û�� �Ϸ��� �л��� ���
    SELECT COUNT(*) INTO APPLY_CHECK
    FROM APPLY 
    WHERE STD_NO = V_STD_NO;
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (APPLY_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR;
    ELSE
        -- INSERT
        INSERT INTO APPLY(APPLY_NO, CR_NO, STD_NO)
        VALUES(V_APPLY_NO, V_CR_NO, V_STD_NO);       
    END IF;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20005, '�̹� ������û�� �Ϸ�� �л��Դϴ�.');
                     ROLLBACK;
    -- Ŀ��                 
    COMMIT;
    
END;


-- ����ó�� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_SCORE_INSERT
( V_SCORE_NO    IN SCORE.SCORE_NO%TYPE      -- ����ó���ڵ�
, V_ATTEND_SC   IN SCORE.ATTEND_SC%TYPE     -- ��� ����
, V_WRITE_SC    IN SCORE.WRITE_SC%TYPE      -- �ʱ� ����
, V_PRACTICE_SC IN SCORE.PRACTICE_SC%TYPE   -- �Ǳ� ����
, V_APPLY_NO    IN SCORE.APPLY_NO%TYPE      -- ������û�ڵ�
, V_SUB_NO      IN SCORE.SUB_NO%TYPE        -- ���񰳼��ڵ�
)
IS

    -- �ش� ���� ���� ������ ��Ƶ� ����
    SD_ATTEND_POINT     SUB_DETAIL.ATTEND_POINT%TYPE;
    SD_WRITE_POINT      SUB_DETAIL.WRITE_POINT%TYPE;
    SD_PRACTICE_POINT   SUB_DETAIL.PRACTICE_POINT%TYPE;
    
    -- ������ ���� ���������� ���� ����
    V_ATTEND_SC1    SCORE.ATTEND_SC%TYPE := 0;
    V_WRITE_SC1     SCORE.WRITE_SC%TYPE := 0;
    V_PRACTICE_SC1  SCORE.PRACTICE_SC%TYPE := 0;
    
   -- �ߺ�üũ ����
    APPLYNO_JUNGCHECK NUMBER := 0;   
    V_DATE_CHECK    NUMBER;
    V_FAIL_CHECK    NUMBER := 0;        
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    USER_DEFINE_ERROR3 EXCEPTION;

BEGIN
    
    -- �ش� ������ ����ó�� ��������
    -- ���������Ϻ��� ����ó���� ���� ����Ǹ� �ȵ�
    SELECT COUNT(*)   INTO V_DATE_CHECK
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO
      AND (SUB_END+8 < SYSDATE OR SUB_END > SYSDATE);
         --12/26   >=   11/16     12/26     12/26
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (V_DATE_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- ����ó���� �����ڵ��� ����
    SELECT ATTEND_POINT, WRITE_POINT, PRACTICE_POINT INTO SD_ATTEND_POINT, SD_WRITE_POINT, SD_PRACTICE_POINT            
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO;
    
    -- ������ ���� ����ó��
    V_ATTEND_SC1 := SD_ATTEND_POINT / 100 * V_ATTEND_SC;
    V_WRITE_SC1 := SD_WRITE_POINT / 100 * V_WRITE_SC;
    V_PRACTICE_SC1 := SD_PRACTICE_POINT / 100 * V_PRACTICE_SC;
    
    -- ���� ������û�ڵ忡�� �̹� ����ó���� �����ڵ��� ���
    SELECT COUNT(*) INTO APPLYNO_JUNGCHECK
    FROM SCORE
    WHERE APPLY_NO = V_APPLY_NO
    AND SUB_NO = V_SUB_NO;
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (APPLYNO_JUNGCHECK >= 1)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
   
    -- ���� ������û�ڵ忡�� �̹� �ߵ�Ż���� �� ���
    SELECT COUNT(*) INTO V_FAIL_CHECK
    FROM FAIL F JOIN APPLY A
    ON F.APPLY_NO = A.APPLY_NO
    WHERE A.APPLY_NO = V_APPLY_NO
    AND F.FAIL_NO IS NOT NULL;
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (V_FAIL_CHECK >= 1)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    -- INSERT
    INSERT INTO SCORE(SCORE_NO, ATTEND_SC, WRITE_SC, PRACTICE_SC, APPLY_NO, SUB_NO)
    VALUES(V_SCORE_NO, V_ATTEND_SC1, V_WRITE_SC1, V_PRACTICE_SC1, V_APPLY_NO, V_SUB_NO);
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20006, '�̹� �Էµ� �����ڵ��Դϴ�.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20011, '������ �Է� �� �� ���� ��¥�Դϴ�.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20012, '�ߵ�Ż���� �л��� ����ó���� �� �� �����ϴ�.');
                 ROLLBACK;
    -- Ŀ��
    --COMMIT;

END;


-- <����> ���� UPDATE ���ν���
CREATE OR REPLACE PROCEDURE PRC_SCORE_UPDATE
( V_SCORE_NO    IN SCORE.SCORE_NO%TYPE      -- ����ó���ڵ�
, V_ATTEND_SC   IN SCORE.ATTEND_SC%TYPE     -- ��� ����
, V_WRITE_SC    IN SCORE.WRITE_SC%TYPE      -- �ʱ� ����
, V_PRACTICE_SC IN SCORE.PRACTICE_SC%TYPE   -- �Ǳ� ����
)
IS  
    V_SUB_NO    SUB_DETAIL.SUB_NO%TYPE;
     
    -- ������ ��Ƶ� ����
    SD_ATTEND_POINT SUB_DETAIL.ATTEND_POINT%TYPE;
    SD_WRITE_POINT SUB_DETAIL.WRITE_POINT%TYPE;
    SD_PRACTICE_POINT SUB_DETAIL.PRACTICE_POINT%TYPE;

    -- ������ ���� ���������� ���� ����
    V_ATTEND_SC1    SCORE.ATTEND_SC%TYPE := 0;
    V_WRITE_SC1     SCORE.WRITE_SC%TYPE := 0;
    V_PRACTICE_SC1  SCORE.PRACTICE_SC%TYPE := 0;
    
    -- �ߺ�üũ ����
    V_DATE_CHECK      NUMBER;
    SC_CHECK          NUMBER;
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR  EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;

BEGIN
    
    -- ����ó���ڵ� ���翩�� Ȯ��
    SELECT COUNT(SCORE_NO) INTO SC_CHECK
    FROM SCORE
    WHERE SCORE_NO = V_SCORE_NO;
    
    -- �Է��� ����ó���ڵ尡 �������� ������ �����߻�
    IF (SC_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- �ش� ������ ����ó�� ��������
    -- ��������Ϻ��� ����ó���� ���� ����Ǹ� �ȵ�
    -- ���������� +7�ϱ��� ����ó�� ����Ǿ�� ��
    SELECT COUNT(*)   INTO V_DATE_CHECK
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO
      AND SUB_BEGIN < SYSDATE
      OR SUB_END +7 < SYSDATE;
      
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (V_DATE_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
       
    
    -- �Է��� ����ó���ڵ忡 �ش��ϴ� ���񰳼��ڵ� 
    SELECT SUB_NO INTO V_SUB_NO
    FROM SCORE
    WHERE SCORE_NO = V_SCORE_NO;
    
    -- ����ó���� �����ڵ��� ����
    SELECT ATTEND_POINT, WRITE_POINT, PRACTICE_POINT INTO SD_ATTEND_POINT, SD_WRITE_POINT, SD_PRACTICE_POINT            
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO;
    
    -- ������ ���� ����ó��
    V_ATTEND_SC1 := SD_ATTEND_POINT / 100 * V_ATTEND_SC;
    V_WRITE_SC1 := SD_WRITE_POINT / 100 * V_WRITE_SC;
    V_PRACTICE_SC1 := SD_PRACTICE_POINT / 100 * V_PRACTICE_SC;
    
    -- UPDATE
    UPDATE SCORE
    SET ATTEND_SC = V_ATTEND_SC1, WRITE_SC = V_WRITE_SC1, PRACTICE_SC = V_PRACTICE_SC1
    WHERE SCORE_NO = V_SCORE_NO;   
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20011, '������ �Է� �� �� ���� ��¥�Դϴ�.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20012, '�Է��� ����ó���ڵ�� �������� �ʽ��ϴ�.');
                 ROLLBACK;
                 
    -- Ŀ��
    COMMIT;
    
END;

-- �ߵ�Ż�� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_FAIL_INSERT
( V_FAIL_NO     FAIL.FAIL_NO%TYPE       -- �ߵ�Ż���ڵ�
, V_FAIL_DATE   FAIL.FAIL_DATE%TYPE     -- �ߵ�Ż������
, V_FR_NO       FAIL.FR_NO%TYPE         -- �ߵ�Ż�������ڵ�
, V_APPLY_NO    FAIL.APPLY_NO%TYPE      -- ������û�ڵ�
)
IS
    V_CR_BEGIN     CR_DETAIL.CR_BEGIN%TYPE;
    V_CR_END     CR_DETAIL.CR_END%TYPE;
    V_CR_NO         CR_DETAIL.CR_NO%TYPE;
    V_COUNT         NUMBER;
    
    -- ����� ���� ����ó�� ����
    USER_DEFINE_ERROR1   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION;
    
BEGIN

    -- �Է��� ������û�ڵ忡 �ش��ϴ� ���������ڵ�
    SELECT CR_NO INTO V_CR_NO 
    FROM APPLY
    WHERE APPLY_NO = V_APPLY_NO;

    -- ���������ڵ忡 �ش��ϴ� ����������,����������
    SELECT CR_BEGIN, CR_END INTO V_CR_BEGIN, V_CR_END
    FROM CR_DETAIL
    WHERE CR_NO =  V_CR_NO;

    -- �Է��� ������û�ڵ��� �ߺ�üũ
    SELECT COUNT(*)  INTO V_COUNT 
    FROM FAIL
    WHERE APPLY_NO = V_APPLY_NO;
    
    -- ���� �ߺ�üũ ������ ī��Ʈ�Ǹ� ���� �߻�
    IF (V_FAIL_DATE < V_CR_BEGIN OR V_FAIL_DATE > V_CR_END) -- �ߵ�Ż���� �������� ���̳� ���Ŀ� ó���� �� ����.
        THEN RAISE USER_DEFINE_ERROR1;
    ELSIF (V_COUNT > 0)                                     -- �ߵ� �ߺ��� �Ұ����ϴ�.
        THEN RAISE USER_DEFINE_ERROR2;
    ELSIF(SYSDATE < V_FAIL_DATE )                           -- �ߵ�Ż���� INSERT �ϴ� �Ⱓ�� SYSDATE�� �ʰ��� �� ����.
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    -- INSERT
    INSERT INTO FAIL(FAIL_NO, FAIL_DATE, FR_NO, APPLY_NO)
    VALUES(V_FAIL_NO, V_FAIL_DATE, V_FR_NO, V_APPLY_NO);
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '�����Ⱓ �ܿ��� �ߵ�Ż�� �� �� �����ϴ�..');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '�̹� �ߵ�Ż��ó���� �л��Դϴ�.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20008, '�ߵ�Ż��ó�����ڸ� Ȯ�����ּ���.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;




--�� �������� Ȯ�� �� ����
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "TEAM3"
    , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
    , UC.TABLE_NAME "TABLE_NAME"
    , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
    , UCC.COLUMN_NAME "COLUMN_NAME"
    , UC.SEARCH_CONDITION "SEARCH_CONDITION"
    , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK��(��) �����Ǿ����ϴ�.

--------------------------------------------------------------------------------
-- ���̺�
--�� 1. ������ ���̺� ����
CREATE TABLE ADMIN
( ADMIN_NO      VARCHAR2(10)
, ADMIN_NAME    VARCHAR2(30) CONSTRAINT ADMIN_NAME_NN NOT NULL
, ADMIN_ID      VARCHAR2(30) CONSTRAINT ADMIN_ID_NN NOT NULL
, ADMIN_PW      VARCHAR2(20) CONSTRAINT ADMIN_PW_NN NOT NULL
, ADMIN_SSN     VARCHAR2(14) CONSTRAINT ADMIN_DATE_NN NOT NULL
, ADMIN_DATE    DATE DEFAULT SYSDATE
, CONSTRAINT ADMIN_NO_PK PRIMARY KEY (ADMIN_NO)
, CONSTRAINT ADMIN_ID_UK UNIQUE (ADMIN_ID)
, CONSTRAINT ADMIN_SSN_UK UNIQUE (ADMIN_SSN)
);


--�� 2. ���� ���̺� ����
CREATE TABLE PROF
( PRF_NO	VARCHAR2(10)	            
, PRF_NAME	VARCHAR2(30)	CONSTRAINT PRF_NAME_NN NOT NULL            
, PRF_ID	VARCHAR2(30)	CONSTRAINT PRF_ID_NN NOT NULL          
, PRF_PW	VARCHAR2(20)	CONSTRAINT PRF_PW_NN NOT NULL            
, PRF_SSN	VARCHAR2(14)	CONSTRAINT PRF_SSN_NN NOT NULL            
, PRF_TEL	VARCHAR2(20)	                    
, PRF_DATE	DATE	       	DEFAULT SYSDATE    
, CONSTRAINT PROF_NO_PK PRIMARY KEY(PRF_NO)
, CONSTRAINT PROF_ID_UK UNIQUE (PRF_ID)
, CONSTRAINT PROF_SSN_UK UNIQUE (PRF_SSN)
);

--�� 3. �л� ���̺� ����
CREATE TABLE STUDENTS
( STD_NO    VARCHAR2(10)                                        -- �л��ڵ�
, STD_NAME  VARCHAR2(30) CONSTRAINT STUDENT_NAME_NN NOT NULL    -- �л���
, STD_ID    VARCHAR2(30) CONSTRAINT STUDENT_ID_NN NOT NULL      -- ���̵�
, STD_PW    VARCHAR2(20) CONSTRAINT STUDENT_PW_NN NOT NULL      -- �н�����
, STD_SSN   VARCHAR2(14) CONSTRAINT STUDENT_SSN_NN NOT NULL     -- �ֹι�ȣ
, STD_TEL   VARCHAR2(20)                                        -- ��ȭ��ȣ
, STD_DATE  DATE         DEFAULT SYSDATE                        -- �������
, CONSTRAINT STUDENT_NO_PK PRIMARY KEY(STD_NO)
, CONSTRAINT STUDENT_ID_UK UNIQUE (STD_ID)
, CONSTRAINT STUDENT_SSN_UK UNIQUE (STD_SSN)
);

--�� 4. ���ǽ� ���̺� ����
CREATE TABLE CLASSROOM
( ROOM_NO       VARCHAR2(10)    
, ROOM_NAME     VARCHAR2(30)    CONSTRAINT CLASSROOM_NAME_NN NOT NULL
, CONSTRAINT CLASSROOM_NO_PK PRIMARY KEY(ROOM_NO)
, CONSTRAINT CLASSROOM_NAME_UK UNIQUE(ROOM_NAME)
);


--�� 5. ���� ���̺� ����
CREATE TABLE BOOK
( BOOK_NO       VARCHAR2(10)
, BOOK_NAME     VARCHAR2(100)    CONSTRAINT BOOK_NAME_NN NOT NULL
, CONSTRAINT BOOK_NO_PK PRIMARY KEY(BOOK_NO)
, CONSTRAINT BOOK_NAME_UK UNIQUE(BOOK_NAME)
);


--�� 6. ���� ���̺� ����
CREATE TABLE SUBJECT
( SUBJECT_NO    VARCHAR2(10)
, SUBJECT_NAME  VARCHAR2(30)    CONSTRAINT SUBJECT_NAME_NN NOT NULL
, CONSTRAINT SUBJECT_NO_PK PRIMARY KEY(SUBJECT_NO)
, CONSTRAINT SUBJECT_NAME_UK UNIQUE(SUBJECT_NAME)
);


--�� 7. ���� ���̺� ����
CREATE TABLE COURSE
( COURSE_NO    VARCHAR2(10)                                     -- �����ڵ�
, COURSE_NAME  VARCHAR2(100) CONSTRAINT COURSE_NAME_NN NOT NULL -- ������
, CONSTRAINT COURSE_NO_PK PRIMARY KEY(COURSE_NO)
, CONSTRAINT COURSE_NAME_UK UNIQUE(COURSE_NAME)
);

--�� 8. �������� ���̺� ����
CREATE TABLE CR_DETAIL
(CR_NO          VARCHAR2(10)   
,CR_BEGIN       DATE           
,CR_END         DATE          
,CR_DATE        DATE            DEFAULT SYSDATE 

,COURSE_NO      VARCHAR2(10)    
,ROOM_NO        VARCHAR2(10)    
,PRF_NO         VARCHAR2(10)    

,CONSTRAINT DETAIL_CR_NO_PK PRIMARY KEY(CR_NO) 
,CONSTRAINT DETAIL_COURSE_NO_FK FOREIGN KEY(COURSE_NO) 
             REFERENCES COURSE(COURSE_NO)
,CONSTRAINT DETAIL_ROOM_NO_FK FOREIGN KEY(ROOM_NO)
            REFERENCES CLASSROOM(ROOM_NO)
,CONSTRAINT DETAIL_PRF_NO_FK FOREIGN KEY(PRF_NO) 
            REFERENCES PROF(PRF_NO)
);

--�� 9. ���񰳼� ���̺� ����
CREATE TABLE SUB_DETAIL
( SUB_NO	        VARCHAR2(10)	
, SUB_BEGIN	        DATE	
, SUB_END	        DATE
, SUB_DATE	        DATE	        DEFAULT SYSDATE
, ATTEND_POINT	    NUMBER(3)	
, WRITE_POINT	    NUMBER(3)	
, PRACTICE_POINT	NUMBER(3)	
, SUBJECT_NO	    VARCHAR2(10)	
, BOOK_NO	        VARCHAR2(10)	
, CR_NO             VARCHAR2(10)
, CONSTRAINT SDET_SUB_NO_PK PRIMARY KEY(SUB_NO)
, CONSTRAINT SDET_SUBJECT_NO_FK FOREIGN KEY(SUBJECT_NO)
            REFERENCES SUBJECT(SUBJECT_NO)
, CONSTRAINT SDET_BOOK_NO_FK FOREIGN KEY(BOOK_NO)
            REFERENCES BOOK(BOOK_NO)
, CONSTRAINT SDET_CR_NO_FK FOREIGN KEY(CR_NO)
            REFERENCES CR_DETAIL(CR_NO)  
, CONSTRAINT SDET_ATTEND_POINT CHECK(ATTEND_POINT >= 0)
, CONSTRAINT SDET_WRITE_POINT CHECK(WRITE_POINT >= 0)
, CONSTRAINT SDET_PRACTICE_POINT CHECK(PRACTICE_POINT >= 0)
);

--�� 10. ������û ���̺� ����
CREATE TABLE APPLY
( APPLY_NO      VARCHAR2(10)
, APPLY_DATE    DATE DEFAULT SYSDATE
, CR_NO         VARCHAR2(10)
, STD_NO        VARCHAR2(10)
, CONSTRAINT APPLY_NO_PK PRIMARY KEY (APPLY_NO)

, CONSTRAINT APPLY_CR_NO_FK FOREIGN KEY(CR_NO)
             REFERENCES CR_DETAIL(CR_NO)
, CONSTRAINT APPLY_STD_NO_FK FOREIGN KEY(STD_NO)
             REFERENCES STUDENTS(STD_NO)
);

--�� 11. ����ó�� ���̺� ����
CREATE TABLE SCORE
( SCORE_NO	    VARCHAR2(10)	                
, ATTEND_SC	    NUMBER(3)		    DEFAULT 0      
, WRITE_SC	    NUMBER(3)		    DEFAULT 0      
, PRACTICE_SC	NUMBER(3)		    DEFAULT 0      
, SCORE_DATE	DATE	    	    DEFAULT SYSDATE
, APPLY_NO	    VARCHAR2(10)	    CONSTRAINT APPLYNO_NN   NOT NULL
, SUB_NO        VARCHAR2(10)	    CONSTRAINT SUBNO_NN     NOT NULL
, CONSTRAINT SCORE_PK PRIMARY KEY(SCORE_NO)
, CONSTRAINT SCORE_APPLYNO_FK FOREIGN KEY(APPLY_NO)
            REFERENCES APPLY(APPLY_NO)
, CONSTRAINT SCORE_SUBNO_FK FOREIGN KEY(SUB_NO)
            REFERENCES SUB_DETAIL(SUB_NO)
, CONSTRAINT SCORE_ATTEND_SC CHECK(ATTEND_SC>=0 AND ATTEND_SC <= 100)
, CONSTRAINT SCORE_WRITE_SC CHECK(WRITE_SC>=0 AND WRITE_SC <= 100)
, CONSTRAINT SCORE_PRACTICE_SC CHECK(PRACTICE_SC>=0 AND PRACTICE_SC <= 100)
);

--�� 12. �ߵ�Ż������ ���̺� ����
CREATE TABLE FAIL_REASON
( FR_NO	VARCHAR2(10)	
, FR	VARCHAR2(300)	CONSTRAINT FRS_FR_NN    NOT NULL
, CONSTRAINT FRS_FR_NO_PK PRIMARY KEY(FR_NO)
, CONSTRAINT FRS_FR_UK UNIQUE(FR)
);

--�� 13. �ߵ�Ż�� ���̺� ����
CREATE TABLE FAIL
(FAIL_NO    VARCHAR2(10)                                
,FAIL_DATE  DATE            DEFAULT SYSDATE          
,FR_NO      VARCHAR2(10)                             
,APPLY_NO   VARCHAR2(10)                                 

,CONSTRAINT FAIL_FAIL_NO_PK PRIMARY KEY(FAIL_NO)       
,CONSTRAINT FAIL_FR_NO_FK FOREIGN KEY(FR_NO)            
            REFERENCES FAIL_REASON(FR_NO)
,CONSTRAINT FAIL_APPLY_NO_FK FOREIGN KEY(APPLY_NO)      
            REFERENCES APPLY(APPLY_NO)
);

-- ������û�� �л� ���� ��ȸ
CREATE OR REPLACE VIEW APPLIED_VIEW
AS
SELECT S.STD_NO "�л��ڵ�", S.STD_NAME "�л���", S.SUBJECT_NAME "�����", SD.SUB_BEGIN ||' ~ '||SD.SUB_END "����Ⱓ"
     , A.APPLY_NO "�����ڵ�", SD.SUB_NO "���������ڵ�"
FROM STUDENTS S JOIN APPLY A
  ON S.STD_NO = A.STD_NO
    JOIN CR_DETAIL CD
      ON CD.CR_NO = A.CR_NO
        JOIN SUB_DETAIL SD
          ON CD.CR_NO = SD.CR_NO
            JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO;
            
-- ���� ��¥ �������� ����ó�� ������ �л� ����
CREATE OR REPLACE VIEW POSSIBLE_VIEW
AS
SELECT S.STD_NO "�л��ڵ�", S.STD_NAME "�л���", S.SUBJECT_NAME "�����", SD.SUB_BEGIN ||' ~ '||SD.SUB_END "����Ⱓ"
     , A.APPLY_NO "�����ڵ�", SD.SUB_NO "���������ڵ�"
FROM STUDENTS S JOIN APPLY A
  ON S.STD_NO = A.STD_NO
    JOIN CR_DETAIL CD
      ON CD.CR_NO = A.CR_NO
        JOIN SUB_DETAIL SD
          ON CD.CR_NO = SD.CR_NO
            JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO
WHERE SD.SUB_END < SYSDATE AND  SYSDATE <= SD.SUB_END+7;

SELECT *
FROM TAB;
--==>>
/*
ADMIN
APPLY
BOOK
CLASSROOM
COURSE
CR_DETAIL
FAIL
FAIL_REASON
PROF
SCORE
STUDENTS
SUBJECT
SUB_DETAIL
*/

-------------------------------------------------------------------------------- ���̺� ���� �Ϸ�
-- ������ 
--�� ������ ������ ����
CREATE SEQUENCE SEQ_M
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� ���� ������ ����
CREATE SEQUENCE SEQ_P
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� �л� ������ ����
CREATE SEQUENCE SEQ_S
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� ���ǽ� ������ ����
CREATE SEQUENCE SEQ_CL
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� ���� ������ ����
CREATE SEQUENCE SEQ_BK
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� ���� ������ ����
CREATE SEQUENCE SEQ_SJ
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� ���� ������ ����
CREATE SEQUENCE SEQ_CR
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� �������� ������ ����
CREATE SEQUENCE SEQ_CD
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� ���񰳼� ������ ����
CREATE SEQUENCE SEQ_SD
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� ������û ������ ����
CREATE SEQUENCE SEQ_AP
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� ����ó�� ������ ����
CREATE SEQUENCE SEQ_SC
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� �ߵ�Ż������ ������ ����
CREATE SEQUENCE SEQ_FR
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--�� �ߵ�Ż�� ������ ����
CREATE SEQUENCE SEQ_FA
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

-------------------------------------------------------------------------------- �ĺ��ڵ� ������ ���� �Ϸ�
-- ���ν��� 
-- ���������� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_ADMIN_PW
( V_ADMIN_NO    IN ADMIN.ADMIN_NO%TYPE      -- ������ �ڵ�
, V_ADMIN_NAME  IN ADMIN.ADMIN_NAME%TYPE    -- ������ �̸�
, V_ADMIN_ID    IN ADMIN.ADMIN_ID%TYPE      -- ������ ���̵�
, V_ADMIN_SSN   IN ADMIN.ADMIN_SSN%TYPE     -- ������ �ֹι�ȣ
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
( V_ADMIN_NO    IN ADMIN.ADMIN_NO%TYPE      -- ������ �ڵ�
, V_ADMIN_NAME  IN ADMIN.ADMIN_NAME%TYPE    -- ������ �̸�
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
( V_PRF_NO      IN PROF.PRF_NO%TYPE     -- ������ �ڵ�
, V_PRF_NAME    IN PROF.PRF_NAME%TYPE   -- ������ �̸�
, V_PRF_ID      IN PROF.PRF_ID%TYPE     -- ������ ���̵�
, V_PRF_SSN     IN PROF.PRF_SSN%TYPE    -- ������ �ֹι�ȣ
, V_PRF_TEL     IN PROF.PRF_SSN%TYPE    -- ������ ��ȭ��ȣ
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
( V_PRF_NO      IN PROF.PRF_NO%TYPE          -- ������ �ڵ�
, V_PRF_NAME    IN PROF.PRF_NAME%TYPE        -- ������ �̸�
, V_PRF_PW      IN PROF.PRF_PW%TYPE          -- ������ �н�����
, V_PRF_TEL     IN PROF.PRF_SSN%TYPE         -- ������ ��ȭ��ȣ
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
    COMMIT;
    
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
    COMMIT;
    
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
( V_CR_NO       IN CR_DETAIL.CR_NO%TYPE         -- ���������ڵ�
, V_CR_BEGIN    IN CR_DETAIL.CR_BEGIN%TYPE      -- ����������
, V_CR_END      IN CR_DETAIL.CR_END%TYPE        -- ����������
, V_COURSE_NO   IN CR_DETAIL.COURSE_NO%TYPE     -- �����ڵ�
, V_ROOM_NO     IN CR_DETAIL.ROOM_NO%TYPE       -- ���ǽ��ڵ�
, V_PRF_NO      IN CR_DETAIL.PRF_NO%TYPE        -- �����ڵ�
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
, V_BOOK_NO      IN BOOK.BOOK_NO%TYPE           -- �����ڵ�
, V_CR_NO        IN CR_DETAIL.CR_NO%TYPE        -- ���������ڵ�
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
    COMMIT;

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
      AND (SUB_BEGIN < SYSDATE OR SUB_END +8 < SYSDATE);
      
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


SELECT *
FROM USER_PROCEDURES;
--==>>
/*
PRC_ADMIN_PW
PRC_ADMIN_UPDATE
PRC_APPLY_INSERT
PRC_CR_DETAIL_INSERT
PRC_CR_DETAIL_UPDATE
PRC_FAIL_INSERT
PRC_PROF_PW
PRC_PROF_UPDATE
PRC_SCORE_INSERT
PRC_SCORE_UPDATE
PRC_SD_UPDATE
PRC_STUDENTS_PW
PRC_STUDENTS_UPDATE
PRC_SUB_DETAIL_INSERT
PRC_SUB_DETAIL_UPDATE
*/

-------------------------------------------------------------------------------- ���ν��� ���� �Ϸ�
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

-- �����Ǿ��ִ� Ʈ���� ��ȸ ����
SELECT TRIGGER_NAME
FROM USER_TRIGGERS;
--==>>
/*
TRG_BOK_DELETE_01 ���� ����
TRG_FAR_DELETE_01 �ߵ�Ż�� ����
TRG_SBJ_DELETE_01 ���� ����
TRG_COS_DELETE_01 ���� ����
TRG_CLR_DELETE_01 ���ǽ� ����
TRG_APL_DELETE_01 ������û ����
TRG_STU_DELETE_01 �л� ����
TRG_CRD_DELETE_01 �������� ����
TRG_PRF_DELETE_01 ���� ����
TRG_SBD_DELETE_01 �������� ����
*/
-------------------------------------------------------------------------------- Ʈ���� ���� �Ϸ�
-- ��
-- <������> ���� ���� ��� �� ���� (VIEW_SUB_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_SUB_INFO
AS
SELECT C.COURSE_NAME "������", R.ROOM_NAME "���ǽǸ�", S.SUBJECT_NAME "�����"
     , (TO_CHAR(SD.SUB_BEGIN) || ' ~ ' || TO_CHAR(SD.SUB_END)) "����Ⱓ", B.BOOK_NAME "�����"
     , P.PRF_NAME "�����ڸ�"
FROM SUB_DETAIL SD, BOOK B, SUBJECT S, CR_DETAIL CD, CLASSROOM R, COURSE C, PROF P 
WHERE SD.BOOK_NO = B.BOOK_NO
  AND SD.SUBJECT_NO = S.SUBJECT_NO
  AND SD.CR_NO = CD.CR_NO
  AND CD.COURSE_NO = C.COURSE_NO
  AND CD.ROOM_NO = R.ROOM_NO
  AND CD.PRF_NO = P.PRF_NO;


-- <������> ���� ���� ��� �� ���� (VIEW VIEW_CR_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_CR_INFO
AS
SELECT C3.COURSE_NAME "������", C1.ROOM_NAME "���ǽǸ�", J.SUBJECT_NAME "�����",TO_CHAR(S1.SUB_BEGIN) ||' ~ '||
      TO_CHAR(S1.SUB_END) "����Ⱓ", B.BOOK_NAME "�����", P.PRF_NAME "�����ڸ�"
FROM CLASSROOM C1 JOIN CR_DETAIL C2 
ON C1.ROOM_NO = C2.ROOM_NO
    JOIN COURSE C3
      ON C2.COURSE_NO = C3.COURSE_NO
        JOIN SUB_DETAIL S1
          ON C2.CR_NO = S1.CR_NO
                JOIN SUBJECT J
                  ON J.SUBJECT_NO = S1.SUBJECT_NO
                        JOIN BOOK B
                          ON B.BOOK_NO = S1.BOOK_NO
                                JOIN PROF P
                                  ON P.PRF_NO = C2.PRF_NO;

-- <������> ������ ���� ��� �� ���� (VIEW_PROF_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_PROF_INFO
AS
SELECT P.PRF_NAME "������", S.SUBJECT_NAME "�����",  SD.SUB_BEGIN || ' ~ ' || SD.SUB_END "����Ⱓ"
     , B.BOOK_NAME "�����", C.ROOM_NAME "���ǽ�"
     , CASE WHEN TRUNC(SYSDATE) < SD.SUB_BEGIN THEN '����'
            WHEN TRUNC(SYSDATE) >= SD.SUB_BEGIN AND TRUNC(SYSDATE) <= SD.SUB_END THEN '������'
            WHEN TRUNC(SYSDATE) > SD.SUB_END THEN '�Ϸ�'
            ELSE 'Ȯ�κҰ�'
       END "�������࿩��"
FROM PROF P LEFT JOIN CR_DETAIL CD
    ON P.PRF_NO = CD.PRF_NO
    LEFT JOIN CLASSROOM C
        ON CD.ROOM_NO = C.ROOM_NO
            LEFT JOIN SUB_DETAIL SD
            ON CD.CR_NO = SD.CR_NO
                LEFT JOIN SUBJECT S
                ON SD.SUBJECT_NO = S.SUBJECT_NO
                    LEFT JOIN BOOK B
                    ON SD.BOOK_NO = B.BOOK_NO;

-- <������> �л� ���� ��� �� ���� (VIEW_STUDENT_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_STUDENT_INFO
AS
SELECT ST.STD_NAME "�л���", C.COURSE_NAME "������" , S.SUBJECT_NAME "�����" ,(ATTEND_SC + WRITE_SC + PRACTICE_SC) "����"
FROM STUDENTS ST LEFT JOIN APPLY A
  ON ST.STD_NO = A.STD_NO
    LEFT JOIN SCORE SC
      ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN SUB_DETAIL SD
          ON SD.SUB_NO =SC.SUB_NO
            LEFT JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO
               LEFT JOIN CR_DETAIL CD
                 ON CD.CR_NO = SD.CR_NO
                   LEFT JOIN COURSE C 
                    ON C.COURSE_NO = CD.COURSE_NO;

-- <������> ���� ���� ��� �� ���� (VIEW_SCORE_INFO) -- Ȯ�οϷ�
/*
CREATE OR REPLACE VIEW VIEW_SCORE_INFO
AS
SELECT P.PRF_NAME ������
     , SB.SUBJECT_NAME �����
     , TO_CHAR(SD.SUB_BEGIN) || ' ~ ' ||  TO_CHAR(SD.SUB_END) ����Ⱓ
     , B.BOOK_NAME �����
     , S.STD_NAME �л���
     , SC.ATTEND_SC  ���
     , SC.WRITE_SC   �ʱ�
     , SC.PRACTICE_SC    �Ǳ�
     , (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) ��������
     , RANK() OVER(PARTITION BY SB.SUBJECT_NAME ORDER BY NVL(SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC, 0) DESC) ������
     , CASE WHEN F.FAIL_NO IS NOT NULL THEN 'Y'
            WHEN F.FAIL_NO IS NULL THEN 'N'
            ELSE 'ERROR'
       END  �ߵ�Ż������
FROM APPLY A LEFT JOIN STUDENTS S
ON S.STD_NO = A.STD_NO
    LEFT JOIN SCORE SC
    ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN FAIL F
        ON A.APPLY_NO = F.APPLY_NO
            LEFT JOIN SUB_DETAIL SD
            ON SC.SUB_NO = SD.SUB_NO
                LEFT JOIN CR_DETAIL CD
                ON SD.CR_NO = CD.CR_NO
                    LEFT JOIN PROF P
                    ON CD.PRF_NO = P.PRF_NO
                    LEFT JOIN SUBJECT SB
                    ON SD.SUBJECT_NO = SB.SUBJECT_NO
                        LEFT JOIN BOOK B
                        ON SD.BOOK_NO = B.BOOK_NO;
*/
CREATE OR REPLACE VIEW VIEW_SCOREPRF_INFO
AS
SELECT P.PRF_NAME ������, S.SUBJECT_NAME �����, TO_CHAR(SD.SUB_BEGIN) || ' ~ ' ||  TO_CHAR(SD.SUB_END) ����Ⱓ, B.BOOK_NAME �����
FROM PROF P LEFT JOIN CR_DETAIL CD
ON P.PRF_NO = CD.PRF_NO
    LEFT JOIN COURSE C
    ON CD.COURSE_NO = C.COURSE_NO
        LEFT JOIN SUB_DETAIL SD
        ON CD.CR_NO = SD.CR_NO
            LEFT JOIN SUBJECT S
            ON SD.SUBJECT_NO = S.SUBJECT_NO
                LEFT JOIN BOOK B
                ON SD.BOOK_NO = B.BOOK_NO;

CREATE OR REPLACE VIEW VIEW_SCORE_INFO
AS               
SELECT SB.SUBJECT_NAME �����
     , S.STD_NAME �л���
     , SC.ATTEND_SC  ���
     , SC.WRITE_SC   �ʱ�
     , SC.PRACTICE_SC    �Ǳ�
     , (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) ��������
     , RANK() OVER(PARTITION BY SB.SUBJECT_NAME ORDER BY NVL(SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC, 0) DESC) ������
     , CASE WHEN F.FAIL_NO IS NOT NULL THEN 'Y'
            WHEN F.FAIL_NO IS NULL THEN 'N'
            ELSE 'ERROR'
       END  �ߵ�Ż������
FROM APPLY A LEFT JOIN STUDENTS S
ON A. STD_NO = S.STD_NO
    LEFT JOIN SCORE SC
    ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN FAIL F
        ON A.APPLY_NO = F.APPLY_NO
            LEFT JOIN SUB_DETAIL SD
            ON SD.SUB_NO = SC.SUB_NO
                LEFT JOIN SUBJECT SB
                ON SD.SUBJECT_NO = SB.SUBJECT_NO;

-- <�л�> ���� ���� ��� �� ���� (VIEW_STUDENTSC_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_STUDENTSC_INFO
AS
SELECT   S.STD_NO "�л��ڵ�"
       , S.STD_NAME "�л��̸�"
       , C.COURSE_NAME "������"
       , SB.SUBJECT_NAME "�����"
       , TO_CHAR(CBD.CR_BEGIN,'YYYY-MM-DD') || ' ~ ' || TO_CHAR(CBD.CR_END,'YYYY-MM-DD') "�����Ⱓ"
       , TO_CHAR(SBD.SUB_BEGIN,'YYYY-MM-DD') || ' ~ ' || TO_CHAR(SBD.SUB_END,'YYYY-MM-DD') "�ش�������Ⱓ"
       , B.BOOK_NAME "�����"
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.ATTEND_SC) ELSE 0 END "���" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.WRITE_SC) ELSE 0 END "�ʱ�" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.PRACTICE_SC) ELSE 0 END "�Ǳ�" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) ELSE 0 END "����"
--       , SC.ATTEND_SC "���" 
--       , SC.WRITE_SC "�ʱ�"
--       , SC.PRACTICE_SC "�Ǳ�"
--       , SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC "����"
     , RANK() OVER (PARTITION BY SUBJECT_NAME ORDER BY (SC. ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) DESC) "���"
     , F.FAIL_DATE "�ߵ�Ż������"
     , FR.FR "Ż������"
FROM COURSE C JOIN CR_DETAIL CBD
    ON C.COURSE_NO = CBD.COURSE_NO
    JOIN SUB_DETAIL SBD 
    ON SBD.CR_NO = CBD.CR_NO
    JOIN SUBJECT SB
    ON SBD.SUBJECT_NO = SB.SUBJECT_NO
    JOIN BOOK B
    ON B.BOOK_NO = SBD.BOOK_NO
    JOIN SCORE SC
    ON SC.SUB_NO = SBD.SUB_NO
    JOIN APPLY A
    ON A.APPLY_NO = SC.APPLY_NO
    JOIN STUDENTS S
    ON S.STD_NO = A.STD_NO
    LEFT JOIN FAIL F
    ON A.APPLY_NO = F.APPLY_NO
    LEFT JOIN FAIL_REASON FR
    ON  F.FR_NO = FR.FR_NO; 
    
SELECT *
FROM TAB;
--==>>
/*
VIEW_CR_INFO
VIEW_PROF_INFO
VIEW_SCOREPRF_INFO
VIEW_SCORE_INFO
VIEW_STUDENTSC_INFO
VIEW_STUDENT_INFO
VIEW_SUB_INFO
*/
-------------------------------------------------------------------------------- �� ���� �Ϸ�
-- ������ �Է�
-- 1. ������ ������
EXEC PRC_ADMIN_PW ('M'||LPAD(TO_CHAR(SEQ_M.NEXTVAL), 3, '0'), 'ä�ټ�', 'CDS','961023-2222222');

-- ������ ������Ʈ ������ 
--EXEC PRC_ADMIN_UPDATE('M001', 'ä�ټ�', '961023');

--2. ���� ������
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '������', 'OSK','941111-2222223', '010-1111-1111');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '�ڰ���', 'PKY','951010-2222224', '010-2222-2222');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '�����', 'KKT','991111-1111111', '010-3333-3333');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '�ڹ���', 'PPK','981111-1111112', '010-4444-4444');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '���ȯ', 'KSH','951212-1111113', '010-5555-5555');

-- ���� ������Ʈ ������ 
--EXEC PRC_PROF_UPDATE('P001', '������', '2222223', '010-1111-2222');


--3. �л� ������
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), 'ȫ�浿', 'STUDENT_01', '771212-1022432', '01123564528');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�̼���', 'STUDENT_02', '801007-1544236', '01047586532');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�̼���', 'STUDENT_03', '770922-2312547', '01042311236');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '������', 'STUDENT_04', '790304-1788896', '01952364221');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�Ѽ���', 'STUDENT_05', '811112-1566789', '01852113542');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�̱���', 'STUDENT_06', '780505-2978541', '01032145357');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '����ö', 'STUDENT_07', '780506-1625148', '01123452525');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�迵��', 'STUDENT_08', '821011-2362514', '01622224444');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '������', 'STUDENT_09', '810810-1552147', '01911112222');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '������', 'STUDENT_10', '751010-1122233', '01132145555');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '������', 'STUDENT_11', '801010-2987897', '01088884422');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '���ѱ�', 'STUDENT_12', '760909-1333333', '01822224242');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '���̼�', 'STUDENT_13', '790102-2777777', '01966664444');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), 'Ȳ����', 'STUDENT_14', '810707-2574812', '01032145467');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '������', 'STUDENT_15', '800606-2954687', '01625483365');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�̻���', 'STUDENT_16', '781010-1666678', '01045261234');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�����', 'STUDENT_17', '820507-1452365', '01032542542');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�̼���', 'STUDENT_18', '801028-1849534', '01813333333');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '�ڹ���', 'STUDENT_19', '780710-1985632', '01747474848');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '������', 'STUDENT_20', '800304-2741258', '01195958585');

-- �л� ������Ʈ ������ 
--EXEC PRC_STUDENTS_UPDATE('S020', '������', '2741258', '01095958585');

SELECT *
FROM STUDENTS;

--4. ���ǽ� ������
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'F���ǽ�');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'C���ǽ�');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'G���ǽ�');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'H���ǽ�');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'A���ǽ�');



--5. ���� ������
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), 'ä���� �ڹ� ���α׷��� �ٽ�');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '����Ŭ�� ���� �����ͺ��̽� ���а� �ǽ�');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '�ڹ��� ����');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), 'HTML + CSS + �ڹٽ�ũ��Ʈ �� ǥ���� ����');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '������ 5 ������');



--6. ���� ������
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Java');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Oracle Database');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'HTML/CSS/JavaScript');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Spring Framework');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'JSP');



--7. ���� ������
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java�� Ȱ���� Full-Stack������ �缺����');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), '�ڹ�_������ ��� ������ Full-stack ������ �缺����');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java(�ڹ�)_AWS Ȱ���� Full-Stack ������ �缺����(A)');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java(�ڹ�)_AWS Ȱ���� Full-Stack ������ �缺����(B)');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), '�ڹ�(Java)��� Web_����Ʈ�÷��� Full-Stack ������ �缺����');


--8. �������� ������ 
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'CR001', 'CL001', 'P001');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD') , TO_DATE('2024-08-08', 'YYYY-MM-DD'), 'CR002', 'CL002', 'P002');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-01-15', 'YYYY-MM-DD') , TO_DATE('2024-08-07', 'YYYY-MM-DD') , 'CR003', 'CL003', 'P003');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-11-13', 'YYYY-MM-DD') , TO_DATE('2024-06-10', 'YYYY-MM-DD'), 'CR004', 'CL004', 'P004');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR005', 'CL005', 'P005');

-- �������� ����Ȯ�� ������
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR005', 'CL005', 'P005');  -- ���� ��������
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR001', 'CL005', 'P005');  -- ���� ���ǽ�, ����, �����Ⱓ / �ٸ� ����
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR001', 'CL001', 'P005');  -- ���� �����Ⱓ, ���� / �ٸ� ����, ���ǽ�
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR001', 'CL001', 'P001');  -- ���� �����Ⱓ / �ٸ� ����, ���ǽ�, ����
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-27' ,'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'CR001', 'CL001', 'P005');

-- �������� ������Ʈ ������
--EXEC PRC_CR_DETAIL_UPDATE('CD200', TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'CR001', 'CL001', 'P001');


--9. �������� ������ 
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14','YYYY-MM-DD'), TO_DATE('2024-04-25','YYYY-MM-DD'), 'SJ001', 'BK001', 'CD001');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-04-26','YYYY-MM-DD'), TO_DATE('2024-06-27','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD001');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-03-11','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD002');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-03-12','YYYY-MM-DD'), TO_DATE('2024-08-08', 'YYYY-MM-DD'), 'SJ003', 'BK003', 'CD002');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-15','YYYY-MM-DD'), TO_DATE('2024-03-05','YYYY-MM-DD'), 'SJ001', 'BK001', 'CD003');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-03-06','YYYY-MM-DD'), TO_DATE('2024-05-05','YYYY-MM-DD'), 'SJ003', 'BK003', 'CD003');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-11-13','YYYY-MM-DD'), TO_DATE('2024-01-15','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD004');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-03-11','YYYY-MM-DD'), 'SJ004', 'BK004', 'CD004');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21','YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'SJ001', 'BK001', 'CD005');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-10-16','YYYY-MM-DD'), TO_DATE('2023-12-25','YYYY-MM-DD'), 'SJ003', 'BK003', 'CD005');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-12-26','YYYY-MM-DD'), TO_DATE('2024-03-18','YYYY-MM-DD'), 'SJ005', 'BK005', 'CD005');

-- �������� ����Ȯ�� ������
--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-08-22','YYYY-MM-DD'), TO_DATE('2024-10-05','YYYY-MM-DD'), 'SJ001', 'BK001', 'CD001'); -- �ߺ��� ����, �ߺ��� ����Ⱓ
--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-08-22','YYYY-MM-DD'), TO_DATE('2024-10-05','YYYY-MM-DD'), 'SJ002', 'BK001', 'CD001'); -- �ߺ��� ����Ⱓ
--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14','YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'SJ001', 'BK001', 'CD001'); -- �ߺ��� ����, �ߺ��� ����


-- �������� ������Ʈ ������
--EXEC PRC_SUB_DETAIL_UPDATE('SD200', TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'SJ001', 'BK001', 'CD005');


--9. ��������(����) ������
EXEC PRC_SD_UPDATE('SD001', 20, 40, 40);
EXEC PRC_SD_UPDATE('SD002', 40, 40, 20);
EXEC PRC_SD_UPDATE('SD003', 30, 40, 30);
EXEC PRC_SD_UPDATE('SD004', 30, 35, 35);
EXEC PRC_SD_UPDATE('SD005', 40, 20, 40);
EXEC PRC_SD_UPDATE('SD006', 20, 40, 40);
EXEC PRC_SD_UPDATE('SD007', 40, 40, 20);
EXEC PRC_SD_UPDATE('SD008', 30, 40, 30);
EXEC PRC_SD_UPDATE('SD009', 30, 35, 35);
EXEC PRC_SD_UPDATE('SD010', 40, 20, 40);
EXEC PRC_SD_UPDATE('SD011', 40, 20, 40);

--10. ������û ������ 
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S001');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S002');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S003');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S004');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S005');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S006');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S007');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S008');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S009');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S010');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S011');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S012');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S013');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S014');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S015');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S016');

--11. ����ó�� ������
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 50, 100, 40, 'AP010', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 80, 100, 40, 'AP011', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP012', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP013', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP013', 'SD010');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 50, 30, 'AP014', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 50, 30, 'AP014', 'SD010');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP014', 'SD011');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD010');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD011');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 60, 70, 80, 'AP016', 'SD009');
--EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 60, 70, 80, 'AP016', 'SD010');

-- ����ó�� ������Ʈ ������
--EXEC PRC_SCORE_UPDATE('SC020', 80, 80, 80);


--12. �ߵ�Ż������ ������
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '���');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '�����µ��ҷ�');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '���λ���');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '������');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), 'Ȯ�κҰ�(�����)');


--13. �ߵ�Ż�� ������
EXEC PRC_FAIL_INSERT('FA'||LPAD(TO_CHAR(SEQ_FA.NEXTVAL), 3, '0'), SYSDATE, 'FR003', 'AP016');


-------------------------------------------------------------------------------- ������ �Է� �Ϸ�
-- Ȯ��
SELECT *
FROM VIEW_CR_INFO;

SELECT *
FROM VIEW_PROF_INFO;
--
SELECT *
FROM VIEW_SCOREPRF_INFO;
SELECT *
FROM VIEW_SCORE_INFO
WHERE ����� = 'Java';
--
SELECT *
FROM VIEW_STUDENTSC_INFO;

SELECT *
FROM VIEW_STUDENT_INFO;

SELECT *
FROM VIEW_SUB_INFO;

SELECT *
FROM POSSIBLE_VIEW;

SELECT *
FROM APPLIED_VIEW;

-------------------------------------------------------------------------------- Ȯ�� �Ϸ�






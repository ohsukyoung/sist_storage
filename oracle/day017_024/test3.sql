-- 제약조건 확인 VIEW 생성
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

--------------------------------------------------------------------------------

--○ 1. 관리자 테이블 생성
CREATE TABLE ADMIN
( ADMIN_NO      VARCHAR2(10)
, ADMIN_NAME    VARCHAR2(30) CONSTRAINT ADMIN_NAME_NN NOT NULL
, ADMIN_ID      VARCHAR2(30) CONSTRAINT ADMIN_ID_NN NOT NULL
, ADMIN_PW      VARCHAR2(20) CONSTRAINT ADMIN_PW_NN NOT NULL
, ADMIN_SSN     VARCHAR2(14) CONSTRAINT ADMIN_DATE_NN NOT NULL
, ADMIN_DATE    DATE DEFAULT SYSDATE
, CONSTRAINT ADMIN_NO_PK PRIMARY KEY (ADMIN_NO)
, CONSTRAINT ADMIN_ID_UK UNIQUE (ADMIN_ID)
);

--○ 2. 교수 테이블 생성
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
);

--○ 3. 학생 테이블 생성
CREATE TABLE STUDENTS
( STD_NO    VARCHAR2(10)                                        -- 학생코드
, STD_NAME  VARCHAR2(30) CONSTRAINT STUDENT_NAME_NN NOT NULL    -- 학생명
, STD_ID    VARCHAR2(30) CONSTRAINT STUDENT_ID_NN NOT NULL      -- 아이디
, STD_PW    VARCHAR2(20) CONSTRAINT STUDENT_PW_NN NOT NULL      -- 패스워드
, STD_SSN   VARCHAR2(14) CONSTRAINT STUDENT_SSN_NN NOT NULL     -- 주민번호
, STD_TEL   VARCHAR2(20)                                        -- 전화번호
, STD_DATE  DATE         DEFAULT SYSDATE                        -- 등록일자
, CONSTRAINT STUDENT_NO_PK PRIMARY KEY(STD_NO)
, CONSTRAINT STUDENT_ID_UK UNIQUE (STD_ID)
);

--○ 4. 강의실 테이블 생성
CREATE TABLE CLASSROOM
( ROOM_NO       VARCHAR2(10)    
, ROOM_NAME     VARCHAR2(30)    CONSTRAINT CLASSROOM_NAME_NN NOT NULL
, CONSTRAINT CLASSROOM_NO_PK PRIMARY KEY(ROOM_NO)
);
--==>> Table CLASSROOM이(가) 생성되었습니다.

--○ 5. 교재 테이블 생성
CREATE TABLE BOOK
( BOOK_NO       VARCHAR2(10)
, BOOK_NAME     VARCHAR2(100)    CONSTRAINT BOOK_NAME_NN NOT NULL
, CONSTRAINT BOOK_NO_PK PRIMARY KEY(BOOK_NO)
);
--==>> Table BOOK이(가) 생성되었습니다.

--○ 6. 과목 테이블 생성
CREATE TABLE SUBJECT
( SUBJECT_NO    VARCHAR2(10)
, SUBJECT_NAME  VARCHAR2(30)    CONSTRAINT SUBJECT_NAME_NN NOT NULL
, CONSTRAINT SUBJECT_NO_PK PRIMARY KEY(SUBJECT_NO)
);
--==>> Table SUBJECT이(가) 생성되었습니다.

--○ 7. 과정 테이블 생성
CREATE TABLE COURSE
( COURSE_NO    VARCHAR2(10)                                     -- 과정코드
, COURSE_NAME  VARCHAR2(100) CONSTRAINT COURSE_NAME_NN NOT NULL -- 과정명
, CONSTRAINT COURSE_NO_PK PRIMARY KEY(COURSE_NO)
);


--○ 8. 과정개설 테이블 생성
CREATE TABLE CR_DETAIL
(CR_NO          VARCHAR2(10)    --CONSTRAINT CR_NO_NN NOT NULL
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

--○ 9. 과목개설 테이블 생성
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

--○ 10. 수강신청 테이블 생성
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

--○ 11. 성적처리 테이블 생성
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
, CONSTRAINT SCORE_ATTEND_MIN CHECK(ATTEND_SC>=0)
, CONSTRAINT SCORE_WRITE_MIN CHECK(WRITE_SC>=0)
, CONSTRAINT SCORE_PRACTICE_MIN CHECK(PRACTICE_SC>=0)
);

--○ 12. 중도탈락사유 테이블 생성
CREATE TABLE FAIL_REASON
( FR_NO	VARCHAR2(10)	
, FR	VARCHAR2(300)	CONSTRAINT FRS_FR_NN    NOT NULL
, CONSTRAINT FRS_FR_NO_PK PRIMARY KEY(FR_NO)
);

--○ 13. 중도탈락 테이블 생성
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

-------------------------------------------------------------------------------- 테이블 생성 완료

SELECT *
FROM ADMIN;

SELECT *
FROM PROF;

SELECT *
FROM STUDENTS;

SELECT *
FROM CLASSROOM;

SELECT *
FROM SUBJECT;

SELECT *
FROM BOOK;

SELECT *
FROM COURSE;

SELECT *
FROM CR_DETAIL;

SELECT *
FROM SUB_DETAIL;

SELECT *
FROM SCORE;

SELECT *
FROM FAIL_REASON;

SELECT *
FROM FAIL;

SELECT *
FROM APPLY;

SELECT *
FROM VIEW_STUDENTSC_INFO;


--------------------------------------------------------------------------------





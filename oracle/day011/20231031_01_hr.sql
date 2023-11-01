SELECT USER
FROM DUAL;

--■■■ CHECK(CK:C) ■■■--
/*
1. 컬럼에서 허용 가능한 데이터의 범위나 조건을 지정하기 위한 제약조건  
    컬럼에 입력되는 데이터를 검사하여 조건에 맞는 데이터만 입력될 수 있도록 한다.
    또한, 컬러멩서 주어되는 데이터를 검사하여 조건에 맞는 데이터로 수정되는 것만 
    허용하는 기능을 수행하게 된다.
    
2. 형식 및 구조
    (1) 컬럼 레벨의 형식
    ``` SQL
    컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명] CHECK(컬럼 조건)
    ```
    
    (2) 테이블 레벨의 형식
    ``` SQL
    컬럼명 타입,
    컬럼명 타입,
    CONSTRAINT CONSTRAINT명 CHECK(컬럼 조건)
    ```
*/    
--○ CK 지정 실습((1) 컬럼 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST8
( COL1 NUMBER(5)    PRIMARY KEY
, COL2 VARCHAR2(30)
, COL3 NUMBER(3)    CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST8이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(1,'박범구',100);
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(1,'엄재용',100); --> 에러 발생 (ORA-00001: unique constraint (HR.SYS_C007106) violated)
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(2,'엄재용',101); --> 에러 발생 (ORA-02290: check constraint (HR.SYS_C007105) violated)
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(2,'엄재용',-1);  --> 에러 발생 (ORA-02290: check constraint (HR.SYS_C007105) violated)
INSERT INTO TBL_TEST8(COL1,COL2,COL3) VALUES(2,'엄재용',80);

-- 확인
SELECT *
FROM TBL_TEST8;
--==>>
/*
1	박범구	100
2	엄재용	80
*/    

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST8';
--==>>
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	    DELETE_RULE
HR	    SYS_C007105	    TBL_TEST8	    C	        COL3	    COL3 BETWEEN 0 AND 100	(null)
HR	    SYS_C007106	    TBL_TEST8	    P	        COL1		(null)                  (null)
*/
-- *SEARCH_CONDITION: 제약조건 기술*  

--○ CK 지정 실습((2) 테이블 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST9
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, COL3 NUMBER(3)
, CONSTRAINT TEST9_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST9_COL3_CK CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST9이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(1,'박범구',100);
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(1,'엄재용',100); --> 에러 발생 (ORA-00001: unique constraint (HR.SYS_C007106) violated)
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(2,'엄재용',101); --> 에러 발생 (ORA-02290: check constraint (HR.SYS_C007105) violated)
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(2,'엄재용',-1);  --> 에러 발생 (ORA-02290: check constraint (HR.SYS_C007105) violated)
INSERT INTO TBL_TEST9(COL1,COL2,COL3) VALUES(2,'엄재용',80);

-- 확인
SELECT *
FROM TBL_TEST9;
--==>>
/*
1	박범구	100
2	엄재용	80
*/    

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST9';
--==>>
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	    DELETE_RULE
HR	    SYS_C007105	    TBL_TEST8	    C	        COL3	    COL3 BETWEEN 0 AND 100	(null)
HR	    SYS_C007106	    TBL_TEST8	    P	        COL1		(null)                  (null)
*/

--○ CK 지정 실습((3) 테이블 생성 이후 제약조건 추가)
--※ 이미 생성된(만들어져 있는) 상태의 테이블에
--   부여하려는 제약조건을 위반한 데이터가 포함되어 있을 경우
--   해당 테이블에 제약조건을 추가하는 것은 불가능하다.
CREATE TABLE TBL_TEST10
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, COL3 NUMBER(3)
);
--==>> Table TBL_TEST10이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST10';
--==>> 조회결과 없음

-- 제약조건 추가
ALTER TABLE TBL_TEST10
ADD ( CONSTRAINT TEST10_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST10_COL3_CK CHECK(COL3 BETWEEN 0 AND 100));
--==>> Table TBL_TEST10이(가) 변경되었습니다.
-- *제약조건을 여러개 추가시 ADD ( 제약조건1, 제약조건2,...)로 작성*  

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>>
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	    DELETE_RULE
HR	    SYS_C007105	    TBL_TEST8	    C	        COL3	    COL3 BETWEEN 0 AND 100	(null)
HR	    SYS_C007106	    TBL_TEST8	    P	        COL1		(null)                  (null)
*/

-- 테이블 생성
CREATE TABLE TBL_TESTMEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, SSN   CHAR(14)            -- 입력형태 -> 'YYMMDD-NNNNNNN' -> 14자리
                            --              12345678901234
, TEL   VARCHAR2(40)
);
--==>> Table TBL_TESTMEMBER이(가) 생성되었습니다.

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_TESTMEMBER 테이블의 SSN 컬럼(주민등록번호 컬럼)에서
--   데이터 입력이나 수정 시, 성별이 유효한 데이터만 입력될 수 있도록
--   체크 제약조건을 추가할 수 있도록 한다.
--   (-> 주민번호 특정 자리에 입력가능한 데이터를 1,2,3,4 만 가능하도록 처리)
--   또한, SID 컬럼에는 PRIMARY KEY 제약조건을 설정할 수 있도록 한다.

-- 제약조건 삭제
ALTER TABLE TBL_TESTMEMBER DROP CONSTRAINT TESTMEMBER_SSN_CK_01;

-- 제약조건 추가
ALTER TABLE TBL_TESTMEMBER
ADD (
    CONSTRAINT TESTMEMBER_SID_PK PRIMARY KEY(SID)
    ,CONSTRAINT TESTMEMBER_SSN_CK CHECK(주민번호 8번째 자리 1개가 '1' 또는 '2' 또는 '3' 또는 '4')
    );
    
ALTER TABLE TBL_TESTMEMBER
ADD (
    CONSTRAINT TESTMEMBER_SID_PK PRIMARY KEY(SID)
   ,CONSTRAINT TESTMEMBER_SSN_CK CHECK(SUBSTR(SSN,8,1) IN ('1','2','3','4'))
    );
    
ALTER TABLE TBL_TESTMEMBER
ADD (
--    CONSTRAINT TESTMEMBER_SSN_CK CHECK(SSN LIKE ('_______1%'))                              -- 실행됨
--    ,CONSTRAINT TESTMEMBER_SSN_CK CHECK(SSN LIKE ('_______1%') OR SSN LIKE ('_______2%'))   -- 안됨
--    ,CONSTRAINT TESTMEMBER_SSN_CK01 CHECK(SSN LIKE ('_______1%') OR SSN LIKE ('_______2%')) -- 안됨
--    ,CONSTRAINT TESTMEMBER_SSN_CK01 CHECK(SSN LIKE ('_______1%') OR SSN LIKE ('_______2%')) -- 안됨
    );

-- *제약조건 LIKE AND 코드가 맞는지 확인-> 가능*
-- *WHERE의 모든 조건이 제약조건에 작성되는 것은 아님. AND OR 불가.*
SELECT *
FROM TBL_TESTMEMBER
WHERE SSN LIKE ('_______1%') OR SSN LIKE ('_______2%');


-- 테스트 데이터 입력
--INSERT INTO TBL_TESTMEMBER(SID,SSN) VALUES(1,'123456-1901234');
--INSERT INTO TBL_TESTMEMBER(SID,SSN) VALUES(2,'123456-2901234');
--INSERT INTO TBL_TESTMEMBER(SID,SSN) VALUES(3,'123456-3901234');
--INSERT INTO TBL_TESTMEMBER(SID,SSN) VALUES(4,'123456-4901234');
--INSERT INTO TBL_TESTMEMBER(SID,SSN) VALUES(5,'123456-5901234'); --> 에러 발생(ORA-02290: check constraint (HR.TESTMEMBER_SSN_CK) violated)

INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) VALUES(1,'이윤수','950106-1234567','010-1111-1111');
INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) VALUES(2,'박나영','990208-2234567','010-2222-2222');
INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) VALUES(3,'최혜인','070811-4234567','010-3333-3333');
INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) VALUES(4,'길현욱','090111-3234567','010-4444-4444');

INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) VALUES(4,'정현욱','000220-5234567','010-5555-5555'); --> 에러 발생
INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) VALUES(4,'정현욱','000220-6234567','010-5555-5555'); --> 에러 발생


-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMBER';
--==>>
/*
OWNER	CONSTRAINT_NAME	    TABLE_NAME	    CONSTRAINT_TYPE	COLUMN_NAME	 SEARCH_CONDITION	                  DELETE_RULE
HR	    TESTMEMBER_SID_PK	TBL_TESTMEMBER	P	            SID		     (null)                               (null)
HR	    TESTMEMBER_SSN_CK	TBL_TESTMEMBER	C	            SSN	         SUBSTR(SSN,8,1) IN ('1','2','3','4') (null)	
*/

-- 확인을 위한 테이블 삭제
DROP TABLE TBL_TESTMEMBER;

-- 확인
SELECT *
FROM TBL_TESTMEMBER;
--==>>
/*
1	이윤수	950106-1234567	010-1111-1111
2	박나영	990208-2234567	010-2222-2222
3	최혜인	070811-4234567	010-3333-3333
4	길현욱	090111-3234567	010-4444-4444
*/

--■■■ FOREIGN KEY(FK:F:R) ■■■--

/*
1. 참조 키(R)또는 외래 키(FK:F)는 두 테이블의 데이터 간 연결을 설정하고
    강제 적용시키는데 사용되는 열이다.
    한 테이블의 기본 키 값이 있는 열을
    다른 테이블에 추ㅏㄱ하면 테이블 간 연결을 설정할 수 있다.
    이 때, 두 번째 테이블에 추가되는 열이 외래키가 된다.
    
2. 부모 테이블(참조받는 컬럼이 포함된 테이블)이 먼저 생성된 후
    자식 테이블(참조하는 컬럼이 포함된 테이블)이 생성되어야 한다.
    이 때, 자식 ㅔ이블에 FOREIGN KEY 제약조건이 설정된다.
    
3. 형식 및 구조
    (1) 컬럼 레벨의 형식
    ``` SQL
    컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명]
                      RERERENCES 참조테이블명(참조컬럼명)
                      [ON DELETE CASCADE : ON DELETE SET NULL]  -> 추가옵션
    ```
                      
    (2) 테이블 레벨의 형식
    ``` SQL
    컬럼명 데이터타입,
    컬럼명 데이터타입,
    CONSTRAINT CONSTRAINT명 FOREIGN KEY(컬럼명)
                      RERERENCES 참조테이블명(참조컬럼명)
                      [ON DELETE CASCADE : ON DELETE SET NULL]  -> 추가옵션
    ```
*/

--※ FOREIGN KEY 제약조건을 설정하는 실습을 진행하기 위해서는
--   부모테이블의 생성 작업을 먼저 수행해야 한다.,
--   그리고 이 때, 부모 테이블에는 반드시 PK 또는 UK 제약조건이
--   설정된 컬럼이 존재해야 한다.

-- 부모테이블 생성
CREATE TABLE TBL_JOBS
( JIKWI_ID      NUMBER
, JIKWI_NAME    VARCHAR2(30)
, CONSTRAINT JOBS_ID_PK PRIMARY KEY(JIKWI_ID)
);
--==>> Table TBL_JOBS이(가) 생성되었습니다.

-- 부모 테이블에 데이터 입력
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(1,'사원');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(2,'대리');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(3,'과장');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(4,'부장');
--==> 1 행 이(가) 삽입되었습니다. * 4

-- 확인
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
3	과장
4	부장
*/

-- 커밋
COMMIT;
--==>> 커밋 완료.

--○ FK 지정 실습((1) 컬럼 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_EMP1
( SID       NUMBER          PRIMARY KEY
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER          REFERENCES TBL_JOBS(JIKWI_ID)
--                                              -------- TBL_JOBS의 JIKWI_ID
);
--==>> Table TBL_EMP1이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>> 
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	DELETE_RULE
HR	    SYS_C007125	    TBL_EMP1	P	            SID		
HR	    SYS_C007126	    TBL_EMP1	R	            JIKWI_ID		                NO ACTION
*/
-- * SEARCH_CONDITION: (NULL)       -> 체크제약조건의 상세 내용
-- * CONSTRAINT_TYPE: R             -> FOREIFN KEY
-- * DELETE_RULE: NO ACTION         -> 두개의 테이블이 연결되어 있는데, FK가 삭제되면 -> 남은 값은 어떻게 할 것인지..

-- 데이터 입력
INSERT INTO TBL_EMP1(SID,NAME, JIKWI_ID) VALUES(1, '노은하',1);
INSERT INTO TBL_EMP1(SID,NAME, JIKWI_ID) VALUES(2, '박가영',2);
INSERT INTO TBL_EMP1(SID,NAME, JIKWI_ID) VALUES(3, '채다선',3);
INSERT INTO TBL_EMP1(SID,NAME, JIKWI_ID) VALUES(4, '김수환',4);

INSERT INTO TBL_EMP1(SID,NAME, JIKWI_ID) VALUES(5, '김다슬',5); -->> 에러 발생(5의 참조번호가 없어서 실행X)
INSERT INTO TBL_EMP1(SID,NAME, JIKWI_ID) VALUES(5, '김다슬',1);
INSERT INTO TBL_EMP1(SID,NAME) VALUES(6, '오수경'); --*직위ID를 NULL인 상태로 입력하겠다는 뜻
-- *비워두는 것은 가능하지만, 입력을 할 것이라면 있는 번호 입력가능*  

SELECT *
FROM TBL_EMP1;
--==>>
/*
1	노은하	1
2	박가영	2
3	채다선	3
4	김수환	4
5	김다슬	1
6	오수경	
*/

COMMIT;

--○ FK 지정 실습((2) 테이블 레벨의 형식)
--  테이블 생성
CREATE TABLE TBL_EMP2
( SID       NUMBER
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER
, CONSTRAINT EMP2_SID_PK PRIMARY KEY(SID)
, CONSTRAINT EMP_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)  -- *TBL_EMP2의 직위 ID
             REFERENCES TBL_JOBS(JIKWI_ID)          -- *JOBS 직위ID
);
--==>> Table TBL_EMP2이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP2';
--==>>
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	DELETE_RULE
HR	    SYS_C007125	    TBL_EMP1	P	            SID		
HR	    SYS_C007126	    TBL_EMP1	R	            JIKWI_ID		                NO ACTION
*/

--○ FK 지정 실습((3) 테이블 생성 이후 제약조건 추가)
-- 테이블 생성
CREATE TABLE TBL_EMP3
( SID       NUMBER
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER
);
--==>> Table TBL_EMP3이(가) 생성되었습니다.

-- 제약조건 추가
ALTER TABLE TBL_EMP3
ADD ( CONSTRAINT EMP3_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                REFERENCES TBL_JOBS(JIKWI_ID)
    );
--==>> Table TBL_EMP3이(가) 변경되었습니다.

-- 제약조건 제거
ALTER TABLE TBL_EMP3
DROP CONSTRAINT EMP3_JIKWI_ID_FK;   -- *오라클이 알아서 이름부여한 경우 꼭 조회후 제거*
--==>> Table TBL_EMP3이(가) 변경되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> HR	EMP3_SID_PK	TBL_EMP3	P	SID		

-- 다시 제약조건 추가
ALTER TABLE TBL_EMP3
ADD CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
               REFERENCES TBL_JOBS(JIKWI_ID);
--==>> Table TBL_EMP3이(가) 변경되었습니다.

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>>
/*
HR	EMP3_SID_PK	TBL_EMP3	P	SID		
HR	EMP3_JIKWI_ID_FK	TBL_EMP3	R	JIKWI_ID		NO ACTION
*/

/*
4. FOREIGN KEY 생성 시 주의사항
    참조하고자 하는 부모 테이블을 먼저 생성해야 한다.
    참조하고자 하는 컬럼이 PRIMARY KEY 또는 UNIQUE 제약조건이 설정되어 있어야 한다.
    테이블 사이에 PRIMARY KEY 와 FOREIGN KEY 가 정의되어 있으면
    PRIMARY KEY 제약조건이 설정된 데이터 삭제 시
    FOREIGN KEY 컬럼에 그 값이 입력되어 있는 경우 삭제되지 않는다.
    (즉, 자식 테이블에 참조하는 레코드가 존재할 경우
    부모 테이블의 참조받는 해당 레코드는 삭제할 수 없다는 것이다.)
    단, FK 설정 과정에서 <ON DELETE CASCADE>나 <ON DLELETE SET NULL> 옵션을
    -- *정말 특별한 경우가 아니고서는 사용하지 않는 옵션*
    -- *자식 값을 모두 지우고 본인 삭제됨*
    사용하여 설정한 경우에는 삭제가 가능하다.
    또한, 부모 테이블을 제거하기 위해서는 자식 테이블을 먼저 제거해야 한다.
*/

-- *==================================
-- *결론: FOREIGN KEY설정 시
-- *(1) 부모테이블 P.K 또는 UNIQUE가 먼저 생성되어야함
-- *(2) 
-- *==================================

-- 부모 테이블
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
3	과장
4	부장
*/

-- 자식 테이블
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	노은하	1
2	박가영	2
3	채다선	3
4	김수환	4
5	김다슬	1
6	오수경	
*/

-- 부모 테이블 제거 시도
DROP TABLE TBL_JOBS; --> 에러 발생(02449. 00000 -  "unique/primary keys in table referenced by foreign keys")

-- 부모 테이블의 부장 직위 데이터 삭제 시도
SELECT *
FROM TBL_JOBS
WHERE JIKWI_ID =4;
--==>> 4	부장

DELETE
FROM TBL_JOBS
WHERE JIKWI_ID =4;  --> 에러 발생(ORA-02292: integrity constraint (HR.SYS_C007126) violated - child record found)

-- 김수환 부장의 직위를 사원으로 변경
UPDATE TBL_EMP1
SET JIKWI_ID=1
WHERE SID=4;
--==>> 1 행 이(가) 업데이트되었습니다.

-- 확인
SELECT *
FROM TBL_EMP1;
--==>> 
/*
1	노은하	1
2	박가영	2
3	채다선	3
4	김수환	1
5	김다슬	1
6	오수경	
*/

-- 커밋
COMMIT;

-- 부모 테이블(TBL_JOBS)의 부장 데이터를 참조하고 있는
-- 자식 테이블(TBL_EMP1)의 데이터가 존재하지 않는 상황

-- 이와 같은 상황에서 부모 테이블(TBL_JOBS)의
-- 부장 데이터 삭제
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID =4;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
3	과장
*/

COMMIT;

--※ 부모 테이블의 데이터를 자유롭게(?) 삭제하기 위해서는 <ON DELETE CASCADE> 옵션 지정이 필요하다.

/* 2-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- TBL_EMP1 테이블(자식 테이블)에서 FK 제약조건을 제거한 후
-- CASCADE 옵션을 포함하여 다시 FK 제약조건을 설정한다.
-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	DELETE_RULE
HR	    SYS_C007125	    TBL_EMP1	P	            SID		
HR	    SYS_C007126	    TBL_EMP1	R	            JIKWI_ID		                NO ACTION
*/
--> FK 제약조건(CONSTRAINT_TYPE:R)의 이름(CONASTRAINT_NAME): SYS_C007126

-- 제약조건 제거
ALTER TABLE TBL_EMP1
DROP CONSTRAINT SYS_C007126;

-- 제약조건 제거 이후 다시 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	DELETE_RULE
HR	    SYS_C007125	    TBL_EMP1	P	            SID		
*/

-- <ON DELTET CASCADE> 옵션이 포함된 내용으로 제약조건 다시 설정
ALTER TABLE TBL_EMP1
ADD CONSTRAINT EMP1_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                REFERENCES TBL_JOBS(JIKWI_ID)
                ON DELETE CASCADE;
--==>> Table TBL_EMP1이(가) 변경되었습니다.

-- 제약조건 생성 이후 다시 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
--==>>
/*
OWNER	CONSTRAINT_NAME	  TABLE_NAME    CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	DELETE_RULE
HR	    SYS_C007125	      TBL_EMP1	    P	            SID		
HR	    EMP1_JIKWI_ID_FK  TBL_EMP1	    R	            JIKWI_ID		CASCADE
*/

--※ CASCADE 옵션을 지정한 후에는 
--   참조받고 있는 부모테이블의 데이터를 
--   언제든지 자유롭게 삭제하는 것이 가능하다.
--   단, 부모 테이블의 데이터가 삭제될 경우...
--   이를 참조하는 **자식 테이블**의 데이터도 모~~~~~~~~~~두 함께 삭제된다.
-- *참조하고 있는 자식테이블에서 하나라도 있는 경우 삭제되지 않음

-- 부모 테이블
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
3	과장
*/

-- 자식 테이블
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	노은하	1
2	박가영	2
3	채다선	3
4	김수환	1
5	김다슬	1
6	오수경	
*/

-- 부모 테이블(TBL_JOBS)에서 과장 데이ㅣ터 삭제
SELECT *
FROM TBL_JOBS
WHERE JIKWI_ID=3;
--==>> 3	과장

DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=3;

-- 부모 테이블
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
*/

-- 자식 테이블
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	노은하	1
2	박가영	2
4	김수환	1
5	김다슬	1
6	오수경	
*/

SELECT *
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 1	사원

-- 부모테이블에서(TBL_JOBS)에서 사원 삭제
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 1 행 이(가) 삭제되었습니다.

-- 부모 테이블
SELECT *
FROM TBL_JOBS;
--==>>
/*
2	대리
*/

-- 자식 테이블
SELECT *
FROM TBL_EMP1;
/*
2	박가영	2
6	오수경	
*/

DROP TABLE TBL_EMP2;
--==>> Table TBL_EMP2이(가) 삭제되었습니다.

DROP TABLE TBL_EMP3;
--==>> Table TBL_EMP3이(가) 삭제되었습니다.

DROP TABLE TBL_JOBS;
--==>> 에러 발생(02449. 00000 -  "unique/primary keys in table referenced by foreign keys")

DROP TABLE TBL_EMP1;
--==>> Table TBL_EMP1이(가) 삭제되었습니다.

DROP TABLE TBL_JOBS;
--==>> Table TBL_JOBS이(가) 삭제되었습니다.

-- *FOREGIN에서 자식 테이블의 값이 삭제되더라도 제약조건은 살아있어서 부모테이블은 삭제되지 않는다.*



--■■■ NOT NULL(NN:CK:C) ■■■--

-- 1. 테이블에서 지저한 컬럼의 데이터가 NULL 인 상태를 갖지 못하도록 하는 제약조건.
-- *테이블레벨이 보통은 부여하지만, NOT NULL 제약조건의 경우 컬럼 레벨의 형식이 더 많아서 기본됨.*

-- 2. 형식 및 구조
--  (1) 컬럼 레벨의 형식
--   컬럼명 데이터타입 [CONSTRATINT CONSTRAINT명] NOT NULL

--  (2) 테이블 레벨의 형식
--   컬럼명 데이터 타입,
--   컬러명 데잍타입,
--   CONSTRAINT CONSTRAINT명 CHECK(컬럼명 IS NOT NULL)

-- 3. 기존에 생성되어 있는 테이블에 NOT NULL 제약조건을 추가할 경우
--   ADD 보다 MODIFY 절이 더 많이 사용된다.
--   ALTER TABLE 테이블명
--   MODIFY 컬럼명 데이터타입 NOT NULL;

-- 4. 기존 테이블에 데이터가 이미 들어있지 않은 컬럼(-> NULL인 상태)을
--    NOT NULL 제약조건을 갖도록 수정하는 경우에는 에러 발생한다.

--○ NOT NULL 지정 실습((1) 컬럼 레벨의 형식)
--   테이블 생성
CREATE TABLE TBL_TEST11
( COL1 NUMBER(5)    PRIMARY KEY
, COL2 VARCHAR2(30) NOT NULL
);
--==>> Table TBL_TEST11이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST11(COL1,COL2) VALUES(1,'TEST');
INSERT INTO TBL_TEST11(COL1,COL2) VALUES(2,'ABCD');
INSERT INTO TBL_TEST11(COL1,COL2) VALUES(3, NULL); --> 에러발생 (ORA-01400: cannot insert NULL into ("HR"."TBL_TEST11"."COL2"))
INSERT INTO TBL_TEST11(COL1) VALUES(4);            --> 에러발생 (ORA-01400: cannot insert NULL into ("HR"."TBL_TEST11"."COL2"))

-- 확인
SELECT *
FROM TBL_TEST11;
/*
1	TEST
2	ABCD
*/

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST11';
--==>>
/*
HR	SYS_C007133	TBL_TEST11	C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007134	TBL_TEST11	P	COL1		
*/

--○ NOT NULL 지정 실습((2) 테이블 레벨의 형식)
--   테이블 생성
CREATE TABLE TBL_TEST12
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST12_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST12_COL2_NN CHECK(COL2 IS NOT NULL)
);
--==>> Table TBL_TEST12이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST12';
--==>>
/*
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1		
*/

--○ NOT NULL 지정 실습((3) 테이블 생성 이후 제약조건 추가)
-- 테이블 생성
CREATE TABLE TBL_TEST13
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
);
--==>> Table BL_TEST13이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST13';
--==>> 조회 결과 없음

--  제약조건 추가
ALTER TABLE TBL_TEST13
ADD ( CONSTRAINT TEST13_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST13_COL2_NN CHECK(COL2 IS NOT NULL)
);
--==>> Table TBL_TEST13이(가) 변경되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST13';
--==>>
/*
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
*/

--※ NOT NULL 제약조건만 TBL_TEST3 테이블의 COL2 에 추가하는 경우
--   다음과 같은 방법을 사용하는 것도 가능하다.
ALTER TABLE TBL_TEST13
MODIFY COL2 NOT NULL;
--==>> Table TBL_TEST13이(가) 변경되었습니다.

-- 컬럼 레벨에서 NOT NULL 제약조건을 지정한 테이블(TBL_TEST11)
DESC TBL_TEST11;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30)
*/
-- *가장 많이쓰는 구문 DESC 에서 NOT NULL 확인

-- 테이블 레벨에서 NOT NULL 제약조건을 지정한 테이블(TBL_TEST12)
DESC TBL_TEST12;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2          VARCHAR2(30)
*/
-- *가장 많이쓰는 구문 DESC 에서 NOT NULL 미확인됨(VIEW로만 가능함)

-- 테이블 생성 이후 ADD를 통해 NOT NULL 제약조건을 추가하였으며
-- 여기에 더하여, MODIFY 절을 통해 NOT NULL 제약조건을 추가한 테이블
DESC TBL_TEST13;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/
-- * NOT NULL 확인가능*
SELECT *
FROM  VIEW_CONSTCHECK
WHERE TABLE_NAME IN ('TBL_TEST11', 'TBL_TEST12', 'TBL_TEST13');
--==>>
/*
--○ CK 지정 실습((1) 컬럼 레벨의 형식)
HR	SYS_C007133	TBL_TEST11	    C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007134	TBL_TEST11	    P	COL1		

--○ CK 지정 실습((2) 테이블 레벨의 형식)
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1		

--○ CK 지정 실습((3) 테이블 생성 이후 제약조건 추가)
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
HR	SYS_C007139	TBL_TEST13	    C	COL2	"COL2" IS NOT NULL	-> MODIFY절에서 구분 된 것
*/
-- *========================================================*
-- * 결론: NOT NULL에서는 컬럼 레벨의 형식으로 부여하는 것이  DESC로 널?(NOT NULL)을 확인할 수 있고
-- * 제약조건을 VIEW로 볼 때도 'SEARCH_CONDITION'에서 NULL을 확일 할 수있다.
-- *========================================================*

-- *컬럼레벨에서 이름을부여하면서 NOT NULL을 넣는게 바람직함

-- ■■■ DEFAULT 표현식 ■■■--

-- 1. ISERT 와 UPDATE 문에서
--    틀정 값이 아닌 기본 값을 입력하도록 한다.

-- 2. 형식 및 구조
--    컬럼명 데이터타입 DEFAULT 기본값

-- 3. INSERT 명령 시 해당 컬럼에 입력된 값을 할당 하지 않거나
--    DEFAULT 키워드를 활용하여 기본으로 설정된 값을 입력하도록 한다.

-- 4. DEFAULT 키워드와 다른 제약(NOT NULL 등) 표기가 함께 사용되어야하는 경우
--    DFAULT 키워드를 먼저 표기(작성)할 것을 권장한다.

--○ DEFAULT 표현식 적용 실습
-- 테이블 생성
CREATE TABLE TBL_BBS                            -- 게시판 테이블 생성
( SID       NUMBER          PRIMARY KEY         -- 게시물 번호-> 식별자 -> 자동 증가
, NAME      VARCHAR2(20)                        -- 게시물 작성자
, CONTENTS  VARCHAR2(200)                       -- 게시물 내용
, WRITEDAY  DATE            DEFAULT SYSDATE     -- 게시물 작성일
, COUNTS    NUMBER          DEFAULT 0           -- 게시물 조회수
, COMMENTS  NUMBER          DEFAULT 0           -- 게시물 댓글 갯수
);
--==>> Table TBL_BBS이(가) 생성되었습니다.

-- *입력항목에서 제외하면, 넘어오지 못하는 상태가 줄어들지만
--※ SID 를 자동 증가 값으로 운영하려면 시퀀스 객체가 필요하다.
--   자동으로 입력되는 컬럼은 사용자들의 입력 항목에서 제외시킬 수 있다.

-- 사퀀스 생성
CREATE SEQUENCE SEQ_BBS
NOCACHE;
--==>> Sequence SEQ_BBS이(가) 생성되었습니다.

-- 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

-- 게시물 작성
INSERT INTO TBL_BBS(SID, NAME, CONTENTS, WRITEDAY, COUNTS, COMMENTS)
VALUES(SEQ_BBS.NEXTVAL, '김다슬', '오라클 DEFAULT 표현식을 실습중입니다.'
    , TO_DATE('2023-10-31 14:39:10', 'YYYY-MM-DD HH24:MI:SS'),0,0);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BBS(SID, NAME, CONTENTS, WRITEDAY, COUNTS, COMMENTS)
VALUES(SEQ_BBS.NEXTVAL, '김다슬', '오라클 DEFAULT 표현식을 실습중입니다.', SYSDATE,0,0);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BBS(SID, NAME, CONTENTS, WRITEDAY, COUNTS, COMMENTS)
VALUES(SEQ_BBS.NEXTVAL, '노은하', '계속 실습중입니다.', DEFAULT,0,0);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BBS(SID, NAME, CONTENTS, WRITEDAY, COUNTS, COMMENTS)
VALUES(SEQ_BBS.NEXTVAL, '문정환', '열심히 실습중입니다.', DEFAULT, DEFAULT, DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BBS(SID, NAME, CONTENTS)
VALUES(SEQ_BBS.NEXTVAL, '이윤수', '무진장 실습중입니다.');
--==>> 1 행 이(가) 삽입되었습니다.

-- 확인
SELECT *
FROM TBL_BBS;

--○ DEFAULT 표현식 조회(확인)
SELECT *
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME='TBL_BBS';
--==>>
/*
TABLE_NAME	COLUMN_NAME	DATA_TYPE		DATA_LENGTH	NULLABLE	COLUMN_ID	DEFAULT_LENGTH	DATA_DEFAULT	
TBL_BBS	    SID	        NUMBER			22			N	        1											
TBL_BBS	    NAME	    VARCHAR2		20			Y	        2											
TBL_BBS	    CONTENTS	VARCHAR2		200			Y	        3											
TBL_BBS	    WRITEDAY	DATE			7			Y	        4	        35	            "SYSDATE     -- 게시물 작성일" 
TBL_BBS	    COUNTS	    NUMBER			22			Y	        5	        35	            "0           -- 게시물 조회수"
TBL_BBS	    COMMENTS	NUMBER			22			Y	        6	        39	            "0           -- 게시물 댓글 갯수"
*/

--○ 테이블 생성 이후 DEFAULT 표현식 추가 / 변경
ALTER TABLE 테이블명
MODIFY 컬럼명 [자료형] DEFAULT 기본값;

-- *DEFAULT 표현식은 제약조건의 범주안에 들어가지 않음*  
-- *DEFAULT는 제거하는 표현식이 없음. 따라서, NULL로 표현*  

--○ 기존의 DEFAULT 표현식 제거
ALTER TABLE 테이블명
MODIFY 컬럼명 [자료형] DEFAULT NULL;


COMMIT;
--==>> 커밋 완료.

SELECT * FROM USER_SEQUENCES;


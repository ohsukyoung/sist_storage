SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_상품;
/*
상품코드	상품명	소비자가격	재고수량
H001	    바밤바	    600	    30
H002	    죠스바	    500	    40
H003	    보석바	    500	    10
H004	    누가바	    600	    70
C001	    빵빠레	    1600	20
C002	    월드콘	    1500	20
C003	    메타콘	    1500	20
C004	    구구콘	    1600	20
*/
SELECT *
FROM TBL_입고;
/*
입고번호	상품코드	입고일자	입고수량	입고단가
1	        H001	    2023-11-06	    30	    500
2	        H002	    2023-11-06	    20	    400
3	        H001	    2023-11-06	    50	    500
4	        H002	    2023-11-06	    30	    400
5	        H003	    2023-11-06	    35	    400
6	        H004	    2023-11-06	    70	    500
7	        C001	    2023-11-06	    26	    1400
8	        C001	    2023-11-06	    24	    1400
9	        C001	    2023-11-06	    20	    1500
10	        C002	    2023-11-06	    20	    1000
11	        C003	    2023-11-06	    20	    1000
12	        C004	    2023-11-06	    20	    1000
*/


SELECT *
FROM TBL_출고;
/*
출고번호	상품코드	출고일자	출고수량	출고단가
1	        H001	2023-11-06	    20	    600
2	        C001	2023-11-06	    20	    1500
3	        C001	2023-11-06	    20	    1500
4	        C001	2023-11-06	    10	    1500
5	        H001	2023-11-06	    10	    500
6	        H001	2023-11-06	    10	    500
7	        H001	2023-11-06	    10	    500
8	        H002	2023-11-06	    10	    500
9	        H003	2023-11-06	    25	    500
*/

/* 1-1) 문제 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT *
FROM TBL_상품;
/*         :
H001	바밤바	600	30
*/
SELECT *
FROM TBL_입고;
/*              :
3	H001	2023-11-06	50	500
*/

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 ->프로시저 호출
EXEC PRC_입고_UPDATE(3,10);
--==>> 에러 발생
--      (ORA-20002: 재고부족~!!!)

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 ->프로시저 호출
EXEC PRC_입고_UPDATE(3,20);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 이후 테이블 조회(확인)
SELECT *
FROM TBL_입고;
--==>>
/*                :
3	H001	2023-11-06	20	500
*/

SELECT *
FROM TBL_상품;
--==>>
/*                :
H001	바밤바	600	0
*/

/* 1-2) 문제 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT *
FROM TBL_상품;
/*         :
H001	바밤바	600	0
*/
SELECT *
FROM TBL_입고;
/*              :
3	H001	2023-11-06	20	500
*/

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 ->프로시저 호출
EXEC PRC_입고_DELETE(3);
--==>> 에러 발생
--      (ORA-20002: 재고부족~!!!)

--○ 삭제를 위한 데이터 추가 입력
EXEC PRC_입고_INSERT('H001', 50, 500); 
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_상품;
/*         :
H001	바밤바	600	50
*/
SELECT *
FROM TBL_입고;
/*              :
13	H001	2023-11-07	50	500
*/

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 ->프로시저 호출
EXEC PRC_입고_DELETE(13);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 이후 테이블 조회(확인)
SELECT *
FROM TBL_입고;
--==>> 13 없음

SELECT *
FROM TBL_상품;
--==>>
/*                :
H001	바밤바	600	0
*/

/* 1-3) 문제 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ 삭제를 위한 데이터 추가 입력
EXEC PRC_출고_INSERT('H002', 10, 500); 

SELECT *
FROM TBL_상품;
/*         :
H002	죠스바	500	30
*/
SELECT *
FROM TBL_출고;
/*              :
10	H002	2023-11-07	10	500
*/

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 ->프로시저 호출
EXEC PRC_출고_DELETE(10);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_상품;
/*         :
H002	죠스바	500	40
*/
SELECT *
FROM TBL_출고;
--==>> 10번 없음


--------------------------------------------------------------------------------
-- ■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■--
-- ※ DML 작업에 대한 이벤트 기록

--○ 실습을 위한 준비 -> 테이블 생성(TBL_TES)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.

--○ 실습을 위한 준비 -> 테이블 생성(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO  VARCHAR2(200)
, INJA  DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG이(가) 생성되었습니다.

--○ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 확인
SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음

SELECT *
FROM TBL_EVENTLOG;
--==>> 조회 결과 없음

--○ 생성한 TRIGGER 작동여부 확인
--  -> TBL_TEST1 테이블을 대상으로 INSERT, UPDATE, DELETE 수행

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(1, '이윤수', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(2, '강혜성', '010-2222-2222');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(3, '문정환', '010-3333-3333');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET NAME='박가영', TEL='010-4444-4444'
WHERE ID=1;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_TEST1;
/*
1	박가영	010-4444-4444
2	강혜성	010-2222-2222
3	문정환	010-3333-3333
*/

DELETE
FROM TBL_TEST1
WHERE ID IN (2,3);
--==>> 2개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 1	박가영	010-4444-4444

DELETE
FROM TBL_TEST1
WHERE ID=1;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음

SELECT *
FROM TBL_EVENTLOG;
--==>>
/*
INSERT 쿼리가 실행되었습니다.	2023-11-07 16:14:33
INSERT 쿼리가 실행되었습니다.	2023-11-07 16:15:19
INSERT 쿼리가 실행되었습니다.	2023-11-07 16:17:49
UPDATE 쿼리가 실행되었습니다.	2023-11-07 16:18:59
DELETE 쿼리가 실행되었습니다.	2023-11-07 16:19:36
DELETE 쿼리가 실행되었습니다.	2023-11-07 16:20:17
*/
-- *쓰는 사람 입장에서는 별도의 함수나 프로시저를 쓴다는 개념을 모르고, 미리 걸어둔 조건에 의해 돌아가는 것*  


-- ■■■ BEFORE STATEMENT TRIGGER 상황 실습 ■■■--
-- ※ DML 작업 수행 전에 작업에 대한 가능여부 확인  
-- *로컬시간 6시 이후로 바꾸고 실행*  
SELECT SYSDATE
FROM DUAL;
--==>> 2023-11-07 18:49:00

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(1,'김다슬','010-1111-1111');
--==>> 에러 발생(ORA-20003: 작업 시간은 09:00 ~ 18:00 까지만 가능합니다.)

-- *로컬시간 6시 이전으로 바꾸고 실행*  
SELECT SYSDATE
FROM DUAL;
--==>> 2023-11-07 16:49:55

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(1,'김다슬','010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;

UPDATE TBL_TEST1
SET NAME='오수경', TEL='010-2222-2222'
WHERE ID=1;
--==>> 1 행 이(가) 업데이트되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(2,'김경태','010-3333-3333');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 
/*
2	김경태	010-3333-3333
1	오수경	010-2222-2222
*/

COMMIT;

-- *로컬시간 오전 9시 이전으로 바꾸고 실행*  
UPDATE TBL_TEST1
SET NAME='박범구', TEL='010-3333-3333'
WHERE ID=1;
--==>> 에러 발생 (ORA-20003: 작업 시간은 09:00 ~ 18:00 까지만 가능합니다.)

DELETE
FROM TBL_TEST1
WHERE ID=2;
--==>> 에러 발생 (ORA-20003: 작업 시간은 09:00 ~ 18:00 까지만 가능합니다.)


-- ■■■ BEFORE ROW TRIGGER 상황 실습 ■■■--
-- ※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델

--○ 실습 환경 구성을 위한 테이블 생성 -> TBL_TEST2
CREATE TABLE TBL_TEST2
( CODE NUMBER
, NAME VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2이(가) 생성되었습니다.

--○ 실습 환경 구성을 위한 테이블 생성 -> TBL_TEST3
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
            REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3이(가) 생성되었습니다.

--○ 실습 관련 데이터 입력
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1,'텔레비전');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2,'냉장고');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3,'세탁기');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(4,'건조기');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_TEST2;
--==>> 
/*
1	텔레비전
2	냉장고
3	세탁기
4	건조기
*/

COMMIT;
--==>> 커밋 완료.

--○ 실습 관련 데이터 입력
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1,1,30); -- 텔레비전
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2,1,50); -- 텔레비전
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3,1,60); -- 텔레비전
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4,2,20); -- 냉장고
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5,2,20); -- 냉장고
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6,3,40); -- 세탁기
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7,1,30); -- 텔레비전
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8,4,30); -- 건조기
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9,3,10); -- 세탁기
--==>> 1 행 이(가) 삽입되었습니다. * 9

SELECT *
FROM TBL_TEST3;
/*
1	1	30
2	1	50
3	1	60
4	2	20
5	2	20
6	3	40
7	1	30
8	4	30
9	3	10
*/

COMMIT;
--==>> 커밋 완료.

--○ 부모 테이블(TBL_TEST2)의 데이터 삭제 시도
SELECT *
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1	텔레비전

DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 에러 발생(ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found)
-- *참조하고 있는 자식 레코드가 있어서 삭제할수 없음*  

--○ TRIGGER 생성 이후 확인
DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST3;
--==>>
/*
4	2	20
5	2	20
6	3	40
8	4	30
9	3	10
*/
-- *부모테이블의 1을참조하고있던 데이터 모두 삭제됨*  

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST3;
--==>>
/*
6	3	40
8	4	30
9	3	10
*/


-- ■■■ AFTER ROW TRIGGER 상황 실습 ■■■--
-- ※ 참조 테이블 관련 트랜잭션 처리 

-- ※ 실습을 위한 준비
UPDATE TBL_상품
SET 재고수량 = 0;
--==>> 17개 행 이(가) 업데이트되었습니다.

TRUNCATE TABLE TBL_입고;
--==>> Table TBL_입고이(가) 잘렸습니다.

TRUNCATE TABLE TBL_출고;
--==>> Table TBL_출고이(가) 잘렸습니다.

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	0
H002	죠스바	500	0
H003	보석바	500	0
H004	누가바	600	0
H005	쌍쌍바	700	0
H006	수박바	500	0
H007	알껌바	500	0
C001	빵빠레	1600	0
C002	월드콘	1500	0
C003	메타콘	1500	0
C004	구구콘	1600	0
C005	슈퍼콘	1700	0
E001	빵또아	2600	0
E002	투게더	2500	0
E003	팥빙수	2500	0
E004	셀렉션	2600	0
E005	설레임	2700	0
*/

ROLLBACK;
-- *ROLLBACK 해도 TRUNCATE는 되돌아가지 않음*  
-- *TRUNCATE: 테이블의 가위로 오려냄*  
-- *잘라낸 것은 ROLLBACK 되지 않음(오토커밋) -> 잘 판단해서 쓰기*  

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	0
H002	죠스바	500	0
H003	보석바	500	0
H004	누가바	600	0
H005	쌍쌍바	700	0
H006	수박바	500	0
H007	알껌바	500	0
C001	빵빠레	1600	0
C002	월드콘	1500	0
C003	메타콘	1500	0
C004	구구콘	1600	0
C005	슈퍼콘	1700	0
E001	빵또아	2600	0
E002	투게더	2500	0
E003	팥빙수	2500	0
E004	셀렉션	2600	0
E005	설레임	2700	0
*/

--○ TRIGGER(트리거) 생성 이후 실습 테스트
INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(1, 'H001', SYSDATE, 40, 1000);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_입고;
--==>> 
/*
1	H001	2023-11-08 09:11:22	40	1000
*/

COMMIT;

SELECT *
FROM TBL_상품;
--==>>
/*         :
H001	바밤바	600	40
*/

INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(2, 'H001',SYSDATE, 20, 1000);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_상품;
--==>>
/*         :
H001	바밤바	600	60
*/

COMMIT;
--==>> 커밋 완료.



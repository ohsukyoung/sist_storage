SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;

PURGE RECYCLEBIN;

DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.

--○ 실습 테이블 생성
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.

--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1,'홍길동','010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_MEMBER;
--==>> 1	홍길동	010-1111-1111

--○ 커밋 CHECK~!!!
COMMIT;
--==>> 커밋 완료.

/*
** JDBC는 커밋이나 롤백 안하면 반드시 문제 생김**
*/

--○ 자바에서 Test003.java 실행 후 다시 확인
SELECT *
FROM TBL_MEMBER;
/*
2	오수경	010-2222-2222
1	홍길동	010-1111-1111
*/



SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
/*
1	이윤수	010-1111-1111
2	임하성	010-3333-3333
3	김민지	010-4444-4444
4	문정환	010-5555-5555
5	정한울	010-6666-6666
6	정한울	010-6666-6666
7	이윤수	010-7777-7777
*/

TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 잘렸습니다.

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>> 조회결과 없음

DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ이(가) 삭제되었습니다.


--○ CallableStatement 실습을 위한 프로시저 작성
--  프로시저 명   : PRC_MEMBERINSERT
--  프로시저 기능 : TBL_MEMBER 테이블에 데이터를 입력하는 프로시저

CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT
( VNAME    IN TBL_MEMBER.NAME%TYPE
, VTEL     IN TBL_MEMBER.TEL%TYPE
)
IS
    VSID      TBL_MEMBER.SID%TYPE;
BEGIN
    
    SELECT NVL(MAX(SID),0)+1 INTO VSID
    FROM TBL_MEMBER;

    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
    VALUES(VSID, VNAME, VTEL);
    
    COMMIT;
END;

SELECT *
FROM TBL_MEMBER;
--==>>
/*
3	김다슬	010-1111-1111
4	오수경	010-2222-2222
5	김경태	010-3333-3333
6	박범구	010-4444-4444
*/

DELETE
FROM TBL_MEMBER;


--○ CallableStatement 실습을 위한 프로시저 생성
-- 프로시저 명   : PRC_MEMBERSELECT
-- 프로시저 기능 : TBL_MEMBER 테이블의 데이터를 읽어오는 프로시저
--  ※ <SYS_REFCURSOR> 자료형을 이용하여 커서 다루기

CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT
( VRESULT   OUT SYS_REFCURSOR

)
IS
    -- 주요 변수 선언
    -- -> 커서 정의 -> 출력용 매개변수로 대체
BEGIN
    OPEN VRESULT FOR
        SELECT SID, NAME, TEL
        FROM TBL_MEMBER
        ORDER BY SID;
        
--    CLOSE VRESULT;
    /* 참조하는 형태의 커서를 사용할 때는 커서를 닫지 않는다!
        오라클이 아닌, 자바에서 사용할 것이기 때문에
    */
    
--    COMMIT;
END;
--==>> Procedure PRC_MEMBERSELECT이(가) 컴파일되었습니다.


COMMIT;
--==>> 커밋 완료.


package com.test;

import java.sql.Connection;

public class BoardDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 생성자 정의
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 게시물 번호 최대값 얻어내기
	//getMaxNum
//SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD
	
	// 게시물 작성 → 데이터 입력
	//insertData
//INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '노은하','1234','neh@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE)
	
	// DB레코드 갯수
	//getDataCount
//SELECT COUNT(*) AS COUNT FROM TBL_BOARD
	
	//(추가) 검색 기능 추가
	
	// 특정 영역(시작~끝) 게시물 목록 가져오기
	//getLists
	/*
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM>=1 AND RNUM<=10;
	 */
	
	//(추가) 검색 기능 추가
//AND NAME LIKE '%윤수%'
	
	// 게시물 조회 횟수 증가
	//updateHitCount
//UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT+1 WHERE NUM=1
	
	// 특정 게시물 내용 읽어오기
	//getReadData
//SELECT NUM, NAME, PWD, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=1
	
	// 게시물 삭제
	//deldeteData
//DELETE FROM TBL_BOARD WHERE NUM=1
	
	// 게시물 수정
	//updateData
//UPDATE TBL_BOARD SET NAME='박가영', PWD='123456', EMAIL='pky@test.com', SUBJECT='수정제목', CONTENT='수정내용' WHERE NUM=1
	
	// 특정 게시물의 이전 게시물 번호 얻어내기(이전 게시물 존재하지 않을 경우 -1)
	//getBeforeNum
//SELECT NVL(MIN(NUM),-1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>50
	
	// 특정 게시물의 이후 게시물 번호 얻어내기(이후 게시물 존재하지 않을 경우 -1)
	//getNextNum
//SELECT NVL(MAX(NUM),-1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<50
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

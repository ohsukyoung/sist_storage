/* ==================================================
	#05 IGradeDAO.java
	- 인터페이스
      학생 데이터 액션 처리 메소드 선언
=====================================================*/
package com.test.mybatis;

import java.util.ArrayList;

public interface IGradeDAO
{
	public ArrayList<StudentDTO> list();	//-- 리스트조회
	public int count();						//-- 총 개수
	public int add(GradeDTO grade);		//-- 성적 데이터 추가
	public int remove(int sid);				//-- 성적 데이터 삭제
	public GradeDTO search(int sid);		//-- 성적 데이터 검색
	public int update(GradeDTO grade);//-- 성적 데이터 업데이트
}

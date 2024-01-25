/* ==================================================
	#04 IStudentDAO.java 
	- 인터페이스
      학생 데이터 액션 처리 메소드 선언
=====================================================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IStudentDAO
{
	public ArrayList<StudentDTO> list();	//-- 리스트조회
	public int count();						//-- 총 개수
	public int add(StudentDTO student);		//-- 학생 데이터 추가
	public int remove(int sid);				//-- 학생 데이터 삭제
	public StudentDTO search(int sid);		//-- 학생 데이터 검색
	public int update(StudentDTO student);//-- 학생 데이터 업데이트
	public int maxId();						//-- 학생 번호 최대값
}

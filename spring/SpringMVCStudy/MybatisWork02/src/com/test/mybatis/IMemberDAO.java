/* ====================================
	IMemberDAO.java
	- 인터페이스
======================================= */

package com.test.mybatis;

import java.util.ArrayList;

public interface IMemberDAO
{
	public ArrayList<MemberDTO> list();
	public int count();
	public int add(MemberDTO m);
	// executeUpdate로 행의 갯수 반환으로 int
	
	/* 삭제기능 처리 ② */
	public int remove(int mid);
	
}

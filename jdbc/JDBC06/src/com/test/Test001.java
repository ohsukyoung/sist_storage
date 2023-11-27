/* ==========================
	Test001.java
	- 쿼리문 실습
============================= */
//Type B를 위한 실습
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import com.util.DBConn;

public class Test001
{
	public static void main(String[] args)
	{
		try
		{
			Connection conn = DBConn.getConnection();
			
			if(conn != null)
			{
				System.out.println("데이터베이스 연결 성공");
				
				try
				{
					// Type A ---------------------------------------------------------------------
					
					// Type A - Statement
					// **실행을 안해볼 것. 안해보더라도 작업객체를 인지할 수 있어야 함**
					/*
					Statement stmt = conn.createStatement();
					
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(MEMBERSEQ.NEXTVAL, '문정환', '010-5555-5555')";
					
					int result = stmt.executeUpdate(sql);
					
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					
					stmt.close();
					DBConn.close();
					*/
					
				
					// Type A - preparentStatemet
					// **쿼리문이 먼저 준비되어 있어야 함**
					/*
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(MEMBERSEQ.NEXTVAL, '문정환', '010-5555-5555')";
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					// executeUpdate() <- 매개변수 없음
					int result = pstmt.executeUpdate();
					
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					
					pstmt.close();
					DBConn.close();
					*/
					
					
					// Type B ---------------------------------------------------------------------
					
					// Type B - Statement
					/*
					Statement stmt = conn.createStatement();
					
					String name = "문정환";
					String tel = "010-5555-5555";
					
					String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", name, tel);
					
					int result = stmt.executeUpdate(sql);
					
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					
					stmt.close();
					DBConn.close();
					*/
					
					
					// Type B - preparentStatemet
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";			
							// **『?』 로 뚫어놓는 다는 개념으로 이해하면 쉬움**
							//+ " VALUES(MEMBERSEQ.NEXTVAL, '?', '?')";		--(X)
							// **자료형(문자, 숫자, 실수등)에 상관없이 『?』 로만 작성가능. 『'?'』 불가!**
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					// IN 매개변수 넘겨주기
					pstmt.setString(1,"정한울");
					pstmt.setString(2,"010-6666-6666");
					
					int result = pstmt.executeUpdate();
					
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					
					pstmt.close();
					DBConn.close();
					
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}

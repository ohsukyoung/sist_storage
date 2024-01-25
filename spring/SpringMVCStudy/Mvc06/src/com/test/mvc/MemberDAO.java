/*=========================
	MemberDAO.java
==========================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결
	public void connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터베이스 연결 해제
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 멤버 리스트 조회
	public ArrayList<MemberDTO> list() throws SQLException
	{
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		String sql = "SELECT ID, NAME, TEL, EMAIL FROM TBL_MEMBERLIST";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO member = new MemberDTO();
			member.setId(rs.getString("ID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			member.setEmail(rs.getString("EMAIL"));
			
			memberList.add(member);
		}
		
		rs.close();
		pstmt.close();
		
		return memberList;
	}
	
	// 멤버 데이터 입력
	public int insertQuery(MemberDTO member) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)"
				+ " VALUES(?, CRYPTPACK.ENCRYPT(?, ?), ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPw());
		pstmt.setString(3, member.getPw());
		pstmt.setString(4, member.getName());
		pstmt.setString(5, member.getTel());
		pstmt.setString(6, member.getEmail());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}

	
}

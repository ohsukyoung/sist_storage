/* ==================================================
	OracleDAO.java
	- DAO 계층 구성
	- MssqlDAO 와 설정만 다르게 연결하여 실습 진행
		→ MSSQL 서버가 구축되어 있지 않기 때문에...
	- IDAO 인터페이스를 구현하는 클래스 ++++++++++++++++++++
=====================================================*/

package com.test.spr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OracleDAO implements IDAO
{
	@Override
	public List<MemberDTO> list()
	{
		List<MemberDTO> result = new ArrayList<MemberDTO>();
		
		
		// 결과 집합을 컬렉션에 추가
		try {
			// 데이터베이스 연결
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@211.238.142.167:1521:xe","scott","tiger");
					// 211.238.142.167 - 내 번호
			
			// 쿼리문 준비 및 실행
			String sql = "SELECT ID, NAME, TEL, EMAIL FROM TBL_MEMBERLIST";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("ID"));
				dto.setName(rs.getString("NAME"));
				dto.setTel(rs.getString("TEL"));
				dto.setEmail(rs.getString("EMAIL"));
				
				result.add(dto);
			}
			rs.close();
			stmt.close();
			
			// 데이터베이스 연결 종료
			if(!conn.isClosed())
				conn.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
				
		return result;
	}
}

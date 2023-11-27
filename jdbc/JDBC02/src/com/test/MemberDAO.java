/*======================
 	MemberDAO.java
=======================*/

// 데이터베이스에 액세스 하는 기능
// → DBConn 활용(전담 계층)

// 데이터를 입력하는 기능 → insert

// 인원 수 확인하는 기능
// 즉, 대상 테이블(TBL_MEMBER)의 레코드 카운팅 기능 → select

// 전체 리스트를 조회하는 기능
// 즉, 대상 테이블(TBL_MEMBER)의 데이터를 조회하는 기능 → select

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// 주요 속성 구성 -> DB 연결 객체
	private Connection conn;
	// ** getter, setter -> 

	/*
	 * public Connection getConn() { return conn; }
	 * 
	 * public void setConn(Connection conn) { this.conn = conn; }
	 */
	
	// 생성자 정의(사용자 정의 생성자)
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	//  메소드 정의 -> 데이터를 입력하는 기능
	public int add(MemberDTO dto) throws SQLException
	{
		// 반환할 결과값을 담아낼 변수(적용된 행의 갯수)
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비(insert)
		String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL) "
				+ "VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", dto.getName(), dto.getTel());
//		INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '이윤수', '010-1111-1111')

		// 작업 객체를 활용하여 쿼리문 실행(전달)
		result = stmt.executeUpdate(sql);
		
		// 사용한 리소스 반납
		stmt.close();
		
		return result;
	}
	
	// 메소드 정의 -> 전체 인원 수 확인하는 기능
	public int count() throws SQLException
	{
		// 결과값으로 반환하게 될 변수 선언 및 초기화
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비(select)
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
//		SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
		
		// 생성된 작업 객체를 활용하여 쿼리문 실행
		// -> select -> executeQuery() -> ResultSet 반환 
		//		-> 일반적으로 반복문 구성을 통한 ResultSet 처리
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리 -> 반복문 구성 -> 결과값 수신
		while (rs.next())	
		// if(rs.next())	//** 반복문아니라 조건으로 해도 상관없음(이 구문 안에서는! 한번만 돌기 때문에)
		{
			result = rs.getInt("COUNT");
			//** COUNT 라고 별칭을 지었고, 그래서 그 값을 넣은것
//			result = rs.getInt("COUNT(*)");	//** 주의! count(*)로 쓸때는 별칭을 부여해서 써야함~~!!!
			
			/*
			 * SELECT SID, NAME, TEL FROM TBL_MEMBER
			 * 
			 * String sid = rs.getString(1);
			 * String name = rs.getString(2);
			 * -->> ORDER BY 의 번호처럼 번호사용가능(단, 1부터 시작됨 유의)
			 * 
			 * 처럼
			 * 
			 * SELECT COUNT(*) TBL_MEMBER
			 * 
			 * String count = rs.getString(1)로는 가능!
			 * String count = rs.getString("컬럼명")로는 가능하지만, COUNT(*)은 컬럼명으로 사용 불가!
			 * 
			*/
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;
	}
	
	// 메소드 정의 -> 전체 리스트 조회하는 기능
//	public MemberDTO 들.. lists()
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		// 결과값을 반환하게 될 변수 선언 및 초기화
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비(select)
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
//		SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
		
		// 생성된 작업 객체르 활용하여 쿼리문 실행
		//	-> select -> executeQuery() -> ResultSet 반환
		//		-> 일반적으로 반복문 구성을 통한 ResultSet 처리
		ResultSet rs = stmt.executeQuery(sql);
		
		// check~!!!
		// ResultSet 처리
		int i = 0;
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
//			int sid = rs.getInt("SID");						// 1
//			int sid = String.valueOf(rs.getInt("SID"));		// 1
//			int sid = Integer.parseInt(rs.getInt("SID"));	// 1
//			String sid = rs.getString("SID");				// "1"
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);			
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;
	}
	
	// 메소드 정의 -> 데이터베이스 연결 종료
	public void close() throws SQLException
	{
//		주의 check~!!!
//		conn.close();
//		* 주의사항!! 위처럼 쓰면 Connection 객체가 가지고 있는 conn
		DBConn.close();
	}
}






























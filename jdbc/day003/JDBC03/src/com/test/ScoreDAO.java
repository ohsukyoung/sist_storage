package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	// 주요 속성 구성 -> DB 연결 객체
	private Connection conn;
	
	// 생성자 정의 (사용자 정의 생성자)
	public ScoreDAO()
	{
		conn = DBConn.getConnection();
	}
	
	// 메소드 정의 -> 값 입력
//	INSERT INTO TBL_SCORE VALUES(SCOREEQ.NEXTVAL, '강혜성', 80, 75, 60);
	public int add(ScoreDTO sto) throws SQLException
	{	// 반환할 결과값 담아낼 변수
		int result = 0;
	
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql= String.format("INSERT INTO TBL_SCORE VALUES(SCORESEQ.NEXTVAL"
				+ ", '%s', %d, %d, %d)", sto.getName(), sto.getKor(), sto.getEng(), sto.getMat());
		
		// 작업 객체를 이용하여 쿼리문 실행
		result = stmt.executeUpdate(sql);
		
		// 리소스 반납
		stmt.close();
		
		return result;
	}

	
	// 메소드 정의 -> 총점, 평균
	public int count() throws SQLException
	{	// 반환할 결과값 담아낼 변수
		int result = 0;
	
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql= String.format("SELECT COUNT(*) AS COUNT FROM TBL_SCORE");
		
		ResultSet rs = stmt.executeQuery(sql);

		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		// 작업 객체를 이용하여 쿼리문 실행
		
		// 리소스 반납
		stmt.close();
	
		return result;
	}
	
	
	// 메소드 정의 -> 출력
//	SELECT SID, NAME, KOR, ENG, MAT, KOR+ENG+MAT AS SUM, TRUNC((KOR+ENG+MAT)/3,1) AS AVG FROM TBL_SCORE;
	public ArrayList<ScoreDTO> lists() throws SQLException
	{	// 반환할 결과값 담아낼 변수
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql= String.format("SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE ORDER BY 1");
//		String sql= String.format("SELECT SID, NAME, KOR, ENG, MAT, KOR+ENG+MAT AS SUM, TRUNC((KOR+ENG+MAT)/3,2) AS AVG FROM TBL_SCORE ORDER BY 1");
		
		ResultSet rs = stmt.executeQuery(sql);
		
		// 작업 객체를 이용하여 쿼리문 실행
		while(rs.next())
		{
			ScoreDTO sto = new ScoreDTO();
			
			sto.setSid(rs.getInt("SID"));
			sto.setName(rs.getString("NAME"));
			sto.setKor(rs.getInt("KOR"));
			sto.setEng(rs.getInt("ENG"));
			sto.setMat(rs.getInt("MAT"));
			
			result.add(sto);
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 메소드 정의 -> 데이터베이스 연결 종료
	public void close()
	{
		DBConn.close();
	}
}

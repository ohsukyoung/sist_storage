/*======================
	Test003.java
=======================*/

package com.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.util.DBConn;

public class Test003
{
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		// 연결 객체 생성(구성)
		Connection conn = DBConn.getConnection();
		
		if(conn == null)
		{
			System.out.println("데이터베이스 연결 실패~!!!");
			System.exit(0);
		}
		
		// ** if 나 else로 하지 않은 이유: 실패일 때만 메세지 출력하고, 성공은 잠시 테스트.
		//System.out.println("데이터베이스 연결 성공~!!!");
		
		try
		{
			// 작업 객체 구성(작업을 수행하기 위한 준비)
			/* ** 연결선로에 파라낵바구니 매달기 ** */
			Statement stmt = conn.createStatement();
			
			//※ 데이터 입력 쿼리 실행 과정
			//		한 번 실행하면 다시 실행하지 못하는 상황이다.
			//		기본 키 제약조건이 설정되어 있으므로
			//		동일한 키 값이 중복될 수 없기 때문이다.
			
			// 쿼리문 준비
			String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(2,'오수경','010-2222-2222')";
			//-- 주의1. 쿼리문 끝에 <;> 붙이지 않는다.
			//-- 주의2. 자바에서 실행한 DML 구문은 내부적으로 자동 COMMIT 된다.(오토커밋)
			//-- 주의3. 오라클에서 트랜잭션 처리가 끝나지 않은 상태면 데이터 액션 처리가 이루어지지 않는다.
			
			// stmt.executeUpdate();
			// stmt.executeQuery();
			
			// 쿼리문 전달(실행)
			int result = stmt.executeUpdate(sql);
			//-- 적용된 행의 갯수 반환
			
			if (result > 0)
			{
				System.out.println("데이터 입력 성공~!!!");
			}else {
				System.out.println("입력 실패~ ㅠㅡㅠ");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		DBConn.close();
		//-- 리소스 반납(연결 종료)
	}
}

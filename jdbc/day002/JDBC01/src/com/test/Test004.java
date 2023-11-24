/*======================
 	Test004.java
=======================*/

// 실행 예)
// 번호를 입력하세요(-1 종료) : 3
// 이름을 입력하세요 : 박나영
// 전화번호를 입력하세요 : 010-3333-3333
// >> 데이터베이스 연결 성공~!!!
// >> 회원 정보가 입력되었습니다.

// 번호를 입력하세요(-1 종료) : 4
// 이름을 입력하세요 : 정현욱
// 전화번호를 입력하세요 : 010-4444-4444
// >> 데이터베이스 연결 성공~!!!
// >> 회원 정보가 입력되었습니다.

// 번호를 입력하세요(-1 종료) : 5
// 이름을 입력하세요 : 김민지
// 전화번호를 입력하세요 : 010-5555-5555
// >> 데이터베이스 연결 성공~!!!
// >> 회원 정보가 입력되었습니다.

// 번호를 입력하세요(-1 종료) : -1
// >> 데이터베이스 연결 닫힘~!!!

package com.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import com.util.DBConn;

public class Test004
{
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		
		Scanner sc = new Scanner(System.in);
		
		Connection conn = DBConn.getConnection();
		
		do
		{
			System.out.print("번호를 입력하세요(-1 종료) : ");
			String sid = sc.next();
			
			// 반복문의 조건을 무너뜨리는 코드 구성
			if(sid.equals("-1"))
				break;
			
			System.out.print("이름을 입력하세요 : ");
			String name = sc.next();
			
			System.out.print("전화번호를 입력하세요 : ");
			String tel = sc.next();
			
			if (conn != null)
			{
				System.out.println(">> 데이터베이스 연결 성공~!!!");
				
				try
				{
					// 작업 객체 준비
					Statement stmt = conn.createStatement();
					//-- tip) 마우스 올렸을 때 동그라미에 A 있으면 abstract(추상)메소드, 아무것도 없으면 일반 메소드, 빗금이 있으면 사용을 충분히 고려해보고 쓰라는 것
					
					
					// 쿼리문 준비
					//String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(" + sid + ",'" + name + "', '" + tel + "')";
					//String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(①, '②', '③')", sid, name, tel);
					String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(%s, '%s', '%s')", sid, name, tel);
					//-- 첫번째 %s에는 홑따옴표가 없기 때문에 자바에서는 문자타입이지만 오라클은 숫자로 받아줌
					
					// 데이터베이스로부터 질의 결과를 가져와야 하는 경우(select)
					// → 『executeQuery()』 메소드 사용 
					
					// 특정 내용을 데이터베이스에 적용해야 하는 경우(insert, update, delete)
					// → 『executeUpdate()』 메소드 사용
					
					int result = stmt.executeUpdate(sql);
					//-- executeUpdate() 메소드는 적용된 행의 갯수 반환

					
					if (result > 0)
					{
						System.out.println(">> 회원 정보가 입력되었습니다.");
						System.out.println();
					}
					else
					{
						System.out.println(">> 회원 정보 입력 실패~!!!");
					}
					
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
				
			}
			else
			{
				System.out.println(">> 데이터베이스 연결 실패~!!!");
				break;
			}
		}
		while(true);
		
		sc.close();		// -- scanner 를 닫아주지 않으면 노란색 느낌표가 뜸. 그런데 나중에는 위치를 지정해서 처리해줘야하기 때문에 굳이 찾아서 닫아주는 경우는 적다..
		
		DBConn.close();
		
		System.out.println(">> 데이터베이스 연결 닫힘~!!!");
		System.out.println(">> 프로그램 종료됨~!!!");
	}
}

// 주의! 콘솔창에서 [한글] 입력시 입력부분에 한번 클릭해주고 입력하기!!



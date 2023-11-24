/*======================
 	MemberMain.java
=======================*/

/*
○ TBL_MEMBER 테이블을 활용하여
   이름과 전화번호를 여러 건 입력받고, 전체 출력하는 프로그램을 구현한다.
   단, 데이터베이스 연동이 이루어져야 하고
   MemberDAO, MemberDTO 클래스를 활용해야 한다.
   
실행 예)

이름 전화번호 입력(2) : 임하성 010-2222-2222
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(3) : 김민지 010-3333-3333
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(4) : .

-------------------------------
전체 회원 수 : 3명
-------------------------------
번호	이름	 전화번호
1	   이윤수  010-1111-1111
2	   임하성  010-2222-2222
3	   김민지  010-3333-3333
-------------------------------

*/

// 단위테스트

package com.test;

import java.util.Iterator;
import java.util.Scanner;

import com.util.DBConn;

public class MemberMain
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		MemberDAO dao;
		try
		{
			dao = new MemberDAO();
			
			int count = dao.count();
			do
			{
				System.out.printf("이름 전화번호 입력(%d) : ", ++count);	// 임하성 010-2222-2222
				String name = sc.next();
				
				// 반복의 조건을 무너뜨리는 코드 구성
				if (name.equals("."))
					break;				
				String tel = sc.next();
				
				// ※ 여기까지의 과정을 통해 이름과 전화번호를 사용자로부터 입력받은 이유는
				//		입력받은 데이터를 데이터베이스에 입력하기 위함.
				//		데이터 입력을 위하서는 dao의 add() 호출 필요.
				//		add() 메소를 호출하기 위해서는 MemberDTO()를 넘겨주는 과정이 필요.
				//		MemberDTO 를 넘겨주기 위해서는 객체의 속성값을 구성하는 과정이 필요.
				
				// MemberDTO 객체 생성
				MemberDTO dto = new MemberDTO();
				
				// 속성값 구성
				dto.setName(name);
				dto.setTel(tel);
				
				// 데이터베이스에 데이터 입력하는 메소드 호출 -> add()
				int result = dao.add(dto);
				if(result > 0)
					System.out.println(">> 회원 정보 입력 완료~!!!");
				
			} while (true);
			
			System.out.println();
			System.out.println("--------------------------------");
//			System.out.println("전체 회원 수 : " + count + "명");
			// ** 실행하자마자 . 찍을 수 있기 때문에... count (X) -> dao.count() (O)
			System.out.printf("전체 회원 수 : %d명\n", dao.count());
			System.out.println("--------------------------------");
			System.out.println("번호    이름    전화번호");
			
			// 전체 회원 목록 가져와 출력
//			dao.lists(); //** -> 안됨!
			for (MemberDTO obj : dao.lists())
			{
				System.out.printf("%3s %7s %12s\n", obj.getSid(), obj.getName(), obj.getTel());
			}

			System.out.println("--------------------------------");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		finally {
			try
			{
				DBConn.close();
				//dao.close(); //** 코드가 몇줄 더 들어가야해서 DBConn.close() 사용
				System.out.println(">> 데이터베이스 연결 닫힘~!!!");
				System.out.println(">> 프로그램 종료됨~!!");
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
	}
}
// 실행 결과
/*
이름 전화번호 입력(2) : 임하성 010-3333-3333
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(3) : 김민지 010-4444-4444
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(4) : .

--------------------------------
전체 회원 수 : 3명
--------------------------------
번호    이름    전화번호
  1     이윤수 010-1111-1111
  2     임하성 010-3333-3333
  3     김민지 010-4444-4444
--------------------------------
>> 데이터베이스 연결 닫힘~!!!
>> 프로그램 종료됨~!!
*/

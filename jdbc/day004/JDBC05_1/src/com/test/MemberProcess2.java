/* ============================================
	MemberProcess.java
	- 콘솔 기반 서브 메뉴 입출력 전용 클래스
==============================================*/
package com.test;

import java.util.ArrayList;
import java.util.Scanner;

public class MemberProcess2
{
	private MemberDAO dao;
	
	public MemberProcess2()
	{
		dao = new MemberDAO();
	}
	
	public void insertM()
	{
		try
		{
			dao.connection();
			
			Scanner sc = new Scanner(System.in);
			
			System.out.println("직원 정보 입력 --------------------------------------------------------");
			System.out.print("▶ 이름: ");
			String name = sc.next();
			System.out.print("▶ 주민등록번호(yymmdd-nnnnnnn): ");
			String ssn = sc.next();
			System.out.print("▶ 입사일(yyyy-mm-dd): ");
			String ibsadate = sc.next();
			
			int cityId = 0;
			boolean checkCity = true;
			do
			{
				// 지역출력
				System.out.print("▶ 지역(");
				for (MemberDTO dto: dao.cityLists())
				{
					System.out.printf(dto.getCityName()+"/");
				}
				System.out.print("): ");
				String cityName = sc.next();
						
//				임시(주석해제 필요)
//				for (MemberDTO dto: dao.cityLists())
//				{
//					String cityNameList = dto.getCityName();
//					if(cityNameList.equals(cityName)) {
//						checkCity = false;
//						cityId = dto.getCityId();
//					}
//				}
//				임시(삭제 필요)
//						checkCity = false;
				
				ArrayList<MemberDTO> arrayList = dao.cityLists(cityName);
						
				if(arrayList.size() > 0)
				{
					checkCity = false;
					cityId = arrayList.get(0).getCityId();
				}else
				{
					System.out.println("[!] 해당 지역이 없습니다. 다시 입력해주세요.");
				}
				
//				if(checkCity)
//					System.out.println("[!] 해당 지역이 없습니다. 다시 입력해주세요.");
			} while (checkCity);
			
			System.out.print("▶ 전화번호(010-0000-0000): ");
			String tel = sc.next();
			
			int buseoId = 0;
			boolean checkBuseo = true;
			do
			{
				// 지역출력
				System.out.print("▶ 부서(");
				for (MemberDTO dto: dao.buseoLists())
				{
					System.out.printf(dto.getBuseoName()+"/");
				}
				System.out.print("): ");
				String buseoName = sc.next();
					
//				임시(주석해제 필요)
//				for (MemberDTO dto: dao.buseoLists())
//				{
//					String buseoNameList = dto.getBuseoName();
//					if(buseoNameList.equals(buseoName))
//					{
//						checkBuseo = false;
//						buseoId = dto.getBuseoId();
//					}
//				}
//				임시(삭제 필요)
						checkBuseo = false;
				
				if(checkBuseo)
					System.out.println("[!] 해당 부서가 없습니다. 다시 입력해주세요.");
			} while (checkBuseo);
			
			int jikwiId = 0;
			boolean checkjikwi = true;
			do
			{
				// 지역출력
				System.out.print("▶ 부서(");
				for (MemberDTO dto: dao.buseoLists())
				{
					System.out.printf(dto.getBuseoName()+"/");
				}
				System.out.print("): ");
				String buseoName = sc.next();
					
//				임시(주석해제 필요)
//				for (MemberDTO dto: dao.buseoLists())
//				{
//					String buseoNameList = dto.getBuseoName();
//					if(buseoNameList.equals(buseoName))
//					{
//						checkBuseo = false;
//						buseoId = dto.getBuseoId();
//					}
//				}
//				임시(삭제 필요)
						checkBuseo = false;
				
				if(checkBuseo)
					System.out.println("[!] 해당 부서가 없습니다. 다시 입력해주세요.");
			} while (checkBuseo);
			
			System.out.print("");
			System.out.print("");
			System.out.print("");
			System.out.print("");
			System.out.print("");
			System.out.print("");
			System.out.print("");
			System.out.print("");
			
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}

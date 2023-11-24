/* ============================================
	MemberProcess.java
	- 콘솔 기반 서브 메뉴 입출력 전용 클래스
==============================================*/
package com.test;

import java.util.ArrayList;
import java.util.Scanner;

public class MemberProcess
{
	private MemberDAO dao;
	
	public MemberProcess()
	{
		dao = new MemberDAO();
	}
	
	public void insertMember()
	{
		try
		{
			dao.connection();
			
			Scanner sc = new Scanner(System.in);
			
			MemberDTO insertMember = new MemberDTO();
			insertMember.getEmp_name();
						
			System.out.println("직원 정보 입력 --------------------------------------------------------");
			System.out.print("▶ 이름: ");
			String name = sc.next();
			insertMember.setEmp_name(name);
			
			System.out.print("▶ 주민등록번호(yymmdd-nnnnnnn): ");
			String ssn = sc.next();
			insertMember.setSsn(ssn);
			
			System.out.print("▶ 입사일(yyyy-mm-dd): ");
			String ibsadate = sc.next();
			insertMember.setIbsadate(ibsadate);
			
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
				
				ArrayList<MemberDTO> arrayList = dao.cityLists(cityName);
						
				if(arrayList.size() > 0)
				{
					cityId = arrayList.get(0).getCityId();
					insertMember.setCityId(cityId);
					checkCity = false;
				}else
				{
					System.out.println("[!] 해당 지역이 없습니다. 다시 입력해주세요.");
				}
				
			} while (checkCity);
			
			System.out.print("▶ 전화번호(010-0000-0000): ");
			String tel = sc.next();
			insertMember.setTel(tel);
			
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
					
				ArrayList<MemberDTO> arrayList = dao.buseoLists(buseoName);
				
				if(arrayList.size() > 0)
				{
					buseoId = arrayList.get(0).getBuseoId();
					insertMember.setBuseoId(buseoId);
					checkBuseo = false;
				}else
				{
					System.out.println("[!] 해당 부서가 없습니다. 다시 입력해주세요.");
				}
			} while (checkBuseo);
			
			int jikwiId = 0;
			int minBasicPay = 0;
			boolean checkjikwi = true;
			do
			{
				// 지역출력
				System.out.print("▶ 직위(");
				for (MemberDTO dto: dao.jikwiLists())
				{
					System.out.printf(dto.getJikwiName()+"/");
				}
				System.out.print("): ");
				String jikwiName = sc.next();
					
				ArrayList<MemberDTO> arrayList = dao.jikwiLists(jikwiName);
				
				if(arrayList.size() > 0)
				{
					jikwiId = arrayList.get(0).getJikwiId();
					minBasicPay =  arrayList.get(0).getMinBasicPay();
					insertMember.setJikwiId(jikwiId);
					checkjikwi = false;
				}else
				{
					System.out.println("[!] 해당 직위가 없습니다. 다시 입력해주세요.");
				}
			} while (checkjikwi);
			
			int basicpay = 0;
			boolean checkMinBasicPay = true;
			do
			{
				System.out.print("▶ 기본급(최소 " + minBasicPay + " 이상): ");
				basicpay = sc.nextInt();
				
				if(minBasicPay <= basicpay) 
				{
					insertMember.setBasicpay(basicpay);
					checkMinBasicPay = false;
				}else
				{
					System.out.println("[!] 최소금액보다 작습니다. 다시입력해주세요.");					
				}
			} while (checkMinBasicPay);
			
			System.out.print("▶ 수당: ");
			int sudang = sc.nextInt();
			insertMember.setSudang(sudang);
			
			dao.add(insertMember);
			
			System.out.println("직원 정보 입력 완료~!!!");				
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	public void printAll()
	{
		try
		{
			dao.connection();
			
			Scanner sc = new Scanner(System.in);			
			
			do
			{
				System.out.println("\n1. 사번 정렬");
				System.out.println("2. 이름 정렬");
				System.out.println("3. 부서 정렬");
				System.out.println("4. 직위 정렬");
				System.out.println("5. 내림차순 정렬");
				System.out.print(">> 메뉴 선택(1~5, -1 종료):");
				String menus2 = sc.next();
				
				try
				{
					int menu2 = Integer.parseInt(menus2);
					
					if(menu2 == -1)
					{
						System.out.println();
						System.out.println("프로그램이 종료되었습니다.");
						return;
					}
					
					System.out.println();
					System.out.print("전체 인원: " + dao.count() + " 명\n");
					System.out.println("사번	이름	주민번호	입사일	지역	전화번호	부서	직위	기본급	수당	급여");
					
					for (MemberDTO dto2 : dao.orderLists(menu2))
					{
						System.out.println(dto2);
					}
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
				
			}while(true);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	public void printSrearch()
	{
		try
		{
			dao.connection();
			
			Scanner sc = new Scanner(System.in);			
			
			do
			{
				System.out.println();
				System.out.println("1. 사번 검색");
				System.out.println("2. 이름 검색");
				System.out.println("3. 부서 검색");
				System.out.println("4. 직위 검색");
				System.out.print(">> 메뉴 선택(1~4, -1 종료): ");
				String menus2 = sc.next();
				
				try
				{
					int menu2 = Integer.parseInt(menus2);
					
					if(menu2 == -1)
					{
						System.out.println();
						System.out.println("프로그램이 종료되었습니다.");
						return;
					}
					
					ArrayList<MemberDTO> arrayList = null;
					switch (menu2)
					{
						case 1:
							System.out.print("검색할 사번 입력: ");
							int empId = sc.nextInt();
							arrayList = dao.searhLists(1, empId, "");
							break;
						case 2:
							System.out.print("검색할 이름 입력: ");
							String emp_name = sc.next();
							arrayList = dao.searhLists(2, 0, emp_name);
							break;
						case 3:
							System.out.print("검색할 부서 입력: ");
							String buseo = sc.next();
							arrayList = dao.searhLists(3, 0, buseo);
							break;
						case 4:
							System.out.print("검색할 직위 입력: ");
							String jikwi = sc.next();
							arrayList = dao.searhLists(4, 0, jikwi);
							break;
					}
					
					System.out.println();
					System.out.print("전체 인원: " + dao.count() + " 명\n");
					System.out.println("사번	이름	주민번호	입사일	지역	전화번호	부서	직위	기본급	수당	급여");
					
					for (MemberDTO dto2 : arrayList)
					{
						System.out.println(dto2);
					}
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
				
			}while(true);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	public void modifyMember()
	{
		try
		{
			dao.connection();
			
			Scanner sc = new Scanner(System.in);
			
			MemberDTO insertMember = new MemberDTO();
			insertMember.getEmp_name();
			
			System.out.println("\n수정할 직원 정보 입력 --------------------------------------------------------");
					
			int empId = 0;
			boolean checkEmp = true;
			do
			{
				// 사번출력
				// 전체 리스트 출력
//				ArrayList<MemberDTO> arrayList0 = dao.orderLists(1);
//				System.out.println();
//				System.out.print("전체 인원: " + dao.count() + " 명\n");
//				System.out.println("사번	이름	주민번호	입사일	지역	전화번호	부서	직위	기본급	수당	급여");
//				
//				for (MemberDTO dto2 : arrayList0)
//				{
//					System.out.println(dto2);
//				}
				
				System.out.print("▶ 수정할 사번: ");
				int empId1 = sc.nextInt();
				
				ArrayList<MemberDTO> arrayList = dao.searhLists(1, empId1, "");
				
				System.out.println("사번	이름	주민번호	입사일	지역	전화번호	부서	직위	기본급	수당	급여");
				for (MemberDTO dto2 : arrayList)
				{
					System.out.println(dto2);
				}
						
				if(arrayList.size() > 0)
				{
					insertMember.setEmpId(empId1);
					checkEmp = false;
				}else
				{
					System.out.println("[!] 해당 사번이 없습니다. 다시 입력해주세요.");
				}
				
			} while (checkEmp);
			
			
			System.out.print("▶ 이름: ");
			String name = sc.next();
			insertMember.setEmp_name(name);
			
			System.out.print("▶ 주민등록번호(yymmdd-nnnnnnn): ");
			String ssn = sc.next();
			insertMember.setSsn(ssn);
			
			System.out.print("▶ 입사일(yyyy-mm-dd): ");
			String ibsadate = sc.next();
			insertMember.setIbsadate(ibsadate);
			
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
				
				ArrayList<MemberDTO> arrayList = dao.cityLists(cityName);
						
				if(arrayList.size() > 0)
				{
					cityId = arrayList.get(0).getCityId();
					insertMember.setCityId(cityId);
					checkCity = false;
				}else
				{
					System.out.println("[!] 해당 지역이 없습니다. 다시 입력해주세요.");
				}
				
			} while (checkCity);
			
			System.out.print("▶ 전화번호(010-0000-0000): ");
			String tel = sc.next();
			insertMember.setTel(tel);
			
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
					
				ArrayList<MemberDTO> arrayList = dao.buseoLists(buseoName);
				
				if(arrayList.size() > 0)
				{
					buseoId = arrayList.get(0).getBuseoId();
					insertMember.setBuseoId(buseoId);
					checkBuseo = false;
				}else
				{
					System.out.println("[!] 해당 부서가 없습니다. 다시 입력해주세요.");
				}
			} while (checkBuseo);
			
			int jikwiId = 0;
			int minBasicPay = 0;
			boolean checkjikwi = true;
			do
			{
				// 지역출력
				System.out.print("▶ 직위(");
				for (MemberDTO dto: dao.jikwiLists())
				{
					System.out.printf(dto.getJikwiName()+"/");
				}
				System.out.print("): ");
				String jikwiName = sc.next();
					
				ArrayList<MemberDTO> arrayList = dao.jikwiLists(jikwiName);
				
				if(arrayList.size() > 0)
				{
					jikwiId = arrayList.get(0).getJikwiId();
					minBasicPay =  arrayList.get(0).getMinBasicPay();
					insertMember.setJikwiId(jikwiId);
					checkjikwi = false;
				}else
				{
					System.out.println("[!] 해당 직위가 없습니다. 다시 입력해주세요.");
				}
			} while (checkjikwi);
			
			int basicpay = 0;
			boolean checkMinBasicPay = true;
			do
			{
				System.out.print("▶ 기본급(최소 " + minBasicPay + " 이상): ");
				basicpay = sc.nextInt();
				
				if(minBasicPay <= basicpay) 
				{
					insertMember.setBasicpay(basicpay);
					checkMinBasicPay = false;
				}else
				{
					System.out.println("[!] 최소금액보다 작습니다. 다시입력해주세요.");					
				}
			} while (checkMinBasicPay);
			
			System.out.print("▶ 수당: ");
			int sudang = sc.nextInt();
			insertMember.setSudang(sudang);
			
			dao.modify(insertMember);
			
			System.out.println("직원 정보 입력 완료~!!!");				
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	public void deletMember()
	{
		try
		{
			dao.connection();
			
			Scanner sc = new Scanner(System.in);
			
			
			
			int empId1 = 0;
			boolean checkEmp = true;
			do
			{
				// 사번출력
				// 전체 리스트 출력
//				ArrayList<MemberDTO> arrayList0 = dao.orderLists(1);
//				System.out.println();
//				System.out.print("전체 인원: " + dao.count() + " 명\n");
//				System.out.println("사번	이름	주민번호	입사일	지역	전화번호	부서	직위	기본급	수당	급여");
//				
//				for (MemberDTO dto2 : arrayList0)
//				{
//					System.out.println(dto2);
//				}
				
				System.out.print("▶ 삭제할 사번: ");
				int empId2 = sc.nextInt();
				
				ArrayList<MemberDTO> arrayList = dao.searhLists(1, empId2, "");
				
				System.out.println("사번	이름	주민번호	입사일	지역	전화번호	부서	직위	기본급	수당	급여");
				for (MemberDTO dto2 : arrayList)
				{
					System.out.println(dto2);
				}
						
				if(arrayList.size() > 0)
				{
					dao.delete(empId2);
					System.out.println("직원 정보 삭제 완료~!!!");	
					checkEmp = false;
				}else
				{
					System.out.println("[!] 해당 사번이 없습니다. 다시 입력해주세요.");
				}
				
			} while (checkEmp);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}

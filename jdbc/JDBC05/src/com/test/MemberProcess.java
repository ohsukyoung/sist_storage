/* ============================================
	MemberProcess.java
	- 콘솔 기반 서브 메뉴 입출력 전용 클래스
==============================================*/
package com.test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

/*
1. 직원 정보 입력
2. 직원 전체 출력
	- 사번 정렬
	- 이름 정렬
	- 부서 정렬
	- 직위 정렬
	- 급여 내림차순 정렬
3. 직원 검색 출력
	- 사번 검색
	- 이름 검색
	- 부서 검색
	- 직위 검색
4. 직원 정보 수정
5. 직원 정보 삭제
*/
public class MemberProcess
{
	// 주요 속성 구성
	private MemberDAO dao;

	public MemberProcess(MemberDAO dao)
	{
		super();
		this.dao = dao;
	}
	
	// 생성자 정의(사용자정의 생성자)	
	//** 자동생성: 오른쪽 버튼 클릭 Source -> Generate Constructor useing Fields..
	public MemberProcess()
	{
		dao = new MemberDAO();
	}
	
	
	
	// 직원 정보 입력 메소드 정의
	public void memberInsert()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			// 데이터베이스 연결
			dao.connection();
			
			// 지역 리스트 구성
			ArrayList<String> citys = dao.searchCity();
			
			//** StringBuffer, StringBuilder: 계속 더해져서 길이가 달라지므로 사용
			StringBuilder cityStr = new StringBuilder();
			for(String city : citys)
				cityStr.append(city + "/");
			// 강원/경기/경남/경북/부산/서울/인천/전남/전북/제주/충남/충북/
			
			// 부서 리스트 구성
			ArrayList<String> buseos = dao.searchBuseo();
			StringBuilder buseoStr = new StringBuilder();
			for (String buseo : buseos)
				buseoStr.append(buseo + "/");
			// 개발부/기획부/영업부/인사부/자재부/총무부/홍보부/
			
			// 직위 리스트 구성
			ArrayList<String> jikwis = dao.searchJikwi();
			StringBuilder jikwiStr = new StringBuilder();
			for(String jikwi : jikwis)
				jikwiStr.append(jikwi + "/");
			
			// 사용자에게 보여지는 화면 처리
			/*
			직원 정보 입력 --------------------------------------------------------
			ㄴ 이름: 채다선
			ㄴ 주민등록번호(yymmdd-nnnnnnn): 961023-2234567
			ㄴ 입사일(yyyy-mm-dd): 2019-06-08
			ㄴ 지역(강원/경기/경남/경북/부산/서울/인천/전남/전북/제주/충남/충북/):	경기	// **테이블 지역 기반으로 출력**
			ㄴ 전화번호: 010-1111-1111
			ㄴ 부서(개발부/기획부/영업부/인사부/자재부/총무부/홍보부/): 개발부
			ㄴ 직위(사장/전무/상무/이사/부장/차장/과장/대리/사원/): 대리 
			ㄴ 기본급(최소 1800000 이상): 2500000
			ㄴ 수당: 1000000
			
			직원 정보 입력 완료~!!!
			----------------------------------------------------------------------------------
			*/
			
			System.out.println("\n직원 정보 입력 --------------------------------------------------------");
			System.out.print("▶ 이름: ");
			String empName = sc.next();
			System.out.print("▶ 주민등록번호(yymmdd-nnnnnnn): ");
			String ssn = sc.next();
			System.out.print("▶ 입사일(yyyy-mm-dd): ");
			String ibsaDate = sc.next();
			System.out.printf("▶ 지역(%s): ", cityStr.toString());
			String cityName = sc.next();
			System.out.print("▶ 전화번호: ");
			String tel = sc.next();
			System.out.printf("▶ 부서(%s): ", buseoStr.toString());
			String buseoName = sc.next();
			System.out.printf("▶ 직위(%s): ", jikwiStr.toString());
			String jikwiName = sc.next();
			System.out.printf("▶ 기본급(최소 %d 이상): ", dao.searchBasicPay(jikwiName));
			int basicPay = sc.nextInt();
			// **기본급 이상이 맞는지 확인하는 유효성검사는 나중에**
			System.out.print("▶ 수당: ");
			int sudang = sc.nextInt();
			
			MemberDTO dto = new MemberDTO();
			dto.setEmpName(empName);
			dto.setSsn(ssn);
			dto.setIbsadate(ibsaDate);
			dto.setCityName(cityName);
			dto.setTel(tel);
			dto.setBuseoName(buseoName);
			dto.setJikwiName(jikwiName);			
			dto.setBasicPay(basicPay);
			
			int result = dao.add(dto);
			if(result >0)
				System.out.println("직원 정보 입력 완료~!!!");
			
			System.out.println("-------------------------------------------------------- 직원 정보 입력\n");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
	}
	
	
	
	// 직원 전체 출력 메소드 정의
	public void memberLists()
	{
		Scanner sc = new Scanner(System.in);
		
		// 서브 메뉴 출력(안내)
		System.out.println();
		System.out.println("1. 사번 정렬");				// EMP_ID
		System.out.println("2. 이름 정렬");				// EMP_NAME
		System.out.println("3. 부서 정렬");				// BUSEO_NAME
		System.out.println("4. 직위 정렬");				// JIKWI_NAME
		System.out.println("5. 급여 내림차순 정렬");	// PAY DESC
		System.out.print(">> 선택(1~5, -1 종료): ");
		String menuStr = sc.next();
		
		try
		{
			int menu = Integer.parseInt(menuStr);
			if (menu == -1)
				return;
			// **구문의 관계와 구조에 따라 break (X) -> return (O)
			
			String key = "";
			
			switch (menu)
			{
			case 1:
				key = "EMP_ID";
				break;
			case 2:
				key = "EMP_NAME";
				break;
			case 3:
				key = "BUSEO_NAME";
				break;
			case 4:
				key = "JIKWI_NAME";
				break;
			case 5:
				key = "PAY DESC";
				break;
			}

			// 데이터베이스 연결
			dao.connection();
			
			// 직원 리스트 출력
			System.out.println();
			System.out.printf("전체 인원: %d 명\n", dao.memberCount());
			System.out.println("사번	이름	주민번호	입사일	지역	전화번호	부서	직위	기본급	수당	급여");
			
			ArrayList<MemberDTO> memList = dao.lists(key);
			if(memList.size() > 0)
			{
				for (MemberDTO dto: memList)
				{
					System.out.printf("%5d %4s %14s %10s %4s %12s %4s %3s %8d %8d %8d\n"
							, dto.getEmpId(), dto.getEmpName()
							, dto.getSsn(), dto.getIbsadate()
							, dto.getCityName(), dto.getTel()
							, dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getPay(), dto.getPay());
				}
			}
			else {
				
				System.out.println("일치하는 데이터가 존재하지 않습니다.");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		
	}
	
	// 직원 검색 출력 메소드 정의
	public void memeberSearch()
	{
		Scanner sc = new Scanner(System.in);
		
		// 서브 메뉴 구성
		System.out.println("\n1. 사번 검색");			// EMP_ID
		System.out.println("2. 이름 검색");			// EMP_NAME
		System.out.println("3. 부서 검색");			// BUSEO_NAME
		System.out.println("4. 직위 검색");			// JIKWI_NAME
		System.out.print(">> 선택(1~5, -1 종료): ");
		String menuStr = sc.next();
		
		try
		{
			int menu = Integer.parseInt(menuStr);
			
			if (menu == -1)
				return;
			
			String key = "";
			String value = "";
			
			switch (menu)
			{
				case 1:
					key = "EMP_ID";
					System.out.print("검색할 사번 입력: ");
					value =sc.next();
					break;
				case 2:
					key = "EMP_NAME";
					System.out.print("검색할 이름 입력: ");
					value =sc.next();
					break;
				case 3:
					key = "BUSEO_NAME";
					System.out.print("검색할 부서 입력: ");
					value =sc.next();
					break;
				case 4:
					key = "JIKWI_NAME";
					System.out.print("검색할 직위 입력: ");
					value =sc.next();
					break;
			}
			
			// 데이터베이스 연결
			dao.connection();
			
			// 검색 결과 출력
			System.out.println();
			System.out.printf("전체 인원: %d 명\n", dao.memberCount());
			System.out.println("사번	이름	주민번호	입사일	지역	전화번호	부서	직위	기본급	수당	급여");
			ArrayList<MemberDTO> memList = dao.searchLists(key, value);
			
			if(memList.size() > 0)
			{
				for (MemberDTO dto: memList)
				{
					System.out.printf("%5d %4s %14s %10s %4s %12s %4s %3s %8d %8d %8d\n"
							, dto.getEmpId(), dto.getEmpName()
							, dto.getSsn(), dto.getIbsadate()
							, dto.getCityName(), dto.getTel()
							, dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getPay(), dto.getPay());
				}
			}else
			{
				System.out.println("검색 결과가 존재하지 않습니다.");
			}		
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
	}
	
	
	// 직원 정보 수정 메소드 정의
	public void memberUpdate()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			// 수정할 대상 입력받기
			System.out.print("▶ 수정할 직원의 사원번호 입력: ");
			String value = sc.next();
			
			// 데이터베이스 연결
			dao.connection();
			
			ArrayList<MemberDTO> memList = dao.searchLists("EMP_ID", value);
			
			if (memList.size()>0)
			{
				// 수정할 대상을 찾은 경우
				
				/// 지역 리스트 구성
				ArrayList<String> citys = dao.searchCity();
				StringBuilder cityStr = new StringBuilder();
				for(String city : citys)
					cityStr.append(city + "/");
				// 강원/경기/경남/경북/부산/서울/인천/전남/전북/제주/충남/충북/
				
				// 부서 리스트 구성
				ArrayList<String> buseos = dao.searchBuseo();
				StringBuilder buseoStr = new StringBuilder();
				for (String buseo : buseos)
					buseoStr.append(buseo + "/");
				// 개발부/기획부/영업부/인사부/자재부/총무부/홍보부/
				
				// 직위 리스트 구성
				ArrayList<String> jikwis = dao.searchJikwi();
				StringBuilder jikwiStr = new StringBuilder();
				for(String jikwi : jikwis)
					jikwiStr.append(jikwi + "/");
				
				// 사용자에게 보여지는 화면 처리
				// **『-』로 입력 시, 기존 이름 승계로 처리**
				/*
				직원 정보 수정 --------------------------------------------------------
				▷ 기존 이름: 채다선
				▶ 수정 이름: -	
				▷ 기존 주민등록번호(yymmdd-nnnnnnn): 961023-2234567
				▶ 수정 주민등록번호(yymmdd-nnnnnnn): -
				▷ 입사일(yyyy-mm-dd): 2019-06-08
				▶ 수정 입사일(yyyy-mm-dd): 2020-11-24
				▷ 기존 지역: 경기
				▶ 수정 지역(강원/경기/경남/경북/부산/서울/인천/전남/전북/제주/충남/충북/):	-
				▷ 기존 전화번호: 010-1111-1111
				▶ 수정 전화번호: -
				▷ 기존 부서: 개발부
				▶ 수정 부서(개발부/기획부/영업부/인사부/자재부/총무부/홍보부/): -
				▷ 기존 직위: 대리
				▶ 수정 직위(사장/전무/상무/이사/부장/차장/과장/대리/사원/): -
				▷ 기존 기본급: 2500000
				▶ 수정 기본급(최소 1800000 이상): 3000000		//**수정된 직위를 기반으로 최소금액 출력필요**
				▷ 기존 수당: 1000000
				▶ 수정 수당: -
				
				직원 정보 수정 완료~!!!
				-------------------------------------------------------- 직원 정보 수정
				*/
				
				MemberDTO oldMember = memList.get(0);	// **기존 정보 가져오기**
				
				int mEmpID = oldMember.getEmpId();
				String mEmpName = oldMember.getEmpName();
				String mSsn = oldMember.getSsn();
				String mIbsaDate = oldMember.getIbsadate();
				String mCityName = oldMember.getCityName();
				String mTel = oldMember.getTel();
				String mBuseoName = oldMember.getBuseoName();
				String mJikwiName = oldMember.getJikwiName();
				int mBasicPay = oldMember.getBasicPay();
				int mSudang = oldMember.getSudang();
				
				
				System.out.println("직원 정보 수정 --------------------------------------------------------");
				
				System.out.println("▷ 기존 이름: " + mEmpName);
				System.out.print("▶ 수정 이름: ");
				String empName = sc.next();
				if(empName.equals("-"))
					empName = mEmpName;
				
				System.out.println("▷ 기존 주민등록번호(yymmdd-nnnnnnn): " + mSsn);
				System.out.print("▶ 수정 주민등록번호(yymmdd-nnnnnnn): ");
				String ssn = sc.next();
				if(ssn.equals("-"))
					ssn = mSsn;
				
				System.out.println("▷ 입사일(yyyy-mm-dd): "+ mIbsaDate);
				System.out.print("▶ 수정 입사일(yyyy-mm-dd): ");
				String ibsaDate = sc.next();
				if(ibsaDate.equals("-"))
					ibsaDate = mIbsaDate;
				
				System.out.println("▷ 기존 지역: "+ mCityName);
				System.out.printf("▶ 수정 지역(%s): ", cityStr.toString());
				String cityName = sc.next();
				if(cityName.equals("-"))
					cityName = mCityName;
				
				System.out.println("▷ 기존 전화번호: "+ mTel);
				System.out.print("▶ 수정 전화번호: ");
				String tel = sc.next();
				if(tel.equals("-"))
					tel = mTel;
				
				System.out.println("▷ 기존 부서: "+ mBuseoName);
				System.out.printf("▶ 수정 부서(%s): ", buseoStr.toString());
				String buseoName = sc.next();
				if(buseoName.equals("-"))
					buseoName = mBuseoName;
				
				System.out.println("▷ 기존 직위: "+ mJikwiName);
				System.out.printf("▶ 수정 직위(%s): ", jikwiStr.toString());
				String jikwiName = sc.next();
				if(jikwiName.equals("-"))
					jikwiName = mJikwiName;
				
				System.out.println("▷ 기존 기본급: "+ mBasicPay);
				System.out.printf("▶ 수정 기본급(최소 %d 이상): ", dao.searchBasicPay(jikwiName));
				//int basicPay = sc.nextInt(); //- (X)
				/* 
				 * **고민해야 할 지점!
				 * 기본급을 기본으로 int형으로 만들었을 때, 『-』(기존 데이터로 승계)가 불가능.
				 * 따라서, String형으로 입력받아서 『-』 비교 후 아니라면 int형 변환 필요.**
				 */
				String basicPayStr = sc.next();
				int basicPay;
				if(basicPayStr.equals("-"))
					basicPay = mBasicPay;
				else
					basicPay = Integer.parseInt(basicPayStr);
				
				System.out.println("▷ 기존 수당: "+ mSudang);
				System.out.print("▶ 수정 수당: ");
				String sudangStr = sc.next();
				int sudang = 0;
				if(sudangStr.equals("-"))
					sudang = mSudang;
				else
					sudang = Integer.parseInt(sudangStr);
				
				MemberDTO newMember = new MemberDTO();	// **입력받은 새로운 정보 담아두기**
				newMember.setEmpId(mEmpID);
				//newMember.setEmpId(empId);				//-(X) check~!!!
				// **입력은 받지 않았지만, 업데이트 시 필요한 내용이므로, 기존에 담아두었던 ID를 가져옴**
				newMember.setEmpName(empName);
				newMember.setSsn(ssn);
				newMember.setIbsadate(ibsaDate);
				newMember.setCityName(cityName);
				newMember.setTel(tel);
				newMember.setBuseoName(buseoName);
				newMember.setJikwiName(jikwiName);			
				newMember.setBasicPay(basicPay);
				newMember.setSudang(sudang);
				
				int result = dao.modify(newMember);
				if(result > 0)
					System.out.println("직원 정보 수정 완료~!!!");
				
				System.out.println("-------------------------------------------------------- 직원 정보 수정 완료");
			}else
			{
				System.out.println("수정 대상을 검색하지 못했습니다.");
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
	}
	
	
	// 직원 정보 삭제 메소드 정의
	public void memberDelete()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			System.out.print("삭제할 직원의 사원번호 입력: ");
			String value = sc.next();
			
			// 사용자가 입력한 직원의 사원번호에 대한 유효성 검사 코드 삽입 가능~!!!!
			
			// 직원 정보 확인 후 삭제 여부 결정
			
			// 데이터베이스 연결
			dao.connection();
			
			ArrayList<MemberDTO> members = dao.searchLists("EMP_ID", value);
			
			if (members.size() > 0)
			{
				// 삭제할 대상 확인
				System.out.println();
				System.out.println();
				
				for (MemberDTO dto: members)
				{
					System.out.printf("%5d %4s %14s %10s %4s %12s %4s %3s %8d %8d %8d\n"
							, dto.getEmpId(), dto.getEmpName()
							, dto.getSsn(), dto.getIbsadate()
							, dto.getCityName(), dto.getTel()
							, dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getPay(), dto.getPay());
				}
				
				// 삭제 여부 결정 및 처리
				System.out.print("\n 정말 삭제하시겠습니까?(Y/N): ");
				String response = sc.next();
				if (response.equals("Y") || response.equals("y"))
				{
					int result = dao.remove(Integer.parseInt(value));
					if(result > 0)
						System.out.println("직원 정보가 정상적으로 삭제되었습니다.");
				}
			}
			else
			{
				System.out.println("삭제할 대상을 찾지 못했습니다.");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		} finally
		{
			try
			{
				dao.close();				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
	}
	
	
}

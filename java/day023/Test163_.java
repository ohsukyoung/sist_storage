// Test163 클래스를 완성하여 다음 기능을 가진 프로그램을 구현한다.
 
/*
실행 예)
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴 선택(1~6): 1
 
1번째 요소 입력: 김둘리
1번째 요소 입력 성공~!!!
요소 입력 계속(Y/N)?: y
 
2번째 요소 입력: 박또치
2번째 요소 입력 성공~!!!
요소 입력 계속(Y/N)?: n
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 2
 
[벡터 전체 출력]
김둘리
박또치
벡터 전체 출력 완료~!!!
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 3
 
검색할 요소 입력: 김둘리
 
[검색 결과 출력]
항목이 존재합니다.
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 3
 
검색할 요소 입력: 마이콜
 
[검색 결과 출력]
항목이 존재하지 않습니다.
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 4
 
삭제할 요소 입력: 마이콜
 
[삭제 결과 출력]
항목이 존재하지 않아 삭제할 수 없습니다.
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 4
 
삭제할 요소 입력: 박또치
 
[삭제 결과 출력]
박또치 항목이 삭제되었습니다.
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 5
 
변경할 요소 입력: 마이콜
 
[변경 결과 출력]
변경할 대상이 존재하지 않습니다.
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 5
 
변경할 요소 입력: 김둘리
수정할 내용 입력: 슈퍼스타
 
[변경 결과 출력]
변경이 완료되었습니다.
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 2
 
[벡터 전체 출력]
슈퍼스타
벡터 전체 출력 완료~!!
 
	[ 메뉴 선택 ] =================
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	===============================
>> 메뉴선택(1~6): 6
 
프로그램 종료!!!
계속하려면 아무 키나 누르세요....
 
*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Vector;
 
class Menus		// → 완성
{
	public static final int E_ADD = 1;		//-- 요소 추가
	public static final int E_DISP = 2;		//-- 요소 출력
	public static final int E_FIND = 3;		//-- 요소 검색
	public static final int E_DEL = 4;		//-- 요소 삭제
	public static final int E_CHA = 5;		//-- 요소 변경
	public static final int E_EXIT = 6;		//-- 종료
}
 
public class Test163_
{
	// 주요 속성 구성 → 완료
	private static final Vector<Object> vt;	//-- 자료구조
	private static BufferedReader br;	//-- 입력 시 활용
	private static Integer sel;			//-- 선택 값
	private static String con;			//-- 계속 진행 여부
 
	// static 초기화 블럭	→ 완성
	static
	{
		//Vector 자료구조 생성
		vt = new Vector<Object>();
 
		//BufferedReader 객체 생성
		br = new BufferedReader(new InputStreamReader(System.in));
 
		// 사용자 입력값 초기화
		sel = 1;
		con = "Y";
 
	}
 
	// 메뉴 출력 메소드
	public static void menuDisp()
	{
		System.out.println("\n\t [ 메뉴 선택 ] =================");
		System.out.println("\t 1. 요소 추가");
		System.out.println("\t 2. 요소 출력");
		System.out.println("\t 3. 요소 검색");
		System.out.println("\t 4. 요소 삭제");
		System.out.println("\t 5. 요소 변경");
		System.out.println("\t 6. 종료");
		System.out.println("\t ===============================");
	}
 
	// 메뉴 선택 메소드
	public static void menuSelect() throws IOException//, NumberFormatException
															//** NumberFormatException 런타임오류 문자입력시 예외처리
	{
		//System.out.printf(">> 메뉴선택(1~6): ");
		//	sel = Integer.parseInt(br.readLine());
		
		try
		{
			System.out.printf(">> 메뉴선택(1~6): ");
			sel = Integer.parseInt(br.readLine());
			con = "Y";
		}
		catch(IOException e)
		{
			con = "N";
			System.out.println(e.toString());
		}
		catch(NumberFormatException e)
		{
			con = "N";
			System.out.println(e.toString());
			System.out.println(">> 숫자 형태의 데이터를 입력해야 합니다.");
		}
		
 
	}
 
	// 선택된 메뉴 실행에 따른 기능 호출 메소드
	public static void menuRun() throws IOException
	{
		//System.out.println("0. 메뉴 실행 기능 호출");
		//while(con.equals("Y"))
		//{
			switch(sel)
			{
				case Menus.E_ADD	: addElement();break;	//-- 요소 추가
				case Menus.E_DISP	: dispElement();break;	//-- 요소 출력
				case Menus.E_FIND	: findElement();break;	//-- 요소 검색
				case Menus.E_DEL	: dleElement();break;	//-- 요소 삭제
				case Menus.E_CHA	: chaElement();break;	//-- 요소 변경
				case Menus.E_EXIT	: exit();break;
			}
		//}		
	}
 
	// 자료구조에 요소 추가(입력) 메소드
	public static void addElement() throws IOException
	{
		//System.out.println("1. 요소 추가");	// 나영
 
		int sum=1;	//-- 몇번째 요소인지 나타낼 값
		while(true)
		{	
			String con_01 = "";
 
			//-- 입력: 입력요소
			System.out.printf("\n%d번째 요소 입력: ",vt.size()+1);		//-- vt.size()+1
			vt.add(br.readLine());							//--.add(): 주어진 위치에 객체 저장
 
			//-- 출력: 요소입력 성공 했을 때
			System.out.printf("%d번째 요소 입력 성공~!!!",vt.size());	//-- vt.size()
			sum++;
 
			//-- 출력: 진행여부
			System.out.printf("\n요소 입력 계속(Y/N)?:");
			con_01 = br.readLine();
			
			//-- 연산: Y가 아니고 y가 아닐때 입력종료
			if(!con_01.equals("Y") && !con_01.equals("y"))	//-- .equals(): 문자열비교
			{
				break;
			}
		} //end while
		
	}
 
	// 자료구조에 요소 출력 메소드
	public static void dispElement()
	{
		//System.out.println("2. 요소 출력"); //수경
 
		// 출력: 요소출력
		System.out.print("\n[벡터 전체 출력]\n");
		for (Object obj: vt)
		{
			System.out.println((String)obj);
		}
		System.out.println("벡터 전체 출력 완료~!!!");
 
	}
 
	// 자료구조 내 요소 검색 메소드
	public static void findElement() throws IOException
	{
		//System.out.println("3. 요소 검색"); //재용
		
		String sc="";		//-- 입력받은 문자열 저장변수
 
		//-- 입력: 검색요소
		System.out.printf("\n검색할 요소 입력: ");
		sc = br.readLine();
		
		//-- 출력: 검색결과
		System.out.println("\n[검색 결과 출력]");
 
		//-- 연산: 항목이 존재할때 true, 존재하지 않을때 false
		if(vt.contains(sc))								//-- .contains(): 주어진 객체 포함여부 boolean으로 반환
			System.out.println("항목이 존재합니다.");
		else
			System.out.println("항목이 존재하지 않습니다.");
	}
 
	// 자료구조 내 요소 삭제 메소드
	public static void dleElement() throws IOException
	{
		//System.out.println("4. 요소 삭제");	//하성
		String rm = "";		//-- 삭제할 문자열 저장변수
		
		//-- 입력: 삭제요소
		System.out.printf("\n삭제할 요소 입력: ");
		rm = br.readLine();
		
		//-- 연산: 요소가 존재하지 않을 때 음수, 존재할 때 해당인덱스 삭제
		if(vt.indexOf(rm) < 0)							//-- .indexOf(): 주어진 객체가 저장된 위치 반환, 존재하지 않을 경우 음수 반환
		{			
			System.out.print("항목이 존재하지 않아 삭제할 수 없습니다.");
		}
		else
		{
			vt.remove(vt.indexOf(rm));					//-- .remove(): 주어진 위치의 객체 제거
			System.out.printf("%s 항목이 삭제되었습니다.", rm);
		}
	}
 
	// 자료구조 내 요소 수정(변경 메소드)
	public static void chaElement() throws IOException
	{
		//System.out.println("5. 요소 변경");	//정환
		
		String ori = "";		//-- 변경할 문자열 저장변수
		String cha = "";		//-- 수정할 문자열 저장변수
		
		//-- 입력: 변경요소
		System.out.printf("변경할 요소 입력: ");
		ori = br.readLine();
 
		//-- 연산: 요소가 존재하지 않을 때 음수, 존재할 때 해당 인덱스 수정
		if(vt.indexOf(ori) < 0)
		{	
			System.out.println("\n[변경 결과 출력]");
			System.out.println("변경할 대상이 존재하지 않습니다.");
		}
		else{
			//-- 입력: 수정요소
			System.out.printf("수정할 요소 입력: ");
			cha = br.readLine();
 
			vt.set(vt.indexOf(ori), cha);					//-- .set(): index 위치에 주어진 객체 저장(덮어쓰기)
			
			System.out.println("\n[변경 결과 출력]");
			System.out.println("변경이 완료되었습니다.");
		}
	}
 
	// 프로그램 종료 메소드	→ 완성
	public static void exit()
	{
		System.out.println("\n 프로그램 종료~!!!");
		System.exit(-1);
	}
 
	// main() 메소드	→ 완성
	public static void main(String[] args) throws IOException, NumberFormatException
	{		
		do
		{
			menuDisp();
			menuSelect();
			menuRun();
 
		}
		while (true);
	
	}
}
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
/*
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

public class Test163
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
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
 
		// 사용자 입력값 초기화
		sel = 1;
		con = "Y";
 
	}
 
	// 메뉴 출력 메소드
	public static void menuDisp()
	{
		System.out.println("\t [ 메뉴 선택 ] =================");
		System.out.println("\t 1. 요소 추가");
		System.out.println("\t 2. 요소 출력");
		System.out.println("\t 3. 요소 검색");
		System.out.println("\t 4. 요소 삭제");
		System.out.println("\t 5. 요소 변경");
		System.out.println("\t 6. 종료");
		System.out.println("\t ===============================");
	}
 
	// 메뉴 선택 메소드
	public static void menuSelect() throws IOException, NumberFormatException
															//** NumberFormatException 런타임오류 문자입력시 예외처리
	{
		br = new BufferedReader(new InputStreamReader(System.in)); //**수정됨
		System.out.printf(">> 메뉴선택(1~6): ");
		sel = Integer.parseInt(br.readLine());
 
	}
 
	// 선택된 메뉴 실행에 따른 기능 호출 메소드
	public static void menuRun() throws IOException
	{
		//System.out.println("0. 메뉴 실행 기능 호출");
 
		switch(sel)
		{
			case Menus.E_ADD	: addElement();break;	//-- 요소 추가
			case Menus.E_DISP	: dispElement();break;	//-- 요소 출력
			case Menus.E_FIND	: findElement();break;	//-- 요소 검색
			case Menus.E_DEL	: dleElement();break;	//-- 요소 삭제
			case Menus.E_CHA	: chaElement();break;	//-- 요소 변경
			case Menus.E_EXIT	: exit();break;
		}
	}
 
	// 자료구조에 요소 추가(입력) 메소드
	public static void addElement() throws IOException
	{
		//System.out.println("1. 요소 추가");	// 나영
 
		System.out.println();
		int n=1;
 
		do
		{
			System.out.printf("%d번째 요소 입력: ",n);			//-- vt.size()+1
			vt.add(br.readLine());
			System.out.printf("%d번째 요소 입력 성공~!!!\n",n);	//-- vt.size()
			System.out.print("요소 입력 계속(Y/N): ");
			con = br.readLine();
			n++;
		}
		while (con.equals("y") || con.equals("Y"));
	}
 
	// 자료구조에 요소 출력 메소드
	public static void dispElement()
	{
		//System.out.println("2. 요소 출력"); //수경
 
		System.out.print("[벡터 전체 출력]\n");
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
 
		String temp;
 
		System.out.print("검색할 요소 입력: ");
		temp = br.readLine();
		System.out.println(vt.get(vt.indexOf(temp)));
		//if(vt.contains(temp))
		{
			int i = vt.indexOf(temp);
			System.out.println("[검색 결과 출력]");
			System.out.println("항목이 존재합니다.");
		}
		else
		{
			System.out.println("[검색 결과 출력]");
			System.out.println("항목이 존재하지 않습니다.");
		}
		System.out.println();
	}
 
	// 자료구조 내 요소 삭제 메소드
	public static void dleElement() throws IOException
	{
		//System.out.println("4. 요소 삭제"); //하성
 
		System.out.print("삭제할 요소 입력: ");
		String st = br.readLine();
		System.out.println();
		System.out.println("[삭제 결과 출력]");
 
		if(vt.contains(st))
		{
			int i = vt.indexOf(st);
			vt.remove(i);
			System.out.printf("%s 항목이 삭제되었습니다.", st);
		}
		else
		{
			System.out.println("항목이 존재하지 않아 삭제할 수 없습니다.");
		}
		System.out.println();
	}
 
	// 자료구조 내 요소 수정(변경 메소드)
	public static void chaElement() throws IOException
	{
		//System.out.println("5. 요소 변경");	//정환
 
		System.out.println();
		System.out.print("변경할 요소 입력: ");
		String a = br.readLine();
 
		if(vt.contains(a))
		{
			System.out.print("수정할 내용 입력: ");
			String change = br.readLine();
			int i = vt.indexOf(a);
			vt.set(i, change);
			
			System.out.println();
			System.out.println("[변경 결과 출력]");
			System.out.println("변경이 완료되었습니다.");
		}
		else
		{
			System.out.println();
			System.out.println("[변경 결과 출력]");
			System.out.println("변경할 대상이 존재하지 않습니다.");
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
*/

// Test163 클래스를 완성하여 다음 기능을 가진 프로그램을 구현한다.
 


// 함께 푼 풀이 --------------------------------------------------
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Vector;
import java.util.Enumeration;
 
class Menus		// → 완성
{
	public static final int E_ADD = 1;		//-- 요소 추가
	public static final int E_DISP = 2;		//-- 요소 출력
	public static final int E_FIND = 3;		//-- 요소 검색
	public static final int E_DEL = 4;		//-- 요소 삭제
	public static final int E_CHA = 5;		//-- 요소 변경
	public static final int E_EXIT = 6;		//-- 종료
}
 
public class Test163
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
		// 사용자에게 안내하기 위한 메세지만을 출력하는 기능
		// 메뉴를 선택하는 기능의 메소드를 별도로 정의했기 때문에
		// 이 과정에서는 사용자의 선택값을 받아오지 않아도 무방함.
		System.out.println("\n\n\t[ 메뉴선택 ]==================");
		System.out.println("\t1. 요소추가");
		System.out.println("\t2. 요소 출력");		
		System.out.println("\t3. 요소 검색");		
		System.out.println("\t4. 요소 삭제");
		System.out.println("\t5. 요소 변경");
		System.out.println("\t6. 종료");
		System.out.println("\t====================================");

		System.out.print("\t>> 메뉴선택(1~6): ");
	}
 
	// 메뉴 선택 메소드
	public static void menuSelect() throws IOException, NumberFormatException
	{
		// 선택한 메뉴에 따른 기능 분기는
		// menuRun() 에서 처리할 예정이기 때문에
		// 입력값을 받아오는 기능만 정의.
		sel = Integer.parseInt(br.readLine());
	}
 
	// 선택된 메뉴 실행에 따른 기능 호출 메소드
	public static void menuRun() throws IOException
	{
		// Menu 클래스를 활용하여 처리
		switch(sel)
		{
			case Menus.E_ADD	: addElement();break;	//-- 요소 추가
			case Menus.E_DISP	: dispElement();break;	//-- 요소 출력
			case Menus.E_FIND	: findElement();break;	//-- 요소 검색
			case Menus.E_DEL	: dleElement();break;	//-- 요소 삭제
			case Menus.E_CHA	: chaElement();break;	//-- 요소 변경
			case Menus.E_EXIT	: exit();break;
			default: System.out.println("\t메뉴 선택 오류~!!!");
		}
	}
 
	// 자료구조에 요소 추가(입력) 메소드
	public static void addElement() throws IOException
	{
		do
		{
			System.out.printf("\n\t%d번째 요소 입력: ", vt.size()+1);
			String element = br.readLine();
			boolean b = vt.add(element);	// .add()는 반환값이 true, false
			
			if(b)
			{
				System.out.printf("\t%d번째 요소 입력 성공~!!!\n", vt.size());
			}

			System.out.print("\t요소 입력 계속(Y/N)?: ");
			con = br.readLine().toUpperCase();
			//** 대소문자 구분하지 않는 것
			//** toUpperCase(): 대문자로 변경
			
		}
		while (con.equals("Y"));		
	}
 
	// 자료구조에 요소 출력 메소드
	public static void dispElement()
	{
		System.out.println("\n\t[벡터 전체 출력]");
		for (Enumeration e = vt.elements(); e.hasMoreElements();)	//**Enumeration/ hasMoreElements():망보기
		{
			System.out.printf("\t%10s\n",e.nextElement());			//**Enumeration/ nextElement() 값 가져오기
		}
		System.out.println("\t벡터 전체 출력 완료~!!!");
	}
 
	// 자료구조 내 요소 검색 메소드
	public static void findElement() throws IOException
	{
		System.out.print("\n\t검색할 요소 입력: ");
		String element = br.readLine();

		System.out.println("\n\t[검색 결과 출력]");
		if (vt.contains(element))
		{
			System.out.println("\t항목이 존재합니다.");

			// 추가 확인
			int i = vt.indexOf(element);
			System.out.println("\t("+ element + "위치: "+i+")");
		}
		else
		{
			System.out.println("\t항목이 존재하지 않습니다.");
		}
	}
 
	// 자료구조 내 요소 삭제 메소드
	public static void dleElement() throws IOException
	{
		System.out.print("\n\t삭제할 요소 입력: ");
		String element = br.readLine();

		System.out.println("\n\t[삭제 결과 출력]");
		if(vt.contains(element))
		{
			int i = vt.indexOf(element);
			vt.remove(i);

			System.out.println("\t"+element+" 항목이 삭제되었습니다.");
		}
		else
		{
			System.out.println("\t항목이 존재하지 않아 삭제할 수 없습니다.");
		}
	}
 
	// 자료구조 내 요소 수정(변경 메소드)
	public static void chaElement() throws IOException
	{
		System.out.println("\n\t[변경할 내용 입력]");
		String oldElement = br.readLine();

		
		//System.out.println("\n\t[변경 결과 출력]");

		if(vt.contains(oldElement))
		{
			int i = vt.indexOf(oldElement);

			System.out.print("\t수정할 내용 입력: ");
			String newElement = br.readLine();

			vt.set(i, newElement);

			System.out.println("\n\t[변경 결과 출력]");
			System.out.println("\t변경이 완료되었습니다.");
		}
		else
		{
			System.out.println("\n\t[변경 결과 출력]");
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
/* =====================================
■■■ 배열 ■■■
- 배열의 선언과 초기화
- 배열의 기본적 활용
=====================================*/

// 사용자로부터 인원수를 입력받고
// 입력받은 인원 수 만큼의 학생 이름과 전화번호를 입력받아
// 이렇게 입력받은 데이터를 이름배열과 전화번호 배열로 구성하여
// 결과를 출력할 수 있는 프로그램을 구현한다.

// 실행 예
// 입력 처리할 학생 수 입력(명, 1~10): 27
// 입력 처리할 학생 수 입력(명, 1~10): -5
// 입력 처리할 학생 수 입력(명, 1~10): 3
// 이름 전화번호 입력[1](공백 구분): 홍길동 010-1111-2222
// 이름 전화번호 입력[2](공백 구분): 신데렐라 010-1111-2222
// 이름 전화번호 입력[3](공백 구분): 장화홍련 010-1111-2222

//-----------------
// 전체 학생 수: 3
//-----------------
//  이름    전화번호
// 홍길동 010-1111-2222
// 홍길동 010-1111-2222
// 홍길동 010-1111-2222
//-----------------
// 계속하려면 아무 키나 누르세요...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Scanner;

public class Test082
{
	public static void main(String[] args) throws IOException
	{
		// 내가 푼 내용 --------------------------
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		Scanner sc = new Scanner(System.in);
		
		int count=0;
		
		do
		{
			System.out.print("입력 처리할 학생 수 입력(명, 1~10): ");
			count = Integer.parseInt(br.readLine());
		
		}while (count<0 || count>10);

		String[] arr_name = new String[count];
		String[] arr_num = new String[count];

		for(int i=0; i<count; i++)
		{
			System.out.print("이름 전화번호 입력[" + (i+1) +"](공백 구분): ");
			arr_name[i] = sc.next();
			arr_num[i] = sc.next();
		}
		
		System.out.println("-----------------");
		System.out.println("전체 학생 수: "+ count);
		System.out.println("-----------------");
		System.out.println("  이름    전화번호");
		for(int i=0; i<count; i++)
		{	
			System.out.println(arr_name[i]+" "+arr_num[i]);
		}
		System.out.println("-----------------");
		*/

		// Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		// 사용자가 입력하는 학생 수를 담아낼 변수
		int memberCount = 0;

		do
		{
			System.out.print("입력 처리할 학생 수 입력(명, 1~10): ");
			memberCount = sc.nextInt();
		
		}while (memberCount<0 || memberCount>10);

		// 테스트(확인)
		System.out.printf("사용자가 입력한 인원 수:", memberCount);
		//-->> 

		// 사용자가 입력한 인원 수를 토대로
		// 이름 배열과 전화번호 배열을 생성해야 한다.

		// 인원 수 만큼의 이름 저장 배열 구성
		String[] names = new String[memberCount];
		// 인원 수 만큼의 전화번호 저장 배열 구성
		String[] tels = new String[names.length];
		
		//이름 전화번호 입력
		//인원 수 만큼의 안내 메세지 출력 및 입력값 담아내기
		//for(int i=0; i<names.length; i++)
		//for(int i=0; i<tels.length; i++)
		for(int i=0; i<memberCount; i++)
		{
			System.out.printf("이름 전화번호 입력[%d](공백 구분): ", (i+1));

			// 홍길동 000-1111-2222
			names[i] = sc.next();

			// 홍길동 000-1111-2222
			tels[i] = sc.next();
		}

		//최종 결과(이름, 전화번호) 출력
		System.out.println("-----------------");
		System.out.printf("전체 학생수 : %d명 \n", memberCount);
		System.out.println("-----------------");
		//memberCount == names.length == tels.length
		System.out.println("이름    전화번호");

		for(int i=0; i<memberCount; i++)
		{
			System.out.println("%s %s",names[i], tels[i]);
		}
		System.out.println("-----------------");

	}
}

// 실행 결과
/*
입력 처리할 학생 수 입력(명, 1~10): 2
이름 전화번호 입력[1](공백 구분): aaa 111
이름 전화번호 입력[2](공백 구분): bbb 222
-----------------
전체 학생 수: 2
-----------------
  이름    전화번호
aaa 111
bbb 222
-----------------
*/
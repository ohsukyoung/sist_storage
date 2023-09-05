/* =====================================
■■■ 자바 기본 프로그래밍 ■■■
 - 변수와 자료형
 - 자바의 기본 입출력: System.in.read() 메소드
=====================================*/
/*
『System.in.read()』메소드는 (입력 대기열로부터) 한 문자만 가져온다.
단, 입력받은 하나의 문자를 문자 그대로 가져오는 것이 아니라
ASCII Code 값(정수 형태)으로 반환하게 된다.
*/

// 실행 예)
// 한 문자 입력		 : A
// 한 자리 정수 입력 : 9

// >> 입력한 문자: A
// >> 입력한 정수: 9
// 계속하려면 아무 키나 누르세요...

import java.io.IOException;	//입출력발생시 처리

public class Test015
{
	public static void main(String[] args) throws IOException
	{
		//주요 변수 선언
		//char ch;			//-- 문자

		//연산 및 처리
		//System.out.print("문자 하나 입력하세요: ");	// A
		//ch = (char)System.in.read();					//65
		//         ---------------
		//				65

		//결과 출력
		//System.out.println(ch);


		//-------------------------------------------------

		//주요 변수 선언
		char ch;			//-- 입력 받은 문자를 담을 변수
		int n;				//-- 입력 받은 정수를 담을 변수

		//변수 추가 선언
		//char temp;			//-- 임시 테스트할 변수

		System.out.print("문자 하나 입력하세요: ");
		ch = (char)System.in.read();

		//!!check!!
		// 엔터: 2개의 키값이 합쳐짐
		//		\r(캐리지 리턴) + \n
		
		//※ 입력 대기열에 남아있는 『\r』과 『\n』을 스킵(건너뛰기)
		System.in.skip(2);
		// -- 매개변수(2)에 의해 두 글자를 읽어내지 않고 건너뜀(버린다)

		System.out.print("한 자리 정수 입력: ");
		//n = System.in.read();
		//temp = (char)System.in.read();
		//n = System.in.read() - '0';			// 48

		// 1 → 49
		// 2 → 50
		// 3 → 51
		//	  ：
		// 9 → 57

		// 입력받은 n의 값을 48만큼 감소시켜라
		n = System.in.read();
		n -= 48;

		//결과 출력
		System.out.println();				//-- 개행
		System.out.println(">> 입력한 문자:"+ ch);
		//System.out.println(">> 입력한 정수:"+ n);
		//System.out.println(">>입력한 정수:" + temp);

		System.out.println(">> 입력한 정수:"+ n);
	}
}

//결과출력

/*
문자 하나 입력하세요: A
한 자리 정수 입력: 9

>> 입력한 문자:A
>> 입력한 정수:9
계속하려면 아무 키나 누르십시오 . . .
*/

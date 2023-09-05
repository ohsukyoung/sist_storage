/* =====================================
■■■ 연산자(Operator) ■■■
 - 조건연산자 == 삼항연산자
=====================================*/

// 사용자로부터 임의의 문자 하나를 입력받아
// 알파벳 대문자이면 소문자로 ...
// 알파벳 소문자이면 대문자로...
// 알파벳이 아닌 기타 문자라면 그 문자를 그대로...
// 출력하는 프로그램을 구현한다.

// 실행 예)
// 한 문자 입력: A
// A → a
// 계속하려면 아무 키나 누르세요...

// 한 문자 입력: b
// b → B
// 계속하려면 아무 키나 누르세요...

// 한 문자 입력: 7
// 7 → 7
// 계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
												대문자X,소문자X
														↑
대문자 ? 소문자로변환 : ( 소문자 ? 대문자로변환 : 있는 그대로);
						  ------   ------------   -----------
						     1          2              3
------   ------------   --------------------------------------
  1           2                          3
*/

public class Test029
{
	public static void main(String[] args) throws IOException{
		// 내가 푼 내용 --------------------------
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		char num, change_num;

		System.out.printf("한 문자 입력: ");
		num = br.readLine().charAt(0);
		//-- CharAt() : 문자열 중 지정된 문자를 char형으로 변환

		change_num = Character.isDigit(num)? num : 
					(Character.isUpperCase(num) ? Character.toLowerCase(num) : 
					(Character.isLowerCase(num) ? Character.toUpperCase(num) : Character.toLowerCase(num)));
		// isDigit 숫자 true, 아니면 false
		// isUpperCase 대문자 true, 아니면 false
		// isLowerCase 소문자 true, 아니면 false
		// toLowerCase 소문자로 변환
		// toUpperCase 대문자로 변환

		System.out.println(num + " → " + change_num);
		*/


		// 함께 푼 내용 --------------------------
		/*
		//조건이 2개 이상 → 논리연산자
		char temp;

		System.out.print("한 문자 입력: ");
		temp = (char)System.in.read();

		//System.out.println("입력받은 값 확인: " + temp);

		//대문자? 대문자아님?
		//temp == 'A' → 65
		//temp == 'B' → 66
		//temp == 'c' → 67
		//	   ：
		//temp == 'Z' → 90

		//String result = (temp>=65 && temp<=90) ? "대문자" : "대문자X";
		//System.out.println("결과: " + result);

		//String result = (temp>='A' && temp<='Z') ? "대문자" : "대문자X";
		//System.out.println("결과: " + result);

		String result = (temp>='a' && temp<='z') ? "소문자" : "소문자X";
		System.out.println("결과: " + result);

		// 대문자 → 소문자
		//  'A'(65)	  →  'a'(97) ==> +32
		//  'B'(66)	  →  'b'(98) ==> +32
		//  'C'(67)	  →  'c'(99) ==> +32
		//			  ：
		//  'Z'(90)	  →  'z'(122) ==> +32

		// 소문자 → 대문자
		//  'a'(97)	  →  'A'(65) ==> -32
		//  'b'(98)	  →  'B'(66) ==> -32
		//  'c'(99)	  →  'C'(67) ==> -32
		//			  ：
		//  'z'(122)  →  'Z'(90) ==> -32
		*/


		char ch, ch_result;

		System.out.print("한 문자 입력: ");
		ch = (char)System.in.read();	//-- System.in.read()는 int형

		//ch_result= () ? () : ();
		//ch_result = (입력값대문자) ? (소문자로변환) : (입력값소문자 ? 대문자로변환 : 그대로);
		ch_result = (ch>='A'&&ch<='Z') ? ((char)(ch+32)) : ((ch>='a'&&ch<='z') ? ((char)(ch-32)) : ch);

		//검증
		// 'Q' (→ 81)
		//ch_result = (81>=65&&81<=90) ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (ture&&true) ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = true ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (char)(ch+32);
		//ch_result = (char)(81+32);
		//ch_result = (char)(113);
		//ch_result = 'q';

		
		// 'm' (→ 109)
		//ch_result = (109>=65&&81<=109) ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (ture&&false) ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = false ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (109>97&&109<122) ? ((char)(ch-32)) : ch);
		//ch_result = (true&&true) ? ((char)(ch-32)) : ch);
		//ch_result = true ? ((char)(ch-32)) : ch);
		//ch_result = (char)(ch-32);
		//ch_result = (char)109-32;
		//ch_result = (char)77;
		//ch_result = 'M';

		System.out.println(ch + "→" + ch_result);
	}
}

//실행 결과
/*
한 문자 입력: A
A→a
계속하려면 아무 키나 누르십시오 . . .
*/

/*
한 문자 입력: a
a→A
계속하려면 아무 키나 누르십시오 . . .
*/

/*
한 문자 입력: 1
1→1
계속하려면 아무 키나 누르십시오 . . .
*/
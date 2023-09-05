/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - if 문
 - if ~ else문 실습
=====================================*/

// 1. 프로그램을 작성할 때 주어진 조건에 따라
//    분기 방향을 정하기 위해 사용하는 제어문에는
//    if문, if~else문, 조건연산자, 복합if문(if문 중첩), switch문이 있다.

//2. if문은 if다음 조건이 참(true)일 경우
//    특정 문장을 수행하고자 할 때  사용되는 구문이다.

// ○ 과제
// 사용자로부터 임의의 문자를 하나 입력받아
// 알파벳 대문자이면 소문자로. 소문자이면 대문자로
// 알파벳이 아닌 기타 문자면 입력 오류 처리하는
// 프로그램을 구현한다.

// 실행 예)
// 한 문자 입력: A
// >> A → a

// 한 문자 입력: b
// >> b → B

// 한 문자 입력: 3
// >> 입력오류~!!

import java.io.IOException;

public class Test039
{
	public static void main(String[] args) throws IOException
	{
			// 변수 초기화
			char text, c_text;				//-- 입력받은 문자, 바뀔 문자

			// 입력 받기
			System.out.print("한 문자 입력: ");
			text = (char)System.in.read();
			c_text = text;

			// 연산 및 처리
			if(text>='A' && text<='Z')		//-- 대문자인 경우
			{
				c_text += 32;				//-- 소문자 변환 +32
				System.out.printf(">> %c → %c\n", text, c_text);
			}
			else if(text>='a' && text<='z')	//-- 소문자인 경우
			{
				c_text -=32;				//-- 소문자 변환 -32
				System.out.printf(">> %c → %c\n", text, c_text);
			}
			else
			{
				System.out.println(">> 입력오류~!!");
			}
	}
}

//실행 결과

/*
한 문자 입력: A
>> A → a
계속하려면 아무 키나 누르십시오 . . .
*/

/*
한 문자 입력: b
>> b → B
계속하려면 아무 키나 누르십시오 . . .
*/

/*
한 문자 입력: 3
>> 입력오류~!!
계속하려면 아무 키나 누르십시오 . . .
*/
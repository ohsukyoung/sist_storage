/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - if 문
 - if ~ else문 실습
=====================================*/

// 1. 프로그램을 작성할 때 주어진 조건에 따라
//	분기 방향을 정하기 위해 사용하는 제어문에는
//	if문, if~else문, 조건연산자, 복합if문(if문 중첩), switch문이 있다.

//2. if문은 if다음 조건이 참(true)일 경우
//	특정 문장을 수행하고자 할 때  사용되는 구문이다.

// 사용자로부터 임의의 정수 세개를 입력받아
// 작은 수에서 큰 수 순으로 출력하는 프로그램을 구현한다.

// 실행 예)
// 첫 번째 정수 입력: 753
// 두 번째 정수 입력: 22
// 세 번째 정수 입력: 124

//>> 정렬 결과: 22 124 753
//계속하려면 아무 키나 누르세요...

/*
① 첫 번째 정수 vs 두 번째 정수 크기 비교
	→ 첫 번째 정수가 두번째 정수보다 클 경우... 자리 바꿈

② 첫 번째 정수 vs 세 번째 정수 크기 비교
	→ 첫 번째 정수가 세번째 정수보다 클 경우... 자리 바꿈

③ 두 번째 정수 vs 세 번째 정수 크기 비교
	→ 두 번째 정수가 세 번째 정수보다 클 경우... 자리 바꿈
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test036
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// 내가 푼 내용 --------------------------
		/* 
		//방법① : 작성완료X
		int a, b, c, num1, num2, num3;

		System.out.print("첫 번째 정수 입력: ");
		a = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력: ");
		b = Integer.parseInt(br.readLine());

		System.out.print("세 번째 정수 입력: ");
		c = Integer.parseInt(br.readLine());

		//    abc
		//a b c 321
		//  c b 312
		//b a c 231
		//  c a 132
		//c a b 213 -
		//  b c 123

		if(a>b && a>c)
		{
			num1 = a;
			if(b>c)				//-- a b c
			{
				num2=b; num3=c;
				System.out.println("1");
			}
			else				//-- a c b
			{
				num2=c; num3=b;
				System.out.println("2");

			}
		}
		else if(b>a && b>c)
		{
			num1 = b;
			if(a>c)				//-- b a c
			{
				num2=a; num3=c;
				System.out.println("3");
			}
			else				//-- b c a
			{
				num2=c; num3=a;
				System.out.println("4");
			}
		}
		else
		{
			num1 = c;
			if(a>c)				//-- c a b
			{
				num2=a; num3=b;
				System.out.println("5");
			}
			else				//-- c b a
			{
				num2=b; num3=a;
				System.out.println("6");
			}
		}

		System.out.printf(">> 정렬 결과: %d %d %d", num3,num2,num1);
		*/

		// 방법② : 작성완료O
		/*
		int a,b,c,temp;

		System.out.print("첫 번째 정수 입력: ");
		a = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력: ");
		b = Integer.parseInt(br.readLine());

		System.out.print("세 번째 정수 입력: ");
		c = Integer.parseInt(br.readLine());

		if(a>b){
			temp = a;
			a = b;
			b = temp;
		}
		if(a>c){
			temp = c;
			c = a;
			a = temp;
		}
		if(b>c){
			temp = c;
			c = b;
			b = temp;
		}
		System.out.printf(">> 정렬 결과: %d %d %d", a,b,c);
		*/
		
		// 함께 푼 내용 --------------------------
		int a,b,c;					//-- 사용자가 입력하는 임의의 정수를 담아둘 변수

		System.out.print("첫 번째 정수 입력: ");
		a = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력: ");
		b = Integer.parseInt(br.readLine());

		System.out.print("세 번째 정수 입력: ");
		c = Integer.parseInt(br.readLine());

		if(a>b)						//-- 첫 번째 정수가 두 번째 정수보다 클 경우
		{
			// 자리 바꿈
			a=a^b;
			b=b^a;
			a=a^b;
		}
		if(a>c)						//-- 첫 번째 정수가 세 번째 정수보다 클 경우
		{
			// 자리 바꿈
			a=a^c;
			c=c^a;
			a=a^c;
		}
		if(b>c)						//-- 두 번째 정수가 세 번째 정수보다 클 경우
		{
			// 자리 바꿈
			b=b^c;
			c=c^b;
			b=b^c;
		}

		// 최종 결과 출력
		System.out.printf("\n>> 정렬 결과: %d %d %d\n", a, b, c);
	}
}

//실행 결과
/*
첫 번째 정수 입력: 3
두 번째 정수 입력: 2
세 번째 정수 입력: 1

>> 정렬 결과: 1 2 3
계속하려면 아무 키나 누르십시오 . . .
*/

/*
첫 번째 정수 입력: 3
두 번째 정수 입력: 1
세 번째 정수 입력: 2

>> 정렬 결과: 1 2 3
계속하려면 아무 키나 누르십시오 . . .
*/

/*
첫 번째 정수 입력: 2
두 번째 정수 입력: 3
세 번째 정수 입력: 1

>> 정렬 결과: 1 2 3
계속하려면 아무 키나 누르십시오 . . .
*/

/*
첫 번째 정수 입력: 1
두 번째 정수 입력: 3
세 번째 정수 입력: 2

>> 정렬 결과: 1 2 3
계속하려면 아무 키나 누르십시오 . . .
*/

/*
첫 번째 정수 입력: 2
두 번째 정수 입력: 1
세 번째 정수 입력: 3

>> 정렬 결과: 1 2 3
계속하려면 아무 키나 누르십시오 . . .
*/

/*
첫 번째 정수 입력: 1
두 번째 정수 입력: 2
세 번째 정수 입력: 3

>> 정렬 결과: 1 2 3
계속하려면 아무 키나 누르십시오 . . .
*/
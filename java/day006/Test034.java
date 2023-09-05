/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - if 문
 - if ~ else문 실습
=====================================*/

// 1. 프로그램을 작성할 때 주어진 조건에 따라
//	분기 방향을 정하기 위해 사용하는 제어문에는
//	if문, if~else문, 조건연산자, 복합if문(if문 중첩), switch문이 있다.

// 2. if문은 if다음 조건이 참(true)일 경우
//	 특정 문장을 수행하고자 할 때  사용되는 구문이다.

// ○ 과제
// 사용자로부터 임의의 연도를 입력받아
// 입력받은 연도가 윤년인지, 평년인지 판별하여
// 그 결과를 출력하는 프로그램 구현한다.
// 단, 입력은 BufferedReader를 활용하고
// if 조건문을 활용하여 연산을 수행할 수 있도록 한다.

// 실행 예)
// 임의의 연도 입력: 2024
// 2024년 → 윤년
// 계속하려면 아무 키나 누르세요...

// 임의의 연도 입력: 2023
// 2023년 → 평년
// 계속하려면 아무 키나 누르세요...

// ※ 윤년 판별 조건
//	  연도가 4의 배수이면서 100의 배수가 아니거나
//	  400의 배수이면 윤년, 아니면 평년

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test034
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int year;									//-- 입력받을 연도

		System.out.printf("임의의 연도 입력: ");
		year = Integer.parseInt(br.readLine());

		// 방법① -------------------------------
		/*
		if((year%4==0 && year%100!=0) || (year%400==0))
		//-- (  (year%4==0       &&      year%100!=0)   ||   (year%400==0)  )
		//-- ( ((연도 4의 배수)  && (연도 100의 배수X)) || (연도 400의 배수)  )
		{
			System.out.println(year + " → 윤년");
		}
		else
		{
			System.out.println(year + " → 평년");
		}
		*/

		// 방법② -------------------------------
		if(year%4==0 && year%100!=0)
		//-- (연도 4의 배수)  && (연도 100의 배수X)
		{
			System.out.println(year + " → 윤년");
		}
		else if(year%400==0)
		//-- (연도 400의 배수)
		{
			System.out.println(year + " → 윤년");
		}
		else
		{
			System.out.println(year + " → 평년");
		}

	}
}

// 실행 결과
/*
임의의 연도 입력: 2024
2024 → 윤년
계속하려면 아무 키나 누르십시오 . . .
*/

/*
임의의 연도 입력: 2023
2023 → 평년
계속하려면 아무 키나 누르십시오 . . .
*/
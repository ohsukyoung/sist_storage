/* =====================================
■■■ 연산자(Operator) ■■■
 - 조건연산자 == 삼항연산자
=====================================*/

// 사용자로부터 임의의 연도를 입력받아
// 입력받은 연도가 윤년인지, 평년인지 판별하여
// 그 결과를 출력하는 프로그램을 구현한다.
// 단, 입력은 BufferedReader를 활용하고
// 조건연산자를 활용하여 연산을 수행할 수 있도록 한다.

// 실행 예)
// 임의의 연도 입력 : 2000
// 2000 → 윤년
// 계속 하려면 아무 키나 누르세요...

// 임의의 연도 입력: 2012
// 2012 → 윤년
// 계속하려면 아무 키나 누르세요...

// 임의의 연도 입력: 2023
// 2023 → 평년
// 계속하려면 아무 키나 누르세요...

// ※ 2월이 28일까지 있는 해 → 평년
//			29일까지 있는 해 → 윤년
/*
- 생기는 이유: 태양력 사용으로 1년 12개월 365일 기본,
				사실 1년이 정확히 따지면 365.2422일 이어서 365일+5시간 48분 45.2초
				따라서 평년만 사용할 경우 날짜와 계절이 어긋나서
				4년에 한번씩 윤년 사용
*/

// ※ 윤년 판별 조건
//	  연도가 4의 배수이면서 100의 배수가 아니거나
//	  400의 배수이면 윤년, 아니면 평년

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test030{
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 내가 푼 내용 --------------------------
		/*
		int c_year; 
		String resultText;

		System.out.printf("임의의 연도 입력: ");
		c_year = Integer.parseInt(br.readLine());

		resultText = ((c_year%4 == 0) && (c_year%100 != 0)) || (c_year%400 == 0)? "윤년": "평년";
		

		System.out.println(c_year + " → " + resultText);
		*/

		// 함께 푼 내용 --------------------------
		int year;			//-- 사용자가 입력한 연도를 담아낼 변수
		String strResult;	//-- 윤년인지 평년인지에 대한 판별 결과를 담아낼 변수

		System.out.print("임의의 연도 입력: ");
		year = Integer.parseInt(br.readLine());

		// 연도가 4의 배수		연도가 100의 배수 아님		연도가 400의 배수
		// year%==0				year%100!=0					year%400==0

		// → year%4==0 이면서 year%100!=0 또는 year%400==0
		// → year%4==0 && year%100!=0 || year%400==0

		strResult = year%4==0 && year%100!=0 || year%400==0 ? "윤년" : "평년";

		System.out.printf("%d년 → %s\n",year,strResult);
	}
}

//실행결과
/*
임의의 연도 입력: 2000
2000년 → 윤년
계속하려면 아무 키나 누르십시오 . . .
*/

/*
임의의 연도 입력: 2048
2048년 → 윤년
계속하려면 아무 키나 누르십시오 . . .
*/

/*
임의의 연도 입력: 2023
2023년 → 평년
계속하려면 아무 키나 누르십시오 . . .
*/
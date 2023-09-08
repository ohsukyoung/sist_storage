/* =====================================
■■■ 클래스와 인스턴스 ■■■
- 클래스 설계
- 배열의 활용
- 접근제어지시자와 정보은닉
=====================================*/

// 사용자로부터 년, 월, 일을 입력받아
// 해당 날짜의 요일을 출력하는 프로그램을 구현한다.
// 단, 달력 클래스(Calendar)는 사용하지 않는다.
// 또한 클래스의 개념을 활용하여 작성할 수 있도록 한다.
// (→ WeekDay 클래스 설계)
// 그리고 배열의 개념도 적용시켜 작성할 수 있도록 한다.
// 접근 제어지시자의 개념도 확인하여 작성할 수 있도록 한다.

// 최종적으로...
// WeekDay 클래스  설계를 통해
// Test099 클래스의 main() 메소드가 정상적으로 프로그램 실행 될 수 있도록 한다.

// 실행 예)
// 년 월 일 입력(공백 구분): 2023 9 7
// >> 2023년 9월 7일 → 목요일
// 계속하려면 아무 키나 입력하세요...


// ※ Hint
//		- 1년 1월 1일 → "월요일"
//		- 1년은 365일이 아니다
//			2월의 마지막 날짜가 29 → 윤년
//			2월의 마지막 날짜가 28 → 평년
//		- 윤년의 판별 조건
//			년도가 4의 배수이면서 100의 배수가 아니거나,
//			400의 배수이면 윤년, 그 이외의 년도는 평년


import java.util.Scanner;
import java.io.IOException;

// 내가 푼 내용 --------------------------
/*
public class Test099
{
	public static void main(String[] args) throws IOException
	{
		WeekDay ob1 = new WeekDay();
		ob1.input();			// 입력받기
		ob1.yoonCount();		// 받은 년도 전까지의 윤년 수
		ob1.thisYearYoon();		// 해당 년도가 윤년인지
		ob1.MonSum();			// 월까지 더하기
		ob1.write();			// 출력

	}
}

class WeekDay
{
	Scanner sc = new Scanner(System.in);
		
		// 초기값 설정
		int in_year, in_mon, in_day;	// 입력받은 년,월,일
		int total_sum=0;				// 입력받은 년월일 더한 값
		int index=0;					// 요일 인덱스넘버
		int yoon=0;						// 해당 년도까지 윤년이 몇 번 있는지
		int mon_sum=0;					// 월 더한 값

		//mon날짜수			1    2   3   4   5   6   7   8   9  10  11  12
		int[] month_arr1 = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};	// 평년
		int[] month_arr2 = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};	// 윤년
		int[] arr_change;														// 윤년인지 평년인지에 따라 복사될 배열
		String[] week_arr = {"토","일","월","화","수","목","금"};

		// 입력받기
		public void input()
		{
			System.out.print("년 월 일 입력(공백 구분): ");
			in_year = sc.nextInt();
			in_mon = sc.nextInt();
			in_day = sc.nextInt();
		}
		

		// 받은 년도 전까지의 윤년 수
		void yoonCount()
		{
			for(int i=1; i<in_year; i++)
			{
				if(((i%4==0) && (i%100!=0)) || i%400==0)
				{
					yoon += 1;
				}
				
			}
		}
		
		// 해당 년도가 윤년인지
		void thisYearYoon() 
		{
			if(((in_year%4==0) && (in_year%100!=0)) || in_year%400==0)
				arr_change = (int[])month_arr2.clone();		// 윤년
			else
				arr_change = (int[])month_arr1.clone();		// 평년
		}

		
		// 월까지 더하기
		void MonSum()
		{
			for(int i=0; i<in_mon-1; i++)
			{
				mon_sum += arr_change[i];
			}
		}
		
		// 출력
		public void write()
		{
			//total_sum = in_year*365 + in_mon*30 + in_day;
			total_sum = in_year*365 + yoon + mon_sum + in_day;

			index = total_sum%7;

			System.out.printf(">> %d년 %d월 %d일 → %s\n", in_year, in_mon, in_day, week_arr[index]);
		}

		
}
*/

// 다른사람이 푼 내용 --------------------------
/*
public class Test099
{
	public static void main(String[] args) throws IOException
	{
		Weekday wd = new Weekday();

		wd.input();						// 입력창

		wd.dayCal();					// 날짜 계산

		wd.printDay();					// 결과 출력
	}
}
class Weekday
{
	int y,m,d;														// 년, 월, 일
	int daySum;														// 입력받은 날짜를 일 기준으로 바꾸어 누적합할 변수
	int answer;
	String[] dayText = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};

	void input() throws IOException
	{	
		Scanner sc = new Scanner(System.in);

		System.out.print("년 월 일 입력(공백 구분) : ");
		y = sc.nextInt();											// 년 월 일 입력 받기
		m = sc.nextInt();
		d = sc.nextInt();
	}
	
	void yearCal()
	{
		int[] yearDay = new int[y];
		
		for(int i = 1; i < y; i++)
		{
			if((i % 4 == 0 && i % 100 != 0) || i % 400 == 0)		// 윤년이면 366 더해주고
				daySum += 366;
			else													// 평년이면 365 더해줌
				daySum += 365;
		}
	}

	void monthCal()
	{
		int[] monthDay = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};		// 평년
		int[] monthDay4 = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};		// 윤년
		
		if((y % 4 == 0 && y % 100 != 0) || y % 400 == 0)						// 윤년이면 윤년 배열에서 계산
		{
			for(int i = 1; i < m; i++)
				daySum += monthDay4[i - 1];
		}
		else
		{
			for(int i = 1; i < m; i++)											// 평년이면 평년 배열에서 계산
				daySum += monthDay[i - 1];
		}
	}
	void dayCal()
	{
		yearCal();																// 년도 계산
		monthCal();																// 월 계산
		

		daySum += d;

		answer = daySum % 7;
		//System.out.println(answer);
		//System.out.printf(">> %d년 %d월 %d일 → %s", y, m, d, dayText[answer]);
	}
	void printDay()
	{
		System.out.printf(">> %d년 %d월 %d일 → %s\n", y, m, d, dayText[answer]);
	}

}
*/

// 함께 푼 내용 --------------------------
class WeekDay
{
	// 주요 변수 선언 → 속성
	private int y, m, d;		//-- 사용자가 입력한 연, 월, 일을 담아낼 변수
	
	// 메소드 정의 → 기능: 연, 월, 일 입력받기
	public void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("년 월 일 입력(공백 구분): ");		//-- 2024 3 19
		y = sc.nextInt();									//-- 2024
		m = sc.nextInt();									//-- 3
		d = sc.nextInt();									//-- 9
	}

	// 메소드 정의 → 기능: 요일 산출하기
	//public void week()
	//public int week()
	public String week()
	{
		// 각 월의 마지막 날짜(각 월의 최대값)를 배열 형태로 구성
		int[] months = {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		
		// 확인
		//System.out.println(months.length);
		//--==>> 12

		// 날 수를 종합할 변수
		int nalsu;

		//요일 확인 변수
		int w;

		// 요일 타이틀을 배열 형태로 구성
		String[] weekNames = {"일", "월", "화", "수", "목", "금", "토"};

		// 윤년에 따른 2월의 날 수 계산
		// 입력 년도가 윤년이라면... 2월의 마지막 날짜를 29일로 설정
		// 입력 년도가 평년이라면... 2월의 마지막 날짜를 28일로 설정
		if(y%4==0 && y%100!=0 || y%400==0)		//-- 입력년도가 윤년이라면
		{
			// 2월의 마지막 날짜를 29일로 설정
			months[1] = 29;
		}
		else									//-- 입력년도가 윤년이 아니라면.. 평년이라면..
		{
			// 2월의 마지막 날짜를 28일로 설정
			months[1] = 28;
		}

		//		ex) 2024 3 19 → 1.1.1. ~ 2023.12.31
		// ① 1년 1월 1일부터 입력받은 년도의 이전년도 12월 31일 까지의 날 수 계산
		//					  --------------
		//							y
		//					  ------------------------
		//								(y-1)

		nalsu = (y-1)*365 + (y-1)/4 - (y-1)/100 + (y-1)/400;
		//      ---------
		//		기본주기
		//					--------
		//					4년마다+1
		//							   ---------
		//							100년마다+1(X)
		//										  ----------
		//										  400년마다+1
		//*** 자바스크립트로 연산X, 정수여야 처리가능 → 나누기 연산이 자바와 다를경우 처리X

		// 확인(테스트)
		//System.out.println("날 수"+ nalsu);
		//--==>> 년 월 일 입력(공백 구분): 2024 3 19
		//		날 수738885
		//		     ------
		//		1.1.1 ~ 2023.12.31까지 날 수


		// ② 입력받은 월의 이전 월 까지의 날 수 계산 후
		//		이 결과를 1번 결과에 더하는 연산
		//		ex) 2024 3 19 → + 2024.1.1 ~ 2024.2.29
		for(int i=0; i<(m-1); i++)
		{
			nalsu += months[i];
		}

		// 확인(테스트)
		//System.out.println("날 수"+ nalsu);
		//--==>> 년 월 일 입력(공백 구분): 2024 3 19
		//		날 수738945
		//		     ------
		//			738885 + 31 + 39 = 738945
		//			1.1.1 ~ 2024.2.29 까지의 날 수


		// ③ 입력받은 일의 날짜만큼 날 수 계산 후
		//		이 결과를 2번의 결과에 더하는 연산
		//		ex) 2024 3 19 → + 19
		// ==>> 1.1.1 ~ 2024.3.19 총~~~~ 날짜수
		nalsu += d;

		// 확인(테스트)
		//System.out.println("날 수"+ nalsu);
		//--==>> 년 월 일 입력(공백 구분): 2024 3 19
		//		날 수738945
		//		     ------
		//			738945 + 19 = 738964
		//			1.1.1 ~ 2024.2.29 까지의 날 수

		//----------------------------------------------- 날 수 연산 끝

		// 무슨 요일인지 확인하기 위한 연산
		w = nalsu % 7;		//-- 전체 날 수 %7 == 0 → 일
							//-- 전체 날 수 %7 == 1 → 월

		// 테스트(확인)
		//System.out.println("w:"+w);
		//--==>> w:2
		//			→ 전체 날 수 % 7 == 2 → 화요일

		//return w;
		return weekNames[w];
	}

	// 메소드 정의 → 기능: 결과 출력하기
	public void print(String day)
	{
		System.out.printf(">> %d년 %d월 %d일 → %s요일\n", y, m, d, day);
	}
}


public class Test099
{
	public static void main(String[] args) throws IOException
	{
		// WeekDay 클래스 기반 인스턴스 생성
		WeekDay wd = new WeekDay();

		// 입력 메소드 호출
		wd.input();

		// 요일 산출 메소드 호출
		String result = wd.week();

		// 최종 결과 출력 메소드 호출
		wd.print(result);
	}
}

// 실행 결과
/*
년 월 일 입력(공백 구분): 2024 3 19
>> 2024년 3월 19일 → 화요일
계속하려면 아무 키나 누르십시오 . . .
*/
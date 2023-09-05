/* =====================================
■■■ 자바 기본 프로그래밍 ■■■
 - 변수와 자료형
 - 자바의 기본 입출력: System.in.printf()
=====================================*/

public class Test016
{
	public static void main(String[] args)
	{
		System.out.print("AAA");
		System.out.print("BBB");
		System.out.print("CCC\n");	//-- 『\n』개행
		//--==>>AAABBBCCC

		System.out.println();		//-- 개행

		//System.out.print();		//-- 매개변수 없이 사용x
		//--==>> 에러발생(컴파일 에러)
		
		System.out.printf("1234567890");
		System.out.printf("1234567890\n");	//--== 『\n』개행
		System.out.printf("1234567890%n");	//--== 『%n』개행

		//System.out.printf();
		//--==>> 에러발생(컴파일 에러)

		System.out.printf("%d + %d = %d%n",10,20,30);
		//--==>> 10 + 20 = 30

		System.out.printf("%d\n", 123);
		System.out.printf("%10d\n", 123);	//--== 10자리만큼 공간 확보
		System.out.printf("%8d\n",123);
		System.out.printf("%010d\n", 123);
		//--==>>
		/*
		123
			   123
			 123
		0000000123
		*/

		System.out.printf("%+d\n",365);
		//--==>> +365
		System.out.printf("+%d\n",365);
		//--==>> +365

		System.out.printf("%d\n",+365);
		//--==>> 365

		//System.out.printf("%-d\n",365);
		//--==>> 에러발생(런타임 에러)
		System.out.printf("-%d\n",365);
		System.out.printf("%d\n",-365);

		//System.out.printf("%d\n", 'A');
		//--==>> 에러발생(런타임 에러)
		System.out.printf("%c\n", 'A');
		//--==>> A

		//System.out.printf("%c\n", "ABCD");
		//--==>> 에러발생(런타임 에러)
		System.out.printf("%s\n", "ABCD");
		//--==>> ABCD

		System.out.printf("%h\n", 365);
		//--==>> 16d	//-- 16진수
		
		System.out.printf("%o\n", 24);
		//--==>> 30		//-- 8진수

		System.out.printf("%b\n", true);
		System.out.printf("%b\n", false);
		//--==>> true
		//--==>> falsle

		System.out.printf("%f\n",123.123);
		//--==>> 123.23000
		System.out.printf("%.2f\n",123.23);	//-- 소수점 이하 두 번쨰 자리까지 표현
		//--==>> 123.23

		System.out.printf("%.2f\n",123.231);
		//--==>> 123.23
		//-- 소수점 이하 두 번째 자리까지 표현
		//	 (소수점 이하 세 번째 자리 절삭)

		System.out.printf("%.2f\n", 123.235);
		//--==>> 123.24
		//-- 소수점 이하 두 번째 자리까지 표현
		//	 (소수점 이하 세 번쨰 자리까지 올림)

		System.out.printf("%8.2f\n",123.236);	// 총 8라지 자리 확보(정수쪽만 X) 점까지 8자리;
		//-->>   123.24
		System.out.printf("%2.2f\n",123.236);	// 표현 데이터보다 자리수 작을 경우 무시됨
		//--==>> 123.24
	}
}

//실행결과
/* 
AAABBBCCC

12345678901234567890
1234567890
10 + 20 = 30
123
       123
     123
0000000123
+365
+365
365
-365
-365
A
ABCD
16d
30
true
false
123.123000
123.23
123.23
123.24
  123.24
123.24
계속하려면 아무 키나 누르십시오 . . .
*/
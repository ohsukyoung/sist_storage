/* ===================================
■■■ 자바의 개요와 특징 ■■■
=====================================*/

/* ○ 퀴즈
	사전에 부여된 반지름 정보를 통해
	원의 넓이와 둘레를 구하는 프로그램을 구현한다.
	→ 반지름 : 10

	※ 원의 넓이 : 반지름 * 반지름 * 3.141592
	   원의 둘레 : 반지름 * 2 * 3.141592

	실행 예)
	넓이: xxxx
	둘레: xxxx
	계속하려면 아무 키나 누르세요...
*/

public class Test010
{
	public static void main(String[] args)
	{
		// 내가 푼 내용 ----------------------------------------------------
		int radius;							//반지름
		double area, peri, pie = 3.141592;	//넓이, 둘레, 파이

		radius = 10;
		area = radius * radius * pie;
		peri = radius * 2 * pie;

		System.out.println("넓이: "+ area);
        System.out.println("둘레: "+ peri);
		//System.out.printf("넓이: %f\n둘레: %f\n", area, peri);
		
		// 함께 푼 내용 ----------------------------------------------------
		// 선언
		int r = 10;						//-- 반지름(r)
		//double pi = 3.141592			//-- 원주율(π)
		//final double pi = 3.141592	//-- 원주율(π)
		final double PI = 3.141592	;	//-- 원주율(π)
		//-- 『final』키워드: 변수의 상수화, 변수명 대문자

		//rainbowColor → RAINBOWCOLOR → RAINBOW_COLOR
		//userName → USERNAME → USER_NAME
		//applePrice → APPLEPRICE → APPLE_PRICE

		double area2, length;			//-- 원의 넓이, 둘레

		//연산 및 처리
		// ① 넓이 연산
		//	원의 넓이 : 반지름 * 반지름 * 3.141592
		area2 = r * r * PI;


		// ② 둘레 연산
		//	원의 둘레 : 반지름 * 2 * 3.141592
		length = r * 2 * PI;



		// 결과출력
		//System.out.println("넓이 : "+ area2);
		//System.out.println("둘레 : " + length);

		//System.out.printf("넓이: ○%n", area);
		System.out.printf("넓이: %.3f%n", area2);
		//System.out.printf("둘레: ○%f%n", length);
		System.out.printf("둘레: %.3f%n", length);

		System.out.printf("넓이: %.3f%n둘레: %.3f%n", area2, length);


        
	}
}
//실행 결과
/*
넓이: 314.1592
둘레: 62.83184
넓이: 314.159
둘레: 62.832
넓이: 314.159
둘레: 62.832
계속하려면 아무 키나 누르십시오 . . .
*/
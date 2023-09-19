/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- wrapper 클래스
=====================================*/

public class Test135
{
	public static void main(String[] args)
	{
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Integer.MIN_VALUE);
		//--==>> 2147483647
		//		-2147483648

		System.out.println(Long.MAX_VALUE);
		System.out.println(Long.MIN_VALUE);
		//--==>> 9223372036854775807
		//		-9223372036854775808

		System.out.println(Double.MAX_VALUE);
		System.out.println(Double.MIN_VALUE);
		//--==>> 1.7976931348623157E308
		//		4.9E-324

		System.out.println();

		// 실수 기반의 나눗셈 연산
		System.out.println("1 : " + 3.0/0);
		//--==>> 1 : Infinity
		System.out.println("2 : " + -3.0/0);
		//--==>> 2 : -Infinity

		//** 나눗셈 연산에서 정수로 되어있으면 정수로 출력
		//** 실수가 하나라도 있으면 실수출력
		//** 0으로 나누면 Infinity(무한대)

		System.out.println("3 : " + (3.0/0 == 3.0/0));
		//--==>> 3 : true
		System.out.println("4 : " + (3.0/0 == -3.0/0));
		//--==>> 4 : false

		// 『Double.isInfinite()』
		System.out.println("5 : " + Double.isInfinite(3.0/0));
		System.out.println("6 : " + Double.isInfinite(-3.0/0));
		//--==>> 5 : true
		//--==>> 6 : true
		//** infinite 는 무한대인지 아닌지를 비교하는 것이지, 음수인지 양수인지 판별X

		System.out.println("7 : " + (3.0/0 + -3.0/0));
		System.out.println("8 : " + (0.0/0));
		//--==>> 7 : NaN (→ Not a Number)
		//		8 : NaN

		System.out.println("9 : " + (0.0/0 == 0.0/0));
		System.out.println("10 : " + (0.0/0 != 0.0/0));
		//--==>> 9 : false
		//		10 : true

		// ※ NaN(→ Not a Number) 값과 임의의 값을
		//		크기 비교를 수행하는 『==』 연산자를 통해 비교 연산을 수행하게 되면
		//		결과는 언제나 false를 반환한다.
		
		// 『Double.isNaN()』
		System.out.println("11 : " + Double.isNaN(0.0/0));
		System.out.println("12 : " + Double.isNaN(1.2+2.2));
		//--==>> 11 : true
		//		12 : false
	}
}
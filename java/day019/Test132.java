/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- BigInteger 클래스
=====================================*/

import java.math.BigInteger;

public class Test132
{
	public static void main(String[] args)
	{
		// 불가능
		//int a1 = 123456789123456789;	//** int 표현범위 넘음
		//System.out.println(a1);

		// 불가능
		//long b1 = 123456789123456789;	//** 정수형태의 상수여서 인트로 잡힘
		//System.out.println(b1);

		// 가능
		long c1 = 123456789123456789L;
		System.out.println(c1);
		//--==>> 123456789123456789

		// 불가능
		//long d1 = 123456789123456789123456789123456789L;
		//System.out.println(d1);

		BigInteger a = new BigInteger("123456789123456789");//** 매개변수를 정수로 쓰지 않는 이유: 문자열이여야 정수형으로 넘기지 않기 때문
		BigInteger b = new BigInteger("123456789123456789");

		//BigInteger c = a + b;	//** 담는 것도 BigInteger에 해야함
		// System.out.print(c); //** (에러)

		//더하기
		BigInteger c = a.add(b);
		System.out.println("덧셈결과: "+ c);
		//--==>> 덧셈결과: 246913578246913578

		//빼기
		BigInteger d = a.subtract(b);
		System.out.println("뺄셈결과: "+ d);
		//--==>> 뺄셈결과: 0

		//곱하기
		BigInteger e = a.multiply(b);
		System.out.println("곱셈결과: "+ e);
		//--==>> 곱셈결과: 15241578780673678515622620750190521

		//나누기
		BigInteger f = a.divide(b);
		System.out.println("나눗셈결과: "+ f);
		//--==>> 나눗셈결과: 1

		//지수승
		BigInteger g = new BigInteger("2");
		System.out.println("2의 3승: "+ g.pow(3));
		//--==>> 2의 3승: 8
	}
}
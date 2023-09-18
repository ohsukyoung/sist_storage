/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- Object 클래스
=====================================*/

class Test
{
	private int a = 10;
	public void write()
	{
		System.out.println("a: "+a);
	}
}

public class Test128
{
	public static void main(String[] args)
	{
		Test ob1 = new Test();
		Test ob2 = new Test();

		System.out.println("10 == 9 : "+(10 == 9));
		//--==>> 10 == 9 : false

		int a = 10;
		int b = 10;
		System.out.println("a == b : "+(a == b));
		//--==>> a == b : true

		// ※ 『==』 비교 연산자는 피연산자의 크기를 비교함을 확인(관찰)

		System.out.println("ob1 == ob2 : "+(ob1 == ob2));
		//--==>> ob1 == ob2 : false
		//** 다른 객체여서 toString 값이 다름

		// ※ 객체(Object)들으 비교하는 과정에서 사용하는 『==』 연산자는
		//		크기를 비교하는 것이 아니라 대상 객체의 주소를 비교

		System.out.println();
		System.out.println("----------------------------------------------");
		System.out.println();

		System.out.println("ob1		:"+ob1);
		System.out.println("ob1.toString() :"+ob1.toString());
		//--==>> ob1             :Test@15db9742
		//		ob1.toString() :Test@15db9742

		System.out.println("ob2		:"+ob2);
		System.out.println("ob2.toString() :"+ob2.toString());
		//--==>>ob2             :Test@6d06d69c
		//		ob2.toString() :Test@6d06d69c

		// 『클래스명@해시코드』

		// ※ 해시코드(hashcode)
		//	: 자바 내부적으로 객체를 구분하기 위해 사용하는 것.
		//		메모리 주소값을 생각하면 절대 안된다.

		// ※ 객체가 같으면 hashCode(해시코드)가 같지만
		//		hashCode(해시코드)가 같다고 같은 객체는 아니다.
	}
}
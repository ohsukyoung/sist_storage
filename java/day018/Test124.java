/* =====================================
■■■ 클래스 고급 ■■■
- 중첩 클래스
=====================================*/

class InnerOutherTest
{
	static int a = 10;
	int b = 20;

	class InnerNested
	{
		int c = 30;


		void write()
		{
			System.out.println("inner의 write()...");
			System.out.println("a: " + a);			//-- a:static 접근O
			System.out.println("b: " + b);
			System.out.println("c: " + c);
		}

	}

	void write()
	{
		System.out.println("outer의 write()...");

		// InnerNested 클래스 기반 인스턴스 생성(→ inner)
		InnerNested ob1 = new InnerNested();
		ob1.write();						//-- innner write() 메소드 호출
	}
}

// main() 메소드를 포함하고 있는 다른 클래스
public class Test124
{
	public static void main(String[] args)
	{
		// InnerOutherTest 클래스 기반 인스턴스 생성(→ outher)
		InnerOutherTest ob2 = new InnerOutherTest();
		ob2.write();						//-- outher write() 메소드 호출
		//--==>> outer의 write()...
		//		inner의 write()...
		//		a: 10
		//		b: 20
		//		c: 30

		//InnerNested 클래스 기반 인스턴스 생성(→ inner)
		//InnerNested ob3 = new InnerNested();
		//--==>> 에러 발생(컴파일 에러)

		// check~!!! → Test112.java 파일과 비교~!!!
		// InnerNested 클래스 기반 인스턴스 생성(→ inner)
		//InnerOutherTest.InnerNested ob4 = new InnerOUtherTest.InnerNested();
		//--==>> 에러 발생(컴파일 에러)

		//※ 중첩 내부 클래스(static 중첩 클래스)와는 달리
		//	외부 클래스의 인스턴스(객체)를 사용하지 않고
		//	단독으로 내부 클래스의 인스턴스를 생성하는 것은 불가능하다.
		// → 단, 외부 클래스의 객. 체. 를 사용하면
		// 내부클래스의 객체를 생성하는 것이 가능하다.

		//check~!!! → Test122/java 파일과 비교~!!!
		//ob2.new InnerNested();
		
		
		InnerOutherTest.InnerNested ob5 = ob2.new InnerNested();
		ob5.write();
		//--==>> inner의 write()...
		//		a: 10
		//		b: 20
		//		c: 30

		// check~!!! → Test122.java 파일과 비교~!!!
		innerOutherTest.InnerNested ob6 = new InnerOutherTest().new InnerNested();

		//outher클래스명.inner 클래스명 참조변수명 = new outher생성자().new inner생성자();

		// cf) static → 중첩 내부 클래스
		//outher클래스명.inner 클래스명 참조변수명 = new outher 클래스명.inner생성자();
	}
}
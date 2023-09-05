/* =====================================
■■■ 클래스와 인스턴스 ■■■
- 생성자(Constructor)
=====================================*/

public class Test076
{
	int x;

	// ※ 생성자의 이름은 항상 예외없이 클래스의 이름과 동일해야 하며
	// 필요한 경우 인수를 받아들이는 것도 가능하다.
	// 같은 이름의 메소드를 정의하는 중복정의가 가능하지만
	// 리턴값(반환값)은 가질 수 없다.

	// ※ 생성자는 다른 일반 메소드처럼 호출될 수 없고,
	// 『new』 연산자를 이용하여 객체를 생성하기 위해 호출되며,
	// 각 클래스의 인스턴스인 객체를 생성한 우에
	// 생성된 객체릐 멤버를 초기화 시키는 작업을 수행하게 된다.

	// 생성자
	Test076()
	{
		// ※ 생성자 내부에서 다른 생성자를 호출하는 것은 가능하다. 다른 일반 메소드처럼...
		//	하지만, 생성자 내부에서 가장 먼저 실행되어야 한다. check~!!!
		//Test076(200);
		this(200);
		//-- 생성자 내부에서 또 다른 생성자를 호출하는 구문

		x = 10;
		this.x = 10;
		System.out.println("인자 없는 생성자");
		System.out.println("Test076이 갖고있는 x:" + x);
		System.out.println("Test076이 갖고있는 x:" + this.x);

		//Test076(200);

	}

	// 생성자
	//Test076(int num)
	Test076(int x)
	{
		//x = num;
		//x = x;	//-- 둘다 지역변수 x
		//Test076.x = x;
		
		//『this』 키워드~!!!
		//this.x = x;
		//-- 논리적인 해석 → Test076.x = x
		//						this → 품고 있는 클래스 찾기
		System.out.println("인자가 하나인 생성자");
		System.out.println("Test076이 갖고있는 x:" + x);
		System.out.println("Test076이 갖고있는 this.x:" + this.x);
	}

	public static void main(String[] args)
	{
		// Test076 클래스 기반 인스턴스 생성
		Test076 ob1 = new Test076();
		Test076 ob2 = new Test076(100);
		//--==>> 인자 없는 생성자
		//		Test076이 갖고있는 x:10
		//		인자가 하나인 생성자
		//		Test076이 갖고있는 x:100

		System.out.println();
		System.out.println("main에서 ob1.x: " + ob1.x);
		System.out.println("main에서 ob2.x: " + ob2.x);
	}
}
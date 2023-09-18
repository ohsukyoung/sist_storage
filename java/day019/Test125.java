/* =====================================
■■■ 클래스 고급 ■■■
- 무명 클래스
=====================================*/

/*
○ Annonymous 클래스(익명의 클래스: 무명 클래스)

	- AWT 나 안드로이드 이벤트 처리에서 일반적으로 사용
				   //** 이벤트: 프로그램 내에서 일어나는 모든 행위
	- 상위 클래스 메소드를 하나 정도 재정의할 필요성이 있을 때 사용
	- 클래스의 객체가 필요하며 또 다시 클래스를 생성해야 하는
		번거로움으로 인해 빈번하게 객체 생성이 필요한 경우
		익명의 클래스를 생성하여 처리할 수 있다.

형식 및 구조
	new 상위 클래스의 생성자()
	{
		접근제어지시자 자료형 메소드()
		{
			...;
		}
				← check~!!! 세미콜론
	}
*/
//import java.lang.Object;
import java.lang.*;	//lang패키지는 자동삽입

class TestObj	//extends Ojbect → 모든 클래스의 조상클래스
						//단일상속이 아니잖아로 이해 X
						//자바가 객체라고 알리는 것
{
	/*
	Object의 멤버들~!!!
	...;
	public String toString()
	{
		...;
	}
	..;

	@Override
	public String toString()
	{
		..;	
	}
	*/

	public Object getString()
	{
		/*
		Object ob = new Object();
		ob.xx();
		ob.yy();
		ob.zzz();

		return ob;

		*/

		//return new Object();
		//		 ------------- Obejct형

		//return ob;
		return new Object()	//특정한 기능으로 정의해서 반환 가능
		// 객체를 새로 정의했지만, 이름이 없기 때문에..
		// 객체가 가지고 있는 메소드를 재정의 할때 쓰게 된다.
		{
			// 특정 메소드 재구성 → 재정의
			@Override
			public String toString()
			{
				return "익명의 클래스...";
			}
		};
	}
}


// import java.lang.*;
public class Test125	//extends Object
{
	/*
	Object의 멤버들 상속~!!!
	*/
	public static void main(String[] args)
	{
		TestObj ob = new TestObj();

		System.out.println(ob.toString());
		//--==>>TestObj@15db9742

		System.out.println(ob.getString());
		//--==>>익명의 클래스...
	}
}
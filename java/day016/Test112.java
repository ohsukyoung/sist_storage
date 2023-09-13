 /* =====================================
■■■ 클래스 고급 ■■■
- 상속(Inheritance)
=====================================*/

// ※ 『super』

// static 으로 선언 되지 않은 메소드에서 사용되며
// 현재 클래스가 상속받은 상위 클래스의 객체를 가리킨다.
// super는 상위 클래스의 생성자를 호출하거나
// 상위 클래스의 멤버 변수 또는 메소드를 호출할 때 사용할 수 있다.

//**[생성자]
// 하위 클래스의 생성자에서 상위 클래스의 생성자를 호출할 때에는
// 하위 클래스의 생성자 정의 구문에서 맨 처음에만 위치할 수 있다.

// ※ 생성자와 클래스 상속 관계

// 하위 클래스는 상위 클래스의 멤버를 상속받지만,
// 생성자는 상속 대상에서 제외된다.
// 그리고, 하위 클래스의 생성자를 호출할 때
// 자동으로 상위 클래스의 생성자는
// 인수가 없는 생성자(default 생성자 형태)가 호출된다.

// 상위 클래스 및 하위 클래스(즉, 상관관계에 있는 클래스)를 설계하는 과정에서
// 상위 클래스의 생성자를 정의하지(작성하지) 않거나		//** 디폴트생성자만 있는 경우
// 인수가 없는 생성자만을 정의한 (작성한) 경우
// 명시적으로 하위 클래스에서 상위 클래스의 생성자를 호출하지 않아도
// 아무런 문제가 발생하지 않지만
// 주로 상위 클래스에 인자가 있는 생성자만 존재하는 경우
// 주의해야 한다.

/* 예를 들어... 다음에서...
class Aclass
{
	Aclass(int n)
	{
	}
}
class Bclass extends Aclass
{
	Bclass()
	{
		super();		// → Aclass();

	}
}

  하위 클래스인 Bclass 의 생성자에서
  명시적으로 Aclass 의 생성자를 호출하지 않으면
  자동으로 상위 클래스의 생성자를 호출한다.
  하지만, Aclass에는 인자가 없는 생성자만 존재하고
  인자가 없는 생성자는 존재하지 않기 때문에 에러 발생한다.
  따라서, Bclass 생성자의 선두에
  다음처럼 명시적으로 상위 클래스의 생성자 호출 구문을 작성해야 한다.

  class Aclass
{
	Aclass(int n)
	{
	}
}
class Bclass extends Aclass
{
	Bclass()
	{
		super(10);
		....;
		....;

	}
}

※ 상속시 주의해야 할 사항
	하위 클래스에서 선언된 멤버 변수의 이름과
	하위 클래스에서 선언된 멤버 변수의 이름이  같으면
	상위 클래스의 멤버 변수는 무시된다.
	이 때, 상위 클래스의 멤버 변수를 사용하기 위해서는 
	super 키워드를 이용한다.

	동일한 이름의 멤버 변수나 동일한 이름의 메소드가
	한 클래스 안에 선언되거나 정의되는 경우 기본적으로 에러 발생한다.
	단, 메소드의 경우에는 매개변수의 갯수나 타입이 다른 경우
	에러 발생하지 않고 이들을 서로 다른 메소드로 취급하게 된다.

class 부모
{
	int n=5;
}

class 자식 extends 부모
{
	//int n;
	
	int n = 20;
	//** n은 20이 됨


	...
	System.out.println(n);		 // 내가가진 n → 20
	System.out.println(super.n); // 물려받은 n → 5
}
*/

//Rect112 클래스와 Circle112 클래스의 부모 클래스
class SuperTest112
{
	protected double area;
	private String title;

	public SuperTest112()
	{
		System.out.println("SuperTest112... 인자없는 생성자");
	}

	public SuperTest112(String title)
	{
		this.title = title;
		System.out.println("SuperTest112... 문자열을 넘겨받는 생성자");
	}

	public void write()
	{
		System.out.println(title + "-" + area);
	}
}
//SuperTest112 클래스를 상속받는 자식 클래스(단일 상속)
class Rect112 extends SuperTest112
{
	/*
	// 상속받음
	// ※ private 멤버는 접근 자체가 불가능~!!!
	private String title;

	// ※ 생성자는 상속 대상에서 제외
	public SuperTest112()
	{
		System.out.println("SuperTest112... 인자없는 생성자");
	}

	// ※ 생성자는 상속 대상에서 제외
	public SuperTest112(String title)
	{
		this.title = title;
		System.out.println("SuperTest112... 문자열을 넘겨받는 생성자");
	}

	public void write()
	{
		System.out.println(title + "-" + area);
	}
	*/

	private int w,h;

	public Rect112()
	{
		// super();
	}

	public void calc(int w, int h)
	{
		this.w = w;
		this.h = h;
		area = (double)this.w * this.h;
		write();
	}

	@Override	// 어노테이션(annotation) - metadata → JDK1.5 
				// 자바에게까지 전달되는 내용
	public void write()
	{
		System.out.println("w: " + w + ",h:" + h);
		System.out.println("사각형 - " + area);
	}

	// ※ 메소드 오버라이딩(Method Overriding)
	//    상위 클래스를 상속받은 하위 클래스에서
	//    상위 클래스에 정의된 메소드를 다시 정의하는 것으로(재정의)
	//    객체 지향 프로그래밍의 특징인 다형성을 나타낸다.
	//    재정의(Overring)는 반드시 상속 관계에 있어야 하며,
	//	  메소드 이름, 리턴 타입, 매개 변수의 갯수나 타입이
	//    모두 완전히 일치해야 한다.
	//** 접근제어지시자는 접근제한강도를 높이는 방향에서 쓸 수 없음
}

//SuperTest112 클래스를 상속받는 자식 클래스(단일 상속)
class Circle112 extends SuperTest112
{
	/*
	// 상속받음
	// ※ private 멤버는 접근 자체가 불가능~!!!
	private String title;

	// ※ 생성자는 상속 대상에서 제외
	public SuperTest112()
	{
		System.out.println("SuperTest112... 인자없는 생성자");
	}

	// ※ 생성자는 상속 대상에서 제외
	public SuperTest112(String title)
	{
		this.title = title;
		System.out.println("SuperTest112... 문자열을 넘겨받는 생성자");
	}

	public void write()
	{
		System.out.println(title + "-" + area);
	}
	*/

	public Circle112(String title)
	{
		// super();

		super(title);	//--==>> SuperTest112... 문자열을 넘겨받는 생성자
	}

	public void calc(int r)
	{
		area = r * r * 3.141592;
		write();
	}
}


//main() 메소드를 포함하는 외부 다른 클래스
public class Test112
{
	public static void main(String[] args)
	{
		// Rect112 클래스(자식 클래스) 기반 인스턴스 생성
		Rect112 ob1 = new Rect112();
		//--==>> SuperTest112... 인자없는 생성자

		// Circle112 클래스(자식 클래스) 기반 인스턴스 생성
		//Circle112 ob2 = new Circle112();
		//--==>> 에러 발생(컴파일 에러): constructor Circle112 in class Circle112 cannot be applied to given types
		//-- 현재 Circle112 클래스에는 
		//	 매개변수를 필요로하는 사용자정의 생성자가 만들어져 있으며
		//	 이로 인해 default 생성자가 자동으로 삽입되지 않는 상황.

		// Circle112 클래스(자식 클래스) 기반 인스턴스 생성
		Circle112 ob3 = new Circle112("원");
		//--==>> SuperTest112... 인자없는 생성자			// super(title); 넣기 전
		//			↓
		//--==>> SuperTest112... 문자열을 넘겨받는 생성자	// super(title); 넣고 난 후

		ob1.calc(10,5);
		//--==>> w: 10,h:5
		//		사각형 - 50.0

		ob3.calc(10);
		//--==>> 원-314.1592

	}
}

/*
===================================================================
상위 클래스   | 하위 클래스		   | 결과
===================================================================
생성자를	  | 생성자 정의 안함   | → 가능하다.
정의하지	  | 인수가 없는 생성자 | → 가능하다.
않음		  | 인수가 있는 생성자 | → 가능하다.(인수없는 생성자에서 상위 부르는 구문 생김)
------------------------------------------------------------------
인수가		  | 생성자 정의 안함   | → 가능하다.
없는		  | 인수가 없는 생성자 | → 가능하다.
생성자만 정의 | 인수가 있는 생성자 | → 가능하다.
------------------------------------------------------------------
인수가		  | 생성자 정의 안함   | → 에러 발생.
있는		  | 인수가 없는 생성자 | → 상위 클래스의 해당 생성자를 호출하지 않으면 에러 발생.
생성자만 정의 | 인수가 있는 생성자 | → 상위 클래스의 해당 생성자를 호출하지 않으면 에러 발생.
==================================================================
*/
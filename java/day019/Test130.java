/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- Wrapper 클래스
=====================================*/

/*
○ Wrapper 클래스

	1. 자바에서는 언어 수준에서 제공하는 기본형 데이터를 제외한
		나머지는 클래스로 설계하여 객체 단위로 처리한다.
		따라서 자바에서는 이러한 기본형 데이터를
		객체 단위로 처리할 수 있도록 클래스를 제공할 수 밖에 없는데

	이러한 클래스를 가리켜 Wrapper 클래스라 한다.
	2. 기본 자료형인
		bype, short, int	, long, float, double, char		, boolean 형에 대응하는
		Byte, Short, Integer, Long, Float, Double, Character, Boolean 의
		Wrpper 클래스 및 큰 숫자들을 다루기 위한
		java.math.BingInteger와 java.math.BigDecimal 클래스를 제공한다.
		//** 정수 큰 수 다루기 위한 것 

		Wrapper 클래스는 java.lang 패키지에 포함되어 있으므로
		별도의 import 과정 없이 바로 사용하는 것이 가능하며
		기본형과 마찬가지로 Wrapper 클래스도 내부 메소드를 통해
		형 변환이 가능하고, 동등 비교와 같은 연산도 가능하다.

		ex) java.lang.Integer 클래스
			int 기본 자료형의 Wrapper 클래스로
			정수를 다루는데 필요한 상수나 메소드, 진수변환 등에 필요한
			메소드 등을 포함하고 있다.

			Static Integer valueOf(int i)	//static임을 확인
			int 형을 Integer형으로 변환한다.

			Static int parseInt(String s)
			문자열 형식으로 저장된 숫자를 정수 형태로 변환하여 반환한다.

			byte byteValue(), int intValue(),
			short shorValue(), long longValue(),
			float floatValue(), double doubleValue()
			해당 기본 자료형으로 형 변환한 값으 반환한다.
*/

/*
※ 오토 박싱(Auto-Boxing)과 오토 언박싱(Auto-Unboxing)

	일반적으로 레퍼런스 형과 기본 자료형은 화환되지 안으며
	이 경우 발생하는 문제 해결을 위해 자바에서는 wrapper 클래스를 제고하게 되었다.
	하지만, JDK1.5 부터 레퍼런스 형과 기본 자료형이
	다음과 같이 형변환이 가능하도록 문법적인 지원이 이루어지게 되었다.

	int a=1-, b;
	Integer ob;
	db = a;
	//-- 기본 자료형(int)이 Integer 형으로 자동 변환(오토 박싱)
	// 실제로는 ob = new Integer(a);

	b=ob;
	//-- Integer(객체) 가 기본자료형 int 형으로 자동 변환(오토 언박싱);
	//... 실제로는 『b=intValue();』

	이는 JDK 1.5 이후 추가된 오토 박싱/ 오토 언박싱이라는 
	기능으로 인해 가능해진 것이다.
*/

public class Test130
{
	public static void main(String[] args)
	{
		int a =10, b;
		Integer c;
		Object d;

		b = a;					//-- int 형 데이터(자료) → int형 변수
		c = new Integer(0);		//-- 객체 생성
		
		// ※ 기본적으로 레퍼런스 형(참조 타입)과 기본 자료형(기본 타입)은 호환되지 않는다.

		b = c;					//-- Integer형 데이터(객체) → int 형 변수(오토 언박싱)

		b = c.intValue();		//-- 객체의메소드 호출을 통해 결과값 변환(언박싱)

		d = new Object();		//-- 객체 생성
		System.out.println("d.toString(): " + d.toString());
		//--==>> d.toString(): java.lang.Object@15db9742

		d = new Integer(10);	//-- 업캐스팅
		System.out.println("d.toString(): " + d.toString());
		//--==>> d.toString(): 10
		//** Integer에서 부모로 부터 받은 toString을 오버라이딩 함

		d = new Double(12.345);	//-- 업캐스팅
		System.out.println("d.toString(): " + d.toString());
		//--==>> d.toString(): 12.345
		//** Double에서 부모로 부터 받은 toString을 오버라이딩 함
		//** d = 객체, Double 상위 객체

		// Object d = 10;
		d = 10;	
		/*
		***
		레퍼런스 자료형(d) = 기본형(=프리미티브) 자료형(10)
		10은 Integer타입의 해당하는 객체로 호환 가능 -> 박싱
		자바가 알아서 해준다 -> 오토박싱
		Object타입 d = Integer타입 10
		d = new Integer(10); 와 같다
		*/
		System.out.println("d.toString(): " + d.toSTrig());

	}
}
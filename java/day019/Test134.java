/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- wrapper 클래스
=====================================*/

/*

*/

public class Test134
{
	public static void main(String[] args)
	{
		byte b = 3;
		int i = 256;

		Byte b2 = new Byte(b);
		Integer i2 = new Integer(i);

		System.out.println(b2);
		System.out.println(i2);
		//--==>>3
		//		256

		print(b2);
		print(i2);

	}
	//api 도큐먼트를 꼼꼼하게 확인해보기
	/*
	println(Byte b)
	{
		..;
	}

	println(Integer i)
	{
		..;
	}

	println(Long l)
	{
		..;
	}

	*/

	/*
			↓
	println(Object obj)
	{
		..;
	}

	*/

	
	// java.lang.Number(추상 클래스)는
	// 모든 숫자형 Wrapper 클래스의 부모 클래스
	// (슈퍼클래스, 상위 클래스)이다.
	// b2, i2 에 해당하는 자료형이 Number에 넘어오면서
	// 업캐스팅이 일어나게 된다.

	//** Number n = new Integer();
	static void print(Number n)	//** Integer, Byte 등 상위가 Number여서 모두 받을 수 있음
	{
		System.out.println(n);
		//** 뭐가 넘겨진건지 분기해야 함. 연산자 instanceof

		if(n instanceof Integer)	//** Integer를 기반으로한 객체라면
		{
			System.out.println(n.intValue());
		}else if(n instanceof Double)
		{
			System.out.println(n.doubleValue());
		}else
		{
			
		}
	}
	
}
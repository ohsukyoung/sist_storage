/* =====================================
■■■ 컬렉션(Collection) ■■■
=====================================*/

// Vector v = new Vector()
//-- 비어있는 Vector 자료구조 v 생성

// Vector v = new Vector(8);	//** 방의 개수를 갖는다해서 고정 아님
//-- 8개의 초기 elements를 가진
//		이 자료구조를 활용하는 과정에서
//		8개가 모두 채워지게 되면(모두 사용되어 모자라게 되면) 자동으로 확정된다.

// Vector v = new Vector(3,5);
//-- 3개의 초기 elements를 가진 Vector 자료구조 v 생성
//		이 자료구조를 활용하는 과정에서
//		3개가 모두 채워지게 되면(모두 사용되어 모자라게 되면) 자동으로 5개 증가(확장) 된다.

// ※ 벡터는 데이터 요소로 정수형, 실수형, 문자열... 등을
//		담아내는 것이 가능하다. (→ 가능해졌다.)
//		→ 데이터 안정성 확보 check~!!!

// MyVector 클래스 설계
//** 꺼내쓰는 과정에서 주의해야할 사항 확인

import java.util.Vector;
import java.util.Iterator;

class MyVector extends Vector<Object>
{
	// 생성자 → 사용자 정의 생성자
	MyVector()
	{
		// Vector(슈퍼 클래스) 생성자 호출
		// super()
		// → Vector();
		super(1, 1);
		//-- 첫 번째 인자: 주어진 용량
		//	두 번째 인자: 증가량
	}

	void addInt(int i)
	{
		addElement(new Integer(i));
	}

	void addFloat(float f)
	{
		addElement(new Float(f));
	}

	void addString(String s)
	{
		addElement(s);
	}

	void addCharArray(char[] a)
	{
		addElement(a);
	}

	void addObject(Record rec)
	{
		addElement(rec);	
	}

//** write 정의해서 적재한 모든 것이 출력되게
	void write()
	{
		
		/*
		Iterator<Object> it = this.iterator();
		//Iterator<Object> it = iterator()			//--(O)
		//Iterator<Object> it = this.iterator()		//--(O)
		//Iterator<Object> it = super.iterator()	//--(O)

		while (it.hasNext())	//** 다음값 있는지 없는지를 통해순차적 접근
		{
			Object str = it.next();
			System.out.println(str+ " " );
		}
		//--==>>5
		//		3.15
		//		안녕하세요
		//		[C@15db9742
		*/
	
		/*
		Object o;
		int length = size();

		//System.out.println("벡터 요소의 갯수: " + length);
		//--==>> 벡터 요소의 갯수: 4

		for(int i=0; i<length; i++)
		{
			o = elementAt(i);
			System.out.println(o);
		}
		//--==>>5
		//		3.15
		//		안녕하세요
		//		[C@15db9742
		*/

		//『insanceof』 연산자		check~!!!
		//-- 처맇야 하는 대상의 객체 타입 확인

		Object o;
		int length = size();

		System.out.println("벡터 요소의 갯수: " +length);
		for (int i=0; i<length ; i++ )
		{
			o = elementAt(i);
			
			/*
			// 테스트(확인)
			if(o instanceof char[])	// o 요소가 캐릭터 배열이라면
			{
				System.out.println("문자배열");
			}else
			{
				System.out.println("다른형태");	
			}
			*/

			if(o instanceof char[])	// o 요소가 캐릭터 배열이라면
			{
				//System.out.println("문자배열");
				System.out.println("문자배열: " + String.copyValueOf((char[])o));
			}else if(o instanceof String)
			{
				System.out.println("문자열: "+ o.toString());
			}else if(o instanceof Integer)
			{
				System.out.println("정수형: "+ o);
			}else if(o instanceof Float)
			{
				System.out.println("실수형: "+ o);
			}
			else
			{
				System.out.println("타입 확인 요망~!!!");	
			}
		}


	}
}

public class Test159
{
	public static void main(String[] args)
	{
		// MyVector 클래스 기반 인스턴스 생성
		MyVector v = new MyVector();

		// 주요 변수 선언 및 초기화
		int digit = 5;
		float real = 3.15f;
		String s = new String("안녕하세요");
		char[] letters = {'s','t','u','d','y'};

		v.addInt(digit);		//-- 벡터 자료구조에 정수 저장
		v.addFloat(real);		//-- 벡터 자료구조에 실수 저장
		v.addString(s);			//-- 벡터 자료구조에 문자열 저장
		v.addCharArray(letters);//-- 벡터 자료구조에 문자 배열 저장

		v.write();
	}
}
// 실행 결과

/*
벡터 요소의 갯수: 4
정수형: 5
실수형: 3.15
문자열: 안녕하세요
문자배열: study
계속하려면 아무 키나 누르십시오 . . .
*/
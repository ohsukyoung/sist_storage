/* =====================================
■■■ 컬렉션(Collection) ■■■
=====================================*/

// 자료구조 객체 선언 및 생성 시
// 사용자 정의 클래스 활용
// → 자료형

//** ★★★★★ 중요!! 기본개념
import java.util.Vector;

// 클래스 → 사용자 정의 자료형으로 활용
class MyData
{
	// 주요 속성 구성 → 주요 변수 선언(멤버 변수)
	private String name;	//-- 이름
	private int age;		//-- 나이

	//** 직접접근되지 않고, 약속된 형태의 메소드를 통해서 접근하도록
	
	// getter
	// setter

	// getter / setter 구성
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	// 생성자 → 사용자 정의 생성자(매개변수 2개인 생성자)
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}

	// ※ 사용자 정의 생성자가 구성될 경우
	//		default 생성자가 자동으로 삽입되지 않기 때문에
	//		default 생성자 형태의 생성자를 사용자 정의 생성자로
	//		추가 구성하게 되는 것이 일반적인 클래스 설계 과정
	//		(반드시 설계해야 한다는 문법적인 규칙은 없다.)

	// 생성자 → 사용자 정의 생성자(매개변수 없는 생성자)
	public MyData()
	{
		//this("",0);
		name = "";
		age = 0;
	}

	// 다른 사람이 푼 내용 ----------------------------------------------
	/*
	@Override
	public String toString()
	{
		return "이름: "+name+", 나이: "+age;
	}
	*/
}

public class Test162
{
	public static void main(String[] args)
	{
		// 벡터 자료구조 생성
		Vector<MyData> v = new Vector<MyData>();//-(O)
		//MyData[] dataArray = new MyData[10];	//-(O)
		
		// 벡터 자료구조 v에
		// 김둘리 73세 / 박또치 7세 / 마이콜 3세
		// 담아내기

		/*
		v.add(new MyData("김둘리", 73));
		v.add(new MyData("박또치", 7));
		v.add(new MyData("마이콜", 3));
		*/

		// (1) //** st1에 접근해서 적용할 수 있도록 
		/*
		MyData st1 = new MyData();
		st1.setName("김둘리");
		st1.setAge(73);
		v.add(st1);

		MyData st2 = new MyData();
		st2.setName("박또치");
		st2.setAge(7);
		v.add(st2);

		MyData st3 = new MyData();
		st3.setName("마이콜");
		st3.setAge(3);
		v.add(st3);
		*/

		// (2)
		/*
		MyData st1 = new MyData("김둘리",3);
		v.add(st1);
		MyData st2 = new MyData("박또치",7);
		v.add(st2);
		MyData st3 = new MyData("마이콜",3);
		v.add(st3);
		*/

		// (3)
		v.add(new MyData("김둘리",73));
		v.add(new MyData("박또치",7));
		v.add(new MyData("마이콜",3));

		// 벡터 자료구조 v에 담기 내용(요소) 전체 출력하기
		// 실행 예)
		// 이름: 김수환, 나이: 73세

		// 출력(1)
		/*
		for(MyData obj: v)
		{
			System.out.printf("이름: %s, 나이: %d세\n",obj.getName(), obj.getAge());
		}
		*/

		// 출력(2)
		/*
		for (int i=0; i<v.size(); i++)
		{
			System.out.printf("이름: %s, 나이: %d세\n", v.elementAt(i).getName(), v.elementAt(i).getAge());
		}
		*/

		// 출력(3)
		/*
		for (int i=0; i<v.size(); i++)
		{
			System.out.printf("이름: %s, 나이: %d세\n", v.get(i).getName(), v.get(i).getAge());
		}
		*/

		// 출력(4)
		
		for(Object obj: v)
		{
			System.out.printf("이름: %s, 나이: %d세\n", ((MyData)obj).getName(), ((MyData)obj).getAge());
		}
		

		// 다른 사람이 푼 내용 ----------------------------------------------
		/*
		for(MyData a : v)
		{
			System.out.println(a + " ");
		}
		*/

	}
}

// 실행결과
/*
이름: 김둘리, 나이: 73세
이름: 박또치, 나이: 7세
이름: 마이콜, 나이: 3세
*/
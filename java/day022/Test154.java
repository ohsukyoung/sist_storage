/* =====================================
■■■ 컬렉션 프레임워크(Collection Framwork) ■■■
=====================================*/

//** 프레임 워크- 신경써서 보기

/*
○ 컬렉션 프레임워크(Collection Framework)
	= 컬렉션(Collection) + 프레임워크(Framework)
	  -----------------	   ---------------------
	  	  |					환경, 틀, 약속		//** 로 축약됨
	      |
		 집합 → 수집품, 소장품, (물건, 사람들의) 무리, 더미, 수집, 수거
		 		--------------------------------------------------------
							모아놓은 것들, 모여있는 것들
	==> 자료구조
	//** 각종 요기나 그릇의 특징을 알아야 목적에 맞는 그릇을 쓸 수 있음
			자료구조도 마찬가지. 더 효율적인 것을 위한 것

○ 자료
	현실 세계로부터 단순한 관찰이나 측정을 통해 수집된
	사실이나 개연의 값들 또는 그 값들의 집합.

	↓

○ 자료구조
	자료 처리를 위한 자료의 표현, 저장, 관계, 관리 및
	이용에 관한 방법 등의 개념을 이해하여 프로그램에 사용하고
	컴퓨터에 의해 처리되는 과정에서 적절한 자료의 표현, 구성, 저장 및
	처리를 위한 알고리즘 작성 및 선택과 이용 방법을 연구하는 분야.

	↓

○ 컬렉션 프레임워크(Collection Framework)
	컬렉션(모아놓은 데이터들)의 표현과 조작을 위한 통일된 아키텍처로 
	컬렉션 프레임 워크를 구성하는 요소는 다음과 같다.

	1. 인터페이스(Interface)
		기본적으로 컬렉션에 필요한 데이터 관리 기능을 제공한다.
		예를 들어, list는 추가, 삭제, 검색 등의 기능을 제공하는
		컬렉션 인터페이스가 존재하며
		각 컬렉션마다 고유의 인터페이스가 정의되어 있다.

	2. 구현(Implementation)
		인터페이스를 구현한 클래스로 각 컬렉션을 
		실제 어던 자료구조를 이용하여 표현했느냐에 따라
		컬렉션의 종류가 달라지게 된다.

	3. 알고리즘(Algorithms)
		각 컬렉션들마다 유용하게 사용될 수 있는 메소드를 의미한다.

※ 자바의 컬렉션은 견고한 컬렉션 프레임워크 위에 정의되어 있으므로
	각 컬렉션 종류마다 제공되는 메소드의 일관성이 있기 때문에
	한 가지 컬렉션을 익혀두면 다른 컬렉션을 사용하는데 용이하다.


	- List: 순서있는 목록							(ex. 회원명단)
	- Set: 순서가 없고 중복을 허용하지 않는 목록	(ex. 주머니)
	- Map: 키와 값이 연결되어 있는 목록				(ex. 공끝에 낚싯줄)

○ 스택(Stack)	//** 현재 사용을 권장하진 않지만, 의미가 있어서 먼저 배움
	
	Stack 클래스는 오브젝트 후입선출(LIFO) 구조의 stack을 나타낸다.
	이는 벡터(Vector)를 스택으로 처리하는 5개의 메소드로
	벡터(Vector)클래스를 확장하게 된다.

	통상의 push() 메소드와 pop() 메소드가  제공되는 것 외에
	스택의 선두 항목으로 peek()을 실시하는 메소드.
	스택이 비어있는지의 여부를 확인하는 메소드 isEmpty(),
	스택으로 항목을 찾아서 선두로부터 몇 번째 인지를 찾아내는 메소드 등이 제공된다.

	스택이 처음으로 작성되었을 때, 항목은 존재하지 않는다.

	-boolean empty()
	스텍이 비어있는지 확인한다.
	- E Object peek()
	스텍의 맨 위의 객체를 스택에서 제거하지 않고 반환한다.
	- E Object pop()
	스택의 맨 위의 객체를 반환하고 스택에서 제거한다.
	- E Object pusy(E item)
	객체를 스택 자료구조에 저장한다.
	- inst search(Object o)
	스택의 맨 위에서부터 파라미터 값으로 넘겨받은 객체까지의 거리를 반환한다.
	맨 위의 객체의 겨우 1을 반환하고 그 아래 객체는 2를 반환하는 형식.
	
/**모양
	│ □ │ → 5분마다 꺼내봄	/ 마지막에 넣은 것을 먼저 꺼낼 수 있음
	│ □ │
	│ □ │
	│ □ │ → 20분마다 꺼내봄
	└──┘

// 제네릭, 제네릭 표현식


*/
import java.util.Stack;

public class Test154
{
	public static void main(String[] args)
	{
		// Stack 자료구조 생성
		//Stack myStack = new Stack();
		Stack<Object> myStack = new Stack<Object>();

		String str1 = "김둘리" ;
		String str2 = "박또치" ;
		String str3 = "마이클" ;
		String str4 = "도우너" ;

		// myStack 이라는 Stack 자료구조 안에 str1 ~ str4 까지 담아내기
		// add(), push()
		myStack.add(str1);
		myStack.add(str2);
		myStack.push(str3);
		myStack.push(str4);

		// peek(): 스택 맨 위의 객체 반환. 제거하지 않는다.
		String val1 = (String)myStack.peek();	// Object 타입 변환 -> 다운캐스팅 필요
		System.out.println("val1: "+val1);
		//--==>> val1: 도우너

		String val2 = (String)myStack.peek();
		System.out.println("val2: "+val2);
		//--==>> val2: 도우너

		String val3 = (String)myStack.peek();
		System.out.println("val3: "+val3);
		//--==>> val3: 도우너

		String value = "";

		// myStack이라는 이름을 가진 Stack 자료구조에
		// 데이터가 비어있는 상태가 아니라면,,,
		// (즉, 채워져 이는 상태라면...) → 
		while(!myStack.isEmpty())	// !false → ture / !false → ture / !false → ture / !false → false
		//** 마이스텍 자료구조가 비어있는 상태가 아니라면(= 채워진 상태)
		{
			// pop(): 스택 맨 위의 객체 반환. 제거한다.
			value = (String)myStack.pop();
			System.out.println("value: "+value);
		}
		//--==>> value: 도우너
		//		value: 마이클
		//		value: 박또치
		//		value: 김둘리
		
	}
}
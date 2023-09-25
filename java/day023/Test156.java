/* =====================================
■■■ 컬렉션 프레임워크(Collection Framwork) ■■■
=====================================*/

/*
○ 큐(Queue)
	
	큐(Queue)는 선입선출의 FIFO(First Input, First Output) 구조로
	먼저 입력된 자료를 먼저 출력하며
	Queue 인터페이스를 구현한 클래스는 큐와 관련한 다양한 기능을 제공한다.


※ Queue 인터페이스 인터페이스를 생성하기위해서는
	new 연산자를 이용하여 Queue 인터페이스를 구현한(implements)
	클래스의 생성자를 호출한다.

	ex) Queue ob = new LinkedList();

○ 주요 메소드
	- E element()
		큐의 head 요소를 반환하며 제거하지 않는다.

	-bollean offer(E o)
		지정된 요소를 큐에 삽입한다.

	-E peek()
		큐의 head 요소를 반환하고 삭제하지 않으며
		큐 자료구조가 empty인 경우 null을 반환한다.

	-E poll()
		큐의 head 요소를 반환하고 삭제하며
		큐 자료구조가 empty인 경우 null을 반환한다.

	- E remove()
		큐의 head 요소를 반환하고 삭제한다.

/**모양
				┌ head 요소(출구 바로 직전)
	───────
 →	 □□□□□□	→
	───────
*/
import java.util.Queue;
import java.util.LinkedList;

public class Test156
{
	public static void main(String[] args)
	{
		// Queue 자료구조 생성
		//Queue myQue = new Queue();			//-(X)
		Queue<Object> myQue = new LinkedList<Object>();		//** 업캐스팅 사용해 자료구조 생성

		// 데이터 준비
		String str1 = "김둘리";
		String str2 = "박또치";
		String str3 = "마이클";
		String str4 = "도우너";

		//myQue 라는 Queue 자료구조에 데이터 추가
		myQue.offer(str1);
		myQue.offer(str2);
		myQue.offer(str3);
		//myQue.offer(str4);
		boolean test = myQue.offer(str4);
		System.out.println("test: " + test);
		//--==>> test: true

		// 테스트(확인)
		System.out.println(myQue);
		//--==>> [김둘리, 박또치, 마이클, 도우너]	→ 더미
		//
		//** 실제 데이터가 아니고, 더미형태로 시각적으로 확인할 수 있지만 가져다 쓸 수 없다.

		// Queue 자료구조 myQue에서
		// 요소를 제거하지 않고 head 요소 반환
		System.out.println("값1: "+ (String)myQue.element());
		//** myQue.element()는 오브젝트형이어서 String으로 다운캐스팅함
		System.out.println("값2: "+ (String)myQue.element());
		System.out.println("값3: "+ (String)myQue.element());
		//--==>> 값1: 김둘리
		//		값2: 김둘리
		//		값3: 김둘리

		System.out.println();

		String val;

		// (1)

		/*
		// peek()
		//-- 큐의 head 요소 반환, 제거 안함.
		//	 큐가 empt 일 경우 null을 반환
		while (myQue.peek() != null)		//** myQue.peek(): 확인만
		{
			//poll()
			//-- 큐의 head 요소 반환. 제거함
			// 큐가 empty 일 경우 null을 반환
			val = (String)myQue.poll();		//** myQue.poll(): 확인하고 제거
			System.out.println("요소: " + val);
		}
		System.out.println();
		*/
		//--==>> 요소: 김둘리
		//		요소: 박또치
		//		요소: 마이클
		//		요소: 도우너

		
		// 테스트
		/*
		while (myQue.poll() != null)		//** myQue.poll(): 확인하고 제거
		{
			val = (String)myQue.poll();
			System.out.println("요소: " + val);
		}
		System.out.println();
		//--==>> 요소: 박또치
		//		요소: 도우너
		*/

		// (2)
		/*
		while(true)
		{
			val = (String)myQue.poll();

			if (val == null)		
			{
				break;			// if를 빠져나가는게 아니라 반복문인 while 빠져나감
			}else
			{			
				System.out.println("요소: " + val);
			}

		}
		*/
		//--==>> 요소: 김둘리
		//		요소: 박또치
		//		요소: 마이클
		//		요소: 도우너


		// (3)
		while (!myQue.isEmpty())
		{
			val = (String)myQue.poll();
			System.out.println("요소:" + val);
		}
		System.out.println();
		//--==>> 요소:김둘리
		//		요소:박또치
		//		요소:마이클
		//		요소:도우너



	}
}
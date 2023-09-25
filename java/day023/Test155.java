/* =====================================
■■■ 컬렉션 프레임워크(Collection Framwork) ■■■
=====================================*/

import java.util.Stack;


public class Test155
{
	// 정적 문자열 배열 선언 및 초기화
	private static final String[] colors = {"검정","노랑","초록","파랑","빨강","연두"};

	//생성자
	public Test155()
	{
		// st 라는 Stack 자료구조 생성
		// 제네릭을 활용하여 자료구조에 담기는 데이터에 대한 표현 -> <String>
		Stack<String> st = new Stack<String>();

		// st 라는 Stack 자료구조에 데이터(colors) 담기
		//st = colors;		//-(X)

		/*
		st.push(colors[0]);		//st.add(colors[0]);
		st.push(colors[1]);		//st.add(colors[1]);
		st.push(colors[2]);		//st.add(colors[2]);
		st.push(colors[3]);		//st.add(colors[3]);
		st.push(colors[4]);		//st.add(colors[4]);
		st.push(colors[5]);		//st.add(colors[5]);
		*/

		/*
		for (int i=0; i<colors.length; i++ )
		{
			st.push(colors[i]);
		}
		*/

		for (String color : colors)
		{
			st.push(color);		//st.add(color);
		}

		//st.push(10.0);
		//st.push(10);
		//--==>> 에러 발생(컴파일 에러)
		//-- 제네릭 표현식을 통해 선언하고 있는
		//	 String 이 아닌 다른 자료형(double 이나 int)을
		//		스택 자료구조 st 에 push() 하려고 했기 때문에...

		st.push("보라");

		// 출력 메소드 호출
		popStack(st);

	}


	// 출력 메소드
	private void popStack(Stack<String> st)
	{
		System.out.print("pop: ");
		//System.out.println(st);			//** 컬렉션은 범위가 지원되지만, 하나씩 요소마다 접근해야함
		while(!st.empty())					// isEmpty()
		{
			System.out.print(st.pop() + " ");
		}
		System.out.println();
	}

	public static void main(String[] args)
	{
		new Test155();
	}
}

// 실행 결과
// pop: 연두 빨강 파랑 초록 노랑 검정

// pop: 보라 연두 빨강 파랑 초록 노랑 검정
// 계속하려면 아무 키나 누르십시오 . . .
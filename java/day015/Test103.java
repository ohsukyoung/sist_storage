/* =====================================
■■■ 클래스와 인스턴스 ■■■
- 메소드 중복 정의(Method Overloading)
=====================================*/

/*
	○ 메소드 오버로딩(Method Overloading)의 개요
	메소드 오버로딩이란, 메소드가 처리하는 기능은 같고,
	메소드 괄호 속에 오는 인수(인자, 매개변수,파리미터)의 갯수가 다르거나
	자료형(Data Type)이 다른경우
	메소드의 이름을 동일한 이름으로 부여하여 메소드를 정의할 수 있도록
	문법적으로 허용하게 되는데
	이를 메소드 오버로딩(Method Overloading)이라고 한다.
*/


public class Test103
{
	public static void main(String[] args)
	{
		/*
		// 클래스 메소드라 아래와 같이 축약가능
		Test103 ob = new Test103();
		ob.drawLine();
		*/

		//Test103.drawLine();
		drawLine();
		//---==>> ------------------------

		drawLine('=');
		//--==>> ====================

		drawLine('\\');
		//--==>> \\\\\\\\\\\\\\\\\\\\

		drawLine('+',40);
		//--==>> ++++++++++++++++++++++++++++++++++++++++
	}

	// 선을 그리는 메소드 정의
	public static void drawLine()
	{
		System.out.println("------------------------");
	}

	// 선을 그리는 메소드 정의 → 선의 형태를 바꾸어 그리는 메소드
	//public static void drawLIne()
	public static void drawLine(char c)
	{
		//System.out.println("===================");
		for (int i=0; i<20 ;i++)
		{
			System.out.print(c);
		}
		System.out.println();
	}

	// 선을 그리는 메소드 정의 선의 형태와 길이를 바꾸어 그리는 메소드
	public static void drawLine(char c, int n)
	{
		for(int i=0; i<n; i++)
		{
			System.out.print(c);
		}
		System.out.println();
	}
}
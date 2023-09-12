/* =====================================
■■■ 클래스와 인스턴스 ■■■
- 메소드 중복 정의(Method Overloading)이 가능한 형태와 불가능한 형태
=====================================*/

public class Test104
{
	public static void main(String[] args)
	{
		print('A');

		print(20);

		print(3.14);

		double result = print(3.14);	// 자바는 '='연산자 오른쪽만 확인함
	}

	public static void print(){}
	//public static void print(){}						//--(X)
	public static void print(int i){}
	//public static void print(int j){}					//--(X)
	public static void print(char c){}					//-- 자동 형 변환 규칙 check~!!!
	public static void print(int i, int j){}
	public static void print(double d){}				//-- 자동 형 변환 규칙 check~!!!
	//public static void print(double e){return 10.0;}	//-- 정의 불가
	//public static double print(double e){return 10.0;}//-- (X) check~!!!
	//** 메소드오버로딩 이후에 return이 일어나기 때문에, 문번호28번 X
}
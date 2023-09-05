/* =====================================
■■■ 클래스와 인스턴스 ■■■
=====================================*/

// 사용자로부터 임의의 두 정수와 연산자를 입력받아
// 해당 연산을 수행하는 프로그램을 구현한다.
// 단, 클래스와 인스턴스의 개념을 활용하여 작성할 수 있도록 한다.
// (Calculate 클래스 설계)

// 실행 예)
// 임의의 두 정수 입력(공백 구분)	: 100 51
// 임의의 연산자(+ - * /)			: +

// >> 100 + 51 = 151
// 계속하려면 아무 키나 누르세요...

// 내가 푼 내용 --------------------------
/*
import java.io.IOException;
import java.util.Scanner;

public class Test073
{
	public static void main(String[] args) throws IOException
	{
		Oper ob = new Oper();

		ob.input();
		ob.operat();
		ob.print();
	}
}

class Oper
{
	int a, b, total;
	char op;

	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("임의의 두 정수 입력(공백 구분): ");
		a = sc.nextInt();
		b = sc.nextInt();
		System.out.print("임의의 연산자(+ - * /): ");
		op = (char)System.in.read();

	}

	void operat()
	{
		switch(op)
		{
			case '+': total = a + b; break;
			case '-': total = a - b; break;
			case '*': total = a * b; break;
			case '/': total = a / b; break;
		}
	}

	void print()
	{	
		System.out.printf(">> %d %c %d = %d\n", a, op, b, total);
	}
}
*/

// 함께 푼 내용 --------------------------
import java.io.IOException;
import java.util.Scanner;

public class Test073
{
	public static void main(String[] args) throws IOException
	{
		Calculate ob = new Calculate();	//-- 생성한 인스턴스를 통한 입력 메소드 호출
		ob.input();						//									연산
		ob.print(ob.cal());				//									출력
	}
}

class Calculate
{
	// 주요변수 선언
	int su1, su2;	//-- 사용자로부터 입력받은 두 정수를 담아낼 변수
	char op;				//-- 사용자로부터 입력받은 연산자를 담아낼 변수
	int result;

	// 메소드 정의(기능: 입력)
	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("임의의 두 정수 입력(공백 구분): ");
		su1 = sc.nextInt();
		su2 = sc.nextInt();
		System.out.print("임의의 연산자(+ - * /): ");
		op = (char)System.in.read();

	}

	// 메소드의 정의(기능: 연산) → 나눗셈 연산도 정수 기반으로 처리
	int cal()
	{
		result = -1;
		switch(op)
		{
			case '+': result = su1 + su2; break;
			case '-': result = su1 - su2; break;
			case '*': result = su1 * su2; break;
			case '/': result = su1 / su2; break;
			// default: result = -1;
		}
		return result;
	}

	// 메소드 정의(기능: 출력)
	void print(int s)
	{	
		System.out.printf(">> %d %c %d = %d\n", su1, op, su2, result);
	}
}
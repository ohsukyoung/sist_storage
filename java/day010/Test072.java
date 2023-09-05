/* =====================================
■■■ 클래스와 인스턴스 ■■■
=====================================*/

/*
사용자로부터 임의의 정수를 입력받아
1 부터 입력받은 수까지의 합을 연산하여
그 결과값을 출겨하는 프로그램을 구현한다.

단, 지금까지 처럼 main()메소드에 모든 기능을 적용하는 것이 아니라
클래스와 인스턴스의 개념을 활용하여 처리할 수 있도록 한다.
(Hap 클래스 설계)
또한, 데이터 입력 처리 과정에서 BufferedReader의 readLine()을 사용하며,
입력 데이터가 1보다 작거나 1000보다 큰 경우
다시 입력받을 수 있는 처리를 포함하여 프로그램을 구현할 수 있도록 한다.

실행 예)
임의의 정수 입력(1~1000): 1200
임의의 정수 입력(1~1000): -50
임의의 정수 입력(1~1000): 100
>> 1~ 100까지의 합: 5050
// 계속하려면 아무 키나 누르세요...
*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

// 내가 푼 내용 --------------------------
/*
public class Test072
{
	public static void main(String[] args) throws IOException
	{
		
		AddNum ob = new AddNum();
		int n;
		int sumBox;

		n = ob.input();
		sumBox = ob.sum();

		ob.print(n,sumBox);
	}
}

class AddNum
{
	int add_n;
	int add_sumBox;

	int input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		do{
			System.out.print("임의의 정수 입력(1~1000): ");
			add_n = Integer.parseInt(br.readLine());
		}while(add_n<=0 || add_n>1000);
		return add_n;
	}
	int sum()
	{
		add_sumBox=0;
		for(int i=0; i<=add_n; i++)
		{
			add_sumBox += i;
		}
		return add_sumBox;
	}
	void print(int x, int y)
	{
		System.out.printf(">> 1~ %d까지의 합: %d\n", x, y); 
	}
}
*/

// 함께 푼 내용 --------------------------
class Hap
{
	// 주요 변수 선언(사용자의 입력값을 담아낼 변수)
	int su;

	//입력 메소드 정의
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		do{
			System.out.print("임의의 정수 입력(1~1000): ");
			su = Integer.parseInt(br.readLine());
		}while(su<1 || su>1000);
	}

	// 연산 처리 메소드 정의
	int calculate()
	{
		int result = 0;
		for( int i=1; i<=su; i++)
			result += i;
		return result;
	}

	// 결과 출력 메소드 정의
	void print(int sum)
	{
		System.out.printf("\n>> 1 ~ %d 까지의 합: %d\n", su, sum);
	}

}

public class Test072
{
	public static void main(String[] args) throws IOException
	{
		// Hap 인스턴스 생성
		Hap ob = new Hap();

		// 생성된 인스턴스를 통해 입력 메소드 호출
		// ---------------
		// 참조변수 활용

		ob.input();		//-- new Hap().input();

		// 생성된 인스턴스를 통해 연산 메소드 호출
		int s = ob.calculate();

		// 생성된 인스턴스를 통해 출력 메소드 호출
		// ob.print(ob.calculate());
		ob.print(s);

	}
}
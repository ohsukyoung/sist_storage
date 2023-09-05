/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - switch 실습
=====================================*/

// 사용자로부터 1 부터 3 까지의정수 중 하나를 입력받아
// 입력 받은 정수만큼의 별문자(★)가 출력되는 프로그램을 작성한다.
// 단, 두가지 방법으로 구현할 수 있도록 한다.

// ① switch문의 일반 모델을 사용하여 구현한다.
// ② switch문의 기본 모델을 사용하되,
// 『break』를 딱 한번만 사용할 수 있도록 구현한다.

// 실행 예)
// 임의의 정수 입력(1~3): 3
// ★★★
// 계속하려면 아무 키나 누르세요...

// 임의의 정수 입력(1~3): 1
// ★
// 계속하려면 아무 키나 누르세요...

// 임의의 정수 입력(1~3): 7
// 입력 오류~!!
// 계속하려면 아무 키나 누르세요...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test041
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// 내가 푼 내용 --------------------------
		/*
		int num;

		System.out.print("임의의 정수 입력(1~3): ");
		num = Integer.parseInt(br.readLine());
		
		// 방법①
		//switch(num)
		//{
		//	case 1: System.out.println("★"); break;
		//	case 2: System.out.println("★★"); break;
		//	case 3: System.out.println("★★★"); break;
		//	default : System.out.println("입력오류~!!"); break;
		//}

		// 방법②
		 switch(num)
		{
			default : System.out.println("입력오류~!!"); break;
			case 3: System.out.printf("★");
			case 2: System.out.printf("★");
			case 1: System.out.printf("★");
		}
		System.out.println();
		*/

		// 함께 푼 내용 --------------------------
		int n;

		System.out.print("임의의 정수 입력(1~3): ");
		n = Integer.parseInt(br.readLine());

		//①
		switch(n)
		{
			case 1: System.out.println("★"); break;
			case 2: System.out.println("★★"); break;
			case 3: System.out.println("★★★"); break;
			default : System.out.println("입력오류~!!!"); //break;
		}

		//②
		switch(n)
		{
			default : System.out.println("입력오류~!!"); break;
			case 3: System.out.printf("★");
			case 2: System.out.printf("★");
			case 1: System.out.printf("★");

		}

	}
}
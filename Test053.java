/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - 반복문(while문) 실습 및 관찰
=====================================*/

// 사용자로부터 원하는 단(구구단)을 입력받아
// 해당하는 구구단을 출력하는 프로그램을 구현한다.
// 단, 1단 ~ 9단 사이의 수를 입력받은 상황이 아니라면
// 이에 대한 안내를 한 후 프로그램을 종료할 수 있도록 처리한다.

// 실행 예)
// 원하는 단(구구단) 입력: 7
// 7 * 1 = 7
// 7 * 2 =14
//  ：
//7 * 9 = 63
// 계속하려면 아무 키나 누르세요...

// 원하는 단(구구단) 입력: 11
// 1부터 9까지의 정수만 입력이 가능합니다.
// 계속하려면 아무 키나 누르세요...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test053
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 내가 푼 내용 --------------------------
		/*
		int n=0;
		int i=1;
		System.out.print("원하는 단(구구단) 입력: ");
		n = Integer.parseInt(br.readLine());
		if(n>0 && n<10)
		{	
			while(i<10)
			{
				System.out.printf("%d * %d = %d\n", n, i, n*i);
				i++;
			}
		}else{
			System.out.printf("1부터 9까지의 정수만 입력이 가능합니다.\n");
		}
		*/

		// 함께 푼 내용 --------------------------
		int dan;		//-- 사용자로부터 입력값을 정수 형태로 담아둘 변수(단)

		// 연산 및 처리
		System.out.print("원하는 단(구구단) 입력: ");
		dan = Integer.parseInt(br.readLine());

		if (dan<1 || dan>9)
		{
			System.out.println("1부터 9까지의 정수만 입력이 가능합니다.");
			return;
		}

		int n=0;
		// 결과출력(반복 출력)
		while(n<9)		// 0 1 2 3 4 5 6 7 8 
		{ 
			n++;
			System.out.printf("%d * %d = %d\n", dan, n,(dan*n));
		}

	}
} 

// 실행 결과
/*
원하는 단(구구단) 입력: 9
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81
계속하려면 아무 키나 누르십시오 . . .
*/
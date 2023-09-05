/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
=====================================*/

// break 실습

// 다음과 같은 처리가 이루어지는 프로그램을 구현한다.
// 단, 입력받는 정수는 1~100 범위 안에서만
// 가능하도록 처리한다.

// 실행 예)
//
// 임의의 정수 입력: -10
//
// 임의의 정수 입력: 0
//
// 임의의 정수 입력: 2023
//
// 임의의 정수 입력: 10
// >> 1 ~ 10 까지의 합: 55
// 계속하시겠습니까?(Y/N)?: y
//
// 임의의 정수 입력: 100
// >> 1 ~ 100 까지의 합: 5050
// 계속하시겠습니까?(Y/N)?: N
// 계속하려면 아무 키나 누르세요... → 프로그램 종료
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test064
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// 내가 푼 내용 --------------------------
		/*
		int num=0;		//입력받을 변수
		int sum=0;		//합계
		char check='y';	//계속할지 여부

		do{
			System.out.print("\n임의의 정수 입력: ");
			num = Integer.parseInt(br.readLine());

			if(num>0 && num<=100){
				sum=0;
				for(int i=0; i<=num; i++)
				{
					sum += i;
				}
				System.out.printf(">> 1 ~ %d 까지의 합: %d\n", num, sum);

				System.out.print("계속하시겠습니까?(Y/N)?: ");
				check = (char)System.in.read();
				System.in.skip(2);
			}
		}while(check=='Y' || check=='y');
		*/

		// 함께 푼 내용 --------------------------
		// check~!!
		// 누적합 변수의 초기화 위치~!!
		int n,s=0,i;
		//-- n: 사용자 입력값을 담아둘 변수
		//   s: 누적합 연산 결과를 담아낼 변수
		//   i: 1부터 1씩 사용자의 입력값까지 증가하게 될 변수

		char ch;
		//-- 프로세스를 계속 진행할지 말지의 여부를 담아둘 변수
		
		
		while(true)
		{
			//무한 반복(무한 루프)

			do
			{
				System.out.print("\n임의의 정수 입력: ");
				n = Integer.parseInt(br.readLine());
			}
			while (n<1 || n>100);

			//테스트
			//System.out.println("유효한 정수 입력 완료~!!!");

			//누적합 변수의 초기화 위치 check~!!!
			s = 0;

			for(i=1; i<=n; i++)
			{
				s += i;		//-- 누적합 연산
			}
			System.out.printf(">> 1 ~ %d 까지의 합: %d\n", n, s);

			System.out.print("계속하시겠습니까?(Y/N)?: ");	//y Y
			//-- y,n 대소문자입력할 수 있도록 ui상으로 고려할 것
			ch = (char)System.in.read();
			//-- 계속할지 말지에 대한 여부(의사표현)

			// 그만할래 → 빠져나감
			//if(ch == 'N' || ch == 'n')	//-- N또는 n 입력한 거 맞아???
			//
			if(ch!='Y' && ch!='y')			//-- Y또는 y 입력한게 아닌거 맞아???
			{
				// 반복문을 멈추고 빠져나갈 수 있는 코드 작성 필요
				//-- 즉, 위와 같은 의사 표현을 했다면
				// 그동안 수행했던 반복문을 멈추고 빠져나가야 한다.
				break;
				//-- 멈춘다. + (그리고 빠져나간다) check;
				// if를 빠져나가는게 아니라 감싸고 있는 while을 빠져나감

			}//end if

			//엔터값(\r\n) 처리 / NumberFormatException 에러
			System.in.skip(2);

		}// end while(true)

	}
}

//실행결과
/*

임의의 정수 입력: 10
>> 1 ~ 10 까지의 합: 55
계속하시겠습니까?(Y/N)?: y

임의의 정수 입력: 100
>> 1 ~ 100 까지의 합: 5050
계속하시겠습니까?(Y/N)?: y

임의의 정수 입력: 10
>> 1 ~ 10 까지의 합: 55
계속하시겠습니까?(Y/N)?: n
계속하려면 아무 키나 누르십시오 . . .
*/
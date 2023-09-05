/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - 반복문(while문) 실습 및 관찰
=====================================*/

// ○ 과제
// 사용자로부터 임의의 정수를 입력받아
// 1부터 입력받은 그 정수까지의
// 전체 합과, 짝수의 합과, 홀수의 합을 
// 각각 결과값으로 연산하여 출력하는 프로그램을 구현한다.

// 실행 예)
// 임의의 정수 입력: 396
// >> 1 ~ 396 까지 정수의 합: xxxxx
// >> 1 ~ 396 까지 짝수의 합: xxxx
// >> 1 ~ 396 까지 홀수의 합: xxxx
// 계속하려면 아무 키나 누르세요...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test052
{
	public static void main(String[] args) throws IOException
	{
		//주요 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int i;				// 루프변수
		int num;			// 임의의 정수
		int sumBox;			// 정수합
		int even;			// 짝수합
		int odd;			// 홀수합
		i = num = sumBox = even = odd = 0;	// 변수 0 으로 초기화

		// 연산 및 처리
		System.out.print("임의의 정수 입력: ");
		num = Integer.parseInt(br.readLine());

		while(++i<=num)		// 입력받은 변수보다 같거나 작을 때
		{
			sumBox += i;	// 정수의 합
			if(i%2==0){		// 짝수일 경우
				even += i;	// 짝수의 합
			}else{			// 홀수인 경우
				odd += i;	// 홀수의 합
			}
		}

		// 결과 출력
		System.out.printf(">> 1 ~ %d 까지의 정수의 합: %d\n", num, sumBox);
		System.out.printf(">> 1 ~ %d 까지의 짝수의 합: %d\n", num, even);
		System.out.printf(">> 1 ~ %d 까지의 홀수의 합: %d\n", num, odd);
	}
}
// 실행 결과
/*
임의의 정수 입력: 396
>> 1 ~ 396 까지의 정수의 합: 78606
>> 1 ~ 396 까지의 짝수의 합: 39402
>> 1 ~ 396 까지의 홀수의 합: 39204
계속하려면 아무 키나 누르십시오 . . .
*/

/* =====================================
■■■ 배열 ■■■
- 배열의 선언과 초기화
- 배열의 기본적 활용
=====================================*/

// ○ 과제
//사용자로부터 임의의 정수를 임의의 갯수만큼 입력받아
//입력받은 수 중에서 가장 큰 수를 출력하는 프로그램을 구현한다.
//단, 배열을 활용하여 구현할 수 있도록 한다.

//실행 예)
//입력할 데이터의 갯수 : 11
//데이터 입력(공백 구분) : 45 11 26 35 66 97 50 2 123 10 7

// >> 가장 큰 수 → 123
// 계속하려면 아무 키나 누르세요...
import java.util.Scanner;

public class Test083
{
	public static void main(String[] args)
	{
		// Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);
		int count;			// 사용자가 입력하는 데이터 수를 담아낼 변수

		// 연산 및 처리
		System.out.print("입력할 데이터의 갯수: ");
		count = sc.nextInt();

		int[] arr = new int[count];

		System.out.print("데이터 입력(공백 구분) : ");
		for(int i=0; i<count; i++)
		{
			arr[i] = sc.nextInt();
		}

		// 정렬: 제일 큰 수를 앞으로
		for(int j=count; j>0; j--)
		{
			for(int i=0; i<count-1; i++)
			{
				if(arr[i]<arr[i+1])
				{
					arr[i]	= arr[i]^arr[i+1];
					arr[i+1]= arr[i+1]^arr[i];
					arr[i]	= arr[i]^arr[i+1];
				}
			}
		}

		// 결과 출력
		System.out.printf(">> 가장 큰 수 → %d\n",arr[0]);		
	}
}

// 실행 결과
/*
입력할 데이터의 갯수: 11
데이터 입력(공백 구분) : 45 11 26 35 66 97 50 2 123 10 7
>> 가장 큰 수 → 123
계속하려면 아무 키나 누르십시오 . . .
*/
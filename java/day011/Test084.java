/* =====================================
■■■ 배열 ■■■
- 배열의 선언과 초기화
- 배열의 기본적 활용
=====================================*/

/* 
 ○ 과제
	사용자로부터 임의의 학생 수를 입력 받고
	그만큼의 점수(정수 형태)를 입력받아
	전체 학생 점수의 합, 평균, 편차를 구해서
	결과를 출력하는 프로그램을 구현한다.

	실행 예)
	학생 수 입력: 5
	1번 학생의 점수 입력: 90
	2번 학생의 점수 입력: 82
	3번 학생의 점수 입력: 64
	4번 학생의 점수 입력: 36
	5번 학생의 점수 입력: 98


	// >> 합: 370
	// >> 평균: 74.0
	// >> 편차
	// 90 : -16.0
	// 72 : -8.0
	// 64 : 10.0
	// 36 : 38.0
	// 98 : -24.0
	//계속하려면 아무 키나 누르세요...
*/


import java.util.Scanner;

public class Test084
{
	public static void main(String[] args)
	{
		// 주요 변수 선언 및 초기화
		Scanner sc = new Scanner(System.in);
		int count, sum=0;		// 입력받은 학생수, 합계
		double avg;				// 평균

		// 연산 및 처리
		System.out.print("학생 수 입력: ");
		count = sc.nextInt();
		
		// 입력받은 값으로 배열 선언
		int[] arr = new int[count];					// 입력받은 값 넣을 배열
		double[] dev_arr = new double[arr.length];	// 변량 넣을 배열
		// 편차: 변량- 전체평균값

		// 학생점수 입력 & 합계 계산
		for(int i=0; i<count; i++)
		{
			System.out.printf("%d번 학생의 점수 입력: ",i+1);
			arr[i] = sc.nextInt();
			sum += arr[i];
		}
		
		// 평균계산
		avg = (double)sum/arr.length;
		
		// 편차계산(편차 = 평균 - 입력받은값) 
		for(int i=0; i<count; i++)
		{
			dev_arr[i] = avg-arr[i];
		}
		
		// 결과 출력
		System.out.printf(">> 합: %d\n",sum);
		System.out.printf(">> 평균: %.1f\n",avg);
		System.out.println(">> 편차");
		for(int i=0; i<count; i++)
		{
			System.out.printf("%d : %.1f\n",arr[i],dev_arr[i]);
		}
	}
}

// 실행 결과
/*
학생 수 입력: 5
1번 학생의 점수 입력: 90
2번 학생의 점수 입력: 82
3번 학생의 점수 입력: 64
4번 학생의 점수 입력: 36
5번 학생의 점수 입력: 98
>> 합: 370
>> 평균: 74.0
>> 편차
90 : -16.0
82 : -8.0
64 : 10.0
36 : 38.0
98 : -24.0
*/
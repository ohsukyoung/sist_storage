/* =====================================
■■■ 배열 ■■■
- 배열과 난수 처리(※ Random 클래스 활용)
=====================================*/

// 사용자로부터 임의의 정수를 입력받아
// 그 수 만큼 난수(1~100)를 발생시켜 배열에 담고
// 배열에 담겨있는 데이터들 중
// 가장 큰 값과 가장 작은 값을 선택하여
// 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
// 발생시킬 난수의 갯수 입력: 10
// (50 7 24 81 72 45 61 38 1 99 → 무작위로 발생한 정수들)
// (int[] arr = {50, 7, 24,81,72,45,61,38,1,99} → 배열에 담아내기(배열구성))
// 가장 큰 값: 99, 가장 작은 값: 1
// 계속하려면 아무 키나 누르세요...

import java.util.Scanner;
import java.util.Random;

public class Test095
{
	public static void main(String[] args)
	{
		//Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		//주요 변수 선언
		int size;		//-- 사용자의 입력값을 담아낼 변수
		
		//안내 메세지 출력
		System.out.print("발생시킬 난수의 갯수 입력: ");
		size = sc.nextInt();

		//입력받은 size 만큼의 배열방 만들기(배열 길이)
		// (배열 선언 및 메모리 할당)
		int[] arr = new int[size];

		//무작위 정수(난수)를 발생시키기 위해서는
		//난수 발생 전용 객체가 필요하다.
		// → 『java.util.Random』
		Random rd = new Random();
		//-- Random 인스턴스 생성

		//※ Random 클래스의 『nextInt()』 메소드
		// 0~매개변수로 넘겨받은 정수 n-1까지의 수 중
		// 무작위 정수(난수) 1개를 발생시킨다.

		//ex.) rd.nextInt(10);	//-- 0~9 중 난수 1개 발생

		//테스트(확인)
		System.out.println("발생한 난수: " + rd.nextInt(10));
		//-- 0~0 까지의 범위 내에서 무작위 정수 한 개 발생~!!!

		// 배열 구성
		//for(int i=0; i<arr.lenght; i++)
		for(int i=0; i<size; i++)
		{
			//rd.nextInt(101);	
			//-- 0 ~ 100중 1개

			rd.nextInt(100);
			//-- 0 ~ 99 중 1개

			arr[i] = rd.nextInt(100)+1;
			//		 ------------
			//			 0 ~ 99
			//		 ------------------
			//			 1 ~ 100
		}
		for(int i=0; i<size; i++)
			System.out.printf("%4d",arr[i]);
		System.out.println();
		//--==>>
		/*
		발생시킬 난수의 갯수 입력: 8
		발생한 난수: 1
		  98  16  92  60 100  97  70  82
		계속하려면 아무 키나 누르십시오 . . .
		*/

		//------------------------------------------- 여기까지 수행하면 배열 구성 완료~!!!

		// 가장 작은 값, 가장 큰 값 출력~!!!
		// 내가 푼 내용 --------------------------
		/*
		int min , max;
		min = max = arr[0];
		for(int i=0; i<size; i++)
		{
			if(min>arr[i])
			{
				min=arr[i];
			}
			if(max<arr[i])
			{
				max=arr[i];
			}
		}
		System.out.println("가장 큰 값: "+max+", 가장 작은 값: "+min);
		*/

		// 함께 푼 내용 --------------------------
		// 가장 작은 값, 가장 큰 값 출력~!!!
		int max, min;			//-- 최대값, 최소값
		max = min = arr[0];		//-- arr[0]의 값을 min에 대입하고
								//   min의 값을 max에 대입
		for(int i=1; i<arr.length; i++)
		{
			if(max < arr[i])
				max = arr[i];
			if(min > arr[i])
				min = arr[i];
		}
		System.out.println("가장 큰 값: "+max+", 가장 작은 값: "+min);
	}
}
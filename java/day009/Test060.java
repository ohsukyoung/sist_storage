/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - 반복문(for문) 실습 및 관찰
=====================================*/

// ○ 다중 for문(반복문의 중첩)을 활용한 별찍기 실습

// ○ 과제
// 다음과 같은 내용이 출력될 수 있도록
// 반복문의 중첩 구문을 작성하여 프로그램을 구현한다.

// 실행 예)
/*
    *
   **
  ***
 ****
*****

*/

public class Test060
{
	public static void main(String[] args){
	
		// 주요 변수 선언 및 초기화
		int num=5;	//-- 열 개수
		int i;		//-- 열 개수 루프 변수
		int j;		//-- " " 개수(공백)
		int k;		//-- "*" 개수

		// 연산 및 처리 & 결과 출력
		for(i=1; i<=num; i++)			// 5열까지 반복, 입력값: 1 2 3 4 5
		{
			for(j=1; j<=num-i; j++)
			// (열 개수 - 현재 행의 숫자)까지 실행 : 행의 값이 높아질 수록 " "입력 수가 줄어듦
			{
				System.out.print(" ");	// " "출력
			}

			for(k=1; k<=i; k++)
			// (현재 행의 숫자)까지 실행 : 행의 값이 높아질 수록 "*"입력 수가 늘어남
			{
				System.out.print("*");	// "*"출력
			}
			System.out.println();		// 개행
		}

	}
}

//실행 결과
/*
    *
   **
  ***
 ****
*****
*/
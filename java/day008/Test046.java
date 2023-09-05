/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - 반복문 실습 및 관찰
=====================================*/

// 실행 예)
// 1부터 100까지 정수의 합: xxx
// 1부터 100까지 짝수의 합: xxx
// 1부터 100까지 홀수의 합: xxx
// 계속하려면 아무 키나 누르세요...

public class Test046
{
	public static void main(String[] args){
		// 내가 푼 내용 --------------------------
		/*
		int num = 1;
		int numBox = 0, sum = 0, minus = 0;

		while(num<=100)
		{
			numBox += num;
			if(num%2==0)
			{
				sum += num;
			}else if(num%2!=0)
			{
				minus += num;
			}else
			{
				System.out.println("오류");
			}
			num++;
		}
		System.out.println("1부터 100까지 정수의 합: " + numBox);
		System.out.println("1부터 100까지 짝수의 합: " + sum);
		System.out.println("1부터 100까지 홀수의 합: " + minus);
		*/

		// 함께 푼 내용 --------------------------
		// 주요 변수 선언 및 초기화
		int n=1, sum, odd, even;
		sum=odd=even=0;

		// 연산 및 처리
		while(n<=0)
		{
			sum += n;

			if(n%2==0)
				even += n;
			else if(n%2!=0)
				odd +=n;
			else
			{
				System.out.println("판별할 수 없는 데이터");
				return;
			}

			n++;
		}

		System.out.println("1부터 100까지 정수의 합: " + sum);
		System.out.println("1부터 100까지 짝수의 합: " + even);
		System.out.println("1부터 100까지 홀수의 합: " + odd);

	}
}
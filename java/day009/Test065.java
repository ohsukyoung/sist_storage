/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
=====================================*/

// continue 실습

// continue 를 활용하여
// 다음과 가튼 처리와 출력이 이루어 질 수 있도록
// 프로그램을 구현한다.

// 실행 예)
/*
1 : 1
3 : 4
5 : 9
7 : 16
9 : 25
 :
99 : 2500
계속하려면 아무 키나 누르세요...
*/

// 홀수의 갯수만큼 더한다

public class Test065
{
	public static void main(String[] args)
	{	
		// 내가 푼 내용 --------------------------
		//방법①
		/*
		int sum=0;

		for(int i=1; i<=99; i+=2)
		{
			sum+=i;
			System.out.println(i + " : " + sum);
		}
		*/		

		//방법②
		/*
		int sum=0;

		for(int i=1; i<=99; i++)
		{
			if(i%2==0){
				continue;
			}
			sum+=i;
			System.out.println(i + " : " + sum);
		}
		*/

		// 함께 푼 내용 --------------------------
		int n=0, s=0;

		while(n<100)
		{
			n++;
			if(n%2==0)								//-- n이 짝수라면
				continue;							//-- (뒷부분 무시하고) + 계속해라

			s+=n;									//-- 뒷부분
			System.out.println(i + " : " + sum);	//-- 뒷부분
		}
		

	}
}
/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - 반복문(for문) 실습 및 관찰
=====================================*/

// 1 부터 100까지의 정수중에서
// 4의 배수만 출력하는 프로그램을 구현한다.
// 단, for문을 활용해야 하며
// 한 줄에 5개씩만 출력할 수 있도록 한다.

// 실행 예)
// 4	8	12	16	20
// 24	28	32	36	40
//			：
//				...100

public class Test057
{
	public static void main(String[] args)
	{
		for(int i=4; i<101;i+=4)
		{
			System.out.printf("%4d", i);
			if(i%(4*5)==0)				//-- 출력 구문이 4*5의 배수가 될 때마다
				System.out.println();	//-- 개행
		}

		
	}
}
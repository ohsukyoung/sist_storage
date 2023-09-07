/* =====================================
■■■ 배열 ■■■
- 배열의 배열
=====================================*/

// ○ 과제
// 배열의 배열(다차원 배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.

//실행 예)
/*
  A
  C  B
  D  E  F
  J  I  H  G
  K  L  M  N  O
*/

// 두번째, 네번째 역방향

public class Test094
{
	public static void main(String[] args)
	{
		// 배열의 배열 선언 및 메모리 할당
		int[][] arr = new int[5][5];

		// 배열구성
		int a = 'A';							//65
		for(int i=0; i<arr.length; i++)			// 웅~~~~~ i → 0    1    2    3    4
		{
			for(int j=0; j<i+1; j++)			// 숑숑숑  j → 0    10   012  3210 01234
			{
				if(i%2==0)						// 짝수행 일때 정상 출력
					arr[i][j] = a;
				else							// 홀수행 일때 행-열
					arr[i][i-j] = a;
				a++;
			}
		}

		// 배열 전체 요소 출력
		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%3c ",(char)arr[i][j]);
			}
			System.out.println();
		}
	}
}

//실행 결과
/*
  A
  C   B
  D   E   F
  J   I   H   G
  K   L   M   N   O
계속하려면 아무 키나 누르십시오 . . .
*/
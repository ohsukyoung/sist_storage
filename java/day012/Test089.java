/* =====================================
■■■ 배열 ■■■
- 배열의 배열
=====================================*/

// 배열의 배열(다차원 배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.

//실행 예)
/*
  1  8  9 16 17 → 00  01  02  03  04
  2  7 10 15 18 → 10  11  12  13  14
  3  6 11 14 19 → 20  21  22  23  24
  4  5 12 13 20 → 30  31  32  33  34

  n → 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
*/
public class Test089
{
	public static void main(String[] args)
	{
		// 내가 푼 내용 --------------------------
		/*
		int[][] arr = new int[4][5];
	
		int n = 1;
		for(int j=0; j<5; j++)		// 0 1 2 3 4 → 1234가 위에서 아래로 흐르기 때문에 J
		{
			for(int i=0; i<4; i++)	// 0 1 2 3
			{
				if(j%2==0)
					arr[i][j] = n;
				else
					arr[3-i][j] = n;		
				n++;
			}
		}

		System.out.println();
		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%3d ",arr[i][j]);
			}
			System.out.println();
		}
		*/

		// 함께 푼 내용 --------------------------
		//배열의 배열 선언 및 메모리 할당
		int[][] arr = new int[4][5];

		int n = 0;

		for(int i=0; i<5; i++)		//outer 웅~~~~   i → 0 1 2 3 4
		{
			for(int j=0; j<4; j++)	//inner 숑숑숑숑 j → 0 1 2 3
			{			
				n++;
				if(i%2==0)
					arr[j][i] = n;
				else
					arr[3-j][i] = n;
			}
		}
		
		// 전체 요소 출력
		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%3d ",arr[i][j]);
			}
			System.out.println();
		}
	}
}
// 실행 결과
/*
  1   8   9  16  17
  2   7  10  15  18
  3   6  11  14  19
  4   5  12  13  20
계속하려면 아무 키나 누르십시오 . . .
*/
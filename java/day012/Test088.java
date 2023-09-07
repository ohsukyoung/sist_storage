/* =====================================
■■■ 배열 ■■■
- 배열의 배열
=====================================*/

// 배열의 배열(다차원 배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.

//실행 예)
/*
  1  2  3  4  5 → 00  01  02  03  04
  5  1  2  3  4 → 10  11  12  13  14
  4  5  1  2  3 → 20  21  22  23  24
  3  4  5  1  2 → 30  31  32  33  34
  2  3  4  5  1 → 40  41  42  43  44

  1  2  3  4  5		i=0 → 12345	→ 0 위치부터 출발 → i 위치
  5  1  2  3  4		i=1 → 12345	→ 1 위치부터 출발 → i 위치
  4  5  1  2  3		i=2 → 12345	→ 2 위치부터 출발 → i 위치
  3  4  5  1  2		i=3 → 12345	→ 3 위치부터 출발 → i 위치
  2  3  4  5  1		i=4	→ 12345	→ 4 위치부터 출발 → i 위치

			  0으로
  1  2  3  4  5 | 
     1  2  3  4 |  5
        1  2  3 |  4   5
           1  2 |  3   4   5
              1 |  2   3   4   5
*/

public class Test088
{
	public static void main(String[] args)
	{

		// 내가 푼 내용 --------------------------
		/*
		int[][] arr = new int[5][5];

		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				if(i<=j)					//-- i가 j보다 작거나 같을 때
					arr[i][j] = j-i+1;		//	j값 - i값 + 1
					
				else						//-- i가 j보다 클 때
					arr[i][j] = (arr[i].length+1)-i+j;
											//	(열의 개수+1) - i값 + j값

			}
		}

		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%2d ",arr[i][j]);
			}
			System.out.println();
		}
		*/
		

		// 다른사람이 푼 내용 --------------------------
		/*
		int n=1;
		int[][] arr = new int[5][5];

		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				if(n==6)
					n=1;
				arr[i][j] = n;
				n++;

			}
			n--;
		}
		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%2d ",arr[i][j]);
			}
			System.out.println();
		}
		*/
		
		// 함께 푼 내용 --------------------------
		// 배열의 배열 선언 및 메모리 할당
		int [][] arr = new int[5][5];

		for (int i=0; i<arr.length ; i++)	// i → 0 1 2 3 4
		{
			for (int n=1,j=i; n<=5 ; n++)	// n → 1 2 3 4 5 → 넣을 값
			{
				//테스트(확인)
				//System.out.print(""+i+","+j+"["+n+"]");
				arr[i][(j%5)] = n;
				j++;

				//if(j==5)
				//	j=0;
			}
			//System.out.println();
		}

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
  1   2   3   4   5
  5   1   2   3   4
  4   5   1   2   3
  3   4   5   1   2
  2   3   4   5   1
계속하려면 아무 키나 누르십시오 . . .
*/
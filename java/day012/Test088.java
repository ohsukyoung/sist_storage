/* =====================================
���� �迭 ����
- �迭�� �迭
=====================================*/

// �迭�� �迭(������ �迭)�� Ȱ���Ͽ�
// ������ ���� �����͸� ��ҷ� ���ϴ� �迭�� �����ϰ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.

//���� ��)
/*
  1  2  3  4  5 �� 00  01  02  03  04
  5  1  2  3  4 �� 10  11  12  13  14
  4  5  1  2  3 �� 20  21  22  23  24
  3  4  5  1  2 �� 30  31  32  33  34
  2  3  4  5  1 �� 40  41  42  43  44

  1  2  3  4  5		i=0 �� 12345	�� 0 ��ġ���� ��� �� i ��ġ
  5  1  2  3  4		i=1 �� 12345	�� 1 ��ġ���� ��� �� i ��ġ
  4  5  1  2  3		i=2 �� 12345	�� 2 ��ġ���� ��� �� i ��ġ
  3  4  5  1  2		i=3 �� 12345	�� 3 ��ġ���� ��� �� i ��ġ
  2  3  4  5  1		i=4	�� 12345	�� 4 ��ġ���� ��� �� i ��ġ

			  0����
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

		// ���� Ǭ ���� --------------------------
		/*
		int[][] arr = new int[5][5];

		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				if(i<=j)					//-- i�� j���� �۰ų� ���� ��
					arr[i][j] = j-i+1;		//	j�� - i�� + 1
					
				else						//-- i�� j���� Ŭ ��
					arr[i][j] = (arr[i].length+1)-i+j;
											//	(���� ����+1) - i�� + j��

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
		

		// �ٸ������ Ǭ ���� --------------------------
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
		
		// �Բ� Ǭ ���� --------------------------
		// �迭�� �迭 ���� �� �޸� �Ҵ�
		int [][] arr = new int[5][5];

		for (int i=0; i<arr.length ; i++)	// i �� 0 1 2 3 4
		{
			for (int n=1,j=i; n<=5 ; n++)	// n �� 1 2 3 4 5 �� ���� ��
			{
				//�׽�Ʈ(Ȯ��)
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
// ���� ���
/*
  1   2   3   4   5
  5   1   2   3   4
  4   5   1   2   3
  3   4   5   1   2
  2   3   4   5   1
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
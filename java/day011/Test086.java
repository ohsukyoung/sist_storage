/* =====================================
���� �迭 ����
- �迭�� �迭
=====================================*/

// �迭�� �迭(������ �迭)�� Ȱ���Ͽ�
// ������ ���� �����͸� ��ҷ� ���ϴ� �迭(5*5)�� �����ϰ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
/*
 1  2  3  4  5	//-- 00 01 02 03 04
 6  7  8  9 10	//-- 10 11 12 13 14
11 12 13 14 15	//--
16 17 18 19 20	//--
21 22 23 24 25	//-- 40 41 42 43 44
*/

public class Test086
{
	public static void main(String[] args)
	{
		/*
		int count = 5;
		int n=1;
		int[][] arr = new int[count][count];

		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr.length; j++)
			{
				arr[i][j] = n;
				n++;
				
			}
		}


		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr.length; j++)
			{
				System.out.printf("%2d ",arr[i][j]);
			}
			System.out.println();
		}
		*/

		// �迭�� �迭 ����
		//int[][] arr;

		// �迭�� �迭 �޸� �Ҵ�
		//arr = new int[5][5];

		// �迭�� �迭 ���� + �޸� �Ҵ�
		int[][] arr = new int[5][5];

		//���� ���� �G �ʱ�ȭ
		int n=1;
													//-- 1 2 3 4 5 6 ...22 23 24 25
		//�迭�� �迭�� �ݺ����� ��ø ������ Ȱ���Ͽ� ����ȭ
		for(int i=0; i<arr.length; i++)				//-- 0		1	   2...
		{
			for(int j=0; j<arr[i].length; j++)		//-- 01234  01234  01234
			{
				arr[i][j]=n;
				n++;
			}

		}

		//--������� �����ϸ� �迭�� �� �濡 �� ��Ƴ��� �Ϸ�~!!!

		// ��ü ��� ���
		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr.length; j++)
				System.out.printf("%3d", arr[i][j]);
			System.out.println();
		}
		
	}
}
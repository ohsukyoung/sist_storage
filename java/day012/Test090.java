/* =====================================
���� �迭 ����
- �迭�� �迭
=====================================*/

// �迭�� �迭(������ �迭)�� Ȱ���Ͽ�
// ������ ���� �����͸� ��ҷ� ���ϴ� �迭�� �����ϰ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.

//���� ��)
/*
  E  J  O  T  Y | ������
  D  I  N  S  X | ����������
  C  H  N  R  W | ����������
  B  G  L  Q  V | ����������
  A  F  K  P  U | ����������
*/

public class Test090
{
	public static void main(String[] args)
	{
		// ���� Ǭ ���� --------------------------
		/*
		int[][] arr = new int[5][5];
		int n='A';
		for(int i=0; i<arr.length; i++)
		{
			for(int j=4; j>=0; j--)
			{
				arr[j][i] = n;
				n++;
			}
		}

		for(int i=0; i<arr.length; i++)
		{
			for(int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%3c ",(char)arr[i][j]);
			}
			System.out.println();
		}
		*/

		// �Բ� Ǭ ���� --------------------------
		// �迭�� �迭 ���� �� �޸� �Ҵ�
		char[][] arr = new char[5][5];

		// �迭����
		char start = 'A';				// 65
			
		for (int i=0; i<5; i++)			// ��~~~~~ i �� 0     1     2     3     4
		{
			for (int j=4; j>=0; j--)	// ������  j �� 4321  4321  4321  4321  4321
			{
				arr[j][i] = start++;
			}
		}


		// �迭 ��ü ��� ���
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
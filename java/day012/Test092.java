/* =====================================
���� �迭 ����
- �迭�� �迭
=====================================*/

// �� ����
// �迭�� �迭(������ �迭)�� Ȱ���Ͽ�
// ������ ���� �����͸� ��ҷ� ���ϴ� �迭�� �����ϰ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.

//���� ��)
/*
  A  B  C  D  E
  F  G  H  I  J
  K  L  M  N  O
  P  Q  R  S  T
  U  V  W  X  Y
*/

public class Test092
{
	public static void main(String[] args)
	{
		// �迭�� �迭 ���� �� �޸� �Ҵ�
		int[][] arr = new int[5][5];

		// �迭����
		int a = 'A';							//65
		for(int i=0; i<arr.length; i++)			// ��~~~~~ i �� 0     1     2     3     4
		{
			for(int j=0; j<arr[i].length; j++)	// ������  j �� 01234 01234 01234 01234 01234
			{
				arr[i][j] = a++;
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

//���� ���
/*
  A   B   C   D   E
  F   G   H   I   J
  K   L   M   N   O
  P   Q   R   S   T
  U   V   W   X   Y
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
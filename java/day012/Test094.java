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
  A
  C  B
  D  E  F
  J  I  H  G
  K  L  M  N  O
*/

// �ι�°, �׹�° ������

public class Test094
{
	public static void main(String[] args)
	{
		// �迭�� �迭 ���� �� �޸� �Ҵ�
		int[][] arr = new int[5][5];

		// �迭����
		int a = 'A';							//65
		for(int i=0; i<arr.length; i++)			// ��~~~~~ i �� 0    1    2    3    4
		{
			for(int j=0; j<i+1; j++)			// ������  j �� 0    10   012  3210 01234
			{
				if(i%2==0)						// ¦���� �϶� ���� ���
					arr[i][j] = a;
				else							// Ȧ���� �϶� ��-��
					arr[i][i-j] = a;
				a++;
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
  A
  C   B
  D   E   F
  J   I   H   G
  K   L   M   N   O
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
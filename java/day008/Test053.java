/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - �ݺ���(while��) �ǽ� �� ����
=====================================*/

// ����ڷκ��� ���ϴ� ��(������)�� �Է¹޾�
// �ش��ϴ� �������� ����ϴ� ���α׷��� �����Ѵ�.
// ��, 1�� ~ 9�� ������ ���� �Է¹��� ��Ȳ�� �ƴ϶��
// �̿� ���� �ȳ��� �� �� ���α׷��� ������ �� �ֵ��� ó���Ѵ�.

// ���� ��)
// ���ϴ� ��(������) �Է�: 7
// 7 * 1 = 7
// 7 * 2 =14
//  ��
//7 * 9 = 63
// ����Ϸ��� �ƹ� Ű�� ��������...

// ���ϴ� ��(������) �Է�: 11
// 1���� 9������ ������ �Է��� �����մϴ�.
// ����Ϸ��� �ƹ� Ű�� ��������...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test053
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// ���� Ǭ ���� --------------------------
		/*
		int n=0;
		int i=1;
		System.out.print("���ϴ� ��(������) �Է�: ");
		n = Integer.parseInt(br.readLine());
		if(n>0 && n<10)
		{	
			while(i<10)
			{
				System.out.printf("%d * %d = %d\n", n, i, n*i);
				i++;
			}
		}else{
			System.out.printf("1���� 9������ ������ �Է��� �����մϴ�.\n");
		}
		*/

		// �Բ� Ǭ ���� --------------------------
		int dan;		//-- ����ڷκ��� �Է°��� ���� ���·� ��Ƶ� ����(��)

		// ���� �� ó��
		System.out.print("���ϴ� ��(������) �Է�: ");
		dan = Integer.parseInt(br.readLine());

		if (dan<1 || dan>9)
		{
			System.out.println("1���� 9������ ������ �Է��� �����մϴ�.");
			return;
		}

		int n=0;
		// ������(�ݺ� ���)
		while(n<9)		// 0 1 2 3 4 5 6 7 8 
		{ 
			n++;
			System.out.printf("%d * %d = %d\n", dan, n,(dan*n));
		}

	}
} 

// ���� ���
/*
���ϴ� ��(������) �Է�: 9
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
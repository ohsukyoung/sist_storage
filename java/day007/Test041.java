/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - switch �ǽ�
=====================================*/

// ����ڷκ��� 1 ���� 3 ���������� �� �ϳ��� �Է¹޾�
// �Է� ���� ������ŭ�� ������(��)�� ��µǴ� ���α׷��� �ۼ��Ѵ�.
// ��, �ΰ��� ������� ������ �� �ֵ��� �Ѵ�.

// �� switch���� �Ϲ� ���� ����Ͽ� �����Ѵ�.
// �� switch���� �⺻ ���� ����ϵ�,
// ��break���� �� �ѹ��� ����� �� �ֵ��� �����Ѵ�.

// ���� ��)
// ������ ���� �Է�(1~3): 3
// �ڡڡ�
// ����Ϸ��� �ƹ� Ű�� ��������...

// ������ ���� �Է�(1~3): 1
// ��
// ����Ϸ��� �ƹ� Ű�� ��������...

// ������ ���� �Է�(1~3): 7
// �Է� ����~!!
// ����Ϸ��� �ƹ� Ű�� ��������...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test041
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// ���� Ǭ ���� --------------------------
		/*
		int num;

		System.out.print("������ ���� �Է�(1~3): ");
		num = Integer.parseInt(br.readLine());
		
		// �����
		//switch(num)
		//{
		//	case 1: System.out.println("��"); break;
		//	case 2: System.out.println("�ڡ�"); break;
		//	case 3: System.out.println("�ڡڡ�"); break;
		//	default : System.out.println("�Է¿���~!!"); break;
		//}

		// �����
		 switch(num)
		{
			default : System.out.println("�Է¿���~!!"); break;
			case 3: System.out.printf("��");
			case 2: System.out.printf("��");
			case 1: System.out.printf("��");
		}
		System.out.println();
		*/

		// �Բ� Ǭ ���� --------------------------
		int n;

		System.out.print("������ ���� �Է�(1~3): ");
		n = Integer.parseInt(br.readLine());

		//��
		switch(n)
		{
			case 1: System.out.println("��"); break;
			case 2: System.out.println("�ڡ�"); break;
			case 3: System.out.println("�ڡڡ�"); break;
			default : System.out.println("�Է¿���~!!!"); //break;
		}

		//��
		switch(n)
		{
			default : System.out.println("�Է¿���~!!"); break;
			case 3: System.out.printf("��");
			case 2: System.out.printf("��");
			case 1: System.out.printf("��");

		}

	}
}
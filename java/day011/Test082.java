/* =====================================
���� �迭 ����
- �迭�� ����� �ʱ�ȭ
- �迭�� �⺻�� Ȱ��
=====================================*/

// ����ڷκ��� �ο����� �Է¹ް�
// �Է¹��� �ο� �� ��ŭ�� �л� �̸��� ��ȭ��ȣ�� �Է¹޾�
// �̷��� �Է¹��� �����͸� �̸��迭�� ��ȭ��ȣ �迭�� �����Ͽ�
// ����� ����� �� �ִ� ���α׷��� �����Ѵ�.

// ���� ��
// �Է� ó���� �л� �� �Է�(��, 1~10): 27
// �Է� ó���� �л� �� �Է�(��, 1~10): -5
// �Է� ó���� �л� �� �Է�(��, 1~10): 3
// �̸� ��ȭ��ȣ �Է�[1](���� ����): ȫ�浿 010-1111-2222
// �̸� ��ȭ��ȣ �Է�[2](���� ����): �ŵ����� 010-1111-2222
// �̸� ��ȭ��ȣ �Է�[3](���� ����): ��ȭȫ�� 010-1111-2222

//-----------------
// ��ü �л� ��: 3
//-----------------
//  �̸�    ��ȭ��ȣ
// ȫ�浿 010-1111-2222
// ȫ�浿 010-1111-2222
// ȫ�浿 010-1111-2222
//-----------------
// ����Ϸ��� �ƹ� Ű�� ��������...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Scanner;

public class Test082
{
	public static void main(String[] args) throws IOException
	{
		// ���� Ǭ ���� --------------------------
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		Scanner sc = new Scanner(System.in);
		
		int count=0;
		
		do
		{
			System.out.print("�Է� ó���� �л� �� �Է�(��, 1~10): ");
			count = Integer.parseInt(br.readLine());
		
		}while (count<0 || count>10);

		String[] arr_name = new String[count];
		String[] arr_num = new String[count];

		for(int i=0; i<count; i++)
		{
			System.out.print("�̸� ��ȭ��ȣ �Է�[" + (i+1) +"](���� ����): ");
			arr_name[i] = sc.next();
			arr_num[i] = sc.next();
		}
		
		System.out.println("-----------------");
		System.out.println("��ü �л� ��: "+ count);
		System.out.println("-----------------");
		System.out.println("  �̸�    ��ȭ��ȣ");
		for(int i=0; i<count; i++)
		{	
			System.out.println(arr_name[i]+" "+arr_num[i]);
		}
		System.out.println("-----------------");
		*/

		// Scanner �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		// ����ڰ� �Է��ϴ� �л� ���� ��Ƴ� ����
		int memberCount = 0;

		do
		{
			System.out.print("�Է� ó���� �л� �� �Է�(��, 1~10): ");
			memberCount = sc.nextInt();
		
		}while (memberCount<0 || memberCount>10);

		// �׽�Ʈ(Ȯ��)
		System.out.printf("����ڰ� �Է��� �ο� ��:", memberCount);
		//-->> 

		// ����ڰ� �Է��� �ο� ���� ����
		// �̸� �迭�� ��ȭ��ȣ �迭�� �����ؾ� �Ѵ�.

		// �ο� �� ��ŭ�� �̸� ���� �迭 ����
		String[] names = new String[memberCount];
		// �ο� �� ��ŭ�� ��ȭ��ȣ ���� �迭 ����
		String[] tels = new String[names.length];
		
		//�̸� ��ȭ��ȣ �Է�
		//�ο� �� ��ŭ�� �ȳ� �޼��� ��� �� �Է°� ��Ƴ���
		//for(int i=0; i<names.length; i++)
		//for(int i=0; i<tels.length; i++)
		for(int i=0; i<memberCount; i++)
		{
			System.out.printf("�̸� ��ȭ��ȣ �Է�[%d](���� ����): ", (i+1));

			// ȫ�浿 000-1111-2222
			names[i] = sc.next();

			// ȫ�浿 000-1111-2222
			tels[i] = sc.next();
		}

		//���� ���(�̸�, ��ȭ��ȣ) ���
		System.out.println("-----------------");
		System.out.printf("��ü �л��� : %d�� \n", memberCount);
		System.out.println("-----------------");
		//memberCount == names.length == tels.length
		System.out.println("�̸�    ��ȭ��ȣ");

		for(int i=0; i<memberCount; i++)
		{
			System.out.println("%s %s",names[i], tels[i]);
		}
		System.out.println("-----------------");

	}
}

// ���� ���
/*
�Է� ó���� �л� �� �Է�(��, 1~10): 2
�̸� ��ȭ��ȣ �Է�[1](���� ����): aaa 111
�̸� ��ȭ��ȣ �Է�[2](���� ����): bbb 222
-----------------
��ü �л� ��: 2
-----------------
  �̸�    ��ȭ��ȣ
aaa 111
bbb 222
-----------------
*/
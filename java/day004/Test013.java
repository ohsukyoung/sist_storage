/* =========================================
���� �ڹ� �⺻ ���α׷��� ����
===========================================*/

/*	�� ����
	�ﰢ���� �غ��� ���̿� ���̸� ����ڷκ��� �Է¹޾�
	�� �ﰢ���� ���̸� ���ϴ� ���α׷��� �����Ѵ�.

	���� ��)
	�� �ﰢ�� ���̸� ���ϴ� ���α׷� ��
	- �ﰢ���� �غ� �Է� : 	5
	- �ﰢ���� ���� �Է� :	3

	>> �غ��� 5, ���̰� 3�� �ﰢ���� ���� : xxx
	����Ϸ��� �ƹ�Ű�� ��������.

	�� ���� �ν� �� �м�
	�ﰢ���� ���� = �غ� * ���� / 2
	����ڷκ��� ������ �Է¹޾� ó�� ���� BufferedReader Ȱ��
	BufferedReader�� ���� �� ��� ?? �Ѱ� ���??
	                                 -----------
*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test013
{
	public static void main(String[] args) throws IOException
	{

		// ���� Ǭ ���� --------------------------
		/*
		//����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		//���� ����
		int wid, hei;	//-- �غ�, ����
		double area;	//-- ����	

		System.out.println("�� �ﰢ�� ���̸� ���ϴ� ���α׷� ��");
		System.out.printf("- �ﰢ���� �غ� �Է� :");
		wid = Integer.parseInt(br.readLine());
		System.out.printf("- �ﰢ���� ���� �Է� :");
		hei = Integer.parseInt(br.readLine());

		//���� �� ó��
		area = wid * hei / 2.0;
		
		//����Է�
		System.out.printf(">> �غ��� %d, ���̰� %d�� �ﰢ���� ���� : %.2f\n", wid, hei, area);
		*/


		// �Բ� Ǭ ���� --------------------------
		//�ֿ� ���� ����

		//BufferedReader �ν��Ͻ� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		//�غ�, ����
		int underLength,height;		//-- �غ�, ����
		double area;				//-- ����		--check!


		//���� �� ó��
		// �� ����ڿ��� �ȳ� �޼��� ���
		System.out.println("�� �ﰢ�� ���� ���ϴ� ���α׷� ��");
		//System.out.println("- �ﰢ�� �غ� �Է�: ");
		System.out.print("- �ﰢ�� �غ� �Է�: ");

		// �� ����ڰ� �Է��� ������(���ڿ�)�� ���� ���·� ��ȯ�� ��
		//	���� underLength�� ��Ƴ���
		underLength = Integer.parseInt(br.readLine());				//-- ����ڰ� �Է��� ���� �о��

		// �� �ٽ� ����ڿ��� �ȳ� �޼��� ���
		System.out.print("- �ﰢ���� ���� �Է�: ");

		// �� ����ڰ� �Է��� ������(���ڿ�)�� ���� ���·� ��ȯ�� ��
		//	���� height�� ��Ƴ���
		height = Integer.parseInt(br.readLine());

		// �� �ﰢ���� ���� ���ϴ� ���� ó��
		//	�ﰢ���� ���� = �غ� * ���� /2;
		area = underLength * height / 2;
		//		������		������   ������
		//     --------------------  ----
		//            ������       / ������ �� ���� ��� ����
		//									   (��, ���� ���ϰ� �������� ����)
		area = underLength * height / 2.0;	// -- check!
		//		������		������	 �Ǽ��� �� �Ǽ� ��� ����

		// �� �Ǽ� �ڷ����� ��������� ������ ��������
		//	�Ǽ� ����� ������ �ʿ��� ��Ȳ�̴�.
		//	������ ��2���� �ƴ�, �Ǽ������� ��2.0������ ������ ������ �����ϰ� �Ǹ�
		//	�� ������ �Ǽ� ������� ó���ȴ�.

		// area = (double)underLength * height / 2;
		// area = undeLength * (double) height / 2;
		// area = (double)(underLength * height) / 2;
		// area = (double)(underLength * height / 2); --- (X)

		// ������
		//System.out.println();	// ����
		//System.out.print();		//-- ���� �߻�(������ ����)

		System.out.printf("\n>> �غ��� %d, ���̰� %d�� �ﰢ���� ����: %.2f\n", underLength, height, area);
	}
}
//���� ���

/*
�� �ﰢ�� ���� ���ϴ� ���α׷� ��
- �ﰢ�� �غ� �Է�: 5
- �ﰢ���� ���� �Է�: 3

>> �غ��� 5, ���̰� 3�� �ﰢ���� ����: 7.50
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
/* =====================================
���� �ڹ� �⺻ ���α׷��� ����
 - ������ �ڷ���
 - �ڹ��� �⺻ �����: BufferedReader Ŭ����
=====================================*/

/* ����ڷκ��� �̸�, ��������, ��������, ���������� �Է¹޾�
	�̸��� ������ ����ϴ� ���α׷��� �����Ѵ�.

	���� ��)
	�̸��� �Է��ϼ���: ȫ�浿
	���� ���� �Է�: 90
	���� ���� �Է�: 80
	���� ���� �Է�: 70
	>
	====[���]===
	�̸�: ȫ�浿
	����: 240
	����Ϸ��� �ƹ� Ű�� ��������...
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test014
{
	public static void main(String[] args) throws IOException
	{
		// ���� Ǭ ���� --------------------------
		/*
		//����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		//��������
		String name;				// �̸�
		int korNum,engNum,MatNum,total;	// ����, ����, ����, ����

		//ó��
		System.out.print("�̸��� �Է��ϼ���:");
		name = br.readLine();
		System.out.print("���� ���� �Է�:");
		korNum = Integer.parseInt(br.readLine());
		System.out.print("���� ���� �Է�:");
		engNum = Integer.parseInt(br.readLine());
		System.out.print("���� ���� �Է�:");
		MatNum = Integer.parseInt(br.readLine());

		total = korNum + engNum + MatNum;

		//���
		System.out.print("\n====[���]===\n");
		System.out.printf("�̸�: %s\n", name);
		System.out.printf("����: %d\n", total);
		*/

		// �Բ� Ǭ ���� --------------------------

		//�ֿ亯������
		//BufferedReader �ν��Ͻ� ����
		//BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		String strName;			//-- �̸� ����
		int nKor, nEng, nMat;	//-- ��������, ��������, �������� ����
		int nTot;				//-- ���� ����
		String strTemp;			//-- ���ڿ� �ӽ� ���� ����

		//���� �� ó��
		//- ����ڿ��� �ȳ� �޼��� ���(�̸� �Է� �ȳ�)
		System.out.print("�̸��� �Է��ϼ���: ");

		//- ����ڰ� �Է��� ��(�ܺ� ������)�� ������ ��Ƴ���
		strName = br.readLine();
		
		//- ����ڿ��� �ȳ� �޼��� ���(�������� �Է� �ȳ�)
		System.out.print("���� ���� �Է�: ");

		//- ����ڰ� �Է��� ��(�ܺ� ������)�� ������ ��Ƴ���
		strTemp = br.readLine();

		//- ��Ƴ� �����͸� ��ȯ�� �� �ʿ��� ������ �ٽ� ���
		nKor = Integer.parseInt(strTemp);

		//- ����ڿ��� �ȳ� �޼��� ���(�������� �Է� �ȳ�)
		System.out.print("���� ���� �Է�: ");


		//- ����ڰ� �Է��� ��(�ܺ� ������)�� ������ ��ȳ���
		strTemp = br.readLine();

		//- ��Ƴ� �����͸� ��ȯ�� �� �ʿ��� ������ ��Ƴ���
		nEng = Integer.parseInt(strTemp);

		//- ����ڿ��� �ȳ� �޼��� ���(�������� �Է� �ȳ�)
		System.out.print("���� ���� �Է�: ");

		//- ����ڰ� �Է��� ��(�ܺ� ������)�� ������ ��Ƴ���
		strTemp = br.readLine();

		//- ��Ƴ� �����͸� ��ȯ�� �� �ʿ��� ������ �ٽ� ���
		nMat = Integer.parseInt(strTemp);

		//- �� ���� ������ ����ִ� ������(����ڰ� �Է��� ������)����
		// �����Ͽ� ������ �����ϰ� �� ����� ���� ������ ��Ƴ���
		nTot = nKor + nEng + nMat;


		//��� ���
		System.out.println("\n====[���]====");
		//System.out.println("�̸�:" + strName);
		System.out.printf("�̸�: %s\n",strName);
		//System.out.println("����: " + nTot);
		System.out.printf("����: %d\n",nTot);
	}
}

//��� ���

/*
�̸��� �Է��ϼ���:���ѿ�
���� ���� �Է�:90
���� ���� �Է�:80
���� ���� �Է�:70

====[���]===
�̸�: ȫ�浿
����: 240
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
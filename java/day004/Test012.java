/* =========================================
���� �ڹ��� ����� Ư¡ ����
 - ������ �ڷ���
 - �ڹ� �⺻ �����: BufferedReader Ŭ����
===========================================*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test012
{
	public static void main(String[] args) throws IOException
	{
		//Ű���� ����(����)
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		//------------------------------------
		// ���� �Է��� �о���̴� ��ġ
		//                                    ----------------------
		//                                     ����Ʈ �� ���� ������
		//                                                          -------------
		//                                                          ����Ʈ �Է°�

		// �ֿ� ���� ����
		int r;							//-- ������
		final double PI = 3.141592;		//-- ������ �� ������ ���ȭ ��final��
		double a,b;						//-- ���� ����, �ѷ�


		// ���� �� ó��
		// �� ����ڿ��� �ȳ� �޼��� ���
		//System.out.println("���� ������ �Է�: ");
		System.out.print("���� ������ �Է�: ");
		//r = br.readLine();

		//r = "2546";

		//"2546" �� parseInt("2546") �� 2546
		//"80" �� parseInt("80") �� 80

		//Interger.parseInt("80); �� 80
		//-- �Ű������� �Ѱܹ��� ���ڿ� �����͸� ���������� ��ȯ
		//	��, �� �� �Ѱܹ��� ���ڿ� �����ʹ� ���� ���¿��� �Ѵ�.
		//									   ---------
		//									(Number Format)


		//�� ����ڰ� �Է��� ���� �޾ƿ� ������ ����r�� ��Ƴ���
		r = Integer.parseInt(br.readLine());
		//r = Integer.parseInt("2546");
		//r = 2546;
		//-- ����ڰ� �Է��� ���� br��, BufferedReader�� ��readLine()��
		//	�޼ҵ带 Ȱ���Ͽ� ���ڿ� ���·� �о���� ��
		//	 �� ���� ��Integer.parseInt()���� ���� ������(������)���� ��ȯ�� ��
		//	 ���� ������ ������ ���� r�� ��Ƴ���

		//�� ���� �� �ѷ� ���(����)
		//	�� ���� ���� a �� b�� ��Ƴ���\
		a = r * r * PI;
		b = r * 2 * PI;

		// ��� ���
		// �� ���� a�� b�� ����ִ� �� ���
		System.out.println(">> ����: " + a);
		System.out.println(">> �ѷ�: " + b);
		//--==> ���� ������ �Է�: 45
		//		>> ����: 6361.723800000001
		//		>> �ѷ�: 282.74328
		//		����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

		// >> �������� 45�� ���� ���̴� 6361.72�̸�,
		// >> �������� 45�� ���� �ѷ��� 282.74 �Դϴ�.
		System.out.printf(">> �������� %d�� ���� ���̴� %.2f�̸�,\n",r,a);
		System.out.printf(">> �������� %d�� ���� �ѷ��� %.2f�Դϴ�.\n",r,b);

	}
}

// ���� ���

/*
���� ������ �Է�: 45
>> ����: 6361.723800000001
>> �ѷ�: 282.74328
>> �������� 45�� ���� ���̴� 6361.72�̸�,
>> �������� 45�� ���� �ѷ��� 282.74�Դϴ�.
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
/* ===================================
���� �ڹ��� ����� Ư¡ ����
=====================================*/

/* �� ����
	������ �ο��� ������ ������ ����
	���� ���̿� �ѷ��� ���ϴ� ���α׷��� �����Ѵ�.
	�� ������ : 10

	�� ���� ���� : ������ * ������ * 3.141592
	   ���� �ѷ� : ������ * 2 * 3.141592

	���� ��)
	����: xxxx
	�ѷ�: xxxx
	����Ϸ��� �ƹ� Ű�� ��������...
*/

public class Test010
{
	public static void main(String[] args)
	{
		// ���� Ǭ ���� ----------------------------------------------------
		int radius;							//������
		double area, peri, pie = 3.141592;	//����, �ѷ�, ����

		radius = 10;
		area = radius * radius * pie;
		peri = radius * 2 * pie;

		System.out.println("����: "+ area);
        System.out.println("�ѷ�: "+ peri);
		//System.out.printf("����: %f\n�ѷ�: %f\n", area, peri);
		
		// �Բ� Ǭ ���� ----------------------------------------------------
		// ����
		int r = 10;						//-- ������(r)
		//double pi = 3.141592			//-- ������(��)
		//final double pi = 3.141592	//-- ������(��)
		final double PI = 3.141592	;	//-- ������(��)
		//-- ��final��Ű����: ������ ���ȭ, ������ �빮��

		//rainbowColor �� RAINBOWCOLOR �� RAINBOW_COLOR
		//userName �� USERNAME �� USER_NAME
		//applePrice �� APPLEPRICE �� APPLE_PRICE

		double area2, length;			//-- ���� ����, �ѷ�

		//���� �� ó��
		// �� ���� ����
		//	���� ���� : ������ * ������ * 3.141592
		area2 = r * r * PI;


		// �� �ѷ� ����
		//	���� �ѷ� : ������ * 2 * 3.141592
		length = r * 2 * PI;



		// ������
		//System.out.println("���� : "+ area2);
		//System.out.println("�ѷ� : " + length);

		//System.out.printf("����: ��%n", area);
		System.out.printf("����: %.3f%n", area2);
		//System.out.printf("�ѷ�: ��%f%n", length);
		System.out.printf("�ѷ�: %.3f%n", length);

		System.out.printf("����: %.3f%n�ѷ�: %.3f%n", area2, length);


        
	}
}
//���� ���
/*
����: 314.1592
�ѷ�: 62.83184
����: 314.159
�ѷ�: 62.832
����: 314.159
�ѷ�: 62.832
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
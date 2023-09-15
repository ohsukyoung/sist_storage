/* =====================================
���� Ŭ���� ��� ����
- ��ø Ŭ����
=====================================*/

//outer
class Test2
{
	static int a =10;
	int b=20;

	void write()								//-- ù ��° write() �޼ҵ�
	{
		System.out.println("write()...");
		//**** S: �ٽ�
		final int c = 20;		//c�� d ��� �ν��Ͻ� �����̳�
								//c���� ����O, d ����X
		int d = 40;				//d�� �ν��Ͻ� ���������� ����
		//**** E: �ٽ�

		//inner
		// �޼ҵ� �ȿ� �����ϴ� �Ǵٸ� Ŭ����(���� Ŭ����, local class, ���� Ŭ����)
		class LocalTest
		{
			void write()						//-- �� ��° write() �޼ҵ�
			{
				System.out.println("write()...��");
				System.out.println("a : "+a);
				System.out.println("b : "+b);	//Write() 1�� �޼ҵ�� b�� ���� ��������� O
				System.out.println("c : "+c);
				System.out.println("d : "+d);
			}
		}

		//�� ����  c�� ���� d�� �� �� �������� ������..
		// (ù ��° write() �޼ҵ� �ȿ��� ����� �����̹Ƿ�...)
		// c�� final �����̱� ������
		// �� ��° write() �޼ҵ忡�� ���� �����ϴ���
		// ������ �� 20 �� ��������� ������� �� �ִ�.
		// �ݸ� d�� �� ���� ���÷� ��ȭ�� �� �ִ� ��Ȳ�̹Ƿ�
		// LocalTest Ŭ������ �ν��Ͻ� ���� ������
		// ������ ���� �� �� ���� ������
		// �̷����� �ν��Ͻ� ���� ������ d�� � ���� ����ִ�����
		// ������� �� ���� �ȴ�.
		// ���� d�� �����ϴ� ���� ���� �� �ֵ��� ���������� ó���ϴ� ���̴�.

		//d+=10;
		d++;

		// LocalTest Ŭ���� ��� �ν��Ͻ� ����(�� inner)
		LocalTest lt = new LocalTest();
		lt.write();								//-- �� ��° write() �޼ҵ� ȣ��

		b+=20;
	}
}


public class Test123
{
	public static void main(String[] args)
	{
		// Test2 Ŭ���� ��� �ν��Ͻ� ����(�� outer)
		Test2 ob = new Test2();
		ob.write();								//-- ù��° write() �޼ҵ� ȣ��
	}
}
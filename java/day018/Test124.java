/* =====================================
���� Ŭ���� ��� ����
- ��ø Ŭ����
=====================================*/

class InnerOutherTest
{
	static int a = 10;
	int b = 20;

	class InnerNested
	{
		int c = 30;


		void write()
		{
			System.out.println("inner�� write()...");
			System.out.println("a: " + a);			//-- a:static ����O
			System.out.println("b: " + b);
			System.out.println("c: " + c);
		}

	}

	void write()
	{
		System.out.println("outer�� write()...");

		// InnerNested Ŭ���� ��� �ν��Ͻ� ����(�� inner)
		InnerNested ob1 = new InnerNested();
		ob1.write();						//-- innner write() �޼ҵ� ȣ��
	}
}

// main() �޼ҵ带 �����ϰ� �ִ� �ٸ� Ŭ����
public class Test124
{
	public static void main(String[] args)
	{
		// InnerOutherTest Ŭ���� ��� �ν��Ͻ� ����(�� outher)
		InnerOutherTest ob2 = new InnerOutherTest();
		ob2.write();						//-- outher write() �޼ҵ� ȣ��
		//--==>> outer�� write()...
		//		inner�� write()...
		//		a: 10
		//		b: 20
		//		c: 30

		//InnerNested Ŭ���� ��� �ν��Ͻ� ����(�� inner)
		//InnerNested ob3 = new InnerNested();
		//--==>> ���� �߻�(������ ����)

		// check~!!! �� Test112.java ���ϰ� ��~!!!
		// InnerNested Ŭ���� ��� �ν��Ͻ� ����(�� inner)
		//InnerOutherTest.InnerNested ob4 = new InnerOUtherTest.InnerNested();
		//--==>> ���� �߻�(������ ����)

		//�� ��ø ���� Ŭ����(static ��ø Ŭ����)�ʹ� �޸�
		//	�ܺ� Ŭ������ �ν��Ͻ�(��ü)�� ������� �ʰ�
		//	�ܵ����� ���� Ŭ������ �ν��Ͻ��� �����ϴ� ���� �Ұ����ϴ�.
		// �� ��, �ܺ� Ŭ������ ��. ü. �� ����ϸ�
		// ����Ŭ������ ��ü�� �����ϴ� ���� �����ϴ�.

		//check~!!! �� Test122/java ���ϰ� ��~!!!
		//ob2.new InnerNested();
		
		
		InnerOutherTest.InnerNested ob5 = ob2.new InnerNested();
		ob5.write();
		//--==>> inner�� write()...
		//		a: 10
		//		b: 20
		//		c: 30

		// check~!!! �� Test122.java ���ϰ� ��~!!!
		innerOutherTest.InnerNested ob6 = new InnerOutherTest().new InnerNested();

		//outherŬ������.inner Ŭ������ ���������� = new outher������().new inner������();

		// cf) static �� ��ø ���� Ŭ����
		//outherŬ������.inner Ŭ������ ���������� = new outher Ŭ������.inner������();
	}
}
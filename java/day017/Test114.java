
 /* =====================================
���� Ŭ���� ��� ����
- ���(Inheritance)
=====================================*/

/* �� �޼ҵ� �������̵�(Method Overridning)�� Ư¡
	- �޼ҵ� �̸�, ���� Ÿ��, �Ķ���� ���� Ÿ���� ������ ��ġ�ؾ� �Ѵ�.
	- �ݵ�� ��� ���谡 �־�� �Ѵ�.
	- �����ǵ� ���� Ŭ������ �޼ҵ� �������������ڴ�
		���� Ŭ������ ���� �޼ҵ� �������������ں��� ������ ũ�ų� ���ƾ� �Ѵ�.
		���� ���, ���� Ŭ���� �޼ҵ��� �������������ڰ� ��protected�� �� ���
		���� Ŭ������ �� �޼ҵ带 �������̵�(Overridning) �ϴ� ���
		�������������ڴ� ��public��  �Ǵ� ��protected�� �̾�� �Ѵ�.
	- ��static��, ��final��, ��priate�� �޼ҵ��
		�������̵�(Overridning)�� �� ����.
	- Exception�� �߰��� �Ұ����ϴ�.
		��, ���� �޼ҵ尡 ������ �ִ� ������ ���ܻ��׿�
		���ο� Exception�� �߰��ϴ� ���� �Ұ����ϴٴ� ���̴�.


*/

// �θ� Ŭ����(����, super)
class SuperTest114
{
	private int a = 5;
	protected int b = 10;
	public int c = 20;

	public void write()
	{
		System.out.println("Super write() �޼ҵ�: " + a + " : " + b + " : " + c);
	}
}
// �ڽ� Ŭ����(����, sub)
class SubTest114 extends SuperTest114
{
	/*
	protected int b = 10;
	public int c = 20;

	public void write()
	{
		System.out.println("Super write() �޼ҵ�: " + a + " : " + b + " : " + c);
	}
	*/
	
	protected int b = 100;
	public void print()
	{
		//System.out.println("Super write() �޼ҵ�: " + a + " : " + b + " : " + c);
		//--==>> �����߻�(������ ����)
		//-- ����Ŭ�������� ����� ���� a ���� ������ �� ����.
		// �� priate �����̱� ������...

		System.out.println("sub print() �޼ҵ�: " + b + " : " + c);
		//--==>> sub print() �޼ҵ�: 100 : 20

		System.out.println("sub print() �޼ҵ�: " + b);
		System.out.println("sub print() �޼ҵ�: " + this.b);	//SubTest114.b
													// this.b: this�� b�� ������ Ŭ���� �߰�
		System.out.println("sub print() �޼ҵ�: " + super.b);	//SuperTest114.b
		//--==>> sub print() �޼ҵ�: 100
		//--==>> sub print() �޼ҵ�: 100
		//--==>> sub print() �޼ҵ�: 10
		//-- ���� b�� ���ٹ���� ���� �ٸ� b�� ���� �� ����� �̷������.
		// ����Ŭ�������� ����� b, ����Ŭ�������� ����� b

		System.out.println("Sub print() �޼ҵ�: " + c);
		System.out.println("sub print() �޼ҵ�: " + this.c);
		System.out.println("sub print() �޼ҵ�: " + super.c);
		//-->> Sub print() �޼ҵ�: 20
		//	sub print() �޼ҵ�: 20
		//	sub print() �޼ҵ�: 20
		//-- ���� c�� �����ϴµ� �ƹ��� ����� ������ ����.
		//	����Ŭ�������� ���� �� c
	}// end print()

	@Override
	public void write()
	{
		//System.out.println("Super write() �޼ҵ�: " + a + " : " + b + " : " + c);

		System.out.println("Sub write() �޼ҵ�: " + b + " : "+ c);
	}

}

public class Test114
{
	public static void main(String[] args)
	{
		// ���� Ŭ����(SubTest114) �ν��Ͻ� ����
		SubTest114 ob = new SubTest114();
		
		ob.print();

		ob.write();
		//--==>> Super write() �޼ҵ�: 5 : 10 : 20
		//--==>> Sub write() �޼ҵ�: 100 : 20

		System.out.println("--------------------------- ���м�");

		System.out.println(ob.b);
		//--==>> 100

		System.out.println(((SuperTest114)ob).b);
		//--==>> 10
		// �� ���� �θ�~!!!

		ob.write();
		//--==>> Sub write() �޼ҵ�: 100 : 20

		((SuperTest114)ob).write();
		//--==>> Sub write() �޼ҵ�: 100 : 20
		// ���������� Ʃ���ϸ� ���� ����X

		//check~!!!
		// �� �޼ҵ�� ������~!! ��!!!! �����Ͽ� ������ ��~!!!


	}
}
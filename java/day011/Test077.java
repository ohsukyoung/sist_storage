/* =====================================
���� Ŭ������ �ν��Ͻ� ����
- ������(Constructor)
=====================================*/

public class Test077
{
	int val1;
	double val2;

	Test077()
	{
		val1=0;
		val2=0;
		System.out.println("�Ű����� ���� ������...");
	}
	//--==>> �Ű����� ���� ������...
	//		0, 0.0

	//Test077(int x)
	Test077(int val1)
	{
		this.val1=val1;
		val2=0;
		System.out.println("int �� �����͸� �Ѱܹ޴� ������...");
	}
	//--==>> int �� �����͸� �Ѱܹ޴� ������...
	//		4, 0.0

	//Test077(double y)
	Test077(double val2)
	{
		val1=0;
		this.val2=val2;
		System.out.println("double �� �����͸� �Ѱܹ޴� ������...");
	}
	//--==>> double �� �����͸� �Ѱܹ޴� ������...
	//		0, 7.0

	//Test077(int x,double y)
	Test077(int val1,double val2)
	{
		this.val1=val1;
		this.val2=val2;
		System.out.println("int�� �����Ϳ�  double �� �����͸� �Ѱ�ٴ� ������...");
	}
	//--==>>int�� �����Ϳ�  double �� �����͸� �Ѱ�ٴ� ������...4, 7.1
	//		4, 7.1

	public static void main(String[] args)
	{
		Test077 ob1 = new Test077();
		System.out.println(ob1.val1 + ", " + ob1.val2);

		Test077 ob2 = new Test077(4);
		System.out.println(ob2.val1 + ", " + ob2.val2);

		Test077 ob3 = new Test077(7.0);
		System.out.println(ob3.val1 + ", " + ob3.val2);

		Test077 ob4 = new Test077(4, 7.1);
		System.out.println(ob4.val1 + ", " + ob4.val2);
	}
}
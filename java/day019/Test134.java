/* =====================================
���� �ڹٿ��� �ֿ�(�߿�) Ŭ���� ����
- �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
- wrapper Ŭ����
=====================================*/

/*

*/

public class Test134
{
	public static void main(String[] args)
	{
		byte b = 3;
		int i = 256;

		Byte b2 = new Byte(b);
		Integer i2 = new Integer(i);

		System.out.println(b2);
		System.out.println(i2);
		//--==>>3
		//		256

		print(b2);
		print(i2);

	}
	//api ��ť��Ʈ�� �Ĳ��ϰ� Ȯ���غ���
	/*
	println(Byte b)
	{
		..;
	}

	println(Integer i)
	{
		..;
	}

	println(Long l)
	{
		..;
	}

	*/

	/*
			��
	println(Object obj)
	{
		..;
	}

	*/

	
	// java.lang.Number(�߻� Ŭ����)��
	// ��� ������ Wrapper Ŭ������ �θ� Ŭ����
	// (����Ŭ����, ���� Ŭ����)�̴�.
	// b2, i2 �� �ش��ϴ� �ڷ����� Number�� �Ѿ���鼭
	// ��ĳ������ �Ͼ�� �ȴ�.

	//** Number n = new Integer();
	static void print(Number n)	//** Integer, Byte �� ������ Number���� ��� ���� �� ����
	{
		System.out.println(n);
		//** ���� �Ѱ������� �б��ؾ� ��. ������ instanceof

		if(n instanceof Integer)	//** Integer�� ��������� ��ü���
		{
			System.out.println(n.intValue());
		}else if(n instanceof Double)
		{
			System.out.println(n.doubleValue());
		}else
		{
			
		}
	}
	
}
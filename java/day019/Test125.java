/* =====================================
���� Ŭ���� ��� ����
- ���� Ŭ����
=====================================*/

/*
�� Annonymous Ŭ����(�͸��� Ŭ����: ���� Ŭ����)

	- AWT �� �ȵ���̵� �̺�Ʈ ó������ �Ϲ������� ���
				   //** �̺�Ʈ: ���α׷� ������ �Ͼ�� ��� ����
	- ���� Ŭ���� �޼ҵ带 �ϳ� ���� �������� �ʿ伺�� ���� �� ���
	- Ŭ������ ��ü�� �ʿ��ϸ� �� �ٽ� Ŭ������ �����ؾ� �ϴ�
		���ŷο����� ���� ����ϰ� ��ü ������ �ʿ��� ���
		�͸��� Ŭ������ �����Ͽ� ó���� �� �ִ�.

���� �� ����
	new ���� Ŭ������ ������()
	{
		�������������� �ڷ��� �޼ҵ�()
		{
			...;
		}
				�� check~!!! �����ݷ�
	}
*/
//import java.lang.Object;
import java.lang.*;	//lang��Ű���� �ڵ�����

class TestObj	//extends Ojbect �� ��� Ŭ������ ����Ŭ����
						//���ϻ���� �ƴ��ݾƷ� ���� X
						//�ڹٰ� ��ü��� �˸��� ��
{
	/*
	Object�� �����~!!!
	...;
	public String toString()
	{
		...;
	}
	..;

	@Override
	public String toString()
	{
		..;	
	}
	*/

	public Object getString()
	{
		/*
		Object ob = new Object();
		ob.xx();
		ob.yy();
		ob.zzz();

		return ob;

		*/

		//return new Object();
		//		 ------------- Obejct��

		//return ob;
		return new Object()	//Ư���� ������� �����ؼ� ��ȯ ����
		// ��ü�� ���� ����������, �̸��� ���� ������..
		// ��ü�� ������ �ִ� �޼ҵ带 ������ �Ҷ� ���� �ȴ�.
		{
			// Ư�� �޼ҵ� �籸�� �� ������
			@Override
			public String toString()
			{
				return "�͸��� Ŭ����...";
			}
		};
	}
}


// import java.lang.*;
public class Test125	//extends Object
{
	/*
	Object�� ����� ���~!!!
	*/
	public static void main(String[] args)
	{
		TestObj ob = new TestObj();

		System.out.println(ob.toString());
		//--==>>TestObj@15db9742

		System.out.println(ob.getString());
		//--==>>�͸��� Ŭ����...
	}
}
/* =====================================
���� �÷���(Collection) ����
=====================================*/

// Vector v = new Vector()
//-- ����ִ� Vector �ڷᱸ�� v ����

// Vector v = new Vector(8);	//** ���� ������ ���´��ؼ� ���� �ƴ�
//-- 8���� �ʱ� elements�� ����
//		�� �ڷᱸ���� Ȱ���ϴ� ��������
//		8���� ��� ä������ �Ǹ�(��� ���Ǿ� ���ڶ�� �Ǹ�) �ڵ����� Ȯ���ȴ�.

// Vector v = new Vector(3,5);
//-- 3���� �ʱ� elements�� ���� Vector �ڷᱸ�� v ����
//		�� �ڷᱸ���� Ȱ���ϴ� ��������
//		3���� ��� ä������ �Ǹ�(��� ���Ǿ� ���ڶ�� �Ǹ�) �ڵ����� 5�� ����(Ȯ��) �ȴ�.

// �� ���ʹ� ������ ��ҷ� ������, �Ǽ���, ���ڿ�... ����
//		��Ƴ��� ���� �����ϴ�. (�� ����������.)
//		�� ������ ������ Ȯ�� check~!!!

// MyVector Ŭ���� ����
//** �������� �������� �����ؾ��� ���� Ȯ��

import java.util.Vector;
import java.util.Iterator;

class MyVector extends Vector<Object>
{
	// ������ �� ����� ���� ������
	MyVector()
	{
		// Vector(���� Ŭ����) ������ ȣ��
		// super()
		// �� Vector();
		super(1, 1);
		//-- ù ��° ����: �־��� �뷮
		//	�� ��° ����: ������
	}

	void addInt(int i)
	{
		addElement(new Integer(i));
	}

	void addFloat(float f)
	{
		addElement(new Float(f));
	}

	void addString(String s)
	{
		addElement(s);
	}

	void addCharArray(char[] a)
	{
		addElement(a);
	}

	void addObject(Record rec)
	{
		addElement(rec);	
	}

//** write �����ؼ� ������ ��� ���� ��µǰ�
	void write()
	{
		
		/*
		Iterator<Object> it = this.iterator();
		//Iterator<Object> it = iterator()			//--(O)
		//Iterator<Object> it = this.iterator()		//--(O)
		//Iterator<Object> it = super.iterator()	//--(O)

		while (it.hasNext())	//** ������ �ִ��� �������� ���ؼ����� ����
		{
			Object str = it.next();
			System.out.println(str+ " " );
		}
		//--==>>5
		//		3.15
		//		�ȳ��ϼ���
		//		[C@15db9742
		*/
	
		/*
		Object o;
		int length = size();

		//System.out.println("���� ����� ����: " + length);
		//--==>> ���� ����� ����: 4

		for(int i=0; i<length; i++)
		{
			o = elementAt(i);
			System.out.println(o);
		}
		//--==>>5
		//		3.15
		//		�ȳ��ϼ���
		//		[C@15db9742
		*/

		//��insanceof�� ������		check~!!!
		//-- ó���� �ϴ� ����� ��ü Ÿ�� Ȯ��

		Object o;
		int length = size();

		System.out.println("���� ����� ����: " +length);
		for (int i=0; i<length ; i++ )
		{
			o = elementAt(i);
			
			/*
			// �׽�Ʈ(Ȯ��)
			if(o instanceof char[])	// o ��Ұ� ĳ���� �迭�̶��
			{
				System.out.println("���ڹ迭");
			}else
			{
				System.out.println("�ٸ�����");	
			}
			*/

			if(o instanceof char[])	// o ��Ұ� ĳ���� �迭�̶��
			{
				//System.out.println("���ڹ迭");
				System.out.println("���ڹ迭: " + String.copyValueOf((char[])o));
			}else if(o instanceof String)
			{
				System.out.println("���ڿ�: "+ o.toString());
			}else if(o instanceof Integer)
			{
				System.out.println("������: "+ o);
			}else if(o instanceof Float)
			{
				System.out.println("�Ǽ���: "+ o);
			}
			else
			{
				System.out.println("Ÿ�� Ȯ�� ���~!!!");	
			}
		}


	}
}

public class Test159
{
	public static void main(String[] args)
	{
		// MyVector Ŭ���� ��� �ν��Ͻ� ����
		MyVector v = new MyVector();

		// �ֿ� ���� ���� �� �ʱ�ȭ
		int digit = 5;
		float real = 3.15f;
		String s = new String("�ȳ��ϼ���");
		char[] letters = {'s','t','u','d','y'};

		v.addInt(digit);		//-- ���� �ڷᱸ���� ���� ����
		v.addFloat(real);		//-- ���� �ڷᱸ���� �Ǽ� ����
		v.addString(s);			//-- ���� �ڷᱸ���� ���ڿ� ����
		v.addCharArray(letters);//-- ���� �ڷᱸ���� ���� �迭 ����

		v.write();
	}
}
// ���� ���

/*
���� ����� ����: 4
������: 5
�Ǽ���: 3.15
���ڿ�: �ȳ��ϼ���
���ڹ迭: study
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
/* =====================================
���� �÷���(Collection) ����
=====================================*/

// �ڷᱸ�� ��ü ���� �� ���� ��
// ����� ���� Ŭ���� Ȱ��
// �� �ڷ���

//** �ڡڡڡڡ� �߿�!! �⺻����
import java.util.Vector;

// Ŭ���� �� ����� ���� �ڷ������� Ȱ��
class MyData
{
	// �ֿ� �Ӽ� ���� �� �ֿ� ���� ����(��� ����)
	private String name;	//-- �̸�
	private int age;		//-- ����

	//** �������ٵ��� �ʰ�, ��ӵ� ������ �޼ҵ带 ���ؼ� �����ϵ���
	
	// getter
	// setter

	// getter / setter ����
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	// ������ �� ����� ���� ������(�Ű����� 2���� ������)
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}

	// �� ����� ���� �����ڰ� ������ ���
	//		default �����ڰ� �ڵ����� ���Ե��� �ʱ� ������
	//		default ������ ������ �����ڸ� ����� ���� �����ڷ�
	//		�߰� �����ϰ� �Ǵ� ���� �Ϲ����� Ŭ���� ���� ����
	//		(�ݵ�� �����ؾ� �Ѵٴ� �������� ��Ģ�� ����.)

	// ������ �� ����� ���� ������(�Ű����� ���� ������)
	public MyData()
	{
		//this("",0);
		name = "";
		age = 0;
	}

	// �ٸ� ����� Ǭ ���� ----------------------------------------------
	/*
	@Override
	public String toString()
	{
		return "�̸�: "+name+", ����: "+age;
	}
	*/
}

public class Test162
{
	public static void main(String[] args)
	{
		// ���� �ڷᱸ�� ����
		Vector<MyData> v = new Vector<MyData>();//-(O)
		//MyData[] dataArray = new MyData[10];	//-(O)
		
		// ���� �ڷᱸ�� v��
		// ��Ѹ� 73�� / �ڶ�ġ 7�� / ������ 3��
		// ��Ƴ���

		/*
		v.add(new MyData("��Ѹ�", 73));
		v.add(new MyData("�ڶ�ġ", 7));
		v.add(new MyData("������", 3));
		*/

		// (1) //** st1�� �����ؼ� ������ �� �ֵ��� 
		/*
		MyData st1 = new MyData();
		st1.setName("��Ѹ�");
		st1.setAge(73);
		v.add(st1);

		MyData st2 = new MyData();
		st2.setName("�ڶ�ġ");
		st2.setAge(7);
		v.add(st2);

		MyData st3 = new MyData();
		st3.setName("������");
		st3.setAge(3);
		v.add(st3);
		*/

		// (2)
		/*
		MyData st1 = new MyData("��Ѹ�",3);
		v.add(st1);
		MyData st2 = new MyData("�ڶ�ġ",7);
		v.add(st2);
		MyData st3 = new MyData("������",3);
		v.add(st3);
		*/

		// (3)
		v.add(new MyData("��Ѹ�",73));
		v.add(new MyData("�ڶ�ġ",7));
		v.add(new MyData("������",3));

		// ���� �ڷᱸ�� v�� ��� ����(���) ��ü ����ϱ�
		// ���� ��)
		// �̸�: ���ȯ, ����: 73��

		// ���(1)
		/*
		for(MyData obj: v)
		{
			System.out.printf("�̸�: %s, ����: %d��\n",obj.getName(), obj.getAge());
		}
		*/

		// ���(2)
		/*
		for (int i=0; i<v.size(); i++)
		{
			System.out.printf("�̸�: %s, ����: %d��\n", v.elementAt(i).getName(), v.elementAt(i).getAge());
		}
		*/

		// ���(3)
		/*
		for (int i=0; i<v.size(); i++)
		{
			System.out.printf("�̸�: %s, ����: %d��\n", v.get(i).getName(), v.get(i).getAge());
		}
		*/

		// ���(4)
		
		for(Object obj: v)
		{
			System.out.printf("�̸�: %s, ����: %d��\n", ((MyData)obj).getName(), ((MyData)obj).getAge());
		}
		

		// �ٸ� ����� Ǭ ���� ----------------------------------------------
		/*
		for(MyData a : v)
		{
			System.out.println(a + " ");
		}
		*/

	}
}

// ������
/*
�̸�: ��Ѹ�, ����: 73��
�̸�: �ڶ�ġ, ����: 7��
�̸�: ������, ����: 3��
*/
/* =====================================
���� �÷���(Collection) ����
=====================================*/

/*
�� Enumeration�� Iterator �������̽�

	Collection Framework ����
	Enumeration�� Iterator ��� �������̽��� �ִ�.
	�������� �ǹ̷δ� �ݺ�, ��ȯ �̶�� �ǹ̸� ������ ������
	� ��ü���� ������ ���� ��,
	�� ��ü���� � ������ ���� �ϳ��� �����Ͽ� ����ϱ� ����
	�������̽���� �� ���ִ�.

	- java.util.Enumeration<E> �������̽�
		: �� �ζ��̽��� ���� �� ���� �޼ҵ常�� �����ϸ�
		<hasMoreElements()> �޼ҵ带 ����
		�������̽� �ȿ� ���� ��Ұ� �ִ����� ���� ���Ǹ� �Ѵ�.
		���� true�� ��ȯ�Ǿ��ٸ� ���� �ε����� ��Ұ� �����Ѵٴ� �ǹ��̸�
		<nextElement()> �޼ҵ�� ���� ��ҿ� �����Ͽ� ����ϸ� �Ǵ� ���̴�.

	ex) //v ��� ���� �ڷᱸ���� ����� ��� ��� ���
		for(Enumeration e = b.elements(); e.hasMoreElements();)
		{
			System.out.println(e.nextElement());
		}
	
	- java.util.Iterator<E> �������̽�
		: Enumeration ���� �������� ���� ��remove()�� �޼ҵ尡 �߰��� �� ���̴�.
		Iterator�� ������ �ִ� ��hasNext()�� �� ��next()���޼ҵ��
		�̸��� �ణ �ٸ� �� Enmeration �������̽��� ������ �ִ�
		��hasMoreElements()���� �׸���nextElement()����		//** ������� ������ �ִ���
		��Ȯ�� ��ġ�ϴ� ����� �����Ѵ�.
		Enumeration ��� Iterator �� JDK 1.2 ���� �߰��Ͽ� ����ϰ� �� ������
		Enumeration �������̽��� ���� ������ ��Ҹ� ������ ����� ���� ������
		�̸� �����ϱ� ���� ���� ���� Iterator �������̽��̴�.
																//** Iterator�� remove��� �޼ҵ尡 �߰��Ǿ� ����/ Enumeration�� ����
																//** Iterator�� ����ϴ� Collection, Enumeration�� ����ϴ� Collection�� ����
*/
import java.util.Vector;
import java.util.Enumeration;
import java.util.Iterator;

public class Test164
{
	public static void main(String[] args)
	{
		// ���� �ڷᱸ�� �ν��Ͻ� ����
		Vector<String> v = new Vector<String>();

		// ���� �ڷᱸ�� v�� ��� �߰�
		v.add("Java");
		v.add("Oracle");
		v.add("Jsp");
		v.add("Servlet");
		v.add("String");

		//(1) Enumeration
		//	- haseMoreElement()
		//	- nextElement()
		Enumeration<String> e = v.elements();
		while(e.hasMoreElements())
		{
			System.out.println(e.nextElement());
		}
		System.out.println();
		//--==>> Java
		//		Oracle
		//		Jsp
		//		Servlet
		//		String

		System.out.println("------------------------------");
		//(2) Iterator
		//	- hasNext()
		//	- next()
		Iterator<String> it = v.iterator();
		while(it.hasNext())
		{
			System.out.println(it.next());
		}
		System.out.println();
		//--==>> Java
		//		Oracle
		//		Jsp
		//		Servlet
		//		String
	}

}
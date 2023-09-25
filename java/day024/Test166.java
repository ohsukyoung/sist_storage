/* =====================================
���� �÷���(Collection) ����
=====================================*/

/*
�� List
	- ������ ����, �迭�� ����, �ߺ��� ���
	- �ֿ� ���� Ŭ����
		��Vector (����ȭ ����)
		��ArrayList (����ȭ ���� �ȵ�)
		��LinkedList (ü��, ��ũ, ����, ť)
*/
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;

public class Test166
{
	public static void main(String[] args)
	{
		List<String> list = new ArrayList<String>();

		list.add("����");
		list.add("�λ�");
		list.add("��õ");
		list.add("�뱸");
		list.add("����");
		list.add("����");
		list.add("���");
		list.add("����");

		// Ȯ�� -> ���� Ȯ��
		//System.out.println(list);
		//--==>> [����, �λ�, ��õ, �뱸, ����, ����, ���, ����]

		System.out.println("��ü ����: " + list.size());
		//--==>> ��ü ����: 8
		
		// ù��° ��Ҹ� ���
		System.out.println("ù ��° ���: " + list.get(0));
		//--==>> ù ��° ���: ����

		// ������ ��Ҹ� ���
		System.out.println("������ ���: "+list.get(list.size()-1));
		//--==>> ������ ���: ����

		//ó�� ��ġ�� "�ѱ�" �߰�
		list.add(0,"�ѱ�");

		// Ȯ�� -> ���� Ȯ��
		//System.out.println(list);
		//--==>> [�ѱ�, ����, �λ�, ��õ, �뱸, ����, ����, ���, ����]

		// ó�� ��ġ�� ������(���)�� "���ѹα�"���� ����
		list.set(0,"���ѹα�");

		//System.out.println(list);
		//--==>> [���ѹα�, ����, �λ�, ��õ, �뱸, ����, ����, ���, ����]

		// ���� ���� ���� Ȯ��
		if(list.contains("����"))
		{
			System.out.println("������ �����մϴ�.");
		}
		//--==>> ������ �����մϴ�.

		// "����"�� �� ��° �ε����� ��ġ�ϴ��� Ȯ��
		int n = list.indexOf("����");
		System.out.println("������ ��ġ: "+ n);
		//--==>> ������ ��ġ: 1

		// "���ѹα�" ����� �� �������
		list.remove("���ѹα�");	//--(o)
		//list.remove(0);				//--(o)
		System.out.println(list);
		//--==>> [����, �λ�, ��õ, �뱸, ����, ����, ���, ����]

		// list �� ��ü ��� ���
		System.out.println("��ü ��� ���...(1)");
		for(int i=0; i<list.size(); i++)
		{
			System.out.printf("%s ", list.get(i));
		}
		System.out.println();
		//--==>> ��ü ��� ���...(1)
		//		���� �λ� ��õ �뱸 ���� ���� ��� ����

		System.out.println("���� ��� ���...(2)");
		for (int idx=list.size()-1; idx>=0 ; idx--)
		{
			System.out.print(list.get(idx)+ " ");
		}
		System.out.println();
		//--==>>���� ���... (1)
		//		���� ��� ���� ���� �뱸 ��õ �λ� ����

		System.out.println("��ü ��� ���...(2)");
		for (String s : list)
		{
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>> ��ü ��� ���...(2)
		//		���� �λ� ��õ �뱸 ���� ���� ��� ����
		
		System.out.println("��ü ��� ���...(3)");
		Iterator<String> it = list.iterator();
		while(it.hasNext())
		{
			String s = it.next();
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>> ��ü ��� ���...(3)
		//		���� �λ� ��õ �뱸 ���� ���� ��� ����

		System.out.println("��ü ���... (4)");
		ListIterator<String> li = list.listIterator();
		while(li.hasNext())
		{
			System.out.print(li.next() + " ");	
		}
		System.out.println();
		//--==>> ��ü ��� ���...(4)
		//		���� �λ� ��õ �뱸 ���� ���� ��� ����

		System.out.println("���� ���... (2)");
		while(li.hasPrevious())
		{
			String s = li.previous();
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>>���� ���... (2)
		//		���� ��� ���� ���� �뱸 ��õ �λ� ����

	}
}
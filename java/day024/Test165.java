/* =====================================
���� �÷���(Collection) ����
=====================================*/

// List �� Vector, ArrayList, LinkedList, ...
//	������ ����
//	���迭�� ����
//	���ߺ� ���

/*
�� ArrayList Ŭ����
	- ArrayList �� Vector Ŭ������
		List �� ũ�� ���濡 ������ �迭�� ������ ������
		�������� Vector Ŭ������ ��ü�� �⺻������ ����ȭ ������,
		ArrayList�� �׷��� �ʴٴ� ���̴�.

	- �񵿱�ȭ �÷����� ����ȭ�� �÷��Ǻ��� �� ���� ������ �����ϸ�
		��������� �÷����� ������ �ʿ䰡 ���� ���α׷�������
		�Ϲ������� ArrayList�� Vector���� �� ��ȣ�ϸ�,
		ArrayList�� ����ȭ�� ������� ���� Vector ó�� ���������ν�
		������ ����ȭ�� ������ �δ��� ������ �ʱ� ������
		Vector ���� �� ������ ����ȴ�.

	- null �� ������ ��� ��Ҹ� ����ϸ�
		List �������̽��� �����ϴ� �� �ܿ� ����Ʈ�� �ݳ��ϱ� ����
		���������� ���Ǵ� �迭�� ����� �����ϴ� �޼ҵ带 �����Ѵ�.

		//** Vector���� ArrayList �ӵ��� �� ������ ������ ArrayList ����

*/
import java.util.ArrayList;
import java.util.Vector;
import java.util.List;
import java.util.ListIterator;

public class Test165
{
	public static void main(String[] args)
	{
		// ArrayList �ڷᱸ�� ����
		//ArrayList<String> list = new ArrayList<String>();
		//List<String> list = new List<String>();		//--(X) //** List�� �������̽��� �ڷᱸ�� ����X

		//Vector<String> list = new Vector<String>();
		//List<String> list = new Vector<String>();
		List<String> list1 = new ArrayList<String>();

		// list1 �ڷᱸ���� ��� �߰� �� add()
		list1.add("�������̸�");
		list1.add("������Ż");
		list1.add("�˶��");

		List<String> list2 = new ArrayList<String>(list1);	//** (list1) ����Ʈ�� �޾ƿ�

		// lsit2 �ڷᱸ���� ��� �߰� �� add()
		list2.add("�����̴���");

		List<String> list3 = new ArrayList<String>();

		// list3�� list2�� ��ü��� �߰� �� addAll();
		list3.addAll(list2);

		// "�˶��" �տ� "ž��" �߰�
		// �� [�������̸�, ������Ż, �˶��, �����̴���]
		// �� [�������̸�, ������Ż, ž��, �˶��, �����̴���]

		// (1) "�˶��" ã�� �� indexOf() �� ��ġ �ε��� ��ȯ
		int n = list3.indexOf("�˶��");
		

		//�׽�Ʈ(Ȯ��)
		System.out.println("n: "+ n);
		//--==>> n: 2

		// (2) �˶�� ã�� �ε��� ��ġ�� "ž��" ���� �� add()
		//** ù��° �Ķ���Ϳ� �ε����� ������, �ش� �ε��� �տ� ����
		list3.add(n, "ž��");
		//--==>> [�������̸�, ������Ż, ž��, �˶��, �����̴���]



		//��� �� ���̵����� Ȯ��
		System.out.println("=======================================");
		System.out.println(list1);
		//--==>> [�������̸�, ������Ż, �˶��]

		System.out.println(list2);
		//--==>> []
		//--==>> [�������̸�, ������Ż, �˶��]
		//--==>> [�������̸�, ������Ż, �˶��, �����̴���] //** list2.add("�����̴���");�߰��� ���

		System.out.println(list3);
		//--==>> [�������̸�, ������Ż, �˶��, �����̴���]
		//--==>> [�������̸�, ������Ż, ž��, �˶��, �����̴���]

		//��� �� listIterator() �޼ҵ带 Ȱ���Ͽ� ���
		//** �������
		System.out.println("=======================================");
	
		ListIterator<String> li = list3.listIterator();
		while(li.hasNext())
		{
			System.out.print(li.next() + " ");
		}
		System.out.println();
		//--==>> �������̸� ������Ż ž�� �˶�� �����̴���

		// ��� �� �������� ����
		while(li.hasPrevious())		//** .hasPrevious(): ���� ���� ������ �ִ��� Ȯ��
		{
			System.out.print(li.previous() + " ");
		}
		System.out.println();
		//--==>> �����̴��� �˶�� ž�� ������Ż �������̸�

		/*
													��
		------------------------------------------  ------------------------
		�������̸� ������Ż ž�� �˶�� �����̴���  �������̸� ������Ż ...
		------------------------------------------  ------------------------
		*/
	}
}
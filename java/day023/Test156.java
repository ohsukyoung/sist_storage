/* =====================================
���� �÷��� �����ӿ�ũ(Collection Framwork) ����
=====================================*/

/*
�� ť(Queue)
	
	ť(Queue)�� ���Լ����� FIFO(First Input, First Output) ������
	���� �Էµ� �ڷḦ ���� ����ϸ�
	Queue �������̽��� ������ Ŭ������ ť�� ������ �پ��� ����� �����Ѵ�.


�� Queue �������̽� �������̽��� �����ϱ����ؼ���
	new �����ڸ� �̿��Ͽ� Queue �������̽��� ������(implements)
	Ŭ������ �����ڸ� ȣ���Ѵ�.

	ex) Queue ob = new LinkedList();

�� �ֿ� �޼ҵ�
	- E element()
		ť�� head ��Ҹ� ��ȯ�ϸ� �������� �ʴ´�.

	-bollean offer(E o)
		������ ��Ҹ� ť�� �����Ѵ�.

	-E peek()
		ť�� head ��Ҹ� ��ȯ�ϰ� �������� ������
		ť �ڷᱸ���� empty�� ��� null�� ��ȯ�Ѵ�.

	-E poll()
		ť�� head ��Ҹ� ��ȯ�ϰ� �����ϸ�
		ť �ڷᱸ���� empty�� ��� null�� ��ȯ�Ѵ�.

	- E remove()
		ť�� head ��Ҹ� ��ȯ�ϰ� �����Ѵ�.

/**���
				�� head ���(�ⱸ �ٷ� ����)
	��������������
 ��	 �������	��
	��������������
*/
import java.util.Queue;
import java.util.LinkedList;

public class Test156
{
	public static void main(String[] args)
	{
		// Queue �ڷᱸ�� ����
		//Queue myQue = new Queue();			//-(X)
		Queue<Object> myQue = new LinkedList<Object>();		//** ��ĳ���� ����� �ڷᱸ�� ����

		// ������ �غ�
		String str1 = "��Ѹ�";
		String str2 = "�ڶ�ġ";
		String str3 = "����Ŭ";
		String str4 = "�����";

		//myQue ��� Queue �ڷᱸ���� ������ �߰�
		myQue.offer(str1);
		myQue.offer(str2);
		myQue.offer(str3);
		//myQue.offer(str4);
		boolean test = myQue.offer(str4);
		System.out.println("test: " + test);
		//--==>> test: true

		// �׽�Ʈ(Ȯ��)
		System.out.println(myQue);
		//--==>> [��Ѹ�, �ڶ�ġ, ����Ŭ, �����]	�� ����
		//
		//** ���� �����Ͱ� �ƴϰ�, �������·� �ð������� Ȯ���� �� ������ ������ �� �� ����.

		// Queue �ڷᱸ�� myQue����
		// ��Ҹ� �������� �ʰ� head ��� ��ȯ
		System.out.println("��1: "+ (String)myQue.element());
		//** myQue.element()�� ������Ʈ���̾ String���� �ٿ�ĳ������
		System.out.println("��2: "+ (String)myQue.element());
		System.out.println("��3: "+ (String)myQue.element());
		//--==>> ��1: ��Ѹ�
		//		��2: ��Ѹ�
		//		��3: ��Ѹ�

		System.out.println();

		String val;

		// (1)

		/*
		// peek()
		//-- ť�� head ��� ��ȯ, ���� ����.
		//	 ť�� empt �� ��� null�� ��ȯ
		while (myQue.peek() != null)		//** myQue.peek(): Ȯ�θ�
		{
			//poll()
			//-- ť�� head ��� ��ȯ. ������
			// ť�� empty �� ��� null�� ��ȯ
			val = (String)myQue.poll();		//** myQue.poll(): Ȯ���ϰ� ����
			System.out.println("���: " + val);
		}
		System.out.println();
		*/
		//--==>> ���: ��Ѹ�
		//		���: �ڶ�ġ
		//		���: ����Ŭ
		//		���: �����

		
		// �׽�Ʈ
		/*
		while (myQue.poll() != null)		//** myQue.poll(): Ȯ���ϰ� ����
		{
			val = (String)myQue.poll();
			System.out.println("���: " + val);
		}
		System.out.println();
		//--==>> ���: �ڶ�ġ
		//		���: �����
		*/

		// (2)
		/*
		while(true)
		{
			val = (String)myQue.poll();

			if (val == null)		
			{
				break;			// if�� ���������°� �ƴ϶� �ݺ����� while ��������
			}else
			{			
				System.out.println("���: " + val);
			}

		}
		*/
		//--==>> ���: ��Ѹ�
		//		���: �ڶ�ġ
		//		���: ����Ŭ
		//		���: �����


		// (3)
		while (!myQue.isEmpty())
		{
			val = (String)myQue.poll();
			System.out.println("���:" + val);
		}
		System.out.println();
		//--==>> ���:��Ѹ�
		//		���:�ڶ�ġ
		//		���:����Ŭ
		//		���:�����



	}
}
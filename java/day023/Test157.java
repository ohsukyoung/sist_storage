/* =====================================
���� �÷���(Collection) ����
=====================================*/

import java.util.Queue;
import java.util.LinkedList;

public class Test157{

	// ���� ���ڿ� �迭 ���� �� �ʱ�ȭ
	private static final String[] colors = {"����","���","�ʷ�","�Ķ�","����","����"};

	public static void main(String[] args)
	{
		// Queue �ڷᱸ�� ����
		Queue<String> qu = new LinkedList<String>();
		//--Queue �ζ��̽� ����� �������̽��� �����ϱ� ���ؼ���
		//	new �����ڸ� �̿��Ͽ� Queue �ζ��̽��� iplements ��
		//	���� Ŭ������ �����ڸ� ȣ���ؾ� �Ѵ�.

		// qu��� Queue �ڷᱸ����
		// colors �迭�� ������ ��� �Է�
		/*
		for (int i=0; i<color.length ;i++ )
		{
			qu.offer(colors[i]);
		}

		while (!qu.isEmpty())
		{
			val = (String)qu.poll();
			System.out.println("���:" + val);
		}
		System.out.println();
		*/

		for (String color: colors )
		{
			qu.offer(color);
		}
		/*
		qu��� Queue �ڷᱸ���� ��� ������ ��ü ���
		peek()
		: ť�� head ��Ҹ� ��ȯ�ϰ� �������� ������
			ť�� �ڷᱸ���� ����ִ� ���°� �Ǹ� null ��ȯ
		poll()
		: ť�� head ��Ҹ� ��ȯ�ϰ� �����ϸ�
			ť�� �ڷᱸ���� ����ִ� ���°� �Ǹ� null ��ȯ
		*/

		while(!(qu.isEmpty()))
		{
			String color = qu.poll();
			System.out.printf("%s ", color);
		}
		System.out.println();
	}
}

// ���� ���

// ���� ��� �ʷ� �Ķ� ���� ����
// ����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
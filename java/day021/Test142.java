/*
�ڹ��� �ֿ�(�߿�) Ŭ����
- �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
- Calendar Ŭ����
*/

/*
�� Calendar Ŭ������ �߻� Ŭ�����̱� ������ ��ü�� ������ �� ����.
   (�߻� Ŭ���� : �̿ϼ��� Ŭ���� �� ����� ���� �����ϴ� Ŭ����)

   Calendar ob = new Calendar();
   �� �̿� ���� ������ ���� �ν��Ͻ� ���� �Ұ�


�� Calendar Ŭ���� ��ü(�ν��Ͻ�)�� ������ �� �ִ� ���

   1. Calendar ob1 = Calendar.getInstance();

   2. Calendar ob2 = new GregorianCalendar();
      // GregorianCalendar gc = new GregorianCalendar();
	  // Calendar ob2 = gc;
	  // Calendar ob2 = (Calendar)gc;

   3. GregorianCalendar ob3 = new GregorianCalendar();

     (GregorianCalendar : Calendar Ŭ������ ���� Ŭ����)
*/

// ��, ��, ��, ������ Calendar ��ü�κ��� ������ ���

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Test142
{
	public static void main(String[] args)
	{
		
		Calendar rightNow = Calendar.getInstance();

		// ������ �޷� �ν��Ͻ��� ����
		// ��¥ ���� ������ �� �� �ִ� �޼ҵ� �� get()

		int y = rightNow.get(Calendar.YEAR);
		System.out.println(y);
		// 2023

		int m = rightNow.get(Calendar.MONTH) + 1;
		System.out.println(m);

		int d = rightNow.get(Calendar.DATE);
		System.out.println(d);

		int w = rightNow.get(Calendar.DAY_OF_WEEK);
		System.out.println(w);


		/*
		System.out.println(Calendar.SUNDAY);		// 1 �� �Ͽ���
		System.out.println(Calendar.MONDAY);		// 2 �� ������
		System.out.println(Calendar.TUESDAY);		// 3 �� ȭ����
		System.out.println(Calendar.WEDNESDAY);		// 4 �� ������
		System.out.println(Calendar.THURSDAY);		// 5 �� �����
		System.out.println(Calendar.FRIDAY);		// 6 �� �ݿ���
		System.out.println(Calendar.SATURDAY);		// 7 �� �����
		*/
		
		System.out.println(y+ "-" + m + "-"+d + " " + w);

		String week = "";

		/*
		switch (w)
		{
		case Calendar.SUNDAY : week = "�Ͽ���";break;
		case Calendar.MONDAY : week = "������";break;
		case Calendar.TUESDAY : week = "ȭ����";break;
		case Calendar.WEDNESDAY : week = "������";break;
		case Calendar.THURSDAY : week = "�����";break;
		case Calendar.FRIDAY : week = "�ݿ���";break;
		case Calendar.SATURDAY : week = "�����";break;		
		}
		*/
		switch (w)
		{
		case 1 : week = "�Ͽ���";break;
		case 2 : week = "������";break;
		case 3 : week = "ȭ����";break;
		case 4 : week = "������";break;
		case 5 : week = "�����";break;
		case 6 : week = "�ݿ���";break;
		case 7 : week = "�����";break;		
		}


		System.out.println(y+ "-" + m + "-"+d + " " + week);
		// 2023-9-19 ȭ����
		
		System.out.println("////////////////////////////////////////////////////////////");


		// Calendar ��ü ����

		Calendar rightNow2 = new GregorianCalendar();

		String[] week2 = {"�Ͽ���","������","ȭ����","������","�����","�ݿ���","�����"};

		// �޷��� ��¥ ���� �� set() �޼ҵ� Ȱ��
		rightNow2.set(2024, 2, 19);		// 2024�� 3�� 19��

		System.out.println(rightNow2.get(Calendar.DAY_OF_WEEK));
		// 3

		System.out.println(week2[rightNow2.get(Calendar.DAY_OF_WEEK)-1]);
		// ȭ����


	}
}

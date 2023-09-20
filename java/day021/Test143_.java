/* =====================================
���� �ڹٿ��� �ֿ�(�߿�) Ŭ���� ����
- �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
- Calendar Ŭ����
=====================================*/

/*
�� java.util.Calendar Ŭ������
��¥�� �ð��� ��ü �𵨸�ȭ �� Ŭ������
	��, ��, ��, ����, ��, ��, �� ������
	�ð��� ��¥�� ���õ� ������ �����Ѵ�.
	�׸���, Calendar Ŭ������ �߻�Ŭ���� �̹Ƿ� ���� ��ü�� ������ �� ������
	�������� �޼ҵ� ������ Caledar Ŭ������ ���� Ŭ������
	GregorianCalednar Ŭ������ ���� �Ǿ� �ִ�.

	�ý������κ��� ���� �ý��� �ð� ������ ���� ��
	getInstance()��� ����(static)�޼ҵ带 �̿��Ͽ� ��ü�� ������ �� �ִ�.
	������ Calendar Ŭ���� ��ü�� �ý����� ���� ��¥�� �ð� ������ ������,
	�� ��ü�� �����Ǹ� �����ִ� �ð� ��������
	get() �޼ҵ带 �̿��Ͽ� ���� ������(�����) �� �ִ�.

	getInstance() �޼ҵ�� ���������� GregorianCalender ��ü�� �����Ͽ�
	��ȯ�� �ֱ� ������ GregorianCalendar ��ü�� ���� �����Ͽ� ��¥ �ð� ������
	���� ���� �ִ�.

*/

/*
�� �ǽ� ����
	����ڷκ��� ��, ���� �Է¹޾�
	�޷��� �׷��ִ�(����ϴ�) ���α׷��� �����Ѵ�.
	��, Calendar Ŭ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
	�� API Document �����Ͽ� getActualMaximum() �޼ҵ��� Ȱ�� ��� ������ �� ~!!!

���� ��)
���� �Է�	: 0
���� �Է�	: 2024
�� �Է�		: -10
�� �Է�		: 13
�� �Է�		: 5


	[ 2024�� 5�� ]
 ��  ��  ȭ  ��  ��  ��  ��
 ===========================
 			  1   2   3   4
  5   6   7   8   9  10  11
 12  13  14  15  16  17  18
 19  20  21  22  23  24  25 
 26  27  28  29  30  31
 ===========================
 ����Ϸ��� �ƹ� Ű�� ��������...

*/
import java.util.Scanner;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test143_
{
	public static void main(String[] args) throws IOException
	{
		// ���� Ǭ Ǯ�� -----------------------------
		/*
		Scanner sc = new Scanner(System.in);
		Calendar rightNow2 = Calendar.getInstance();

		int y, m, w;
		y = m = w =0;

		do
		{
			System.out.print("���� �Է� :");
			y = sc.nextInt();
		}
		while (y<=0);

		do
		{
			System.out.print("�� �Է� :");
			m = sc.nextInt();
		}
		while (m<=0 || m>12);

		rightNow2.set(y,m-1,1);	// 2024�� 3�� 19��

		//System.out.println(rightNow2.get(Calendar.DAY_OF_WEEK));
		w = rightNow2.get(Calendar.DAY_OF_WEEK)-1;
		
		System.out.println();
		System.out.printf("      [ %d�� %d�� ]\n", y, m);
		System.out.println("  ��  ��  ȭ  ��  ��  ��  ��");
		System.out.println(" ===========================");

		for(int i=1; i<= w; i++)
		{
			System.out.print("    ");
		}
		
		int lastDay = rightNow2.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		for (int i=1; i<=lastDay ; i++ )
		{
			System.out.printf("%4d", i);
			w++;

			if(w%7==0)
				System.out.println();
 
		}
		if(w%7!=0)
			System.out.println();
	
		System.out.println("============================");
		*/

		// �Բ� Ǭ Ǯ�� -----------------------------
		// BufferedReader �ν��Ͻ� ����
		BufferedReader br  = new BufferedReader(new InputStreamReader(System.in));
		
		// Calendar �ν��Ͻ� ����
		Calendar cal = Calendar.getInstance();

		int y,m;	// ��, ��
		int w;		// ����
		int i;		// ���� ����

		do
		{
			System.out.print("���� �Է� :");
			y = Integer.parseInt(br.readLine());
		}
		while (y<1);

		do
		{
			System.out.print("�� �Է� :");
			m = Integer.parseInt(br.readLine());
		}
		while (m<1 || m>12);

		// ����ڷκ��� �Է¹��� ��(y), ��(m)�� �̿��Ͽ�
		// �޷��� ��¥ ����
		cal.set(y, m-1, 1);
		//-- �� ���� �� �Է°�(m)�� �״�� ����ϴ� ���� �ƴ϶�
		//		�Է� ������ 1�� �� ������ ���� �����ؾ� �Ѵ�.
		//-- �� ������ �Է¹��� ���� �ش��ϴ� 1�Ϸ� �����ؾ� �Ѵ�.
		//		1���� ������ Ȯ���ؾ� �޷��� �׸� �� �ִ�.

		// ���õ� �޷��� ��¥�κ��� ���� ��������
		w = cal.get(Calendar.DAY_OF_WEEK);

		// �׽�Ʈ(Ȯ��)
		System.out.println("w: " + w);
		//--==>> ���� �Է� :2023
		//		�� �Է� :12
		//		w: 6 �� 2023�� 12�� ���� �� �ݿ��� �� 2023�� 12�� 1���� �ݿ���
		
		// ��� ��� �� �޷� �׸���
		System.out.println();
		System.out.println("\t[ " + y + "�� " + m + "�� ]\n");
		System.out.println("  ��  ��  ȭ  ��  ��  ��  ��");
		System.out.println("==============================");

		for (i = 1; i<w ; i++)
		{
			System.out.print("    ");	// ���� 4ĭ �߻�
		}

		// �׽�Ʈ(Ȯ��)
		//System.out.printf("%4d", 1);
		//System.out.println(cal.getActualMaximum(Calendar.DATE));

		//Calendar Ŭ���� ��getActualMaximum()�� �޼ҵ�			//check~!!!
		for (i=1; i<=cal.getActualMaximum(Calendar.DATE)  ; i++ )
		{
			System.out.printf("%4d", i);	//-- �ݺ����� �����ϸ� ��¥�� ������ �� ����
			w++;							//		���ϵ� �Բ� ������ �� �ֵ��� ó��
			if(w%7==1)						//-- �̷��� ������ ������ �Ͽ����� �� ������
				System.out.println();		//		���� �� ����� �� �ֵ��� ó��
		}
		if(w%7!=1)							//-- �Ͽ��� ������ ������� �ʾ��� ��쿡��..
			System.out.println();			//-- ����ó��

		System.out.println("==============================");
		

	}
}
/* =====================================
���� Ŭ������ �ν��Ͻ� ����
- Ŭ���� ����
- �迭�� Ȱ��
- �������������ڿ� ��������
=====================================*/

// ����ڷκ��� ��, ��, ���� �Է¹޾�
// �ش� ��¥�� ������ ����ϴ� ���α׷��� �����Ѵ�.
// ��, �޷� Ŭ����(Calendar)�� ������� �ʴ´�.
// ���� Ŭ������ ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
// (�� WeekDay Ŭ���� ����)
// �׸��� �迭�� ���䵵 ������� �ۼ��� �� �ֵ��� �Ѵ�.
// ���� ������������ ���䵵 Ȯ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.

// ����������...
// WeekDay Ŭ����  ���踦 ����
// Test099 Ŭ������ main() �޼ҵ尡 ���������� ���α׷� ���� �� �� �ֵ��� �Ѵ�.

// ���� ��)
// �� �� �� �Է�(���� ����): 2023 9 7
// >> 2023�� 9�� 7�� �� �����
// ����Ϸ��� �ƹ� Ű�� �Է��ϼ���...


// �� Hint
//		- 1�� 1�� 1�� �� "������"
//		- 1���� 365���� �ƴϴ�
//			2���� ������ ��¥�� 29 �� ����
//			2���� ������ ��¥�� 28 �� ���
//		- ������ �Ǻ� ����
//			�⵵�� 4�� ����̸鼭 100�� ����� �ƴϰų�,
//			400�� ����̸� ����, �� �̿��� �⵵�� ���


import java.util.Scanner;
import java.io.IOException;

// ���� Ǭ ���� --------------------------
/*
public class Test099
{
	public static void main(String[] args) throws IOException
	{
		WeekDay ob1 = new WeekDay();
		ob1.input();			// �Է¹ޱ�
		ob1.yoonCount();		// ���� �⵵ �������� ���� ��
		ob1.thisYearYoon();		// �ش� �⵵�� ��������
		ob1.MonSum();			// ������ ���ϱ�
		ob1.write();			// ���

	}
}

class WeekDay
{
	Scanner sc = new Scanner(System.in);
		
		// �ʱⰪ ����
		int in_year, in_mon, in_day;	// �Է¹��� ��,��,��
		int total_sum=0;				// �Է¹��� ����� ���� ��
		int index=0;					// ���� �ε����ѹ�
		int yoon=0;						// �ش� �⵵���� ������ �� �� �ִ���
		int mon_sum=0;					// �� ���� ��

		//mon��¥��			1    2   3   4   5   6   7   8   9  10  11  12
		int[] month_arr1 = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};	// ���
		int[] month_arr2 = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};	// ����
		int[] arr_change;														// �������� ��������� ���� ����� �迭
		String[] week_arr = {"��","��","��","ȭ","��","��","��"};

		// �Է¹ޱ�
		public void input()
		{
			System.out.print("�� �� �� �Է�(���� ����): ");
			in_year = sc.nextInt();
			in_mon = sc.nextInt();
			in_day = sc.nextInt();
		}
		

		// ���� �⵵ �������� ���� ��
		void yoonCount()
		{
			for(int i=1; i<in_year; i++)
			{
				if(((i%4==0) && (i%100!=0)) || i%400==0)
				{
					yoon += 1;
				}
				
			}
		}
		
		// �ش� �⵵�� ��������
		void thisYearYoon() 
		{
			if(((in_year%4==0) && (in_year%100!=0)) || in_year%400==0)
				arr_change = (int[])month_arr2.clone();		// ����
			else
				arr_change = (int[])month_arr1.clone();		// ���
		}

		
		// ������ ���ϱ�
		void MonSum()
		{
			for(int i=0; i<in_mon-1; i++)
			{
				mon_sum += arr_change[i];
			}
		}
		
		// ���
		public void write()
		{
			//total_sum = in_year*365 + in_mon*30 + in_day;
			total_sum = in_year*365 + yoon + mon_sum + in_day;

			index = total_sum%7;

			System.out.printf(">> %d�� %d�� %d�� �� %s\n", in_year, in_mon, in_day, week_arr[index]);
		}

		
}
*/

// �ٸ������ Ǭ ���� --------------------------
/*
public class Test099
{
	public static void main(String[] args) throws IOException
	{
		Weekday wd = new Weekday();

		wd.input();						// �Է�â

		wd.dayCal();					// ��¥ ���

		wd.printDay();					// ��� ���
	}
}
class Weekday
{
	int y,m,d;														// ��, ��, ��
	int daySum;														// �Է¹��� ��¥�� �� �������� �ٲپ� �������� ����
	int answer;
	String[] dayText = {"�Ͽ���", "������", "ȭ����", "������", "�����", "�ݿ���", "�����"};

	void input() throws IOException
	{	
		Scanner sc = new Scanner(System.in);

		System.out.print("�� �� �� �Է�(���� ����) : ");
		y = sc.nextInt();											// �� �� �� �Է� �ޱ�
		m = sc.nextInt();
		d = sc.nextInt();
	}
	
	void yearCal()
	{
		int[] yearDay = new int[y];
		
		for(int i = 1; i < y; i++)
		{
			if((i % 4 == 0 && i % 100 != 0) || i % 400 == 0)		// �����̸� 366 �����ְ�
				daySum += 366;
			else													// ����̸� 365 ������
				daySum += 365;
		}
	}

	void monthCal()
	{
		int[] monthDay = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};		// ���
		int[] monthDay4 = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};		// ����
		
		if((y % 4 == 0 && y % 100 != 0) || y % 400 == 0)						// �����̸� ���� �迭���� ���
		{
			for(int i = 1; i < m; i++)
				daySum += monthDay4[i - 1];
		}
		else
		{
			for(int i = 1; i < m; i++)											// ����̸� ��� �迭���� ���
				daySum += monthDay[i - 1];
		}
	}
	void dayCal()
	{
		yearCal();																// �⵵ ���
		monthCal();																// �� ���
		

		daySum += d;

		answer = daySum % 7;
		//System.out.println(answer);
		//System.out.printf(">> %d�� %d�� %d�� �� %s", y, m, d, dayText[answer]);
	}
	void printDay()
	{
		System.out.printf(">> %d�� %d�� %d�� �� %s\n", y, m, d, dayText[answer]);
	}

}
*/

// �Բ� Ǭ ���� --------------------------
class WeekDay
{
	// �ֿ� ���� ���� �� �Ӽ�
	private int y, m, d;		//-- ����ڰ� �Է��� ��, ��, ���� ��Ƴ� ����
	
	// �޼ҵ� ���� �� ���: ��, ��, �� �Է¹ޱ�
	public void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("�� �� �� �Է�(���� ����): ");		//-- 2024 3 19
		y = sc.nextInt();									//-- 2024
		m = sc.nextInt();									//-- 3
		d = sc.nextInt();									//-- 9
	}

	// �޼ҵ� ���� �� ���: ���� �����ϱ�
	//public void week()
	//public int week()
	public String week()
	{
		// �� ���� ������ ��¥(�� ���� �ִ밪)�� �迭 ���·� ����
		int[] months = {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		
		// Ȯ��
		//System.out.println(months.length);
		//--==>> 12

		// �� ���� ������ ����
		int nalsu;

		//���� Ȯ�� ����
		int w;

		// ���� Ÿ��Ʋ�� �迭 ���·� ����
		String[] weekNames = {"��", "��", "ȭ", "��", "��", "��", "��"};

		// ���⿡ ���� 2���� �� �� ���
		// �Է� �⵵�� �����̶��... 2���� ������ ��¥�� 29�Ϸ� ����
		// �Է� �⵵�� ����̶��... 2���� ������ ��¥�� 28�Ϸ� ����
		if(y%4==0 && y%100!=0 || y%400==0)		//-- �Է³⵵�� �����̶��
		{
			// 2���� ������ ��¥�� 29�Ϸ� ����
			months[1] = 29;
		}
		else									//-- �Է³⵵�� ������ �ƴ϶��.. ����̶��..
		{
			// 2���� ������ ��¥�� 28�Ϸ� ����
			months[1] = 28;
		}

		//		ex) 2024 3 19 �� 1.1.1. ~ 2023.12.31
		// �� 1�� 1�� 1�Ϻ��� �Է¹��� �⵵�� �����⵵ 12�� 31�� ������ �� �� ���
		//					  --------------
		//							y
		//					  ------------------------
		//								(y-1)

		nalsu = (y-1)*365 + (y-1)/4 - (y-1)/100 + (y-1)/400;
		//      ---------
		//		�⺻�ֱ�
		//					--------
		//					4�⸶��+1
		//							   ---------
		//							100�⸶��+1(X)
		//										  ----------
		//										  400�⸶��+1
		//*** �ڹٽ�ũ��Ʈ�� ����X, �������� ó������ �� ������ ������ �ڹٿ� �ٸ���� ó��X

		// Ȯ��(�׽�Ʈ)
		//System.out.println("�� ��"+ nalsu);
		//--==>> �� �� �� �Է�(���� ����): 2024 3 19
		//		�� ��738885
		//		     ------
		//		1.1.1 ~ 2023.12.31���� �� ��


		// �� �Է¹��� ���� ���� �� ������ �� �� ��� ��
		//		�� ����� 1�� ����� ���ϴ� ����
		//		ex) 2024 3 19 �� + 2024.1.1 ~ 2024.2.29
		for(int i=0; i<(m-1); i++)
		{
			nalsu += months[i];
		}

		// Ȯ��(�׽�Ʈ)
		//System.out.println("�� ��"+ nalsu);
		//--==>> �� �� �� �Է�(���� ����): 2024 3 19
		//		�� ��738945
		//		     ------
		//			738885 + 31 + 39 = 738945
		//			1.1.1 ~ 2024.2.29 ������ �� ��


		// �� �Է¹��� ���� ��¥��ŭ �� �� ��� ��
		//		�� ����� 2���� ����� ���ϴ� ����
		//		ex) 2024 3 19 �� + 19
		// ==>> 1.1.1 ~ 2024.3.19 ��~~~~ ��¥��
		nalsu += d;

		// Ȯ��(�׽�Ʈ)
		//System.out.println("�� ��"+ nalsu);
		//--==>> �� �� �� �Է�(���� ����): 2024 3 19
		//		�� ��738945
		//		     ------
		//			738945 + 19 = 738964
		//			1.1.1 ~ 2024.2.29 ������ �� ��

		//----------------------------------------------- �� �� ���� ��

		// ���� �������� Ȯ���ϱ� ���� ����
		w = nalsu % 7;		//-- ��ü �� �� %7 == 0 �� ��
							//-- ��ü �� �� %7 == 1 �� ��

		// �׽�Ʈ(Ȯ��)
		//System.out.println("w:"+w);
		//--==>> w:2
		//			�� ��ü �� �� % 7 == 2 �� ȭ����

		//return w;
		return weekNames[w];
	}

	// �޼ҵ� ���� �� ���: ��� ����ϱ�
	public void print(String day)
	{
		System.out.printf(">> %d�� %d�� %d�� �� %s����\n", y, m, d, day);
	}
}


public class Test099
{
	public static void main(String[] args) throws IOException
	{
		// WeekDay Ŭ���� ��� �ν��Ͻ� ����
		WeekDay wd = new WeekDay();

		// �Է� �޼ҵ� ȣ��
		wd.input();

		// ���� ���� �޼ҵ� ȣ��
		String result = wd.week();

		// ���� ��� ��� �޼ҵ� ȣ��
		wd.print(result);
	}
}

// ���� ���
/*
�� �� �� �Է�(���� ����): 2024 3 19
>> 2024�� 3�� 19�� �� ȭ����
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
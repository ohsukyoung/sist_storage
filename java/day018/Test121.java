/* =====================================
���� Ŭ���� ��� ����
- �������̽�(Interface)
=====================================*/

// �� �ǽ� ����
//		���� ó�� ���α׷��� �����Ѵ�.
//		��, �������̽��� Ȱ���� �� �ֵ��� �Ѵ�.

// ���� ��)
// �ο� �� �Է�(1~10): 11
// �ο� �� �Է�(1~10): 0
// �ο� �� �Է�(1~10): 2

// 1��° �л��� �й� �̸� �Է�(���� ����): 2309123 ȫ�浿
// ���� ���� ���� ���� �Է�	  (���� ����): 90 100 85
// 2��° �л��� �й� �̸� �Է�(���� ����): 2309125 ��ȭȫ
// ���� ���� ���� ���� �Է�	  (���� ����): 85 70 60

// 2309123 ȫ�浿	90 100  85	xxx		xx.xx
//					��  ��  ��
// 2309125 ��ȭȫ	85  70  60	xxx		xx.xx
//					��  ��  ��

// ����Ϸ��� �ƹ� Ű�� ��������...

// 90 �̻� �� ��
// 80 �̻� 90�̸� �� ��
// 70 �̻� 80�̸� �� ��
// 60 �̻� 70�̸� �� ��
// 60�̸�(�׿�) �� ��

import java.util.Scanner;

// �Ӽ��� �����ϴ� Ŭ���� �� �ڷ��� Ȱ��
class Record
{
	String hak, name;		//-- �й�, �̸�
	int kor, eng, mat;		//-- ����, ����, ����
	int tot;				//-- ����
	double avg;				//-- ���
}

// �������̽�
interface Sungjuk
{
	public void set();		//-- �ο� ����
	public void input();	//-- ������ �Է�
	public void print();	//-- ��� ���
}

// ���� �ذ� �������� ������� �� Ŭ���� �� Sungjuk �������̽��� �����ϴ� Ŭ����
class SungjukImpl implements Sungjuk
{
	private int inwon;
	private Record[] rec;

	@Override
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		do
		{
			System.out.print("�ο� �� �Է�(1~10): ");
			inwon = sc.nextInt();
		}
		while (inwon<0 || inwon>10);

		rec = new Record[inwon];
	}

	@Override
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		for(int i=0; i<inwon; i++)
		{		
			rec[i] = new Record();

			System.out.printf("%d��° �л��� �й� �̸� �Է�(���� ����): ",i+1);
			rec[i].hak = sc.next();
			rec[i].name = sc.next();

			System.out.printf("���� ���� ���� ���� �Է�	  (���� ����): ",i);
			rec[i].kor = sc.nextInt();
			rec[i].eng = sc.nextInt();
			rec[i].mat = sc.nextInt();

			rec[i].tot = rec[i].kor + rec[i].eng + rec[i].mat;
			rec[i].avg = rec[i].tot/3.0;

		}
	}

// 2309123 ȫ�浿	90 100  85	xxx		xx.xx
//					��  ��  ��
	@Override
	public void print()
	{
		System.out.println();
		for(int i=0; i<inwon; i++)
		{
			System.out.printf("%s %s	%d %d  %d	%d	%.2f\n", rec[i].hak, rec[i].name, rec[i].kor, rec[i].eng, rec[i].mat, rec[i].tot, rec[i].avg );
			System.out.printf("                %s  %s  %s\n", panjung(rec[i].kor), panjung(rec[i].eng), panjung(rec[i].mat));
		}
	}

// 90 �̻� �� ��
// 80 �̻� 90�̸� �� ��
// 70 �̻� 80�̸� �� ��
// 60 �̻� 70�̸� �� ��
// 60�̸�(�׿�) �� ��

	// ���������� ��޿� ���� ������ ������ �޼ҵ�
	private String panjung(int score)
	{	
		if(score >= 90)
			return "��";
		else if(score >= 80 && score<90)
			return "��";
		else if(score >= 70 && score<80)
			return "��";
		else if(score >= 60 && score<70)
			return "��";
		else
			return "��";
	}
	
}




public class Test121
{
	public static void main(String[] args)
	{
		Sungjuk ob;	//�������̽� Ÿ��

		// ���� �ذ� �������� �ۼ��ؾ� �� ob ���� �� ��ü ����
		ob = new SungjukImpl();

		ob.set();	//((SungjukImpl)ob).set()�� �ٿ�ĳ�����ؼ� �����ص� OK
		ob.input();	// �� ĳ��Ʈ�� ����� �������̵� �Ǿ� �ҷ�����
		ob.print();

		// test: panjung�� public���� �ٲ� ��� �ٿ�ĳ���õǾ� ���డ��
		//System.out.print(((SungjukImpl)ob).panjung(90));
	}
}

// ���� ���
/*
�ο� �� �Է�(1~10): 2
1��° �л��� �й� �̸� �Է�(���� ����): 2309123 ȫ�浿
���� ���� ���� ���� �Է�          (���� ����): 90 100  85
2��° �л��� �й� �̸� �Է�(���� ����): 2309125 ��ȭȫ
���� ���� ���� ���� �Է�          (���� ����): 85  70  60

2309123 ȫ�浿  90 100  85      275     91.67
                ��  ��  ��
2309125 ��ȭȫ  85 70  60       215     71.67
                ��  ��  ��
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
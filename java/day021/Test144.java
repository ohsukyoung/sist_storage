/* =====================================
���� �ڹٿ��� �ֿ�(�߿�) Ŭ���� ����
- �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
- Calendar Ŭ����
=====================================*/

// �� ������ �������� �Է¹޴� ��¥��ŭ ���� ��,��,��,������
//		Ȯ���Ͽ� ����� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��
// ����  ��¥: 2023-9-19 ȭ����
// �� �� ���� ��¥�� Ȯ���ϰ��� �Ͻʴϱ�?: 200

//========[Ȯ�� ���]========
//200�� �� : xxx-xx-xx x����
//===========================
// ����Ϸ��� �ƹ� Ű��...

// �� Calendar�� ������ API Document ����
//		��add()��
//		: ���� ��¥�� �������� �� �� ���ϴ� ���� �޼ҵ�
//		�� ����ü.add(Calendar.DATE)��

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

import java.util.Calendar;
import java.util.GregorianCalendar;

import java.util.Scanner;

public class Test144
{
	public static void main(String[] args) throws IOException
	{
		// ���� Ǭ Ǯ�� -----------------------------
		/*
		// �ν��Ͻ� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		Calendar cal = Calendar.getInstance();

		int y,m,d,w;
		String week="";
		int plusDay;
		
		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH);
		d = cal.get(Calendar.DATE);
		w = cal.get(Calendar.DAY_OF_WEEK);
		
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

		System.out.printf("����  ��¥: %d-%d-%d %s\n", y, m, d, week);
		System.out.print("�� �� ���� ��¥�� Ȯ���ϰ��� �Ͻʴϱ�?:");
		plusDay = Integer.parseInt(br.readLine());
		
		cal.add(Calendar.DAY_OF_MONTH, plusDay);

		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1;
		d = cal.get(Calendar.DAY_OF_MONTH);
		w = cal.get(Calendar.DAY_OF_WEEK);

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
			
		//========[Ȯ�� ���]========
		//200�� �� : xxx-xx-xx x����
		//===========================

		System.out.println("========[Ȯ�� ���]========");
		System.out.printf("%d�� �� : %d-%d-%d %s\n", plusDay, y, m, d, week);
		System.out.println("===========================");
		*/

		// �Բ� Ǭ Ǯ�� -----------------------------
		Scanner sc = new Scanner(System.in);

		Calendar now = Calendar.getInstance();

		// �ֿ� ���� ����
		int nalsu;						//-- ����ڷκ��� �Է¹��� �� ��
		int y,m,d,w;					//-- ��, ��, ��
		String[] week = {"��","��","ȭ","��","��","��","��"};

		// ������ ��, ��, ��, ���� Ȯ��(�� �������� : get());
		y = now.get(Calendar.YEAR);
		m = now.get(Calendar.MONTH)+1;
		d = now.get(Calendar.DATE);
		w = now.get(Calendar.DAY_OF_WEEK);
		
		// ������ ��, ��, ��, ���� Ȯ�ΰ�� ���
		System.out.printf("����  ��¥: %d-%d-%d %s����\n", y, m, d, week[w-1]);
		do
		{
			System.out.print("�� �� ���� ��¥�� Ȯ���ϰ��� �Ͻʴϱ�?:");
			nalsu = sc.nextInt();
		}
		while (nalsu<1);

		// check~!!!
		now.add(Calendar.DATE, nalsu);

		// ��� ���
		System.out.println();
		System.out.println("========[Ȯ�� ���]========");
		System.out.printf("%d�� �� : %tF %tA\n", nalsu, now, now);
		System.out.println("===========================");

		//String.format("%tf", �޷°�ü);
		// �� ����-��-�ϡ� ������ ���ڿ� ��ȯ
		//** tF / t: �޷�..�̶� ���� ��

		//String.format("%tA", �޷°�ü);
		// �� ���� ������ ���ڿ� ��ȯ
	}
}
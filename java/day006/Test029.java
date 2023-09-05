/* =====================================
���� ������(Operator) ����
 - ���ǿ����� == ���׿�����
=====================================*/

// ����ڷκ��� ������ ���� �ϳ��� �Է¹޾�
// ���ĺ� �빮���̸� �ҹ��ڷ� ...
// ���ĺ� �ҹ����̸� �빮�ڷ�...
// ���ĺ��� �ƴ� ��Ÿ ���ڶ�� �� ���ڸ� �״��...
// ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// �� ���� �Է�: A
// A �� a
// ����Ϸ��� �ƹ� Ű�� ��������...

// �� ���� �Է�: b
// b �� B
// ����Ϸ��� �ƹ� Ű�� ��������...

// �� ���� �Է�: 7
// 7 �� 7
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
												�빮��X,�ҹ���X
														��
�빮�� ? �ҹ��ڷκ�ȯ : ( �ҹ��� ? �빮�ڷκ�ȯ : �ִ� �״��);
						  ------   ------------   -----------
						     1          2              3
------   ------------   --------------------------------------
  1           2                          3
*/

public class Test029
{
	public static void main(String[] args) throws IOException{
		// ���� Ǭ ���� --------------------------
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		char num, change_num;

		System.out.printf("�� ���� �Է�: ");
		num = br.readLine().charAt(0);
		//-- CharAt() : ���ڿ� �� ������ ���ڸ� char������ ��ȯ

		change_num = Character.isDigit(num)? num : 
					(Character.isUpperCase(num) ? Character.toLowerCase(num) : 
					(Character.isLowerCase(num) ? Character.toUpperCase(num) : Character.toLowerCase(num)));
		// isDigit ���� true, �ƴϸ� false
		// isUpperCase �빮�� true, �ƴϸ� false
		// isLowerCase �ҹ��� true, �ƴϸ� false
		// toLowerCase �ҹ��ڷ� ��ȯ
		// toUpperCase �빮�ڷ� ��ȯ

		System.out.println(num + " �� " + change_num);
		*/


		// �Բ� Ǭ ���� --------------------------
		/*
		//������ 2�� �̻� �� ��������
		char temp;

		System.out.print("�� ���� �Է�: ");
		temp = (char)System.in.read();

		//System.out.println("�Է¹��� �� Ȯ��: " + temp);

		//�빮��? �빮�ھƴ�?
		//temp == 'A' �� 65
		//temp == 'B' �� 66
		//temp == 'c' �� 67
		//	   ��
		//temp == 'Z' �� 90

		//String result = (temp>=65 && temp<=90) ? "�빮��" : "�빮��X";
		//System.out.println("���: " + result);

		//String result = (temp>='A' && temp<='Z') ? "�빮��" : "�빮��X";
		//System.out.println("���: " + result);

		String result = (temp>='a' && temp<='z') ? "�ҹ���" : "�ҹ���X";
		System.out.println("���: " + result);

		// �빮�� �� �ҹ���
		//  'A'(65)	  ��  'a'(97) ==> +32
		//  'B'(66)	  ��  'b'(98) ==> +32
		//  'C'(67)	  ��  'c'(99) ==> +32
		//			  ��
		//  'Z'(90)	  ��  'z'(122) ==> +32

		// �ҹ��� �� �빮��
		//  'a'(97)	  ��  'A'(65) ==> -32
		//  'b'(98)	  ��  'B'(66) ==> -32
		//  'c'(99)	  ��  'C'(67) ==> -32
		//			  ��
		//  'z'(122)  ��  'Z'(90) ==> -32
		*/


		char ch, ch_result;

		System.out.print("�� ���� �Է�: ");
		ch = (char)System.in.read();	//-- System.in.read()�� int��

		//ch_result= () ? () : ();
		//ch_result = (�Է°��빮��) ? (�ҹ��ڷκ�ȯ) : (�Է°��ҹ��� ? �빮�ڷκ�ȯ : �״��);
		ch_result = (ch>='A'&&ch<='Z') ? ((char)(ch+32)) : ((ch>='a'&&ch<='z') ? ((char)(ch-32)) : ch);

		//����
		// 'Q' (�� 81)
		//ch_result = (81>=65&&81<=90) ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (ture&&true) ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = true ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (char)(ch+32);
		//ch_result = (char)(81+32);
		//ch_result = (char)(113);
		//ch_result = 'q';

		
		// 'm' (�� 109)
		//ch_result = (109>=65&&81<=109) ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (ture&&false) ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = false ? ((char)(ch+32)) : ((ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (ch>'a'&&ch<'z') ? ((char)(ch-32)) : ch);
		//ch_result = (109>97&&109<122) ? ((char)(ch-32)) : ch);
		//ch_result = (true&&true) ? ((char)(ch-32)) : ch);
		//ch_result = true ? ((char)(ch-32)) : ch);
		//ch_result = (char)(ch-32);
		//ch_result = (char)109-32;
		//ch_result = (char)77;
		//ch_result = 'M';

		System.out.println(ch + "��" + ch_result);
	}
}

//���� ���
/*
�� ���� �Է�: A
A��a
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
�� ���� �Է�: a
a��A
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
�� ���� �Է�: 1
1��1
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
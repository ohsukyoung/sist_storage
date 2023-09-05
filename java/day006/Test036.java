/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - if ��
 - if ~ else�� �ǽ�
=====================================*/

// 1. ���α׷��� �ۼ��� �� �־��� ���ǿ� ����
//	�б� ������ ���ϱ� ���� ����ϴ� �������
//	if��, if~else��, ���ǿ�����, ����if��(if�� ��ø), switch���� �ִ�.

//2. if���� if���� ������ ��(true)�� ���
//	Ư�� ������ �����ϰ��� �� ��  ���Ǵ� �����̴�.

// ����ڷκ��� ������ ���� ������ �Է¹޾�
// ���� ������ ū �� ������ ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ù ��° ���� �Է�: 753
// �� ��° ���� �Է�: 22
// �� ��° ���� �Է�: 124

//>> ���� ���: 22 124 753
//����Ϸ��� �ƹ� Ű�� ��������...

/*
�� ù ��° ���� vs �� ��° ���� ũ�� ��
	�� ù ��° ������ �ι�° �������� Ŭ ���... �ڸ� �ٲ�

�� ù ��° ���� vs �� ��° ���� ũ�� ��
	�� ù ��° ������ ����° �������� Ŭ ���... �ڸ� �ٲ�

�� �� ��° ���� vs �� ��° ���� ũ�� ��
	�� �� ��° ������ �� ��° �������� Ŭ ���... �ڸ� �ٲ�
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test036
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// ���� Ǭ ���� --------------------------
		/* 
		//����� : �ۼ��Ϸ�X
		int a, b, c, num1, num2, num3;

		System.out.print("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է�: ");
		c = Integer.parseInt(br.readLine());

		//    abc
		//a b c 321
		//  c b 312
		//b a c 231
		//  c a 132
		//c a b 213 -
		//  b c 123

		if(a>b && a>c)
		{
			num1 = a;
			if(b>c)				//-- a b c
			{
				num2=b; num3=c;
				System.out.println("1");
			}
			else				//-- a c b
			{
				num2=c; num3=b;
				System.out.println("2");

			}
		}
		else if(b>a && b>c)
		{
			num1 = b;
			if(a>c)				//-- b a c
			{
				num2=a; num3=c;
				System.out.println("3");
			}
			else				//-- b c a
			{
				num2=c; num3=a;
				System.out.println("4");
			}
		}
		else
		{
			num1 = c;
			if(a>c)				//-- c a b
			{
				num2=a; num3=b;
				System.out.println("5");
			}
			else				//-- c b a
			{
				num2=b; num3=a;
				System.out.println("6");
			}
		}

		System.out.printf(">> ���� ���: %d %d %d", num3,num2,num1);
		*/

		// ����� : �ۼ��Ϸ�O
		/*
		int a,b,c,temp;

		System.out.print("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է�: ");
		c = Integer.parseInt(br.readLine());

		if(a>b){
			temp = a;
			a = b;
			b = temp;
		}
		if(a>c){
			temp = c;
			c = a;
			a = temp;
		}
		if(b>c){
			temp = c;
			c = b;
			b = temp;
		}
		System.out.printf(">> ���� ���: %d %d %d", a,b,c);
		*/
		
		// �Բ� Ǭ ���� --------------------------
		int a,b,c;					//-- ����ڰ� �Է��ϴ� ������ ������ ��Ƶ� ����

		System.out.print("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է�: ");
		c = Integer.parseInt(br.readLine());

		if(a>b)						//-- ù ��° ������ �� ��° �������� Ŭ ���
		{
			// �ڸ� �ٲ�
			a=a^b;
			b=b^a;
			a=a^b;
		}
		if(a>c)						//-- ù ��° ������ �� ��° �������� Ŭ ���
		{
			// �ڸ� �ٲ�
			a=a^c;
			c=c^a;
			a=a^c;
		}
		if(b>c)						//-- �� ��° ������ �� ��° �������� Ŭ ���
		{
			// �ڸ� �ٲ�
			b=b^c;
			c=c^b;
			b=b^c;
		}

		// ���� ��� ���
		System.out.printf("\n>> ���� ���: %d %d %d\n", a, b, c);
	}
}

//���� ���
/*
ù ��° ���� �Է�: 3
�� ��° ���� �Է�: 2
�� ��° ���� �Է�: 1

>> ���� ���: 1 2 3
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
ù ��° ���� �Է�: 3
�� ��° ���� �Է�: 1
�� ��° ���� �Է�: 2

>> ���� ���: 1 2 3
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
ù ��° ���� �Է�: 2
�� ��° ���� �Է�: 3
�� ��° ���� �Է�: 1

>> ���� ���: 1 2 3
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
ù ��° ���� �Է�: 1
�� ��° ���� �Է�: 3
�� ��° ���� �Է�: 2

>> ���� ���: 1 2 3
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
ù ��° ���� �Է�: 2
�� ��° ���� �Է�: 1
�� ��° ���� �Է�: 3

>> ���� ���: 1 2 3
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
ù ��° ���� �Է�: 1
�� ��° ���� �Է�: 2
�� ��° ���� �Է�: 3

>> ���� ���: 1 2 3
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - if ��
 - if ~ else�� �ǽ�
=====================================*/

// 1. ���α׷��� �ۼ��� �� �־��� ���ǿ� ����
//	�б� ������ ���ϱ� ���� ����ϴ� �������
//	if��, if~else��, ���ǿ�����, ����if��(if�� ��ø), switch���� �ִ�.

//2. if���� if���� ������ ��(true)�� ���
//	 Ư�� ������ �����ϰ��� �� ��  ���Ǵ� �����̴�.

// ����ڷκ��� ������ �� ������ �����ڸ� �Է� �޾�
// �ش� �������� ���� ó�� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, if ���ǹ��� Ȱ���Ͽ� ó���� �� �ֵ��� �ϸ�,
// ���� ����� ���ǻ� ���� ������� ó�� �� �� �ֵ��� �Ѵ�.

// ���� ��)
// ù ��° ���� �Է�	: 10
// �� ��° ���� �Է�	: 3
// ������ �Է�[+ - * /] : +

// >> 10 + 3 = 13
// ����Ϸ��� �ƹ�Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test035
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// ���� Ǭ ���� --------------------------
		/*
		int num1, num2, total = 0;
		char oper;

		System.out.printf("ù ��° ���� �Է�: ");
		num1 = Integer.parseInt(br.readLine());
		System.out.printf("�� ��° ���� �Է�: ");
		num2 = Integer.parseInt(br.readLine());
		System.out.printf("������ �Է�[+ - * /]: ");
		oper = br.readLine().charAt(0);

		if(oper == '+')
		{
			total = num1 + num2;
		}else if(oper == '-')
		{
			total = num1 - num2;
		}else if(oper == '*')
		{
			total = num1 * num2;
		}else if(oper == '/')
		{
			total = num1 / num2;
		}else{
			total = 0;
		}
		System.out.printf("%d %c %d = %d\n", num1, oper, num2, total);
		*/

		
		// �Բ� Ǭ ���� --------------------------
		// ��� ��
		/*
		int a, b, op;			//-- ù ��°, �� ��° ����, ������
		//char op;				//-- ������

		System.out.printf("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());

		System.out.printf("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());

		//Integer.parseInt()
		//"1234" �� Integer.parseInt()	�� 1234
		//"abcd" �� Integer.parseInt()	�� (X)

		System.out.printf("������ �Է�[+ - * /]: ");
		//op = (char)Integer.parseInt(br.readLine()) //--(X)
		//                         --------------
		//								  "*"
		//op = (char)System.in.read();				//-- �� ���� �о����
		op = System.in.read();

		// �׽�Ʈ(Ȯ��)
		// System.out.println("�Է��� ������: "+ op);

		// '+' �� 43 / '-' �� 45 / '*' �� 42 / '/' �� 47
		if(op == 43)		//-- ����ڰ� �Է��� �����ڰ� '+'�̶��
		{
			// a�� b�� ���� ���� �����Ͽ� ��� ���
			System.out.printf("\n>> %d + %d = %d\n",a,b,(a+b));
		}
		else if(op == 45)		//-- ����ڰ� �Է��� �����ڰ� '-'�̶��
		{
			// a�� b�� ���� ���� �����Ͽ� ��� ���
			System.out.printf("\n>> %d - %d = %d\n",a,b,(a-b));
		}
		else if(op == 42)		//-- ����ڰ� �Է��� �����ڰ� '*'�̶��
		{
			// a�� b�� ���� ���� �����Ͽ� ��� ���
			System.out.printf("\n>> %d * %d = %d\n",a,b,(a*b));
		}
		else if(op == 47)		//-- ����ڰ� �Է��� �����ڰ� '/'�̶��
		{
			// a�� b�� ������ ���� �����Ͽ� ��� ���
			System.out.printf("\n>> %d / %d = %d\n",a,b,(a/b));
		}
		else				//-- ����ڰ� �Է��� �����ڰ� �⺻ ��Ģ �����ڰ� �ƴ϶��
		{
			System.out.println("\n>> �Է� ������ ������ �����մϴ�.");
		}
		*/


		// ��� ��
		/*
		int a, b;				//-- ù ��°, �� ��° ����
		char op;				//-- ������

		System.out.printf("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());

		System.out.printf("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());

		System.out.printf("������ �Է�[+ - * /]: ");
		op = (char)System.in.read();

		if(op == '+')
			System.out.printf("\n>> %d + %d = %d\n",a,b,(a+b));
		else if(op == '-')
			System.out.printf("\n>> %d - %d = %d\n",a,b,(a-b));
		else if(op == '*')

			System.out.printf("\n>> %d * %d = %d\n",a,b,(a*b));
		else if(op == '/')
			System.out.printf("\n>> %d / %d = %d\n",a,b,(a/b));
		else
			System.out.println("\n>> �Է� ������ ������ �����մϴ�.");
		*/

		// ��� ��
		int a,b, result = 0;
		char op;

		System.out.print("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());
		System.out.print("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());
		System.out.print("������ �Է�[+ - * /]: ");
		op = (char) System.in.read();

		if(op=='+')
			result=a+b;
		else if(op=='-')
			result=a-b;
		else if(op=='*')
			result=a*b;
		else if(op=='/')
			result = a/b;

		System.out.printf("\n>> %d %c %d = %d\n", a, op, b, result);

	}
}
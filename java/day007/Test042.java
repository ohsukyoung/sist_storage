/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - switch �ǽ�
=====================================*/

// ����ڷκ��� ������ �� ������ �����ڸ� �Է¹޾�
// �ش� �������� ���� ó�� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, switch���� Ȱ���Ͽ� ó���� �� �ֵ��� �ϸ�,
// ���� ����� ���ǻ� ���� ���·� ó���� �� �ֵ��� �Ѵ�.

// ���� ��)
// ù ��° ���� �Է�	: 3
// �� ��° ���� �Է�	: 17
// ������ �Է�[+-*/]	: -

// >> 3-17 = -14
// ����Ϸ��� �ƹ� Ű��...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
 
 public class Test042
 {
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// ���� Ǭ ���� --------------------------
		/*
		int num1, num2, op;

		System.out.printf("ù ��° ���� �Է�: ");
		num1 = Integer.parseInt(br.readLine());

		System.out.printf("�� ��° ���� �Է�: ");
		num2 = Integer.parseInt(br.readLine());

        System.out.printf("ù ��° ���� �Է�: ");
		op = System.in.read();

		switch (op)
		{
			case 43 : System.out.printf(">> %d + %d = %d\n", num1,num2, num1+num2);break;
			case 45 : System.out.printf(">> %d - %d = %d\n", num1,num2, num1-num2);break;
			case 42 : System.out.printf(">> %d * %d = %d\n", num1,num2, num1*num2);break;
			case 47 : System.out.printf(">> %d / %d = %d\n", num1,num2, num1/num2);break;
		}
		*/
        
		// �Բ� Ǭ ���� --------------------------
		// ��: ������ int
		/*
		int a, b, result;
		int op;

		System.out.printf("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());

		System.out.printf("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());

        System.out.printf("ù ��° ���� �Է�: ");
		op = System.in.read();

		// + �� op = 43, - �� 45, * �� 42, / �� 47

		switch(op)
		{
			case 43: result = a+b; break;
			case 45: result = a-b; break;
			case 42: result = a*b; break;
			case 47: result = a/b; break;
			default: return;	//-- 1. ���� ��ȯ
								//-- 2. �޼ҵ� ���� �� main() �޼ҵ� ���� �� ���α׷� ����
								//					   main() �޼ҵ�: ���۰� ��
		}
	
		System.out.println();
		System.out.printf(">> %d %c %d = %d\n", a, op, b, result);
		*/

		// ��: ������ char
		/*
		int a, b, result;
		char op;

		System.out.print("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());
		System.out.print("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());

		System.out.print("�������Է�[+ - * /]: ");
		op = (char)System.in.read();

		switch(op)
		{
			case '+': result = a+b; break;
			case '-': result = a-b; break;
			case '*': result = a*b; break;
			case '/': result = a/b; break;
			default: return;
		}

		System.out.println();
		System.out.printf(">> %d %c %d = %d\n", a, op, b, result);
		*/

		// ��: ������ String
		int a, b, result;
		String op;

		System.out.print("ù ��° ���� �Է�: ");
		a = Integer.parseInt(br.readLine());
		System.out.print("�� ��° ���� �Է�: ");
		b = Integer.parseInt(br.readLine());

		System.out.print("�������Է�[+ - * /]: ");
		op = br.readLine();

		switch(op)
		{
			case "+": result = a+b; break;
			case "-": result = a-b; break;
			case "*": result = a*b; break;
			case "/": result = a/b; break;
			default: return;
		}

		System.out.println();
		System.out.printf(">> %d %s %d = %d\n", a, op, b, result);
	}
 }
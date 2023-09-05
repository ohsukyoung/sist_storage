/* =====================================
���� Ŭ������ �ν��Ͻ� ����
=====================================*/

// ����ڷκ��� ������ �� ������ �����ڸ� �Է¹޾�
// �ش� ������ �����ϴ� ���α׷��� �����Ѵ�.
// ��, Ŭ������ �ν��Ͻ��� ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
// (Calculate Ŭ���� ����)

// ���� ��)
// ������ �� ���� �Է�(���� ����)	: 100 51
// ������ ������(+ - * /)			: +

// >> 100 + 51 = 151
// ����Ϸ��� �ƹ� Ű�� ��������...

// ���� Ǭ ���� --------------------------
/*
import java.io.IOException;
import java.util.Scanner;

public class Test073
{
	public static void main(String[] args) throws IOException
	{
		Oper ob = new Oper();

		ob.input();
		ob.operat();
		ob.print();
	}
}

class Oper
{
	int a, b, total;
	char op;

	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("������ �� ���� �Է�(���� ����): ");
		a = sc.nextInt();
		b = sc.nextInt();
		System.out.print("������ ������(+ - * /): ");
		op = (char)System.in.read();

	}

	void operat()
	{
		switch(op)
		{
			case '+': total = a + b; break;
			case '-': total = a - b; break;
			case '*': total = a * b; break;
			case '/': total = a / b; break;
		}
	}

	void print()
	{	
		System.out.printf(">> %d %c %d = %d\n", a, op, b, total);
	}
}
*/

// �Բ� Ǭ ���� --------------------------
import java.io.IOException;
import java.util.Scanner;

public class Test073
{
	public static void main(String[] args) throws IOException
	{
		Calculate ob = new Calculate();	//-- ������ �ν��Ͻ��� ���� �Է� �޼ҵ� ȣ��
		ob.input();						//									����
		ob.print(ob.cal());				//									���
	}
}

class Calculate
{
	// �ֿ亯�� ����
	int su1, su2;	//-- ����ڷκ��� �Է¹��� �� ������ ��Ƴ� ����
	char op;				//-- ����ڷκ��� �Է¹��� �����ڸ� ��Ƴ� ����
	int result;

	// �޼ҵ� ����(���: �Է�)
	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("������ �� ���� �Է�(���� ����): ");
		su1 = sc.nextInt();
		su2 = sc.nextInt();
		System.out.print("������ ������(+ - * /): ");
		op = (char)System.in.read();

	}

	// �޼ҵ��� ����(���: ����) �� ������ ���굵 ���� ������� ó��
	int cal()
	{
		result = -1;
		switch(op)
		{
			case '+': result = su1 + su2; break;
			case '-': result = su1 - su2; break;
			case '*': result = su1 * su2; break;
			case '/': result = su1 / su2; break;
			// default: result = -1;
		}
		return result;
	}

	// �޼ҵ� ����(���: ���)
	void print(int s)
	{	
		System.out.printf(">> %d %c %d = %d\n", su1, op, su2, result);
	}
}
/* =====================================
���� Ŭ������ �ν��Ͻ� ����
=====================================*/

/*
����ڷκ��� ������ ������ �Է¹޾�
1 ���� �Է¹��� �������� ���� �����Ͽ�
�� ������� ����ϴ� ���α׷��� �����Ѵ�.

��, ���ݱ��� ó�� main()�޼ҵ忡 ��� ����� �����ϴ� ���� �ƴ϶�
Ŭ������ �ν��Ͻ��� ������ Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.
(Hap Ŭ���� ����)
����, ������ �Է� ó�� �������� BufferedReader�� readLine()�� ����ϸ�,
�Է� �����Ͱ� 1���� �۰ų� 1000���� ū ���
�ٽ� �Է¹��� �� �ִ� ó���� �����Ͽ� ���α׷��� ������ �� �ֵ��� �Ѵ�.

���� ��)
������ ���� �Է�(1~1000): 1200
������ ���� �Է�(1~1000): -50
������ ���� �Է�(1~1000): 100
>> 1~ 100������ ��: 5050
// ����Ϸ��� �ƹ� Ű�� ��������...
*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

// ���� Ǭ ���� --------------------------
/*
public class Test072
{
	public static void main(String[] args) throws IOException
	{
		
		AddNum ob = new AddNum();
		int n;
		int sumBox;

		n = ob.input();
		sumBox = ob.sum();

		ob.print(n,sumBox);
	}
}

class AddNum
{
	int add_n;
	int add_sumBox;

	int input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		do{
			System.out.print("������ ���� �Է�(1~1000): ");
			add_n = Integer.parseInt(br.readLine());
		}while(add_n<=0 || add_n>1000);
		return add_n;
	}
	int sum()
	{
		add_sumBox=0;
		for(int i=0; i<=add_n; i++)
		{
			add_sumBox += i;
		}
		return add_sumBox;
	}
	void print(int x, int y)
	{
		System.out.printf(">> 1~ %d������ ��: %d\n", x, y); 
	}
}
*/

// �Բ� Ǭ ���� --------------------------
class Hap
{
	// �ֿ� ���� ����(������� �Է°��� ��Ƴ� ����)
	int su;

	//�Է� �޼ҵ� ����
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		do{
			System.out.print("������ ���� �Է�(1~1000): ");
			su = Integer.parseInt(br.readLine());
		}while(su<1 || su>1000);
	}

	// ���� ó�� �޼ҵ� ����
	int calculate()
	{
		int result = 0;
		for( int i=1; i<=su; i++)
			result += i;
		return result;
	}

	// ��� ��� �޼ҵ� ����
	void print(int sum)
	{
		System.out.printf("\n>> 1 ~ %d ������ ��: %d\n", su, sum);
	}

}

public class Test072
{
	public static void main(String[] args) throws IOException
	{
		// Hap �ν��Ͻ� ����
		Hap ob = new Hap();

		// ������ �ν��Ͻ��� ���� �Է� �޼ҵ� ȣ��
		// ---------------
		// �������� Ȱ��

		ob.input();		//-- new Hap().input();

		// ������ �ν��Ͻ��� ���� ���� �޼ҵ� ȣ��
		int s = ob.calculate();

		// ������ �ν��Ͻ��� ���� ��� �޼ҵ� ȣ��
		// ob.print(ob.calculate());
		ob.print(s);

	}
}
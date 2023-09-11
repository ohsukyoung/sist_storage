/* =====================================
���� Ŭ������ �ν��Ͻ� ����
- Ŭ������ �ν��Ͻ� Ȱ��
=====================================*/

// 1~3 ������ ������ �߻����Ѽ�
// ����, ����, �� ���� ���α׷��� �����Ѵ�.
// �� Ŭ������ ������ Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.
// ����, �迭�� Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.
// ���������� RpsGame Ŭ������ �ϼ��� �� �ֵ��� �Ѵ�.

// �� ���� ������ �� 1: ����, 2: ����, 3: ��

// ���� ��)
// 1:����, 2:����, 3:�� �� �Է�(1~3): 4
// 1:����, 2:����, 3:�� �� �Է�(1~3): -2
// 1:����, 2:����, 3:�� �� �Է�(1~3): 2

// - ����	: ����
// - ��ǻ��	: ��

//>> �º� ���� ���: ��ǻ�Ͱ� �̰���ϴ�~!!!
// ����� �̰���ϴ�!
// �����ϴ�.
// ����Ϸ��� �ƹ� Ű�� ��������...
import java.util.Scanner;
import java.util.Random;
// ���� Ǭ ���� --------------------------
/*
class RpsGame
{
	Scanner sc = new Scanner(System.in);
	// �ֿ亯�� ����
	int com;	//-- ��ǻ�� ����
	int user;	//-- ���� ����
	int[] arr = new int[2];	//-- [0]: ���� ����, [1]: ��ǻ�� ����
	String[] prArr = {"�����ϴ�.", "����� �̰���ϴ�!", "��ǻ�Ͱ� �̰���ϴ�!"};
	int i = 0;	//-- ��� index
 
	// �Է¹ޱ�
	public void input()
	{
		do
		{
			System.out.print("1:����, 2:����, 3:�� �� �Է�(1~3): ");
			arr[0] = sc.nextInt();
		}
		while (arr[0]<1 || arr[0]>3);
		com();		// ��ǻ�ͷ���
		compare();	// ���ϱ� & ����ϱ�
	}
 
 
	// ��ǻ�ͷ���
	public void com()
	{
		Random rd = new Random();		// Random �ν��Ͻ� ����
		arr[1] = rd.nextInt(3)+1;		// ��ȣ�� - 1������ ���� ��������
	}
 
	// ���ϱ� & ����ϱ�
	public void compare()
	{
		System.out.printf("- ����	: %s\n", arr[0]);
		System.out.printf("- ��ǻ��	: %s\n", arr[1]);
 
		
		//- 1: ����, 2: ����, 3: ��
		// 1 1 ���	 0
		// 1 2 ��	-1	+3 �� 2
		// 1 3 �̱�	-2	+3 �� 1
 
		// 2 2 ���	 0
		// 2 1 �̱�	 1
		// 2 3 ��	-1	+3 �� 2
 
		// 3 3 ���	 0
		// 3 1 ��	 2
		// 3 2 �̱�	 1
		
		if(arr[0]-arr[1] < 0)
			i = arr[0]-arr[1] + 3;
		else
			i = arr[0]-arr[1];
	}
	
	// ����ϱ�
	public void print()
	{
		System.out.printf(">> �º� ���� ���: %s\n", prArr[i]);
	}
}
 
 
public class Test102
{
	public static void main(String[] args)
	{
		RpsGame ob1 = new RpsGame();
 
		ob1.input();	// �Է¹ޱ�
		ob1.print();	// ����ϱ�
	}
}
*/

// �Բ� Ǭ ���� --------------------------
class RpsGame
{
	private int user;
	private int com;

	// ��ǻ���� ����������
	private void runCom()
	{
		Random rd = new Random();
		com = rd.nextInt(3) + 1;		//-- 0 1 2 �� (+1) �� 1 2 3
	}

	// ������ ����������
	public void input()
	{
		// ����ڰ� ���������� �ϱ� ����.. ��ǻ��(������) ���� ����������
		runCom();

		Scanner sc = new Scanner(System.in);

		do
		{
			System.out.print("1:����, 2:����, 3:�� �� �Է�(1~3): ");	//-- 1 2 3 �� 0 1 2
			user = sc.nextInt();
		}
		while (user<1 || user>3);
	}

	// �߰� ��� ���
	public void middleCalc()
	{
		String[] str = {"����","����","��"};

		System.out.println();
		System.out.println("- ����	: " + str[user - 1]);
		System.out.println("- ��ǻ��: " + str[com - 1]);
	}

	// �ºο� ���� ���� ��� ����
	// - ���º� ��Ȳ�Դϴ�~!!!
	// - ����� �¸��߽��ϴ�~!!!
	// - ��ǻ�Ͱ� �¸��߽��ϴ�~!!!
	public String resultCalc()
	{
		String result = "���º� ��Ȳ�Դϴ�~!!!";

		// (����=="����" ��=="��") (����="����" ��=="����") (����=="��" ��="����")
		// (����=="����" && ��=="��") || (����="����" && ��=="����") || (����=="��" && ��="����")
        if((user==1 && com==3) || (user==2 && com==1) || (user==3 && com==2))
		{
			result = "- ����� �¸��߽��ϴ�~!!!";
		}

		// (����=="����" ��=="����") (����="����" ��=="��") (����=="��" ��="����")
		// (����=="����" && ��=="����") || (����="����" && ��=="��") && (����=="��" || ��="����")
		else if((user==1 && com==2) || (user==2 && com==3) && (user==3 || com==1))
		{
			result = "- ��ǻ�Ͱ� �¸��߽��ϴ�~!!!";
		}

		return result;
	}

	// ��� ���
	public void print(String str)
	{
		System.out.printf(">> �º� ���� ���: %s\n", str);
	}


}

public class Test102
{
	public static void main(String[] args)
	{
		RpsGame ob = new RpsGame();
 
		ob.input();
		ob.middleCalc();
		String result = ob.resultCalc();
		ob.print(ob.resultCalc());
	}
}
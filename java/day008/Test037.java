/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - if ��
 - if ~ else�� �ǽ�
=====================================*/

// 1. ���α׷��� �ۼ��� �� �־��� ���ǿ� ����
//    �б� ������ ���ϱ� ���� ����ϴ� �������
//    if��, if~else��, ���ǿ�����, ����if��(if�� ��ø), switch���� �ִ�.

//2. if���� if���� ������ ��(true)�� ���
//    Ư�� ������ �����ϰ��� �� ��  ���Ǵ� �����̴�.

// ����ڷκ��� ������ ���� 5���� �Է� �޾�
// ¦����, Ȧ���� �հ踦 ����ϴ� ���α׷��� �����Ѵ�.
// ��, Scanner�� Ȱ���Ͽ� �����͸� �Է¹��� �� �ֵ��� �Ѵ�.

// ���� ��)
// ������ ���� 5�� �Է�(���� ����): 11 12 13 14 15
// ����Ϸ��� �ƹ� Ű�� ��������...

//>> ¦���� ���� 26�̰�, Ȧ���� ���� 39�Դϴ�.
//����Ϸ��� �ƹ�Ű�� ��������...
import java.util.Scanner;

public class Test037
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		// ���� Ǭ ���� --------------------------
		/*
		int n1, n2, n3, n4, n5, even=0, odd=0;

		System.out.print("������ ���� 5�� �Է�(���� ����): ");
		n1 = sc.nextInt();
		n2 = sc.nextInt();
		n3 = sc.nextInt();
		n4 = sc.nextInt();
		n5 = sc.nextInt();

		if(n1 % 2 == 0)
		{
			even += n1;
		}else
		{
			odd += n1;
		}

		if(n2 % 2 == 0)
		{
			even += n2;
		}else
		{
			odd += n2;
		}

		if(n3 % 2 == 0)
		{
			even += n3;
		}else
		{
			odd += n3;
		}

		if(n4 % 2 == 0)
		{
			even += n4;
		}else
		{
			odd += n4;
		}

		if(n5 % 2 == 0)
		{
			even += n5;
		}else
		{
			odd += n5;
		}

		System.out.printf(">> ¦���� ���� %d�̰�, Ȧ���� ���� %d�Դϴ�.\n", even, odd);
		*/

		// �Բ� Ǭ ���� --------------------------

		// �������� ��Ƴ� ���� �ʱ�ȭ
		int evenSum=0;			//-- ¦���� ���� ��Ƴ� ���� ����
		int oddSum=0;			//-- Ȧ���� ���� ��Ƴ� ���� ����
		//-- ���� ���� 0���� �ʱ�ȭ, ���� ���� 1�� �ʱ�ȭ��
		int num1, num2, num3, num4, num5;
		//-- ����ڷκ��� �Է¹��� 5���� ������ ���� ���� ����

		// ���� �� ó��
		System.out.print("������ ���� 5�� �Է�(���� ����): "); // 10 20 30 40 50
		// sc.next() : ���������� �޾ƿ���
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		num3 = sc.nextInt();
		num4 = sc.nextInt();
		num5 = sc.nextInt();

		if(num1%2==0)	//-- num1�� ¦���� ��
		{
			//evenSum�� num1��ŭ ����
			evenSum += num1;
		}
		else		//-- num1�� Ȧ���� ��
		{
			//oddSum�� num1��ŭ ����
			oddSum += num1;
		}

		if(num2%2==0)	//-- num2�� ¦���� ��
		{
			//evenSum�� num2��ŭ ����
			evenSum += num2;
		}
		else		//-- num2�� Ȧ���� ��
		{
			//oddSum�� num2��ŭ ����
			oddSum += num2;
		}

		if(num3%2==0)
			evenSum += num3;
		else
			oddSum += num3;
		if(num4%2==0)
			evenSum += num4;
		else
			oddSum += num4;
		if(num5%2==0)
			evenSum += num5;
		else
			oddSum += num5;
		

		// ��� ���
		System.out.printf(">> ¦���� ���� %d�̰�, Ȧ���� ���� %d�Դϴ�.\n", evenSum, oddSum);

	}
}

// ���� ���

/*
������ ���� 5�� �Է�(���� ����): 11 12 13 14 15
>> ¦���� ���� 26�̰�, Ȧ���� ���� 39�Դϴ�.
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
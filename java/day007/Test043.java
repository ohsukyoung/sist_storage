/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - �ݺ��� �ǽ� �� ����
=====================================*/

/*
�� �ݺ����� ����

 �־��� ������ �������� ���
 ������ ������ ������ �ݺ� �����ϴٰ�
 ���ǽ��� ���������� �Ǵ� ������ ����,
 �ݺ� ������ �ߴ��ϴ� �����̴�.
 �̷��� �ݺ������� ��while��, ��do~while��, ��for���� ���� ������
 �ݺ��� ��� ���� ��break��, ��continue�� ���� ����ϴ� ��찡 �ִ�.

�� while ��
 ���ǽ��� ���� ���Ͽ�
 ���ǽ��� ó�� ����� ���� ���, Ư�� ������ �ݺ� �����ϴ� ��������
 �ݺ� Ƚ���� ������ ���� ���� ��쳪
 �ݺ� Ƚ���� ���� ��� �ַ� ����Ѵ�.
 while���� ������ ���� ���� ���
 �ݺ��� Ŀ�� �� �ѹ��� ������� ���� �� �ִ�.

 �� while ���� ���� �� ����
    
	while(���ǽ�)
	{
		���๮;
	}
*/

public class Test043
{
	public static void main(String[] args)
	{
		/*
		int n=0;

		while(n<=10)
		{
			System.out.println("n=" + n);
			n++;
		}
		*/

		/*
		int n=0;

		while(n<=10)
		{
			n++;
			System.out.println("n=" + n);
		}
		*/

		/*
		int n=0;

		while(n++<=10)
		{
			System.out.println("n=" + ++n);
		}
		*/

		/*
		int n=1;

		while(n<10)
		{
			System.out.println("n=" + n);
			n++;
		}
		*/

		// 1���� 100������ ���� ����Ͽ�
		// ����� ����ϴ� ���α׷��� �����Ѵ�.
		// ��, while �ݺ����� ����Ѵ�.

		// ���� ��)
		// 1���� 100������ ��: 5050
		// ����Ϸ��� �ƹ� Ű��...
		
		// ���� Ǭ ���� --------------------------
		/*
		int n=1, sum=0;

		while(n<=100)
		{
			sum += n++;
		}
		System.out.println("1���� 100������ ��: " + sum);
		*/
		
		// �Բ� Ǭ ���� --------------------------
		//�� ���� �ν� �� �м�
		// 1. ��� ������ �ݺ����� ���� �ۿ� ��ġ�ؾ� �Ѵ�.
		// 2. 1���� 1�� ������ ����
		//    �������� ���� ����

		// 1 ���� ���ʷ� ��� 1�� �����ϴ� ���� ���� �� �ʱ�ȭ
		int n=0;

		// �������� ����Ͽ� ��Ƴ� ���� ���� �� �ʱ�ȭ
		int sum = 0;

		// ���� �� ó��(�ݺ��� ����)
		while(n<100)
		{
			n++;
			sum += n;

			//�׽�Ʈ
			//System.out.println("ȸ��: " + n);
		}

		// ��� ���
		System.out.println("1���� 100������ ��: "+sum);
	}
}
//������
/*
1���� 100������ ��: 5050
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
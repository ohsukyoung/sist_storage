/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - �ݺ��� �ǽ� �� ����
=====================================*/

// ���� ��)
// 1���� 100���� ������ ��: xxx
// 1���� 100���� ¦���� ��: xxx
// 1���� 100���� Ȧ���� ��: xxx
// ����Ϸ��� �ƹ� Ű�� ��������...

public class Test046
{
	public static void main(String[] args){
		// ���� Ǭ ���� --------------------------
		/*
		int num = 1;
		int numBox = 0, sum = 0, minus = 0;

		while(num<=100)
		{
			numBox += num;
			if(num%2==0)
			{
				sum += num;
			}else if(num%2!=0)
			{
				minus += num;
			}else
			{
				System.out.println("����");
			}
			num++;
		}
		System.out.println("1���� 100���� ������ ��: " + numBox);
		System.out.println("1���� 100���� ¦���� ��: " + sum);
		System.out.println("1���� 100���� Ȧ���� ��: " + minus);
		*/

		// �Բ� Ǭ ���� --------------------------
		// �ֿ� ���� ���� �� �ʱ�ȭ
		int n=1, sum, odd, even;
		sum=odd=even=0;

		// ���� �� ó��
		while(n<=0)
		{
			sum += n;

			if(n%2==0)
				even += n;
			else if(n%2!=0)
				odd +=n;
			else
			{
				System.out.println("�Ǻ��� �� ���� ������");
				return;
			}

			n++;
		}

		System.out.println("1���� 100���� ������ ��: " + sum);
		System.out.println("1���� 100���� ¦���� ��: " + even);
		System.out.println("1���� 100���� Ȧ���� ��: " + odd);

	}
}
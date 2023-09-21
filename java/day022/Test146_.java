import java.util.Random;

class Lotto
{
	// �迭 ���� ���� �� �޸� �Ҵ� �� �ζ� ��ȣ�� ��Ƶ� �迭�� 6ĭ
	private int[] num;

	// ������
	Lotto()
	{
		num = new int[6];
	}

	// getter
	public int[] getNum()
	{
		return num;
	}
	// 6 ���� ������ �߻���Ű�� �޼ҵ� ����
	public void start()
	{
		Random rd = new Random();
		for(int i=0; i<6; i++)
		{
			num[i] = rd.nextInt(45)+1;

			// �ߺ�����
			int pass=0;

			do
			{
				flag = false;
				pass++;

				for (i=0; i<a.length-pass; i++)
				{
					//System.out.println("��");
					
					if (num[i]==num[i+1])
					{
						flag = true;
					}
				}
			}
			while (!flag);


		}
		
		sorting();

		//System.out.printf("%3d",num[1]);

	}

	// ���� �޼ҵ� ����
	private void sorting()
	{
		

		// ����
		for(int i=0; i<num.length-1; i++)
		{
			for (int j=i+1; j<num.length ; j++)
			{
				//ũ�� ��
				if(num[i] > num[j])	// �������� ����
				{					
					// �ڸ� �ٲٱ�
					num[i] = num[i]^num[j];
					num[j] = num[j]^num[i];
					num[i] = num[i]^num[j];
				}
			}
		}
	}
}


public class Test146_
{
	public static void main(String[] args)
	{
		// Lotto Ŭ���� ��� �ν��Ͻ� ����
		Lotto lotto = new Lotto();
		int[] arr = lotto.getNum();

		// �⺻ 5 ����
		for (int i=1; i<=5 ;i++ )
		{
			lotto.start();
			// �ζ� 1���� ����

			// ��� ���
			for(int n: arr){
				System.out.printf("%3d",n);
			}
			System.out.println();

		}
	}

}
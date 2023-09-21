/* =====================================
���� ���� ó��(Exception Handing) ����
=====================================*/

// ���� �ٽ� ������

public class Test152
{
	public static void main(String[] args)
	{
		Test152 ob = new Test152();

		try
		{
			int a = ob.getValue(-2);	// �� ���� �߻�
			System.out.println("a: " + a);

		}
		catch (Exception e)				// �� ���� ��Ƴ���
		{
			// �� ��Ƴ� ���ܿ� ���� ó��
			System.out.println("printStackTrace .................");
			e.printStackTrace();
		}
	}
								// �� �߻��� ���� ������
	public int getData(int data) throws Exception
	{
		if(data < 0)
		{
			// �� ���� �߻�
			throw new Exception("data �� 0 ���� �۽��ϴ�.");
		}
		return data + 10;

	}								// check~!!!
									// �� ��Ƴ� ���ܸ� �ٽ� ���� �� �ֵ��� ó��
	public int getValue(int value) throws Exception
	// getData -2 ���� �� ��ȯ �޼ҵ�
	{
		int a = 0;

		try
		{
			a = getData(-2);	// �� ���ܹ߻�
		}
		catch (Exception e)		// �� ���� ��Ƴ���
		{
			// �� ��Ƴ� ���ܿ� ���� ó��
			System.out.println("printStackTrace ..........");
			e.printStackTrace();
			
			// check~!!!
			// �� ��Ƽ� ó���� ���ܸ� �ٽ� �߻�
			throw e;
		}

		return a;

	}
}
/* =====================================
���� ���� ó��(Exception Handing) ����
=====================================*/

// �ٸ� ���� �ٽ� ������
//** ����ȸ��, ������ �����ġ..
//		������ ���ٰ� ������ �ϰ�				-> ���ܹ߻�
//		��޺μ��� �츮�� �󸶸�ŭ ���ս� ����	-> ���ܹ߻�

public class Test153
{
	public int getValue(int value) throws Exception
	{
		int a = 0;
		
		try
		{
			a = getData(-2);									// �� ���� �߻�
		}														//		(���� ��ź)
		catch (Exception e)										// �� ���� ��Ƴ���
		{														//		(���� ��ź)
			// �� ���� ó��(���� ��ź)
			System.out.println("printStackTreace......");
			e.printStackTrace();

			// check~!!!
			// �� ���ܹ߻� (�Ķ���ź
			throw new Exception ("value�� �����Դϴ�.");
		}
		
		return a;

	}

	public int getData(int data) throws Exception				// �� ���� ������
	{															//		(���� ��ź)
		if(data<0)
		{
			throw new Exception ("data �� 0 ���� �۽��ϴ�.");	// �� ���� �߻�
		}														//		(���� ��ź)

		return data + 10;
	}

	public static void main(String [] args)
	{
		Test153 ob = new Test153();
		
		try
		{
			int a = ob.getValue(-2);							// �� ���� �߻�
			System.out.println("a: " +a);						//		(�Ķ� ��ź)
		}							
		catch (Exception e)										// �� ���� �߻�
		{														//		(�Ķ� ��ź)
			System.out.println("printStackTrace...............");	
			e.printStackTrace();
		}
		
	}
}
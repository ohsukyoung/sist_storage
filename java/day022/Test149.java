/* =====================================
���� ���� ó��(Exception Handing) ����
=====================================*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

//** Test 149���� try-catch���� �߰��ؼ� ���ܸ� ��� ó���ϴ��� �ۼ��ؼ�
//		throws IOExcetion�� �ۼ����ص� ��

public class Test149
{
	private String[] data = new String[3];

	public void proc() //throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String str;
		int n=0;

		try
		{
			System.out.print("�̸� �Է�(����:Ctrl+z): ");
			while( (str=br.readLine()) !=  null )
			{
				data[n++] = str;
				System.out.print("�̸� �Է�(����:Ctrl+z): ");

			}

			System.out.println("�Էµ� ���� .................");
			for (String s : data)
			{
				if (s != null)
				{
					System.out.println(s);
				}
			}
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
			System.out.println("�� checked exception�� ���� ó��");
		}
		catch(ArrayIndexOutOfBoundsException e)
		{
			System.out.println("�迭 �ε��� ���� ���� �߻�~!!!");
			System.out.println("e.getMessage() : " + e.getMessage());
			System.out.println("e.toString(): " + e.toString());
			System.out.println("printtStackTrace.................");
			e.printStackTrace();
		}
		/*
		�̸� �Է�(����:Ctrl+z): aa
		�̸� �Է�(����:Ctrl+z): aa
		�̸� �Է�(����:Ctrl+z): dd
		�̸� �Է�(����:Ctrl+z):
		�迭 �ε��� ���� ���� �߻�~!!!
		e.getMessage() : 3
		e.toString(): java.lang.ArrayIndexOutOfBoundsException: 3
		printtStackTrace.................
		java.lang.ArrayIndexOutOfBoundsException: 3
				at Test149.proc(Test149.java:27)
				at Test149.main(Test149.java:61)
		����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
		*/

			
	}

	public static void main(String[] args)// throws IOException
	{
		Test149 ob = new Test149();
		ob.proc();
	}
}
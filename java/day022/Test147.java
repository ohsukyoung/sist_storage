/* =====================================
���� ���� ó��(Exception Handing) ����
=====================================*/

/*
�� ���α׷����� �߻��ϴ� ����(Error)��

	(1) �߸��� ������ ����ϰų� ���� ���� �������� ���� ���¿���
		��������ν� ������ �ܰ迡�� �߻��ϴ� �������� ����(Error)��

	(2) ���α׷��� �����ϴ� �������� �߻��Ǵ� ��Ÿ�� ����(Error)��
		���� �� �ִ�.

		- �����ڰ� ���� �м��� �߸��ϰų� �Ǽ��� ����
			������ ����� �������� �Ǵ� ���� ����(Error)��

		- �ý���  �̻󿡼� �߻��Ǵ� �ý��� ����(Error), �׸���

		- ���α׷� ���� �� �߻��Ǵ� ���������� ��Ȳ�� �ǹ��ϴ�
			���ܻ���(Exception)�� �ִ�.

			���� ���,
			�� � ���� 0���� �����ų�...
			�� �迭�� �����ϴ� �������� ÷�ڸ� ����� ��Ȳ�� �߻��ϰų�...
			�� �������� �ʴ� ������ �����Ͽ� �о���δٰų�...
		
		==>> �����ڰ� �̷� ���� �����̹߻��� ��츦 �̸� �����Ͽ�
			������ �����ϱ� ���� ������ �����ϵ��� ������ ������ ���� ��.
			��. ��. ó. ��.


�� ������ ���� ����~!!!( �� Exception Ŭ����)
	
	- ���ܴ� ���α׷� ���� �߿� �߻��� �� �ִ�
		��ɾ��� �������� �帧�� �����ϴ� �̺�Ʈ��
		�ڹٿ��� ���ܴ� �ϳ��� ������Ʈ(Object, ��ü)�̴�. //** �߿�

	- ���α׷� ���� �߿� �޼ҵ� �ȿ��� ����(Error)�� �߻��ϰ� �� ���,
		�޼ҵ�� �� ������ �ش��ϴ� ���� ������Ʈ�� �����
		�װ��� �ڹ� ��Ÿ�� �ý���(Runtime System)�� ������ �ش�.

	- �ڹٿ��� ��� ���� Ŭ������ Throwable Ŭ������
		Throwable Ŭ������ ���� Ŭ������ ��ӹ޾� ����Ѵ�.

	- Throwable Ŭ������ ���ܸ� �����ϴ� �����̳�
		���ܰ� �߻��� ���� ���α׷� ���¿� ���� ������ �����ϰ� �ִ�.

	- Throwable Ŭ�������� �Ļ��� Ŭ����
		
		�� Exception Ŭ����
			Exception ���� Ŭ������ �Ϲ������� ���α׷��ӿ� ����
			������ �� ���� ���ܻ�������
			�޼ҵ氡 ���� �߿� ������ ���ܸ� ����Ų��.

		�� Error Ŭ����
			�ɰ��� ������ ���·� �����ڰ� ������ �� ���� ������ �����̴�.
	
�� ������ ����
	
	- checked exception
		�޼ҵ� ������ ���ܰ� �߻��� ���
		�޼ҵ带 ������ �� ��throws�� ���� �޼ҵ� ������ �߻��� �� �ִ�
		���ܵ��� ����� �ְų� �Ǵ� �� ���ܸ� ��try-catch�� �ؼ�
		ó���� �־�߸� �ϴ� �����̴�.
		�����Ϸ��� ������ �ϴ� �������� ��checked exception����
		��throws���Ǵ°��� ���� Ȥ�� ��try-catch�� �Ǵ����� ���θ� �Ǵ��Ͽ�
		���α׷����� ���ܸ� � ������ε� ó������ ������
		������ ��ü�� �Ұ����ϴ�.
	
	- unchecked exception
		������ ó������ �ʾƵ� �����Ϸ��� üũ���� �ʴ�
		��Ÿ�� �ÿ� �߻��� �� �ִ� �����̴�.

�� java.lnag.Throwable Ŭ������ �ֿ� �޼ҵ�
	
	- String toString()
		: Throwable ������ ���� ������ ���ڿ� ���·� ��ȯ�Ѵ�.	//** �������̵� ��
	- void printStackTrace(PrintStrem s)
	- void printStackTrace(PrintWriter w)
		: ǥ�� Ǯ�� ��Ʈ���� ���� ȣ�� ����� ������ �޼ҵ�κ��� ����Ѵ�.

�� �ֿ� ��Ÿ�� ���� Ŭ����

	- ArithrmeticException
		: ��ġ ������ ����(0���� ������ ��)
	- ArrayStore Exception
		: �迭�� �߸��� ������ ���� �����Ϸ� ���� ��� �߻��ϴ¿���
	- IndexOutOfBoundsexception
		: �迭, ���ڿ�, ���� ��� �ε���(÷��) ������ ��� ��� �߻��ϴ� ����
	- ClassCastException
		: Ŭ���� ��ȯ�� �߸��� ��� �߻��ϴ� ����
	- NullPinterException
		: �� ��ü�� �����ϴ� ����(�ʱ�ȭ ���� ���� ���� ��� ��)
	- SecuritException
		: �ڹ��� ���� ���� ������ �����Ͽ��� ��� �߻��ϴ� ����


*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test147
{											// �� 
	public static void main(String[] args) //throws IOException
	{
		// BufferedReader Ŭ���� �ν��Ͻ� ����
		BufferedReader br = new BufferedReader( new InputStreamReader(System.in));

		// �ֿ� ���� ����
		int a, b, c;

		// ��
		/*
		try
		{
			System.out.print("ù ��° ���� �Է�: ");
			a = Integer.parseInt(br.readLine());
			System.out.print("�� ��° ���� �Է�: ");
			b = Integer.parseInt(br.readLine());
			
			c = a + b;

			System.out.println("���: "+ c);
		}
		catch (IOException e)
		{
			//IOExption �� checked exception
			//-- �޼ҵ带 �����ϴ� �������� throws �� ����.
			// ��Ƴ��ų� ������ ���� ��� ������ ���� �߻�.
			System.out.println(e.toString());
		}
		*/

		// ��
		//** uncheckedException
		//** ��Ÿ�� ���� ������ �߻�
		/*
		try
		{
			System.out.print("ù ��° ���� �Է�: ");
			a = Integer.parseInt(br.readLine());
			System.out.print("�� ��° ���� �Է�: ");
			b = Integer.parseInt(br.readLine());
			
			c = a + b;

			System.out.println("���: "+ c);
		}
		catch (IOException e)
		{
			//IOExption �� checked exception
			//-- �޼ҵ带 �����ϴ� �������� throws �� ����.
			// ��Ƴ��ų� ������ ���� ��� ������ ���� �߻�.
			System.out.println(e.toString());
		}
		catch (NumberFormatException e) 
		{
			// NumberFormatException -> unchecked exception
			//-- ��Ÿ�� �� �߻��� �� �ִ� ���ܷ�
			//		�ݵ�� ���� �ʿ䵵, �޾Ƴ� �ʿ䵵 ����.
			//	-> ���� ó���� ������.. ������ �������� �������� ����
			System.out.println(e.toString());
			System.out.println(">> ���� ������ �����͸� �Է��ؾ� �մϴ�.");
		}
		*/

		// ��
		/*
		try
		{
			System.out.print("ù ��° ���� �Է�: ");
			a = Integer.parseInt(br.readLine());
			System.out.print("�� ��° ���� �Է�: ");
			b = Integer.parseInt(br.readLine());
			
			c = a + b;

			System.out.println("���: "+ c);
		}
		catch (IOException e)
		{
			System.out.println("e.toString: "+e.toString());
			System.out.println("e.getMessage: "+e.getMessage());
			System.out.println("printStackTrace................");
			e.printStackTrace();
		}
		*/

		
		try
		{
			System.out.print("ù ��° ���� �Է�: ");
			a = Integer.parseInt(br.readLine());
			System.out.print("�� ��° ���� �Է�: ");
			b = Integer.parseInt(br.readLine());
			
			c = a + b;

			System.out.println("���: "+ c);
		}
		catch (Exception e)
		{
			System.out.println("e.toString: "+e.toString());
			System.out.println("e.getMessage: "+e.getMessage());
			System.out.println("printStackTrace................");
			e.printStackTrace();
		}
		finally
		{
			// ���ܰ� �߻��ϰų� �߻����� �ʰų� ������ ����Ǵ� ����
			System.out.println("��� �����̽��ϴ�~�����մϴ�.");
		}
		/*
		ù ��° ���� �Է�: 10
		�� ��° ���� �Է�: 19
		���: 29
		��� �����̽��ϴ�~�����մϴ�.
		*/



		

	}
}
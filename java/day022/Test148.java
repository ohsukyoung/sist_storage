/* =====================================
���� ���� ó��(Exception Handing) ����
=====================================*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
//** ������ �̷� ���̴�
//** readLine�� throws IOException�� ���� ��
class BufferedReader
{
	readLine throws IOException{
		
	}
}
*/
public class Test148
{
	private String[] data = new String[3];

	public void proc() //throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String str;
		int n=0;

		System.out.print("�̸� �Է�(����:Ctrl+z): ");
		while( (str=br.readLine()) !=  null )	//** str�� ����ִ� ȫ�浿 ���ڿ��� null�� �ƴҶ�
		{										//** ctrl+z �����ϸ� br.readLine�� null�� ��
			data[n++] = str;					// data �迭�� �Է¹��� �� �ֱ�
			System.out.print("�̸� �Է�(����:Ctrl+z): ");

		}
		/*
		�̸� �Է�(����:Ctrl+z): ȫ�浿
		�̸� �Է�(����:Ctrl+z): ������
		�̸� �Է�(����:Ctrl+z): ^Z			<- null
		�Էµ� ���� .................
		ȫ�浿
		������
		����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

		*/

		System.out.println("�Էµ� ���� .................");
		for (String s : data)					// ���� for��
		{
			if (s != null)						// s �� null�� �ƴϸ�
			{
				System.out.println(s);			// ���� ���
			}
		}
	}

	public static void main(String[] args) throws IOException
	{
		Test148 ob = new Test148();
		ob.proc();
	}
}
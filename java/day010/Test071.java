/* =====================================
���� Ŭ������ �ν��Ͻ� ����
=====================================*/

// �� CircleTest.java���ϰ� �� ��Ʈ~!

// ���� ���̿� �ѷ� ���ϱ�
// ���� ���̿� �ѷ��� ���� �� �ִ� Ŭ������ �����Ѵ�.
// (Ŭ������: CircleTest)

// �� ���� ����= ������ * ������ * 3.141592
//	���� �ѷ�= ������ * 2 *3.141592
// (Ŭ������: CircleTest)
// �Է��� BufferedReader�� readLine()



// ���� ��)
// ������ �Է�: xxx

// >> �������� xxx�� ���� 
// >> ����: xxxx.xx
// >> �ѷ�: xxxx.xx
// ����Ϸ��� �ƹ� Ű�� ��������.
import java.io.IOException;

public class Test071
{
	public static void main(String[] args) throws IOException
	{
		// ���� Ǭ ���� --------------------------
		/*
		CircleTest ct = new CircleTest();

		ct.input();

		double area = ct.calArea();
		double length = ct.calLength();

		ct.print(area,length);
		*/

		// �Բ� Ǭ ���� --------------------------
		// CircleTest Ŭ���� ����� �ν��Ͻ� ����
		// CircleTest �ν��Ͻ� ����
		// CircleTest ��ü ����
		CircleTest ob = new CircleTest();

		ob.input();

		double num1 = ob.calArea();
		double num2 = ob.calLength();

		ob.print(num1, num2);

	}
}
/*
������ �Է�: 254
>> �������� 254�� ����>> ����: 202682.95
>> �ѷ�: 1595.93
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
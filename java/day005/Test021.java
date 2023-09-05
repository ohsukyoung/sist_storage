/* =====================================
���� �ڹ� �⺻ ���α׷��� ����
 - ��� ������
 - BufferedReader
 - printf()
=====================================*/

// ����ڷκ��� ������ ������ �� �� �Է¹޾�
// ��Ģ���� �� ������ ������ �����Ͽ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, �Է¹޴� ������ BufferedReader�� Ȱ���� �� �ֵ��� �ϰ�
// ����ϴ� ������ printf()�޼ҵ� Ȱ���� �� �ֵ��� �Ѵ�.
// ����, ������ ������ ���ǻ� ���� ��� ó���Ѵ�.

// ���� ��)
// ù ��° ���� �Է�: 10
// �� ��° ���� �Է�: 2
//
//=====[���]=====
// 10 + 2 = 12
// 10 - 2 = 8
// 10 * 2 = 20
// 10 / 2 = 5
// 10 % 2 = 0
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

//import java.io.*

public class Test021
{
	public static void main(String[] args) throws IOException{
		
		// ���� Ǭ ���� --------------------------
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int num1, num2;

		System.out.printf("ù ��° ���� �Է�: ");
		num1 = Integer.parseInt(br.readLine());

		System.out.printf("�� ��° ���� �Է�: ");
		num2 = Integer.parseInt(br.readLine());

		System.out.printf("\n%d + %d = %d", num1, num2, num1 + num2);
		System.out.printf("\n%d - %d = %d", num1, num2, num1 - num2);
		System.out.printf("\n%d * %d = %d", num1, num2, num1 * num2);
		System.out.printf("\n%d / %d = %d", num1, num2, num1 / num2);
		System.out.printf("\n%d %% %d = %d", num1, num2, num1 % num2);
		*/

		// �Բ� Ǭ ���� --------------------------
		//�ֿ� ���� ����
		int num1, num2;						//-- ����� �Է°��� ���� ����
		int res1, res2, res3, res4, res5;	//-- ������ ���� ����� ���� ����

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		//���� �� ó��
		System.out.print("ù ��° ���� �Է�: ");
		num1 = Integer.parseInt(br.readLine());
		System.out.print("�� ��° ���� �Է�: ");
		num2 = Integer.parseInt(br.readLine());

		res1 = num1 + num2;
		res2 = num1 - num2;
		res3 = num1 * num2;
		res4 = num1 / num2;
		res5 = num1 % num2;
		
		//��� ���
		System.out.printf("\n=====[���]=====\n");
		System.out.printf("%d + %d = %d\n", num1, num2, res1);
		System.out.printf("%d - %d = %d\n", num1, num2, res2);
		System.out.printf("%d * %d = %d\n", num1, num2, res3);
		System.out.printf("%d / %d = %d\n", num1, num2, res4);
		System.out.printf("%d %% %d = %d\n", num1, num2, res5);		// "%%" �� "%"
		
	}
}

//���� ���
/*
ù ��° ���� �Է�: 10
�� ��° ���� �Է�: 2

=====[���]=====
10 + 2 = 12
10 - 2 = 8
10 * 2 = 20
10 / 2 = 5
10 % 2 = 0
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
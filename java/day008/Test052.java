/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - �ݺ���(while��) �ǽ� �� ����
=====================================*/

// �� ����
// ����ڷκ��� ������ ������ �Է¹޾�
// 1���� �Է¹��� �� ����������
// ��ü �հ�, ¦���� �հ�, Ȧ���� ���� 
// ���� ��������� �����Ͽ� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ������ ���� �Է�: 396
// >> 1 ~ 396 ���� ������ ��: xxxxx
// >> 1 ~ 396 ���� ¦���� ��: xxxx
// >> 1 ~ 396 ���� Ȧ���� ��: xxxx
// ����Ϸ��� �ƹ� Ű�� ��������...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test052
{
	public static void main(String[] args) throws IOException
	{
		//�ֿ� ���� ���� �� �ʱ�ȭ
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int i;				// ��������
		int num;			// ������ ����
		int sumBox;			// ������
		int even;			// ¦����
		int odd;			// Ȧ����
		i = num = sumBox = even = odd = 0;	// ���� 0 ���� �ʱ�ȭ

		// ���� �� ó��
		System.out.print("������ ���� �Է�: ");
		num = Integer.parseInt(br.readLine());

		while(++i<=num)		// �Է¹��� �������� ���ų� ���� ��
		{
			sumBox += i;	// ������ ��
			if(i%2==0){		// ¦���� ���
				even += i;	// ¦���� ��
			}else{			// Ȧ���� ���
				odd += i;	// Ȧ���� ��
			}
		}

		// ��� ���
		System.out.printf(">> 1 ~ %d ������ ������ ��: %d\n", num, sumBox);
		System.out.printf(">> 1 ~ %d ������ ¦���� ��: %d\n", num, even);
		System.out.printf(">> 1 ~ %d ������ Ȧ���� ��: %d\n", num, odd);
	}
}
// ���� ���
/*
������ ���� �Է�: 396
>> 1 ~ 396 ������ ������ ��: 78606
>> 1 ~ 396 ������ ¦���� ��: 39402
>> 1 ~ 396 ������ Ȧ���� ��: 39204
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

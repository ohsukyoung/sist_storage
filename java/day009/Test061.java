/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - �ݺ���(for��) �ǽ� �� ����
=====================================*/

// �� ���� for��(�ݺ����� ��ø)�� Ȱ���� ����� �ǽ�

// �� ����
// ������ ���� ������ ��µ� �� �ֵ���
// �ݺ����� ��ø ������ �ۼ��Ͽ� ���α׷��� �����Ѵ�.

// ���� ��)
/*
    *
   ***
  *****
 *******
*********

*/

public class Test061
{
	public static void main(String[] args){
	
		// �ֿ� ���� ���� �� �ʱ�ȭ
		int num=5;	//-- �� ����
		int i;		//-- �� ���� ���� ����
		int j;		//-- " " ����(����)
		int k;		//-- "*" ����

		// ���� �� ó�� & ��� ���
		for(i=1; i<=num; i++)			// 5������ �ݺ�, �Է°�: 1 2 3 4 5
		{
			for(j=1; j<=num-i; j++)		
			// (�� ���� - ���� ���� ����)���� ���� : ���� ���� ������ ���� " "�Է� ���� �پ��
			{
				System.out.print(" ");	// " "���
			}

			for(k=1; k<=i+(i-1); k++)
			// (���� ���� ���� + (������-1))���� ���� : ���� ���� ������ ���� "*"�Է� ���� �þ
			{
				System.out.print("*");	// "*"���
			}
			System.out.println();		// ����
		}
	}
}

// ���� ���
/*
    *
   ***
  *****
 *******
*********
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
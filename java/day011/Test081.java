/* =====================================
���� �迭 ����
- �迭�� ����� �ʱ�ȭ
- �迭�� �⺻�� Ȱ��
=====================================*/

/*
char �ڷ����� �迭�� �����
�� �迭�� �� �濡 ���ĺ� �빮�ڸ� ä���
ä���� �� �迭�� ��ü ��Ҹ� ����ϴ� ���α׷��� �����Ѵ�.
��, ä��� ������ ����ϴ� ������ ���� �и��Ͽ� ó���� �� �ֵ��� �Ѵ�.

���� ��)
A B C D E F G ...V W X Y Z
// ����Ϸ��� �ƹ� Ű�� ��������...

A, B, C, D, E, 
F, G, H, I, J, 
K, L, M, N, O,
P, Q, R, S, T,
U, V, W, X, Y, Z
*/

public class Test081
{
	public static void main(String[] args)
	{
		// ���� Ǭ ���� --------------------------
		/*
		char[] arr = new char[26];
		char ap = 'A';
		for(int i=0; i<26; i++)
		{
			arr[i] = (char)(ap+i);
		}
		for(int i=0; i<26; i++)
		{
			System.out.printf("%c ",arr[i]);
		}
		*/

		// �Բ� Ǭ ���� --------------------------
		// ���� ���ĺ� �빮�� �迭 ����
		// �����
		char[] arr1;
		arr1 = new char[26];

		arr1[0] = 'A';
		//	:
		arr1[25] = 'Z';

		// �����
		char[] arr2 = {'A','B','.','Z'};

		// �����
		char[] arr3 = new char[26];
		for(int i=0, ch=65; i<arr3.length; i++, ch++) // i �� 0~25, ch �� 65~90
		{
			// �׽�Ʈ
			//System.out.println("i:" + i + ", ch:" + ch);
			arr3[i] = (char)ch;
		}
		
		//�迭 ��� ��ü ���
		for(int i=0; i<arr3.length; i++)
		{
			System.out.print(arr3[i]+" ");
		}
		System.out.println();\
	}
}
// ���� ���
/*
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
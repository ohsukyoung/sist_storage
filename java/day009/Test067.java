/* =====================================
���� �޼ҵ��� ��� ȣ�� ����
=====================================*/

public class Test067
{
	public static void main(String[] args)
	{
		showHi(3);
	}

	// showHi() �޼ҵ��� �ڵ� ������ �� ���� ��ġ �ٲٱ�

	public static void showHi(int cnt)
	{
		/*
		System.out.println("Hi~");
		showHi(cnt--);
		// postfix
		if(cnt==1)
			return;
		*/

		System.out.println("Hi~");
		if(cnt==1)
			return;
		showHi(--cnt);

		// 1) cnt�� 1�϶� ���� �� �� �ֵ���
		// 2) -- �Ҷ� �Ѱ����� �� Ȯ��
		
	}
}
/* =====================================
���� Ŭ���� ��� ����
- �߻� Ŭ����(abstract)
=====================================*/

/*
�� �߻� Ŭ����(abstract)��

	���� �ְ� ���ǰ� ���� �ϳ� �̻��� �޼ҵ�(�߻� �޼ҵ�)�� ���� Ŭ������
	���� Ŭ����(�ڽ� Ŭ����)���� �������̵�(Overriding)�� ������ ����Ǵ� �޼ҵ忡 ����
	�޸� ���� ���� �̸� ȣ�� ��ȹ�� �����α� ���� �����.

�� ���� �� ����
	[��������������] abstract class Ŭ������
	{
		[��������������] abstract �ڷ��� �޼ҵ��([�Ű�����],...);
	}

�� Ư¡
	Ŭ������ ��� �ϳ� �̻��� �߻� �޼ҵ带 ������ ��
	�� Ŭ������ Ŭ���� �ƿ� ��abstract�� Ű���带 �ٿ�
	�߻� Ŭ������ ����ؾ� �ϸ�,
	�߻� Ŭ������ ������ ��쿡�� 
	�ҿ����� ������ Ŭ�����̹Ƿ� ��ü�� ������ �� ����.
	�߻� �޼ҵ尡 �������� �ʴ� �߻� Ŭ����������
	��ü�� ������ �� ���� ���̴�.

	��, �߻� Ŭ������ ���������� ������ �� ���� ������
	����� ���ؼ��� �����ϸ�
	�߻� Ŭ������ ��ӹ��� ���� Ŭ����������
	�ݵ�� �߻� �޼ҵ带 �������̵�(Overridding) �ؾ� �Ѵ�.

 �� ��abstract�� Ű�����
	Ŭ������ �޼ҵ忡���� ����� �� ������
	��� ������ ���� ���������� ����� �� ����.
*/

//class SortInt115
abstract class SortInt115
{
	private int[] value;

	protected void sort(int[] value)
	{
		this.value = value;
		sorting();
	}

	// �߻� �޼ҵ�
	//protected void sorting();
	protected abstract void sorting();

	protected int dataLength()
	{
		return value.length;
	}
	
	// ��final�� Ű����� ����
	// �� Ŭ����(Sorting115)�� ��ӹ޴� Ŭ��������
	// �� �޼ҵ带 ������(Method Overrinding) �� �� ����.
	protected final int compare(int i, int j)
	{
		int x = value[i];
		int y = value[j];

		if(x==y)
			return 0;
		else if(x>y)
			return 1;
		else
			return -1;
	}
	
	// ��final�� Ű����� ����
	// �� Ŭ����(Sorting115)�� ��ӹ޴� Ŭ��������
	// �� �޼ҵ带 ������(Method Overrinding) �� �� ����.
	protected final void swap(int i, int j)
	{
		int temp = value[i];
		value[i] = value[j];
		value[j] = temp;
	}
}// end SortInt115

//public class Test115
//public class Test115 extends SortInt115

// SortInt115(�߻�Ŭ����)�� ��ӹ��� Ŭ���� �� �ϴ��� �߻� Ŭ����
//public abstract class Test115 extends SortInt115
// SortInt115(�߻�Ŭ����)�� ��ӹ��� Ŭ���� �� �ϴ��� �߻� Ŭ���� �� �߻�޼ҵ� ������ �� �Ϲ� ���� Ŭ����
public class Test115 extends SortInt115
{
	/*
	private int[] value;

	protected void sort(int[] value)
	{
		this.value = value;
		sorting();
	}

	//�߻� �޼ҵ�
	protected abstract sorting();

	protected int dataLength()
	{
		return value.length;
	}
	
	protected final int compare(int i, int j)
	{
		int x = value[i];
		int y = value[j];

		if(x==y)
			return 0;
		else if(x>y)
			return 1;
		else
			return -1;
	}
	
	protected final void swap(int i, int j)
	{
		int temp = value[i];
		value[i] = value[j];
		value[j] = temp;
	}
	*/

	int i, j;
	static int[] data = {7, 10, 3, 28, 7};

	// �Ϲ�Ŭ�������� ���ҷ� �ٲٱ�
	// �������̵� selection sort ����
	@Override
	//protected abstract void sorting()
	protected void sorting()
	{
		//selection sort
		for(i=0; i<dataLength()-1; i++)
		{
			for(j=i+1; j<dataLength(); j++)
			{
				// ũ�� ��
				if(compare(i,j)>0)
				{
					// �ڸ��ٲٱ�
					swap(i,j);
				}
			}
		}
	}

	public static void main(String[] args)
	{
		System.out.print("Source Dat: ");
		for(int n: data)
			System.out.print(n + " ");
		System.out.println();

		Test115 ob = new Test115();
		ob.sort(data);

		System.out.print("Sorted Data: ");
		for(int n: data)
			System.out.print(n + " ");
		ob.sort(data);
	}
}
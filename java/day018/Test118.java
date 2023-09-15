/* =====================================
���� Ŭ���� ��� ����
- �������̽�(Interface)
=====================================*/

// �������̽�
interface ADemo
{
	public void write();
}

// �������̽�
interface BDemo
{
	public void print();
}

// �� �������̽��� 2�� �̻��� ����(implements)�� �� �ִ�.
//		�� Ŭ�������� ���� ����� ���� �ʴ� �κ��� ����(����)�ϴ� ����

// Ŭ����
//class EmoImpl
//class EmoImpl extends ADemo, BDemo //--(x)
//class EmoImpl implements ADeom, BDemo
//		��
// �߻� Ŭ���� - �� �������̽��� �����ϴ� �߻� Ŭ����
//abstract class DemoImpl implements ADemo, BDemo
//
// Ŭ���� - �� �������̽� ������ �� �� �� �������̽��� ��� �޼ҵ带 Overring �� �Ϲ� Ŭ����
class DemoImpl implements ADemo, BDemo
{
	// JDK 1.5(5.0)������ �������̽� �޼ҵ带
	// �������̵�(Overriding) �� ��
	// ��@Override�� ������̼�(annotation)�� ����� �� ����.
	// JDK 1.6(6.0) ���ĺ��� ���� ������ �����ϴ�.
	// ��, ��ӹ��� Ŭ������ �޼ҵ带 �������̵�(Overriding) �� ������
	// JDK 1.5(5.0)������ ������̼� ����� �����ϴ�.
	@Override
	public void write()
	{
		System.out.println("ADemo �������̽� �޼ҵ� write()...");
	}
	
	@Override
	public void print()
	{
		System.out.println("BDemo �������̽� �޼ҵ� print()...");
	}
}


// main() �޼ҵ带 �����ϴ� �ܺ��� �ٸ� Ŭ����
public class Test118
{
	public static void main(String[] args)
	{
		// ADemo ob1 = new ADemo();	//-- �������̽� �� �ν��Ͻ� ���� �Ұ�
		// BDemo ob2 = new BDemo();	//-- �������̽� �� �ν��Ͻ� ���� �Ұ�

		// ADemo, BDemo �������̽�(implements) ������
		// Ŭ����(�� DemoImpl) ����� �ν��Ͻ� ����
		DemoImpl ob1 = new DemoImpl();

		ob1.write();
		//--==>> ADemo �������̽� �޼ҵ� write()...

		ob1.print();
		//--==>> BDemo �������̽� �޼ҵ� print()...

		// �� ĳ����
		ADemo ob2 = new DemoImpl();
		BDemo ob3 = new DemoImpl();

		//ob2.print();
		//--==>> ���� �߻�(������ ����)
		//ob3.write();
		//--==>> ���� �߻�(������ ����)

		ob2.write();
		//--==>> ADemo �������̽� �޼ҵ� write()...
		ob3.print();
		//--==>> BDemo �������̽� �޼ҵ� print()...

		((BDemo)ob2).print();
		//--==>> BDemo �������̽� �޼ҵ� print()...
		((ADemo)ob3).write();
		//--==>> ADemo �������̽� �޼ҵ� write()...
		//-- �� DemoImpl Ŭ������ �� �������̽�(ADemo, BDemo)�� ��� �����߱� ������
		//		�̿Ͱ��� ó���� �����ϴ�.
		//		���� DemoImpl Ŭ������ �� �������̽��� �� �� �������̽��� �����ߴٸ�
		//		�� ������ ��Ÿ�� ������ �߻��ϴ� ������ �ȴ�.

		// �ٿ� ĳ����
		((DemoImpl)ob3).write();
		//--==>> ADemo �������̽� �޼ҵ� write()...
	}
}
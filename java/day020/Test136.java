/* =====================================
���� �ڹٿ��� �ֿ�(�߿�) Ŭ���� ����
- �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
- String Ŭ����
=====================================*/

/*
�� String Ŭ������ ���� ���ڿ� �����Ϳ� ���� ������ �Ұ����ϴ�.
	(��, ������ �Һ�: immutable)
	���ڿ��� ������ ����Ǹ� ���ο� ��ü�� �����ϸ�
	���� ����� �Ҿ���� ��ü�� ������ �÷����� ����� �ǰ�,
	���ο� ��ü�� �� �ּҸ� �Ҵ��ϰ� �ǹǷ� �ؽ��ڵ嵵 ���ϰ� �� �� �ִ�.

	String Ŭ���� ���� ��+�� �����ڸ� ����ϰ� �Ǹ�
	���ڿ� ���� ������ �����ϸ�,
	String Ŭ������ �ٸ� Ŭ���� ��ü, �Ǵ� �⺻�� ������ ����
	��+�� �����ڸ� ����ϴ� ��쿡��
	���������� �ڵ� String Ŭ������ ��ȯ�� �����ϴ�.

	�� ������(�ð�������) Ȯ�εǴ� ����� �̷�����...
		String�� ������ ������ �� ���� ������
		��+�� �����ڸ� ��밡�� �Ǹ�
		���������� StringBuffer �� �����Ͽ�		//** Buffer ���� �ӽ÷� ��Ƶδ� ����
		append() �޼ҵ带 �̿��Ͽ� ���忭�� ���� ������ �����ϰ� �ȴ�.
		���� ������ ���ڿ��� ���� ����ϴ� Servlet �����
		�ǵ����̸� String�� ����ϴ� �� ����
		StringBuffer�� char[]�� ����ϴ� ���� ȿ������ �� �ִ�.

		==>> ������ ���ڿ��� ó���ϴ� ��쿡�� �ַ� String Ŭ������ ���
			������ ���ڿ��� ó���ϴ� ��쿡�� 
			�� Ÿ�ӽ� �������� ó�����ִ�  StringBuffer Ŭ������ 
			����ϴ� ���� ȿ�����̴�.

�� String ��ü ���� �� Ư¡

	String ��ü�� �����ϴ� �����
	�� ���ڿ� ����� �����ϴ� �����
	�� String ��Ŭ������ �����ڸ� �̿��ϴ� ���
	�̷��� �� ���� ����� �ִ�.

	String str1 = "Java";
	String str2 = "Java";
	String str3 = "Java";

	String str4 = new String("Java");
	String str5 = new String("Java");
	String str6 = new String("Java");

	������, �����ڿ� ����� �� ���� �����ڸ� ����Ͽ�
	�����ϴ� ����� ���� ��ü�� �����ϴ� ����
	��new�� �����ڸ� �̿��Ͽ� ��ü�� �����ϴ� ����
	���������� �ǹ̰� �ٸ���.

*/

public class Test136
{
	public static void main(String[] args)
	{
		//** new������ �� ����� ���Ӱ� ���������

		//** �ּҿ� �ؽ��ڵ�� ���� �ʴ�.

		String s1 = "seoul";
		String s2 = "seoul";
		String s3 = new String("seoul");
		String s4 = new String("seoul");

		System.out.println("s1: "+s1);
		System.out.println("s2: "+s2);
		System.out.println("s3: "+s3);
		System.out.println("s4: "+s4);
		//--==>> s1: seoul
		//		s2: seoul
		//		s3: seoul
		//		s4: seoul

		System.out.println("s1 == s2" + (s1 == s2));
		System.out.println("s1 == s2" + (s2 == s3));
		System.out.println("s1 == s2" + (s3 == s4));
		System.out.println("s1 == s2" + (s4 == s1));
		//--==>> s1 == s2true
		//		s1 == s2false
		//		s1 == s2false
		//		s1 == s2false

		// �� s1�� s2 ��ü�� �����ϴ� ���ڿ� ����� ������ ���
		//		���ڿ��� ����� �������� ������ �����ϱ� ������
		//		s1 ��ü�� s2 ��ü�� ������ �����Ҹ� �����ϰ� �ȴ�.
		//		������,
		//		s3�� s4�� ������ ������ �ƴ� �ٸ� ��� ������
		//		���Ӱ�(new) Ȯ���Ͽ� ���ڿ� ����� �� ������ ������ ����̹Ƿ�
		//		�� �ν��Ͻ��� ���� ������ �����ϴ� ���� �ƴϴ�.
		//		���� s3 == s4�� �����̵Ǹ�
		//		����, ���� ���ڿ� ������� ���θ� ���ؾ� �� �����
		//		equals()�޼ҵ带 �̿��ؾ��Ѵ�.

		// �� String Ŭ������ Object�� equals()�� Overriding~!!!
		
		System.out.println("s1.equals(s2): " + s1.equals(s2));
		System.out.println("s1.equals(s3): " + s1.equals(s3));
		System.out.println("s1.equals(s4): " + s1.equals(s4));
		System.out.println("s1.equals(s1): " + s1.equals(s1));
		//--==>> s1.equals(s2): true
		//		s1.equals(s3): true
		//		s1.equals(s4): true
		//		s1.equals(s1): true

		System.out.println("s1: "+ s1.hashCode());
		System.out.println("s2: "+ s1.hashCode());
		System.out.println("s3: "+ s1.hashCode());
		System.out.println("s4: "+ s1.hashCode());
		//--==>> s1: 109324212
		//		s2: 109324212
		//		s3: 109324212
		//		s4: 109324212


		// �� ��ü�� ������  hashcode �� ������
		//	hascode�� ���ٰ� �ؼ� ���� ��ü�� �ƴϴ�~!!!

		s2 += "korea";
		System.out.println("s2: "+s2);

		s2 = "korea";
		System.out.println("s2: "+s2);
		//s2: seoulkorea
		//s2: korea

		//-- �̿� ���� ���
		// s2�� ������ "seoul"�� ����� ������
		// s2 += korea; �� �����Ǵ� ��������
		// �ش� ������ ���� ����Ǵ� ���� �ƴ϶�
		// ������ �÷����� ����� �Ǹ�,
		// "seoul korea" ����� ����� ������
		// s2�� �����ϰ� �Ǿ��ٰ�
		// �ٽ� s2�� ������ "seoul korea"�� ����� ������
		// s2= "korea"; �� ����Ǵ� ��������
		// ������ �÷����� ����� �Ǹ�
		// "korea"���ڿ� ����� ���Ӱ� ����� ������
		// s2�� �����ϰ� �ȴ�.
		// 
		// �� String ��ü�� ������ �Һ��̴�~!!

		
	}
}
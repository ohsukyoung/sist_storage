/* =====================================
���� �ڹٿ��� �ֿ�(�߿�) Ŭ���� ����
- �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
- StringBuffer Ŭ����
=====================================*/

/*
�� StringBuffer Ŭ����
	���ڿ��� ó���ϴ� Ŭ������ String Ŭ�������� ��������
	String Ŭ������ ���� ���ڿ� �������� ������ �Ұ���������
	StringBuffer Ŭ������ ���ڿ��� ����� ��
	���� ���ڿ��� ���� �ܰ迡�� ������ �� �ִ�.

	��, StringBuffer ��ü�� �������� ���̸� �����Ƿ�
	��ü�� �����ϴ� �������� �̸� �� ũ�⳪ ���� �����ϰų�
	���� ������ ������ ũ�⸦ �ٲ� �� �ִ� ����� �����Ѵ�.

	����, JDK 1.5 ���� ���ʹ�
	���ڿ��� ó���ϴ�  StringBuilder ��� Ŭ������ �����Ѵ�.
	StringBuilder Ŭ������ ����� Stringbuffer Ŭ������ ����������
	���� ū �������� multi-thread unsafe ��� ���̴�.	//** ��������ڰ� ������ �������� ����
	��, syncronization�� ���� ������
	StringBuffer ���� ������, ���ü�(����ȭ)������ ���ٸ�
	StringBuilder�� ����ϴ� ���� ������ ����ų �� �ִ�.
*/

//** ������: ���� �۾��� �ϴ� ����, ����, �ϲ�...
//** cpu ������� ����: �������� ������ �������� ���ݾ� �����Ѵ�.
//** ���۸�: �ӽð��� ����� ���۸� �����
//** StringBuffer�� ���߽����忡���� ���� �� ����, �׷��� ����

public class Test138
{
	public static void main(String[] args)
	{
		String str1 = new String("seoul");
		String str2 = new String("seoul");

		System.out.println(str1 == str2);
		System.out.println(str1.equals(str2));		//** ����
		//--==>> false
		//		true

		StringBuffer sb1 = new StringBuffer("korea");
		StringBuffer sb2 = new StringBuffer("korea");

		System.out.println(sb1 == sb2);
		System.out.println(sb1.equals(sb2));
		//--==>> false
		//		false

		System.out.println("------------------------------------------------");

		System.out.println(sb1);
		//--==>> korea
		//** ��Ʈ������ ��½� korea������ ���� tostring�� �������̵��ؼ� ��µ� ��
		//** ��Ʈ������ ��ü ���
		
		System.out.println(sb1.toString());
		//--==>> korea
		//** ��Ʈ�� ���

		System.out.println(sb1.toString().equals(sb2.toString()));
		//--==>> true

		StringBuffer sb3 = new StringBuffer();
		//** �Ű����� ���� ��Ʈ������ ����
		//-- StringBuffer �⺻ ������ ȣ��(�ν��Ͻ� ���� ����)
		//		�⺻������ �����Ǵ� ���� ũ��� ��16��

		// capacity()
		System.out.println("���� ũ��: " + sb3.capacity());
		//--==>> ���� ũ��: 16

		//////////////////////////////////////////////////////////

		System.out.println(sb3);
		//--==>> ��

		/*
		String name = "ȫ�浿";
		name += "ȫ�浿";
		name += "��Ѹ�";
		name += "�ֶ�ġ";

		System.out.println(name);
		//--==>> ȫ�浿ȫ�浿��Ѹ��ֶ�ġ
		//** ȫ�浿 �ҽ�
		//** ȫ�浿ȫ�浿 �ҽ�
		//** ȫ�浿ȫ�浿��Ѹ� �ҽ�
		//** ȫ�浿ȫ�浿��Ѹ��ֶ�ġ ����
		*/

		sb3.append("seoul");	// sb += "seoul";
		sb3.append("korea");	// sb += "";
		sb3.append("�츮����");	// sb += "";
		sb3.append("���ѹα�");	// sb += "";
		// �޸𸮸� �� ���� ��

		System.out.println(sb3);
		//--==>> seoulkorea�츮������ѹα�
		System.out.println(sb3.toString());
		//--==>> seoulkorea�츮������ѹα�

		// ����ũ�� Ȯ��: �˾Ƽ� �þ
		System.out.println("���� ũ��: " + sb3.capacity());
		//--==>> ���� ũ��: 34


		//////////////////////////////////////////////////////////

		String temp1 = "java and oracle";

		System.out.println(temp1.toUpperCase());
		//--==>> JAVA AND ORACLE

		String temp2 = "JAVA AND ORACLE";
		System.out.println(temp2.toLowerCase());

		//System.out.println(sb3.toUpperCase());
		//System.out.println(sb3.toLowerCase());
		//--==>> ���� �߻�(������ ����)

		// seoulkorea�츮���� ���ѹα�
		String temp3 = "seoulkorea�츮������ѹα�";
		System.out.println(temp3.toUpperCase());
		//--==>> SEOULKOREA�츮������ѹα�
		System.out.println(sb3.toString().toUpperCase());
		//--==>> SEOULKOREA�츮������ѹα�
		//** �ٲ����� ��¸� �׷��� �� ��, ����� ���� �״����

		// seoulkorea�츮���� ���ѹα�

		//�� ��� ���ڿ�(sb3 �� "seoulkorea�츮������ѹα�")wnd
		//		"seoul" ���ڿ� �տ� "�ѱ�"�̶�� ���ڿ� �߰�
		//		��, ���ѱ�seoulkorea�츮������ѹα��� ���� ����
		sb3.insert(0,"�ѱ�");
		System.out.println("seoul �տ� ���ѱ����߰�:" + sb3);
		//--==>> seoul �տ� ���ѱ����߰�:�ѱ�seoulkorea�츮������ѹα�
		System.out.println("seoul �տ� ���ѱ����߰�:" + sb3.toString());
		//--==>> seoul �տ� ���ѱ����߰�:�ѱ�seoulkorea�츮������ѹα�
		
		//�� ��� ���ڿ�(sb3 �� "�ѱ�seoulkorea�츮������ѹα�")��
		//		"korea" ���ڿ� �ڿ� "���" �̶�� ���ڿ� �߰�
		//		��, ��� ���ڿ��� �ε����� ������ ���� Ȯ������ �ʰ�
		//		��, ���ѱ�seoulkorea�츮������ѹα��� ���� ����
		
		// �׽�Ʈ ��
		System.out.println(sb3.toString());
		//--==>> �ѱ�seoulkorea�츮������ѹα�

		// �׽�Ʈ ��
		//sb3.insert(12,"���");
		//System.out.println("korea �ڿ� ��������߰�:" + sb3);
		//--==>> �ѱ�seoulkorea����츮������ѹα�
		//System.out.println("korea �ڿ� ��������߰�:" + sb3.toString());
		//--==>> �ѱ�seoulkorea����츮������ѹα�

		// �׽�Ʈ ��
		System.out.println(sb3.indexOf("korea"));
		//--==>> 7

		// �׽�Ʈ ��
		System.out.println(sb3.insert(sb3.indexOf("korea")+"korea".length(),"���"));
		//--==>> �ѱ�seoulkorea����츮������ѹα�

		System.out.println(sb3.toString());
		//--==>> �ѱ�seoulkorea����츮������ѹα�

		// �� ��� ���ڿ�(sb3) ����
		// �츮���� ���ڿ� ����
		//sb3.delete(14,18);
		//System.out.println(sb3);
		System.out.println(sb3.delete(sb3.indexOf("�츮����"),sb3.indexOf("�츮����") + "�츮����".length()));
		//--==>> �ѱ�seoulkorea������ѹα�

		//sb3.delate(14, 18);
		//			  �� ��	
		//			  �� ������sb3.indexOf("�츮����") + "�츮����".length()
		//		sb3.indexOf("�츮����");


		// �� ��� ���ڿ�(sb3) ����
		// ��korea�� ���� ��� ���ڿ� ����(korea ����)
		// �ѱ�seoul
		System.out.println(sb3.delete(sb3.indexOf("korea"),sb3.length()));

		//sb3.delete(7); //--(X)
		//System.out.println(sb3.toString());

		// sb3.delete(7, 18);
		//			  �� ��	
		//			  �� ������sb3.length()
		//		sb3.indexOf("korea");

		////////////////////////////////////////////////////////////////////////

		// ���� ũ�� �ٽ� Ȯ��
		System.out.println("����ũ��: "+sb3.capacity());
		//--==>> ����ũ��: 34

		// ĳ�ۼ�Ʈ �޼ҵ�
		//** ���� ������ �þ�� �ڵ����� �þ��--(O)
		//** ���� ������ �پ�鶧 �ڵ����� �پ���--(x)

		System.out.println("���ڿ��� ����: " + sb3.length());
		//--==>> ���ڿ��� ����: 7

		//���� ũ�� ����
		// �� ���� ���ڿ��� ��Ƶ� �� �ִ� ������ ũ���...
		// trimToSize();
		sb3.trimToSize();
		
		//���� ũ�� ���� ���� ���� �ѱ� �ٽ� Ȯ��
		System.out.println("����ũ��: " + sb3.capacity());
		//--==>> ����ũ��: 7
	}
}
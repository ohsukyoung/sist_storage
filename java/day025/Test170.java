/* =====================================
���� �÷���(Collection) ����
=====================================*/

// Map �� Hashtable, HashMap

/*
�� java.util.Map �������̽�
	Ű(key)�� ��(Value)�� ����(mapping)�ϸ�
	������ Ű�� ����� �� ����, �����ؾ� �ϸ�,
	�� Ű�� �Ѱ��� ���� �����ؾ� �Ѵ�.
	��, �ϳ��� Ű�� �����ϴ� �ϳ��� ���� ���� �����̴�.
/** �̸�ǥ ���� �� �޷�����(Ű�� ��)
*/

/*
�� Hashtable<K, V> Ŭ����
	- �ؽ����̺� ������ ��ü �𵨸�ȭ �� Ŭ������
		�˻��� �����ϱ� ������ ��� �󵵰� ���� �� ���Ѵ�.
	- �ؽ����̺��̶� Ű(key)�� �׿� �����ϴ� ������(value)��
		���е� �����ͱ����̴�.
	- �����͸� �����ϰ�, �˻��ϱ� ���ؼ� Ű(key)�� �����ϸ�
		�� ���ֿ����� Ű���� �ο��ϸ� �ش� �����Ͱ� ��ȯ�ȴ�.
	- ����, Hashtable Ŭ������ key �Ǵ� value�� ������ null�� ������� �ʴ´�.
*/
import java.util.Hashtable;
public class Test170
{
	private static final String[] names =  {"��Ѹ�","�ڶ�ġ","������","�����","ȫ�浿","������"};

	private static final String[] tels = {"010-0000-0000", "010-1111-1111", "010-2222-2222", "010-3333-3333", "010-4444-4444", "010-5555-5555"};

	public static void main(String[] args)
	{
		// Hashtable �ڷᱸ�� ����
		Hashtable<String, String> ht = new Hashtable<String, String>();		//** <String,String>: Ű ���ڿ�, ���� ���ڿ��� ����

		// ht ��� Hashtable �ڷᱸ����
		// �迭(names, tels)�� ����ִ� �����͸� ��ҷ� ��Ƴ���
		// �� put(k,v);
		for (int i=0; i<names.length ;i++ )
		{
			// ht.put("��Ѹ�", "010-0000-0000");
			ht.put(names[i],tels[i]);
		}

		// ht ��� Hashtable �ڷᱸ������
		// key �� �̿��Ͽ� ������ �˻�
		// �� get(k);

		String finalName1 = "�ڶ�ġ";
		String str = ht.get(finalName1);
		if(str != null)
		{
			System.out.println(finalName1 + " ��ȭ��ȣ: " + str);
		}//else
		//{
		//	System.out.println("�׽�Ʈ");
		//}
		System.out.println();
		//--==>> �ڶ�ġ ��ȭ��ȣ: 010-1111-1111

		// ht ��� Hashtable �ڷᱸ����
		// key�� �����ϴ����� ���� Ȯ��
		// �� containsKey()
		String finalName2 = "������";
		if(ht.containsKey(finalName2))
		{
			System.out.println(finalName2 + " �����Ͱ� �����մϴ�.");
		}else
		{
			System.out.println(finalName2 + " �����Ͱ� �������� �ʽ��ϴ�.");
		}
		System.out.println();

		String finalName3 = "�����";
		if(ht.containsKey(finalName3))
		{
			System.out.println(finalName3 + " �����Ͱ� �����մϴ�.");
		}else
		{
			System.out.println(finalName3 + " �����Ͱ� �������� �ʽ��ϴ�.");
		}
		System.out.println();

		// ht��� Hashtable �ڷᱸ����
		// value �� �����ϴ����� ���� Ȯ��
		// �� contains()
		String findTel1 = "010-0000-0000";		// ���� ��ȭ��ȣ
		if(ht.contains(findTel1))
		{
			System.out.println(findTel1 + " �����Ͱ� �����մϴ�.");
		}else
		{
			System.out.println(findTel1 + " �����Ͱ� �������� �ʽ��ϴ�.");
		}
		System.out.println();

		// ht��� Hashtable �ڷᱸ������
		// �������� ������ ����
		// �� remove()
		ht.remove("�ڶ�ġ");

		// �� <remove()> �޼ҵ�� ���ڰ����� key �� �Ѱܹ�����
		//		�� ��, key�� �����ȴ� ���� �ƴϴ�.
		//		�ش� key�� ����Ǿ�(���εǾ�) �ִ� value �� �Բ� ���ŵȴ�.

		// ����(remove()) ���� ht ��� Hashtable �ڷᱸ����
		// �ش� key �� �����ϴ��� Ȯ��
		if(ht.containsKey("�ڶ�ġ"))
			System.out.println("�ڶ�ġ �����մϴ�.");
		else
			System.out.println("�ڶ�ġ ��𰬾�????");
		System.out.println();
		//--==>>
		
		// ����(remove()) ���� ht ��� Hashtalbe �ڷᱸ����
		// �ش� key �� �����ϴ��� Ȯ��
		if(ht.contains("010-1111-1111"))
			System.out.println("�ڶ�ġ ��ȭ��ȣ�� �����ϴϴ�.");
		else
			System.out.println("�ڶ�ġ ��ȭ��ȣ�� �������� �ʽ��ϴ�.");
		System.out.println();
		//--==>> 

		// �� null ���� ó�� 
		//** null�� ������� ����

		//ht.put(null, null);			//-- key�� value ��� null �� ����
		//--==>> ���� �߻�(��Ÿ�� ����)
		//		java.lang.NullPointerException

		//ht.put("�����", null);		//-- value�� null �� ����
		//--==>> ���� �߻�(��Ÿ�� ����)
		//		java.lang.NullPointerException

		//ht.put(null, "010-7777-7777");	//-- key�� null �� ����
		//--==>> ���� �߻�(��Ÿ�� ����)
		//		java.lang.NullPointerException

		// �ߺ��� key �Է�
		//** �ߺ��� ���� �ȵ��� ����, ������ ���� ���� Ȯ��
		ht.put("������","010-7777-7777");
		System.out.println(ht.get("������"));
		System.out.println();
		//--==>> 010-7777-7777
		//-- �ߺ��� key�� Ȱ���Ͽ� �����͸� �Է��� ���
		//		���� "010-5555-5555" ���� "010-7777-7777"�� ����Ǿ����� Ȯ��(����� ����)

		// �ߺ��� value �Է�
		ht.put("ȫ�浿","010-3333-3333");
		System.out.println(ht.get("�����"));
		System.out.println(ht.get("ȫ�浿"));
		//--==>> 010-3333-3333
		//		010-3333-3333
		//-- vlue �� �ߺ��� ���� �ԷµǴ���
		//	���� �����Ϳ��� �ƹ��� ���⵵ ��ġ�� ����

	}
}
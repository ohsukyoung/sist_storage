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
�� HashMap<K, V> Ŭ����
	- HashMap Ŭ������ Hashtable Ŭ������ ����������
		Map �������̽����� ��ӹ޾� �ֿ� ����� ������
		Synchronization �� ���� ������ ���ü� ������ ���ٸ�
		(��, ��Ƽ ������ ���α׷��� �ƴ� �����)
		HashMap �� ����ϴ� ���� ������ ����ų �� �ִ�.
	- ����, HashMap �� Hashtable�� �޸� null�� ����Ѵ�.
*/

//** Hashtable�� Hash�� table �ռ�� �ƴ�.
//** HashMap�� Hash�� Map�� �ռ���.

import java.util.HashMap;
import java.util.Map;

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class Test171
{
	public static void main(String[] args) throws IOException
	{
		// HashMap �ڷᱸ�� ����
		//HashMap<String,String> map = new HashMap<String,String>();	//--(O)
		Map<String,String> map = new HashMap<String,String>();

		// map�̶�� HashMap �ڷᱸ���� ��� �߰�
		// �� put();
		map.put("��ȭ", "�Ź���");
		map.put("���", "����");
		map.put("��ȭ", "������ũ");
		map.put("�Ҽ�", "�������� �½�");

		// �׽�Ʈ(Ȯ��) �� ���� Ȯ��
		System.out.println(map);
		//--==>> {�Ҽ�=�������� �½�, ���=����, ��ȭ=�Ź���, ��ȭ=������ũ}
		//** ������ ��������
		//-- ������ ���� ���� Ȯ��
		//-- ������ ��� �ݳ� ������ �߰� ������ ���� ����

		// �� null ���� ó��
		map.put(null,null);			//-- key�� vlaue�� ��� null
		
		// �׽�Ʈ(Ȯ��) �� ���� Ȯ��
		System.out.println(map);
		//--==>> {�Ҽ�=�������� �½�, null=null, ���=����, ��ȭ=�Ź���, ��ȭ=������ũ}

		map.put("��ȭ",null);		//-- vlue�� null

		// �׽�Ʈ(Ȯ��) �� ���� Ȯ��
		System.out.println(map);
		//--==>> {�Ҽ�=�������� �½�, null=null, ���=����, ��ȭ=�Ź���, ��ȭ=null, ��ȭ=������ũ}

		map.put(null,"�𳪸���");	//-- key�� null

		// �׽�Ʈ(Ȯ��) �� ���� Ȯ��
		System.out.println(map);
		//--==>> {�Ҽ�=�������� �½�, null=�𳪸���, ���=����, ��ȭ=�Ź���, ��ȭ=null, ��ȭ=������ũ}
		//** null�� �ϳ��� Ű�� ������ �ν�

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("ī�װ�, Ÿ��Ʋ �Է�(�ĸ� ����): ");
		String[] temp;

		for (String str;((str = br.readLine()) != null); )
		{
			temp = str.split(",");
			if(temp.length <2)
			{
				System.out.print("ī�װ�, Ÿ��Ʋ �Է�(�ĸ� ����): ");
				continue;
			}

			map.put(temp[0].trim(), temp[1].trim());
			System.out.println(map);
		}
		//--==>> ī�װ�, Ÿ��Ʋ �Է�(�ĸ� ����): �Ҽ�,�����
		//		{�Ҽ�=�����, null=�𳪸���, ���=����, ��ȭ=�Ź���, ��ȭ=null, ��ȭ=������ũ}
	}
}
// Test163 Ŭ������ �ϼ��Ͽ� ���� ����� ���� ���α׷��� �����Ѵ�.
 
/*
���� ��)
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴� ����(1~6): 1
 
1��° ��� �Է�: ��Ѹ�
1��° ��� �Է� ����~!!!
��� �Է� ���(Y/N)?: y
 
2��° ��� �Է�: �ڶ�ġ
2��° ��� �Է� ����~!!!
��� �Է� ���(Y/N)?: n
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 2
 
[���� ��ü ���]
��Ѹ�
�ڶ�ġ
���� ��ü ��� �Ϸ�~!!!
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 3
 
�˻��� ��� �Է�: ��Ѹ�
 
[�˻� ��� ���]
�׸��� �����մϴ�.
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 3
 
�˻��� ��� �Է�: ������
 
[�˻� ��� ���]
�׸��� �������� �ʽ��ϴ�.
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 4
 
������ ��� �Է�: ������
 
[���� ��� ���]
�׸��� �������� �ʾ� ������ �� �����ϴ�.
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 4
 
������ ��� �Է�: �ڶ�ġ
 
[���� ��� ���]
�ڶ�ġ �׸��� �����Ǿ����ϴ�.
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 5
 
������ ��� �Է�: ������
 
[���� ��� ���]
������ ����� �������� �ʽ��ϴ�.
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 5
 
������ ��� �Է�: ��Ѹ�
������ ���� �Է�: ���۽�Ÿ
 
[���� ��� ���]
������ �Ϸ�Ǿ����ϴ�.
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 2
 
[���� ��ü ���]
���۽�Ÿ
���� ��ü ��� �Ϸ�~!!
 
	[ �޴� ���� ] =================
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	===============================
>> �޴�����(1~6): 6
 
���α׷� ����!!!
����Ϸ��� �ƹ� Ű�� ��������....
 
*/
/*
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Vector;
 
class Menus		// �� �ϼ�
{
	public static final int E_ADD = 1;		//-- ��� �߰�
	public static final int E_DISP = 2;		//-- ��� ���
	public static final int E_FIND = 3;		//-- ��� �˻�
	public static final int E_DEL = 4;		//-- ��� ����
	public static final int E_CHA = 5;		//-- ��� ����
	public static final int E_EXIT = 6;		//-- ����
}

public class Test163
{
	// �ֿ� �Ӽ� ���� �� �Ϸ�
	private static final Vector<Object> vt;	//-- �ڷᱸ��
	private static BufferedReader br;	//-- �Է� �� Ȱ��
	private static Integer sel;			//-- ���� ��
	private static String con;			//-- ��� ���� ����
 
	// static �ʱ�ȭ ��	�� �ϼ�
	static
	{
		//Vector �ڷᱸ�� ����
		vt = new Vector<Object>();
 
		//BufferedReader ��ü ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
 
		// ����� �Է°� �ʱ�ȭ
		sel = 1;
		con = "Y";
 
	}
 
	// �޴� ��� �޼ҵ�
	public static void menuDisp()
	{
		System.out.println("\t [ �޴� ���� ] =================");
		System.out.println("\t 1. ��� �߰�");
		System.out.println("\t 2. ��� ���");
		System.out.println("\t 3. ��� �˻�");
		System.out.println("\t 4. ��� ����");
		System.out.println("\t 5. ��� ����");
		System.out.println("\t 6. ����");
		System.out.println("\t ===============================");
	}
 
	// �޴� ���� �޼ҵ�
	public static void menuSelect() throws IOException, NumberFormatException
															//** NumberFormatException ��Ÿ�ӿ��� �����Է½� ����ó��
	{
		br = new BufferedReader(new InputStreamReader(System.in)); //**������
		System.out.printf(">> �޴�����(1~6): ");
		sel = Integer.parseInt(br.readLine());
 
	}
 
	// ���õ� �޴� ���࿡ ���� ��� ȣ�� �޼ҵ�
	public static void menuRun() throws IOException
	{
		//System.out.println("0. �޴� ���� ��� ȣ��");
 
		switch(sel)
		{
			case Menus.E_ADD	: addElement();break;	//-- ��� �߰�
			case Menus.E_DISP	: dispElement();break;	//-- ��� ���
			case Menus.E_FIND	: findElement();break;	//-- ��� �˻�
			case Menus.E_DEL	: dleElement();break;	//-- ��� ����
			case Menus.E_CHA	: chaElement();break;	//-- ��� ����
			case Menus.E_EXIT	: exit();break;
		}
	}
 
	// �ڷᱸ���� ��� �߰�(�Է�) �޼ҵ�
	public static void addElement() throws IOException
	{
		//System.out.println("1. ��� �߰�");	// ����
 
		System.out.println();
		int n=1;
 
		do
		{
			System.out.printf("%d��° ��� �Է�: ",n);			//-- vt.size()+1
			vt.add(br.readLine());
			System.out.printf("%d��° ��� �Է� ����~!!!\n",n);	//-- vt.size()
			System.out.print("��� �Է� ���(Y/N): ");
			con = br.readLine();
			n++;
		}
		while (con.equals("y") || con.equals("Y"));
	}
 
	// �ڷᱸ���� ��� ��� �޼ҵ�
	public static void dispElement()
	{
		//System.out.println("2. ��� ���"); //����
 
		System.out.print("[���� ��ü ���]\n");
		for (Object obj: vt)
		{
			System.out.println((String)obj);
		}
		System.out.println("���� ��ü ��� �Ϸ�~!!!");
 
	}
 
	// �ڷᱸ�� �� ��� �˻� �޼ҵ�
	public static void findElement() throws IOException
	{
		//System.out.println("3. ��� �˻�"); //���
 
		String temp;
 
		System.out.print("�˻��� ��� �Է�: ");
		temp = br.readLine();
		System.out.println(vt.get(vt.indexOf(temp)));
		//if(vt.contains(temp))
		{
			int i = vt.indexOf(temp);
			System.out.println("[�˻� ��� ���]");
			System.out.println("�׸��� �����մϴ�.");
		}
		else
		{
			System.out.println("[�˻� ��� ���]");
			System.out.println("�׸��� �������� �ʽ��ϴ�.");
		}
		System.out.println();
	}
 
	// �ڷᱸ�� �� ��� ���� �޼ҵ�
	public static void dleElement() throws IOException
	{
		//System.out.println("4. ��� ����"); //�ϼ�
 
		System.out.print("������ ��� �Է�: ");
		String st = br.readLine();
		System.out.println();
		System.out.println("[���� ��� ���]");
 
		if(vt.contains(st))
		{
			int i = vt.indexOf(st);
			vt.remove(i);
			System.out.printf("%s �׸��� �����Ǿ����ϴ�.", st);
		}
		else
		{
			System.out.println("�׸��� �������� �ʾ� ������ �� �����ϴ�.");
		}
		System.out.println();
	}
 
	// �ڷᱸ�� �� ��� ����(���� �޼ҵ�)
	public static void chaElement() throws IOException
	{
		//System.out.println("5. ��� ����");	//��ȯ
 
		System.out.println();
		System.out.print("������ ��� �Է�: ");
		String a = br.readLine();
 
		if(vt.contains(a))
		{
			System.out.print("������ ���� �Է�: ");
			String change = br.readLine();
			int i = vt.indexOf(a);
			vt.set(i, change);
			
			System.out.println();
			System.out.println("[���� ��� ���]");
			System.out.println("������ �Ϸ�Ǿ����ϴ�.");
		}
		else
		{
			System.out.println();
			System.out.println("[���� ��� ���]");
			System.out.println("������ ����� �������� �ʽ��ϴ�.");
		}
	}
 
	// ���α׷� ���� �޼ҵ�	�� �ϼ�
	public static void exit()
	{
		System.out.println("\n ���α׷� ����~!!!");
		System.exit(-1);
	}
 
	// main() �޼ҵ�	�� �ϼ�
	public static void main(String[] args) throws IOException, NumberFormatException
	{		
		do
		{
			menuDisp();
			menuSelect();
			menuRun();
		}
		while (true);
	
	}
}
*/

// Test163 Ŭ������ �ϼ��Ͽ� ���� ����� ���� ���α׷��� �����Ѵ�.
 


// �Բ� Ǭ Ǯ�� --------------------------------------------------
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Vector;
import java.util.Enumeration;
 
class Menus		// �� �ϼ�
{
	public static final int E_ADD = 1;		//-- ��� �߰�
	public static final int E_DISP = 2;		//-- ��� ���
	public static final int E_FIND = 3;		//-- ��� �˻�
	public static final int E_DEL = 4;		//-- ��� ����
	public static final int E_CHA = 5;		//-- ��� ����
	public static final int E_EXIT = 6;		//-- ����
}
 
public class Test163
{
	// �ֿ� �Ӽ� ���� �� �Ϸ�
	private static final Vector<Object> vt;	//-- �ڷᱸ��
	private static BufferedReader br;	//-- �Է� �� Ȱ��
	private static Integer sel;			//-- ���� ��
	private static String con;			//-- ��� ���� ����
 
	// static �ʱ�ȭ ��	�� �ϼ�
	static
	{
		//Vector �ڷᱸ�� ����
		vt = new Vector<Object>();
 
		//BufferedReader ��ü ����
		br = new BufferedReader(new InputStreamReader(System.in));
 
		// ����� �Է°� �ʱ�ȭ
		sel = 1;
		con = "Y";
 
	}
 
	// �޴� ��� �޼ҵ�
	public static void menuDisp()
	{
		// ����ڿ��� �ȳ��ϱ� ���� �޼������� ����ϴ� ���
		// �޴��� �����ϴ� ����� �޼ҵ带 ������ �����߱� ������
		// �� ���������� ������� ���ð��� �޾ƿ��� �ʾƵ� ������.
		System.out.println("\n\n\t[ �޴����� ]==================");
		System.out.println("\t1. ����߰�");
		System.out.println("\t2. ��� ���");		
		System.out.println("\t3. ��� �˻�");		
		System.out.println("\t4. ��� ����");
		System.out.println("\t5. ��� ����");
		System.out.println("\t6. ����");
		System.out.println("\t====================================");

		System.out.print("\t>> �޴�����(1~6): ");
	}
 
	// �޴� ���� �޼ҵ�
	public static void menuSelect() throws IOException, NumberFormatException
	{
		// ������ �޴��� ���� ��� �б��
		// menuRun() ���� ó���� �����̱� ������
		// �Է°��� �޾ƿ��� ��ɸ� ����.
		sel = Integer.parseInt(br.readLine());
	}
 
	// ���õ� �޴� ���࿡ ���� ��� ȣ�� �޼ҵ�
	public static void menuRun() throws IOException
	{
		// Menu Ŭ������ Ȱ���Ͽ� ó��
		switch(sel)
		{
			case Menus.E_ADD	: addElement();break;	//-- ��� �߰�
			case Menus.E_DISP	: dispElement();break;	//-- ��� ���
			case Menus.E_FIND	: findElement();break;	//-- ��� �˻�
			case Menus.E_DEL	: dleElement();break;	//-- ��� ����
			case Menus.E_CHA	: chaElement();break;	//-- ��� ����
			case Menus.E_EXIT	: exit();break;
			default: System.out.println("\t�޴� ���� ����~!!!");
		}
	}
 
	// �ڷᱸ���� ��� �߰�(�Է�) �޼ҵ�
	public static void addElement() throws IOException
	{
		do
		{
			System.out.printf("\n\t%d��° ��� �Է�: ", vt.size()+1);
			String element = br.readLine();
			boolean b = vt.add(element);	// .add()�� ��ȯ���� true, false
			
			if(b)
			{
				System.out.printf("\t%d��° ��� �Է� ����~!!!\n", vt.size());
			}

			System.out.print("\t��� �Է� ���(Y/N)?: ");
			con = br.readLine().toUpperCase();
			//** ��ҹ��� �������� �ʴ� ��
			//** toUpperCase(): �빮�ڷ� ����
			
		}
		while (con.equals("Y"));		
	}
 
	// �ڷᱸ���� ��� ��� �޼ҵ�
	public static void dispElement()
	{
		System.out.println("\n\t[���� ��ü ���]");
		for (Enumeration e = vt.elements(); e.hasMoreElements();)	//**Enumeration/ hasMoreElements():������
		{
			System.out.printf("\t%10s\n",e.nextElement());			//**Enumeration/ nextElement() �� ��������
		}
		System.out.println("\t���� ��ü ��� �Ϸ�~!!!");
	}
 
	// �ڷᱸ�� �� ��� �˻� �޼ҵ�
	public static void findElement() throws IOException
	{
		System.out.print("\n\t�˻��� ��� �Է�: ");
		String element = br.readLine();

		System.out.println("\n\t[�˻� ��� ���]");
		if (vt.contains(element))
		{
			System.out.println("\t�׸��� �����մϴ�.");

			// �߰� Ȯ��
			int i = vt.indexOf(element);
			System.out.println("\t("+ element + "��ġ: "+i+")");
		}
		else
		{
			System.out.println("\t�׸��� �������� �ʽ��ϴ�.");
		}
	}
 
	// �ڷᱸ�� �� ��� ���� �޼ҵ�
	public static void dleElement() throws IOException
	{
		System.out.print("\n\t������ ��� �Է�: ");
		String element = br.readLine();

		System.out.println("\n\t[���� ��� ���]");
		if(vt.contains(element))
		{
			int i = vt.indexOf(element);
			vt.remove(i);

			System.out.println("\t"+element+" �׸��� �����Ǿ����ϴ�.");
		}
		else
		{
			System.out.println("\t�׸��� �������� �ʾ� ������ �� �����ϴ�.");
		}
	}
 
	// �ڷᱸ�� �� ��� ����(���� �޼ҵ�)
	public static void chaElement() throws IOException
	{
		System.out.println("\n\t[������ ���� �Է�]");
		String oldElement = br.readLine();

		
		//System.out.println("\n\t[���� ��� ���]");

		if(vt.contains(oldElement))
		{
			int i = vt.indexOf(oldElement);

			System.out.print("\t������ ���� �Է�: ");
			String newElement = br.readLine();

			vt.set(i, newElement);

			System.out.println("\n\t[���� ��� ���]");
			System.out.println("\t������ �Ϸ�Ǿ����ϴ�.");
		}
		else
		{
			System.out.println("\n\t[���� ��� ���]");
		}
	}
 
	// ���α׷� ���� �޼ҵ�	�� �ϼ�
	public static void exit()
	{
		System.out.println("\n ���α׷� ����~!!!");
		System.exit(-1);
	}
 
	// main() �޼ҵ�	�� �ϼ�
	public static void main(String[] args) throws IOException, NumberFormatException
	{
		do
		{
			menuDisp();
			menuSelect();
			menuRun();
 
		}
		while (true);
	
	}
}
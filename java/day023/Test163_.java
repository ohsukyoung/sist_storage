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
 
public class Test163_
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
		System.out.println("\n\t [ �޴� ���� ] =================");
		System.out.println("\t 1. ��� �߰�");
		System.out.println("\t 2. ��� ���");
		System.out.println("\t 3. ��� �˻�");
		System.out.println("\t 4. ��� ����");
		System.out.println("\t 5. ��� ����");
		System.out.println("\t 6. ����");
		System.out.println("\t ===============================");
	}
 
	// �޴� ���� �޼ҵ�
	public static void menuSelect() throws IOException//, NumberFormatException
															//** NumberFormatException ��Ÿ�ӿ��� �����Է½� ����ó��
	{
		//System.out.printf(">> �޴�����(1~6): ");
		//	sel = Integer.parseInt(br.readLine());
		
		try
		{
			System.out.printf(">> �޴�����(1~6): ");
			sel = Integer.parseInt(br.readLine());
			con = "Y";
		}
		catch(IOException e)
		{
			con = "N";
			System.out.println(e.toString());
		}
		catch(NumberFormatException e)
		{
			con = "N";
			System.out.println(e.toString());
			System.out.println(">> ���� ������ �����͸� �Է��ؾ� �մϴ�.");
		}
		
 
	}
 
	// ���õ� �޴� ���࿡ ���� ��� ȣ�� �޼ҵ�
	public static void menuRun() throws IOException
	{
		//System.out.println("0. �޴� ���� ��� ȣ��");
		//while(con.equals("Y"))
		//{
			switch(sel)
			{
				case Menus.E_ADD	: addElement();break;	//-- ��� �߰�
				case Menus.E_DISP	: dispElement();break;	//-- ��� ���
				case Menus.E_FIND	: findElement();break;	//-- ��� �˻�
				case Menus.E_DEL	: dleElement();break;	//-- ��� ����
				case Menus.E_CHA	: chaElement();break;	//-- ��� ����
				case Menus.E_EXIT	: exit();break;
			}
		//}		
	}
 
	// �ڷᱸ���� ��� �߰�(�Է�) �޼ҵ�
	public static void addElement() throws IOException
	{
		//System.out.println("1. ��� �߰�");	// ����
 
		int sum=1;	//-- ���° ������� ��Ÿ�� ��
		while(true)
		{	
			String con_01 = "";
 
			//-- �Է�: �Է¿��
			System.out.printf("\n%d��° ��� �Է�: ",vt.size()+1);		//-- vt.size()+1
			vt.add(br.readLine());							//--.add(): �־��� ��ġ�� ��ü ����
 
			//-- ���: ����Է� ���� ���� ��
			System.out.printf("%d��° ��� �Է� ����~!!!",vt.size());	//-- vt.size()
			sum++;
 
			//-- ���: ���࿩��
			System.out.printf("\n��� �Է� ���(Y/N)?:");
			con_01 = br.readLine();
			
			//-- ����: Y�� �ƴϰ� y�� �ƴҶ� �Է�����
			if(!con_01.equals("Y") && !con_01.equals("y"))	//-- .equals(): ���ڿ���
			{
				break;
			}
		} //end while
		
	}
 
	// �ڷᱸ���� ��� ��� �޼ҵ�
	public static void dispElement()
	{
		//System.out.println("2. ��� ���"); //����
 
		// ���: ������
		System.out.print("\n[���� ��ü ���]\n");
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
		
		String sc="";		//-- �Է¹��� ���ڿ� ���庯��
 
		//-- �Է�: �˻����
		System.out.printf("\n�˻��� ��� �Է�: ");
		sc = br.readLine();
		
		//-- ���: �˻����
		System.out.println("\n[�˻� ��� ���]");
 
		//-- ����: �׸��� �����Ҷ� true, �������� ������ false
		if(vt.contains(sc))								//-- .contains(): �־��� ��ü ���Կ��� boolean���� ��ȯ
			System.out.println("�׸��� �����մϴ�.");
		else
			System.out.println("�׸��� �������� �ʽ��ϴ�.");
	}
 
	// �ڷᱸ�� �� ��� ���� �޼ҵ�
	public static void dleElement() throws IOException
	{
		//System.out.println("4. ��� ����");	//�ϼ�
		String rm = "";		//-- ������ ���ڿ� ���庯��
		
		//-- �Է�: �������
		System.out.printf("\n������ ��� �Է�: ");
		rm = br.readLine();
		
		//-- ����: ��Ұ� �������� ���� �� ����, ������ �� �ش��ε��� ����
		if(vt.indexOf(rm) < 0)							//-- .indexOf(): �־��� ��ü�� ����� ��ġ ��ȯ, �������� ���� ��� ���� ��ȯ
		{			
			System.out.print("�׸��� �������� �ʾ� ������ �� �����ϴ�.");
		}
		else
		{
			vt.remove(vt.indexOf(rm));					//-- .remove(): �־��� ��ġ�� ��ü ����
			System.out.printf("%s �׸��� �����Ǿ����ϴ�.", rm);
		}
	}
 
	// �ڷᱸ�� �� ��� ����(���� �޼ҵ�)
	public static void chaElement() throws IOException
	{
		//System.out.println("5. ��� ����");	//��ȯ
		
		String ori = "";		//-- ������ ���ڿ� ���庯��
		String cha = "";		//-- ������ ���ڿ� ���庯��
		
		//-- �Է�: ������
		System.out.printf("������ ��� �Է�: ");
		ori = br.readLine();
 
		//-- ����: ��Ұ� �������� ���� �� ����, ������ �� �ش� �ε��� ����
		if(vt.indexOf(ori) < 0)
		{	
			System.out.println("\n[���� ��� ���]");
			System.out.println("������ ����� �������� �ʽ��ϴ�.");
		}
		else{
			//-- �Է�: �������
			System.out.printf("������ ��� �Է�: ");
			cha = br.readLine();
 
			vt.set(vt.indexOf(ori), cha);					//-- .set(): index ��ġ�� �־��� ��ü ����(�����)
			
			System.out.println("\n[���� ��� ���]");
			System.out.println("������ �Ϸ�Ǿ����ϴ�.");
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
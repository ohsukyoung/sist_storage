/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - �ݺ���(while��) �ǽ� �� ����
=====================================*/

// ����ڷκ��� ������ ������ �Է¹޾�
// �Է¹��� ������ �Ҽ�����.. �ƴ���.. �� �Ǻ��Ͽ�
// ����� ����ϴ� ���α׷��� �����Ѵ�.

// �� �Ҽ� : 1 �Ǵ� �ڱ� �ڽ��� �� �̿ܿ� � ���ε�
//			 ������ �������� �ʴ� ��.
//			 ��, 1�� �Ҽ� �ƴ�.

// ���� ��)
// ������ ���� �Է�: 10
// 10 �� �Ҽ� �ƴ�

// ������ ���� �Է�: 11
// 11 �� �Ҽ�
// ����Ϸ��� �ƹ� Ű�� �Է��ϼ���...
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

 public class Test050
 {
	public static void main(String[] args) throws IOException{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// ���� Ǭ ���� --------------------------
		/*
		int n;			// ��������
		int i=2;		// ���� ��
		int check = 0;	// �Ҽ� �ƴ�

		System.out.print("������ ���� �Է�: ");
		n = Integer.parseInt(br.readLine());

		while(i<n)
		{
			if(n%i==0)			// ������ ������
			{
				check = 0;
				System.out.println("1: "+check);
				break;
			}
			i++;
		}

		if(check == 1 || n != 1){
			System.out.println( n + " �� �Ҽ�");						
		}else{
			System.out.println( n + " �� �Ҽ� �ƴ�");
		}
		*/

		// �ٸ� Ǯ�̹� --------------------------
		// ��
		/*
		int n = 0;
		System.out.print("������ ���� �Է�: ");
		n = Integer.parseInt(br.readLine());

		if(n==2)
		{
			System.out.println( n + " �� �Ҽ�");
			return;
		}

		int i = 1;
		while(i<n)
		{
			i++;
			if(n%i==0 || n==1)
			{
				System.out.println( n + " �� �Ҽ� �ƴ�");
				break;
			}
			else if(i==n-1)
			{
				System.out.println( n + " �� �Ҽ�");
				break;
			}
		}
		*/

		//�� : �߰� Ȯ�� �ʿ� (���� ���� �� ����)
		int a;
		int b = 2;
		System.out.print("������ ���� �Է�: ");
		a = Integer.parseInt(br.readLine());

		while(a%b!=0)
		{
			b++;
		}
		if(a == b || a==1)
		{
			System.out.println( a + " �� �Ҽ�");
		}
		else
		{
			System.out.println( a + " �� �Ҽ� �ƴ�");
		}
		

		
		// �Բ� Ǭ ���� --------------------------
		/*
		// �ֿ� ���� ����
		int num;		//-- ������� �Է°��� ��Ƴ� ����
		int n = 2;			//-- �Է°��� ������� ������ ������ ������ ����
						//   2���� �����ؼ� 1�� ����
						//   ex) �Է°� 27 �� 2 3 4 5 6 7 8 ... 25 26

		// ���� �� ó��
		System.out.print("������ ���� �Է�: ");
		num = Integer.parseInt(br.readLine());

		// � ���� �Է¹��� �������� �� �� ������
		// �� �Է°��� �Ҽ��� �����Ѵ�.
		String result = "�Ҽ���";
		boolean flag = true;		//-- num(����� �Է°�)�� �Ҽ��� ���̴�.

		while(n<num)
		{
			// �׽�Ʈ
			//System.out.println("�ݺ��� ���� �� n:" + n);
			
			// Ȯ�� ����
			//-- n ���� num�� ������ ���������� Ȯ�� �� �������� 0 ���� Ȯ��
			if(num%n==0)	//��, ������ �������� ��Ȳ
			{
				// �Ҽ�X
				flag = false;
				break;		// �����.( + �׸��� ����������)
							// �� break�� ���δ� ���� ����� �ݺ���
			}
			n++;
		}
		
		// �׽�Ʈ
		//System.out.println("flag:" + flag);

		
		// ��� ���
		// (���� ����� ����ϱ� ���� �߰� Ȯ�� �� 1���� �ƴ����� ���� �߰� ����)
		if(flag && num != 1)
		{
			// �Ҽ�
			System.out.printf("%d �� �Ҽ�\n",num);

		}else
		{
			// �Ҽ� �ƴ�
			System.out.printf("%d �� �Ҽ� �ƴ�\n",num);
			
		}
		*/
		
		
	}
 }

// ���� ���
/*
������ ���� �Է�: 990
990 �� �Ҽ� �ƴ�
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
������ ���� �Է�: 991
991 �� �Ҽ�
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
������ ���� �Է�: 1
1 �� �Ҽ� �ƴ�
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
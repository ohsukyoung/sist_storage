/* =====================================
���� �ڹ� �⺻ ���α׷��� ����
 - ������ �ڷ���
 - �ڹ��� �⺻ �����: System.util.Scanner()
=====================================*/

//�� java.util.scanner
//   �ܶ� ���� ������ ����Ͽ� �Է¤��� ��ū�� ���� �����ϸ�
//	 ����Ʈ(default)�� ���Ǵ� �ܶ����ڴ� �����̴�.
//	 �ۼ��� ���� ��ū�� ��next()�� �޼ҵ� ���
//	 �ٸ� ����(�ڷ���)�� ������ ��ȯ�� �� �ִ�.

/*
<!> ����� ���� �� ������ ������
*/
import java.util.Scanner;

public class Test017
{
	public static void main(String[] args) //throws IOException
	{
		//�ֿ� ���� ����
		//Scanner Ŭ���� ����� �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		String name;		//-- �̸�
		int kor,eng, mat;	//-- ��������, ��������, ��������

		//���� �� ó��
		System.out.print("�̸��� �Է��ϼ���: ");
		name = sc.next();

		//�׽�Ʈ(Ȯ��)
		//System.out.println("�Է��� �̸�: "+name);
		
		System.out.print("���� ���� �Է�: ");
		//kor = Integer.parseInt(br.readLine());	//"90"
		//kor = Integer.parseInt(sc.next());
		kor = sc.nextInt();

		System.out.print("���� ���� �Է�: ");
		eng = sc.nextInt();

		System.out.print("���� ���� �Է�: ");
		mat = sc.nextInt();


		//��� ���
		System.out.println();
		System.out.println(">> �̸�: "+name);
		//System.out.println(">> ����: "+kor+eng+mat);
		//--==> 908070
		System.out.println(">> ����: "+(kor+eng+mat));

	}
}

//���� ���
/*
�̸��� �Է��ϼ���: ȫ�浿
���� ���� �Է�: 90
���� ���� �Է�: 80
���� ���� �Է�: 70

>> �̸�: ȫ�浿
>> ����: 240
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
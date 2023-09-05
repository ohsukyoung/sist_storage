/* =====================================
���� ���� �帧�� ��Ʈ��(���) ����
 - if ��
 - if ~ else�� �ǽ�
=====================================*/

// 1. ���α׷��� �ۼ��� �� �־��� ���ǿ� ����
//	�б� ������ ���ϱ� ���� ����ϴ� �������
//	if��, if~else��, ���ǿ�����, ����if��(if�� ��ø), switch���� �ִ�.

//2. if���� if���� ������ ��(true)�� ���
//	 Ư�� ������ �����ϰ��� �� ��  ���Ǵ� �����̴�.

// ����ڷκ��� �̸�, ��������, ��������, ���������� �Է¹޾�
// ������ ���� ���·� ����ϴ� ���α׷��� �ۼ��Ѵ�.
// ����� ��� ������ �������� ó���Ѵ�.

// 90�� �̻�			: A
// 80�� �̻� 90�� �̸�	: B
// 70�� �̻� 80�� �̸�	: C
// 60�� �̻� 70�� �̸�	: D
// 60�� �̸�			: F

// ��, bufferedReader�� Ȱ���� �����͸� �Է¹��� �� �ֵ��� �ϸ�,
// printf()�޼ҵ带 ���� ����� �� �ֵ��� �Ѵ�.

// ���� ��)
// �̸� �Է�: ȫ�浿
// ���� ����: 90
// ���� ����: 80
// ���� ���� : 70

// >> ����� �̸��� ȫ�浿�Դϴ�.
// >> ���������� 90,
// >> ���������� 80,
// >> ���������� 70,
// >> ������ 240�̰�, ����� 80.00�Դϴ�.
// >> ����� B �Դϴ�.
//����Ϸ��� �ƹ� Ű�� ��������.
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test031
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// ���� Ǭ ���� --------------------------
		/*
		String iName
		char grade;
		int iKor,iEng,iMat,sumTotal;
		double divTotal;

		System.out.printf("�̸� �Է�: ");
		iName = br.readLine();
		System.out.printf("���� ����: ");
		iKor = Integer.parseInt(br.readLine());
		System.out.printf("���� ����: ");
		iEng = Integer.parseInt(br.readLine());
		System.out.printf("���� ����: ");
		iMat = Integer.parseInt(br.readLine());

		sumTotal = iKor + iEng + iMat;
		divTotal = sumTotal/3.0;

		if(divTotal>89){grade = "A";}
		else if(divTotal>79){grade = "B";}
		else if(divTotal>69){grade = "C";}
		else if(divTotal>59){grade = "D";}
		else{grade = "F";}

		System.out.printf("\n>> ����� �̸��� %s�Դϴ�.\n",iName);
		System.out.printf(">> ���������� %d,\n",iKor);
		System.out.printf(">> ���������� %d,\n",iEng);
		System.out.printf(">> ���������� %d,\n",iMat);
		System.out.printf(">> ������ %d�̰�, ����� %.2f�Դϴ�.\n",sumTotal,divTotal);
		System.out.printf(">> ����� %c�Դϴ�.\n",grade);
		*/
		
		// �Բ� Ǭ ���� --------------------------
		// 1. ����ڷκ��� �̸��� �Է¹޴´�.
		System.out.print("�̸� �Է�: ");
		String strName = br.readLine();

		// 2. ����ڷκ��� ����, ����, ���� ������ �Է¹޴´�.
		System.out.print("���� ����: ");
		String strKor = br.readLine();
		System.out.print("���� ����: ");
		String strEng = br.readLine();
		System.out.print("���� ����: ");
		String strMat = br.readLine();

		// 3. ���ڿ� ���·� �Է¹��� ���� ������ ���� ���·� ��ȯ�Ѵ�.
		int nKor = Integer.parseInt(strKor);
		int nEng = Integer.parseInt(strEng);
		int nMat = Integer.parseInt(strMat);

		// 4. ��� ������ ���� ������ ����� �����Ѵ�.
		int nTot = nKor + nEng + nMat;			//-- ����
		double fAvg = (double)nTot/3;			//-- ��� check~!!

		// 5. ��޿� ���� ���� �˻縦 �����Ѵ�.
		char grade = 'F';						//-- ���

		if(fAvg >= 90)
		{
			grade = 'A';	
		}
		//else if (fAvg >=80 && fAvg < 90)
		else if(fAvg >= 80)						//-- ��� 90�� �̸� ���� ����
		{
			grade = 'B';	
		}
		else if(fAvg >= 70)						//-- ��� 80�� �̸� ���� ����
		{
			grade = 'C';	
		}
		else if(fAvg < 60)						//-- ��� 90�� �̸� ���� ����
		{
			grade = 'F';	
		}

		// 6. ������� ���
		System.out.printf("\n>> ����� �̸��� %s�Դϴ�.\n",strName);
		System.out.printf(">> ���������� %s,\n",strKor);
		System.out.printf(">> ���������� %s,\n",strEng); 
		// strEng: �������� ����, nEng: �������� ����
		System.out.printf(">> ���������� %s,\n",strMat);
		System.out.printf(">> ������ %d�̰�, ����� %.2f�Դϴ�.\n",nTot,fAvg);
		System.out.printf(">> ����� %c�Դϴ�.\n",grade);

		/* java�� ���ܱ��� ��� üũ�ϱ� ������
		1) ����� ���� �ʱⰪO, if~else if(������ else ����)���� ����
		(���� ����� ����)
		2) ����� ���� �ʱⰪX, if~else���� ������ else �� ���� �־������
		*/

	}
}

//������
/*
�̸� �Է�: ȫ�浿
���� ����: 90
���� ����: 80
���� ����: 70

>> ����� �̸��� ȫ�浿�Դϴ�.
>> ���������� 90,
>> ���������� 80,
>> ���������� 70,
>> ������ 240�̰�, ����� 80.00�Դϴ�.
>> ����� B�Դϴ�.
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
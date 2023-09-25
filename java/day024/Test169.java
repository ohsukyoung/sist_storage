/* =====================================
���� �÷���(Collection) ����
=====================================*/

// Set -> HashSet, TreeSet,...
//	������ ����
//	���ߺ� ������� �ʴ� ����(�⺻)

/*
�� TreeSet<E> Ŭ����

	java.util.TreeSet<E> Ŭ������
	Set �������̽��� ����� SortedSet �������̽��� ������ Ŭ������
	�����͸� �߰��ϸ� �����͵��� �ڵ����� �������� ������ �ȴ�.

	//** SortedSet: ������ �����ϰ� ���� -> ���󵵰� ����
	(���Ŀ� ���ϰ� ���� ����, ������ �������� ������)
*/

// VO	- Value Object
// DTO	- Data Transfer Object
// DAO	- Data Acess Object

//** ����ؼ� ���� �� ����
//** �ް��� �Ѹ��ڸ����� �ű�µ�, �Ѱ��� �ű�� �ͺ��� �ް��ǿ� ��ܼ� �ű�°� �� ���� �� ��
//** �Ӽ��� �����ϴ� Ŭ����
//** �ڹ� bin �Ծ� ���� Ȯ����
//** �����͸� �������� �׾Ƶξ��ٰ� �ѹ��� ����

//** �ǹ������� DTO,DAO ������ �����ϴ°� ���� ����
//** VO, DAO ������ �� ����
//** VO, DTO�� ������ ���� ���� ����

//** VO, DAO�� ���� ���������� ����Ǿ�������, ����Ǿ����� �ʴ���
import java.util.TreeSet;
import java.util.Iterator;
import java.util.Comparator;

class GradeVO
{
	// �ֿ� �Ӽ� ����
	private String hak;			//-- �й�
	private String name;		//-- �̸�
	private int kor, eng, mat;	//-- ����, ����, ����, ����

	// ����� ����  ������
	GradeVO(String hak, String name, int kor, int eng, int mat)
	{
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	// �̿� ���� ��� default ������ �ڵ� ���̺����� ����~!!!

	// ����� ���� ������ -> �Ű����� ���� ������(default ������ ����)
	GradeVO()
	{
		// ������ ���ο��� �Ǵٸ� ������ ȣ��
		//GradeVO("","",0,0,);
		//
		this("","",0,0,0);

	}
	// getter/setter ����

	public String getHak()
	{
		return hak;
	}
	public void setHak(String hak)
	{
		this.hak = hak;
	}

//-----------
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}

//------------
	public int getKor()
	{
		return kor;
	}

	public void setKor(int kor)
	{
		this.kor = kor;
	}
//------------
	public int getEng()
	{
		return eng;
	}

	public void setEng(int eng)
	{
		this.eng = eng;
	}
//------------
	public int getMat()
	{
		return mat;
	}

	public void setMat(int mat)
	{
		this.mat = mat;
	}

	// �߰� �޼ҵ� ����(���� ����)
	public int getTot()
	{
		//return kor + eng + mat;
		return this.kor + this.eng + this.mat;
	}
}

//** ���׸��� Ŭ������ ����ɶ� � ���·� ����Ǵ°�
//** Comparator�� ���� ���ڿ� ����
//** �ȿ��� ������ �Ͽ� �񱳽���
class MyComparator<T> implements Comparator<T> //** <T>: � Ÿ���� �Ѱ��ָ�, <E>: � ������Ʈ�� �Ѱ��ָ�
{
	// �� �޼ҵ� ������
	@Override
	public int compare(T o1, T o2)
		//** ������ ����� ��ü�� ����Ҷ�, ���׸� ǥ������ �����ϴ� ���� �����ͼ�
		//		�̸� ������ �� �ƴ϶� ���� �����ؼ� ������ ����� �� �ְ� ��
	{
		GradeVO s1 = (GradeVO)o1;
		GradeVO s2 = (GradeVO)o2;

		// �й� ����(��������)
		//return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
		
		//return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
        //return Integer.parseInt("2308113") - Integer.parseInt("2308116");
		//return 2308113 - 2308116;
		//return -3;
		// -> o2�� �� ū������ �� ��� ����~!!!

		//... return 5;
		// -> o1�� �� ū������ �� ��� ����~!!!

		//... return 0;
		// -> o1�� 02 �� ���������� �� ��� ����~!!!

		// �й� ����(��������)
		//return Integer.parseInt(s2.getHak()) - Integer.parseInt(s1.getHak());
		//return s2.getHak().compareTo(s1.getHak());

		// ���� ���(��������)
		//return s1.getTot() - s2.getTot();
		return Integer.valueOf(s2.getTot()).compareTo(Integer.valueOf(s1.getTot()));

		// ���� ����(��������)
		//return s2.getTot() - s1.getTot();

		// �̸� ����(��������)
		//return s1.getName().compareTo(s2.getName());

		// �̸� ����(��������)
		//return s2.getName().compareTo(s1.getName());		
	}
}

public class Test169
{
	public static void main(String[] args)
	{
		GradeVO vo = new GradeVO();

		//vo.setHak("1");
		//System.out.println(vo.getHak());

		//TreeSet �ڷᱸ�� ����
		TreeSet<String> set = new TreeSet<String>();

		//TreeSet �ڷᱸ�� set�� ��� �߰� -> add();
		set.add("¯���¸�����");
		set.add("������ũ");
		set.add("���ǽ�");
		set.add("�޺�õ��");
		set.add("�̴��߻�");
		set.add("�����̸���");
		set.add("����������");	//�߰��ð���
		set.add("��Ʋ¯");
		set.add("������");
		
		// Iterator�� Ȱ���� Set ��� ��ü ���
		Iterator<String> it = set.iterator();
		while(it.hasNext())
		{
			System.out.print(it.next() + " ");
		}
		System.out.println();
		//--==>> �����̸��� �޺�õ�� ������ ��Ʋ¯ ���������� ������ũ ���ǽ� �̴��߻� ¯���¸�����
		//-- ��Ҹ� ���ڿ��� ������ ���
		//	 �����ټ� -> �������� ����

		// TreeSet �ڷᱸ�� ����
		//TreeSet<GradeVO> set2 = new TreeSet<GradeVO>();

		TreeSet<GradeVO> set2 = new TreeSet<GradeVO>(new MyComparator<GradeVO>());

		//**** �������� �߿�!
		// TreeSet �ڷᱸ�� set2�� ��� �߰�
		set2.add(new GradeVO("2308113","��Ѹ�",90,80,70));
		set2.add(new GradeVO("2308116","�ڶ�ġ",71,81,71));
		set2.add(new GradeVO("2308120","������",88,78,68));
		set2.add(new GradeVO("2308103","�����",70,85,91));
		set2.add(new GradeVO("2308132","ȫ�浿",99,82,79));

		// Iterator�� Ȱ���� set2 ��� ��ü ���
		/*
		Iterator<GradeVO> it2 = set2.iterator();
		while(it2.hasNext())
			System.out.printf(it2.next() + " ");
		System.out.println();
		*/

		//--==>> ���� �߻�(��Ÿ�� ����)
		//		java.lang.ClassCastException: 
		//		GradeVO cannot be cast to java.lang.Comparable
		//
		//			��
		//
		//** TreeSet �ڷᱸ���� �ݳ��ϴ� �������� ũ��񱳸� �ϰ� �Ǿ�
		//	 ���ڿ����� ���ϰ� ����� ����

		// �� MyComparator Ŭ������ �����Ͽ�
		//		compare �޼ҵ带 �����Ǹ� �� �� �ٽ� ����
	
		/*
		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{
			System.out.print(it2.next() + " ");
		}
		System.out.println();
		*/
		//
		//			��
		//
		// �� ��ü �ڰԸ� ���� ����ϴ� ���� �ƴ϶�
		//		��ü�� �����ִ� �Ӽ��� �����Ͽ� ����� �� �ֵ��� ó��

		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{
			//System.out.print(it2.next());					//--(O) �ϳ��� ������ ��������
			//System.out.printf("%s",it2.next().getHak());
			//System.out.print(it2.next().getHak() + " " + it2.next().getName());
															//--(X) .next(): ���� ��ü�� ������


			GradeVO next = it2.next();
			//			   --- ���ͷ����� Ÿ��
			//			   ---------- �׷��̵�VO Ÿ��

			System.out.printf("%7s %7s %4d %4d %4d %5d\n",next.getHak(), next.getName(), next.getKor(), next.getEng(), next.getMat(), next.getTot());
		}
		System.out.println();

	}
}
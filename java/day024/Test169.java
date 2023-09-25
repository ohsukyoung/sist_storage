/* =====================================
■■■ 컬렉션(Collection) ■■■
=====================================*/

// Set -> HashSet, TreeSet,...
//	·순서 없음
//	·중복 허용하지 않는 구조(기본)

/*
○ TreeSet<E> 클래스

	java.util.TreeSet<E> 클래스는
	Set 인터페이스를 상속한 SortedSet 인터페이스를 구현한 클래스로
	데이터를 추가하면 데이터들이 자동으로 오름차순 정렬이 된다.

	//** SortedSet: 정렬을 포함하고 있음 -> 사용빈도가 낮다
	(정렬에 부하가 많이 들어가고, 성능이 낮아지기 때문에)
*/

// VO	- Value Object
// DTO	- Data Transfer Object
// DAO	- Data Acess Object

//** 계속해서 쓰게 될 개념
//** 달걀을 둘리자리까지 옮기는데, 한개씩 옮기는 것보다 달걀판에 담겨서 옮기는게 더 힘이 덜 듦
//** 속성만 존재하는 클래스
//** 자바 bin 규약 으로 확장함
//** 데이터를 차곡차곡 쌓아두었다가 한번에 전달

//** 실무에서는 DTO,DAO 계층을 구분하는게 가장 많음
//** VO, DAO 계층이 그 다음
//** VO, DTO를 나누는 경우는 거의 없음

//** VO, DAO로 나뉨 업무로직이 적용되어있으냐, 적용되어있지 않느냐
import java.util.TreeSet;
import java.util.Iterator;
import java.util.Comparator;

class GradeVO
{
	// 주요 속성 구성
	private String hak;			//-- 학번
	private String name;		//-- 이름
	private int kor, eng, mat;	//-- 국어, 영어, 수학, 점수

	// 사용자 정의  생성자
	GradeVO(String hak, String name, int kor, int eng, int mat)
	{
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	// 이와 같은 경우 default 생성자 자동 삽이보디지 않음~!!!

	// 사용자 정의 생성자 -> 매개변수 없는 생성자(default 생성자 형태)
	GradeVO()
	{
		// 생성자 내부에서 또다른 생성자 호출
		//GradeVO("","",0,0,);
		//
		this("","",0,0,0);

	}
	// getter/setter 구성

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

	// 추가 메소드 정의(총점 산출)
	public int getTot()
	{
		//return kor + eng + mat;
		return this.kor + this.eng + this.mat;
	}
}

//** 제네릭이 클래스로 설계될때 어떤 형태로 설계되는가
//** Comparator를 통해 문자열 비교함
//** 안에서 재정의 하여 비교실행
class MyComparator<T> implements Comparator<T> //** <T>: 어떤 타입을 넘겨주면, <E>: 어떤 엘리멘트를 넘겨주면
{
	// 비교 메소드 재정의
	@Override
	public int compare(T o1, T o2)
		//** 누군가 컴페어 객체를 사용할때, 제네릭 표현식을 구성하는 것을 가져와서
		//		미리 정해진 게 아니라 사용시 셋팅해서 가져와 사용할 수 있게 함
	{
		GradeVO s1 = (GradeVO)o1;
		GradeVO s2 = (GradeVO)o2;

		// 학번 기준(오름차순)
		//return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
		
		//return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
        //return Integer.parseInt("2308113") - Integer.parseInt("2308116");
		//return 2308113 - 2308116;
		//return -3;
		// -> o2가 더 큰것으로 비교 결과 전달~!!!

		//... return 5;
		// -> o1이 더 큰것으로 비교 결과 전달~!!!

		//... return 0;
		// -> o1과 02 가 같은것으로 비교 결과 전달~!!!

		// 학번 기준(내림차순)
		//return Integer.parseInt(s2.getHak()) - Integer.parseInt(s1.getHak());
		//return s2.getHak().compareTo(s1.getHak());

		// 총점 기분(오름차순)
		//return s1.getTot() - s2.getTot();
		return Integer.valueOf(s2.getTot()).compareTo(Integer.valueOf(s1.getTot()));

		// 총점 기준(내림차순)
		//return s2.getTot() - s1.getTot();

		// 이름 기준(오름차순)
		//return s1.getName().compareTo(s2.getName());

		// 이름 기준(내림차순)
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

		//TreeSet 자료구조 생성
		TreeSet<String> set = new TreeSet<String>();

		//TreeSet 자료구조 set에 요소 추가 -> add();
		set.add("짱구는못말려");
		set.add("슬램덩크");
		set.add("원피스");
		set.add("달빛천사");
		set.add("이누야샤");
		set.add("너의이름은");
		set.add("슈가슈가룬");	//추가시간은
		set.add("배틀짱");
		set.add("디지몬");
		
		// Iterator를 활용한 Set 요소 전체 출력
		Iterator<String> it = set.iterator();
		while(it.hasNext())
		{
			System.out.print(it.next() + " ");
		}
		System.out.println();
		//--==>> 너의이름은 달빛천사 디지몬 배틀짱 슈가슈가룬 슬램덩크 원피스 이누야샤 짱구는못말려
		//-- 요소를 문자열로 구성할 경우
		//	 가나다순 -> 오름차순 정렬

		// TreeSet 자료구조 생성
		//TreeSet<GradeVO> set2 = new TreeSet<GradeVO>();

		TreeSet<GradeVO> set2 = new TreeSet<GradeVO>(new MyComparator<GradeVO>());

		//**** 이제부터 중요!
		// TreeSet 자료구조 set2에 요소 추가
		set2.add(new GradeVO("2308113","김둘리",90,80,70));
		set2.add(new GradeVO("2308116","박또치",71,81,71));
		set2.add(new GradeVO("2308120","마이콜",88,78,68));
		set2.add(new GradeVO("2308103","도우너",70,85,91));
		set2.add(new GradeVO("2308132","홍길동",99,82,79));

		// Iterator를 활용한 set2 요소 전체 출력
		/*
		Iterator<GradeVO> it2 = set2.iterator();
		while(it2.hasNext())
			System.out.printf(it2.next() + " ");
		System.out.println();
		*/

		//--==>> 에러 발생(런타임 에러)
		//		java.lang.ClassCastException: 
		//		GradeVO cannot be cast to java.lang.Comparable
		//
		//			↓
		//
		//** TreeSet 자료구조는 격납하는 과정에서 크기비교를 하게 되어
		//	 문자열끼리 비교하게 만들어 놓음

		// ※ MyComparator 클래스를 생성하여
		//		compare 메소드를 제정의만 한 후 다시 구성
	
		/*
		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{
			System.out.print(it2.next() + " ");
		}
		System.out.println();
		*/
		//
		//			↓
		//
		// ※ 객체 자게를 직접 출력하는 것이 아니라
		//		객체가 갖고있는 속성에 접근하여 출력할 수 있도록 처리

		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{
			//System.out.print(it2.next());					//--(O) 하나씩 찍을때 문제없음
			//System.out.printf("%s",it2.next().getHak());
			//System.out.print(it2.next().getHak() + " " + it2.next().getName());
															//--(X) .next(): 다음 개체를 선택함


			GradeVO next = it2.next();
			//			   --- 이터레이터 타입
			//			   ---------- 그레이드VO 타입

			System.out.printf("%7s %7s %4d %4d %4d %5d\n",next.getHak(), next.getName(), next.getKor(), next.getEng(), next.getMat(), next.getTot());
		}
		System.out.println();

	}
}
/* =====================================
■■■ 컬렉션(Collection) ■■■
=====================================*/

// Map → Hashtable, HashMap

/*
○ java.util.Map 인터페이스
	키(key)를 값(Value)에 매핑(mapping)하며
	동일한 키를 등록할 수 없고, 유일해야 하며,
	각 키는 한개의 값만 매핑해야 한다.
	즉, 하나의 키에 대응하는 하나의 값을 갖는 구조이다.
/** 이름표 같은 게 달려있음(키와 값)
*/

/*
○ Hashtable<K, V> 클래스
	- 해시테이블 구조를 객체 모델링화 한 클래스로
		검색이 용이하기 때문에 사용 빈도가 높은 편에 속한다.
	- 해시테이블이란 키(key)와 그에 상응하는 데이터(value)로
		구분된 데이터구조이다.
	- 데이터를 저장하고, 검색하기 우해서 키(key)로 접근하며
		이 그주에서는 키값을 부여하면 해당 데이터가 변환된다.
	- 또한, Hashtable 클래스는 key 또는 value의 값으로 null을 허용하지 않는다.
*/
import java.util.Hashtable;
public class Test170
{
	private static final String[] names =  {"김둘리","박또치","마이콜","도우너","홍길동","빵빵이"};

	private static final String[] tels = {"010-0000-0000", "010-1111-1111", "010-2222-2222", "010-3333-3333", "010-4444-4444", "010-5555-5555"};

	public static void main(String[] args)
	{
		// Hashtable 자료구조 생성
		Hashtable<String, String> ht = new Hashtable<String, String>();		//** <String,String>: 키 문자열, 값도 문자열로 쓸것

		// ht 라는 Hashtable 자료구조에
		// 배열(names, tels)에 담겨있는 데이터를 요소로 담아내기
		// → put(k,v);
		for (int i=0; i<names.length ;i++ )
		{
			// ht.put("김둘리", "010-0000-0000");
			ht.put(names[i],tels[i]);
		}

		// ht 라는 Hashtable 자료구조에서
		// key 를 이용하여 데이터 검색
		// → get(k);

		String finalName1 = "박또치";
		String str = ht.get(finalName1);
		if(str != null)
		{
			System.out.println(finalName1 + " 전화번호: " + str);
		}//else
		//{
		//	System.out.println("테스트");
		//}
		System.out.println();
		//--==>> 박또치 전화번호: 010-1111-1111

		// ht 라는 Hashtable 자료구조에
		// key가 존재하는지의 여부 확인
		// → containsKey()
		String finalName2 = "마이콜";
		if(ht.containsKey(finalName2))
		{
			System.out.println(finalName2 + " 데이터가 존재합니다.");
		}else
		{
			System.out.println(finalName2 + " 데이터가 존재하지 않습니다.");
		}
		System.out.println();

		String finalName3 = "도우너";
		if(ht.containsKey(finalName3))
		{
			System.out.println(finalName3 + " 데이터가 존재합니다.");
		}else
		{
			System.out.println(finalName3 + " 데이터가 존재하지 않습니다.");
		}
		System.out.println();

		// ht라는 Hashtable 자료구조에
		// value 가 존재하는지의 여부 확인
		// → contains()
		String findTel1 = "010-0000-0000";		// 경태 전화번호
		if(ht.contains(findTel1))
		{
			System.out.println(findTel1 + " 데이터가 존재합니다.");
		}else
		{
			System.out.println(findTel1 + " 데이터가 존재하지 않습니다.");
		}
		System.out.println();

		// ht라는 Hashtable 자료구조에서
		// 『길현욱』 데이터 삭제
		// → remove()
		ht.remove("박또치");

		// ※ <remove()> 메소드는 인자값으로 key 를 넘겨받지만
		//		이 때, key만 삭제된느 것이 아니다.
		//		해당 key와 연결되어(매핑되어) 있는 value 도 함께 제거된다.

		// 삭제(remove()) 이후 ht 라는 Hashtable 자료구조에
		// 해당 key 가 존재하는지 확인
		if(ht.containsKey("박또치"))
			System.out.println("박또치 존재합니다.");
		else
			System.out.println("박또치 어디갔어????");
		System.out.println();
		//--==>>
		
		// 삭제(remove()) 이후 ht 라는 Hashtalbe 자료구조에
		// 해당 key 가 존재하는지 확인
		if(ht.contains("010-1111-1111"))
			System.out.println("박또치 전화번호가 존재하니다.");
		else
			System.out.println("박또치 전화번호가 존재하지 않습니다.");
		System.out.println();
		//--==>> 

		// ※ null 관련 처리 
		//** null을 허용하지 않음

		//ht.put(null, null);			//-- key와 value 모두 null 인 상태
		//--==>> 에러 발생(런타임 에러)
		//		java.lang.NullPointerException

		//ht.put("김버거", null);		//-- value가 null 인 상태
		//--==>> 에러 발생(런타임 에러)
		//		java.lang.NullPointerException

		//ht.put(null, "010-7777-7777");	//-- key가 null 인 상태
		//--==>> 에러 발생(런타임 에러)
		//		java.lang.NullPointerException

		// 중복된 key 입력
		//** 중복된 값이 안들어가는 건지, 에러가 나는 건지 확인
		ht.put("빵빵이","010-7777-7777");
		System.out.println(ht.get("빵빵이"));
		System.out.println();
		//--==>> 010-7777-7777
		//-- 중복된 key를 활용하여 데이터를 입력할 경우
		//		기존 "010-5555-5555" 에서 "010-7777-7777"로 변경되었음을 확인(덮어쓰기 개념)

		// 중복된 value 입력
		ht.put("홍길동","010-3333-3333");
		System.out.println(ht.get("도우너"));
		System.out.println(ht.get("홍길동"));
		//--==>> 010-3333-3333
		//		010-3333-3333
		//-- vlue 는 중복된 값이 입력되더라도
		//	기존 데이터에는 아무런 영향도 미치지 않음

	}
}
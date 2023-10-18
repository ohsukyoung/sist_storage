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
○ HashMap<K, V> 클래스
	- HashMap 클래스는 Hashtable 클래스와 마찬가지로
		Map 인터페이스에서 상속받아 주요 기능이 같지만
		Synchronization 이 없기 때문에 동시성 문제가 없다면
		(즉, 멀티 스레드 프로그램이 아닌 경우라면)
		HashMap 을 사용하는 것이 성능을 향상시킬 수 있다.
	- 또한, HashMap 은 Hashtable과 달리 null을 허용한다.
*/

//** Hashtable은 Hash와 table 합성어가 아님.
//** HashMap은 Hash와 Map의 합성어.

import java.util.HashMap;
import java.util.Map;

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class Test171
{
	public static void main(String[] args) throws IOException
	{
		// HashMap 자료구조 생성
		//HashMap<String,String> map = new HashMap<String,String>();	//--(O)
		Map<String,String> map = new HashMap<String,String>();

		// map이라는 HashMap 자료구조에 요소 추가
		// → put();
		map.put("영화", "거미집");
		map.put("드라마", "무빙");
		map.put("만화", "슬램덩크");
		map.put("소설", "지구끝의 온실");

		// 테스트(확인) → 더미 확인
		System.out.println(map);
		//--==>> {소설=지구끝의 온실, 드라마=무빙, 영화=거미집, 만화=슬램덩크}
		//** 순서가 제각각임
		//-- 데이터 매핑 구조 확인
		//-- 데이터 요소 격납 순서가 추가 순서와 관계 없음

		// ※ null 관련 처리
		map.put(null,null);			//-- key와 vlaue가 모두 null
		
		// 테스트(확인) → 더미 확인
		System.out.println(map);
		//--==>> {소설=지구끝의 온실, null=null, 드라마=무빙, 영화=거미집, 만화=슬램덩크}

		map.put("동화",null);		//-- vlue가 null

		// 테스트(확인) → 더미 확인
		System.out.println(map);
		//--==>> {소설=지구끝의 온실, null=null, 드라마=무빙, 영화=거미집, 동화=null, 만화=슬램덩크}

		map.put(null,"모나리자");	//-- key가 null

		// 테스트(확인) → 더미 확인
		System.out.println(map);
		//--==>> {소설=지구끝의 온실, null=모나리자, 드라마=무빙, 영화=거미집, 동화=null, 만화=슬램덩크}
		//** null도 하나의 키나 값으로 인식

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("카테고리, 타이틀 입력(컴마 구분): ");
		String[] temp;

		for (String str;((str = br.readLine()) != null); )
		{
			temp = str.split(",");
			if(temp.length <2)
			{
				System.out.print("카테고리, 타이틀 입력(컴마 구분): ");
				continue;
			}

			map.put(temp[0].trim(), temp[1].trim());
			System.out.println(map);
		}
		//--==>> 카테고리, 타이틀 입력(컴마 구분): 소설,어린왕자
		//		{소설=어린왕자, null=모나리자, 드라마=무빙, 영화=거미집, 동화=null, 만화=슬램덩크}
	}
}
/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- String 클래스
=====================================*/

public class Test137
{
	public static void main(String[] args)
	{
		String s = "seoul korea";
		System.out.println("s: "+ s);
		//--==>> s: seoul korea

		// ○ 문자 추출
		System.out.println(s.substring(6,9));
		//--==>> kor

		//※ String.substring(s,e)
		// String 문자열을 대상으로
		// s 번째에서 e-1 번째 까지 추출
		// (단, 인덱스는 0부터 시작)

		System.out.println(s.substring(7));
		//--==>> orea

		//『String.substring(s)』
		// String문자열을 대상으로
		// s 번째에서... 끝까지 추출
		// (즉, 문자열이 가진 길이만큼..)

		//○ 문자열 데이터(값) 비교
		System.out.println(s.equals("seoul korea"));
		System.out.println(s.equals("seoul Korea"));
		// --==>> true
		//		false
		//-- 대소문자 엄격히 구분

		System.out.println(s.equalsIgnoreCase("SEOUL KOREA"));
		// --==>> true
		//-- 대소문자 구분 안함

		// ○ 찾고자하는 대상 문자열(s)에
		//		kor 문자열이 존재할까?
		//		존재한다면... 그 위치는 어떻게 될까?

		// "seoul korea"
		//  0123456789

		System.out.println(s.indexOf("kor"));
		//--==>> 6

		System.out.println(s.indexOf("ea"));
		//--==>> 9

		System.out.println(s.indexOf("e"));
		//--==>> 1
		//-- 먼저 찾은 무자열의 인덱스를 반환하고 종료.

		System.out.println(s.indexOf("tt"));
		//--==>> -1
		//-- 찾고자 하는 문자열이 대상 문자열에 존재할 경우
		//	그 문자열의 인덱스를 반환하지만
		//	존재하지 않을 경우 음수를 반환하게 된다. → (-1)
		//** 음수나온다(-1나온다X, 음수 -1X)

		// 대상 문자열(s)이 rea  로 끝나는지의 여부 확인
		//	(ture/false)
		System.out.println(s.endsWith("rea"));
		System.out.println(s.endsWith("oul"));
		//--==>> true
		//		false

		// ○ 찾고자하는 대상 문자열(s)에
		//		『e』 문자열이 존재할까?
		//		존재한다면... 그 위치는 어떻게 될까?
		//		(단, 뒤에서부터 검사)

		// seoul korea
		System.out.println(s.indexOf("e"));
		System.out.println(s.indexOf("o"));
		//--==>> 1
		//		2

		// seoul korea
		System.out.println(s.lastIndexOf("e"));
		System.out.println(s.lastIndexOf("o"));
		//--==>> 9
		//		7
		//** lastIndexOf(): 뒤에서부터 검사하지만,
		// 인덱스넘버는 기존대로 출력

		// ○ 대상 문자열(s) 중
		//		『6』번째 인덱스 위치와 문자는?

		// seoul korea
		System.out.println(s.charAt(6));
		//--==>> k
		//** charAt({인덱스 번호}): 인덱스를 주면 값출력

		// seoul korea
		//System.out.println(s.charAt(22));
		//--==>> 에러 발생(런타임 에러)
		//		StringIndexOutOfBoundsException

		// ○ 대상 문자열(s)과 비교 문자열 seoul corea 중
		//		어떤 문자열이 더 큰가?		→ 문자열에 대한 크기 비교?
		//		=> 두 문자열이 같다면?		→ 0
		//** 크기가 같다면: 길이가 같다면
		//		=> 두 문자열이 다르다면		→ ???
		
		// seoul korea
		System.out.println(s.compareTo("seoul korea"));
		//--==>> 0 → 두 문자열이 같다.
		System.out.println(s.compareTo("seoul corea"));
		//--==>> 8
		//-- c ~ k → defghijk → 8 (s의 값과 "seoul corea"의 길이 비교)

		// ○ 대상 문자열(s) 중
		//		해당 문자열을 찾아서 원하는 형태로 수정된 문자열 반환
		s = "우리나라 대한민국 대한독립 만세";
		s = s.replaceAll("대한","자주");
		System.out.println("처리 결과: " + s);
		//--==>> 처리 결과: 우리나라 자주민국 자주독립 만세

		// ○ rhdqorwprj
		s ="          사          랑         ";
		//System.out.println(s);
		//--==>>           사          랑
		System.out.println("|" + s + "|");
		//--==>> |          사          랑         |


		System.out.println("|" + s.trim() + "|");
		//--==>> |사          랑|
		//** trim(): 양쪽 끝 공백 제거

		System.out.println("|" + s.replaceAll(" ","") + "|");
		//--==>> |사랑|
		//** replaceAll(): 찾아 바꾸기

		// "50"
		int temp = Integer.parseInt("50");
		//System.out.println(temp);
		System.out.printf("%d\n", temp);
		//--==>> 50
		//** Integer.parseInt: 문자를 정수형태로 변환
		
		// "30"
		s = Integer.toString(30);
		//System.out.println(s);
		System.out.printf("%s\n", s);
		//--==>> 30

		int n = 2345678;
		System.out.printf("%d",n);
		System.out.format("%d",n);
		//--==>> 23456782345678

		System.out.println();

		s = String.format("%d", n);
		System.out.println(s);
		//format: 출력하는 모양대로의 문자열 출력
		//--==>> 2345678

		s = String.format("%.2f", 123.456);
		System.out.println(s);
		//--==>> 123.46

		s = String.format("확인: %b", true);
		System.out.println(s);
		//--==>> 확인: true

		s = String.format("결과: %,d", n);
		System.out.println(s);
		//--==>> 결과: 2,345,678

        //String str = "기본,열정,배려";
		//String[] strArr = str.split(",");

		// line 184 ~ 185와 동일한 구문
		String[] strArr = "기본,열정,배려".split(",");

		for( String str: strArr)
			System.out.print(str + " ");
		//--==>>  기본 열정 배려
		System.out.println();



        
	}
}
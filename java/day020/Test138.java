/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- StringBuffer 클래스
=====================================*/

/*
○ StringBuffer 클래스
	문자열을 처리하는 클래스로 String 클래스와의 차이점은
	String 클래스는 내부 문자열 데이터의 수정이 불가능하지만
	StringBuffer 클래스는 문자열을 사용할 때
	내부 문자열을 실행 단계에서 변경할 수 있다.

	즉, StringBuffer 객체는 가변적인 길이를 가지므로
	객체를 생성하는 시점에서 미리 그 크기나 값을 지정하거나
	실행 시점에 버퍼의 크기를 바꿀 수 있는 기능을 제공한다.

	또한, JDK 1.5 이후 부터는
	문자열을 처리하는  StringBuilder 라는 클래스도 제공한다.
	StringBuilder 클래스의 기능은 Stringbuffer 클래스와 동일하지만
	가장 큰 차이점은 multi-thread unsafe 라는 점이다.	//** 여러사용자가 있으면 안전하지 않음
	즉, syncronization이 없기 때문에
	StringBuffer 보다 빠르며, 동시성(동기화)문제가 없다면
	StringBuilder를 사용하는 것이 성능을 향상시킬 수 있다.
*/

//** 스레드: 작은 작업을 하는 단위, 도구, 일꾼...
//** cpu 여러기능 수행: 여러가지 업무를 단위별로 조금씩 실행한다.
//** 버퍼링: 임시공간 만들어 버퍼를 만들어
//** StringBuffer는 다중스레드에서는 조금 더 안전, 그러나 느림

public class Test138
{
	public static void main(String[] args)
	{
		String str1 = new String("seoul");
		String str2 = new String("seoul");

		System.out.println(str1 == str2);
		System.out.println(str1.equals(str2));		//** 값비교
		//--==>> false
		//		true

		StringBuffer sb1 = new StringBuffer("korea");
		StringBuffer sb2 = new StringBuffer("korea");

		System.out.println(sb1 == sb2);
		System.out.println(sb1.equals(sb2));
		//--==>> false
		//		false

		System.out.println("------------------------------------------------");

		System.out.println(sb1);
		//--==>> korea
		//** 스트링버퍼 출력시 korea나오는 것은 tostring을 오버라이드해서 출력된 것
		//** 스트링버퍼 객체 출력
		
		System.out.println(sb1.toString());
		//--==>> korea
		//** 스트링 출력

		System.out.println(sb1.toString().equals(sb2.toString()));
		//--==>> true

		StringBuffer sb3 = new StringBuffer();
		//** 매개변수 없는 스트링버퍼 생성
		//-- StringBuffer 기본 생성자 호출(인스턴스 생성 과정)
		//		기본적으로 생성되는 버퍼 크기는 『16』

		// capacity()
		System.out.println("버퍼 크기: " + sb3.capacity());
		//--==>> 버퍼 크기: 16

		//////////////////////////////////////////////////////////

		System.out.println(sb3);
		//--==>> 無

		/*
		String name = "홍길동";
		name += "홍길동";
		name += "김둘리";
		name += "최또치";

		System.out.println(name);
		//--==>> 홍길동홍길동김둘리최또치
		//** 홍길동 소실
		//** 홍길동홍길동 소실
		//** 홍길동홍길동김둘리 소실
		//** 홍길동홍길동김둘리최또치 참조
		*/

		sb3.append("seoul");	// sb += "seoul";
		sb3.append("korea");	// sb += "";
		sb3.append("우리나라");	// sb += "";
		sb3.append("대한민국");	// sb += "";
		// 메모리를 덜 쓰게 됨

		System.out.println(sb3);
		//--==>> seoulkorea우리나라대한민국
		System.out.println(sb3.toString());
		//--==>> seoulkorea우리나라대한민국

		// 버퍼크기 확인: 알아서 늘어남
		System.out.println("버퍼 크기: " + sb3.capacity());
		//--==>> 버퍼 크기: 34


		//////////////////////////////////////////////////////////

		String temp1 = "java and oracle";

		System.out.println(temp1.toUpperCase());
		//--==>> JAVA AND ORACLE

		String temp2 = "JAVA AND ORACLE";
		System.out.println(temp2.toLowerCase());

		//System.out.println(sb3.toUpperCase());
		//System.out.println(sb3.toLowerCase());
		//--==>> 에러 발생(컴파일 에러)

		// seoulkorea우리나라 대한민국
		String temp3 = "seoulkorea우리나라대한민국";
		System.out.println(temp3.toUpperCase());
		//--==>> SEOULKOREA우리나라대한민국
		System.out.println(sb3.toString().toUpperCase());
		//--==>> SEOULKOREA우리나라대한민국
		//** 바뀐결과는 출력만 그렇게 될 뿐, 저장된 값은 그대로임

		// seoulkorea우리나라 대한민국

		//○ 대상 문자열(sb3 → "seoulkorea우리나라대한민국")wnd
		//		"seoul" 문자열 앞에 "한국"이라는 문자열 추가
		//		즉, 『한국seoulkorea우리나라대한민국』 으로 구성
		sb3.insert(0,"한국");
		System.out.println("seoul 앞에 『한국』추가:" + sb3);
		//--==>> seoul 앞에 『한국』추가:한국seoulkorea우리나라대한민국
		System.out.println("seoul 앞에 『한국』추가:" + sb3.toString());
		//--==>> seoul 앞에 『한국』추가:한국seoulkorea우리나라대한민국
		
		//○ 대상 문자열(sb3 → "한국seoulkorea우리나라대한민국")중
		//		"korea" 문자열 뒤에 "사랑" 이라는 문자열 추가
		//		단, 대상 문자열의 인덱스를 눈으로 직접 확인하지 않고
		//		즉, 『한국seoulkorea우리나라대한민국』 으로 구성
		
		// 테스트 ①
		System.out.println(sb3.toString());
		//--==>> 한국seoulkorea우리나라대한민국

		// 테스트 ②
		//sb3.insert(12,"사랑");
		//System.out.println("korea 뒤에 『사랑』추가:" + sb3);
		//--==>> 한국seoulkorea사랑우리나라대한민국
		//System.out.println("korea 뒤에 『사랑』추가:" + sb3.toString());
		//--==>> 한국seoulkorea사랑우리나라대한민국

		// 테스트 ③
		System.out.println(sb3.indexOf("korea"));
		//--==>> 7

		// 테스트 ④
		System.out.println(sb3.insert(sb3.indexOf("korea")+"korea".length(),"사랑"));
		//--==>> 한국seoulkorea사랑우리나라대한민국

		System.out.println(sb3.toString());
		//--==>> 한국seoulkorea사랑우리나라대한민국

		// ○ 대상 문자열(sb3) 에서
		// 우리나라 문자열 삭제
		//sb3.delete(14,18);
		//System.out.println(sb3);
		System.out.println(sb3.delete(sb3.indexOf("우리나라"),sb3.indexOf("우리나라") + "우리나라".length()));
		//--==>> 한국seoulkorea사랑대한민국

		//sb3.delate(14, 18);
		//			  ┬ ┬	
		//			  │ └──sb3.indexOf("우리나라") + "우리나라".length()
		//		sb3.indexOf("우리나라");


		// ○ 대상 문자열(sb3) 에서
		// 『korea』 이후 모든 문자열 삭제(korea 포함)
		// 한국seoul
		System.out.println(sb3.delete(sb3.indexOf("korea"),sb3.length()));

		//sb3.delete(7); //--(X)
		//System.out.println(sb3.toString());

		// sb3.delete(7, 18);
		//			  ┬ ┬	
		//			  │ └──sb3.length()
		//		sb3.indexOf("korea");

		////////////////////////////////////////////////////////////////////////

		// 버퍼 크기 다시 확인
		System.out.println("버퍼크기: "+sb3.capacity());
		//--==>> 버퍼크기: 34

		// 캐퍼서트 메소드
		//** 안의 내용이 늘어날때 자동으로 늘어난다--(O)
		//** 안의 내용이 줄어들때 자동으로 줄어든다--(x)

		System.out.println("문자열의 길이: " + sb3.length());
		//--==>> 문자열의 길이: 7

		//버퍼 크기 조절
		// → 현재 문자열으 담아둘 수 있는 버퍼의 크기로...
		// trimToSize();
		sb3.trimToSize();
		
		//버퍼 크기 조절 이후 버퍼 ㅡ기 다시 확인
		System.out.println("버퍼크기: " + sb3.capacity());
		//--==>> 버퍼크기: 7
	}
}
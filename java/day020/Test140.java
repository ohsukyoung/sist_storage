/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- StringTokenizer 클래스(개념만 숙지~!!!)
=====================================*/

//** 대체할 수 있는 것이 나왔음
//** 제품이라면 단종되었겠지만, 
//** 개발 기능은 이미 사용되어지는 곳이 있기 때문에 
//** 지원은 계속함

// 컬랙션 프레임워크 조금 이해하기 쉬워짐

/*
○ StringTokenizer 클래스는

	문자열 파싱(parsing)을 위한 정보를 제공하는 클래스로
	파싱(parsing)하고 자 하는 문자열을 인자로 받아 생성하는데,
	여기서 사용되는 파싱(parsing)이라는 개념은
	하나의 문자열을 여러 문자열로 나누는 작업을 의미하게 되며,
	이 때 나누는 단위가 되는 문자열을 토큰(token)이라고 한다.

	StringTokenizer 클래스를 사용하기 위해서는
	java.util 패키지의 StringTokenizer 를 import 해야 한다.

	StringTokenizer 클래스는 호환성을 유지하는 목적으로		//** 호환성 유지 목적: 제거하지 못하고 그냥 둔다
	보관 유지되고 있으며, 문자열을 파싱(parsing) 하기 위해서는 
	String 클래스의 spilt() 메소드나, javax.util.regex 패키지를
	사용할 것을 권장하고 있다.

○ 생성자

	- 원형
		StringToknizer(String str)
		StringToknizer(String str, String delim)
		StringToknizer(String str, String delim, boolean returnDelims)
		: 주어진 문자열  str을 단어로 분리하는 객체를 생성하며
		공백(구분0 문자는 delim 에 포함된 문자로 처리하게 된다.
		만약 returnDelims 가  true 이면
		구분 문자도 분리된 데이터를 처리하게 된다.
*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class Test140
{
	public static void main(String[] args) throws IOException
	{
		String strTemp;
		String[] strArr;
		int n;

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("파싱할 문자열 입력(컴마 구분): ");
		strTemp = br.readLine();
		//-- "사과,딸기,바나나,포도"

		//StringTokenizer 클래스 인스턴스 생성
		StringTokenizer st = new StringTokenizer(strTemp, ",");
		//-- strTemp 를 대상 문자열로...("사과,딸기,바나나,포도");
		// 『","』를 구분자로
		//** 세번째 인자값 true 넣지 않았기 때문에 컴마(,)는 포함시키지 말아라

		//테스트(확인)
		System.out.println(st.countTokens());
		//--==>> 파싱할 문자열 입력(컴마 구분): 사과,딸기,바나나,포도
		//		4
		//-- StringToknizer의 『int countTokens()』 메소드
		//	: 파싱된 문자열의 갯수를 반환(리턴)한다.

		strArr = new String[st.countTokens()];
		//					----------------
		//							4

		// → strArr = new String[4];

		n = 0;
		while (st.hasMoreTokens())	//true
		{
			strArr[n++] = st.nextToken();
			// strArr[0] = st.nextToken();
			//					사과
			// strArr[0] = "사과"
			// strArr[1] = "딸기"
            // strArr[2] = "바나나"
            // strArr[3] = "포도"
            
		}
		/*
		hasMoreTokens()				// → 다음값이 있으면 true, 없으면 false
			▼ nextToken()			// → 값을 반환
		-------------------------
		사과,딸기,바나나,포도
		-------------------------		
		*/

		//-- hasMoreTokens()
		// : 사용할 수 있는 토큰이 남아있는 경우 true 를 반환
		//		더 이상 사용할 토큰이 없느 경우 false 를 반환
		//		확인에 대한 결과만 반환할 뿐..
		//		실제 내용을 읽어들이지 않고,
		//		실제 내용을 읽어들이는 헤드를 이동시키지도 않는다.

		//-- nextToken()
		//	: 다음 토큰을 얻어온다.
		//		다음 토큰을 얻어오며 헤드를 이동시키게 된다.
		//		구분자를 바꾸었을 경우 다음 호출에도 
		//		바뀐 구분자를 이용하여 토큰을 분리한다.

		System.out.print("파싱된 토큰(문자열): ");
		for(String str: strArr)
			System.out.print(str + " ");
		System.out.println();
		//--==>> 파싱할 문자열 입력(컴마 구분): 사과,딸기,바나나,포도
		//		4
		//		파싱된 토큰(문자열): 사과 딸기 바나나 포도

	}
}
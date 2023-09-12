/* =====================================
■■■ 주민등록번호 유효성 검사 ■■■
=====================================*/

/*
○ 주민등록번호 검증 공식
	① 마지막 자리를 제외한 앞자리 수를 규칙에 맞게 곱한다.
		123456-1234567 (주민등록번호)
		****** ******	----------------------각 자릿수에 곱하기
		234567 892345  (각 자릿수에 곱해질 수)

	② 규칙에 맞게 곱셈 연산을 수행한 결과를 모두 더한다.
	ex) 7 5 0 6 1 5 - 1 8 6 2 1 3 3
	    * * * * * *   * * * * * *
	    2 3 4 5 6 7   8 9 2 3 4 5
		-------------------------------------
		14 + 15 + 0 + 30 + 6 + 35 + 8 + 72 + 12 + 6 + 4 + 15

	③ 더해진 결과값을 11로 나누어 『나머지』를 취한다.\
        1
	  -----
   11| 217
       11
	   ---
	   107
	    99
	   ---
		8 → 나머지
	④ 11에서 나머지(8)을 뺀 값을 구한다.
	    11 - 8 → 3

		※ ③ 의 처리과정에서 나머지가 0인 경우 → 11 - 0 → 11
		   ③ 의 처리과정에서 나머지가 1인 경우 → 11 - 1 → 10

		   이를 다시 10으로 나누어 나머지를 취한다. 11 → 1
		   											10 → 0
	⑤ ④의 연산 결과가 주민번호를 구성하는 마지막 숫자와 
	   일치하는지의 여부를 비교하여 확인한다.

	   일치 → 유효한 주민번호
	   불일치 → 잘못된 주민번호
*/

// 실행 예)
// 주민번호입력(xxxxxx-xxxxxxxx) : 123456-12345678	//-- 1. 입력 갯수 초과
// >> 입력오류~!!!
// 계속하려면..

// 주민번호입력(xxxxxx-xxxxxxxx) : 123456-123456	//-- 2. 입력 갯수 미달
// >> 입력오류~!!!
// 계속하려면..

// 주민번호입력(xxxxxx-xxxxxxxx) : 750615-1252085	//-- 3. 유효한 주민번호
// >> 정확한 주민번호~!!!
// 계속하려면..

// 주민번호입력(xxxxxx-xxxxxxxx) : 750615-1252086	//-- 4. 잘못된 주민번호
// >> 잘못된 주민번호~!!!
// 계속하려면..

// ※ 문제 해결을 위한 추가 팁~!!!
//		배열.length			 → 배열의 길이(배열방의 갯수) 반환
//		문자열.length		 → 문자열의 길이 반환

//		문자열.substring(m,n)→ 문자열 추출
//		문자열 m번째 위치에서 n-1번째 위치까지 추출(인덱스는 0부터)

//		문자열.substring(m)→ 문자열 추출
//		문자열 m번째 위치에서 문자열의 끝까지 추출(인덱스는 0부터)

import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test106
{
	public static void main(String[] args) throws IOException
	{
		// 테스트
		/*
		String strTemp = "이윤수";
		System.out.println(strTemp.length());
		//--==>> 3

		strTemp = "이윤수시수리마수리";
		System.out.println(strTemp.length());
		//--==>> 9

		strTemp = "동해물과 백두산이 마르고 닳도록";
		System.out.println(strTemp.length());
		//--==>> 17

		strTemp = "study-hard";
		System.out.println(strTemp.length());
		//--==>> 10
		*/
		//----------------------------------------------------
		
		// 테스트2
		//String strTemp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		//System.out.println(strTemp.substring(13,17));
		//--==>> NOPQ

		//System.out.println(strTemp.substring(13,53));
		//--==>> 에러 발생(런타임 에러)
		//		StringIndexOutOfBoundsException

		//System.out.println(strTemp.substring(13));
		//--==>> NOPQRSTUVWXYZ

		//----------------------------------------------------
		
		// 내가 푼 내용 --------------------------
		/*
		Scanner sc = new Scanner(System.in);
		String stringNum;			// 입력받을 숫자
		int chNum;					// 입력받은 숫자 갯수
		String[] message = {"1,2. 입력오류~!!!", "3. 정확한 주민번호~!!!", "4. 잘못된 주민번호~!!!"};
		int[] arr = {2,3,4,5,6,7,0,8,9,2,3,4,5};
		int minus=0, chLast=0;		// 뺄 값, 입력받은 마지막 숫자
		int chek=0;					// 비교할 값	

		// 입력
		do
		{
			System.out.printf("주민번호입력(xxxxxx-xxxxxxxx) : ");
			stringNum = sc.next();
			
			chNum = stringNum.length();	// 입력받은 숫자의 길이
			if(chNum != 14)				// 입력받은 숫자가 13자리가 아닐때
				System.out.println(message[0]);

		}
		while (chNum != 14);

		// 연산1: 숫자에 맞는 곱셈 계산
		for(int i=0; i<6; i++)	// 각 숫자에 맞는 곱셈계산
		{
			minus += Integer.parseInt(stringNum.substring(i,i+1)) * arr[i];
		}
		for(int i=7; i<chNum-1; i++)	// 각 숫자에 맞는 곱셈계산
		{
			minus += Integer.parseInt(stringNum.substring(i,i+1)) * arr[i];
		}

		// 연산2
		minus %= 11;					// 곱셈계산 합계를 11로 나눈 나머지
		chLast = Integer.parseInt(stringNum.substring(13));	// 입력받은 마지막 값
		
		// 연산3 나머지가 0 이나 1인 경우와 그외
		if(minus == 0)			// 나머지가 0 인 경우
		{
			chek = 1;			//ex. 760615-1638990
		}else if(minus == 1)	// 나머지가 1인 경우
		{			
			chek = 0;			//ex. 760615-1295461
		}else
		{
			chek = (11-minus);	//ex. 760615-1248448
		}		
		
		// 비교 및 출력
		if(chLast == chek)			// 입력받은 값이 검증하고자 하는 값과 같을 때
		{
			System.out.println(message[1]);
		}
		else
			System.out.println(message[2]);
		*/

		// 함께 푼 내용 --------------------------

		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// 입력받은 주민번호(문자열 형태)를 담아둘 변수 선언
		String str;

		// 공식에 따라 주민번호의 각 자릿수에 곱하게 될 수 → 배열 형태로 구성
		int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5};
		//           1  2  3  4  5  6  -  7  8  9 10 11 12
		//							  ---
		//		                     check!!!

		// 곱셈 연산 후 누적합 → (각 곱셈의 결과를 더해나가라...)
		int tot = 0;

		System.out.print("주민번호입력(xxxxxx-xxxxxxxx) : ");
		//Integer.parseInt(br.readLine());
		str = br.readLine();

		if(str.length() != 14)
		{
			System.out.print(">> 입력오류~!!!");
			return;		//-- 메소드 종료 → main() 메소드 종료 → 프로그램 종료
		}

		// 테스트
		//System.out.println(">> 자릿수 적합~!!!");

		// ex) "750615-1252085"
		for (int i=0; i<13; i++)		//-- i → 0 1 2 3 4 5 6 7 8 9 10 11 12
		{
			// 테스트
			//System.out.print(i + " ");
			//--==>> 0 1 2 3 4 5 6 7 8 9 10 11 12

			// i가 6일 때에는 뒷부분 무시하고 계속해라

			if(i==6)
			{
				continue;		//-- 뒷부분 무시하고 계속해라~!!!
			}
			
			tot += chk[i] * Integer.parseInt(str.substring(i,i+1));		//-- 뒷부분
		}

		// 테스트
		//System.out.println("tot: "+ tot);
		//--==>> 주민번호입력(xxxxxx-xxxxxxxx) : 750615-1252085
		//		tot: 182

		//----------------여기까지 수행하면 검증 공식의 ①과 ②를 모두 끝낸 상황이며
		//					규칙에 맞게 곰셈 연산을 수행한 결과를 모두 더한 값음
		//					변수 tot에 담겨있는 상태가 된다.

		int su = 11 - tot%11;
		//----------------여기까지 수행하면 검증 공식의 ③과 ④를 모두 끝낸 상황이며
		//					su에 대한 연산 결과각 두 자리의 정수로 나올 경우
		//					주민번호 마지막 자리의 숫자와 비교를 수행할 수 없는 상황.

		su = su % 10;		// su %= 10;

		// 주민번호의 마지막 자리와 비교한 결과가 같다면 → 정확한 주민번호
		//										아니라면 → 잘못된 주민번호
		if(su == Integer.parseInt(str.substring(13)))
		{
			System.out.println(">> 정확한 주민번호~!!!");
		}else
		{
			System.out.println(">> 잘못된 주민번호~!!!");
		}

	}
}

// 실행 결과
/*
주민번호입력(xxxxxx-xxxxxxxx) : 750615-1252085
>> 정확한 주민번호~!!!
계속하려면 아무 키나 누르십시오 . . .
*/
/*
주민번호입력(xxxxxx-xxxxxxxx) : 123456-7891011
>> 잘못된 주민번호~!!!
계속하려면 아무 키나 누르십시오 . . .
*/
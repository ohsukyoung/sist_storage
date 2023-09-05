/* =====================================
■■■ 배열 ■■■
- 배열의 선언과 초기화
- 배열의 기본적 활용
=====================================*/

/*
char 자료형의 배열을 만들어
그 배열의 각 방에 알파벳 대문자를 채우고
채워진 그 배열의 전체 요소를 출력하는 프로그램을 구현한다.
단, 채우는 구문과 출력하는 구문은 따로 분리하여 처리할 수 있도록 한다.

실행 예)
A B C D E F G ...V W X Y Z
// 계속하려면 아무 키나 누르세요...

A, B, C, D, E, 
F, G, H, I, J, 
K, L, M, N, O,
P, Q, R, S, T,
U, V, W, X, Y, Z
*/

public class Test081
{
	public static void main(String[] args)
	{
		// 내가 푼 내용 --------------------------
		/*
		char[] arr = new char[26];
		char ap = 'A';
		for(int i=0; i<26; i++)
		{
			arr[i] = (char)(ap+i);
		}
		for(int i=0; i<26; i++)
		{
			System.out.printf("%c ",arr[i]);
		}
		*/

		// 함께 푼 내용 --------------------------
		// 영문 알파벳 대문자 배열 구성
		// 방법①
		char[] arr1;
		arr1 = new char[26];

		arr1[0] = 'A';
		//	:
		arr1[25] = 'Z';

		// 방법②
		char[] arr2 = {'A','B','.','Z'};

		// 방법③
		char[] arr3 = new char[26];
		for(int i=0, ch=65; i<arr3.length; i++, ch++) // i → 0~25, ch → 65~90
		{
			// 테스트
			//System.out.println("i:" + i + ", ch:" + ch);
			arr3[i] = (char)ch;
		}
		
		//배열 요소 전체 출력
		for(int i=0; i<arr3.length; i++)
		{
			System.out.print(arr3[i]+" ");
		}
		System.out.println();\
	}
}
// 실행 결과
/*
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
계속하려면 아무 키나 누르십시오 . . .
*/
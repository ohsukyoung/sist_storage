/* =====================================
■■■ 자바 기본 프로그래밍 ■■■
 - 변수와 자료형
 - 자바의 기본 입출력: System.util.Scanner()
=====================================*/

//※ java.util.scanner
//   단락 문자 패턴을 사용하여 입력ㅇ르 토큰에 따라 분할하며
//	 디폴트(default)로 사용되는 단락문자는 공백이다.
//	 작성된 다음 도큰은 『next()』 메소드 사용
//	 다른 형태(자료형)의 값으로 변환할 수 있다.
import java.util.Scanner;

public class Test019
{
	public static void main(String[] args)
	{
		//주요 변수 선언
		Scanner sc = new Scanner(System.in);
		String name;
		int kor, eng, mat, tot;

		//연산 및 처리
		System.out.print("이름,국어,영어,수학 입력(『,』구분): ");
		// 이름,국어,영어,수학 입력(『,』구분): 홍길동,90,80,70

		sc = new Scanner(sc.next()).useDelimiter("\\s*,\\s*");
		//				-----------
		//			 "홍길동,90,80,70"
		//
		// new Scanner(sc.next()).useDelimiter("\\s*,\\s*");
		//						 .구분자사용();
		//									   "\\s*,\\s*"
		//										\s*,\s*

		name = sc.next();
		kor = sc.nextInt();
		eng = sc.nextInt();
		mat = sc.nextInt();

		tot = kor + eng + mat;

		//결과 출력
		System.out.println("\n>> 이름: " + name);
		System.out.println(">> 총점: " + tot);
	}
}

//실행 결과
/*
이름,국어,영어,수학 입력(『,』구분): 홍길동,90,80,70

>> 이름: 홍길동
>> 총점: 240
계속하려면 아무 키나 누르십시오 . . .
*/
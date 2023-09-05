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

/*
<!> 기능이 많음 → 성능이 떨어짐
*/
import java.util.Scanner;

public class Test017
{
	public static void main(String[] args) //throws IOException
	{
		//주요 변수 선언
		//Scanner 클래스 기반의 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		String name;		//-- 이름
		int kor,eng, mat;	//-- 국어점수, 영어점수, 수학점수

		//연산 및 처리
		System.out.print("이름을 입력하세요: ");
		name = sc.next();

		//테스트(확인)
		//System.out.println("입력한 이름: "+name);
		
		System.out.print("국어 점수 입력: ");
		//kor = Integer.parseInt(br.readLine());	//"90"
		//kor = Integer.parseInt(sc.next());
		kor = sc.nextInt();

		System.out.print("영어 점수 입력: ");
		eng = sc.nextInt();

		System.out.print("수학 점수 입력: ");
		mat = sc.nextInt();


		//결과 출력
		System.out.println();
		System.out.println(">> 이름: "+name);
		//System.out.println(">> 총점: "+kor+eng+mat);
		//--==> 908070
		System.out.println(">> 총점: "+(kor+eng+mat));

	}
}

//실행 결과
/*
이름을 입력하세요: 홍길동
국어 점수 입력: 90
영어 점수 입력: 80
수학 점수 입력: 70

>> 이름: 홍길동
>> 총점: 240
계속하려면 아무 키나 누르십시오 . . .
*/
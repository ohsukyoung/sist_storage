/* =====================================
■■■ 클래스와 인스턴스 ■■■
=====================================*/

// ※ CircleTest.java파일과 한 세트~!

// 원의 넓이와 둘레 구하기
// 원의 넓이와 둘레를 구할 수 있는 클래스를 설계한다.
// (클래스명: CircleTest)

// ※ 원의 넓이= 반지름 * 반지름 * 3.141592
//	원의 둘레= 반지름 * 2 *3.141592
// (클래스명: CircleTest)
// 입력은 BufferedReader의 readLine()



// 실행 예)
// 반지름 입력: xxx

// >> 반지름이 xxx인 원의 
// >> 넓이: xxxx.xx
// >> 둘레: xxxx.xx
// 계속하려면 아무 키나 누르세요.
import java.io.IOException;

public class Test071
{
	public static void main(String[] args) throws IOException
	{
		// 내가 푼 내용 --------------------------
		/*
		CircleTest ct = new CircleTest();

		ct.input();

		double area = ct.calArea();
		double length = ct.calLength();

		ct.print(area,length);
		*/

		// 함께 푼 내용 --------------------------
		// CircleTest 클래스 기반의 인스턴스 생성
		// CircleTest 인스턴스 생성
		// CircleTest 객체 생성
		CircleTest ob = new CircleTest();

		ob.input();

		double num1 = ob.calArea();
		double num2 = ob.calLength();

		ob.print(num1, num2);

	}
}
/*
반지름 입력: 254
>> 반지름이 254인 원의>> 넓이: 202682.95
>> 둘레: 1595.93
계속하려면 아무 키나 누르십시오 . . .
*/
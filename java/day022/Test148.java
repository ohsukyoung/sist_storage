/* =====================================
■■■ 예외 처리(Exception Handing) ■■■
=====================================*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
//** 구조가 이럴 것이다
//** readLine에 throws IOException이 있을 것
class BufferedReader
{
	readLine throws IOException{
		
	}
}
*/
public class Test148
{
	private String[] data = new String[3];

	public void proc() //throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String str;
		int n=0;

		System.out.print("이름 입력(종료:Ctrl+z): ");
		while( (str=br.readLine()) !=  null )	//** str에 담겨있는 홍길동 문자열이 null이 아닐때
		{										//** ctrl+z 엔터하면 br.readLine이 null이 됨
			data[n++] = str;					// data 배열에 입력받은 값 넣기
			System.out.print("이름 입력(종료:Ctrl+z): ");

		}
		/*
		이름 입력(종료:Ctrl+z): 홍길동
		이름 입력(종료:Ctrl+z): 강감찬
		이름 입력(종료:Ctrl+z): ^Z			<- null
		입력된 내용 .................
		홍길동
		강감찬
		계속하려면 아무 키나 누르십시오 . . .

		*/

		System.out.println("입력된 내용 .................");
		for (String s : data)					// 향상된 for문
		{
			if (s != null)						// s 가 null이 아니면
			{
				System.out.println(s);			// 값을 출력
			}
		}
	}

	public static void main(String[] args) throws IOException
	{
		Test148 ob = new Test148();
		ob.proc();
	}
}
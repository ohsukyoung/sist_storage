/* =====================================
■■■ 예외 처리(Exception Handing) ■■■
=====================================*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

//** Test 149에서 try-catch구문 추가해서 예외를 어떻게 처리하는지 작성해서
//		throws IOExcetion을 작성안해도 됨

public class Test149
{
	private String[] data = new String[3];

	public void proc() //throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String str;
		int n=0;

		try
		{
			System.out.print("이름 입력(종료:Ctrl+z): ");
			while( (str=br.readLine()) !=  null )
			{
				data[n++] = str;
				System.out.print("이름 입력(종료:Ctrl+z): ");

			}

			System.out.println("입력된 내용 .................");
			for (String s : data)
			{
				if (s != null)
				{
					System.out.println(s);
				}
			}
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
			System.out.println("→ checked exception에 대한 처리");
		}
		catch(ArrayIndexOutOfBoundsException e)
		{
			System.out.println("배열 인덱스 관련 예외 발생~!!!");
			System.out.println("e.getMessage() : " + e.getMessage());
			System.out.println("e.toString(): " + e.toString());
			System.out.println("printtStackTrace.................");
			e.printStackTrace();
		}
		/*
		이름 입력(종료:Ctrl+z): aa
		이름 입력(종료:Ctrl+z): aa
		이름 입력(종료:Ctrl+z): dd
		이름 입력(종료:Ctrl+z):
		배열 인덱스 관련 예외 발생~!!!
		e.getMessage() : 3
		e.toString(): java.lang.ArrayIndexOutOfBoundsException: 3
		printtStackTrace.................
		java.lang.ArrayIndexOutOfBoundsException: 3
				at Test149.proc(Test149.java:27)
				at Test149.main(Test149.java:61)
		계속하려면 아무 키나 누르십시오 . . .
		*/

			
	}

	public static void main(String[] args)// throws IOException
	{
		Test149 ob = new Test149();
		ob.proc();
	}
}
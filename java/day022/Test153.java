/* =====================================
■■■ 예외 처리(Exception Handing) ■■■
=====================================*/

// 다른 예외 다시 던지기
//** 보험회사, 교통사고 사고조치..
//		교통사고가 났다고 접수만 하고				-> 예외발생
//		상급부서에 우리가 얼마만큼 비용손실 보고	-> 예외발생

public class Test153
{
	public int getValue(int value) throws Exception
	{
		int a = 0;
		
		try
		{
			a = getData(-2);									// ③ 예외 발생
		}														//		(빨강 폭탄)
		catch (Exception e)										// ④ 예외 잡아내기
		{														//		(빨강 폭탄)
			// ⑤ 예외 처리(빨강 폭탄)
			System.out.println("printStackTreace......");
			e.printStackTrace();

			// check~!!!
			// ⑥ 예외발생 (파랑폭탄
			throw new Exception ("value가 음수입니다.");
		}
		
		return a;

	}

	public int getData(int data) throws Exception				// ② 예외 던지기
	{															//		(빨강 폭탄)
		if(data<0)
		{
			throw new Exception ("data 가 0 보다 작습니다.");	// ① 예외 발생
		}														//		(빨강 폭탄)

		return data + 10;
	}

	public static void main(String [] args)
	{
		Test153 ob = new Test153();
		
		try
		{
			int a = ob.getValue(-2);							// ⑧ 예외 발생
			System.out.println("a: " +a);						//		(파랑 폭탄)
		}							
		catch (Exception e)										// ⑨ 예외 발생
		{														//		(파랑 폭탄)
			System.out.println("printStackTrace...............");	
			e.printStackTrace();
		}
		
	}
}
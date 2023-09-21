/* =====================================
■■■ 예외 처리(Exception Handing) ■■■
=====================================*/

// Test151.java 파일과 비교~!!!

class Demo
{
	private int value;

	//** value를 셋팅하거나 가져올 수 있게 함
	public void setValue(int value)
	{
		if(value<=0)	//** 
		{
			return;		// 메소드 종류 → setValue()
		}
		this.value = value;
	}

	public int getValue()
	{
		return value;
	}

}


public class Test150
{
	public static void main(String[] args)
	{
		Demo ob = new Demo();
		ob.setValue(-3);
		int result = ob.getValue();
		System.out.println(result);

	}
}
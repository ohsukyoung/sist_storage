/* =====================================
■■■ 메소드의 재귀 호출 ■■■
=====================================*/

public class Test067
{
	public static void main(String[] args)
	{
		showHi(3);
	}

	// showHi() 메소드의 코드 내에서 두 군데 위치 바꾸기

	public static void showHi(int cnt)
	{
		/*
		System.out.println("Hi~");
		showHi(cnt--);
		// postfix
		if(cnt==1)
			return;
		*/

		System.out.println("Hi~");
		if(cnt==1)
			return;
		showHi(--cnt);

		// 1) cnt가 1일때 실행 될 수 있도록
		// 2) -- 할때 넘겨지는 값 확인
		
	}
}
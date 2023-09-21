import java.util.Random;

class Lotto
{
	// 배열 변수 선언 및 메모리 할당 → 로또 번호를 담아둘 배열방 6칸
	private int[] num;

	// 생성자
	Lotto()
	{
		num = new int[6];
	}

	// getter
	public int[] getNum()
	{
		return num;
	}
	// 6 개의 난수를 발생시키는 메소드 정의
	public void start()
	{
		Random rd = new Random();
		for(int i=0; i<6; i++)
		{
			num[i] = rd.nextInt(45)+1;

			// 중복제거
			int pass=0;

			do
			{
				flag = false;
				pass++;

				for (i=0; i<a.length-pass; i++)
				{
					//System.out.println("쑝");
					
					if (num[i]==num[i+1])
					{
						flag = true;
					}
				}
			}
			while (!flag);


		}
		
		sorting();

		//System.out.printf("%3d",num[1]);

	}

	// 정렬 메소드 정의
	private void sorting()
	{
		

		// 정렬
		for(int i=0; i<num.length-1; i++)
		{
			for (int j=i+1; j<num.length ; j++)
			{
				//크기 비교
				if(num[i] > num[j])	// 오름차순 정렬
				{					
					// 자리 바꾸기
					num[i] = num[i]^num[j];
					num[j] = num[j]^num[i];
					num[i] = num[i]^num[j];
				}
			}
		}
	}
}


public class Test146_
{
	public static void main(String[] args)
	{
		// Lotto 클래스 기반 인스턴스 생성
		Lotto lotto = new Lotto();
		int[] arr = lotto.getNum();

		// 기본 5 게임
		for (int i=1; i<=5 ;i++ )
		{
			lotto.start();
			// 로또 1게임 수행

			// 결과 출력
			for(int n: arr){
				System.out.printf("%3d",n);
			}
			System.out.println();

		}
	}

}
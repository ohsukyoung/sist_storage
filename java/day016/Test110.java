 /* =====================================
■■■ 정렬(Sort) 알고리즘 ■■■
=====================================*/
// ○ 과제
//	사용자로부터 여러 학생의 성적 데이터를 입력받아
//	점수가 높은 학생부터 낮은 순으로 등수를 부여하여
//	결과를 출력하는 프로그램을 구현한다.
//	단, 배열과 정렬 알고리즘을 활용하여 작성할 수 있도록 한다.

//	실행 예)
//	인원 수 입력: 5
//	이름 점수 입력(1, 공백구분): 홍길동1 90
//	이름 점수 입력(2, 공백구분): 홍길동2 80
//  이름 점수 입력(3, 공백구분): 홍길동3 85
//	이름 점수 입력(4, 공백구분): 홍길동4 75
//	이름 점수 입력(5, 공백구분): 홍길동5 95
    
/*
------------------
1등 홍길동5 95
2등 홍길동1
3등 
4등
5등
*/
 import java.util.Scanner;
 public class Test110
 {
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		// 변수 선언
		int n;			// 인원수
		String[] names;	// 이름
		int[] jumsu;	// 점수
	
		// 입력1: 인원수를 입력받음
		System.out.print("인원 수 입력: ");
		n = sc.nextInt();

		// 입력받은 n만큼 이름과 점수 배열 생성
		jumsu = new int[n];
		names = new String[n];

		// 입력2: 이름, 점수를 인원수 만큼 입력받음
		for(int i = 0; i<n; i++)
		{
			System.out.printf("이름 점수 입력(%d, 공백구분): ", i+1);
			names[i]=sc.next();
			jumsu[i]=sc.nextInt();
		};
		
		// 정렬을 위한 복사배열 생성
		int[] copy =  (int[])jumsu.clone();	// 깊은 복사
		
		//정렬: 향상된  버블정렬
		boolean flag;	// swap 이 일어나는지 체크
		int pass =0;

		do
		{	
			flag = false;

			pass++;
			for (int i=0; i<copy.length-pass; i++)	// 버블정렬
			{

				if(copy[i] < copy[i+1])				// 내림차순
				{
					copy[i]	= copy[i] ^ copy[i+1];
					copy[i+1]	= copy[i+1] ^ copy[i];
					copy[i]	= copy[i] ^ copy[i+1];

					flag = true;					// 스왑이 일어날때
				}
			}
		}
		while (flag);

		// 결과 출력
		System.out.println("\n----------------------");
		for(int i=0; i<copy.length; i++)
		{
			for(int j=0; j<copy.length; j++)
			{
				if(copy[i]==jumsu[j])	// 내림차순으로 정렬된 copy와 같은 값을 가진 점수를 찾았을 때
				{
					System.out.printf("%d등 %s %d\n",i+1, names[j], jumsu[j]);
				}
			}
		}// 
		
	}
 }

 // 실행 결과
 /*
인원 수 입력: 5
이름 점수 입력(1, 공백구분): 홍길동1 90
이름 점수 입력(2, 공백구분): 홍기동2 80
이름 점수 입력(3, 공백구분): 홍길동3 85
이름 점수 입력(4, 공백구분): 홍길동4 75
이름 점수 입력(5, 공백구분): 홍길동5 95
----------------------
1등 홍길동5 95
2등 홍길동1 90
3등 홍길동3 85
4등 홍기동2 80
5등 홍길동4 75
계속하려면 아무 키나 누르십시오 . . .
 */
/* =====================================
■■■ 정렬(Sort) 알고리즘 ■■■
=====================================*/

/*
○ 정렬
	: 데이터를 특정한 규칙(기준)에 맞게 순서대로 나열(오름차순, 내림차순)

○ 정렬의 목적
	: 데이터 처리 과정의 편의성이나 가독성을 높이기 위함
	→ 보기좋게, 찾기 좋게, 검색이 편하게
	//** 정렬은 부하가 심하다

○ 정렬의 종류
	: 선택 정렬, 삽입 정렬, 버블 정렬, 힙 정렬, 퀵 정렬, 쉘 정렬, ...
*/
// 선택 정렬(Selection Sort)

// 실행 예)
// Source Data: 52 42 12 62 60
// Sorted Data: 12 42 52 60 62
// 계속하려면 아무 키나 누르세요...
public class Test107
{
	public static void main(String[] args)
	{
		/*

		52, 42, 12, 62, 60
		==  --
		42, 52, 12, 62, 60
		==	    --
		12, 52, 42, 62, 60
		==	        --
		12, 52, 42, 62, 60
		==	            --
		---------------------- 1회전(웅~)
		
		12, 42, 52, 62, 60
		    ==	--		
		12, 42, 52, 62, 60
		    ==	    --
		12, 42, 52, 62, 60
		    ==	        --		
		---------------------- 2회전(웅~)
		12, 42, 52, 62, 60
		        ==	--
		12, 42, 52, 62, 60
		        ==	    --
		---------------------- 3회전(웅~)
		12, 42, 52, 60, 62
		            ==  --
		---------------------- 4회전(웅~)

		<선택 정렬(Selection Sort)>
		0. 작은수를 앞으로 정렬됨
		1. 기준위치(고정)와 비교위치(위치이동)가 있음
		2. (1회전) 기준위치는 0부터 끝까지
		3. (1회전) 비교위치는 기준위치 다음부터 끝까지
		4. 비교위치는 회전안에서 계속 이동하고
		5. 고정위치는 회전이 바뀔 때만 다음으로 이동

		01234 → 1234 → 234 → 34 → 4
		*/

		// 내가 푼 내용 --------------------------
		/*
		int[] a = {52, 42, 12, 62, 60};

		System.out.printf("Source Data:");
		for(int i=0; i<a.length; i++)
		{
			System.out.printf("%3d", a[i]);
		}

		int temp;
		for(int i=0; i<a.length-1; i++)
		{
			for(int j=i+1; j<a.length; j++)
			{
				if(a[i]>a[j])
				{
					temp = a[i];
					a[i] = a[j];
					a[j] = temp;
				}
			}
		}
		
		System.out.printf("Sorted Data: ");
		for(int i=0; i<a.length; i++)
		{
			System.out.printf("%3d", a[i]);
		}
		*/
		
		// 함께 푼 내용 --------------------------
		// 향상된 for문(foreach 구문)
		int[] a = {52, 42, 12, 62, 60};
		int i,j;
		System.out.printf("Source Data: ");
		for (int n: a )			//a 자료구조 명시, : 콜론, 변수명
			System.out.print(n + " ");
		System.out.println();

		// 정렬
		for(i=0; i<a.length-1; i++)			//웅~~~~ → 비교기준데이터(0	1	2  3)
		{
			for (j=i+1; j<a.length ; j++)	//숑숑숑 → 비교대상데이터(1234 234 34 4)
			{
				//크기 비교
				//if(a[i] < a[j])		// 내림차순 정렬
				if(a[i] > a[j])	// 오름차순 정렬
				{					
					// 자리 바꾸기
					a[i] = a[i]^a[j];
					a[j] = a[j]^a[i];
					a[i] = a[i]^a[j];
				}
			}
		}

		// 결과 출력
		System.out.printf("Sorted Data: ");
		for (int n: a )
			System.out.print(n + " ");
		System.out.println();

	}
}
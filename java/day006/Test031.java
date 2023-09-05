/* =====================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
 - if 문
 - if ~ else문 실습
=====================================*/

// 1. 프로그램을 작성할 때 주어진 조건에 따라
//	분기 방향을 정하기 위해 사용하는 제어문에는
//	if문, if~else문, 조건연산자, 복합if문(if문 중첩), switch문이 있다.

//2. if문은 if다음 조건이 참(true)일 경우
//	 특정 문장을 수행하고자 할 때  사용되는 구문이다.

// 사용자로부터 이름, 국어점수, 영어점수, 수학점수를 입력받아
// 다음과 같은 형태로 출력하는 프로그램을 작성한다.
// 등급은 평균 점수를 기준으로 처리한다.

// 90점 이상			: A
// 80점 이상 90점 미만	: B
// 70점 이상 80점 미만	: C
// 60점 이상 70점 미만	: D
// 60점 미만			: F

// 단, bufferedReader를 활용해 데이터를 입력받을 수 있도록 하며,
// printf()메소드를 통해 출력할 수 있도록 한다.

// 실행 예)
// 이름 입력: 홍길동
// 국어 점수: 90
// 영어 점수: 80
// 수학 점수 : 70

// >> 당신의 이름은 홍길동입니다.
// >> 국어점수는 90,
// >> 영어점수는 80,
// >> 수학점수는 70,
// >> 총점은 240이고, 평균은 80.00입니다.
// >> 등급은 B 입니다.
//계속하려면 아무 키나 누르세요.
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test031
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// 내가 푼 내용 --------------------------
		/*
		String iName
		char grade;
		int iKor,iEng,iMat,sumTotal;
		double divTotal;

		System.out.printf("이름 입력: ");
		iName = br.readLine();
		System.out.printf("국어 점수: ");
		iKor = Integer.parseInt(br.readLine());
		System.out.printf("영어 점수: ");
		iEng = Integer.parseInt(br.readLine());
		System.out.printf("수학 점수: ");
		iMat = Integer.parseInt(br.readLine());

		sumTotal = iKor + iEng + iMat;
		divTotal = sumTotal/3.0;

		if(divTotal>89){grade = "A";}
		else if(divTotal>79){grade = "B";}
		else if(divTotal>69){grade = "C";}
		else if(divTotal>59){grade = "D";}
		else{grade = "F";}

		System.out.printf("\n>> 당신의 이름은 %s입니다.\n",iName);
		System.out.printf(">> 국어점수는 %d,\n",iKor);
		System.out.printf(">> 영어점수는 %d,\n",iEng);
		System.out.printf(">> 수학점수는 %d,\n",iMat);
		System.out.printf(">> 총점은 %d이고, 평균은 %.2f입니다.\n",sumTotal,divTotal);
		System.out.printf(">> 등급은 %c입니다.\n",grade);
		*/
		
		// 함께 푼 내용 --------------------------
		// 1. 사용자로부터 이름을 입력받는다.
		System.out.print("이름 입력: ");
		String strName = br.readLine();

		// 2. 사용자로부터 국어, 영어, 수학 점수를 입력받는다.
		System.out.print("국어 점수: ");
		String strKor = br.readLine();
		System.out.print("영어 점수: ");
		String strEng = br.readLine();
		System.out.print("수학 점수: ");
		String strMat = br.readLine();

		// 3. 문자열 형태로 입력받은 과목 점수를 정수 형태로 변환한다.
		int nKor = Integer.parseInt(strKor);
		int nEng = Integer.parseInt(strEng);
		int nMat = Integer.parseInt(strMat);

		// 4. 산술 연산을 통해 총점과 평균을 산출한다.
		int nTot = nKor + nEng + nMat;			//-- 총점
		double fAvg = (double)nTot/3;			//-- 평균 check~!!

		// 5. 등급에 대한 조건 검사를 수행한다.
		char grade = 'F';						//-- 등급

		if(fAvg >= 90)
		{
			grade = 'A';	
		}
		//else if (fAvg >=80 && fAvg < 90)
		else if(fAvg >= 80)						//-- 평균 90점 미만 조건 포함
		{
			grade = 'B';	
		}
		else if(fAvg >= 70)						//-- 평균 80점 미만 조건 포함
		{
			grade = 'C';	
		}
		else if(fAvg < 60)						//-- 평균 90점 미만 조건 포함
		{
			grade = 'F';	
		}

		// 6. 최종결과 출력
		System.out.printf("\n>> 당신의 이름은 %s입니다.\n",strName);
		System.out.printf(">> 국어점수는 %s,\n",strKor);
		System.out.printf(">> 영어점수는 %s,\n",strEng); 
		// strEng: 문자형태 점수, nEng: 정수형태 점수
		System.out.printf(">> 수학점수는 %s,\n",strMat);
		System.out.printf(">> 총점은 %d이고, 평균은 %.2f입니다.\n",nTot,fAvg);
		System.out.printf(">> 등급은 %c입니다.\n",grade);

		/* java는 예외까지 모두 체크하기 때문에
		1) 선언된 변수 초기값O, if~else if(마지막 else 없음)으로 가능
		(현재 적용된 내용)
		2) 선언된 변수 초기값X, if~else에서 마지막 else 로 값을 넣어줘야함
		*/

	}
}

//실행결과
/*
이름 입력: 홍길동
국어 점수: 90
영어 점수: 80
수학 점수: 70

>> 당신의 이름은 홍길동입니다.
>> 국어점수는 90,
>> 영어점수는 80,
>> 수학점수는 70,
>> 총점은 240이고, 평균은 80.00입니다.
>> 등급은 B입니다.
계속하려면 아무 키나 누르십시오 . . .
*/
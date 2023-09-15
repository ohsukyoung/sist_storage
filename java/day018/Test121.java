/* =====================================
■■■ 클래스 고급 ■■■
- 인터페이스(Interface)
=====================================*/

// ㅇ 실습 문제
//		성적 처리 프로그램을 구현한다.
//		단, 인터페이스를 활용할 수 있도록 한다.

// 실행 예)
// 인원 수 입력(1~10): 11
// 인원 수 입력(1~10): 0
// 인원 수 입력(1~10): 2

// 1번째 학생의 학번 이름 입력(공백 구분): 2309123 홍길동
// 국어 영어 수학 점수 입력	  (공백 구분): 90 100 85
// 2번째 학생의 학번 이름 입력(공백 구분): 2309125 장화홍
// 국어 영어 수학 점수 입력	  (공백 구분): 85 70 60

// 2309123 홍길동	90 100  85	xxx		xx.xx
//					수  수  우
// 2309125 장화홍	85  70  60	xxx		xx.xx
//					우  미  양

// 계속하려면 아무 키나 누르세요...

// 90 이상 → 수
// 80 이상 90미만 → 우
// 70 이상 80미만 → 미
// 60 이상 70미만 → 양
// 60미만(그외) → 가

import java.util.Scanner;

// 속성만 존재하는 클래스 → 자료형 활용
class Record
{
	String hak, name;		//-- 학번, 이름
	int kor, eng, mat;		//-- 국어, 영어, 수학
	int tot;				//-- 총점
	double avg;				//-- 평균
}

// 인터페이스
interface Sungjuk
{
	public void set();		//-- 인원 세팅
	public void input();	//-- 데이터 입력
	public void print();	//-- 결과 출력
}

// 문제 해결 과정에서 설계애햐 할 클래스 → Sungjuk 인터페이스를 구현하는 클래스
class SungjukImpl implements Sungjuk
{
	private int inwon;
	private Record[] rec;

	@Override
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		do
		{
			System.out.print("인원 수 입력(1~10): ");
			inwon = sc.nextInt();
		}
		while (inwon<0 || inwon>10);

		rec = new Record[inwon];
	}

	@Override
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		for(int i=0; i<inwon; i++)
		{		
			rec[i] = new Record();

			System.out.printf("%d번째 학생의 학번 이름 입력(공백 구분): ",i+1);
			rec[i].hak = sc.next();
			rec[i].name = sc.next();

			System.out.printf("국어 영어 수학 점수 입력	  (공백 구분): ",i);
			rec[i].kor = sc.nextInt();
			rec[i].eng = sc.nextInt();
			rec[i].mat = sc.nextInt();

			rec[i].tot = rec[i].kor + rec[i].eng + rec[i].mat;
			rec[i].avg = rec[i].tot/3.0;

		}
	}

// 2309123 홍길동	90 100  85	xxx		xx.xx
//					수  수  우
	@Override
	public void print()
	{
		System.out.println();
		for(int i=0; i<inwon; i++)
		{
			System.out.printf("%s %s	%d %d  %d	%d	%.2f\n", rec[i].hak, rec[i].name, rec[i].kor, rec[i].eng, rec[i].mat, rec[i].tot, rec[i].avg );
			System.out.printf("                %s  %s  %s\n", panjung(rec[i].kor), panjung(rec[i].eng), panjung(rec[i].mat));
		}
	}

// 90 이상 → 수
// 80 이상 90미만 → 우
// 70 이상 80미만 → 미
// 60 이상 70미만 → 양
// 60미만(그외) → 가

	// 내부적으로 등급에 대한 판정을 수행할 메소드
	private String panjung(int score)
	{	
		if(score >= 90)
			return "수";
		else if(score >= 80 && score<90)
			return "우";
		else if(score >= 70 && score<80)
			return "미";
		else if(score >= 60 && score<70)
			return "양";
		else
			return "가";
	}
	
}




public class Test121
{
	public static void main(String[] args)
	{
		Sungjuk ob;	//인터페이스 타입

		// 문제 해결 과정에서 작성해야 할 ob 구성 및 객체 생성
		ob = new SungjukImpl();

		ob.set();	//((SungjukImpl)ob).set()로 다운캐스팅해서 진행해도 OK
		ob.input();	// 업 캐스트로 진행시 오버라이드 되어 불러와짐
		ob.print();

		// test: panjung을 public으로 바꿀 경우 다운캐스팅되어 실행가능
		//System.out.print(((SungjukImpl)ob).panjung(90));
	}
}

// 실행 결과
/*
인원 수 입력(1~10): 2
1번째 학생의 학번 이름 입력(공백 구분): 2309123 홍길동
국어 영어 수학 점수 입력          (공백 구분): 90 100  85
2번째 학생의 학번 이름 입력(공백 구분): 2309125 장화홍
국어 영어 수학 점수 입력          (공백 구분): 85  70  60

2309123 홍길동  90 100  85      275     91.67
                수  수  우
2309125 장화홍  85 70  60       215     71.67
                우  미  양
계속하려면 아무 키나 누르십시오 . . .
*/
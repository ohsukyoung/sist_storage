/* =====================================
■■■ 연산자(Operator) ■■■
 - 비트 단위 연산자
=====================================*/
public class Test026{
	public static void main(String[] arg){
		boolean a=true, b=false;

		System.out.printf("a && b : %b\n", (a && b));
		System.out.printf("a || b : %b\n", (a || b));
		System.out.printf("!a	  : %b\n", !a); //-- 『!』논리연산자에서 부정
		System.out.printf("!b	  : %b\n", !b);

	}
}

//실행 결과
/*
a && b: false
a || b: true
!a       : false
!b       : true
계속하려면 아무 키나 누르십시오 . . .
*/
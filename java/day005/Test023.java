/* =====================================
■■■ 연산자(Operator) ■■■
 - 비트 단위 연산자
=====================================*/

public class Test023{
	public static void main(String[] args){
		int a=13, b=7;
		int c,d,e;

		c = a & b;
		d = a | b;
		e = a ^ b;

		System.out.printf("a & b : %d\n", c);
		System.out.printf("a | b : %d\n", d);
		System.out.printf("a ^ b : %d\n", e);
	}
}

//실행결과
/*
a & b : 5
a | b : 15
a ^ b : 10
계속하려면 아무 키나 누르십시오 . . .
*/

/*

- & : 모두 1 → 1
	13 → 0001101
   & 7 → 0000111
   ----------------
   		  0000101 → 4 + 1 → 5

- | : 하나라도 1 → 1
	13 → 0001101
   | 7 → 0000111
   ----------------
   		  0001111 → 8 + 4 + 2 + 1 → 15

- ^ : 달라야 → 1
	13 → 0001101
   ^ 7 → 0000111
   ----------------
   		  0001010 → 8 + 2 → 10
*/
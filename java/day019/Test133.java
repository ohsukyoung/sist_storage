/* =====================================
■■■ 자바에서 주요(중요) 클래스 ■■■
- 자바에서 기본적으로 제공하는 주요 클래스들
- BigDecimal 클래스
=====================================*/
import java.math.BigDecimal;

public class Test133
{
	public static void main(String[] args)
	{
		BigDecimal a = new BigDecimal("123456789.123456789");
		//** 정수의 표현범위보다 실수의 표현범위가 더 넓다
		//** 아마도 거의 쓸 일이 없을 것

		//movePointLeft():  소수점을 왼쪽으로 이동
		BigDecimal b = a.movePointLeft(3);
		System.out.println("처리결과: "+ b);
		//** 처리결과: 123456.789123456789

		//나눗셈 연산
		BigDecimal c = a.divide(b);
		System.out.println("처리결과: "+ c);
		//** 처리결과: 123456.789123456789
		//** iee 실수표기법으로 따로 표기됨
		//--==>> 처리결과: 1E+3

		BigDecimal d = a.divide(b,BigDecimal.ROUND_DOWN);	//** 반올림을 하지 않는다 → 절삭
															//멤버변수-ROUND_DOWN: static final
		System.out.println("처리결과: "+ d);
		//--==>> 처리결과: 1000.000000000

		// BigInteger 객체로 변환
		System.out.println(a.toBigInteger());
		//--==>> 123456789


	}

}
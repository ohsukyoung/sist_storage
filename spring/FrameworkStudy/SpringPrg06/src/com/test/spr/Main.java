/* ============================================
	Main.java
	- main() 메소드가 포함된 테스트 클래스
=============================================== */

package com.test.spr;

import java.lang.reflect.Proxy;

public class Main
{
	public static void main(String[] args)
	{
		// 주 업무가 실행을 할 수 있는 객체 준비
		// 인터페이스 변수 = new 인터페이스구현클래스();
		// List list = new ArrayList();
		Calculator cal = new CalculatorImpl();
		
		// 주 업무 실행에 대한 테스트
		// ----------------------------------------------- → AOP 기법 적용 전
		/*
		int add = cal.add(10, 20);
		System.out.println(add);
		
		int sub = cal.sub(10, 20);
		System.out.println(sub);
		
		int multi = cal.multi(10, 20);
		System.out.println(multi);
		
		int div = cal.div(10, 20);
		System.out.println(div);
		*/
		
		// 주 업무 실행에 대한 테스트
		// ----------------------------------------------- → AOP 기법 적용 후
		
		// **007 가방 사용법
		/*
		Proxy.newProxyInstance
				( //-- loader: 	주 업무 실행 클래스에 대한 정보 전달(제공)
				, //-- interfaces:주 업무 실행 클래스의 인터페이스에 대한 정보 전달(제공)
				, //-- h: 		보조 업무 실행 클래스에 대한 정보 전달(제공)
				);
		*/
		Calculator proxy = 
			(Calculator)Proxy.newProxyInstance
								( cal.getClass().getClassLoader()
									//**-- 객체
									//	**---------- 객체의 설계도
								, cal.getClass().getInterfaces()
								, new CalculatorProxy(cal));
										
		int add = proxy.add(10, 20);
		System.out.println(add);
		
		int sub = proxy.sub(10, 20);
		System.out.println(sub);
		
		int multi = proxy.multi(10, 20);
		System.out.println(multi);
		
		int div = proxy.div(10, 20);
		System.out.println(div);
	}
}

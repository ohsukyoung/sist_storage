/* ============================================
	Main.java
	- main() 메소드가 포함된 테스트 클래스
=============================================== */

package com.test.spr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
	public static void main(String[] args)
	{
		// 주 업무가 실행을 할 수 있는 객체 준비
		// 인터페이스 변수 = new 인터페이스구현클래스();
		// List list = new ArrayList();
		
		// 주 업무 실행에 대한 테스트
		// ----------------------------------------------- → AOP 기법 적용 전
		//Calculator cal = new CalculatorImpl();
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
		//Calculator cal = new CalculatorImpl();
		
		// **007 가방 사용법
		/*
		Proxy.newProxyInstance
				( //-- loader: 	주 업무 실행 클래스에 대한 정보 전달(제공)
				, //-- interfaces:주 업무 실행 클래스의 인터페이스에 대한 정보 전달(제공)
				, //-- h: 		보조 업무 실행 클래스에 대한 정보 전달(제공)
				);
		*/
		/*
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
		*/
		
		// 주 업무 실행에 대한 테스트
		// ----------------------------------------------- → Spring AOP 기법 적용 후
		
		ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
		
		//Calculator cal = new CalculatorImpl();
		//Calculator cal = (Calculator)객체수신;
		//Calculator cal = (Calculator)context.getBean("proxy");	//-- 사용가능
		Calculator cal = context.getBean("proxy", Calculator.class);
		
		int add = cal.add(10, 20);
		System.out.println(add);
		
		/*
		int sub = cal.sub(10, 20);
		System.out.println(sub);
		
		int multi = cal.multi(10, 20);
		System.out.println(multi);
		
		int div = cal.div(10, 20);
		System.out.println(div);
		*/
		
		// 예외 상황이 발생할 수 있도록 값을 넘기는 처리
		int add2 = cal.add(100,200);
		System.out.println(add2);
		
	}
}

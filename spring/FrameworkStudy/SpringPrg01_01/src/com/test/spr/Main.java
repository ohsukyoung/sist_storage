package com.test.spr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
	public static void main(String[] args)
	{
		/*
		Record record1 = new RecordImp1();			// 의존객체
		RecordView view = new RecordViewImpl();
		
		view.setRecord(record1);
		
		view.input();
		view.output();
		
		// 객체 view 가 사용되기 위해 객체 record1이 반드시 필요함
		// view 객체 입장에서 record1이 의존객체
		*/
		
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		RecordView view = context.getBean("view",RecordViewImpl.class);
		
		view.input();
		view.output();
		
	}
}

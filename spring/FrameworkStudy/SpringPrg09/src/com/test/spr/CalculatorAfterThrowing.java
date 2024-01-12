/* ============================================
	CalculatorAfterThrowing.java
	- After Throwing Advice 구성
=============================================== */

package com.test.spr;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.ThrowsAdvice;

public class CalculatorAfterThrowing implements ThrowsAdvice
{
	// 예외가 발생 했을 때 실행되어야 하므로, 테스트를 위해 주업무 예외발생하도록 수정
	public void afterThrowing(IllegalArgumentException e) throws Throwable
	// **afterThrowing!! 확인 필요! 단어를 잘못 작성시 오류발생!**
	//--==>> defining beans [cal,aspect,before,afterThrowing,proxy]; 
	//		root of factory hierarchy	Exception in thread "main" java.lang.IllegalArgumentException
	{
		/*
		try
		{
			
		} catch (Exception e2)
		{
			
		}
		*/
		
		Log log = LogFactory.getLog(this.getClass());
		log.info("After Throwing Advice -----------------------------------------");
		log.info("주 업무 처리 과정에서 예외가 발생시 사후 입력");
		log.info("----------------------------------------- After Throwing Advice");
	}
}

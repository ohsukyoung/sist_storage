/* ====================================
	HelloController.java
	- 사용자 정의 컨트롤러 클래스
======================================= */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.
//	  cf. Controller Annotation 활용
public class SampleController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	//					**------------- 요청을 헨들링함
	//								 **-------------------------------------------------------doGet, doPost, doGetPost...
	//	  **----------- 
	// **각 강의장마다 조립해서 문손잡이를 만들어야한다면, 손잡이를 만들어서 보내는것 -> 모델&뷰
	// **컨트롤러가 모델-뷰사이를 막기 위해서..인데 왜 붙어다닐까?(ModelAndView) --==>> 무조건 묶여 다니면 안됨
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
}

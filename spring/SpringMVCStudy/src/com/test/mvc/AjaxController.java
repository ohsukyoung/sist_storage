/* ====================================
	#26. AjaxController.java
		- 사용자 정의 컨트롤러 클래스
		- 직위 아이디에 따른 최소 기본급 요청에 대한 액션처리
		- DAO 객체에 대한 의존성 주입(DI)을 위한 준비
		  → 인터페이스 형태의 자료형을 속성으로 구성
		  → setter 메소드 준비
========================================================== */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.
//	  cf. Controller Annotation 활용
public class AjaxController implements Controller
{
	// 인터페이스 형태의 속성 구성
	private IEmployeeDAO dao;
	
	// setter 구성
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		/* **
		- Controller는 세션 처리 과정 추가-> 링크로 접근해서 값을 입력하거나, 접근하지 못하게 하기 위해
		- LoginFormController는 세션 처리가 없어야 함.
		** */
		// 세션 처리 과정 추가 --------------------------------------------
		HttpSession session = request.getSession();
		if (session.getAttribute("name")==null) 	  //-- 로그인이 되어있지 않은 상황
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}else if(session.getAttribute("admin")==null) //-- 로그인은 되었지만 관리자가 아닌 상황
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		// -------------------------------------------- 세션 처리 과정 추가
		
		// 이전 데이터(EmployeeInsertForm.jsp)로 부터 넘어온 데이터 수신
		// → positionId
		String positionId = request.getParameter("positionId");
		
		int result = 0;
		
		try
		{
			result = dao.getMinBasicPay(positionId);
			mav.addObject("result",result);
			//mav.setViewName("/WEB-INF/view/EmployeeInsertForm.jsp");
			mav.setViewName("/WEB-INF/view/Ajax.jsp");
			//** setViewName: 처리한 결과를 보여줄 뷰의 이름 지정
			//** 바로 넘기면 그 페이지가 submit 한것이 되므로, 필요한 값만 포스트잇에 적어서 전달한다고 생각해야함
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

	
	
}

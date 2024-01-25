/* =======================================================
  	#45. DepartmentUpdateFormController.java
		- 사용자 정의 컨트롤러 클래스
		- 부서 데이터 수정 폼 페이지 요청에 대한 액션 처리
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
public class RegionUpdateFormController implements Controller
{
	private IRegionDAO regionDAO;

	public void setRegionDAO(IRegionDAO regionDAO)
	/* **Spring에서 의존성을 주입할 때, setter 메소드의 이름은 "set"로 시작하고 첫 글자를 대문자로 한 뒤 속성 이름을 따라가는 규칙** */
	{
		this.regionDAO = regionDAO;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
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

		Region region = new Region();
		
		try
		{
			// 이전 페이지(RegionList.jsp)로부터 넘어온 데이터 수신
			//-- regionId
			
			String regionId = request.getParameter("regionId");
			  
			region = regionDAO.searchId(regionId);
			  
			mav.addObject("region",region);
			  
			mav.setViewName("/WEB-INF/view/RegionUpdateForm.jsp");
			 
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}

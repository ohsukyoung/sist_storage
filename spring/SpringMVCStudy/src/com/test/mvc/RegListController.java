/* ====================================
	#62. RegListController.java
	- 사용자 정의 컨트롤러 클래스
======================================= */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.
//	  cf. Controller Annotation 활용
public class RegListController implements Controller
{
	private IRegionDAO dao;
	
	public void setDao(IRegionDAO dao)
	{
		this.dao = dao;
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
		}
		// -------------------------------------------- 세션 처리 과정 추가
		
		try
		{
			ArrayList<Region> regionList = new ArrayList<Region>();
			
			regionList = dao.list();
			
			mav.addObject("regionList",regionList);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		mav.setViewName("/WEB-INF/view/RegList.jsp");
		
		return mav;
	}
	
}

/* =======================================================
  	#44. DepartmentInsertController.java
		- 사용자 정의 컨트롤러 클래스
		- 부서 데이터 입력 액션 수행 → DAO 필요
		- 이후 employeelist.action 을 다시 요청할 수 있도록 안내
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
public class DepartmentInsertController implements Controller
{
	private IDepartmentDAO dao;

	public void setDao(IDepartmentDAO dao)
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
		}else if(session.getAttribute("admin")==null) //-- 로그인은 되었지만 관리자가 아닌 상황
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		// -------------------------------------------- 세션 처리 과정 추가
		
		// 이전 페이지로부터(DepartmentInsertForm.jsp) 넘어온 데이터 수신
		//-- name
		//String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		try
		{
			Department department = new Department();
			//department.setDepartmentId(id);
			department.setDepartmentName(name);
			
			dao.add(department);
			
			//mav.setViewName("/WEB-INF/view/DepartmentList.jsp");
			mav.setViewName("redirect:departmentlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}

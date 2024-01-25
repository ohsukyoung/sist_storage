/* =======================================================
  	#28. EmployeeInsertController.java
		- 사용자 정의 컨트롤러 클래스
		- 직원 데이터 입력 액션 수행 → DAO 필요
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
public class EmployeeInsertController implements Controller
{
	private IEmployeeDAO dao;

	public void setDao(IEmployeeDAO dao)
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
		
		// 이전 페이지로부터(EmployeeInsertForm.jsp) 넘어온 데이터 수신
		//-- name ~ extraPay
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String birthday = request.getParameter("birthday");
		String lunar = request.getParameter("lunar");
		String telephone = request.getParameter("telephone");
		String departmentId = request.getParameter("departmentId");
		//String departmentName = request.getParameter("departmentId");
		String positionId = request.getParameter("positionId");
		//String positionName = request.getParameter("positionName");
		String regionId = request.getParameter("regionId");
		//String regionName = request.getParameter("regionName");
		String basicPay = request.getParameter("basicPay");
		String extraPay = request.getParameter("extraPay");
		
		try
		{
			Employee employee = new Employee();
			employee.setName(name);
			employee.setSsn1(ssn1);
			employee.setSsn2(ssn2);
			employee.setBirthday(birthday);
			employee.setLunar(Integer.parseInt(lunar));
			employee.setTelephone(telephone);
			employee.setDepartmentId(departmentId);
			//employee.setDepartmentName(departmentName);
			employee.setPositionId(positionId);
			//employee.setPositionName(positionName);
			employee.setRegionId(regionId);
			//employee.setRegionName(regionName);
			employee.setBasicPay(Integer.parseInt(basicPay));
			employee.setExtraPay(Integer.parseInt(extraPay));
			
			dao.employeeAdd(employee);
			
			//mav.setViewName("/WEB-INF/view/EmployeeList.jsp");
			mav.setViewName("redirect:employeelist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}

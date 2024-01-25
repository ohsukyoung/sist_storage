/* ==================================================
	#08 StudentController.java
	- Controller
=====================================================*/
package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StudentController
{
	//주요 속성 구성
	//mybatis 객체 의존성(자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 리스트 조회
	@RequestMapping(value="/studentlist.action", method = RequestMethod.GET)
	public String studentList(ModelMap model)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("count",dao.count());
		model.addAttribute("list",dao.list());
		
		return "/WEB-INF/view/StudentList.jsp";
	}
	
	// 입력 폼
	@RequestMapping(value="/studentinsertform.action")
	public String studentInsertForm()
	{
		return "/WEB-INF/view/StudentInsertForm.jsp";
	}
	
	// 입력
	@RequestMapping(value="/studentinsert.action", method = RequestMethod.POST)
	public String studentInsert(StudentDTO student)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		int sid = dao.maxId();
		student.setSid(String.format("%s", sid));
		
		dao.add(student);
		
		return "redirect:studentlist.action";
	}
	
	// 삭제
	@RequestMapping(value="/studentdelete.action", method = RequestMethod.GET)
	public String studentDelete(String sid)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.remove(Integer.parseInt(sid));
		
		return "redirect:studentlist.action";
	}
	
	// 업데이트 폼
	@RequestMapping(value= "/studentupdateform.action", method = RequestMethod.GET)
	public String studentUpdateForm(String sid, ModelMap model)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		StudentDTO student = dao.search(Integer.parseInt(sid));
		model.addAttribute("student", student);
		
		return "/WEB-INF/view/StudentUpdateForm.jsp";
	}
	
	// 업데이트
	@RequestMapping(value= "/studentupdate.action", method = RequestMethod.GET)
	public String studentUpdate(StudentDTO student)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.update(student);
		
		return "redirect:studentlist.action";
	}
}

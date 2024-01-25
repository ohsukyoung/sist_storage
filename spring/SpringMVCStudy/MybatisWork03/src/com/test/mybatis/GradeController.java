/* ==================================================
	#09 GradeController.java
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
public class GradeController
{
	//주요 속성 구성
	//mybatis 객체 의존성(자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 리스트 조회
	@RequestMapping(value="/gradelist.action", method = RequestMethod.GET)
	public String gradeList(ModelMap model)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		model.addAttribute("count",dao.count());
		model.addAttribute("list",dao.list());
		
		return "/WEB-INF/view/GradeList.jsp";
	}
	
	// 입력 폼
	@RequestMapping(value="/gradeinsertform.action")
	public String studentInsertForm(String sid, ModelMap model)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		GradeDTO grade = dao.search(Integer.parseInt(sid));
		model.addAttribute("grade", grade);
		
		return "/WEB-INF/view/GradeInsertForm.jsp";
	}
	
	// 입력
	@RequestMapping(value="/gradeinsert.action", method = RequestMethod.POST)
	public String studentInsert(GradeDTO grade)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.add(grade);
		
		return "redirect:gradelist.action";
	}
	
	// 삭제
	@RequestMapping(value="/gradedelete.action", method = RequestMethod.GET)
	public String studentDelete(String sid)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.remove(Integer.parseInt(sid));
		
		return "redirect:gradelist.action";
	}
	
	// 업데이트 폼
	@RequestMapping(value= "/gradeupdateform.action", method = RequestMethod.GET)
	public String studentUpdateForm(String sid, ModelMap model)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		GradeDTO grade = dao.search(Integer.parseInt(sid));
		model.addAttribute("grade", grade);
		
		return "/WEB-INF/view/GradeUpdateForm.jsp";
	}
	
	// 업데이트
	@RequestMapping(value= "/gradeupdate.action", method = RequestMethod.POST)
	public String studentUpdate(GradeDTO grade)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.update(grade);
		
		return "redirect:gradelist.action";
	}
	
}

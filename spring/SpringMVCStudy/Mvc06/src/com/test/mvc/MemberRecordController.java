/*=====================================================================
	MemberRecordController.java
	- 사용자 정의 컨트롤러 클래스
	
	- 데이터베이스의 리스트를 읽어오는 액션 처리
	- 『memberlist.action』 → 요청 → memberList() 처리
	
	- 데이터 입력(회원 등록)폼 요청 관련 액션 처리
	- 『memberinsertform.action』 → 요청 → memberInsertForm() 처리
	
	- 데이터 입력(회원 등록) 액션 처리
	- 『memberinsert.action』 → 요청 → memberInsert() 처리
=====================================================================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// Controller 어노테이션
@Controller
public class MemberRecordController
{
	// 데이터베이스의 리스트를 읽어오는 액션 처리
	@RequestMapping("/memberlist.action")
	public String memberList(Model model) throws ClassNotFoundException
	{
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		MemberDAO dao = new MemberDAO();
		try
		{
			dao.connection();
			memberList = dao.list();
			
			model.addAttribute("memberList",memberList);
			
		} catch (SQLException e)
		{
			System.out.println(e.toString());
		}finally {
			try
			{
				dao.close();
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		return "/WEB-INF/view/MemberList.jsp";
	}
	
	// 데이터 입력(회원 등록)폼 요청 관련 액션 처리
	@RequestMapping("/memberinsertform.action")
	public String memberInsertForm(Model model) throws ClassNotFoundException
	{
		String result = "";
		result = "/WEB-INF/view/MemberInsertForm.jsp";
		
		return result;
	}
	
	// 데이터 입력(회원 등록) 액션 처리
	@RequestMapping("/memberinsert.action")
	// 방법1) MemberDTO 와 insertForm의 name 이 같은 경우
	public String memberInsert(MemberDTO member) throws ClassNotFoundException
	// 방법2) @RequestParam
	//public String memberInsert(@RequestParam("id") String id, @RequestParam("pw") String pw,@RequestParam("name") String name,@RequestParam("tel") String tel,@RequestParam("email") String email) throws ClassNotFoundException
	{
		
		MemberDAO dao = new MemberDAO();
		try
		{
			dao.connection();
			
			// 방법2)
			/*
			MemberDTO member = new MemberDTO();
			
			member.setId(id);
			member.setPw(pw);
			member.setName(name);
			member.setTel(tel);
			member.setEmail(email);
			*/
			dao.insertQuery(member);
						
		} catch (SQLException e)
		{
			System.out.println(e.toString());
		}
		
		//return "/WEB-INF/view/MemberList.jsp";	//--(X)
		return "redirect:memberlist.action";
	}
}

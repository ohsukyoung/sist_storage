<%@page import="java.util.ArrayList"%>
<%@page import="com.test.ajax.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// MemberInsert.jsp
	
	// 5명 분 데이터 수신 → 객체 구성 → 자료구조 구성 →setAttribute()
	//						 MemberDTO
	
	// → MemberList.jsp 에서 출력

	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	MemberDTO member = new MemberDTO();
	
	for(int i=1; i<=5; i++)
	{
		/* **내가 푼 풀이** */
		String name = request.getParameter("name" + i);
		String tel = request.getParameter("tel" + i);
		String add = request.getParameter("add" + i);
		
		member = new MemberDTO(name,tel,add);
		
		/* **함께 푼 풀이** */
		/* MemberDTO member = new MemberDTO(
								request.getParameter("name"+i)
							  , request.getParameter("tel"+i)
							  , request.getParameter("add" + i)); */
		
		lists.add(member);
	}
	
	request.setAttribute("lists", lists);
	
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>

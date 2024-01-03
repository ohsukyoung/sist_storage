<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!-- 방법 ① ============================================= -->
<%
	//AjaxTest01_ok.jsp
	
	/* 
	String name = request.getParameter("name");
	String content = request.getParameter("content"); 
	*/
	
%>
<%-- 
이름: <b><%=name %></b><br>
내용: <b><%=content %></b><br> 
--%>

<!-- 방법 ② ============================================= -->
이름: <b>${param.name }</b><br>
내용: <b>${param.content }</b><br>

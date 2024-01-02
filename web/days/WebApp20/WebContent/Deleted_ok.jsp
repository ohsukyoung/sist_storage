<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Delete_ok2.jsp
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.deleteData(num);
	
	// result 결과값에 따른 분기 처리 코드 삽입 가능~!!!
	DBConn.close();
	response.sendRedirect(cp + "/List.jsp?pageNum="+pageNum);
	
	// 아래 보여지는 코드 삭제
%>
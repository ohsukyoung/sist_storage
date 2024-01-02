<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//ScoreInsert.jsp
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("userName");
	int uKor = Integer.parseInt(request.getParameter("userKor"));
	int uEng = Integer.parseInt(request.getParameter("userEng"));
	int uMat = Integer.parseInt(request.getParameter("userMat"));
	
	Connection conn = DBConn.getConnection();
	
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
			+ " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)",uName, uKor, uEng, uMat);
	
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result <1)
	{
		response.sendRedirect("Error.jsp");
	}
	else
	{
		response.sendRedirect("ScoreList.jsp");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreInsert.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	
</body>
</html>
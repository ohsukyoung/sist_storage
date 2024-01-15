<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h2>데이터 수신 결과: \${param.userName}</h2>
	<div>안녕하세요. ${param.userName}님, 반갑습니다.</div>
</div>

<div>
	<h2>데이터 수신 결과: request.getParameter("userName")</h2>
	<div>안녕하세요. <%=request.getParameter("userName") %>님, 반갑습니다.</div>
</div>

<div>
	<h2>데이터 수신 결과: request.getAttribute("userName2")</h2>
	<div>안녕하세요. <%=request.getAttribute("userName2") %>님, 반갑습니다.</div>
</div>

<div>
	<h2>데이터 수신 결과: \${userName2}</h2>
	<div>안녕하세요. ${userName2}님, 반갑습니다.</div>
</div>

</body>
</html>
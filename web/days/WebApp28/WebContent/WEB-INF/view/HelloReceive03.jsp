<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive03.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>결과 수신 페이지</h1>
	<hr />
</div>

<div class="layout">
	<ul>
		<!-- <li><b>First Name: </b>혜인</li> -->
		<li><b>(수정)First Name: </b>${fName }</li>
		<!-- <li><b>last Name: </b>최</li> -->
		<li><b>(수정)last Name: </b>${lName }</li>
		
		<li><b>(기존)First Name: </b>${param.firstName }</li>
		<li><b>(기존)First Name: </b>${param.lastName }</li>
	</ul>
</div>


</body>
</html>
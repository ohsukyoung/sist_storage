<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 접속자 수
	int n = 0;

	String count =(String)application.getAttribute("count");
	
	if(count != null)
		n = Integer.parseInt(count);
	n++;
	
	application.setAttribute("count", Integer.toString(n));
	
	String realPath = application.getRealPath("/");
	application.log("접속자: "+request.getRemoteAddr());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
	
<div>
	<h1>Application을 활용한 접속자 수 체크</h1>
	<hr>
</div>

<div class="layout">
	<h2>총 접속자: <%=n %></h2>
	<h2 style="word-wrap:break-word;">웹 서버 실제 경로<%=realPath %></h2>
</div>
	
</body>
</html>
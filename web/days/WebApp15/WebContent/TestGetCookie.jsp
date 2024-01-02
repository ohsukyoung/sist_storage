<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] ck = request.getCookies();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestGetCookie.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
	
<div>
	<h1>쿠키 정보 얻어내기</h1>
	<hr>
</div>

<div class="layout">
	<div class="tbl_box">
		<table class="table">
			<tr>
				<th style="width: 120px;">쿠키 이름</th>
				<th>쿠키 값</th>
			</tr>
			<%
			for (Cookie c : ck)
			{
			%>
			<tr>
				<td><%= c.getName() %></td>
				<td><%= c.getValue() %></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	
	<div class="layout">
		<a href="TestSetCookie.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
		<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
	</div>
</div>

</body>
</html>
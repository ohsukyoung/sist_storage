<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession02.jsp)로 부터 넘어온 데이터 수신
	// -> userId, userPwd

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	
	//String name = request.getParameter("userName");
	//String tel = request.getParameter("userTel");
	
	// 세션에서 값 가져오기
	String name = (String)session.getAttribute("userName");
	String tel = (String)session.getAttribute("userTel");
	
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h2>이름, 전화번호, 아이디, 패스워드 출력</h2>
	<h2>(TestSession03.jsp)</h2>
	<hr>
</div>

<div class="layout">
	<div class="tbl_box">
		<form action="TestSession03.jsp" method="post" name="form02">
			<table>
				<tr>
					<th>이름</th>
					<td><%=name %></td>
				</tr>
				<tr>
					<th>전화</th>
					<td><%=tel %></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=id%></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><%=pwd%></td>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>
</html>
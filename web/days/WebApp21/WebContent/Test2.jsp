<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>서블릿에서 데이터 흐름</h1>
	<hr />
</div>

<div class="layout">
	<form action="<%=cp%>/abc" method="post">
		<ul class="input_box">
			<li>
				이름<input type="text" name="name" class="txt" /><br />
			</li>
			<li>
				나이<input type="text" name="age" class="txt" /><br />
			</li>
		</ul>
		
		<div class="btn_box">
			<button type="submit" class="btn">확인</button>
		</div>
	</form>
</div>

</body>
</html>
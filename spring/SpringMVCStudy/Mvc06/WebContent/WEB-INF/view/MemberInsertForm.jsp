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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>입력폼</h1>
	<hr />
</div>

<div>
	<form action="memberinsert.action" method="post">
		<label for="">
			아이디 <input type="text" name="id"/>
		</label><br>
		<label for="">
			패스워드<input type="password" name="pw" />
		</label><br>
		<label for="">
			이름<input type="text" name="name" />
		</label><br>
		<label for="">
			전화<input type="text" name="tel" />
		</label><br>
		<label for="">
			이메일<input type="text" name="email" />
		</label>
		<br>
		
		<button class="btn" type="submit">입력완료</button>
		<button class="btn" type="reset">다시입력</button>
	</form>
</div>

</body>
</html>
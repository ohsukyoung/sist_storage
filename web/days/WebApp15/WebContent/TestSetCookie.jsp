<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 쿠키 생성(서버에 생성된 쿠키)
	Cookie c = new Cookie("cookie_test", "studyCookie");
	/* **쿠키는 서블릿컨테이너(서버)에 만들어짐** */
	
	// 쿠키 설정 (서버에 생성된 쿠키에 대한 설정)
	c.setMaxAge(3600);		// 쿠키 1시간 유지
	
	// 쿠키 추가 (서버에서 생성되고 설정된 쿠키를 클라이언트에 전달(심기))
	response.addCookie(c);
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>쿠키 설정 및 추가</h1>
	<hr>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
		<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
	</div>
</div>

</body>
</html>
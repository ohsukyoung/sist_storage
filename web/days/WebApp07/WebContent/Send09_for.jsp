<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ① 이전 페이지(Send09.jsp)로 부터 넘어온 데이터 수신
	// -> userName
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	
	// ② 이 페이지에서 수행한 추가 작업
	request.setAttribute("message", "안녕하세요.");
	//-- request 객체의 키 값(message)에 값을 넣는 작업
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09_for.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div class="layout">
	<h2>리다이렉트</h2>
</div>

<div>
	<!-- <p>이름: 홍길동</p> -->
	<p>이름: <%=userName %></p>
</div>

<!-- ③ 포워드 -->
<jsp:forward page="Receive09.jsp"></jsp:forward>
<!-- **포워딩 처리를 위한 태그** -->

</body>
</html>
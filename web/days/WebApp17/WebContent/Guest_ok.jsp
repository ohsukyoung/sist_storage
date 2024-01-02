<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="guest" class="com.test.ajax.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="guest"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div>
	<h2>작성된 내용</h2>
	<!-- <h3>이름: 홍길동</h3>
	<h3>제목: 어쩌구저쩌구</h3>
	<h3>내용: 이러쿵 저렁쿵 궁시렁 궁시렁</h3> -->
	
	<h3>이름: <%=guest.getUserName() %></h3>
	<h3>제목: <%=guest.getSubject() %></h3>
	<h3>내용: <%=guest.getContent().replaceAll("\n","<br>") %></h3>
	
</div>

</body>
</html>
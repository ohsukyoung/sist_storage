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
<title>MemberList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>JSTL 코어(Core) 문제 해결</h1>
	<h2>회원 명단 출력</h2>
	<hr />
</div>

<div class="layout">
	<!-- 5명의 이름, 전화번호, 주소 출력 -->
	<%-- <c:forEach var="a" begin="1" end="5" step="1">
		<div class="input_box" style="display: inline-block;"> --%>
			<%-- <ul>
				<li><span class="tit">이름: </span>${param.name${a}}</li>
				<li><span class="tit">전화번호: </span>${param.tel${a}}</li>
				<li><span class="tit">주소: </span>${param.addr${a}}</li>
			</ul> --%>
		<%-- </div>
		<br><br>
	</c:forEach> --%>
	<c:forEach var="dto" items="${lists }">
		<ul class="info_box" style="display:inlne-block;">
			<li><span class="tit">이름: </span>${dto.name } </td></li>
			<li><span class="tit">전화번호: </span>${dto.tel } </td></li>
			<li><span class="tit">주소: </span>${dto.addr } </td></li>
		</ul>
		<br>
	</c:forEach>
</div>

</body>
</html>
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
<title>MemberInsertForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr />
</div>

<div class="layout">
	<form action="MemberInsert.jsp" name="myForm" method="post">
	
		<!-- (이름, 전화번호, 주소) * 5명 분 -->
		<!-- → submit 액션 처리 -->
		
		<c:forEach var="a" begin="1" end="5" step="1">
		<div class="input_box" style="display: inline-block;">
			<ul>
				<li><span class="tit">이름: </span><input type="text" name="name${a }" value="입력한이름${a }"/></li>
				<li><span class="tit">전화번호: </span><input type="text" name="tel${a }" value="${a }10-0000-0000"/></li>
				<li><span class="tit">주소: </span><input type="text" name="add${a }" value="입력한주소${a }"/></li>
			</ul>
		</div>
		<br><br>
		</c:forEach>
		<div class="btn_box"><button type="submit" class="btn">결과</button></div>
		
		
		<!-- 함께 푼풀이 -->
		<%-- 
		<c:set var="i" value="1"></c:set>
		<c:forEach var="a" begin="1" end="5" step="1">
			<input type="text" name="name${a }">
			<c:set var="i" value="${i+1 }"></c:set>
		</c:forEach>
		 --%>
		
		
	</form>
</div>

</body>
</html>
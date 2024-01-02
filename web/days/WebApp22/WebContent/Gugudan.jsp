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
<title>Gugudan.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="section">
	<div>
		<h1>JSTL 코어(Core)를 활용한 구구단 출력</h1>
		<hr />
	</div>
	<div class="layout">
		<form action="">
			<div class="input_box">
				원하는 단 입력
				<input type="text" name="dan" class="txt" />
			</div>
	
			<div class="btn_box">
				<button type="submit" class="btn">결과 확인</button>	
			</div>		
		</form>
	</div>
	
	<div>
		<c:if test="${!empty param.dan }">			
			<c:set var="result" value="1"></c:set>
			
			<c:forEach var="i" begin="1" end="9" step="1">
				<p>${param.dan } * ${i } = ${param.dan * i }</p>
			</c:forEach>
			
		</c:if>
	</div>
</div>

</body>
</html>
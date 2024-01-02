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
<title>Test8.jsp</title>
<%-- <link rel="stylesheet" type="text/css" href="css/main.css"> --%>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>JSTL 코어(Core) choose문 실습</h1>
	<h2>배수확인하기</h2>
	<hr />
</div>

<div class="layout">
	<form action="" method="post">
		정수 <input type="text" name="su" class="txt" />
		
		<button type="submit" class="btn">결과 확인</button>
	</form>
	
	<div>
		<c:if test="${!empty param.su }">
			<%-- JSTL 사용하는 구문에서는 JSP 주석 사용하기~~!!  --%>
		
			<%-- ${param.su } --%>
		
			<%-- <c:choose></c:choose> --%>
			<%-- → JSTL Core 에서 if ~ else 를 대신할 수 있는 구문 --%>
			
			<%-- <c:choose>
				<c:when test="${param.su % 3 == 0 }">
					<p>${param.su }은(는) 3의 배수~!!!</p>
				</c:when>
				else
				<c:otherwise>
					<p>${param.su }은(는) 3의 배수가 아님~!!!</p>
				</c:otherwise>
			</c:choose> --%>
			
			
			
			<%-- 문제) 3 배수 / 4의 배수 / 3 과 4의 배수 / 3 또는 4의 배수 아님 --%>
			
			<%-- 내가 푼 풀이 --%>
			<%-- <p>${param.su}는</p>
			<c:choose>
				<c:when test="${(param.su % 3 == 0) || (param.su % 4 == 0)}">
					<c:choose>
						<c:when test="${(param.su % 3 == 0) && (param.su % 4 == 0)}">
							<p>3 과 4의 배수</p>					
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${param.su % 3 == 0 }">
									<p>3 배수</p>
								</c:when>
								<c:when test="${param.su % 4 == 0 }">
									<p>4 배수</p>
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
						<p>3 또는 4의 배수 아님</p>					
				</c:otherwise>
			</c:choose>
			--%>
			
			<%-- 함께 푼 풀이 --%>
			<c:choose>
				<c:when test="${(param.su % 3 == 0) && (param.su % 4 == 0)}">
					<p>3 과 4의 배수</p>
				</c:when>
				
				<c:when test="${(param.su % 3 == 0)}">
					<p>3 의 배수</p>
				</c:when>
				
				<c:when test="${(param.su % 4 == 0)}">
					<p>4 의 배수</p>
				</c:when>
				
				<c:otherwise>
					<p>3 또는 4의 배수 아님</p>					
				</c:otherwise>
			</c:choose>
			
		</c:if>
	</div>
</div>

</body>
</html>
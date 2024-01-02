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
<title>Test7.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="section">
	<div>
		<h1>JSTL 코어(Core) set문 실습</h1>
		<h2>지수승 구하기</h2>
		<hr />
	</div>
	<div class="layout">
		<div class="info_box">
			<p>『c:set』은 JSP의 setAttribute()와 같은 역할을 수행한다.</p>
			<p>(page : request | session | application)
				범위의 변수(속성)를 설정한다.</p>
			<p>『c:remove』는 JSP의 removeAttribute()와 같은 역할을 수행한다.</p>
			<p>(page : request | session | application)
				범위의 변수(혹성)를 제거한다.</p>
			<p>scope 속성이 생략될 경우 기본 값(default)은 page 이다.</p>
		</div>
		<br>
		<div>
			<!-- 수신처는 자기 자신~!!! -->
			<form action="" method="post">
				<div class="input_box">
					정수1 <input type="text" name="su1" class="txt" />
					정수2 <input type="text" name="su2" class="txt" />
				</div>
				<div class="btn_box">
					<button type="submit" class="btn">결과 확인</button>
				</div>
			</form>
		</div>
		
		<div>
			<!-- request.getParameter("su1")로 수행한 결과값이 존재할 경우 처리 -->
			<c:if test="${!empty param.su1 }">
				<%-- 『<c:set var="변수" value="값"></c:set>』 --%>
				<%-- → 변수의 값을 지정하는 구문 --%>
				<%-- → 해당 스코프에 지정된 변수가 존재하지 않을 경우
						변수를 새로 선언하여 초기화 하는 기능을 수행하게 되며
						해당 스코프에 이미 지정된 변수가 존재할 경우
						그 변수의 값을 다시 초기화하는 (덮어쓰기) 효과가 적용된다. --%>
				
				<%-- 변수를 선언하는 구문XXXX(아님) -> 선언하면 변수 재 선언 불가능하다고 이해하기 쉬우므로,
					값을 지정하는 구문이라고 이해할 것.
				 --%>
																				<!-- su1:8, su2:7 -->
				<c:set var="result" value="1"></c:set>    						<!-- result = 1 -->
				<c:forEach var="a" begin="1" end="${param.su2 }" step="1">		<!-- for(int a=1; a<7; i++) -->
					<c:set var="result" value="${result * param.su1 }"></c:set>	<!-- result = result*8 -->
					<p>${param.su1 } ^ ${a } = ${result }</p>					<!-- su1 ^ a = result -->
																				<!-- 8^1  = 8
																						2 = 
																				 -->
				</c:forEach>
			</c:if>
		</div>
	</div>
	
</div>

</body>
</html>
<%@page import="com.test.ajax.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%-- 
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="su1" name="ob"/>	
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>
 --%>

<jsp:useBean id="ob" class="com.test.ajax.Calc"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>
<!-- **※주의! java의 변수명과 jsp의 name 속성값이 같아야 사용가능** -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>세 번째 방법 처리결과</h1>
</div>
	
<div class="layout">
	<%-- <h2><%=str %></h2> --%>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>
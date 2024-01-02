<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Send03.html)로 부터 넘어온 데이터 수신
	// -> num1, num2, op
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("operation");

	String result = "";
	
	int num1 = 0;
	int num2 = 0;
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		switch(op)
		{
			case ("+"): result=String.valueOf(num1 + num2); break;
			case ("-"): result=String.valueOf(num1 - num2); break;
			case ("*"): result=String.valueOf(num1 * num2); break;
			case ("/"): result=String.format("%.1f", num1 / (double)num2); break;
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	.info_box span{font-weight: bold;}
</style>
</head>
<body class="section">

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div class="layout">
	<div class="info_box">
		<!-- 『입력하신 <span>45</span>와(과) <span>32</span>의 연산 결과는 <span>77</span> 입니다.』 -->
		『입력하신 <span><%=num1 %></span>와(과) <span><%=num2 %></span>의 
		연산(<span><%=op %></span>) 결과는 <span><%=result %></span> 입니다.』
		 
	</div>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- **
	과거 리소스 소모 효율성이 중요했으나, 현재는 기술발달로 리소스 소모보다 시간이 중요해졌음
	- buffer: 출력내용만 담아지는 것은 아님.제어해야할 데이터를 **임시로 담아둘 기억공간**
	- autoFlush: 버퍼가 가득 차면 자동으로 보내줄지, 안보내줄지 ** -->

<%-- <%@ page buffer="8kb" autoFlush="true" %> 기본값--%>
<%-- <%@ page buffer="1kb" autoFlush="false" %> 일 경우 에럽 발생--%>
<%-- <%@ page buffer="1kb" autoFlush="true" %> 일 경우 정상 처리 --%>
<%@ page buffer="10kb" autoFlush="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
	<!-- **
	page 디렉티브는 건드릴 일이 거의 없지만, 출력을 제어하는 형태로 속성을 제어할 때가 있음
	** -->
</div>

<div class="layout">
	<h2>반복문 구성</h2>
	
	<%
	for (int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>
</div>

</body>
</html>
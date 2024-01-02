<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.ajax.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리) -->
<%
	String str = "";
if(ob.getCheckGruop() != null)
{
	for(String temp: ob.getCheckGruop())
	{
		str += temp+"";
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>등록 수신결과 확인</h1>
	<hr />
</div>

<ul>
	<li>이름: <%=ob.getName() %></li>
	<li>나이: <%=ob.getAge() %></li>
	<li>성별: <%=ob.getGender() %></li>
	<li>이상형(방법1): <%=ob.result() %></li>
	<li>이상형(방법2): <%
		for (String s : ob.getCheckGruop())
	    {%>
	    <%=s %>
	  <%} %>
	</li>
	<li>이상형(방법3): <%=str %></li>
</ul>


</body>
</html>
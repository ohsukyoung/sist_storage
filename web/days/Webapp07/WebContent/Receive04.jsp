<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스트립릿 영역
	
	// 이전 페이지(Send04.html)로 부터 넘어온 데이터 수신
	//-> userId, userPw, userName, userTel, userGender, userCity, userSubject
	
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userCity = request.getParameter("userCity");
	
	//String userSubject = request.getParameter("userSubject");
	
	//check~!!!
	String[] userSubjectArr = request.getParameterValues("userSubject");
	
	String genderStr = "";
	if(userGender.equals("F"))
		genderStr="여성";
	else if(userGender.equals("M"))
		genderStr="남성";
	else
		genderStr="";
	
	String userSubjectStr = "";
	if(userSubjectArr != null)
	{
		for(String item :userSubjectArr)
			userSubjectStr+="[" + item + "] ";
	};
	
	// ※ 추후에는 수신된 데이터를... 
	//		쿼리문을 통해 DB에 입력하는 처리 과정 등이 포함될 것임을 염두하며 작업 진행
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	.info_box span{font-weight: bold;}
</style>
</head>
<body class="section">
<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div class="layout">
	<h2>가입 승인 내역</h2>
	<div class="info_box">
		<ul>
			<li><span class="tit">아이디(*): </span><%=userId %></li>
			<li><span class="tit">패스워드(*): </span><%=userPwd %></li>
			<li><span class="tit">이름(*): </span><%=userName %></li>
			<li><span class="tit">전화번호(*): </span><%=userTel %></li>
			<li><span class="tit">성별: </span><%=genderStr %></li>
			<li><span class="tit">지역: </span><%=userCity %></li>
			<li><span class="tit">수강과목: </span><%=userSubjectStr %></li>
		</ul>
	</div>
</div>
</body>
</html>
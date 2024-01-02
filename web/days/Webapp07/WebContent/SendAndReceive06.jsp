<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(SendAndReceive06.jsp -> 자기자신)로부터 넘어온 데이터 수신
	// -> userInput
	
	request.setCharacterEncoding("UTF-8");
	
	String temp = "";
	temp = request.getParameter("userInput");
	
	if(temp == null)
		temp = "없음";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>데이터 송수신 실습 06</h1>
	<hr>
</div>

<div class="layout">

	<!-- <form action="Test9999.jsp" method="post"> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
	</form> -->

	<!-- [post 버전] ================================================ -->
	<!-- **form의 action 속성값 없음
		 -> 요청하는 주소 자기자신, 내가 전달하는 데이터도 자기자신에게 보내는 것
	** -->
	
	<!-- <form action="" method="post"> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
	</form> -->
	
	<!-- [get 버전] ================================================ -->
	<!-- <form action="" method="get"> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
	</form> -->
	
	<!-- [action="" 없는 버전] ================================================ -->
	<!-- <form method="get"> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
	</form> -->
	
	<!-- [action="",  method="" 없는 버전] ================================================ -->
	<form> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
		
	</form>
	<!-- check~!!! -->
	<!-- ※ form 의 action 속성을 『action=""』와 같이 구성하거나
			action 속성을 생략하여 『<form method="post"』와 같이 구성하게 되면
			페이지 요청 및 데이터 전송에 대한 수신처 페이지는 자기 자신이 된다.
	
	 -->
</div>

<div>
	<h2>수신된 데이터 확인</h2>
	<h3> -> <%=temp %></h3>
</div>

</body>
</html>
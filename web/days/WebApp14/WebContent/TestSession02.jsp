<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession01.jsp)로 부터 넘어온 데이터 수신
	// -> userName, userTel

	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	// check~!!
	// 추가
	// 세선으로 값 보내기
	session.setAttribute("userName", name);
	session.setAttribute("userTel", tel);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h2>회원가입02 (아이디, 패스워드)</h2>
	<h2>(TestSession02.jsp)</h2>
	<hr>
</div>

<div class="layout">
	<div class="tbl_box">
		<form action="TestSession03.jsp" method="post" name="form02">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="userId" name="userId"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="text" id="userPwd" name="userPwd"></td>
				</tr>
				<tr class="btn_box" style="display: contents;">
					<td colspan="2">
						<a href="javascript:formCheck02();"><button type="button" style="width: 100%;">입력</button></a>
					</td>
				</tr>
			</table>
			<%-- <input type="text" id="userName" name="userName" value="<%=name%>">
			<input type="text" id="userTel" name="userTel" value="<%=tel%>"> --%>
		</form>
	</div>
</div>
<script type="text/javascript">
function formCheck02()
{
	//alert("확인");
	
	var f = document.form02;
	
	if(!f.userId.value)
	{
		alert("아이디를 입력해주세요.");
		f.userName.focus();
		return;
	}
	
	if(!f.userPwd.value)
	{
		alert("전화번호를 입력해주세요.");
		f.userPwd.focus();
		return;
	}
	
	f.submit();
}
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest005.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div class="layout">
	<h2>HttpServlet 관련 실습</h2>
	
	<!-- ※ 입력 컨트롤을 활용하여 서버로 데이터를 전송하기 위해서는 form 필요 -->
	<!-- ※ form 태그의 action 속성은 제이터 전송 및 페이지 요청을 해야하는 대상 페이지를 등록하는 기능을 수행.
			(생략 시 데이터 전송 및 페이지 요청을 하게 된느 대상은 자기 자신) -->
	<!-- ※ form 태그의 method 속성은 데이터 전송 및 페이지 요청에 대한 방식
			(생략 시 데이터 전송 및 페이지 요청을 하게 되는 방식은 get) -->
	<form action="/login" method="get">
		<!-- ** action="" -> 내가 나 자신을 참조(ex. 내가 전송, 내가 받아 갱신) ** -->
		<!-- ** method="" -> get 방식으로 처리 ** -->
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<!-- name 속성 check~!!! -->
					<!-- **스크립트제어-> id 속성, 서버제어-> name 속성** -->
					<input type="text" name="userId" size="10" maxlength="10" class="txt">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<!-- name 속성 check~!!! -->
					<input type="password" name="userPwd" size="10" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- ※ submit 액션 -> form 데이터 전송 및 페이지 요청 -->
					<input type="submit"  value="로그인" class="btn control">
					<input type="reset"  value="다시입력" class="btn control">
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- **
	http://localhost:3306/WebApp04/jsptest005.jsp?userId=super&userPwd=1234
	ㄴ '?' 앞 -> 요청하는 페이지
	ㄴ '?' 뒤 -> 응답 내용(& 형태로 결합됨)
** -->



</body>
</html>
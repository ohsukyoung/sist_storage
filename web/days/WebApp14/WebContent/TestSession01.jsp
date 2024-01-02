<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp 페이지로 
		이름과 전화번호를 입력받아 전송
		
		TestSession02.jsp에서 TestSession03.jsp 페이지로
		아이디와 패스워드를 입력받고
		앞에서 전달받은 이름과 전화번호를 함께 전송
		
		TestSession03.jsp 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
		
		01 ---------------- 02 ----------------- 03
		이름, 전화			아이디, 패스워드	이름, 전화, 아이디, 패스워드
		입력				입력				출력
		
							-getParameter		- getAttribute
		
	※ 즉, 01에서 02로 넘겨받을 땐 getParameter
		02에서 03으로 넘겨받을 땐 getParmeter 와 getAttribute 로 세션 활용
		01에서 03으로 직접 넘겨줄 수 없기 때문에 세션(session)에 저장
		
	※ session 외에 input 태그 hidden 속성을 이용한 정보 전달 가능~!!!
 -->

<div>
	<!-- <h1>TestSession01.jsp -> TestSession02.jsp -> TestSession03.jsp</h1> -->
	<h2>회원가입01 (이름, 전화번호)</h2>
	<h2>(TestSession01.jsp)</h2>
	<hr>
</div>

<div class="layout">
	<div class="tbl_box">
		<form action="TestSession02.jsp" method="post" name="form01">
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" id="userName" name="userName"></td>
				</tr>
				<tr>
					<th>전화</th>
					<td><input type="text" id="userTel" name="userTel"></td>
				</tr>
				<tr class="btn_box" style="display: contents;">
					<td colspan="2">
						<a href="javascript:formCheck01();"><button type="button" style="width: 100%;">입력</button></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript">
function formCheck01()
{
	//alert("확인");
	
	var f = document.form01;
	
	if(!f.userName.value)
	{
		alert("이름을 입력해주세요.");
		f.userName.focus();
		return;
	}
	
	if(!f.userTel.value)
	{
		alert("전화번호를 입력해주세요.");
		f.userTel.focus();
		return;
	}
	
	f.submit();
}
</script>
</body>
</html>
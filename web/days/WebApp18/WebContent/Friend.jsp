<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<script type="text/javascript">
function sendIt()
{
	var f = document.myForm;
	
	if(!f.name.value)
	{
		alert("이름입력")
		f.name.focus();
		return;
	}
	f.submit();
}
</script>

<div>
	<h1>데이터 입력</h1>
	<hr />
</div>

<!-- com.test.FriendDTO -->
<!-- Friend_ok.jsp -->

<div class="layout">
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td><input type="text" class="txt" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" class="txt" name="age"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="남자">남자</label>
					<label><input type="radio" name="gender" value="여자" checked>여자</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label><input type="checkbox" name="checkGruop" value="원빈">원빈</label>
					<label><input type="checkbox" name="checkGruop" value="천우희">천우희</label>
					<label><input type="checkbox" name="checkGruop" value="카리나">카리나</label>
					<label><input type="checkbox" name="checkGruop" value="정우성">정우성</label>
					<label><input type="checkbox" name="checkGruop" value="이동욱">이동욱</label>
					<label><input type="checkbox" name="checkGruop" value="한소희">한소희</label>
					<label><input type="checkbox" name="checkGruop" value="정해인">정해인</label>
					<label><input type="checkbox" name="checkGruop" value="수지">수지</label>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" class="btn" style="width: 100%;" onclick="sendIt()">등록</button></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
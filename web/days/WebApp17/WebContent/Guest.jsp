<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<script type="text/javascript">

function formSubmit()
{
	//alert("확인");
	var uName = document.getElementById("userName");
	var uTitle = document.getElementById("subject");
	var uCon = document.getElementById("content");
	
	var f = document.myForm;
	
	if(uName.value == "" || uTitle.value == "" || uCon.value == "" ||uName.value == null || uTitle.value == null || uCon.value == null )
	{
		return;
	}
	
	f.submit();
}

</script>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div class="layout">
	<form action="Guest_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td><input type="text" class="txt" name="userName" id="userName"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="txt" name="subject" id="subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="30" rows="5" name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" style="width: 100%;" onclick="formSubmit()">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
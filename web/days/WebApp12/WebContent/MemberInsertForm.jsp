<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript">
// 입력하기 버튼 클릭시 호출되는 자바스크립트 함수
function memberSubmit()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberForm = document.getElementById("memberForm");
	
	var uName = document.getElementById("uName");
	var nameMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	if(uName.value=="")
	{
		nameMsg.style.display="inline";
		uName.focus();
		return;
	}
	
	// form 을 직접 지정하여 submit 액션 수행
	memberForm.submit();
}
function memberReset()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberForm = document.getElementById("memberForm");
	var uName = document.getElementById("uName");
	var nameMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	// form 을 직접 지정하여 reset 액션 수행
	memberForm.reset();
	
	uName.focus();
}
</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #FF8F8F;">명단</span> 관리
		 및 <span style="color: #508D69;">입력</span> 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
	</div>
	
	<div>
		<!-- 회원 데이터 입력 폼 구성 -->
		<form action="MemberInsert.jsp" method="post" id="memberForm">
			<table class="table">
				<tr>
					<th style="width: 150px;">이름(*)</th>
					<td>
						<input type="text" id="uName" name="uName">
					</td>
					<td>
						<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="uTel" name="uTel">
					</td>
					<td></td>
				</tr>
			</table>
			
			<div class="btn_box">
				<a href="javascript:memberSubmit();"><button type="button">입력하기</button></a>
				<a href="javascript:memberReset();"><button type="button">취소하기</button></a>
				<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
			</div>
		</form>
	</div>
</div>


</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	
	$("#submitBtn").click(function()
	{
		//alert("확인");
		
		if($("#name").val()=="" || $("#minBasicPay").val()=="")
		{
			$("#err").html("필수 입력 항목이 누락되었습니다.");
			$("#err").css("display","inline");
			return;						//--submit 액션 처리 중단
		}
		
		// 폼 submit 액션 처리 수행
		$("#positionForm").submit();
		
	});
});
</script>
</head>
<body>

<!-- ------------------------------------
   #70. PositionUpdateForm.jsp
		- 직위 데이터 변경 페이지
		- 관리자만 접근 허용
----------------------------------------- -->

	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>

		<!-- 콘텐츠 영역 -->
		<div id="content">
			<h1>[ 직위 변경 ]</h1>
		</div>

		<form action="positionupdate.action" method="post" id="positionForm">
			<table>
				<tr>
					<th>직위번호</th>
					<td><input type="text" id="id" name="id" placeholder="직위번호" readonly="readonly" value="${position.positionId}"></td>
				</tr>
				<tr>
					<th>직위명</th>
					<td><input type="text" id="name" name="name" placeholder="직위명" value="${position.positionName}"></td>
				</tr>
				<tr>
					<th>최소기본급</th>
					<td><input type="text" id="minBasicPay" name="minBasicPay" placeholder="최소기본급" value="${position.minBasicPay}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br><br>
						
						<button type="button" class="btn" id="submitBtn"
						style="width: 40%; height: 50%;">직위 변경</button>
						<button type="button" class="btn" id="listBtn"
						style="width: 40%; height: 50%;"
						onclick="location.href='positionlist.action'">직위 리스트</button>
						<br><br>
						
						<span id="err" style="color: red; font-weight: bold; display: none;"></span>	
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
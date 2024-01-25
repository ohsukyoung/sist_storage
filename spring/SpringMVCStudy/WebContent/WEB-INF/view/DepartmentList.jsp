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
<title>DepartmentList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function()
{
	// 수정 버튼 클릭 시 액션 처리
	$(".updateBtn").click(function()
	{
		$(location).attr("href","departmentupdateform.action?departmentId="+$(this).val());
	});
	
	// 삭제 버튼 클릭 시 액션 처리
	$(".deleteBtn").click(function()
	{
		if(confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
		{
			$(location).attr("href","departmentdelete.action?departmentId="+ $(this).val());
		}
	});
});
</script>

</head>
<body>
<!-- -------------------------------------------------
	#40. DepartmentList.jsp
		- 부서 리스트 출력 페이지
		- 관리자가 접근하는 부서 데이터 출력
------------------------------------------------------ -->
	
	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>
		
		<div id="content">
			<h1>[ 부서 관리 (관리자 전용) ]</h1>
			
			<div>
				<form action="">
					<input type="button" value="부서 추가" class="btn"
					onclick="location.href='departmentinsertform.action'">
				</form>
			</div>
			<br><br>
			
			<table id="customers" class="table">
				<tr>
					<th>부서번호</th>
					<th>부서명</th>
					<th>인원수</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<!-- <tr>
					<td>1</td>
					<td>2</td>
				</tr> -->
				<c:forEach var="department" items="${departmentList }">
					<tr>
						<td>${department.departmentId}</td>
						<td>${department.departmentName}</td>
						<td>${department.delCheck}</td>
						<td><button type="button" class="btn updateBtn" value="${department.departmentId }">수정</button></td>
						<td><button type="button" class="btn deleteBtn" value="${department.departmentId }"
						${department.delCheck > 0 ? "disabled=\"disabled\"":""}
						>삭제</button></td>
					
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<!-- 회사 소개 및 어플리케이션 소개 영역 -->
		<div id="footer">
		
		</div>
	</div>


</body>
</html>
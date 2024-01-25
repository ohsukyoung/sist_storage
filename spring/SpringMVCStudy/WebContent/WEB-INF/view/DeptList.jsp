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

</head>
<body>
<!-- -------------------------------------------------
	#49. DeptList.jsp
		- 부서 리스트 출력 페이지
		- 일반 직원이 접근하는 직원 데이터 출력 페이지
		  (관리자가 접근하는 직원 데이터 출력 페이지는
		  DepartmentList.jsp 로 구성)
		- 제한된 항목
		- 입력/ 수정/ 삭제
------------------------------------------------------ -->
	
	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>
		
		<div id="content">
			<h1>[ 부서 관리 (일반직원 전용) ]</h1>
			<!-- 
			<div>
				<form action="">
					<input type="button" value="부서 추가" class="btn"
					onclick="location.href='departmentinsertform.action'">
				</form>
			</div>
			 -->
			<br><br>
			
			<table id="customers" class="table">
				<tr>
					<th>부서번호</th>
					<th>부서명</th>
					<th>인원수</th>
					<!-- <th>수정</th>
					<th>삭제</th> -->
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
						<%-- <td><button type="button" class="btn updateBtn" value="${department.departmentId }">수정</button></td>
						<td><button type="button" class="btn deleteBtn" value="${department.departmentId }"
						${department.delCheck > 0 ? "disabled=\"disabled\"":""}
						>삭제</button></td> --%>
					
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
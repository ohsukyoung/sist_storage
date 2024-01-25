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
<title>RegList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

</head>
<body>
<!-- -------------------------------------------------
	#61. RegList.jsp
		- 지역 리스트 출력 페이지
		- 일반 직원이 접근하는 지역 데이터 출력 페이지
		  (관리자가 접근하는 지역 데이터 출력 페이지는
		  RegionList.jsp 로 구성)
		- 제한된 항목
		- 입력/ 수정/ 삭제
------------------------------------------------------ -->
	
	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>
		
		<div id="content">
			<h1>[ 지역 관리 (일반직원 전용) ]</h1>
			<!-- 
			<div>
				<form action="">
					<input type="button" value="지역 추가" class="btn"
					onclick="location.href='regioninsertform.action'">
				</form>
			</div>
			 -->
			<br><br>
			
			<table id="customers" class="table">
				<tr>
					<th>지역번호</th>
					<th>지역명</th>
					<th>인원수</th>
					<!-- <th>수정</th>
					<th>삭제</th> -->
				</tr>
				<!-- 
				<tr>
					<td>1</td>
					<td>2</td>
					<td>0</td>
					<td><button type="button" class="btn updateBtn" value="">수정</button></td>
					<td><button type="button" class="btn deleteBtn" value="">삭제</button></td>
				</tr>
				 -->
				<c:forEach var="region" items="${regionList }">
					<tr>
						<td>${region.regionId}</td>
						<td>${region.regionName}</td>
						<td>${region.delCheck}</td>
						<%-- <td><button type="button" class="btn updateBtn" value="${region.regionId }">수정</button></td>
						<td><button type="button" class="btn deleteBtn" value="${region.regionId }"
						${region.delCheck > 0 ? "disabled=\"disabled\"":""}
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
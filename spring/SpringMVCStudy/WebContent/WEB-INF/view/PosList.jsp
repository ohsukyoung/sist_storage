<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PositionList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

</head>
<body>
<!-- -------------------------------------------------
	#73. PosList.jsp
		- 직위 리스트 출력 페이지
		- 일반 직원이 접근하는 직위 데이터 출력 페이지
		  (관리자가 접근하는 직위 데이터 출력 페이지는
		  PositionList.jsp 로 구성)
		- 제한된 항목
		- 입력/ 수정/ 삭제 / 최소기본급
------------------------------------------------------ -->
	
	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>
		
		<div id="content">
			<h1>[ 직위 관리 (일반직원 전용) ]</h1>
			<!-- 
			<div>
				<form action="">
					<input type="button" value="직위 추가" class="btn"
					onclick="location.href='positioninsertform.action'">
				</form>
			</div>
			 -->
			<br><br>
			
			<table id="customers" class="table">
				<tr>
					<th>직위번호</th>
					<th>직위명</th>
					<!-- <th>최소기본급</th> -->
					<th>인원수</th>
					<!-- <th>수정</th>
					<th>삭제</th> -->
				</tr>
				
				<c:forEach var="position" items="${positionList }">
					<tr>
						<td>${position.positionId}</td>
						<td>${position.positionName}</td>
						<%-- <td>
							<fmt:formatNumber value="${position.minBasicPay}" groupingUsed="true"></fmt:formatNumber>
						</td> --%>
						<td>${position.delCheck}</td>
						<%-- <td><button type="button" class="btn updateBtn" value="${position.positionId}">수정</button></td>
						<td><button type="button" class="btn deleteBtn" value="${position.positionId}"
						${position.delCheck>0 ? "disabled=\"disabled\"" : ""}
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
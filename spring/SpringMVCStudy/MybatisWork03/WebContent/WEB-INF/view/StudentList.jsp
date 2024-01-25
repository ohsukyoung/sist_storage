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
<title>StudentList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	
	$(".btnCancel").click(function ()
	{
		
		if(confirm("데이터를 정말 삭제하시겠습니까?"))
		{
			$(location).attr("href","studentdelete.action?sid="+$(this).val());
		}
	})
})
</script>
</head>
<body class="section student">
<!-- ==================================================
	#10 StudentList.jsp 
	- view 페이지
      (학생 명단 출력 레이아웃 구성)
===================================================== -->
<!-- 공통 메뉴 -->
<div>
	<c:import url="ListMenu.jsp"></c:import>
</div>

<div>
	<h1><span class="color_title">학생</span> 관리 및 <span class="color_list">출력</span> 페이지</h1>
</div>
 
<div class="layout">
	<div class="btn_box">
		<a href="studentinsertform.action"><button type="button">신규 회원 등록</button></a>
	</div>
	
	<div class="info_desc">총 인원수: ${count }</div>
	<!-- 리스트 출력 -->
	<table class="table">
		<tr>
			<th style="width: 25%">번호</th>
			<th style="width: 25%">이름</th>
			<th style="width: 25%">전화번호</th>
			<th style="width: 25%">관리</th>
		</tr>
		<!-- 
		<tr>
			<td>1</td>
			<td>회원1</td>
			<td>010-1111-1111</td>
			<td>
				<a><button type="button" class="btnUpdate">수정</button></a>
				<a><button type="button" class="btnCancel">삭제</button></a>
			</td>
		</tr>
		 -->
		<c:forEach var="student" items="${list}">
		<tr>
			<td>${student.sid}</td>
			<td>${student.name}</td>
			<td>${student.tel}</td>
			<td>
				<a href="studentupdateform.action?sid=${student.sid}"><button type="button" class="btnUpdate" value="${student.sid }">수정</button></a>
				 <%-- <button type="button" class="btn btn-default btn-xs btnInsert"
                     onclick="location.href='gradeinsertform.action?sid=${student.sid}'"
                     ${student.sub == 0 ? "style=\"display:inline;\"" : "style=\"display:none;\"" }>성적 입력</button> --%>
				<button type="button" class="btnCancel"
				${student.sub >0 ? "disabled='disabled'": ""} value="${student.sid }">삭제</button>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>
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
			$(location).attr("href","gradedelete.action?sid="+$(this).val());
		}
	})
})
</script>
</head>
<body class="section grade">

<!-- 공통 메뉴 -->
<div>
	<c:import url="ListMenu.jsp"></c:import>
</div>

<div>
	<h1><span class="color_title">성적</span> 관리 및 <span class="color_list">출력</span> 페이지</h1>
</div>

<div class="info_desc">성적처리 인원수: ${count }</div>
<!-- 번호 이름 국어점수 영어점수 수학점수 총점 평균		성적처리(입력 수정 삭제) -->
<table>
	<tr>
		<th style="width: 10%">번호</th>
		<th style="width: 10%">이름</th>
		<th>국어점수</th><th>영어점수</th><th>수학점수</th>
		<th>총점</th><th>평균</th><th>합격여부</th>
		<th>성적처리</th>
	</tr>
	<c:forEach var="grade" items="${list}">
		<tr>
			<td>${grade.sid}</td>
			<td>${grade.name}</td>
			<td>${grade.sub1 >-1 ? grade.sub1 : '<span class="c_red">미등록</span>'}</td>
			<td>${grade.sub2 >-1 ? grade.sub2 : '<span class="c_red">미등록</span>'}</td>
			<td>${grade.sub3 >-1 ? grade.sub3 : '<span class="c_red">미등록</span>'}</td>
			<td>${grade.tot >-1 ? grade.tot : '<span class="c_red">미등록</span>'}</td>
			<td>${grade.avg >-1 ? grade.avg : '<span class="c_red">미등록</span>'}</td>
			<td>${grade.ch}</td>
			<td>
				<button type="button" class="btn01" ${grade.sub1 >-1 && grade.sub2 >-1 && grade.sub3 >-1 ? "disabled='disabled'" : "" }
				onclick="location.href='gradeinsertform.action?sid=${grade.sid}'"
				>입력</button>
				<button type="button" class="btn01" ${grade.sub1 >-1 && grade.sub2 >-1 && grade.sub3 >-1 ? "" : "disabled='disabled'" }
				onclick="location.href='gradeupdateform.action?sid=${grade.sid}'"
				>수정</button>
				<button type="button" class="btn01 btnCancel" ${grade.sub1 >-1 && grade.sub2 >-1 && grade.sub3 >-1 ? "" : "disabled='disabled'" }
				value="${grade.sid}">삭제</button>
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>
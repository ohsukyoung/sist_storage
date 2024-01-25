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
<title>GradeUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
</head>
<body class="section grade">
<!-- ==================================================
	#15 GradeUpdateForm.jsp 
	- view 페이지
      (성적 명단 수정 폼 구성)
===================================================== -->
<!-- 공통 메뉴 -->
<div>
	<c:import url="ListMenu.jsp"></c:import>
</div>

<div>
	<h1><span class="color_title">성적</span> 데이터 <span class="color_update">수정</span> 페이지</h1>
</div>
 
<div class="layout">
	
	<div>
		<!-- 성적 데이터 수정 폼 구성 -->
		<form action="gradeupdate.action" method="post" id="gradeScoreForm">
			<table class="table">
				<tr>
					<th>번호</th>
					<td style="text-align:left;">${grade.sid }</td>
					<input type="hidden" id="sid" name="sid" value="${grade.sid }">
				</tr>
				<tr>
					<th style="width: 150px;">이름</th>
					<td style="text-align:left;">${grade.name }</td>
					<input type="hidden" id="name" name="name" value="${grade.name }">
				</tr>
				<tr>
					<th>국어점수</th>
					<td style="text-align:left;">
						<input type="text" id="sub1" name="sub1" value="${grade.sub1 }">
					</td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td style="text-align:left;">
						<input type="text" id="sub2" name="sub2" value="${grade.sub2 }"">
					</td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td style="text-align:left;">
						<input type="text" id="sub3" name="sub3" value="${grade.sub3 }"">
					</td>
				</tr>
			</table>
			
			<div class="btn_box">
				<button type="submit">수정하기</button>
				<input type="reset" value="취소하기" />
				<a href="gradelist.action"><button type="button">목록으로</button></a>
			</div>
		</form>
	</div>
</div>

</body>
</html>
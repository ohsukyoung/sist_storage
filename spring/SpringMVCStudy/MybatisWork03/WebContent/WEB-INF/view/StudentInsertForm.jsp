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
</head>
<body class="section student">
<!-- ==================================================
	#11 StudentInsertForm.jsp 
	- view 페이지
      (학생 명단 입력 폼 구성)
===================================================== -->
<!-- 공통 메뉴 -->
<div>
	<c:import url="ListMenu.jsp"></c:import>
</div>

<div>
	<h1><span class="color_title">학생</span> 데이터 <span class="color_insert">입력</span> 페이지</h1>
</div>
 
<div class="layout">
 
    <div>
        <!-- 회원 데이터 입력 폼 구성 -->
        <form action="studentinsert.action" method="post" id="StudentForm">
            <table class="table" style="width: 600px">
                <tr>
                    <th style="width: 150px;">이름</th>
                    <td>
                        <input type="text" id="name" name="name">
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="text" id="tel" name="tel">
                    </td>
                </tr>
            </table>
 
            <div class="btn_box">
                <button type="submit">입력하기</button>
                <input type="reset" value="취소하기" />
                <a href="studentlist.action"><button type="button">목록으로</button></a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
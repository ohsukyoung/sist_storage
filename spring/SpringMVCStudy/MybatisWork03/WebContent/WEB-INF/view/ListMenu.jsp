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
</head>
<body>
<!-- -------------------------------------
    #18 listMenu.jsp
        - 메인 메뉴 페이지 구성
------------------------------------------ -->

<div id="menu">
    <ul>
        <li><a href="studentlist.action" class="menu">학생 정보</a></li>
        <li><a href="gradelist.action" class="menu">성적 정보</a></li>
    </ul>
</div>

</body>
</html>
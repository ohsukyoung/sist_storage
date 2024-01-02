<%@page import="com.test.ajax.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberDelete2.jsp
	
/* **
MemberDelete2.jsp = MemberDelete + Notice 를 합친 버전.
			ㄴ제거가능시 실행내용을 다르게 구성
** */

	// 이전 페이지(MemberSelect.jsp)로 부터 넘어온 데이터 수신
	// -> sid
	
	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		int checkCount = dao.refCount(sid);
		
		if(checkCount==0)	//-- 제거 가능
		{
			dao.remove(sid);
			response.sendRedirect(strAddr);
		}else				//-- 제거 불가
		{ }
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div class="layout">
	<div class="result_box">
		해당 회원의 정보를 삭제하기 위해서는 <br>
		등록된 성적 정보를 먼저 삭제해야 합니다.<br><br>
		
		<a href="MemberSelect.jsp" style="color:blue;">▶리스트로 돌아가기</a>
	</div>
</div>
</body>
</html>
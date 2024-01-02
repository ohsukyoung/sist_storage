<%@page import="com.test.ajax.MemberDTO"%>
<%@page import="com.test.ajax.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 : ";	// 5명</span>
	
	try
	{
		dao = new MemberDAO();
		
		memberCount += dao.count() + "명</span>";
		str.append("<table>");
		str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th></tr>");
		
		// MemberDAO의 lists() 메소드 호출
		//-- 반복문을 통해 <table> 하위 엘리먼트 생성
		for(MemberDTO member: dao.lists())
		{
			str.append("<tr>");
			str.append("<td>"+member.getSid()+"</td>");
			str.append("<td>"+member.getName()+"</td>");
			str.append("<td>"+member.getTel()+"</td>");
		}
		str.append("</table>");
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터 베이스 연결 종료
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
<title>MemberList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
	.errMsg {display:none; color:red;}
</style>

<script type="text/javascript">
function formCheck()
{
	//확인
	//alert("함수 호출~!!!");
	
	var userName = document.getElementById("userName");
	var userMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	if(userName.value == "")
	{
		nameMsg.style.display = "inline";
		userName.focus();
		return false;
	}
	
	//return false;
	return true;
}
</script>

</head>
<body class="section">

<div>
	<h1>데이터베이스 연동 회원관리 실습</h1>
	<hr>
</div>

<div class="layout">
	<p>DAO, DTO 개념 적용</p>
	<form class="tbl_box" action="MemberInsert.jsp" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn" style="width: 200px;">회원 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<!-- <div class="tbl_box">
		<span id="memberCount">전체 인원 수 : 5명</span><br><br>
		<table>
			<tr>
				<th>번호</th><th>이름</th><th>전화번호</th>
			</tr>
			<tr>
				<td>1</td>
				<td>고길동</td>
				<td>010-1111-1111</td>
			</tr>
			<tr>
				<td>2</td>
				<td>둘리</td>
				<td>010-2222-2222</td>
			</tr>
			<tr>
				<td>3</td>
				<td>도우너</td>
				<td>010-3333-3333</td>
			</tr>
			<tr>
				<td>4</td>
				<td>희동이</td>
				<td>010-4444-4444</td>
			</tr>
			<tr>
				<td>5</td>
				<td>마이콜</td>
				<td>010-5555-5555</td>
			</tr>
		</table>
	</div> -->
	<!-- 전체 인원수 확인 -->
	<%=memberCount %>
	
	<!-- 번호 이름 전화번호 항목에 대한 리스트 구성 -->
	<%=str.toString() %>
</div>



</body>
</html>
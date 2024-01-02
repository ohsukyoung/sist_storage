<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/* **현재는 String을 쓰지만, 나중에는 String Buffer나, Stringbuilder 써야함** */

	// 결과값 변수
	String str ="";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(select)
	String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
	
	// 작업 객체 실행 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	
	ResultSet rs  = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 -> 반복문 구성
	str += "<table class ='table' style='width: 100%;'>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='telTitle'>전화번호</th>";
	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td>"+rs.getString("SID")+"</td>";
		str += "<td>"+rs.getString("NAME")+"</td>";
		str += "<td>"+rs.getString("TEL")+"</td>";
		str += "</tr>";
			
	}
	str += "</table>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	input {width: 200px;}
	button {width: 208px; height: 50px; font-weight: bold;}
	#numTitle {width: 50px;}
	#nameTitle {width: 100px;}
	#telTitle {width: 160px;}
	.errMsg {font-weight: small; color: red;}
	.table tr:not(first-child){text-align: center;}
</style>

</head>
<body class="section">

<script type="text/javascript">
// 필수 입력 항목 (-> 이름)에 대한 기본적인 입력 화면
function formCheck()
{
	//alert('함수 호출~!!!');
	
	var uName = document.getElementById("userName");
	var uErr = document.getElementBId("nameErr");
	
	nameErr.style.display = "none";
	
	if(uName.value=="")
	{
		nameErr.style.display="inline";
		return false;
	}
	
	return true;
}
</script>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div class="layout">
	<!-- 데이터 입력 -->
	<form class="_box" action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table style="background:white;">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameErr">이름을 입력해야 합니다.</span>	
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="userTel" name="userTel" class="txt"></td>
			</tr>
			<tr>
				<th></th>
				<td><button type="submit" id="btnAdd" class="btn control">데이터 추가</button></td>
			</tr>
		</table>
	</form>
	
	<div  class="result_box">
	<%=str %>
	<!-- 처리결과 -->
		<!-- <table class ="table" style="width: 100%;">
			<tr>
				<th id="numTitle">번호</th>
				<th id="nameTitle">이름</th>
				<th id="telTitle">전화번호</th>
			</tr>
			<tr>
				<td>5</td>
				<td>박나영</td>
				<td>010-5555-5555</td>
			</tr>
			<tr>
				<td>6</td>
				<td>정현욱</td>
				<td>010-6666-6666</td>
			</tr>
		</table> -->
	</div>
</div>

</body>
</html>
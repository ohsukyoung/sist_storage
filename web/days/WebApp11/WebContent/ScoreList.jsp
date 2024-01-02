<%@page import="com.test.ajax.ScoreDTO"%>
<%@page import="com.test.ajax.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;

	try
	{
		dao = new ScoreDAO();
		
		// 출력
		str.append("<table>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th><tr>");
		
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>"+score.getSid()+"</td>");			
			str.append("<td>"+score.getName()+"</td>");			
			str.append("<td>"+score.getKor()+"</td>");			
			str.append("<td>"+score.getEng()+"</td>");			
			str.append("<td>"+score.getMat()+"</td>");			
			str.append("<td>"+score.getTot()+"</td>");			
			str.append("<td>"+String.format("%.1f",score.getAvg())+"</td>");			
			str.append("</tr>");			
		}
		str.append("</table>");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
function scoreInsert()
{
	//확인
	//alert("연결 성공");
	
	var userName 	= document.getElementById("userName");
	var userKor 	= document.getElementById("userKor");
	var userEng 	= document.getElementById("userEng");
	var userMat 	= document.getElementById("userMat");
	
	var kor = Number(userKor.value);
	var eng = Number(userEng.value);
	var mat = Number(userMat.value);
	
	var errName	= document.getElementById("errName");
	var errKor	= document.getElementById("errKor");
	var errEng	= document.getElementById("errEng");
	var errMat	= document.getElementById("errMat");
	
	errName.style.display = "none";
	errKor.style.display = "none";
	errEng.style.display = "none";
	errMat.style.display = "none";
	
	if(userName.value=="")
	{
		errName.style.display = "inline";
		return false;
	}
	
	if(userKor.value=="" || kor<0 || kor>100)
	{
		errKor.style.display = "inline";
		return false;
	}

	if(userEng.value=="" || eng<0 || eng>100)
	{
		errEng.style.display = "inline";
		return false;
	}

	if(userMat.value=="" || mat<0 || mat>100)
	{
		errMat.style.display = "inline";
		return false;
	}
	
	//return false;
	return true;
}
</script>
</head>
<body class="section">

<div>
	<h1>성적 리스트를 출력 프로그램</h1>
	<hr>
</div>
 
<div class="layout">
	<form action="ScoreInsert.jsp" method="post" onsubmit="return scoreInsert()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span id="errName" class="errMsg">이름을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="userKor" name="userKor">
					<span id="errKor" class="errMsg">국어점수(0~100)</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="userEng" name="userEng">
					<span id="errEng" class="errMsg">영어점수(0~100)</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="userMat" name="userMat">
					<span id="errMat" class="errMsg">수학점수(0~100)</span>
				</td>
			</tr>
		</table>
		<div class="btn_box">
			<button type="submit" id="resultBtn" name="resultBtn" class="btn">성적 추가</button>
		</div>
	</form>
	<div class="result_box">
		<!-- <table>
			<tr>
				<th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>
			<tr>
			<tr>
				<td>1</td><td>임하성</td><td>90</td><td>60</td><td>70</td><td>xxx</td><td>xx.x</td>
			</tr>
		</table> -->
		<%=str %>
	</div>
</div>

</body>
</html>
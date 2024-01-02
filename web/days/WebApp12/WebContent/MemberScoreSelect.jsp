<%@page import="com.test.ajax.MemberScoreDTO"%>
<%@page import="com.test.ajax.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("	<tr>");
		str.append("		<th class='numTh'>번호</th>");
		str.append("		<th class='nameTh'>이름</th>");
		str.append("		<th>국어점수</th><th>영어점수</th><th>수학점수</th>");
		str.append("		<th>총점</th><th>평균</th><th>석차</th>");
		str.append("		<th>성적처리</th>");
		str.append("	</tr>");
		
		for(MemberScoreDTO score: dao.lists())
		{
			str.append("	<tr>");
			str.append("		<td>"+score.getSid()+"</td>");
			str.append("		<td>"+score.getName()+"</td>");
			str.append("		<td>"+score.getKor()+"</td>");
			str.append("		<td>"+score.getEng()+"</td>");
			str.append("		<td>"+score.getMat()+"</td>");
			str.append("		<td>"+score.getTot()+"</td>");
			str.append("		<td>"+String.format("%.2f",score.getAvg())+"</td>");
			str.append("		<td>"+score.getRank()+"</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			/* 
			str.append("		<td>");
			str.append("			<button type='button' class='btn01'>입력</button>");
			str.append("			<button type='button' class='btn01'>수정</button>");
			str.append("			<button type='button' class='btn01'>삭제</button>");
			str.append("		</td>");
			str.append("	</tr>");
			 */
			 
			if(score.getKor()==-1 && score.getEng()==-1 && score.getMat()==-1)
			{
				str.append("		<td>");
				str.append("			<a href='MemberScoreInsertForm.jsp?sid="+score.getSid()+"'><button type='button' class='btn01'>입력</button></a>");
				str.append("			<button type='button' class='btn01' disabled='disabled'>수정</button>");
				str.append("			<button type='button' class='btn01' disabled='disabled'>삭제</button>");
				str.append("		</td>");
				str.append("	</tr>");
			}
			else
			{
				str.append("		<td>");
				str.append("			<button type='button' class='btn01' disabled='disabled'>입력</button>");
				str.append("			<a href='MemberScoreUpdateForm.jsp?sid="+score.getSid()+"'><button type='button' class='btn01'>수정</button></a>");
				str.append("			<a href='javascript:memberScoreDelete("+score.getSid() +", \"" + score.getName()+"\")'><button type='button' class='btn01'>삭제</button></a>");
				str.append("		</td>");
				str.append("	</tr>");
			}
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
			// 데이터베이스 연결 종료
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
<title>MemberScoreSelect.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
function memberScoreDelete(sid, name)
{
	// 확인
	//alert("함수 연결");
	
	//alert("번호: "+ sid + ",이름:" + name);
	
	//※ name 을 문자열로 넘기는 과정에서 따옴표 주의할것~!!!
	
	var res = confirm("번호: "+ sid + ",이름:" + name + "\n이 회원의 정보를 정말 삭제하시겠습니까?");

	if(res)
		window.location.href="MemberScoreDelete.jsp?sid="+sid;
}
</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #62c8eb;">성적</span> 관리 및 출력 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
	</div>
</div>

<!-- 번호 이름 국어점수 영어점수 수학점수 총점 평균 석차		성적처리 -->
<!-- 														입력 수정 삭제 -->
<!-- <table>
	<tr>
		<th class='numTh'>번호</th>
		<th class='nameTh'>이름</th>
		<th>국어점수</th><th>영어점수</th><th>수학점수</th>
		<th>총점</th><th>평균</th><th>석차</th>
		<th>성적처리</th>
	</tr>
	<tr>
		<td>"+score.getSid()+"</td>
		<td>"+score.getName()+"</td>
		<td>"+score.getKor()+"</td>
		<td>"+score.getEng()+"</td>
		<td>"+score.getMat()+"</td>
		<td>"+score.getTot()+"</td>
		<td>"+score.getAvg()+"</td>
		<td>"+score.getRank()+"</td>
		<td>
			<button type='button' class='btn01'>입력</button>
			<button type='button' class='btn01'>수정</button>
			<button type='button' class='btn01'>삭제</button>
		</td>
	</tr>
</table> -->
<%=str.toString() %>

</body>
</html>
<%@page import="com.test.ajax.MemberDTO"%>
<%@page import="com.test.ajax.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(MemberSelect.jsp)로부터 넘어온 데이터 수신
	// -> sid
	
	// 수신한 sid 를 가지고 회원 데이터 조회
	// 조회해서 얻어낸 데이터를 폼에 구성
	
	String sid = request.getParameter("sid");
	String name = "";
	String tel = "";
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터 베이스 연결
		dao.connection();
		
		MemberDTO member = dao.searchMember(sid);
		name = member.getName();
		tel = member.getTel();
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
<title>MemberUdpateForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript">
// 입력하기 버튼 클릭시 호출되는 자바스크립트 함수
function memberSubmit()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberForm = document.getElementById("memberForm");
	
	var uName = document.getElementById("uName");
	var nameMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	if(uName.value=="")
	{
		nameMsg.style.display="inline";
		uName.focus();
		return;
	}
	
	// form 을 직접 지정하여 submit 액션 수행
	memberForm.submit();
}
function memberReset()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberForm = document.getElementById("memberForm");
	var uName = document.getElementById("uName");
	var nameMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	// form 을 직접 지정하여 reset 액션 수행
	memberForm.reset();
	
	uName.focus();
}
</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #FF8F8F;">명단</span> 관리
		 및 <span style="color: #61A3BA;">수정</span> 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
	</div>
	
	<div>
		<!-- 회원 데이터 수정 폼 구성 -->
		<!-- <form action="MemberUpdate.jsp" method="post" id="memberForm"> -->
		<!-- 방법 ③: get 방식으로 주소에서 sid 넘김 -->
		<form action="MemberUpdate.jsp?sid=<%=sid %>" method="post" id="memberForm">
			<table class="table">
				<tr>
					<th>번호</th>
					<!-- <td>1</td> -->
					<td>
						<%=sid %>
						<!-- **번호(sid)를 submit 시 넘기는 방법 3가지** -->
						<!-- 방법 ①: type="hidden" 사용 -->
						<input type="hidden" name="sid" value="<%=sid%>">
						<!-- 방법 ②: disabled 사용 -->
						<%-- <input type="text" name="sid" value="<%=sid%>" disabled="disabled"> --%>
					</td>
					<td></td>
				</tr>
				<tr>
					<th style="width: 150px;">이름(*)</th>
					<td>
						<input type="text" id="uName" name="uName" value="<%=name %>">
					</td>
					<td>
						<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="uTel" name="uTel" value="<%=tel %>">
					</td>
					<td></td>
				</tr>
			</table>
			
			
			
			<div class="btn_box">
				<a href="javascript:memberSubmit();"><button type="button">수정하기</button></a>
				<a href="javascript:memberReset();"><button type="button">취소하기</button></a>
				<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
			</div>
		</form>
	</div>
</div>


</body>
</html>
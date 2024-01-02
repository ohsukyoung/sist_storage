<%@ page contentType="text/html; charset=UTF-8"%>
<%
/* **
	- 그동안 중요하다고 한 것: 자바, 오라클, jdbc ... -> 나누고 쪼개기..
	- 웹 기반 어플리케이션 만들어 놓으면 
		1) 하나를 수정한다고 해서 전체를 바꾸지 않아도 됨
		ㄴ 모델, 뷰, 컨트롤러에서 중요한 것은 라이프사이클(유지보수) 이 다름
		2) 제어 가능이 여러 곳에서 사용할 수 있음
	- 보통 보여지는 페이지만 다르게 바꾸는 것이 일반적.
** */

	// 스크립릿 영역

	// 이전 페이지(Send02.html)로 부터 넘어온 데이터 수신
	// -> userName, kor, eng, mat
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	/* 내가 푼 풀이 ======================================= */
	int[] scores = new int[3];
	scores[0] = Integer.parseInt(request.getParameter("userKor"));
	scores[1] = Integer.parseInt(request.getParameter("userEng"));
	scores[2] = Integer.parseInt(request.getParameter("userMat"));
	
	int tot = 0;
	
	for(int item : scores)
		tot += item;
	
	double avg = (double)(tot) / scores.length;
	// **소수점 이하 처리1) Math 함수 & 나누기(/)**
	//avg = Math.floor(avg * 10)/ 10.0;
	// **소수점 이하 처리2) format**
	String avgTxt = String.format("%.1f", avg);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	.info_box span{font-weight:bold;}
</style>
</head>
<body class="section">

<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>

<div class="layout">
	<h2>가입 확인</h2>
	<div class="info_box">
	『<span><%= name %></span>님, 성적처리가 완료되었습니다.<br>
		회원님의 점수는 국어:<span><%=scores[0] %></span>점
					, 영어:<span><%=scores[1] %></span>점
					, 수학: <span><%=scores[2] %></span>점 입니다.<br>
		<%-- 총점은 <span><%=tot %></span>점, 평균은 <span><%=avgTxt %></span> 입니다.』 --%>
		총점은 <span><%=tot %></span>점, 평균은 <span><%=String.format("%.1f", avg) %></span> 입니다.』
	</div>
</div>

</body>
</html>
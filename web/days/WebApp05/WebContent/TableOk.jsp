<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 내가 푼 방법
	/* // 이전 페이지(Table.jsp)로부터 전송된 데이터 수신
	//->su1, su2
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	int num = 1;
	
	
	//[다른사람이 푼 방법]
	String result = "";
	if((su1*su2)!=0){
		result += "<table>";
		for(int i=0; i<su2; i++)
		{
			result += "<tr>";
			for(int j=0; j<su1; j++)
			{
				result += "<td>" + (num++) + "</td>";
			}
			result += "</tr>";
		}
		result += "</table>";
	} */
	
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	int n1=0;
	int n2=0;
	
	//테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int n=0;
	
	try
	{
		// 수신된 데이터 형 변환
		n1 = Integer.parseInt(s1);
		n2 = Integer.parseInt(s2);
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
<title>TableOk.jsp</title>

<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp -> TableOk.jsp</p>
</div>

<div class="layout">

	<!-- [내가 푼 방법] -->
	<%-- <%
	if((su1*su2)!=0){
	%>
	<table>
		<%
		for(int i=0; i<su2; i++)
		{%>
			<tr>
			<%
			for(int j=0; j<su1; j++)
			{%>
				<td>
					<%=num++ %>
				</td>
			<%}%>
			</tr>
		<%
		}%>
	</table>
	<%
	} 
	%> --%>
	
	<!-- [다른사람이 푼 방법] -->
	<%-- <%=result %> --%>
	
	<!-- [함께 푼 방법] -->
	<table>
	<%
	for(int i=0; i<n2; i++)
	{
	%>	
		<tr>
			<%
			for(int j=0; j<n1; j++)
			{
			%>
				<td><%=++n %></td>
			<%
			} 
			%>
		</tr>
	<%	
	}
	%>
	</table>
	
</body>
</html>
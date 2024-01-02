<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 스크립트 영역-> JSP 에서 JAVA 코드를 기술하는(사용하는) 영역
	int a= 10, b=5, c;
	c = a + b;
	
	//-- 스크립 릿 영역에서 수행된 자바 코드의 실행 결과는
	//	 표현식에 의해 HTML 브라우저 영역에 출력된다.

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest002.jsp</title>
</head>
<body>
<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<!-- 표현식 -->
	<h2>합) <%=a %> + <%=b %> = <%=c %></h2>
</div>
<%
	// 스크립 릿 영역
	
	//※ 『out』 은 내장 객체로서 출력 스트림이다.
	out.print("1) 합: " + a + "+" + b + "="+ c);
	out.println("2) 합: " + a + "+" + b + "="+ c);
	out.println("3) 합: " + a + "+" + b + "="+ c);
	/* ** print, println은 HTML document 영역에서 만들어지므로 개행되지 않음 ** */

	out.println("<br></br>");
	out.println("4) 합" + a + "+" + b + "="+ c);
	out.println("5) 합" + a + "+" + b + "="+ c + "<br>");
	/* ** out.println -> 띄어쓰기 됨  ** */
	
	out.println("<br></br>");
	
	String str = String.format("6) 합: %d + %d = %d", a, b, c);
	out.print(str);
	out.print(str);
	
	out.println("<br></br>");

	/* ** \n -> 띄어쓰기됨 ** */
	str = String.format("7) 합: %d + %d = %d\n", a, b, c);
	out.print(str);
	out.print(str);
	
	out.println("<br></br>");

	/* ** <br> -> 개행됨 ** */
	str = String.format("8) 합: %d + %d = %d<br>", a, b, c);
	out.print(str);
	out.print(str);
	
%>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PostTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#sendButton").click(function()
	{
		//alert("확인");
		
		$.post("posttest02ok.do"
				,{su1:$("#su1").val(), oper:$("#oper").val(), su2:$("#su2").val()}
				, function(data)
				{
					$("#result").html(data);
				});
	});	
});
</script>

</head>
<body class="section">
 
<div>
	<h1>jQuery 의 post() 활용 실습2: 두수의 연산</h1>
	<hr />
</div>
 
<!-- 
posttest02.do
PostTest02Controller.java
PostTest02.jsp - + - * /
posttest02ok.do
PostTest02OkController.java
PostTest02_ok.jsp
web.xml
-->
 
<div class="layout">
	<div>
		<input type="text" id="su1" class="txt txtNum" />
		
		<select name="" id="oper">
			<option value="add">덧셈</option>
			<option value="sub">뺄셈</option>
			<option value="mul">곰셈</option>
			<option value="div">나누셈</option>
		</select>
		
		<input type="text" id="su2" class="txt txtNum" />
		<input type="button" value=" = " id="sendButton" class="btn" style="min-width: 40px">
	</div>
 
	<div id="result">
	
	</div>
	<br>
	
	<div>
		<input type="radio" name="rdo" />rdo1
		<input type="radio" name="rdo" />rdo2
	</div>
	<div>
		<input type="checkbox" name="chk" />chk1
		<input type="checkbox" name="chk" />chk2
	</div>
	
	<div><input type="text" /></div>
</div>
 
 
</body>
</html>
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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#sendButton").click(function()
	{
		//alert("확인");
		
		var params = "su1="+$.trim($("#su1").val())
			+ "&oper=" + $.trim($("#oper").val())
			+ "&su2=" + $.trim($("#su2").val());
		
		$.ajax(
		{
			type:"POST"
			, url: "ajaxtest03ok.do"
			, data: params
			, success: function(args)
			{
				$("#result").html(args);
	               
				$("#su1").val("");
                $("#su2").val("");
                $("#su1").focus();
			}
			, beforeSend: function() // true / false      // check~!!!
			{
				return true;
			}
	        , error:function(e)
	        {
	            alert(e.responseText);
	        }
		});
		
	})
});
</script>

</head>
<body class="section">
 
<div>
	<h1>jQuery 의 ajax() 활용 실습3: 두수의 연산</h1>
	<hr />
</div>
 
<!-- 
ajaxtest03.do
AjaxTest03Controller.java
AjaxTest03.jsp - + - * /
ajaxtest03ok.do
AjaxTest03OkController.java
AjaxTest03_ok.jsp
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
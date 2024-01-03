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
<title>GetTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
$(function ()
{
	$("#loadBtn").click(function()
	{
		var nickName = $("#nickName").val();
		
		// ※ 『$.get()』
		//	  『$.get(url, data, callBack);』
		//	   - 매개변수로 전달받은 URL 을 사용하여
		//		 서버에 대한 GET요청을 전송하도록 한다.
		//
		//	  『$.get(url, {속성: 값, 속성: 값, 속성: 값, ...}, callBack)』
		//	   - 전달과정에서 data 는 JSON 형태로 처리할 수 있다. 
		//
		//	  『$.get("요청URL", {이름1:값1, 이름2:값2:}, function (넘겨받은값){ $(선택자).html(넘겨받은값처리); });』
		
		$.get("GetTest01_ok.jsp",{nickName: nickName},function(data)
		{
			$("#resultDiv").html(data);
		});
		
	});
});
</script>

</head>
<body class="section">

<div>
	<h1>jQuery 의 get() 활용 실습</h1>
	<hr>
</div>

<div class="layout">
	<div>
		<input type="text" id="nickName" class="txt" />
		<br />
		<button type="button" id="loadBtn" class="btn">눌러보자</button>
	</div>
	
	<div id="resultDiv">
	</div>
</div>

</body>
</html>
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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function()
{
	$("#sendButton").click(function()
	{
		//alert("확인");
		
		var params = "title="+$.trim($("#title").val())
				+ "&content="+$.trim($("#content").val());
		
		$.ajax(
		{
			type : "POST"
			, url: "ajaxtest04ok.do"
			, data: params
			, dataType: "xml"
			, success: function(args)
			{
				var out = "";
				//out = ">> id=" + $(args)
				$(args).find("recodes").each(function()
				{
					var item = $(this);
					var num = item.attr("id");
					var title = item.find("title").text();
					var content = item.find("content").text();
					
					out += ">> id=" + num + "<br>";
					out += "- title=" + title + "<br>";
					out += "- content=" + content + "<br>";
					
				});
				
				$("#title").val("");
				$("#content").val("");
				$("#title").focus();
				$("#resultDiv").html(out);
			}
			, beforeSend: showRequest
			, error:function(e)
			{
				alert(e.responseText);
			}
			
		});
		
	});
})
function showRequest()
{
	if(!$.trim($("#title").val()))
	{
		alert("이름을 입력해주세요.");
		$("#title").focus();
		return false;
	}
	if(!$.trim($("#content").val()))
	{
		alert("내용을 입력해주세요.");
		$("#content").focus();
		return false;
	}
	return true;
}
</script>
</head>
<body class="section">

<div>
	<h1>jQuery의 ajax() 활용 실습4</h1>
	<hr />
</div>


<div class="layout">
	제목
	<input type="text" id="title" class="txt" /><br><br>
	
	내용
	<input type="text" id="content" class="txt" /><br><br>
	
	<input type="button" value="등록하기" id="sendButton" class="btn" />
</div>
<br>
<div id="resultDiv">
<!-- 
>> id=1
- title=테스트
- content= 반갑습니다.

>> id=2
- title=테스트
- content= 반갑습니다.
 -->

</div>

</body>
</html>
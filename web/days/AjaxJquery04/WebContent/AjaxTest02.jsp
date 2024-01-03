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
<title>AjaxTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function()
		   {
		      $("#sendBtn").click(function()
		      {
		         //alert("확인");
		         
		         var params = "name=" + $.trim($("#name").val())
		            + "&content=" + $.trim($("#content").val());
		         
		         // ※ jQuery 의 ajax() 함수 사용(호출)
		         /*
		         $.ajax();
		         ↓
		         $.ajax(
		         {
		            type : "POST"               	// 데이터 전송 및 페이지 요청 방식
		            , url : "AjaxTest01_ok.jsp"     // 요청 페이지 URL
		            , data : params               	// 요청 페이지(AjaxTest01_ok.jsp)에서 수신하게 되는 데이터
		            , success : 동작            	// 페이지요청 및 데이터전달이 성공했을 때의 처리
		            , beforeSend : 반환값확인      	// 요청 전 확인해야 할 항목 처리 (true / false)
		            , error : 동작               	// 처리과정에서 문제가 발생했을 때의 처리
		         })
		         */
		         
		         $.ajax(
		         {
		            type:"POST"
		            , url:"AjaxTest02_ok.jsp"
		            , data:params               // url 지정 페이지로 넘길 값   // check~!!
		            , dataType: "xml"			//-- check~!!! //**넘겨받는 데이터 타입**
		            //,async:false				//-- 동기
		            , success:function(args)
		            {
		            	var out = "";
		            	out=">> 게시물 갯수: "+ $(args).find("total_dataCount").text() + "<br>";
		            	
		            	$(args).find("comment").each(function()
						{
							var item = $(this);
							var num = item.attr("num");
							var name = item.find("name").text();
							var content = item.find("content").text();
							
							out += "<br>========================"
							out += "<br> 번호: "+ num;
							out += "<br> 이름: "+ name;
							out += "<br> 내용: "+ content;
							out += "<br>========================"
						});
		            	
		               $("#resultDiv").html(out);
		               
		               $("#name").val("");
		               $("#content").val("");
		               $("#name").focus();
		            }
		         , beforeSend:showRequest         // true / false      // check~!!!
		         , error:function(e)
		           {
		            alert(e.responseText);
		           }
		         });
		      
		      });
		   });
		   
		   
		   function showRequest()
		   {
		      if (!$.trim($("#name").val()))
		      {
		         alert("이름을 입력해야 합니다.");
		         $("#name").focus();
		         
		         return false;
		      }
		      
		      if (!$.trim($("#content").val()))
		      {
		         alert("내용을 입력해야 합니다.");
		         $("#content").focus();
		         
		         return false;
		      }
		      
		      return true;
		      
		   }
</script>

</head>
<body class="section">

<div>
	<h1>jQuery의 ajax() 활용 실습2</h1>
	<hr />
</div>

<div class="layout">
	이름
	<input type="text" id="name" class="txt">
	<br><br>
	
	내용
	<textarea name="" id="content" cols="30" rows="10"></textarea>
	<br><br>

	<input type="button" id="sendBtn" value="등록하기" class="btn">
</div>

<div id="resultDiv"></div>

</body>
</html>
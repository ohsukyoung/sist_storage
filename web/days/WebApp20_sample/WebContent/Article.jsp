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
<title>Article.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/article.css">
</head>
<body>
<div id="bbs">
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	<!-- #bbx_title -->
	
	<div id="bbsArticle">
		<div id="bbsArticle_header">
			게시물의 제목입니다.
		</div>
		<!-- #bbsArticle_header -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>정현욱</dd>
				<dt>라인수</dt>
				<dd>23</dd>
			</dl>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd>2023-12-19</dd>
				<dt>조회수</dt>
				<dd>13</dd>
			</dl>
		</div>
		<!-- .bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width:600px">
				<tr>
					<td style="padding: 10px 40px 10px 10px;vertical-align: top;height:150px">
						어쩌구 저쩌구 이러쿵 저러쿵 내용입니다.
					</td>
				</tr>
			</table>
		</div>
		<!-- .bbsArticle_content -->
		
		<div class="bbsArticle_bottomLine">
			이전글 : (104) 취미 관련 게시물
		</div>
		<div class="bbsArticle_bottomLine">
			다음글 : (102) 날씨 관련 게시물
		</div>
	</div>
	<!-- #bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		From: 211.238.142.151
	</div><!-- .bbsArticle_noLine -->
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2">
			<input type="button" value="삭제" class="btn2">
			<!-- onclick="deleteCheck()"> -->
		</div>
		<!-- #leftFooter -->
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2">
		</div>
		<!-- #rightFooter -->
	</div><!-- #bbsArticle_footer -->
	
</div>
<!-- #bbs -->
 
</body>
</html>
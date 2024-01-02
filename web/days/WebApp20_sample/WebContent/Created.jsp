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
<title>Created.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">
</head>
<body>
 
<div id="bbs">
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	<!-- #bbs_title -->
 
	<form action="" method="post" name="myForm">
		<div id="bbsCreated">
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제목</dt>
					<dd><input type="text" name="subject" size="64" maxlength="100" class="boxTF" /></dd>
				</dl>
			</div>
			<!-- #bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작성자</dt>
					<dd>
						<input type="text"	name="name" size="35" maxlength="20" class="boxTF">
					</dd>
				</dl>
			</div><!-- .bbxCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일
						<dd><input type="email" name="email" size="35" maxlength="50" class="boxTF" /></dd>
					</dt>
				</dl>
			</div><!-- .bbxCreated_bottomLine -->
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내 용</dt>
					<dd><textarea name="content" id="" cols="63" rows="12" class="boxTA"></textarea></dd>
				</dl>
			</div>
			<!-- #bbsCreated_content -->
			
			<div class="bbsCreated_noLine">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="password" name="pwd" size="35" maxlength="10" class="boxTF">
						&nbsp;<span style="font-size: 6pt">(게시물 수정 및 삭제 필요)</span>
					</dd>
				</dl>
			</div><!-- .bbsCreated_noLine -->
			
			<div id="bbsCreated_footer">
				<input type="button" value="등록하기" class="btn2" 
				onclick="sendIt()">
				<input type="reset" value="다시입력" class="btn2"
				onclick="document.myForm.subject.focus()">
				<input type="button" value="작성취소" class="btn2" 
				 onclick="javascript:location.href='<%=cp%>/List.jsp'">
			</div>
			<!-- #bbsCreated_footer -->
		</div>
	</form>
</div>
<!-- #bbs -->
 
</body>
</html>
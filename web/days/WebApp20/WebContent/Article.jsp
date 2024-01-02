<%@page import="com.test.ajax.BoardDTO"%>
<%@page import="com.test.ajax.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지(List.jsp)로 부터 넘어온 데이터 수신
	// 	-> num, pageNum
	String pageNum = request.getParameter("pageNum");
	String strNum = request.getParameter("num");
	int num = Integer.parseInt(strNum);
	
	// 해당 게시물 조회수 증가
	dao.updateHitCount(num);
	
	// 이전, 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);	// ??	103
	int nextNum = dao.getNextNum(num);		// 		103 ??
	
			
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	
	if(nextNum != -1)
		dtoNext = dao.getReadData(nextNum);
	
	// 해당 게시물의 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 게시물 본문 라인 수 확인
	int lineSu = dto.getContent().split("\n").length;
	
	// 게시물 내용
	dto.setContent(dto.getContent().replaceAll("\n","<br>"));
	//-- 즉, 
	//	안녕하세요\n반갑습니다.\n화요일입니다.\n기운냅시다\n안녕히가세요.
	//	안녕하세요<br>반갑습니다.<br>화요일입니다.<br>기운냅시다<br>안녕히가세요.
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
<script type="text/javascript">
function deleteCheck()
{
	//alert("함수 확인!");
	var str ="";
	<%-- javascript:location.href='<%=cp %>/Deleted_ok.jsp?num=<%=dto.getNum()%>' --%>
	
	str = prompt("비밀번호 입력:");
		
	if(str == '<%=dto.getPwd()%>')
	{
		/* alert("비밀번호 일치"); */
		location.href='<%=cp %>/Deleted_ok.jsp?num=<%=dto.getNum()%>';
	}else{
		alert("비밀번호 불일치");
	}
	
	<%-- location.href='<%=cp %>/Deleted_ok1.jsp'; --%>
	
}

</script>
</head>
<body class="section">

<div id="bbs">
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	<!-- #bbx_title -->
	
	<div id="bbsArticle">
		<div id="bbsArticle_header">
			<!-- 게시물의 제목입니다. -->
			<%=dto.getSubject() %>
		</div>
		<!-- #bbsArticle_header -->
		
		<div class="bbsArticle_bottomLine">
			<!-- <dl>
				<dt>작성자</dt>
				<dd>정현욱</dd>
				<dt>라인수</dt>
				<dd>23</dd>
			</dl> -->
			<dl>
				<dt>작성자</dt>
				<dd><%=dto.getName() %></dd>
				<dt>라인수</dt>
				<dd><%=lineSu %></dd>
			</dl>
		</div>
		<!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_bottomLine">
			<!-- <dl>
				<dt>등록일</dt>
				<dd>2023-12-19</dd>
				<dt>조회수</dt>
				<dd>13</dd>
			</dl> -->
			<dl>
				<dt>등록일</dt>
				<dd><%=dto.getCreated() %></dd>
				<dt>조회수</dt>
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div>
		<!-- .bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width:600px">
				<tr>
					<td style="padding: 10px 40px 10px 10px;vertical-align: top;height:150px">
						<!-- 어쩌구 저쩌구 이러쿵 저러쿵 내용입니다. -->
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div>
		<!-- .bbsArticle_content -->
		
		<div class="bbsArticle_bottomLine">
			<!-- 이전글 : (104) 취미 관련 게시물 -->
			<%
			if(beforeNum != -1)
			{
			%>	
				<!-- 이전글: 있음 -->
				<%-- 이전글: (<%=beforeNum %>) <%=dtoBefore.getSubject() %> --%>
				이전글: (<%=beforeNum %>) <a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum %>&num=<%=beforeNum%>"><%=dtoBefore.getSubject() %></a>
			<%
			}else
			{
			%>
				이전글: 없음
			<%
			}
			%>
		</div>
		<!-- .bbsArticle_bottomLine -->
		<div class="bbsArticle_bottomLine">
			<!-- 다음글 : (102) 날씨 관련 게시물 -->
			<%
			if(nextNum != -1)
			{
			%>
				<!-- 다음글: 있음 -->
				<%-- 다음글: (<%=nextNum %>) <%=dtoNext.getSubject() %> --%>
				다음글: (<%=nextNum %>) <a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum %>&num=<%=nextNum%>"><%=dtoNext.getSubject() %></a>
			<%
			}else
			{
			%>
				다음글: 없음
			<%
			}
			%>
		</div>
		<!-- .bbsArticle_bottomLine -->
	</div>
	<!-- #bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		<!-- From: 211.238.142.151 -->
		From: <%=dto.getIpAddr() %>
	</div><!-- .bbsArticle_noLine -->
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&status=1'">
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&status=2'">
			<!-- onclick="deleteCheck()"> -->
		</div>
		<!-- #leftFooter -->
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2"
			onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'">
		</div>
		<!-- #rightFooter -->
	</div><!-- #bbsArticle_footer -->
	
</div>
<!-- #bbs -->

</body>
</html>
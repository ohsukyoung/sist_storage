
# 7. JSP, JAVA, SQL 통합
## 7.1. [이름, 국어점수, 영어점수, 수학점수를 입력받아 총점과 평균을 계산하여 리스트를 출력]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/d9fd8210-9ae4-4d51-9802-202a0040eb2a)

### 7.1.1. WebApp09_scott.sql
``` sql
SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 기존 테이블 제거
DROP TABLE TBL_SCORE;
--==>>Table TBL_SCORE이(가) 삭제되었습니다.

--○ 실습 테이블 생성(TBL_SCORE)
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
);
--==>> Table TBL_SCORE이(가) 생성되었습니다.

--○ 생성된 테이블에 제약조건 추가
ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID);
--==>> Table TBL_SCORE이(가) 변경되었습니다.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100);
--==>> Table TBL_SCORE이(가) 변경되었습니다.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100);
--==>> Table TBL_SCORE이(가) 변경되었습니다.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100);
--==>> Table TBL_SCORE이(가) 변경되었습니다.


--○ 기존 시퀀스 제거
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ이(가) 삭제되었습니다.


--○ 실습 관련 시퀀스 다시 생성
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ이(가) 생성되었습니다.


--○ 리스트 조회 쿼리문 구성
--     (번호, 이름, 국어점수, 영어점수, 수학점수, 총점, 평균)
SELECT SID, NAME, KOR , ENG, MAT
    , (KOR+ENG+MAT) AS TOT
    , (KOR+ENG+MAT)/3 AS AVG
FROM TBL_SCORE
ORDER BY SID;
--==>> 한 줄 구성
SELECT SID, NAME, KOR , ENG, MAT , (KOR+ENG+MAT) AS TOT , (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID;


--○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '임하성', 90, 80, 70);
--==> 한 줄 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '임하성', 90, 80, 70)
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ 샘플 데이터 추가 입력
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '이윤수', 80, 70, 60);
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT *
FROM TBL_SCORE;
--==>>
/*
1	임하성	90	80	70
2	이윤수	80	70	60
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.
```
### 7.1.2. ScoreList.jsp
``` html
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str ="";
	
	Connection conn = DBConn.getConnection();
	
	String sql = "SELECT SID, NAME, KOR , ENG, MAT "
			+ ", (KOR+ENG+MAT) AS TOT , (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs  = stmt.executeQuery(sql);
	
	/* <table>
	<tr>
		<th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>
	<tr>
	<tr>
		<td>1</td><td>임하성</td><td>90</td><td>60</td><td>70</td><td>xxx</td><td>xx.x</td>
	</tr>
</table> */
	
	str += "<table class ='table' style='width: 100%;'>";
	str += "<tr>";
	str += "<th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>";
	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td>"+rs.getString("SID")+"</td>";
		str += "<td>"+rs.getString("NAME")+"</td>";
		str += "<td>"+rs.getString("KOR")+"</td>";
		str += "<td>"+rs.getString("ENG")+"</td>";
		str += "<td>"+rs.getString("MAT")+"</td>";
		str += "<td>"+rs.getString("TOT")+"</td>";
		str += "<td>"+String.format("%.1f",rs.getDouble("AVG"))+"</td>";
		str += "</tr>";
			
	}
	str += "</table>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	[id^="err"] {display:none;}
</style>
</head>
<body class="section">

<script type="text/javascript">
function scoreInsert()
{
	var uName = document.getElementById("userName");
	var korStr = document.getElementById("userKor");
	var engStr = document.getElementById("userEng");
	var matStr = document.getElementById("userMat");
	
	var uKor = Number(korStr);
	var uEng = Number(engStr);
	var uMat = Number(matStr);
	
	var eName = document.getElementById("errName");
	var eKor = document.getElementById("errKor");
	var eEng = document.getElementById("errEng");
	var eMat = document.getElementById("errMat");
	
	eName.style.display = "none";
	eName.style.display = "none";
	eName.style.display = "none";
	eName.style.display = "none";
	
	/* -------------------------------------------- */
	
	if(uName.value == "" || uName.value == null)
	{
		eName.style.display = "inline";
		
		return false;
	}
		
	if(uKor.value<0 || uKor.value>100 || korStr.value== "")
	{	
		eKor.style.display = "inline";
		return false;
	}
	
	 if(uEng.value<0 || uEng.value>100 || engStr.value== "")
	{	
		eEng.style.display = "inline";
		return false;
	}
	
	if(uMat.value<0 || uMat.value>100 || matStr.value== "")
	{	
		eMat.style.display = "inline";
		return false;
	}
	
	return true;
}
</script>

<!-- ○ WebApp09
	
	- 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
		총점과 평균을 계산하여 리스트를 출력해줄 수 있는 프로그램을 구현한다.
	- 리스트 출력 시 번호 오름 차순 정렬하여 출력할 수 있도록 한다.
	- 데이터베이스 연동하여 처리한다.(TBL_SCORE, SCORESEQ 활용)
	- 즉, 성적처리 프로그램을 데이터베이스 연동하여 JSP로 구성할 수 있도록 한다.
	
	데이터베이스 연결 및 데이터 처리
	---------------------------------------------------
	성적 처리
	
	이름(*)		[ textbox ] -> 이름 입력 확인
	국어점수	[ textbox ] -> 0~100 사이의 정수가 입력되었는지 확인
	영어점수	[ textbox ] -> 0~100 사이의 정수가 입력되었는지 확인
	수학점수	[ textbox ] -> 0~100 사이의 정수가 입력되었는지 확인

	< 성적 추가 > 		-> button
	
	번호	이름	국어점수	영어점수	수학점수	총점	평균
	1		임하성	90			80			70			xxx		xx.x
	2		이윤수	90			80			70			xxx		xx.x
	
	○ WebApp09_scott.sql
		ScoreList.jsp
		ScoreInsert.jsp -> 사용자 안만남
		com.util.DBConn.java

 -->
 
<div>
	<h1>성적 리스트를 출력 프로그램</h1>
	<hr>
</div>

<div class="layout">
	<form action="ScoreInsert.jsp" method="post" onsubmit="return scoreInsert()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span id="errName">이름을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="userKor" name="userKor">
					<span id="errKor">국어점수(0~100)</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="userEng" name="userEng">
					<span id="errEng">영어점수(0~100)</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="userMat" name="userMat">
					<span id="errMat">수학점수(0~100)</span>
				</td>
			</tr>
		</table>
		<div class="btn_box">
			<button type="submit" id="resultBtn" name="resultBtn" class="btn">성적 추가</button>
		</div>
	</form>
	<div class="result_box">
		<!-- <table>
			<tr>
				<th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>
			<tr>
			<tr>
				<td>1</td><td>임하성</td><td>90</td><td>60</td><td>70</td><td>xxx</td><td>xx.x</td>
			</tr>
		</table> -->
		<%=str %>
	</div>
</div>

</body>
</html>
```
### 7.1.3. ScoreInsert.jsp
``` html
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//ScoreInsert.jsp
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("userName");
	int uKor = Integer.parseInt(request.getParameter("userKor"));
	int uEng = Integer.parseInt(request.getParameter("userEng"));
	int uMat = Integer.parseInt(request.getParameter("userMat"));
	
	Connection conn = DBConn.getConnection();
	
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
			+ " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)",uName, uKor, uEng, uMat);
	
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result <1)
	{
		response.sendRedirect("Error.jsp");
	}
	else
	{
		response.sendRedirect("ScoreList.jsp");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreInsert.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	
</body>
</html>
```

## 7.2. [데이터베이스 연동 회원관리 실습]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/c002fc3c-c4c4-4dcd-8434-e569400c20d3)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/743af3f7-cfb0-400f-8da0-fe9a61f80bf9)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/9f82e9a0-4231-4d3b-b74d-e5cff6db6f30)


### 7.2.1. WebApp10_scott.sql
``` sql
SELECT USER
FROM DUAL;
--==>> SCOTT
 
SELECT *
FROM TAB;
 
PERGE RECYCLEBIN;
 
SELECT *
FROM TBL_MEMBER;
 
DESC TBL_MEMBER;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(30) 
TEL           VARCHAR2(40) 
*/
 
TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 잘렸습니다.
 
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ이(가) 삭제되었습니다.
 
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.
 
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL, '강혜성', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL, '김동민', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL, '이주형', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL, '엄재용', '010-4444-4444');
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL, '김지민', '010-5555-5555');
--==>> 1 행 이(가) 삽입되었습니다.*5
 
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>> 
/*
1	강혜성	010-1111-1111
2	김동민	010-2222-2222
3	이주형	010-3333-3333
4	엄재용	010-4444-4444
5	김지민	010-5555-5555
*/
 
COMMIT;
--==>> 커밋 완료.
 
--○ 인원 수확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 5
```
### 7.2.2. MemberDAO.java
``` java
/* ==========================================
	MemberDAO.java
	- 데이터베이스 엑션 처리 전용 객체 활용
=============================================*/
package com.test;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
 
import com.util.DBConn;
 
public class MemberDAO
{
	// 주요 속성 구성
	private Connection conn;
 
	/*
	 * public Connection getConn() { return conn; }
	 */
	
	
	// 데이터베이스 연결 -> 생성자 형태로 정의
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드 정의
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBER(SID,NAME,TEL)"
				+ " VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 데이터 출력 메소드 정의
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 전체 인원 수 확인을 위한 메소드 정의
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드 정의
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
```
### 7.2.3. MemberDTO.java
``` java
/* ==========================================
	MemberDTO.java
	- 데이터 보관 및 전송 객체 활용
=============================================*/
package com.test;
 
public class MemberDTO
{
	// 주요 속성 구성
	private String sid, name, tel;
	//-- TBL_MEMBER 컬럼 구조
 
	// getter / setter 구성
	public String getSid()
	{
		return sid;
	}
 
	public void setSid(String sid)
	{
		this.sid = sid;
	}
 
	public String getName()
	{
		return name;
	}
 
	public void setName(String name)
	{
		this.name = name;
	}
 
	public String getTel()
	{
		return tel;
	}
 
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	
	
}
```
### 7.2.4. Memberinsert.jsp
``` html
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터 입력 액션 처리 페이지
	
	// 이전 페이지(MemberList.jsp)로부터 넘어온 데이터 수신
	//-> userName, userTel
	
	request.setCharacterEncoding("UTF-8");
	//-- 한글 데이터가 깨지지 않도록 인코딩 설정
	
	// 위 코드를 수행한 후 데이터 수신
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		// MemberDTO 구성
		MemberDTO member = new MemberDTO();
		member.setName(userName);
		member.setTel(userTel);
		
		// dao 의 add() 메소드 호출 -> insert 쿼리문 수행
		dao.add(member);
		
		// 필요하다면 add()메소드의 반환값을 받아
		// insert 액션의 정상 처리 여부 확인 후 추가 코드 구성 가능~!!!
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// URL 주소가 적혀있는 쪽지를 사용자에게 전달
	//-> 이 주소를 다시 요청해서 찾아갈 수 있도록 하세요~!!!
	//	(그럼 입력값이 반영된 결과물을 확인할 수 있다.)
	response.sendRedirect("MemberList.jsp");
	
	// 아래 보여주는 페이지는 모두 삭제
%>
```
### 7.2.5. MemberList.jsp
``` html
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 : ";	// 5명</span>
	
	try
	{
		dao = new MemberDAO();
		
		memberCount += dao.count() + "명</span>";
		str.append("<table>");
		str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th></tr>");
		
		// MemberDAO의 lists() 메소드 호출
		//-- 반복문을 통해 <table> 하위 엘리먼트 생성
		for(MemberDTO member: dao.lists())
		{
			str.append("<tr>");
			str.append("<td>"+member.getSid()+"</td>");
			str.append("<td>"+member.getName()+"</td>");
			str.append("<td>"+member.getTel()+"</td>");
		}
		str.append("</table>");
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터 베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
	.errMsg {display:none; color:red;}
</style>
 
<script type="text/javascript">
function formCheck()
{
	//확인
	//alert("함수 호출~!!!");
	
	var userName = document.getElementById("userName");
	var userMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	if(userName.value == "")
	{
		nameMsg.style.display = "inline";
		userName.focus();
		return false;
	}
	
	//return false;
	return true;
}
</script>
 
</head>
<body class="section">
 
<div>
	<h1>데이터베이스 연동 회원관리 실습</h1>
	<hr>
</div>
 
<div class="layout">
	<p>DAO, DTO 개념 적용</p>
	<form class="tbl_box" action="MemberInsert.jsp" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn" style="width: 200px;">회원 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<!-- <div class="tbl_box">
		<span id="memberCount">전체 인원 수 : 5명</span><br><br>
		<table>
			<tr>
				<th>번호</th><th>이름</th><th>전화번호</th>
			</tr>
			<tr>
				<td>1</td>
				<td>고길동</td>
				<td>010-1111-1111</td>
			</tr>
			<tr>
				<td>2</td>
				<td>둘리</td>
				<td>010-2222-2222</td>
			</tr>
			<tr>
				<td>3</td>
				<td>도우너</td>
				<td>010-3333-3333</td>
			</tr>
			<tr>
				<td>4</td>
				<td>희동이</td>
				<td>010-4444-4444</td>
			</tr>
			<tr>
				<td>5</td>
				<td>마이콜</td>
				<td>010-5555-5555</td>
			</tr>
		</table>
	</div> -->
	<!-- 전체 인원수 확인 -->
	<%=memberCount %>
	
	<!-- 번호 이름 전화번호 항목에 대한 리스트 구성 -->
	<%=str.toString() %>
</div>
 
 
 
</body>
</html>
```

## 7.3. [성적 리스트 출력 프로그램(ver.2)]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/668ccd72-dd1c-4e2c-bee4-4f0f26494118)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/748a4330-b31c-4b5d-9f19-3c03c12af2ea)


### 7.3.1. WebApp11_scott.sql
>> 9와 동일<<
### 7.3.2. ScoreDTO.Java
``` java
package com.test;
 
public class ScoreDTO
{
	// 주요 속성 구성
	private String name;
	private int sid, kor, eng, mat, tot;
	private double avg;
	
	// getter / setter 구성
	public String getName()
	{
		return name;
	}
	public int getSid()
	{
		return sid;
	}
	public void setSid(int sid)
	{
		this.sid = sid;
	}
	public int getTot()
	{
		return tot;
	}
	public void setTot(int tot)
	{
		this.tot = tot;
	}
	public double getAvg()
	{
		return avg;
	}
	public void setAvg(double avg)
	{
		this.avg = avg;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getKor()
	{
		return kor;
	}
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	public int getEng()
	{
		return eng;
	}
	public void setEng(int eng)
	{
		this.eng = eng;
	}
	public int getMat()
	{
		return mat;
	}
	public void setMat(int mat)
	{
		this.mat = mat;
	}
}
```
### 7.3.3. ScoreDAO.Java
``` java
package com.test;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
 
import com.util.DBConn;
 
public class ScoreDAO
{
	private Connection conn;
	
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+ " VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR , ENG, MAT"
				+ " , (KOR+ENG+MAT) AS TOT"
				+ " , (KOR+ENG+MAT)/3 AS AVG"
				+ " FROM TBL_SCORE ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery(); 
		
		while(rs.next())
		{
			ScoreDTO score = new ScoreDTO();
			
			score.setSid(rs.getInt("SID"));
			score.setName(rs.getString("NAME"));
			score.setKor(rs.getInt("KOR"));
			score.setEng(rs.getInt("ENG"));
			score.setMat(rs.getInt("MAT"));
			score.setTot(rs.getInt("TOT"));
			score.setAvg(rs.getDouble("AVG"));
			
			result.add(score);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
```
### 7.3.4. ScoreList.jsp
``` html
<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
 
	try
	{
		dao = new ScoreDAO();
		
		// 출력
		str.append("<table>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th><tr>");
		
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>"+score.getSid()+"</td>");			
			str.append("<td>"+score.getName()+"</td>");			
			str.append("<td>"+score.getKor()+"</td>");			
			str.append("<td>"+score.getEng()+"</td>");			
			str.append("<td>"+score.getMat()+"</td>");			
			str.append("<td>"+score.getTot()+"</td>");			
			str.append("<td>"+String.format("%.1f",score.getAvg())+"</td>");			
			str.append("</tr>");			
		}
		str.append("</table>");
		
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
<title>ScoreList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
function scoreInsert()
{
	//확인
	//alert("연결 성공");
	
	var userName 	= document.getElementById("userName");
	var userKor 	= document.getElementById("userKor");
	var userEng 	= document.getElementById("userEng");
	var userMat 	= document.getElementById("userMat");
	
	var kor = Number(userKor.value);
	var eng = Number(userEng.value);
	var mat = Number(userMat.value);
	
	var errName	= document.getElementById("errName");
	var errKor	= document.getElementById("errKor");
	var errEng	= document.getElementById("errEng");
	var errMat	= document.getElementById("errMat");
	
	errName.style.display = "none";
	errKor.style.display = "none";
	errEng.style.display = "none";
	errMat.style.display = "none";
	
	if(userName.value=="")
	{
		errName.style.display = "inline";
		return false;
	}
	
	if(userKor.value=="" || kor<0 || kor>100)
	{
		errKor.style.display = "inline";
		return false;
	}
 
	if(userEng.value=="" || eng<0 || eng>100)
	{
		errEng.style.display = "inline";
		return false;
	}
 
	if(userMat.value=="" || mat<0 || mat>100)
	{
		errMat.style.display = "inline";
		return false;
	}
	
	//return false;
	return true;
}
</script>
</head>
<body class="section">
 
<div>
	<h1>성적 리스트를 출력 프로그램</h1>
	<hr>
</div>
 
<div class="layout">
	<form action="ScoreInsert.jsp" method="post" onsubmit="return scoreInsert()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span id="errName" class="errMsg">이름을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="userKor" name="userKor">
					<span id="errKor" class="errMsg">국어점수(0~100)</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="userEng" name="userEng">
					<span id="errEng" class="errMsg">영어점수(0~100)</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="userMat" name="userMat">
					<span id="errMat" class="errMsg">수학점수(0~100)</span>
				</td>
			</tr>
		</table>
		<div class="btn_box">
			<button type="submit" id="resultBtn" name="resultBtn" class="btn">성적 추가</button>
		</div>
	</form>
	<div class="result_box">
		<!-- <table>
			<tr>
				<th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>
			<tr>
			<tr>
				<td>1</td><td>임하성</td><td>90</td><td>60</td><td>70</td><td>xxx</td><td>xx.x</td>
			</tr>
		</table> -->
		<%=str %>
	</div>
</div>
 
</body>
</html>
```
### 7.3.5. ScoreInsert.jsp
``` html
<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 
	String userName = request.getParameter("userName"); 
	String userKor = request.getParameter("userKor");
	String userEng = request.getParameter("userEng");
	String userMat = request.getParameter("userMat");
	
	int kor = Integer.parseInt(userKor);
	int eng = Integer.parseInt(userEng);
	int mat = Integer.parseInt(userMat);
	
	// 입력
	ScoreDAO dao = null;
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO dto = new ScoreDTO();
		dto.setName(userName);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		
		dao.add(dto);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("ScoreList.jsp");
%>
```

## 7.4. [회원 성적 관리 및 출력 페이지(ver.2)]

### 7.4.1. WebApp12_scott.sql
``` sql
SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 기존 테이블 삭제
DROP TABLE TBL_MEMBER;
--==>>Table TBL_MEMBER이(가) 삭제되었습니다.


--○ 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)    NOT NULL
, TEL   VARCHAR2(30)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>>Table TBL_NUMBER이(가) 생성되었습니다.


--○ 기존 시퀀스 제거
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ이(가) 삭제되었습니다.


--○ 시퀀스 생성
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>>Sequence MEMBERSEQ이(가) 생성되었습니다.


--○ 샘플 데이터 입력(TBL_MEMBER)
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '노은하', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '박가영', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '채다선', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김수환', '010-4444-4444');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김다슬', '010-5555-5555');
--==>> 1 행 이(가) 삽입되었습니다. * 5


SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>
/*
1	노은하	010-1111-1111
2	박가영	010-2222-2222
3	채다선	010-3333-3333
4	김수환	010-4444-4444
5	김다슬	010-5555-5555
*/


--○ 인원수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 5


--○ 커밋
COMMIT;


--○ 회원 정보 검색(SID)
SELECT SID, NAME, TEL
FROM TBL_MEMBER
WHERE SID=1;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=1
;
--==>> 1	노은하	010-1111-1111


--○ 업데이트
UPDATE TBL_MEMBER
SET NAME='노은하', TEL='010-1100-1100'
WHERE SID=1;
--> 한 줄 구성
UPDATE TBL_MEMBER SET NAME='노은하', TEL='010-1100-1100' WHERE SID=1
;
--==>> 1 행 이(가) 업데이트되었습니다.


--○ 롤백
ROLLBACK;


--○ 회원 정보 삭제
DELETE
FROM TBL_MEMBER
WHERE SID=1;
--> 한 줄 구성
DELETE FROM TBL_MEMBER WHERE SID=1
;


--○ 롤백
ROLLBACK;


--○ 기존 테이블 제거
DROP TABLE TBL_SCORE;


--------------------------------------------------------------------------------
--○ 테이블 생성(TBL_MEMBERSCORE)
CREATE TABLE TBL_MEMBERSCORE
( SID NUMBER
, KOR NUMBER(3)
, ENG NUMBER(3)
, MAT NUMBER(3)
, CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_MEMBER(SID)
);
--==>> Table TBL_MEMBERSCORE이(가) 생성되었습니다.


--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(1, 90, 80, 70);
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(2, 80, 70, 60);
--==>> 1 행 이(가) 삽입되었습니다. *2


--○ 확인
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE
ORDER BY SID;
--> 한 줄 구성
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE ORDER BY SID
;
--==>>
/*
1	90	80	70
2	80	70	60
*/


--○ 커밋
COMMIT;


--○ 입력된 성적 데이터 갯수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE
;
--==> 2


--○ 성적 데이터 수정
UPDATE TBL_MEMBERSCORE
SET KOR=91, ENG=81, MAT=71
WHERE SID=1;
--> 한 줄 구성
UPDATE TBL_MEMBERSCORE SET KOR=91, ENG=81, MAT=71 WHERE SID=1
;
--==>> 1 행 이(가) 업데이트되었습니다.


--○ 확인
SELECT *
FROM TBL_MEMBERSCORE;
--==>>
/*
1	91	81	71
2	80	70	60
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 성적 데이터 삭제
DELETE
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1 행 이(가) 삭제되었습니다.


--○ 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ 전체 리스트 조회 쿼리문 구성
SELECT M.SID, M.NAME, M.TEL
    , S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID;
--==>>
/*
1	노은하	010-1111-1111	91	81	71
2	박가영	010-2222-2222	80	70	60
*/


--○ 전체 리스트 조회 쿼리문 구성 -> 개선 -> LEFT JOIN
SELECT M.SID, M.NAME, M.TEL
    , S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
1	노은하	010-1111-1111	91	81	71
2	박가영	010-2222-2222	80	70	60
3	채다선	010-3333-3333	(NULL) (NULL) (NULL)
4	김수환	010-4444-4444	(NULL) (NULL) (NULL)	
5	김다슬	010-5555-5555	(NULL) (NULL) (NULL)
*/


--○ 전체 리스트 조회 쿼리문 구성 -> 개선 -> LEFT JOIN -> 개선 -> NVL()
SELECT M.SID, M.NAME, M.TEL
    , NVL(S.KOR, -1) AS KOR
    , NVL(S.ENG, -1) AS ENG
    , NVL(S.MAT, -1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
1	노은하	010-1111-1111	91	81	71
2	박가영	010-2222-2222	80	70	60
3	채다선	010-3333-3333	-1	-1	-1
4	김수환	010-4444-4444	-1	-1	-1
5	김다슬	010-5555-5555	-1	-1	-1
*/


--○ 전체 리스트 조회 전용 뷰 생성(VIEW_MEMBERSCORE)
CREATE OR REPLACE VIEW VIEW_MEMBERSCORE
AS
SELECT M.SID, M.NAME, M.TEL
    , NVL(S.KOR, -1) AS KOR
    , NVL(S.ENG, -1) AS ENG
    , NVL(S.MAT, -1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>> View VIEW_MEMBERSCORE이(가) 생성되었습니다.


--○ 생성한 뷰(VIEW_MEMBERSCORE)를 활용한 리스트 조회
SELECT SID, NAME, KOR, MAT
    , (KOR+ENG+MAT) AS TOT
    , (KOR+ENG+MAT)/3 AS AVG
    , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
FROM VIEW_MEMBERSCORE
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID
;
--==>>
/*
1	노은하	91	81	71	243	81	1
2	박가영	80	70	60	210	70	2
3	채다선	-1	-1	-1	-3	-1	3
4	김수환	-1	-1	-1	-3	-1	3
5	김다슬	-1	-1	-1	-3	-1	3
*/


--○ 생성한 뷰(VIEW_MEMBERSCORE)를 활용한 번호 검색
SELECT SID, NAME, KOR, ENG, MAT
FROM VIEW_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=1
;

--==>> 1	노은하	91	81	71


--○ 참조 데이터 레코드 수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1
-- 1이 나올 경우 -> 성적 처리 됨
-- 0이 나올 경우 -> 성적 처리 되지 않음

```
### 7.4.2. MemberDAO.java
``` java
/* =================================================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 클래스
		(TBL_MEMBER 테이블 전용 DAO)
==================================================== */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 회원 리스트 전체 출력 담당 메소드
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 전체 회원 수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료(해제) 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
	// 메소드 추가
	// 번호 검색 담당 메소드(번호를 통해 회원 데이터 조회)
	//-- 현재... 번호(sid)는 TBL_MEMBER 테이블에서 식별자의 역할을 수행할 수 있으며
	//	이로 인해 번호를 통한 검색 결과는 한 명의 회원일 수 밖에 없기 때문에 반환 자료형은 MemberDTO로 구성한다.
	public MemberDTO searchMember(String sid) throws SQLException
	// 여러가지를 검색한 결과는 -> ArrayList
	// 한가지만 얻어낼 것이므로 
	{
		MemberDTO result = new MemberDTO();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(sid));
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setTel(rs.getString("TEL"));
		}
		rs.close();
		pstmt.close();		
		
		return result;
	}
	
	// 메소드 추가
	// 회원 데이터 수정 담당 메소드
	public int modify(MemberDTO member) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE TBL_MEMBER SET NAME=?, TEL=? WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());
		pstmt.setInt(3, Integer.parseInt(member.getSid()));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();		
		
		return result;
	}
	
	// 메소드 추가
	// 회원 데이터 삭제 담당 메소드
	public int remove(String sid) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM TBL_MEMBER WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(sid));
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 메소드 추가
	// 자식 테이블의 참조 데이터 레코드 수 확인
	public int refCount(String sid) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(sid));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	

}
```
### 7.4.3. MemberDTO.java
``` java
/* =================================================
	MemberScoreDTO.java
	- 객체 전용(데이터 보관 및 전송) -> JAVA Bean
==================================================== */
package com.test;

public class MemberDTO
{
	// 주요 속성(프로퍼티 구성)
	private String sid, name, tel;	//-- 번호, 이름, 전화번호

	// getter / setter 구성
	public String getSid()
	{
		return sid;
	}

	public void setSid(String sid)
	{
		this.sid = sid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}
	
	
}

```
### 7.4.4. MemberScoreDAO.java
``` java
/* =================================================
	MemberScoreDAO.java
	- 데이터베이스 액션 처리 전용 클래스
		(TBL_MEMBERSCORE 테이블 전용 DAO)
==================================================== */

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberScoreDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드(성적 데이터 입력)
	public int add(MemberScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(dto.getSid()));
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result = pstmt.executeUpdate();
		pstmt.close();		
		
		return result;
	}
	
	// 성적 전체 리스트 출력 담당 메소드(성적 데이터 전체 출력)
	public ArrayList<MemberScoreDTO> lists() throws SQLException
	{
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		String sql ="SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR+ENG+MAT) AS TOT"
				+ ", (KOR+ENG+MAT)/3 AS AVG"
				+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM VIEW_MEMBERSCORE ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberScoreDTO score =  new MemberScoreDTO();
			score.setSid(rs.getString("SID"));
			score.setName(rs.getString("NAME"));
			score.setKor(rs.getInt("KOR"));
			score.setEng(rs.getInt("ENG"));
			score.setMat(rs.getInt("MAT"));
			score.setTot(rs.getInt("TOT"));
			score.setAvg(rs.getDouble("AVG"));
			score.setRank(rs.getInt("RANK"));
			
			result.add(score);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료 해제
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 메소드 추가
	// 번호 검색 담당 메소드
	public MemberScoreDTO search(String sid) throws SQLException
	{
		MemberScoreDTO result = new MemberScoreDTO();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(sid));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setKor(rs.getInt("KOR"));
			result.setEng(rs.getInt("ENG"));
			result.setMat(rs.getInt("MAT"));
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 메소드 추가
	// 성적 데이터 수정 담당 메소드
	public int modify(MemberScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql="UPDATE TBL_MEMBERSCORE SET KOR=?, ENG=?, MAT=? WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getKor());
		pstmt.setInt(2, dto.getEng());
		pstmt.setInt(3, dto.getMat());
		pstmt.setInt(4, Integer.parseInt(dto.getSid()));
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 메소드 추가
	// 성적 데이터 삭제 담당 메소드
	public int remove(String sid) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM TBL_MEMBERSCORE WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(sid));
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	
	
}

```
### 7.4.5. MemberScoreDTO.java
``` java
/* =================================================
	MemberScoreDTO.java
	- 객체 전용(데이터 보관 및 전송) -> JAVA Bean
==================================================== */
package com.test;

public class MemberScoreDTO
{
	// VIEW_MEMBERSCORE 조회 항목을 기준으로
	// 프로퍼티(property) 구성
	private String sid, name;	//-- 번호, 이름
	private int kor, eng, mat;	//-- 국어점수, 영어점수, 수학점수
	private int tot, rank;		//-- 총점, 석차(등수)
	private double avg;			//-- 평균
	
	// getter / setter 구성
	public String getSid()
	{
		return sid;
	}
	public void setSid(String sid)
	{
		this.sid = sid;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getKor()
	{
		return kor;
	}
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	public int getEng()
	{
		return eng;
	}
	public void setEng(int eng)
	{
		this.eng = eng;
	}
	public int getMat()
	{
		return mat;
	}
	public void setMat(int mat)
	{
		this.mat = mat;
	}
	public int getTot()
	{
		return tot;
	}
	public void setTot(int tot)
	{
		this.tot = tot;
	}
	public int getRank()
	{
		return rank;
	}
	public void setRank(int rank)
	{
		this.rank = rank;
	}
	public double getAvg()
	{
		return avg;
	}
	public void setAvg(double avg)
	{
		this.avg = avg;
	}
	
	
}

```
### 7.4.6. MemberDelete.jsp
``` html
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberDelete.jsp
	
	// 이전 페이지(MemberSelect.jsp)로 부터 넘어온 데이터 수신
	// -> sid
	
	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		//dao.remove(sid);
		
		// 참조 레코드 수 확인
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블에서 제거하고자 하는 데이터의 SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수 확인
		//	(현재는 0 or 1)
		
		if(checkCount==0)	//-- 제거 가능
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}else				//-- 제거 불가
		{
			//dao.remove(sid);
			strAddr = "Notice.jsp";
			//-- TBL_MEMBERSCORE 테이블의 데이터가 TBL_MEMBER 테이블의 SID 를 참조하고 있는 경우(성적이 이미 나온 경우)로,
			//	삭제가 불가능한 상황
			//-- 제거하지 못하는 사유를 안내하는 페이지로 이동 + 리스트로 돌아가기 기능 추가
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	// check~!!!
	// 사용자가 다시 요청해야 할 페이지 안내
	response.sendRedirect(strAddr);
	
// 나머지 보여주는 코드 모두 제거
%>

```
### 7.4.7. MemberInsert.jsp
``` html
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터베이스의 테이블(TBL_MEMBER)에 회원 데이터 추가 액션 처리 수행
	//	... 이후 ... 클라이언트가 다시 리스트 페이지(MemberSelect.jsp)를 요청할 수 있도록 안내
	
	// 이전 페이지로(MemberInserForm.jsp)로 부터 넘어온 데이터 수신
	//-> uName, uTel
	
	request.setCharacterEncoding("UTF-8");
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성(->add() 메소드 호출을 위해 필요)
		MemberDTO member = new MemberDTO();
		member.setName(uName);
		member.setTel(uTel);
		
		// insert 쿼리문을 수행하는 dao의 add() 메소드 호출
		dao.add(member);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// check~!!!
	// 클라이언트가 MemberSelect.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberInsertForm.jsp");
%>

```
### 7.4.8. MemberInsertForm.jsp
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript">
// 입력하기 버튼 클릭시 호출되는 자바스크립트 함수
function memberSubmit()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberForm = document.getElementById("memberForm");
	
	var uName = document.getElementById("uName");
	var nameMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	if(uName.value=="")
	{
		nameMsg.style.display="inline";
		uName.focus();
		return;
	}
	
	// form 을 직접 지정하여 submit 액션 수행
	memberForm.submit();
}
function memberReset()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberForm = document.getElementById("memberForm");
	var uName = document.getElementById("uName");
	var nameMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	// form 을 직접 지정하여 reset 액션 수행
	memberForm.reset();
	
	uName.focus();
}
</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #FF8F8F;">명단</span> 관리
		 및 <span style="color: #508D69;">입력</span> 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
	</div>
	
	<div>
		<!-- 회원 데이터 입력 폼 구성 -->
		<form action="MemberInsert.jsp" method="post" id="memberForm">
			<table class="table">
				<tr>
					<th style="width: 150px;">이름(*)</th>
					<td>
						<input type="text" id="uName" name="uName">
					</td>
					<td>
						<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="uTel" name="uTel">
					</td>
					<td></td>
				</tr>
			</table>
			
			<div class="btn_box">
				<a href="javascript:memberSubmit();"><button type="button">입력하기</button></a>
				<a href="javascript:memberReset();"><button type="button">취소하기</button></a>
				<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
			</div>
		</form>
	</div>
</div>


</body>
</html>
```
### 7.4.9. MemberScoreDelete.jsp
``` html
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreDelete.jsp
	
	// 이전 페이지(MemberScoreSelect.jsp)로 부터 넘어온 데이터 수신
	// -> sid
	
	String sid = request.getParameter("sid");
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		dao.remove(sid);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}	
	}
	
	response.sendRedirect("MemberScoreSelect.jsp");
%>

```
### 7.4.10. MemberScoreInsert.jsp
``` html
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreInsert.jsp
	
	// 이전 페이지(MemberScoreInsertForm.jsp)로 부터 넘어온 데이터 수신
	// -> kor, eng, mat + sid
	
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberScoreDTO 객체 구성 -> add() 메소드의 매개변수
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(Integer.parseInt(kor));
		score.setEng(Integer.parseInt(eng));
		score.setMat(Integer.parseInt(mat));
		
		
		// dao 의 add() 메소드 호출 -> 데이터 입력(insert 쿼리문 수행)
		// -> MemberScoreDT0 매개변수 필요
		dao.add(score);
		
		// 위의 메소드가 반환하는 값에 따른 결과 분기 코드 삽입 가능~!!!
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 클라이언트가 새로운 페이지를 요청 할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");	

// 아래 보여주는 코드 모두 제거
%>

```
### 7.4.11. MemberScoreInsertForm.jsp
``` html
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(MemberScorSelect.jsp)부터 넘어온 데이터 수신
	// -> sid
	
	String sid = request.getParameter("sid");
	String name = "";
	
	// name 을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신한 sid 를 활용하여 name 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());		
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());		
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript">
// 입력하기 버튼 클릭시 호출되는 자바스크립트 함수
function memberScoreSubmit()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberScoreForm = document.getElementById("memberScoreForm");
	
	var kor = document.getElementById("kor");
	var eng = document.getElementById("eng");
	var mat = document.getElementById("mat");
	
	var korMsg = document.getElementById("korMsg");
	var engMsg = document.getElementById("engMsg");
	var matMsg = document.getElementById("matMsg");
	
	korMsg.style.display = "none";
	engMsg.style.display = "none";
	matMsg.style.display = "none";
	
	
	if(kor.value=="" || isNaN(kor.value) || Number(kor.value)<0 || Number(kor.value)>100)
	{
		korMsg.style.display ="inline";
		kor.focus();
		return;
	}
	if(eng.value=="" || isNaN(eng.value) || Number(eng.value)<0 || Number(eng.value)>100)
	{
		engMsg.style.display ="inline";
		eng.focus();
		return;
	}
	if(mat.value=="" || isNaN(mat.value) || Number(mat.value)<0 || Number(mat.value)>100)
	{
		matMsg.style.display ="inline";
		mat.focus();
		return;
	}
	
	memberScoreForm.submit();
}// end memberScoreForm.submit()

function memberScoreReset()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberScoreForm = document.getElementById("memberScoreForm");
	var kor = document.getElementById("kor");
	
	var korMsg = document.getElementById("korMsg");
	var engMsg = document.getElementById("engMsg");
	var matMsg = document.getElementById("matMsg");
	
	korMsg.style.display="none";
	engMsg.style.display="none";
	matMsg.style.display="none";
	
	memberScoreForm.reset();
	
	kor.focus();
}

</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #62c8eb;">성적</span> 관리
		 및 <span style="color: #508D69;">입력</span> 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	</div>
	
	<div>
		<!-- 성적 데이터 입력 폼 구성 -->
		<form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
			<table class="table">
				<tr>
					<th>번호</th>
					<td><%=sid %></td>	<!-- 1 -->
					<td></td>
				</tr>
				<tr>
					<th style="width: 150px;">이름(*)</th>
					<td>
						<%=name %>		<!-- 문정환 -->
					</td>
					<td></td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td>
						<input type="text" id="kor" name="kor">
					</td>
					<td>
						<span class="errMsap" id="korMsg" style="display:none;color: #FF8F8F;">0~100 사이의 국어점수 입력</span>
					</td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td>
						<input type="text" id="eng" name="eng">
					</td>
					<td>
						<span class="errMsap" id="engMsg" style="display:none;color: #FF8F8F;">0~100 사이의 영어점수 입력</span>
					</td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td>
						<input type="text" id="mat" name="mat">
					</td>
					<td>
						<span class="errMsap" id="matMsg" style="display:none;color: #FF8F8F;">0~100 사이의 수학점수 입력</span>
					</td>
				</tr>
			</table>
			
			<div class="btn_box">
				<a href="javascript:memberScoreSubmit();"><button type="button">입력하기</button></a>
				<a href="javascript:memberScoreReset();"><button type="button">취소하기</button></a>
				<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
			</div>
		</form>
	</div>
</div>


</body>
</html>
```
### 7.4.12. MemberScoreSelect.jsp
``` html
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("	<tr>");
		str.append("		<th class='numTh'>번호</th>");
		str.append("		<th class='nameTh'>이름</th>");
		str.append("		<th>국어점수</th><th>영어점수</th><th>수학점수</th>");
		str.append("		<th>총점</th><th>평균</th><th>석차</th>");
		str.append("		<th>성적처리</th>");
		str.append("	</tr>");
		
		for(MemberScoreDTO score: dao.lists())
		{
			str.append("	<tr>");
			str.append("		<td>"+score.getSid()+"</td>");
			str.append("		<td>"+score.getName()+"</td>");
			str.append("		<td>"+score.getKor()+"</td>");
			str.append("		<td>"+score.getEng()+"</td>");
			str.append("		<td>"+score.getMat()+"</td>");
			str.append("		<td>"+score.getTot()+"</td>");
			str.append("		<td>"+String.format("%.2f",score.getAvg())+"</td>");
			str.append("		<td>"+score.getRank()+"</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			/* 
			str.append("		<td>");
			str.append("			<button type='button' class='btn01'>입력</button>");
			str.append("			<button type='button' class='btn01'>수정</button>");
			str.append("			<button type='button' class='btn01'>삭제</button>");
			str.append("		</td>");
			str.append("	</tr>");
			 */
			 
			if(score.getKor()==-1 && score.getEng()==-1 && score.getMat()==-1)
			{
				str.append("		<td>");
				str.append("			<a href='MemberScoreInsertForm.jsp?sid="+score.getSid()+"'><button type='button' class='btn01'>입력</button></a>");
				str.append("			<button type='button' class='btn01' disabled='disabled'>수정</button>");
				str.append("			<button type='button' class='btn01' disabled='disabled'>삭제</button>");
				str.append("		</td>");
				str.append("	</tr>");
			}
			else
			{
				str.append("		<td>");
				str.append("			<button type='button' class='btn01' disabled='disabled'>입력</button>");
				str.append("			<a href='MemberScoreUpdateForm.jsp?sid="+score.getSid()+"'><button type='button' class='btn01'>수정</button></a>");
				str.append("			<a href='javascript:memberScoreDelete("+score.getSid() +", \"" + score.getName()+"\")'><button type='button' class='btn01'>삭제</button></a>");
				str.append("		</td>");
				str.append("	</tr>");
			}
		}
		str.append("</table>");
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreSelect.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
function memberScoreDelete(sid, name)
{
	// 확인
	//alert("함수 연결");
	
	//alert("번호: "+ sid + ",이름:" + name);
	
	//※ name 을 문자열로 넘기는 과정에서 따옴표 주의할것~!!!
	
	var res = confirm("번호: "+ sid + ",이름:" + name + "\n이 회원의 정보를 정말 삭제하시겠습니까?");

	if(res)
		window.location.href="MemberScoreDelete.jsp?sid="+sid;
}
</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #62c8eb;">성적</span> 관리 및 출력 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
	</div>
</div>

<!-- 번호 이름 국어점수 영어점수 수학점수 총점 평균 석차		성적처리 -->
<!-- 														입력 수정 삭제 -->
<!-- <table>
	<tr>
		<th class='numTh'>번호</th>
		<th class='nameTh'>이름</th>
		<th>국어점수</th><th>영어점수</th><th>수학점수</th>
		<th>총점</th><th>평균</th><th>석차</th>
		<th>성적처리</th>
	</tr>
	<tr>
		<td>"+score.getSid()+"</td>
		<td>"+score.getName()+"</td>
		<td>"+score.getKor()+"</td>
		<td>"+score.getEng()+"</td>
		<td>"+score.getMat()+"</td>
		<td>"+score.getTot()+"</td>
		<td>"+score.getAvg()+"</td>
		<td>"+score.getRank()+"</td>
		<td>
			<button type='button' class='btn01'>입력</button>
			<button type='button' class='btn01'>수정</button>
			<button type='button' class='btn01'>삭제</button>
		</td>
	</tr>
</table> -->
<%=str.toString() %>

</body>
</html>
```

### 7.4.13. MemberScoreUpdate.jsp
``` html
<%@page import="com.test.MemberScoreDAO"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreUpdate.jsp
	
	// 이전 페이지로(MemberScoreUpdateForm.jsp)부터 넘어온 데이터 수신
	// -> sid, kor, eng, mat
	
	String sid = request.getParameter("sid");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor = Integer.parseInt(korStr);
	int eng = Integer.parseInt(korStr);
	int mat = Integer.parseInt(korStr);
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO member = new MemberScoreDTO();
		member.setSid(sid);
		member.setKor(kor);
		member.setEng(eng);
		member.setMat(mat);
		
		dao.modify(member);
		
		// 위 메소드 호출 결과 반환값을 활용한 분기 처리 가능~!!!
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 변경된 URL로 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");
%>
```
### 7.4.14. MemberScoreUpdateForm.jsp
``` html
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(MemberScoreSelect.jsp)부터 넘어온 데이터 수신
	// -> sid
	
	String sid = request.getParameter("sid");
	String name = "";
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	// name 을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신한 sid 를 활용하여 name 및 각 과목의 점수 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());		
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());		
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdateForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript">
// 입력하기 버튼 클릭시 호출되는 자바스크립트 함수
function memberScoreSubmit()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberScoreForm = document.getElementById("memberScoreForm");
	
	var kor = document.getElementById("kor");
	var eng = document.getElementById("eng");
	var mat = document.getElementById("mat");
	
	var korMsg = document.getElementById("korMsg");
	var engMsg = document.getElementById("engMsg");
	var matMsg = document.getElementById("matMsg");
	
	korMsg.style.display = "none";
	engMsg.style.display = "none";
	matMsg.style.display = "none";
	
	
	if(kor.value=="" || isNaN(kor.value) || Number(kor.value)<0 || Number(kor.value)>100)
	{
		korMsg.style.display ="inline";
		kor.focus();
		return;
	}
	if(eng.value=="" || isNaN(eng.value) || Number(eng.value)<0 || Number(eng.value)>100)
	{
		engMsg.style.display ="inline";
		eng.focus();
		return;
	}
	if(mat.value=="" || isNaN(mat.value) || Number(mat.value)<0 || Number(mat.value)>100)
	{
		matMsg.style.display ="inline";
		mat.focus();
		return;
	}
	
	memberScoreForm.submit();
}// end memberScoreForm.submit()

function memberScoreReset()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberScoreForm = document.getElementById("memberScoreForm");
	var kor = document.getElementById("kor");
	
	var korMsg = document.getElementById("korMsg");
	var engMsg = document.getElementById("engMsg");
	var matMsg = document.getElementById("matMsg");
	
	korMsg.style.display="none";
	engMsg.style.display="none";
	matMsg.style.display="none";
	
	memberScoreForm.reset();
	
	kor.focus();
}

</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #62c8eb;">성적</span> 관리
		 및 <span style="color: #508D69;">수정</span> 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	</div>
	
	<div>
		<!-- 성적 데이터 입력 폼 구성 -->
		<form action="MemberScoreUpdate.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
			<table class="table">
				<tr>
					<th>번호</th>
					<td><%=sid %></td>	<!-- 1 -->
					<td></td>
				</tr>
				<tr>
					<th style="width: 150px;">이름(*)</th>
					<td>
						<%=name %>		<!-- 문정환 -->
					</td>
					<td></td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td>
						<input type="text" id="kor" name="kor" value="<%=kor%>" style="text-align:center;">
					</td>
					<td>
						<span class="errMsap" id="korMsg" style="display:none;color: #FF8F8F;">0~100 사이의 국어점수 입력</span>
					</td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td>
						<input type="text" id="eng" name="eng" value="<%=eng%>" style="text-align:center;">
					</td>
					<td>
						<span class="errMsap" id="engMsg" style="display:none;color: #FF8F8F;">0~100 사이의 영어점수 입력</span>
					</td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td>
						<input type="text" id="mat" name="mat" value="<%=mat%>" style="text-align:center;">
					</td>
					<td>
						<span class="errMsap" id="matMsg" style="display:none;color: #FF8F8F;">0~100 사이의 수학점수 입력</span>
					</td>
				</tr>
			</table>
			
			<div class="btn_box">
				<a href="javascript:memberScoreSubmit();"><button type="button">수정하기</button></a>
				<a href="javascript:memberScoreReset();"><button type="button">취소하기</button></a>
				<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
			</div>
		</form>
	</div>
</div>


</body>
</html>
```
### 7.4.15. MemberSelect.jsp
``` html
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("		<tr>");
		str.append("			<th style='width: 50px'>번호</th>");
		str.append("			<th style='width: 50px'>이름</th>");
		str.append("			<th style='width: 50px'>전화번호</th>");
		str.append("			<th style='width: 50px'>관리</th>");
		str.append("		</tr>");
		
		for(MemberDTO member:dao.lists())
		{
			str.append("		<tr>");
			str.append("			<td>"+ member.getSid() +"</td>");
			str.append("			<td>"+ member.getName() +"</td>");
			str.append("			<td>"+ member.getTel() +"</td>");
			str.append("			<td>");
			str.append("				<a href='MemberUpdateForm.jsp?sid="+ member.getSid() +"'>");
			str.append("					<button type='button' class='btn01'>수정</button>");
			str.append("				</a>");
			
			/* str.append("				<a href='javascript:memberDelete("+member.getSid()+","+member.getName()+");'>"); */
			str.append("				<a href='javascript:memberDelete("+member.getSid()+", \""+member.getName()+"\");'>");
			
			// memberDelete(1, '노은하');
			// ※ 자바스크립트에서 사용할 수 있는 따옴표의 종류
			//		①"" ②'' ③\"\"
			//		일반적으로 따옴표가 두 번 중첩되어 사용하게 되면 ①과 ②를 사용하면 된다.
			//		하지만, 따옴표가 세 번 중첩되어 사용될 경우 ③ escape를 사용해야 한다.
			
			str.append("					<button type='button' class='btn01'>삭제</button>");
			str.append("				</a>");
			str.append("			</td>");
			str.append("		</tr>");
		}
		str.append("</table>");
		
	}               		
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			//DBConn.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberSelect.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
function memberDelete(sid, name)
{
	// 확인
	//alert("함수 호출~!!!");
	
	// 확인
	//alert("번호:"+ sid +",이름:"+name);
	
	var res = confirm("번호:"+ sid +",이름:"+name+"\n이 회원의 정보를 정말 삭제하시겠습니까?");
	
	// 확인
	//alert(res);
	//-- confirm() 함수를 통해 호출되는 창은 사용자의 의사표현 결과에 따라 true(확인)또는 false(취소)를 반환하게 된다.
	
	if(res)
		window.location.href="MemberDelete.jsp?sid="+sid;
}
</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #FF8F8F;">명단</span> 관리 및 출력 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
		<a href="MemberInsertForm.jsp"><button type="button">신규 회원 등록</button></a>
	</div>
	
	<!-- 리스트 출력 -->
	<!-- <table class="table">
		<tr>
			<th style="width: 50px">번호</th>
			<th style="width: 50px">이름</th>
			<th style="width: 50px">전화번호</th>
			<th style="width: 50px">관리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>희동이</td>
			<td>010-1111-1111</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>도우너</td>
			<td>010-2222-2222</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>마이콜</td>
			<td>010-3333-3333</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
	</table> -->
	<%=str.toString() %>
</div>

</body>
</html>
```
### 7.4.16. MemberUpdate.jsp
``` html
<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberUpdate.jsp
	
	// 이전 페이지로(MemberUpdateForm.jsp)로 부터 넘어온 데이터 수신
	//-> sid, uName, uTel
	
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		MemberDTO member = new MemberDTO();
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
		dao.modify(member);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}	
	}
	
	// 클라이언트에 MemberSelect.jsp 페이지를 다시 요청할 수 있도록 안내~!!!
	response.sendRedirect("MemberSelect.jsp");
	
// 이후 보여지는 페이지 구성 모두 삭제
%>
```
### 7.4.17. MemberUpdateForm.jsp
``` html
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(MemberSelect.jsp)로부터 넘어온 데이터 수신
	// -> sid
	
	// 수신한 sid 를 가지고 회원 데이터 조회
	// 조회해서 얻어낸 데이터를 폼에 구성
	
	String sid = request.getParameter("sid");
	String name = "";
	String tel = "";
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터 베이스 연결
		dao.connection();
		
		MemberDTO member = dao.searchMember(sid);
		name = member.getName();
		tel = member.getTel();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());		
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUdpateForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript">
// 입력하기 버튼 클릭시 호출되는 자바스크립트 함수
function memberSubmit()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberForm = document.getElementById("memberForm");
	
	var uName = document.getElementById("uName");
	var nameMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	if(uName.value=="")
	{
		nameMsg.style.display="inline";
		uName.focus();
		return;
	}
	
	// form 을 직접 지정하여 submit 액션 수행
	memberForm.submit();
}
function memberReset()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var memberForm = document.getElementById("memberForm");
	var uName = document.getElementById("uName");
	var nameMsg = document.getElementById("nameMsg");
	
	nameMsg.style.display = "none";
	
	// form 을 직접 지정하여 reset 액션 수행
	memberForm.reset();
	
	uName.focus();
}
</script>

</head>
<body class="section">

<div>
	<h1>회원 <span style="color: #FF8F8F;">명단</span> 관리
		 및 <span style="color: #61A3BA;">수정</span> 페이지</h1>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
	</div>
	
	<div>
		<!-- 회원 데이터 수정 폼 구성 -->
		<!-- <form action="MemberUpdate.jsp" method="post" id="memberForm"> -->
		<!-- 방법 ③: get 방식으로 주소에서 sid 넘김 -->
		<form action="MemberUpdate.jsp?sid=<%=sid %>" method="post" id="memberForm">
			<table class="table">
				<tr>
					<th>번호</th>
					<!-- <td>1</td> -->
					<td>
						<%=sid %>
						<!-- **번호(sid)를 submit 시 넘기는 방법 3가지** -->
						<!-- 방법 ①: type="hidden" 사용 -->
						<input type="hidden" name="sid" value="<%=sid%>">
						<!-- 방법 ②: disabled 사용 -->
						<%-- <input type="text" name="sid" value="<%=sid%>" disabled="disabled"> --%>
					</td>
					<td></td>
				</tr>
				<tr>
					<th style="width: 150px;">이름(*)</th>
					<td>
						<input type="text" id="uName" name="uName" value="<%=name %>">
					</td>
					<td>
						<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="uTel" name="uTel" value="<%=tel %>">
					</td>
					<td></td>
				</tr>
			</table>
			
			
			
			<div class="btn_box">
				<a href="javascript:memberSubmit();"><button type="button">수정하기</button></a>
				<a href="javascript:memberReset();"><button type="button">취소하기</button></a>
				<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
			</div>
		</form>
	</div>
</div>


</body>
</html>
```
### 7.4.18. Notice.jsp
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div class="layout">
	<div class="result_box">
		해당 회원의 정보를 삭제하기 위해서는 <br>
		등록된 성적 정보를 먼저 삭제해야 합니다.<br><br>
		
		<a href="MemberSelect.jsp" style="color:blue;">▶리스트로 돌아가기</a>
	</div>
</div>
</body>
</html>
```

<br>

## 7.5. [세션처리-로그인]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e3fc2c5f-4bfb-4494-8352-73c0a733f58d)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/915b18c0-e8be-4ff9-bda3-da391ae35073)

### 7.5.1. TestSession01.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 최초 요청일 경우... 아무것도 없지만...
	// TEstSession01_ok.jsp 페이지에서
	// 로그인 성공 후에 요청된 페이지라면...
	// session의 userId에 superman 을 
	//			 userName 에 문정환을 담아서 보낸 상황
	
	String userId = (String)session.getAttribute("userId");		// "superman"
	String userName = (String)session.getAttribute("userName"); // "문정환"
	//-- 『session.getAttribute("userId");』는
	//	Object 타입을 반환하므로
	//	String 타입으로 반환하는 과정 필요(다운 캐스팅)
	
	// 추가~!!!
	// 세션 활성화 시간 변경 -----------------------------------------------------------
	
	// ※ 세션 기본(default) 시간은 1800초.
	
	session.setMaxInactiveInterval(10);
	//--- 세션이 유지되는 시간을 10초로 설정한 상태.
	//	이로 인해...
	//	로그인 후 10 초 동안 아무 액션도 없는 상태에서...
	//	다시 기능을 이용하려 하거나, 페이지 새로고침을 수행하면
	//	로그아웃 처리된 것을 확인할 수 있다.
	
	// ------------------------------------------------------------세션 활성화 시간 변경
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	/* .btnMenu{border: 1px solid gray;border-radius: 3px;font-size: 8px;width: 60px;height: 20px;} */
	.btn_box [type="button"], .btn_box [type="reset"], .btn{min-width: 80px;}
</style>
<script type="text/javascript">
function sendIt()
{
	// 확인
	//alert("함수 호출");
	
	var f = document.myForm;
	
	if(!f.userId.value)
	{
		alert("아이디를 입력해야 합니다~!!!");
		f.userId.focus();
		return;
	}
	
	if(!f.userPwd.value)
	{
		alert("패스워드를 입력해야 합니다~!!!");
		f.userPwd.focus();
		return;
	}
	f.submit();	
}
</script>
</head>
<body class="section">
<!-- **Session은 서버쪽 자원이므로 먼저 볼 것** -->
<div>
	<h1>세션 처리 - 로그인</h1>
</div>

<div class="layout">
	<div class="tbl_box">
		<table>
			<tr>
				<td class="btn_box" style="display:flex;align-items: center;">
					<a href="">
						<button type="button" class="btnMenu btn01">게시판</button>
					</a> |
					<%
					if(userId == null)
					{
					%>
					<a href="">
						<button type="button" class="btnMenu btn02">일정관리</button>
					</a> |
					<a href="">
						<button type="button" class="btnMenu btn02">친구관리</button>
					</a> |...
					<%
					}
					else
					{
					%>
					<a href="Sca.jsp">
						<button type="button" class="btnMenu btn01">일정관리</button>
					</a> |
					<a href="Fir.jsp">
						<button type="button" class="btnMenu btn01">친구관리</button>
					</a> |...
					<%
					}
					%>
				</td>
			</tr>
		</table>
	</div>
	<div class="tbl_box">
		<%
		if(userId == null)
		{
		%>
		<form action="TestSession01_ok.jsp" method="post" name="myForm">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="userId" class="txt">
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<!-- <input type="text"> -->
						<input type="text" name="userPwd" class="txt">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="btn" style="width:100%;" onclick="sendIt();">로그인</button>
					</td>
				</tr>
			</table>
		</form>
		<%
		}
		else
		{
		%>
		<h2><%=userName %>(<%=userId %>)님, 환영합니다.</h2>
		<p>이제, 일정관리와 친구관리 서비스를 이용할 수 있습니다.</p>
		<p class="btn_box">
			<a href="Logout.jsp">
				<button type="button" class="btnMenu btn01">로그아웃</button>
			</a>
		</p>
		<%
		}
		%>
	</div>
</div>

</body>
</html>
```
### 7.5.2. TestSession01_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession01_ok.jsp
	
	// 이전 페이지(TestSession01.jsp)로 부터 넘어온 데이터 수신
	// -> userId, userPwd
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// DB 활용 -> dao 로그인 처리 -> dao 활용
	// -> 로그인 관련 테이블 데이터와 비교 -> 최종적으로 로그인 액션 처리
	
	String memberId = "superman";
	String memberPwd = "1234567";
	String memberName = "문정환";
	
	if(userId.equals(memberId) && userPwd.equals(memberPwd))
	{
		// 로그인 액션 처리
		session.setAttribute("userId", userId);			//-- session 의 userId -> superman 
		session.setAttribute("userName", memberName);	//-- session 의 userName -> 문정환
		
		// 클라이언트가 페이지를 다시 요청할 수 있도록 안내
		response.sendRedirect("TestSession01.jsp");
		
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01_ok.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div class="layout">
	<h1>로그인 실패~!!!</h1>
	<hr>
</div>

<a href="TestSession01.jsp">▶ 로그인 페이지로 돌아가기</a>

</body>
</html>
```
### 7.5.3. Logout.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Logout.jsp
	//-- 세션의 내용을 없애 로그아웃 처리
	//	 이후 ... 클라이언트가 다시 요청할 페이지 안내
	
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	// 세션의 사용자아이디와 이름 삭제
	
	// 기존 세션에 저장되어 있는 모든 항목을 제거하고 센션을 초기화
	session.invalidate();
	
	// 클라이언트에게 다시 로그인 페이지를 요청할 수 있도록 안내
	response.sendRedirect("TestSession01.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div class="layout">
	<h1>안전하게~!로그아웃 처리되었습니다~!!!</h1>
</div>

</body>
</html>
```

<br>

## 7.6. [회원가입01-03(이름,전화번호)(아이디,패스워드),(이름,전화번호,아이디, 패스워드 출력)]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/a09772c1-39e6-448d-897a-5fe2b86ee039)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/16a73706-32df-4f28-9819-6cf06ab04a9a)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/00a1f3da-7ec7-4948-bd94-3e477d7c7996)

### 7.6.1. TestSession01.jsp_회원가입01 (이름, 전화번호)
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp 페이지로 
		이름과 전화번호를 입력받아 전송
		
		TestSession02.jsp에서 TestSession03.jsp 페이지로
		아이디와 패스워드를 입력받고
		앞에서 전달받은 이름과 전화번호를 함께 전송
		
		TestSession03.jsp 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
		
		01 ---------------- 02 ----------------- 03
		이름, 전화			아이디, 패스워드	이름, 전화, 아이디, 패스워드
		입력				입력				출력
		
							-getParameter		- getAttribute
		
	※ 즉, 01에서 02로 넘겨받을 땐 getParameter
		02에서 03으로 넘겨받을 땐 getParmeter 와 getAttribute 로 세션 활용
		01에서 03으로 직접 넘겨줄 수 없기 때문에 세션(session)에 저장
		
	※ session 외에 input 태그 hidden 속성을 이용한 정보 전달 가능~!!!
 -->

<div>
	<!-- <h1>TestSession01.jsp -> TestSession02.jsp -> TestSession03.jsp</h1> -->
	<h2>회원가입01 (이름, 전화번호)</h2>
	<h2>(TestSession01.jsp)</h2>
	<hr>
</div>

<div class="layout">
	<div class="tbl_box">
		<form action="TestSession02.jsp" method="post" name="form01">
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" id="userName" name="userName"></td>
				</tr>
				<tr>
					<th>전화</th>
					<td><input type="text" id="userTel" name="userTel"></td>
				</tr>
				<tr class="btn_box" style="display: contents;">
					<td colspan="2">
						<a href="javascript:formCheck01();"><button type="button" style="width: 100%;">입력</button></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript">
function formCheck01()
{
	//alert("확인");
	
	var f = document.form01;
	
	if(!f.userName.value)
	{
		alert("이름을 입력해주세요.");
		f.userName.focus();
		return;
	}
	
	if(!f.userTel.value)
	{
		alert("전화번호를 입력해주세요.");
		f.userTel.focus();
		return;
	}
	
	f.submit();
}
</script>
</body>
</html>
```
### 7.6.2. TestSession02.jsp_회원가입02 (아이디, 패스워드)
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession01.jsp)로 부터 넘어온 데이터 수신
	// -> userName, userTel

	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	// check~!!
	// 추가
	// 세선으로 값 보내기
	session.setAttribute("userName", name);
	session.setAttribute("userTel", tel);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h2>회원가입02 (아이디, 패스워드)</h2>
	<h2>(TestSession02.jsp)</h2>
	<hr>
</div>

<div class="layout">
	<div class="tbl_box">
		<form action="TestSession03.jsp" method="post" name="form02">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="userId" name="userId"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="text" id="userPwd" name="userPwd"></td>
				</tr>
				<tr class="btn_box" style="display: contents;">
					<td colspan="2">
						<a href="javascript:formCheck02();"><button type="button" style="width: 100%;">입력</button></a>
					</td>
				</tr>
			</table>
			<%-- <input type="text" id="userName" name="userName" value="<%=name%>">
			<input type="text" id="userTel" name="userTel" value="<%=tel%>"> --%>
		</form>
	</div>
</div>
<script type="text/javascript">
function formCheck02()
{
	//alert("확인");
	
	var f = document.form02;
	
	if(!f.userId.value)
	{
		alert("아이디를 입력해주세요.");
		f.userName.focus();
		return;
	}
	
	if(!f.userPwd.value)
	{
		alert("전화번호를 입력해주세요.");
		f.userPwd.focus();
		return;
	}
	
	f.submit();
}
</script>
</body>
</html>
```
### 7.6.3. TestSession03.jsp_이름, 전화번호, 아이디, 패스워드 출력
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession02.jsp)로 부터 넘어온 데이터 수신
	// -> userId, userPwd

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	
	//String name = request.getParameter("userName");
	//String tel = request.getParameter("userTel");
	
	// 세션에서 값 가져오기
	String name = (String)session.getAttribute("userName");
	String tel = (String)session.getAttribute("userTel");
	
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h2>이름, 전화번호, 아이디, 패스워드 출력</h2>
	<h2>(TestSession03.jsp)</h2>
	<hr>
</div>

<div class="layout">
	<div class="tbl_box">
		<form action="TestSession03.jsp" method="post" name="form02">
			<table>
				<tr>
					<th>이름</th>
					<td><%=name %></td>
				</tr>
				<tr>
					<th>전화</th>
					<td><%=tel %></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=id%></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><%=pwd%></td>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>
</html>
```

<br>

## 7.7. [쿠키 설정 및 추가, 쿠키 정보 얻어내기, 쿠키 정보 삭제/Application을 활용한 접속자 수 체크]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/661e7556-5d56-46de-941f-37c24721de52)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/2a8b2d82-5f0a-4f59-91db-1c029de3dc8f)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/acfbf3cb-e015-4af2-8b89-1377eaf0b75e)

### 7.7.1. TestSetCookie.jsp_쿠키 정보 얻어내기
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] ck = request.getCookies();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestGetCookie.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
	
<div>
	<h1>쿠키 정보 얻어내기</h1>
	<hr>
</div>

<div class="layout">
	<div class="tbl_box">
		<table class="table">
			<tr>
				<th style="width: 120px;">쿠키 이름</th>
				<th>쿠키 값</th>
			</tr>
			<%
			for (Cookie c : ck)
			{
			%>
			<tr>
				<td><%= c.getName() %></td>
				<td><%= c.getValue() %></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	
	<div class="layout">
		<a href="TestSetCookie.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
		<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
	</div>
</div>

</body>
</html>
```
### 7.7.2. TestRemoveCookie.jsp_쿠키 정보 삭제하기
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	/* **
	쿠키는 제거가 따로 없음. -> 비어있는 쿠키로 덮어씀
	** */
	
	// 비어있는 내용으로 기존의 쿠키를 덮어쓰기하는 개념
	Cookie killCookie = new Cookie("cookie_test",  "");	// 제거 하고자 하는 쿠키 이름과 같아야 함
	
	killCookie.setMaxAge(0);
	response.addCookie(killCookie);
	// 처음 쿠키를 구성할 때에도 『addCookie()』로 처리하였기 때문에
	//	삭제할 ㄱ때도  같은 이름의 쿠키를 『addCookie()』로 처리해야 안정적으로 삭제.
	//	즉, 내용이 포함된 쿠키를 심었다가..
	//	이번에는 내용이 비어있는 쿠키를 심는 개념.
	
	//※ 여기서 쿠키 삭제는 클라이언트 입장에서의 삭제이다.
	// 한 명의 클라이언트가 쿠키를 삭제했다고 해서
	// 다른 클라이언트들의 쿠키도 삭제되면 안되기 때문에
	// 이 쿠키의 정보는 로컬 PC에서 컨트롤 하게 된다.(브라우저가...)
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestRemoveCookie.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
	
<div>
	<h1>쿠키 정보 삭제하기</h1>
	<hr>
</div>

<div class="layout">
	<h2>성공적으로 쿠키를 제거했습니다~!!!</h2>

	<div class="btn_box">
		<a href="TestSetCookie.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
		<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
	</div>
</div>

</body>
</html>
```
### 7.7.3. TestSetCookie.jsp_쿠키 설정 및 추가
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 쿠키 생성(서버에 생성된 쿠키)
	Cookie c = new Cookie("cookie_test", "studyCookie");
	/* **쿠키는 서블릿컨테이너(서버)에 만들어짐** */
	
	// 쿠키 설정 (서버에 생성된 쿠키에 대한 설정)
	c.setMaxAge(3600);		// 쿠키 1시간 유지
	
	// 쿠키 추가 (서버에서 생성되고 설정된 쿠키를 클라이언트에 전달(심기))
	response.addCookie(c);
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>쿠키 설정 및 추가</h1>
	<hr>
</div>

<div class="layout">
	<div class="btn_box">
		<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
		<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
	</div>
</div>

</body>
</html>
```
### 7.7.4. Application을 활용한 접속자 수 체크
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 접속자 수
	int n = 0;

	String count =(String)application.getAttribute("count");
	
	if(count != null)
		n = Integer.parseInt(count);
	n++;
	
	application.setAttribute("count", Integer.toString(n));
	
	String realPath = application.getRealPath("/");
	application.log("접속자: "+request.getRemoteAddr());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
	
<div>
	<h1>Application을 활용한 접속자 수 체크</h1>
	<hr>
</div>

<div class="layout">
	<h2>총 접속자: <%=n %></h2>
	<h2 style="word-wrap:break-word;">웹 서버 실제 경로<%=realPath %></h2>
</div>
	
</body>
</html>
```

<br>

## 7.7. [F_WebApp16: JSP 액션 태그 실습]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/8543ed15-6253-4776-9826-e1a8308a6f3b)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/253a491d-cabe-4fb6-9600-6a2b7ec555db)

### 7.7.1. Calc.java
``` java
/* =======================
	Calc.java
========================== */

package com.test;

public class Calc
{
	// 주요 속성  구성
	private int su1;		//-- 피연산자1 (정수 형태)
	private String op;		//-- 연산자 (문자열 형태)
	private int su2;		//-- 피연산자2 (정수 형태)
	
	// 생성자 정의 하지 않음(사용자 정의 생성자 없음)
	// -> default 생성자 자동 삽입
	
	// getter / setter 구성
	public int getSu1()
	{
		return su1;
	}
	public void setSu1(int su1)
	{
		this.su1 = su1;
	}
	public String getOp()
	{
		return op;
	}
	public void setOp(String op)
	{
		this.op = op;
	}
	public int getSu2()
	{
		return su2;
	}
	public void setSu2(int su2)
	{
		this.su2 = su2;
	}
	
	// 메소드 추가
	public String result()
	{
		String result = "";
		
		int s=0;
		if(op != null)
		{
			if(op.equals("+"))
				s = su1 + su2;
			else if(op.equals("-"))
				s = su1 - su2;
			else if(op.equals("*"))
				s = su1 * su2;
			else if(op.equals("/"))
				s = su1 / su2;
			
			result = String.format("%d %s %d = %d", su1, op, su2, s);
		}
		
		return result;
	}
	
}
```
### 7.7.2. Calc.jsp_JSP 액션 태그 실습
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>JSP 액션 태그 실습</h1>
</div>

<div class="layout">
	<!-- 첫 번재 방법 -->
	<!-- <form action="Calc_ok1.jsp" method="post" name="myForm"> -->
	
	<!-- 두 번재 방법 -->
	<!-- <form action="Calc_ok2.jsp" method="post" name="myForm"> -->
	
	<!-- 세 번재 방법 -->
	<form action="Calc_ok3.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>첫 번째 정수</th>
				<td><input type="text" name="su1" class="txt"></td>
			</tr>
			<tr>
				<th>연산자</th>
				<td>
					<select name="op">
						<option value="+">더하기</option>
						<option value="-">빼기</option>
						<option value="*">곱하기</option>
						<option value="/">나누기</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>두 번째 정수</th>
				<td><input type="text" name="su2" class="txt"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" style="width: 100%;"> = </button>
				</td>
			</tr>
			
		</table>
	</form>
</div>

</body>
</html>
```
### 7.7.3. Calc_ok1.jsp_첫 번째 방법 처리결과
``` html
<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Calc.jsp)로 부터 넘어온 데이터 수신
	// -> su1, su2, op
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2;
	su1 = su2 = 0;
	String str="";
	
	if(strSu1.equals("") || strSu2.equals("") || strSu1==null || strSu2==null)
		response.sendRedirect("Calc.jsp");
	else{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해... 객체생성
		Calc ob = new Calc();
		//-- 이클립스 자동완성 기능을 사용하여 구문을 작성할 경우
		//		『@page import="com.test.Calc"』이 구문도 함께 생성되어 처리됨.
		//		혹은 자동완성 기능을 사용하지 않을 경우도
		//		『@page import="com.test.Calc"』이와 같은 구문을 직접 작성해서
		//		해당 클래스를 사용할 수 있도로 처리해 주어야 함.
		//		또는, 생성 구문에 직접 『com.test.Calc ob=new com.test.Calc();』
		//		와 같이 작성하는 거도 가능함.
		
		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok1.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>첫 번째 방법 처리결과</h1>
</div>
	
<div class="layout">
	<h2><%=str %></h2>
</div>

</body>
</html>
```
### 7.7.4. Calc_ok2.jsp_두 번째 방법 처리결과
``` html
<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%/* 
	// 이전 페이지(Calc.jsp)로 부터 넘어온 데이터 수신
	// -> su1, su2, op
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2;
	su1 = su2 = 0;
	String str="";
	
	if(strSu1.equals("") || strSu2.equals("") || strSu1==null || strSu2==null)
		response.sendRedirect("Calc.jsp");
	else{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		Calc ob = new Calc();
		
		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();
	}
	*/
%>
<%
	/* String strSu1 = request.getParameter("su1");
	int su1 = Integer.parseInt(strSu1); */
%>

<!-- Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정 -->
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<!-- 이 구문은 스크립릿 영역에서
	『com.gets.Calc ob = new com.test.Cals();』
	을 작성하여 import 구문을 자동으로 처리한 것과
	마찬가지 효과를 적용하게 된다. -->
	
<!-- requset.getParameter() 메소드를 통해 넘겨받은(전달받은) 데이터를 
	『Calc』 클래스를 기반으로 만들어진 『ob』객체에 넘겨주기 위 한 속성 지정 -->
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/> --%>
<!-- 이 구문은 Calc_ok1.jsp 의 『ob.setSu1(su1);』과 같은 구문 -->

<!-- check~!!! -->
<!-- ※ 속성 이름과 동일한 파라미터인 경우
	『getParameter()』메소드 없이 바로 받을 수 있다. -->
	
	
<!-- ob.su1 = xxx; -->
<jsp:setProperty property="su1" name="ob"/>
<!-- ① request.getParameter() 처리 -> 매개변수를 전달하기 위한 데이터 수신 처리 -->
<!-- ② Integer.parseInt() 처리 	-> 매개변수를 전달하기 위한 형 변환 처리 -->
<!-- ③ ob.su1 						-> ob.setSu1() 호출 처리 -->
<!-- ==> 최종적으로 ob -> Calc 기반의 ob 객체의 su1 속성에
		이전 페이지로부터 넘겹다은 데이터를 적절한 데이터타입(형)으로 전달 -->
		
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok2.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>두 번째 방법 처리결과</h1>
</div>
	
<div class="layout">
	<%-- <h2><%=str %></h2> --%>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>
```
### 7.7.5. Calc_ok3.jsp_세 번째 방법 처리결과
``` html
<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%-- 
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="su1" name="ob"/>	
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>
 --%>

<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>
<!-- **※주의! java의 변수명과 jsp의 name 속성값이 같아야 사용가능** -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>세 번째 방법 처리결과</h1>
</div>
	
<div class="layout">
	<%-- <h2><%=str %></h2> --%>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>
```

<br>

## 7.8. [F_WebApp17: 간단한 기본 방명록 작성 실습]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/67cb3928-3fd1-4e69-9c2c-9fb7b6902132)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/f8116dbb-223a-45eb-9270-4bdfd1f8a263)

### 7.8.1. GuestDTO.java
``` html
/*
	GuestDTO.java
*/
package com.test;

public class GuestDTO
{
	// 주요 속성 구성
	private String userName;		//-- 게시물 작성자
	private String subject;		//-- 게시물 제목
	private String content;		//-- 게시물 내용
	
	//※ 여기에서 사용하는 변수명(속성명)의 앞 두글자는 소문자로 작성할 것 ~!!! check~!!!
	//	numScore 	-> getNumscore()/ setNumScore()
	//	nScore		-> getNScore()	/ setNScore()
	//				-> getnScore()	/ setnScore()
	//				-> getNScore()	/ setNscore()
	//	와 같이 setter 가 속성명을 불러오는 과정에서 인식이 어긋나는 경우가 발생할 수 있기 때문
	
	// ※ 여기에서 사용하는 변수명(속성명)은 HTML 의 form 태그에서 name 속성으로 지정하여 사용할 것.
	// 그래야 속성 데이터 수신 및 속성 매핑을 액션 태그를 사용하여 처리해 줄 수 있기 때문.
	
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
}
```
### 7.8.2. Guest_ok.jsp_간단한 기본 방명록 작성 실습
``` html
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="guest" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="guest"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div>
	<h2>작성된 내용</h2>
	<!-- <h3>이름: 홍길동</h3>
	<h3>제목: 어쩌구저쩌구</h3>
	<h3>내용: 이러쿵 저렁쿵 궁시렁 궁시렁</h3> -->
	
	<h3>이름: <%=guest.getUserName() %></h3>
	<h3>제목: <%=guest.getSubject() %></h3>
	<h3>내용: <%=guest.getContent().replaceAll("\n","<br>") %></h3>
	
</div>

</body>
</html>
```
### 7.8.3. Guest.jsp_간단한 기본 방명록 작성 실습
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<script type="text/javascript">

function formSubmit()
{
	//alert("확인");
	var uName = document.getElementById("userName");
	var uTitle = document.getElementById("subject");
	var uCon = document.getElementById("content");
	
	var f = document.myForm;
	
	if(uName.value == "" || uTitle.value == "" || uCon.value == "" ||uName.value == null || uTitle.value == null || uCon.value == null )
	{
		return;
	}
	
	f.submit();
}

</script>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div class="layout">
	<form action="Guest_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td><input type="text" class="txt" name="userName" id="userName"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="txt" name="subject" id="subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="30" rows="5" name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" style="width: 100%;" onclick="formSubmit()">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
```

<br>

## 7.9. [F_WebApp18: 데이터 입력과 등록 수신결과 확인]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/51b1ef9b-9b31-419e-beb0-43ec81d7641a)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/c487a537-9ba0-4ff4-b15b-06b2525f7cf8)

### 7.9.1. FriendDTO.java
``` java
package com.test;

public class FriendDTO
{
	// 주요 속성 구성
	private String name, gender;		//-- 이름, 성별
	private int age;					//-- 나이
	//private String checkGruop;
	private String[] checkGruop;		//-- 이상형
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//(즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//배열로 처리할 수 있다.
	
	// getter / setter
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public int getAge()
	{
		return age;
	}
	public void setAge(int age)
	{
		this.age = age;
	}
	public String[] getCheckGruop()
	{
		return checkGruop;
	}
	public void setCheckGruop(String[] checkGruop)
	{
		this.checkGruop = checkGruop;
	}
	
	public String result()
	{		
		String result = "";
		if(checkGruop != null)
		{
			for(String item: checkGruop)
				result += "["+ item + "]";
		}
		
		return result;
	}
	
}
```
### 7.9.2. Friend_ok.jsp_등록 수신결과 확인
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리) -->
<%
	String str = "";
if(ob.getCheckGruop() != null)
{
	for(String temp: ob.getCheckGruop())
	{
		str += temp+"";
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>등록 수신결과 확인</h1>
	<hr />
</div>

<ul>
	<li>이름: <%=ob.getName() %></li>
	<li>나이: <%=ob.getAge() %></li>
	<li>성별: <%=ob.getGender() %></li>
	<li>이상형(방법1): <%=ob.result() %></li>
	<li>이상형(방법2): <%
		for (String s : ob.getCheckGruop())
	    {%>
	    <%=s %>
	  <%} %>
	</li>
	<li>이상형(방법3): <%=str %></li>
</ul>


</body>
</html>
```
### 7.9.3. Friend.jsp_데이터 입력
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<script type="text/javascript">
function sendIt()
{
	var f = document.myForm;
	
	if(!f.name.value)
	{
		alert("이름입력")
		f.name.focus();
		return;
	}
	f.submit();
}
</script>

<div>
	<h1>데이터 입력</h1>
	<hr />
</div>

<!-- com.test.FriendDTO -->
<!-- Friend_ok.jsp -->

<div class="layout">
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td><input type="text" class="txt" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" class="txt" name="age"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="남자">남자</label>
					<label><input type="radio" name="gender" value="여자" checked>여자</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label><input type="checkbox" name="checkGruop" value="원빈">원빈</label>
					<label><input type="checkbox" name="checkGruop" value="천우희">천우희</label>
					<label><input type="checkbox" name="checkGruop" value="카리나">카리나</label>
					<label><input type="checkbox" name="checkGruop" value="정우성">정우성</label>
					<label><input type="checkbox" name="checkGruop" value="이동욱">이동욱</label>
					<label><input type="checkbox" name="checkGruop" value="한소희">한소희</label>
					<label><input type="checkbox" name="checkGruop" value="정해인">정해인</label>
					<label><input type="checkbox" name="checkGruop" value="수지">수지</label>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" class="btn" style="width: 100%;" onclick="sendIt()">등록</button></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
```

<br>

## 7.10. [F_WebApp19: 상단메뉴, 좌측메뉴, 메인화면, 하단메뉴 레이아웃]

### 7.10.1. Bottom.jsp
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

하단 메뉴<br>
<a href="">사이트소개</a> |
<a href="">이용약관</a> |
<a href="">도움말</a> |
<a href="">사이트맵</a> |

</body>
</html>
```
### 7.10.2. Left.jsp
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

좌측 메뉴 <br>

<ul>
	<li><a href="">게시판</a></li>
	<li><a href="">방명록</a></li>
	<li><a href="">일정관리</a></li>
</ul>

</body>
</html>
```
### 7.10.3. Main.jsp
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<!-- include 액션태그가 예전만큼 중요도가 높진 않다.(iframe 사용함) -->

<div class="layout">
	<table class="table" border="1" style="width: 400px;">
		<tr>
			<td colspan="2">
				<!-- Top -->
				<jsp:include page="Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="height: 300px;">
			<td>
				<!-- Left -->
				<jsp:include page="Left.jsp"></jsp:include>
			</td>
			<td>Main(메인화면)</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- Bottom -->
				<jsp:include page="Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</div>

</body>
</html>
```
### 7.10.4. Top.jsp
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

상단 메뉴<br>
<a href="">로그인</a> |
<a href="">회원가입</a> |
<a href="">정보확인</a> |

</body>
</html>
```

<br>

## 7.11. [F_WebApp20: JDBC 연동 게시판 작성 실습]

### 7.11.0. JDBC 연동 게시판 작성 실습.txt
``` html
■■■ JDBC 연동 게시판 작성 실습 ■■■
 
○ 프로젝트: WebApp20
 
○ 물리적 구성 요소
 
	00. WebApp20_scott.sql
	
	01. DBConn.java
	02. BoardDTO.java
	03. BoardDAO.java
	04. MyUtil.java -> 페이징 처리
	    
	05. List.jsp
	06. Created.jsp
	07. Created_ok.jsp
	08. Article.jsp
	09. Updated.jsp
	10. Updated_ok.jsp
	11. Delete_ok.jsp
```
### 7.11.1. WebApp20_scott.sql
``` sql
SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;

PURGE RECYCLEBIN;

--○ 기존 테이블 제거
DROP TABLE TBL_BOARD PURGE;
--==>> Table TBL_BOARD이(가) 삭제되었습니다.

--○ 게시판 전용 테이블 생성(TBL_BOARD)
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                       NOT NULL    -- 게시물 번호
, NAME      VARCHAR2(30)                    NOT NULL    -- 게시물 작성자
, PWD       VARCHAR2(20)                    NOT NULL    -- 게시물 암호
, EMAIL     VARCHAR2(50)                                -- 작성자 이메일
, SUBJECT   VARCHAR2(100)                   NOT NULL    -- 게시물 제목
, CONTENT   VARCHAR2(4000)                  NOT NULL    -- 게시물 내용
, IPADDR    VARCHAR2(20)                                -- 접속한 클라이언트 IP 주소
, HITCOUNT   NUMBER      DEFAULT 0           NOT NULL   -- 게시물 조회수
, CREATED   DATE        DEFAULT SYSDATE     NOT NULL    -- 게시물 작성일
, CONSTRAINT BOARD_NUM_PK   PRIMARY KEY(NUM)            -- 게시물 번호에 PK 제약조건 설정
);
--==>> Table TBL_BOARD이(가) 생성되었습니다.

--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(NUM),0) AS MAXNUM
FROM TBL_BOARD;
--> 한 줄 구성
SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD
;

--○ 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '노은하','1234','neh@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE);
--> 한 줄 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '노은하','1234','neh@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE)
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ DB 레코드 갯수를 가져오는 쿼리문 구성 (게시물 수)
/* 최대값을 찾는 것은 삭제를 염두해두고 있지 않기 때문에 갯수 세는 쿼리문은 따로 만들어야 함 */
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD;

--○ 특정 영역(시작번호-끝번호) 게시물 목록을 읽어오는 쿼리문 구성
--      번호, 작성자, 제목, 조회수, 작성일
--SELECT TB.번호, TB.작성자, TB.제목, TB.조회수, TB.작성일
--FROM 
--(
--    SELECT ROW_NUMBER() OVER(ORDER BY CREATED DESC) 번호, NAME 작성자, SUBJECT 제목, HITCOUNT 조회수, CREATED 작성일
--    FROM TBL_BOARD
--)TB
--WHERE TB.번호 BETWEEN 1 AND 3;

SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM>=1 AND RNUM<=10;
--==> 한 줄 구성
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM(SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM>=1 AND RNUM<=10
--AND NAME LIKE '%윤수%'
;

--○ 특정 게시물의 조회에 따른 조회 횟수 증가 쿼리문 구성
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT+1
WHERE NUM=1;
--==>> 한 줄 구성
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT+1 WHERE NUM=1
;
-- 로그화~!!!


--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
/* 오늘 게시물인 경우 시분초까지, 오늘이 아닐경우 년-월-일 까지 읽어옴 */
SELECT NUM, NAME, PWD, SUBJECT, CONTENT, IPADDR, HITCOUNT
    , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=1;
--> 한 줄 구성
SELECT NUM, NAME, PWD, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=1
;


--○ 특정 게시물을 삭제하는 쿼리문 구성
DELETE
FROM TBL_BOARD
WHERE NUM=1;
--> 한 줄구성
DELETE FROM TBL_BOARD WHERE NUM=1
;

--○ 특정 게시물을 수정하는 쿼리문 구성
--  (게시물 상세 보기 페이지 -> Article.jsp 내에서의 처리)
--  작성자, 패스워드, 이메일, 제목, 내용
UPDATE TBL_BOARD
SET NAME='박가영', PWD='123456', EMAIL='pky@test.com', SUBJECT='수정제목', CONTENT='수정내용'
WHERE NUM=1;
--> 한 줄 구성
UPDATE TBL_BOARD SET NAME='박가영', PWD='123456', EMAIL='pky@test.com', SUBJECT='수정제목', CONTENT='수정내용' WHERE NUM=1
;


--○ 특정 게시물(50)의 다음 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(NUM),-1) AS NEXTNUM FROM TBL_BOARD
WHERE NUM>50;
--> 한 줄 구성
SELECT NVL(MIN(NUM),-1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>50
;


--○ 특정 게시물(50)의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MAX(NUM),-1) AS BEFORENUM 
FROM TBL_BOARD 
WHERE NUM<50;
--> 한 줄 구성
SELECT NVL(MAX(NUM),-1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<50
;



/*INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '1번','1234','neh@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE);
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(2, '2번','1234','neh@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE);
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(3, '3번','1234','neh@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE);
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(4, '4번','1234','neh@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE);
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(5, '5번','1234','neh@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE);


DELETE
FROM TBL_BOARD
WHERE NUM=2;

SELECT *
FROM TBL_BOARD;*/

DESC TBL_BOARD;
--==>>
/*
이름       널?       유형             
-------- -------- -------------- 
NUM      NOT NULL NUMBER(9)      
NAME     NOT NULL VARCHAR2(30)   
PWD      NOT NULL VARCHAR2(20)   
EMAIL    NOT NULL VARCHAR2(50)   
SUBJECT  NOT NULL VARCHAR2(100)  
CONTENT  NOT NULL VARCHAR2(4000) 
IPADDR   NOT NULL VARCHAR2(20)   
HITCOUNT NOT NULL NUMBER         
CREATED  NOT NULL DATE
*/

DELETE
FROM TBL_BOARD;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_BOARD;
--==>> 조회결과 없음

COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_BOARD
ORDER BY NUM DESC;
```

### 7.11.2. WebApp20_scott(pslql).sql
``` sql
SELECT USER
FROM DUAL;
--==>> SCOTT

DESC TBL_BOARD;
--==>>
/*
이름       널?       유형             
-------- -------- -------------- 
NUM      NOT NULL NUMBER(9)      
NAME     NOT NULL VARCHAR2(30)   
PWD      NOT NULL VARCHAR2(20)   
EMAIL    NOT NULL VARCHAR2(50)   
SUBJECT  NOT NULL VARCHAR2(100)  
CONTENT  NOT NULL VARCHAR2(4000) 
IPADDR   NOT NULL VARCHAR2(20)   
HITCOUNT NOT NULL NUMBER         
CREATED  NOT NULL DATE           

*/


DECLARE
    V_NUM      NUMBER(9)        := 1;      
    V_NAME     VARCHAR2(30);
    V_PWD      VARCHAR2(20);
    V_EMAIL    VARCHAR2(50);
    V_SUBJECT  VARCHAR2(100);
    V_CONTENT  VARCHAR2(4000); 
    V_IPADDR   VARCHAR2(20);
    V_HITCOUNT NUMBER;
    V_CREATED  DATE             := TO_DATE('2020-12-12','YYYY-MM-DD');
BEGIN
    LOOP
        EXIT WHEN V_NUM > 684;
        
        V_NUM := V_NUM +1;
        
        IF(MOD(V_NUM, 5)=0) THEN
            V_PWD := 'java006$';
            V_CONTENT := '영화관련 내용물 작성';
            V_IPADDR := '211.238.142.160';
            V_NAME := '노';
            V_SUBJECT := '취미';

        ELSIF(MOD(V_NUM, 3)=0) THEN
            V_PWD := 'java007$';
            V_CONTENT := '떡볶이관련 내용물 작성';
            V_IPADDR := '211.238.142.165';
            V_NAME := '박';
            V_SUBJECT := '음식';
        
        ELSIF(MOD(V_NUM, 7)=0) THEN
            V_PWD := 'java008$';
            V_CONTENT := '축구관련 내용물 작성';
            V_IPADDR := '211.238.142.170';
            V_NAME := '채';
            V_SUBJECT := '운동';
        
        ELSE
            V_PWD := 'java002$';
            V_CONTENT := '눈보라관련 내용물 작성';
            V_IPADDR := '211.238.142.175';
            V_NAME := '김';
            V_SUBJECT := '날씨';
        END IF;
            
        V_NAME := V_NAME || '윤수' || LTRIM(TO_CHAR(V_NUM));
        V_SUBJECT := V_SUBJECT || '에 대해 작성한 게시물' || LTRIM(TO_CHAR(V_NUM));
        
        V_CREATED := V_CREATED + 1;
        
        IF(MOD(V_NUM,2)=0) THEN
            V_EMAIL := 'apple' || V_NUM || '@test.com';
            V_HITCOUNT := 29;
        ELSIF(MOD(V_NUM,3)=0) THEN
            V_EMAIL := 'test' || V_NUM || '@test.com';
            V_HITCOUNT := 34;
        ELSIF(MOD(V_NUM,4)=0) THEN
            V_EMAIL := 'study' || V_NUM || '@test.com';
            V_HITCOUNT := 47;
        ELSE
            V_EMAIL := 'snow' || V_NUM || '@test.com';
            V_HITCOUNT := 11;    
        
        END IF;
    
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
        VALUES(V_NUM, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_CONTENT, V_IPADDR, V_HITCOUNT, V_CREATED);

    END LOOP;
END;
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.



COMMIT;
--==>> 커밋 완료.
```
### 7.11.3. BoardDAO.java
``` java
/* =================== 
	BoardDAO.java
=================== */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 생성자 정의
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 게시물 번호의 최대값 얻어내기
	public int getMaxNum()
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
				
		try
		{
			sql = "SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				result = rs.getInt("MAXNUM");
			rs.close();
			stmt.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}// end getMaxNum()
	
	// 게시물 작성 -> 데이터 입력
	public int insertData(BoardDTO dto)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			// hitCount 는 기본값 0 또는 default 또는 입력생략 가능
			// create 는 기본값 sysdate 또는 default 입력항목 또는 생략 가능
			sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT"
					+ ", IPADDR, HITCOUNT, CREATED)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	} // end insertData(BoardDTO dto)

	// DB 레코드의 갯수를 가져오는 메소드 정의 (지금은 전체~!!!)
	// -> 검색 기능을 추가하게 되면.. 수정하게 될 메소드(-> 검색 대상의 갯수)
	/*
	public int getDataCount()
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				result = rs.getInt(1);
			rs.close();			
			stmt.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	} // end getDataCount()
	*/
	
	
	// check~!!!
	// 검색 기능 추가
	// → searchKey 	: 제목 or 작성자 or 내용
	//	  searchValue 	: 입력값
	
	public int getDataCount(String searchKey, String searchValue)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try 
		{
			// check~!!!
			searchValue = "%" + searchValue + "%";
			
			sql = "SELECT COUNT(*) AS COUNT "
		               + " FROM TBL_BOARD"
		               + " WHERE " + searchKey + " LIKE ?";
				  //+ " WHERE ? LIKE ?";
			// ** 위와 같이 처리해도 상관은 없으나, 종종 홑따옴표 때문에 
			//		문제가 되는 경우가 있어서 문자열 결합 사용**
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("COUNT");
			rs.close();
			pstmt.close();
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	

	// 특정 영역의(시작번호~끝번호) 게시물의 목록을 
	// 읽어오는 메소드 정의
	// -> 검색 기능을 추하하게 되면... 수정하게 될 메소드(->검색 대상의 리스트)
	/*
	public List<BoardDTO> getLists(int start, int end)
	{
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			
			//sql +="SELECT RNUM, NAME, SUBJECT, HITCOUNT, CREATED";
			//sql +=" FROM";
			//sql +=" (";
			//sql +="    SELECT ROWNUM RNUM, DATA.*";
			//sql +="    FROM";
			//sql +="    (";
			//sql +="        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED";
			//sql +="        FROM TBL_BOARD";
			//sql +="        ORDER BY NUM DESC";
			//sql +="    ) DATA";
			//sql +=" )";
			//sql +=" WHERE RNUM>=? AND RNUM<=?";
			
			sql += "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM(SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM>=? AND RNUM<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs= pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			rs.close();
			pstmt.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}// end getLists(int start, int end)
	*/
	
	
	
	
	
	//check~!!!
	// 검색 기능 추가
	// → searchKey 	: 제목 or 작성자 or 내용
	//	  searchValue 	: 입력값
	public List<BoardDTO> getLists(int start, int end, String searchKey, String searchValue)
	{
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{	
			// check~!!!
			searchValue = "%" + searchValue + "%";										// 추가
			
			/*
			sql += "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED"
					+ " FROM"
					+ "("
						+ "SELECT ROWNUM RNUM, DATA.*"
						+ " FROM"
							+ " ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
							+ " FROM TBL_BOARD"
							+ " WHERE "+ searchKey + " LIKE ?"							// 추가
							+ " ORDER BY NUM DESC"
							+ " )"
						+ " DATA"
					+ " )"
					+ " WHERE RNUM>=? AND RNUM<=?";
			*/
			
			//sql += "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM(SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE "+ searchKey + " LIKE ? ORDER BY NUM DESC ) DATA ) WHERE RNUM>=? AND RNUM<=?";
			
			sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED "
		               + " FROM ( SELECT ROWNUM RNUM, DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED "
		               + " FROM TBL_BOARD "
		               + " WHERE " + searchKey + " LIKE ?"      
		               + " ORDER BY NUM DESC ) DATA) "
		               + " WHERE RNUM>= ? AND RNUM<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);											// 추가
			pstmt.setInt(2, start);														// 인덱스 변경
			pstmt.setInt(3, end);														// 인덱스 변경
			
			rs= pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			rs.close();
			pstmt.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public int updateHitCount(int num)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT+1 WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}// end updateHitCount(int num)
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO getReadData(int num)
	{
		BoardDTO result = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT"
					+ ", TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result = new BoardDTO();
				result.setNum(rs.getInt("NUM"));
				result.setName(rs.getString("NAME"));
				result.setPwd(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIpAddr(rs.getString("IPADDR"));
				result.setHitCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
			}
			rs.close();
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;		
	}// end getReadData(int num)
	
	// 특정 게시물 삭제하는 기능의 메소드 정의
	public int deleteData(int num)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "DELETE FROM TBL_BOARD WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}// deleteData(int num)
	
	// 특정 게시물을 수정하는 기능의 메소드 정의
	public int updateData(BoardDTO dto)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql="UPDATE TBL_BOARD"
					+ " SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=?"
					+ " WHERE NUM=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}// end updateData(BoardDTO dto)
	
	// 특정 게시물의 이전 게시물 번호를 얻어내는 메소드 정의
	// (이전 게시물이 존재하지 않을 경우 -1 반환)
	public int getBeforeNum(int num)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NVL(MAX(NUM),-1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
						
			if(rs.next())
				result = rs.getInt("BEFORENUM");
			
			rs.close();
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 특정 게시물의 다음 게시물 번호를 얻어내는 메소드 정의
	// (다음 게시물이 존재하지 않을 경우 -1 반환)
	public int getNextNum(int num)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NVL(MIN(NUM),-1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
						
			if(rs.next())
				result = rs.getInt("NEXTNUM");
			
			rs.close();
			pstmt.close();
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
}
```
### 7.11.4. BoardDTO.java
``` java
/* =================== 
	BoradDTO.java
=================== */
package com.test;

public class BoardDTO
{
	// TBL_BOARD 테이블의 레코드 구조와 동일한 속성 구성
	private int num;
	private String name, pwd, email, subject, content, ipAddr, created;
	private int hitCount;
	public int getNum()

	// 사용자 정의 생성자를 정의하지 않음
	// -> default 생성자 자동 삽입
	
	// getter / setter 구성
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getPwd()
	{
		return pwd;
	}
	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getIpAddr()
	{
		return ipAddr;
	}
	public void setIpAddr(String ipAddr)
	{
		this.ipAddr = ipAddr;
	}
	public String getCreated()
	{
		return created;
	}
	public void setCreated(String created)
	{
		this.created = created;
	}
	public int getHitCount()
	{
		return hitCount;
	}
	public void setHitCount(int hitCount)
	{
		this.hitCount = hitCount;
	}
}
```
### 7.11.5. MyUtil.java_게시판 페이징 처리
``` java
/* ======================
	MyUtil.java
	- 게시판 페이징 처리
========================= */

// check~!!!
// 지금 같이 확인해보고자 하는 페이징 처리 기법은
// 다양한 방법들 중 하나(그나마 쉬운 것을 골라...)이다.
// 학습을 마친 이후에... 꼭!!! 추가적으로 개념을 정리하고
// 확장시키고, 다른 방법들도 찾아보고 공부해야한다~!!

package com.util;

public class MyUtil
{
	// ■ 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물) 수
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount%numPerPage != 0)
			pageCount++;
		
		return pageCount;
	}
	//-- 한 페이지에 10개의 게시물을 출력할 때
	//	총 32 개의 게시물을 페이지로 구성하기 위해서는
	//	『32 / 10』의 연산을 수행하여 결과 3을 얻을 수 있다.
	//	-> 『pageCount = datatCount / numPerPage;』
	//	그런데 이 때, 나머지 2개의 게시물을 출력해 주기 위해서는
	//	페이지 하나가 더 필요하다.
	//	『pageCount++;』
	
	// ■ 페이징 처리 기능의 메소드
	// currentPage: 현재 표시할 페이지
	// totalPage: 전체 페이지의 수
	// listUrl: 링크를 설정할 url
	public String pageIndexList(int currentPage, int totalPage, String listUrl)
	{
		// 실제 페이징을 저장할 StringBuffer 변수
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		//-- 페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여주겠다.
		
		int currentPageSetup;
		//-- 현재 페이지(이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문...)
		
		int page;
		int n;
		//-- 이전 페이지 블럭(& 다음 페이지 블럭) 과 같은 처리에서 이동하기 위한 변수
		//	(얼마만큼 이동해야 하는지...)
		
		// 페이징 처리가 별도로 필요하지 않은 경우
		//-- 데이터가 존재하지 않거나 데이터의 수가
		//	1페이지도 못채우는 경우는 별도로 페이징 처리를 할 필요가 없다.
		if(currentPage == 0)
			return "";
		
		// ※ 페이지 요청을 처리하는 과정에서 URL 경로의 패턴에 대한 처리
		/*
			- 클라이언트 요청의 형태 → List.jsp	→ (가공) → List.jsp + 『?』 + pageNum=20
			- 클라이언트 요청의 형태 → List.jsp?subject=study → (가공) → List.jsp?subject=study + 『&』 + pageNum=1
		*/
		
		// 링크를 설정할 URL에 대한 선가공 처리~!!!
		if(listUrl.indexOf("?") != -1)	// 링크를 설정할 URL 에 『?』가 들어있으면...
		{
			listUrl = listUrl + "&";	// listUrl += "&";
		} else							// 링크를 설정할 URL 에 『?』가 없으면...
		{
			listUrl = listUrl + "?";	// listUrl += "?";
		}
		//-- 예를 들어, 검색값이 존재하면
		//	이미 request 값이 searchKey 와 searchValue 가 들어있는 상황이므로
		//	『&』를 붙여서 속성값에 추가해 주어야 한다.
		
		// ※ currentPageSetup = 표시할 첫 페이지 - 1
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		//-- 만약 현재 페이지가 5페이지이고(currentPage=5)
		//	리스트 하단에 보여줄 페이지 갯수가 10이면(numPerBlock=10)
		//	『5 / 10 = 0』이며... 여기에 『* 10』(10을 곱해도) 0이다.
		//	하지만, 현재 페이지가 11 페이지라면(currentPage=11)
		//	『11 / 10 = 1』이며... 여기에 『* 10』(10을 곱하면) 10이다.
		//	그러면... currentPageSetup 은 10이 되는 것이다.
		
		if(currentPage % numPerBlock == 0)
		{
			currentPageSetup = currentPageSetup - numPerBlock;
			// currentPageSetup -= numPerBlock;
		}
		//-- 만약 위 처리에서 ... (라인88)
		//	현재 페이지가 20 페이지였다면(currentPage=20)
		//	『20 / 10 = 2』이며... 여기에 『*10』 (10을 곱해서) 20이 되는데
		//	이와 같은 상황이라면... 다시 10을 빼서 10으로 만들어주기 위한 구문.
		
		// 1 페이지 (맨처음으로)
		if( (totalPage>numPerBlock) && (currentPageSetup>0) )
		{
			strList.append(" <a href='"+ listUrl +"pageNum=1'>1</a>");
		}
		//-- listUrl은 위에서 (라인 75 ~ 77) 이미 처리가 끝난 상황이기 때문에
		//	『...?』 상태또는 『..?..&』인 상태이다.
		//	이로 인해 결과는
		//	『..?pageNum=1』이거나 『..?..&pageNum=1』이 되는 상황이다.
		
		// Prev(이전으로)
		n = currentPage - numPerBlock;
		//-- n 해당 페이지만큼 앞으로(또는 뒤로) 가기 위한 변수
		
		if( (totalPage>numPerBlock) && (currentPageSetup>0) )
		{
			strList.append(" <a href='"+ listUrl +"pageNum="+ n +"'>Prev</a>");
		}
		//-- currentPageSetup 이 0 보다 큰 경우는
		//	이미 페이지가 11 이상이라는 의미이며
		//	이 때, 현재 페이지가(currentPage)가 11 이상일 경우
		//	『Prev』를 붙이기 위한 구문.
		//-- 『Prev』 를 클릭할 경우
		//	n 변수 페이지로 이동하는데
		//	12에서 『Prev』 할 경우... 2 페이지가 되고,
		//	22에서 『Prev』 할 경우... 12페이지가 될 수 있도록 처리하는 방식이다.
		
		// 각 페이지 바로가기
		page = currentPageSetup + 1;
		//-- 『+1』을 수행하는 이유는
		//	앞에서 currentPageSetup 에서 10을 가져왔다면
		//	10부터 시작하는 것이 아니라
		//	바로가기 페이지는 11부터 시작해야 하기 때문이다.
		
		while( (page<=totalPage) && (page<=currentPageSetup+numPerBlock) )
		{
			if(page==currentPage)	// 현재 페이지
			{
				strList.append(" <span stlye='color:orange; font-weight: bold;'>"+ page +"</span>");
			}else
			{
				strList.append(" <a href='"+ listUrl +"pageNum="+ page +"'>"+ page +"</a>");
			}
			
			page++;
		}
		
		// Next(다음으로)
		n = currentPage + numPerBlock;
		if( (totalPage-currentPageSetup) > numPerBlock )
		{
			strList.append(" <a href='"+ listUrl +"pageNum="+ n +"'>Next</a>");
		}
		
		// 마지막 페이지(맨 마지막으로)
		if( (totalPage>numPerBlock) && (currentPageSetup+numPerBlock<totalPage) )
		{
			strList.append(" <a href='"+ listUrl +"pageNum="+ totalPage +"'>"+ totalPage +"</a>");
		}
		
		return strList.toString();
		
	} // pageIndexList(int currentPage, int totalPage, String listUrl)
}
```
### 7.11.6. Article.jsp_글상세
``` html
<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
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
```
### 7.11.7. Created_ok.jsp_상세로직
``` java
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Created_ok.jsp
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 테이블 상 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 게시물 번호 최대값에 1을 더해서 set 하는 과정 → dto 에 속성값 추가
	dto.setNum(maxNum +1);
	
	// IP Address 확인
	// → request.getRemoteAddr() → 클라이언트(브라우저)의 IP Address 확인
	// → dto 에 속성값 추가
	dto.setIpAddr(request.getRemoteAddr());
	
	// dao 의 insert 쿼리문을 수행하는 메소드 호출 (→ dto 필요~!!!)
	dao.insertData(dto);
	
	// 호출한 위 메소드가 반환한 값을 활용한 분기 처리 가능~!!!
	
	DBConn.close();
	
	// 사용자에 List.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("List.jsp");
	
	// 아래보여지는 코드 모두 제거
%>
```
### 7.11.8. Created.jsp_글올리기
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">
function sendIt()
{
	// 확인
	//alert("함수 호출~!!!");
	
	f = document.myForm;
	
	// 제목 입력 확인 ----------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.subject.value;
	str = str.trim();
	f.subject.value = str;
	
	// ※ 외부에서 참조한 util.js 에 만들어 두었음.
	
	// 확인
	//alert("|" + str + "|");
	
	if(!str)
	{
		alert("\n제목을 입력하세요~!!!");
		f.subject.focus();
		return;
	}
	// -------------------------------------------- 제목 입력 확인
	
	// 이름 입력 확인 -------------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.name.value;
	str = str.trim();
	f.name.value = str;
	
	if(!str)
	{
		alert("\이름을 입력하세요~!!!");
		f.name.focus();
		return;
	}
	// -------------------------------------------- 이름 입력 확인
	
	// 이메일 검사 -------------------------------------------
	// 필수 입력 항목이 아니기 때문에 선택적인 입력이 가능하지만,
	// 입력을 한 상황이라면, 이메일 형식에 맞게 입력했는지 확인하는 처리
	
	if(f.email.value)	//-- 이메일 항목을 입력한 상황이라면...
	{
		if(!isValidEmail(f.email.value))
		{
			alert("\정상적인 이메일 형식을 입력하세요~!!!");
			f.email.focus();
			return;
		}
	}
	// -------------------------------------------- 이메일 검사

	// 내용 입력 확인 -------------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.content.value;
	str = str.trim();
	f.content.value = str;
	
	if(!str)
	{
		alert("\내용을 입력하세요~!!!");
		f.content.focus();
		return;
	}
	// -------------------------------------------- 내용 입력 확인
	
	// 패스워드 입력 확인 ------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.pwd.value;
	str = str.trim();
	f.pwd.value = str;
	
	if(!str)
	{
		alert("\n패스워드를 입력하세요~!!!");
		f.pwd.focus()
		return;
	}
	
	// ------------------------------------- 패스워드 입력 확인
	
	f.action = "<%=cp%>/Created_ok.jsp";
	f.submit();
	
	
	// -------------------------------------------------------
}
</script>
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
```
### 7.11.9. Deleted_ok.jsp_삭제로직
``` java
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Delete_ok2.jsp
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.deleteData(num);
	
	// result 결과값에 따른 분기 처리 코드 삽입 가능~!!!
	DBConn.close();
	response.sendRedirect(cp + "/List.jsp?pageNum="+pageNum);
	
	// 아래 보여지는 코드 삭제
%>
```
### 7.11.10. List.jsp_글리스트
``` html
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.util.MyUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.test.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 이전 페이지(?)로부터 넘어온 게시물 번호 수신
	String strNum = request.getParameter("num");
	int num = 0;
	if(strNum != null)
		num = Integer.parseInt(strNum);
	
	// 이전 페이지(?)로 부터 넘어온 페이지 번호 수신
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	
	// 이전 페이지(?)로 부터 넘어온 검색키와 검색값 수신
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
		
	if(searchKey != null) 	//-- 검색 기능을 통해 이 페이지가 요청되었을 경우
	{
		// 테스트
		//System.out.println("searchKey: "+ searchKey + ", searchValue: " + searchValue);
		//--==>> searchKey: subject, searchValue: 음식
		
		// 넘어온 요청이 GET 방식이라면...디코딩 처리할 수 있도록 코드 구성
		//→ GET은 한글 문자열을 인코딩해서 보내기 때문에...
		if(request.getMethod().equalsIgnoreCase("GET"))
		{
			// 디코딩 처리
			searchValue = URLDecoder.decode(searchValue,"UTF-8");
		}
		
	}
	else					//-- 검색 기능이 아닌 기본적인 페이지 요청이 이루어졌을 경우
	{
		searchKey = "subject";
		searchValue = "";
	}
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	MyUtil myUtil = new MyUtil();
	
	// 전체 데이터 갯수 구하기	→ 검색 데이터 갯수 구하기로 변경 예정~!!!
	//int dataCount = dao.getDataCount();
	int dataCount = dao.getDataCount(searchKey, searchValue);							// 추가
	
	// 전체 데이터를 기준으로 총 페이지 수 계산
	int numPerPage = 10;	//-- 한 페이지에 표시할 데이터 갯수
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	// 전체 페이지 수 보다 표시할 페이지가 큰 경우
	// 표시할 페이지를 전체 페이지로 처리
	// → 한 마디로, 데이터를 삭제해서 페이지가 줄어들었을 경우...
	if(currentPage > totalPage)
		currentPage = totalPage;
	
	// 데이터베이스에서 가져올 시작과 끝 위치
	int start = (currentPage-1) * numPerPage + 1;
	int end = currentPage * numPerPage;
	//-- 현재 페이지가 1인 경우(currentPage=1)
	//	데이터베이스에서 가져올 게시물은 1번째(start: 1) 부터 10번째(end: 10) 까지
	//	현재 페이지가 2인 경우(currentPage=2)
	//	데이터베이스에서 가져올 게시물은 11번째(start: 11) 부터 20번째(end: 20) 까지 이다. 
	
	// 가져올 리스트의 대역폭 확정~!!!
	
	// 실제 리스트 가져오기	→ 검색 데이터 갯수 구하기로 변경 예정~!!!
	//List<BoardDTO> lists = dao.getLists(start, end);
	List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);				// 추가
	
	// 페이징 처리
	String param = "";
	
	// 검색값이 존재한다면...
	if(!searchValue.equals(""))
	{
		param += "?searchKey=" + searchKey;
		param += "&searchValue" + searchValue;
	}
	
	String listUrl = "List.jsp" + param;
	
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	
	// 글 내용 보기 주소
	String articleUrl = cp + "/Article.jsp";
	
	if(param.equals(""))
	{
		articleUrl = articleUrl + "?pageNum=" + currentPage;
	}else
	{
		articleUrl = articleUrl + param + "&pageNum=" + currentPage;
	}
	
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">
<!-- <link rel="stylesheet" type="text/css" href="css/style2.css"> -->
<script type="text/javascript">
function sendIt()
{
	//alert("함수 호출~!!!");
	
	var f = document.searchForm;
	
	// 검색 키워드에 대한 유효성 검색 코드 삽입 가능~!!!
	
	f.action = "<%=cp%>/List.jsp";
	
	f.submit();
	
}
</script>
</head> 
<body>

<%-- <div>
	<h1><%=cp %></h1>
	<hr>
</div> --%>

<div id="bbsList">

	<div id="bbsList_title">
		게 시 판 (JDBC 연동 버전)
	</div>	<!-- div#bbsList_title -->

	<div id="bbsList_header">
		<div id="leftHeader">
		
			<!-- 검색 폼 구성 -->
			<form action="" name="searchForm" method="post">
			<!-- <form action="" name="searchForm" method="get"> -->
				<select name="searchKey" class="selectFiled">
					<!-- 					
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
					 -->
					<%
					if(searchKey.equals("name"))			//-- 수신한 searchKey 가 name 이라면...
					{
					%>
						<option value="subject">제목</option>
						<option value="name" selected="selected">작성자</option>
						<option value="content">내용</option>
					<%
					}else if(searchKey.equals("content")){	//-- 수신한 searchKey 가 content 이라면...
					%>
						<option value="subject">제목</option>
						<option value="name">작성자</option>
						<option value="content" selected="selected">내용</option>
					<%
					}else{									//-- 수신한 searchKey 가 subject 이라면...
					%>
						<option value="subject" selected="selected">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
					<%
					}
					%>
				</select>
				<input type="text" name="searchValue" class="textFiled" value="<%=searchValue%>">
				<input type="button" value="검색" class="bt2" onclick="sendIt()">
			</form>
			
		</div> <!-- #leftHeader -->
		
		<div id="rightHeader">
			<input type="button" value="글올리기" class="btn2" 
			onclick="javascript:location.href='<%=cp%>/Created.jsp'">
		</div> <!-- #rightHeader -->
		
	</div> <!-- div#bbsList_header -->

	<div id="bbsList_list">
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div> <!-- #title -->
		
		<div id="lists">
			<!-- 
			<dl>
				<dd class="num">1</dd>
				<dd class="subject">안녕하세요</dd>
				<dd class="name">김지민</dd>
				<dd class="created">2023-12-19</dd>
				<dd class="hitCount">0</dd>
			</dl>
			 -->
			<%
			for(BoardDTO dto: lists)
			{
			%>
			<dl>
				<dd class="num"><%=dto.getNum() %></dd>
				<dd class="subject">
					<a href="<%=articleUrl%>&num=<%=dto.getNum()%>"><%= dto.getSubject() %></a>	
					<!-- **pageNum=1 -> 원래의 페이지로 돌아기 위해** -->
				</dd>
				<dd class="name"><%=dto.getName() %></dd>
				<dd class="created"><%=dto.getCreated() %></dd>
				<dd class="hitCount"><%=dto.getHitCount() %></dd>
			</dl>
			<%
			}
			%>
		</div> <!-- #list -->
		
		<div id="footer">
			<!-- <p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 42</p> -->
			
			<!-- <p>등록된 게시물이 존재하지 않습니다.</p> -->
			<p>
			<%
			if(dataCount != 0)
			{
			%>
				<!-- 등록된 게시물이 존재합니다. -->
				<%=pageIndexList %>
			<%
			}else
			{
			%>
				등록된 게시물이 존재하지 않습니다.
			<%
			}
			%>
			</p>
		</div>
		<!-- #footer -->
	</div> <!-- #bbsList_list -->

</div> <!-- #bbslist -->

</body>
</html>
```
### 7.11.10. Updated_ok.jsp_수정로직
``` java
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Updated_ok.jsp
	
	// 위의 액션 태그를 통해 dto 의 속성 값들을 이전 페이지(Updated.jsp)로부터 수신
	// + pageNum
	
	String pageNum = request.getParameter("pageNum");

	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	dao.updateData(dto);
	
	// result 값에 따른 분기 처리코드 삽입 가능~!!!
	
	DBConn.close();
	
	// 사용자에게 리스트 페이지를 다시 요청할 수 있도록 안내
	//response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);
	
	// 사용자에게 게시물 내용 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect(cp + "/Article.jsp?pageNum=" + pageNum + "&num=" + dto.getNum());
	
// 아래 보여주는 코드 모두 제거	
%>
```
### 7.11.10. Updated.jsp_수정
``` html
<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 이전 페이지(Article.jsp)로 부터 넘어온 데이터 수신
	// -> num, pageNum
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// ※ 삭제 액션 요청 처리과정에서 추가한 코드 -----------
	String statusStr = request.getParameter("status");
	int status = Integer.parseInt(statusStr);
	// -------------- 삭제 액션 요청 처리과정에서 추가한 코드
	
	
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	BoardDTO dto = dao.getReadData(num);
	
	String emailStr = "";
	if (dto.getEmail()!=null)
		emailStr = dto.getEmail();
	
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Updated.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">
<style type="text/css">
	#pwd{    border-color: red;}
</style>
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">
function sendIt()
{
	// 확인
	//alert("함수 호출~!!!");
	
	f = document.myForm;
	
	// 제목 입력 확인 ----------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.subject.value;
	str = str.trim();
	f.subject.value = str;
	
	// ※ 외부에서 참조한 util.js 에 만들어 두었음.
	
	// 확인
	//alert("|" + str + "|");
	
	if(!str)
	{
		alert("\n제목을 입력하세요~!!!");
		f.subject.focus();
		return;
	}
	// -------------------------------------------- 제목 입력 확인
	
	// 이름 입력 확인 -------------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.name.value;
	str = str.trim();
	f.name.value = str;
	
	if(!str)
	{
		alert("\이름을 입력하세요~!!!");
		f.name.focus();
		return;
	}
	// -------------------------------------------- 이름 입력 확인
	
	// 이메일 검사 -------------------------------------------
	// 필수 입력 항목이 아니기 때문에 선택적인 입력이 가능하지만,
	// 입력을 한 상황이라면, 이메일 형식에 맞게 입력했는지 확인하는 처리
	
	if(f.email.value)	//-- 이메일 항목을 입력한 상황이라면...
	{
		if(!isValidEmail(f.email.value))
		{
			alert("\정상적인 이메일 형식을 입력하세요~!!!");
			f.email.focus();
			return;
		}
	}
	// -------------------------------------------- 이메일 검사

	// 내용 입력 확인 -------------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.content.value;
	str = str.trim();
	f.content.value = str;
	
	if(!str)
	{
		alert("\내용을 입력하세요~!!!");
		f.content.focus();
		return;
	}
	// -------------------------------------------- 내용 입력 확인
	
	// 패스워드 입력 확인 ------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.pwd.value;
	str = str.trim();
	f.pwd.value = str;
	
	if(!str)
	{
		alert("\n패스워드를 입력하세요~!!!");
		f.pwd.focus()
		return;
	}
	// ------------------------------------- 패스워드 입력 확인
	
	// 패스워드 일치 여부 확인 --------------------------------
	// 해당 게시물 작성 시 설정한 패스워드와
	// 게시물을 수정하는 과정에서 입력한 채스워드가
	// 서로 일치하는지를 확인하여 액션 처리 수행 여부 판단
	var pwdSource = f.pwdSource.value;
	if(str != pwdSource)
	{
		alert("\n 패스워드가 맞지 않습니다.");
		f.pwd.focus();
		return;
	}
	// --------------------------------- 패스워드 일치 여부 확인
	
	f.action = "<%=cp%>/Updated_ok.jsp";
	f.submit();
	
	
	// -------------------------------------------------------
}

function removeIt()
{
	f = document.myForm;
	
	// 패스워드 입력 확인 ------------------------------------
	// 필수 입력 항목 기재 여부 확인 및 공백 처리
	str = f.pwd.value;
	str = str.trim();
	f.pwd.value = str;
	
	if(!str)
	{
		alert("\n패스워드를 입력하세요~!!!");
		f.pwd.focus()
		return;
	}
	// ------------------------------------- 패스워드 입력 확인
	
	// 패스워드 일치 여부 확인 --------------------------------
	// 해당 게시물 작성 시 설정한 패스워드와
	// 게시물을 삭제하는 과정에서 입력한 채스워드가
	// 서로 일치하는지를 확인하여 액션 처리 수행 여부 판단
	var pwdSource = f.pwdSource.value;
	if(str != pwdSource)
	{
		alert("\n 패스워드가 맞지 않습니다.");
		f.pwd.focus();
		return;
	}
	// --------------------------------- 패스워드 일치 여부 확인
	
	f.action = "<%=cp%>/Deleted_ok.jsp";
	
	f.submit();
}
</script>
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
					<dd>
						<%
						if(status==1)		// status ==1 → 수정 액션 요청
						{
						%>
						<input type="text" name="subject" size="64"
						 maxlength="100" class="boxTF" value="<%=dto.getSubject() %>">
						<%
						}else				// status ==2 → 삭제 액션 요청
						{
						%>
						<input type="text" name="subject" size="64"
						 maxlength="100" class="boxTF" value="<%=dto.getSubject() %>"
						 disabled="disabled">
						<%
						}
						%>
					</dd>
				</dl>
			</div>
			<!-- #bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작성자</dt>
					<dd>
						<%
						if(status==1)		// status ==1 → 수정 액션 요청
						{
						%>
						<input type="text"	name="name" size="35"
						 maxlength="20" class="boxTF" value="<%=dto.getName() %>">
						<%
						}else				// status ==2 → 삭제 액션 요청
						{
						%>
						<input type="text"	name="name" size="35"
						 maxlength="20" class="boxTF" value="<%=dto.getName() %>"
						 disabled="disabled">
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- .bbxCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일
						<dd>
						<%
						if(status==1)		// status ==1 → 수정 액션 요청
						{
						%>
						<input type="email" name="email" size="35"
							 maxlength="50" class="boxTF" value="<%=emailStr %>">
						<%
						}else				// status ==2 → 삭제 액션 요청
						{
						%>
						<input type="email" name="email" size="35"
							 maxlength="50" class="boxTF" value="<%=emailStr %>"
						disabled="disabled">
						<%
						}
						%>
						</dd>
					</dt>
				</dl>
			</div><!-- .bbxCreated_bottomLine -->
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내 용</dt>
					<dd>
						<%
						if(status==1)		// status ==1 → 수정 액션 요청
						{
						%>
						<textarea name="content" id="" cols="63" rows="12" 
							class="boxTA"><%=dto.getContent() %></textarea>
						<%
						}else				// status ==2 → 삭제 액션 요청
						{
						%>	
						<textarea name="content" id="" cols="63" rows="12" 
							class="boxTA" disabled="disabled"><%=dto.getContent() %></textarea>
						<%
						}
						%>
					</dd>
				</dl>
			</div>
			<!-- #bbsCreated_content -->
			
			<div class="bbsCreated_noLine">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="hidden" name="pwdSource" value="<%=dto.getPwd() %>">
						<input type="password" name="pwd" id="pwd" size="35" maxlength="10" class="boxTF">
						&nbsp;<span style="font-size: 6pt">(게시물 수정 및 삭제 필요)</span>
						<%-- <%
						if(status==1)		// status ==1 → 수정 액션 요청
						{
						%>
						
						<%
						}else				// status ==2 → 삭제 액션 요청
						{
						%>	
						
						<%
						}
						%> --%>
					</dd>
				</dl>
			</div><!-- .bbsCreated_noLine -->
			
			<div id="bbsCreated_footer">
				
				<!-- ※ Updated_ok.jsp 페이지 요청 과정에서 추가로 필요한 데이터 구성 -->
				<input type="hidden" name="num" value="<%=dto.getNum()%>">
				<input type="hidden" name="pageNum" value="<%=pageNum%>">
				
				<%
				if(status==1)		// status ==1 → 수정 액션 요청
				{
				%>
				<input type="button" value="수정하기" class="btn2" onclick="sendIt()">
				<input type="reset" value="다시입력" class="btn2" onclick="document.myForm.subject.focus()">
				<input type="button" value="작성취소" class="btn2" 
				 onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'">
				<%
				}else				// status ==2 → 삭제 액션 요청
				{
				%>	
				<input type="button" value="삭제하기" class="btn2" onclick="removeIt()">
				<input type="button" value="삭제취소" class="btn2" 
				 onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'">
				<%
				}
				%>				
			</div>
			<!-- #bbsCreated_footer -->
		</div>
	</form>
</div>
<!-- #bbs -->

</body>
</html>
```

<br>

## 7.12. [F_WebApp22: EL 관련 실습]

### 7.12.1. Test3.jsp_EL 관련 실습
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/b5d2d388-3fa4-4ec3-b662-eee450994a2d)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/87c9d2aa-dd53-419d-b8cb-a300a18892c4)
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<% 
	request.setAttribute("result", "EL 테스트 및 관찰");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test3.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>EL 관련 실습</h1>
	<hr />
</div>

<div class="layout">
	<!-- action 속성 생략 → su1과 su2 데이터를 전송하며 요청하는 페이지는 자기 자신~!!! -->
	<form action="" method="post">
		<div class="input_box">
			정수1<input type="text" name="su1" class="txt" /> 
			정수2<input type="text" name="su2" class="txt" />
		</div>

		<div class="btn_box">
			<button type="submit" class="btn">결과 확인</button>
		</div>
	</form>

	<div>
		<h2>◈ 폼 데이터 수신</h2>
		<!-- 폼 데이터를 수신하는 방법 1 -->
		<h3><%=request.getParameter("su1") %></h3>
		
		<!-- 폼 데이터를 수신하는 방법 2 -->
		<h3>${param.su1}</h3>
	</div>
	
	<div>
		<h2>◈ 폼의 데이터를 받아 연산 수행</h2>
		
		<!--  폼의 데이터를 받아 연산을 수행하는 방법 1 -->
		<%
			String s1 = request.getParameter("su1");
			String s2 = request.getParameter("su2");
		
			int s = 0;
			if(s1!=null && s2!=null)
				s = Integer.parseInt(s1)+Integer.parseInt(s2);
		%>
		<h3>합: <%=s %></h3>
		
		<!--  폼의 데이터를 받아 연산을 수행하는 방법 2 -->
		<h3>합: ${param.su1 + param.su2}</h3>
		<!-- → 파라미터 수신도 알아서... -->
		<!-- → 필요한 캐스팅(형변환)도 알아서 자동으로 수행... -->
		<!-- → null 을 대하는 방식...(수신 되었을 때만 노출됨) -->
		
	</div>
	
	<div>
		<h2>◈ setAttribute()로 넘긴 데이터 수신</h2>
		<!-- setAttribute()로 넘긴 데이터를 수신하는 방법 1 -->
		<h3><%=(String)request.getAttribute("result") %></h3>
		
		<!-- setAttribute()로 넘긴 데이터를 수신하는 방법 2 -->
		<h3>${result }</h3>
	</div>
</div>




</body>
</html>
```
### 7.12.2. Test4.jsp_JSTL 코어(core) if문 실습
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/f16cc7e2-0537-4f94-950e-42c8ac440ba8)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/06f107ab-8b62-43fe-94b4-ee3f26cf0f00)

``` html
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
<title>Test4.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div class="layout">
	<div>
		<h1>JSTL 코어(core) if문 실습</h1>
		<hr />
	</div>
	
	<div>
		<form action="" method="post">
			<div class="input_box">정수
				<input type="text" name="su" class="txt" />
			</div>
			<div class="btn_box"><button type="submit" class="btn">결과확인</button></div>
		</form>
	</div>
	
	<div>
		<%-- <h2>${param.su} </h2> --%>
		
		<%-- 『<c:if test=""></c:if>』: JSTL Core if 문 --%>
		<!-- 『test=""』: 조건식 지정. 파라미터로 수신한 su 값이 존재한다면... -->
		<!-- 『param.su』: EL 을 이용한 폼 전송 데이터 수신하는 부분 -->
		<c:if test="${!empty param.su }">
			<!-- <h2>있다~!!!</h2> -->
			
			<!-- 파라미터로 수신한 su가 짝수라면... -->
			<c:if test="${param.su%2 == 0 }">
				<h2>${param.su}: 짝수 </h2>
			</c:if>
		</c:if>
		
		<!-- JSTL Core if 에는... if는 있지만 else 는 없다. -->
		<c:if test="${param.su%2 != 0 }">
				<h2>${param.su}: 홀수 </h2>
		</c:if>
	</div>
</div>

</body>
</html>
```
### 7.12.3. Test5.jsp_JSTL 코어(Core) forEach 문 실습
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/4d027e1f-88a8-4f79-b89d-81a3ef8ae883)

``` html
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
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) forEach문 실습</h1>
	<hr>
</div>

<div class="section">
	<div class="layout">
		<table class="table">
			<%-- <c:forEach var="변수" begin="시작값" end="끝값" step="증가값"> --%>
			<c:forEach var="a" begin="1" end="9" step="1"> <!-- a → 1 2 3 4 5 6 7 8 9 -->
				<tr>
					<c:forEach var="b" begin="1" end="9" step="1"> <!-- b → 1 2 3 4 5 6 7 8 9 -->
					<td style="width:20px">${a*b} </td>
					
					</c:forEach>
				</tr>
			
			</c:forEach>
		</table>
	</div>
</div>

</body>
</html>
```

<br>

## 7.13. [JSTL 코어(Core) forEach문 실습_자료구조 활용]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/3f17e5c9-eb09-4994-864d-eb96b74f9fea)

### 7.13.1. MyData.java_사용자 정의 데이터타입 활용
``` java
/* ================================
	MyData.java
	- 사용자 정의 데이터타입 활용
=================================== */

package com.test;

public class MyData
{
	// 주요 속성 구성
	private String name;
	private int age;
		
	// default 생성자 형태의 사용자 정의 생성자
	public MyData()
	{}
	
	// 매개변수 2개 사용자 정의 생성자
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}
	
	// getter / setter 구성
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getAge()
	{
		return age;
	}
	public void setAge(int age)
	{
		this.age = age;
	}
	
	
	
}
```
### 7.13.2. Test6.jsp_JSTL 코어(Core) forEach문 실습
``` java
<%@page import="com.test.MyData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// Test6.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성

	List<MyData> lists = new ArrayList<MyData>();
	
	MyData ob = new MyData("길현욱", 15);
	lists.add(ob);
	
	ob = new MyData("최혜인", 23);
	lists.add(ob);
	
	ob = new MyData("정한울", 24);
	lists.add(ob);
	
	ob = new MyData("문정환", 16);
	lists.add(ob);
	
	ob = new MyData("이윤수", 8);
	lists.add(ob);
	
	ob = new MyData("임하성", 17);
	lists.add(ob);
	
	request.setAttribute("lists", lists);
%>
<jsp:forward page="Test6_result.jsp"></jsp:forward>
```
### 7.13.3. Test6_result.jsp_JSTL 코어(Core) forEach문 실습-자료구조 활용
``` html
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
<title>Test6_result.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="section">
	<div>
		<h2>JSTL 코어(Core) forEach문 실습</h2>
		<h3>자료구조 활용</h3>
		<hr />
	</div>
	
	<div class="layout">
		
		<div>
			<table class="table">
				<tr>
					<th>이름</th>
					<th>나이</th>
				</tr>
				
				<!-- 컬렉션 객체 접근용(출력용) 반복문 구성 -->
				<!-- **c:forEach에서 items를 꼭 먼저 쓸 것!** -->
				<c:forEach var="dto" items="${lists }">
				<tr>
					<td style="text-align:center;">${dto.name } </td>
					<td style="text-align:center;">${dto.age } </td>
					<!-- **속성만 명시하면 getter 메소드 알아서 호출** -->
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>

</body>
</html>
```
### 7.13.4. Test7.jsp_JSTL 코어(Core) set문 실습-지수승 구하기
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/a14c0928-3a90-481a-89af-b0d43ac2dc44)

``` html
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
<title>Test7.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="section">
	<div>
		<h1>JSTL 코어(Core) set문 실습</h1>
		<h2>지수승 구하기</h2>
		<hr />
	</div>
	<div class="layout">
		<div class="info_box">
			<p>『c:set』은 JSP의 setAttribute()와 같은 역할을 수행한다.</p>
			<p>(page : request | session | application)
				범위의 변수(속성)를 설정한다.</p>
			<p>『c:remove』는 JSP의 removeAttribute()와 같은 역할을 수행한다.</p>
			<p>(page : request | session | application)
				범위의 변수(혹성)를 제거한다.</p>
			<p>scope 속성이 생략될 경우 기본 값(default)은 page 이다.</p>
		</div>
		<br>
		<div>
			<!-- 수신처는 자기 자신~!!! -->
			<form action="" method="post">
				<div class="input_box">
					정수1 <input type="text" name="su1" class="txt" />
					정수2 <input type="text" name="su2" class="txt" />
				</div>
				<div class="btn_box">
					<button type="submit" class="btn">결과 확인</button>
				</div>
			</form>
		</div>
		
		<div>
			<!-- request.getParameter("su1")로 수행한 결과값이 존재할 경우 처리 -->
			<c:if test="${!empty param.su1 }">
				<%-- 『<c:set var="변수" value="값"></c:set>』 --%>
				<%-- → 변수의 값을 지정하는 구문 --%>
				<%-- → 해당 스코프에 지정된 변수가 존재하지 않을 경우
						변수를 새로 선언하여 초기화 하는 기능을 수행하게 되며
						해당 스코프에 이미 지정된 변수가 존재할 경우
						그 변수의 값을 다시 초기화하는 (덮어쓰기) 효과가 적용된다. --%>
				
				<%-- 변수를 선언하는 구문XXXX(아님) -> 선언하면 변수 재 선언 불가능하다고 이해하기 쉬우므로,
					값을 지정하는 구문이라고 이해할 것.
				 --%>
																				<!-- su1:8, su2:7 -->
				<c:set var="result" value="1"></c:set>    						<!-- result = 1 -->
				<c:forEach var="a" begin="1" end="${param.su2 }" step="1">		<!-- for(int a=1; a<7; i++) -->
					<c:set var="result" value="${result * param.su1 }"></c:set>	<!-- result = result*8 -->
					<p>${param.su1 } ^ ${a } = ${result }</p>					<!-- su1 ^ a = result -->
																				<!-- 8^1  = 8
																						2 = 
																				 -->
				</c:forEach>
			</c:if>
		</div>
	</div>
	
</div>

</body>
</html>
```
### 7.13.5. Gugudan.jsp_JSTL 코어(Core)를 활용한 구구단 출력
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/0f5bf15e-416b-4f54-b4f6-f60284a4ffb7)

``` html
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
<title>Gugudan.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="section">
	<div>
		<h1>JSTL 코어(Core)를 활용한 구구단 출력</h1>
		<hr />
	</div>
	<div class="layout">
		<form action="">원하는 단 입력
			<div class="input_box">
				<input type="text" name="dan" class="txt" />
			</div>
	
			<div class="btn_box">
				<button type="submit" class="btn">결과 확인</button>	
			</div>		
		</form>
	</div>
	
	<div>
		<c:if test="${!empty param.dan }">			
			<c:set var="result" value="1"></c:set>
			
			<c:forEach var="i" begin="1" end="9" step="1">
				<p>${param.dan } * ${i } = ${param.dan * i }</p>
			</c:forEach>
			
		</c:if>
	</div>
</div>

</body>
</html>
```
### 7.13.6. Test8.jsp_JSTL 코어(Core) choose 문 실습-배수확인하기
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/7f9300c3-0cf1-453b-8a51-06d846a6ed7e)

``` html
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
<title>Test8.jsp</title>
<%-- <link rel="stylesheet" type="text/css" href="css/main.css"> --%>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>JSTL 코어(Core) choose문 실습</h1>
	<h2>배수확인하기</h2>
	<hr />
</div>

<div class="layout">
	<form action="" method="post">
		정수 <input type="text" name="su" class="txt" />
		
		<button type="submit" class="btn">결과 확인</button>
	</form>
	
	<div>
		<c:if test="${!empty param.su }">
			<%-- JSTL 사용하는 구문에서는 JSP 주석 사용하기~~!!  --%>
		
			<%-- ${param.su } --%>
		
			<%-- <c:choose></c:choose> --%>
			<%-- → JSTL Core 에서 if ~ else 를 대신할 수 있는 구문 --%>
			
			<%-- <c:choose>
				<c:when test="${param.su % 3 == 0 }">
					<p>${param.su }은(는) 3의 배수~!!!</p>
				</c:when>
				else
				<c:otherwise>
					<p>${param.su }은(는) 3의 배수가 아님~!!!</p>
				</c:otherwise>
			</c:choose> --%>
			
			
			
			<%-- 문제) 3 배수 / 4의 배수 / 3 과 4의 배수 / 3 또는 4의 배수 아님 --%>
			
			<%-- 내가 푼 풀이 --%>
			<%-- <p>${param.su}는</p>
			<c:choose>
				<c:when test="${(param.su % 3 == 0) || (param.su % 4 == 0)}">
					<c:choose>
						<c:when test="${(param.su % 3 == 0) && (param.su % 4 == 0)}">
							<p>3 과 4의 배수</p>					
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${param.su % 3 == 0 }">
									<p>3 배수</p>
								</c:when>
								<c:when test="${param.su % 4 == 0 }">
									<p>4 배수</p>
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
						<p>3 또는 4의 배수 아님</p>					
				</c:otherwise>
			</c:choose>
			--%>
			
			<%-- 함께 푼 풀이 --%>
			<c:choose>
				<c:when test="${(param.su % 3 == 0) && (param.su % 4 == 0)}">
					<p>3 과 4의 배수</p>
				</c:when>
				
				<c:when test="${(param.su % 3 == 0)}">
					<p>3 의 배수</p>
				</c:when>
				
				<c:when test="${(param.su % 4 == 0)}">
					<p>4 의 배수</p>
				</c:when>
				
				<c:otherwise>
					<p>3 또는 4의 배수 아님</p>					
				</c:otherwise>
			</c:choose>
			
		</c:if>
	</div>
</div>

</body>
</html>
```
### 7.13.7. Test9.jsp_JSTL 코어(Core) import 문 실습
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/42f1f64d-4e35-407c-ba6f-5d7c9f74bc34)

``` html
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
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>JSTL 코어(Core) import문 실습</h1>
	<hr>
</div>

<div>
	<p>『c:import』 는 URL 처리에 관여하며, 
	URL을 활용하여 다른 자원의 결과를 삽입할 때 사용한다.</p>
</div>

<!-- 변수 지정 -->
<c:set var="url" value="Gugudan.jsp"></c:set>

<!-- import 를 수행 -->
<c:import url="${url }" var="impt">
	<%-- import 를 수행하며 해당 페이지가 필요로하는 파라미터 넘기기 --%>
	<c:param name="dan" value="7"></c:param>
</c:import>


<!-- 결과 화면 출력 -->
<c:out value="${impt }"></c:out>
<!-- 결과 화면 출력 과정에서 HTML 코드를 그대로 출력하도록 처리하는 구문 -->
<!-- 『escapeXml』 속성의 기본값(default> 은 true로 설정되어 있다. -->

<!-- 결과 화면 출력 -->
<c:out value="${impt }" escapeXml="false"></c:out>

</body>
</html>
```

<br>

## 7.14. [JSTL 코어(Core)를 활용한 회원 정보 입력]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/eb25e7df-c04b-488a-9407-20a8e9ab031b)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/221ceb70-03a4-40e6-a472-b0ea87317988)

### 7.14.1. MemberDTO.java
``` java
// MemberDTO.java

package com.test;

public class MemberDTO
{
	String name, tel, add;
	
	public MemberDTO()
	{}

	public MemberDTO(String name, String tel, String add)
	{
		this.name = name;
		this.tel = tel;
		this.add = add;
	}
	
	// getter, setter
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getAddr()
	{
		return add;
	}

	public void setAddr(String add)
	{
		this.add = add;
	}
	
	
}
```
### 7.14.2. MemberInsert.jsp
``` java
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// MemberInsert.jsp
	
	// 5명 분 데이터 수신 → 객체 구성 → 자료구조 구성 →setAttribute()
	//						 MemberDTO
	
	// → MemberList.jsp 에서 출력

	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	MemberDTO member = new MemberDTO();
	
	for(int i=1; i<=5; i++)
	{
		/* **내가 푼 풀이** */
		String name = request.getParameter("name" + i);
		String tel = request.getParameter("tel" + i);
		String add = request.getParameter("add" + i);
		
		member = new MemberDTO(name,tel,add);
		
		/* **함께 푼 풀이** */
		/* MemberDTO member = new MemberDTO(
								request.getParameter("name"+i)
							  , request.getParameter("tel"+i)
							  , request.getParameter("add" + i)); */
		
		lists.add(member);
	}
	
	request.setAttribute("lists", lists);
	
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>
```
### 7.14.3. MemberInsertForm.jsp_회원 정보 입력
``` html
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
<title>MemberInsertForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr />
</div>

<div class="layout">
	<form action="MemberInsert.jsp" name="myForm" method="post">
	
		<!-- (이름, 전화번호, 주소) * 5명 분 -->
		<!-- → submit 액션 처리 -->
		
		<c:forEach var="a" begin="1" end="5" step="1">
		<div class="input_box" style="display: inline-block;">
			<ul>
				<li><span class="tit">이름: </span><input type="text" name="name${a }" value="입력한이름${a }"/></li>
				<li><span class="tit">전화번호: </span><input type="text" name="tel${a }" value="${a }10-0000-0000"/></li>
				<li><span class="tit">주소: </span><input type="text" name="add${a }" value="입력한주소${a }"/></li>
			</ul>
		</div>
		<br><br>
		</c:forEach>
		<div class="btn_box"><button type="submit" class="btn">결과</button></div>
		
		
		<!-- 함께 푼풀이 -->
		<%-- 
		<c:set var="i" value="1"></c:set>
		<c:forEach var="a" begin="1" end="5" step="1">
			<input type="text" name="name${a }">
			<c:set var="i" value="${i+1 }"></c:set>
		</c:forEach>
		 --%>
		
		
	</form>
</div>

</body>
</html>
```
### 7.14.4. MemberList.jsp_회원 명단 출력
``` html
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
<title>MemberList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>JSTL 코어(Core) 문제 해결</h1>
	<h2>회원 명단 출력</h2>
	<hr />
</div>

<div class="layout">
	<!-- 5명의 이름, 전화번호, 주소 출력 -->
	<%-- <c:forEach var="a" begin="1" end="5" step="1">
		<div class="input_box" style="display: inline-block;"> --%>
			<%-- <ul>
				<li><span class="tit">이름: </span>${param.name${a}}</li>
				<li><span class="tit">전화번호: </span>${param.tel${a}}</li>
				<li><span class="tit">주소: </span>${param.addr${a}}</li>
			</ul> --%>
		<%-- </div>
		<br><br>
	</c:forEach> --%>
	<c:forEach var="dto" items="${lists }">
		<ul class="info_box" style="display:inlne-block;">
			<li><span class="tit">이름: </span>${dto.name } </td></li>
			<li><span class="tit">전화번호: </span>${dto.tel } </td></li>
			<li><span class="tit">주소: </span>${dto.addr } </td></li>
		</ul>
		<br>
	</c:forEach>
</div>

</body>
</html>
```

<br>

## 7.15. [F_WebApp23: DBCP를 활용한 데이터베이스 접속 실습]

### 7.15.1. /WEB-INF/web.xml
``` java
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>WebApp00</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- DBCP -->
  <resource-ref>
  	<description>Oracle DataSource</description>
  	<res-ref-name>jdbc/myOracle</res-ref-name>
  	<res-type>javax.sql.DataSource</res-type>
  	<res-auth>Container</res-auth>
  </resource-ref>
  
  
</web-app>
```
### 7.15.2. DBCPAction.jsp
``` java
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBCPConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBCPConn.getConnection();
	
	String result ="";
	if(conn !=null)
	{
		result = "데이터베이스 연결 성공~!!!";
	}
	else
	{
		result = "데이터베이스 연결 실패 ㅠㅠ";
	}
	
	DBCPConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCPAction.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">

<div>
	<h1>DBCP를 활용한 데이터베이스 접속 실습</h1>
	<hr />
</div>

<div class="layout">
	<h2><%=result %></h2>
</div>

</body>
</html>
```

<br>

## 7.16. [F_JQueryApp]

### 7.16.1. JQTest01.html_.each(), .hover()
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/2a3e2c20-bb66-4a18-bb53-2e850e9bfc82)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQTest01.html</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
#navigation > li a span{text-transform: capitalize;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	//jquery();
	$(function()
	{
		var d=300;
		$("#navigation a").each(function(){
			$(this).stop().animate({"marginTop": "-80px"}, d+=150);
		});
		
		$("#navigation > li").hover(function(){
			//alert("관찰");
			$("a", $(this)).stop().animate({"marginTop":"-2px"}, 100);
		}, function(){
			$("a", $(this)).stop().animate({"marginTop":"-80px"}, 900)	
		});
	});
</script>

</head>
<body class="section">

<table>
	<tr>
		<td>
			<ul id="navigation">
				<li class="home"><a href="#"><span>home</span></a></li>
				<li class="about"><a href="#"><span>about</span></a></li>
				<li class="search"><a href="#"><span>search</span></a></li>
				<li class="podcasts"><a href="#"><span>podcasts</span></a></li>
				<li class="rssfeed"><a href="#"><span>rssfeed</span></a></li>
				<li class="photos"><a href="#"><span>photos</span></a></li>
				<li class="contact"><a href="#"><span>contact</span></a></li>
			</ul>
		</td>
	</tr>
</table>



</body>
</html>
```
### 7.16.2. JQTest02.html_jquery(), jquery(document).ready(), $(), $(document).ready()
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/58fa43ce-374e-4588-a01a-8de231b94883)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQTest02.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	function test()
	{
		alert("함수 호출");
		var a = 10;
	}
	
	//jquery();
	//jquery(document).ready();
	//$();
	//$(document).ready();
	
	/* 
	$(document).ready(function()
	{
		//alert("함수 호출");
		//test();	
		
		// ※ 우리가... 또는 이 페이지를 이용하는 사용자가...
		//		뭔가 건드리지 않아도...
		//		(즉, 특별한 이벤트를 발생시키지 않더라도...)
		// 		자동으로 처리할 수 있는 영역
		
	});
	 */
	
	$(function()
	{
		//alert("함수 호출");
		
		// h1이 클릭되었을 때 어떤 동작을 할 수 있도록 처리
	 	//								↓
		//$("h1").click(h1이 클릭되었을 때 수행되어야 할 동작, 기능, 행위);
	 	//								↓
		//$("h1").click(h1이 클릭되었을 때 수행되어야 할 함수 정의);
	 	//								↓
		//$("h1").click(이름이 필요없는 함수 정의);
	 	
	 	$("h1").click(function()
	 	{
	 		//alert("클릭되었네요~ ㅎㅎㅎ");
	 		//alert($(this).html());
	 		//$(this).html("어떻게 될까요?");
	 		$(this).html($(this).html() + "★");
	 	})
	 	
	 	
	});
	
	
</script>

</head>
<!-- <body onload="test()"> -->
<body>
	<h1>김지민</h1>
	<h1>엄재용</h1>
	<h1>이주형</h1>
	<h1>김동민</h1>
	<h1>강혜성</h1>

</body>
</html>
```
### 7.16.3. JQTest03.html_$(this).html()
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/0849af5f-fb4b-4664-949a-94e67e0f6d6c)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest03.html</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

<style type="text/css">
*{margin:0px;padding:0px;}
div{margin:5px;padding:3px;border:3px solid black;border-radius: 10px;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		//alert("제이쿼리 인식~!!!");
		
		//$("div").click(동작);
		
		$("div").click(function()
		{
			//alert("테스트");
			
			//alert($(this).html());
			//	 -------- 클릭된 엘리먼트 객체 → (현재시점에선)div
			//--==>>
			/*
				<h1>A강의실</h1>
				<p>JAVA 수업 중</p>
			*/
			
			//alert($(this).text());
			//--==>>
			/*
				A강의실
				JAVA 수업 중
			*/
			
			//alert($("h1",this).text());
			//--==>> A강의실
			//alert($("p",this).text());
			//--==>> JAVA 수업 중
			
			var h1 = $("h1",this).text();
			var p = $("p",this).text();
			
			alert(h1 + " / " + p);
			//--==>> A강의실 / JAVA 수업 중
		});
		
	});
</script>

</head>
<body>

<div>
	<h1>A강의실</h1>
	<p>JAVA 수업 중</p>
</div>
<div>
	<h1>B강의실</h1>
	<p>닷넷 수업 중</p>
</div>
<div>
	<h1>C강의실</h1>
	<p>오라클 수업 중</p>
</div>
<div>
	<h1>D강의실</h1>
	<p>ASP 수업 중</p>
</div>
<div>
	<h1>E강의실</h1>
	<p>JSP 수업 중</p>
</div>
<div>
	<h1>F강의실</h1>
	<p>제이쿼리 수업 중</p>
</div>

</body>
</html>
```
### 7.16.4. JQTest04.html_$(this).text()
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/7c72b245-0956-452a-8adc-b9ed57f25760)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest04.html</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		/* $("h1").on("click",function()
		{
			
			$(this).html(function()
			{
				return html+"★";
			});
		}) */
		
		$("h1").on("click",function()
		{
			
			$(this).text($(this).text()+"★");
			//console.log($(this).html()+"★");
			//$(this).html($(this).html() + "★");
		});
		
		// ※ 이벤트 강제 발생시키기: trigger(트리거)
		$("input[type=button]").click(function()
		{
			//alert("확인~!!!");
			
			// 강제로 첫 번째 h1 태그에 click 이벤트를 발생시키도록 하겠다.
			//$("h1").first().click();
			
			// 강제로 마지막 h1 태그에 click 이벤트를 발생시키도록 하겠다.
			$("h1").last().click();
			
		});
		
	});
</script>

</head>
<body>

<input type="button" value="트리거 작동" />
<hr>

<h1>click start1: </h1>
<h1>click start2: </h1>


</body>
</html>
```
### 7.16.5. JQTest05.html_키보드 관련 이벤트
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/fc684192-2486-428a-96d8-0649b68ae373)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/18a999c6-f787-49dc-a6d5-2854ab99bf6b)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/223123fc-eaa2-4ab0-b419-7dc94f518e37)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest05</title>
<link rel="stylesheet" type="text/css" href="css/style_.css">

<style type="text/css">
.outer{width:200px;height:200px;background:orange;padding:50px;margin:10px;}
.inner{width:100%;height:100%;background:red;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		//alert("확인");
		
		// ◈ 키보드 관련 이벤트 ------------------------------------------------------
		//$("textarea").keydown(동작);
		//$("textarea").keydown(function()
		$("textarea").keyup(function()
		{
			//alert("확인");
			
			// 입력 컨트롤(textarea)에 입력된 값을 경고창을 통해 확인
			//alert($(this).html());		//--html() → (x)
			//alert($(this).text());			//--text() → (x)
			//alert($(this).val());			//--val() → (o) -> 값은 가져오지만, keydown일 시입력하기 이전의 값을 가져옴
			
			var len = $(this).val().length;
			//alert(len);
			
			var remain = 30 - len;
			//alert(remain);
			
			$("h3").html(remain);
			
			// remain 이 0이 되었을 경우...
			// 입력을 막아버린다던지.. 경고창을 띄우던지..
			// 등의 추가적인 액션 처리를 할 수 있다.
			
			if(remain<=10 && remain>=1)
			{
				$("h3").css("color","orange");
			}
			else if(remain <= 0)
			{
				$("h3").css("color","red").html("더 이상 입력 불가");
				$(this).css("background","#f2f2f2").attr("disabled","disabled");
				
			}
			else
			{
				$("h3").css("color","black");
			}
			
			$("button").click(function()
			{
				$("textarea").removeAttr("disabled");
				$("textarea").focus();
				$("textarea").css("background","inherit")
			})
		});
		
		// ◈ 마우스 관련 이벤트 ------------------------------------------------------
		/* mouseover는 */
		$(".outer").mouseover(function()
		{
			//alert("확인");
			$("body").append($("<div>mouseover</div>").css("color","blue"));
			
		}).mouseenter(function()
		{
			$("body").append($("<div>mouseenter</div>").css("color","red"));
		});
	});
	
</script>

</head>
<body class="section">

<div class="layout">
	<div>
		<h1>키보드 관련 이벤트</h1>
		<hr />
		
		<div class="info_box" style="display:inline-block;">
			<ul>
				<li>1. keydown: 	키가 눌렸을 때 </li>
				<li>2. keypress: 	키가 아래로 눌려졌을 때 </li>
				<li>3. keyup 순으로 이벤트 발생 </li>
			</ul>
		</div>
	
		<div class="result_box">
			<p>남기고 싶은 말</p>
			<h3>30</h3>
			<textarea name="" id="" cols="70" rows="5"></textarea>
			
			<button type="button" class="btn">해제</button>
		</div>
	</div>
	
	<div>
		<h1>마우스 관련 이벤트</h1>
		<hr />
		
		<div class="info_box" style="display:inline-block;">
			<ul>
				<li>mouseenter</li>
				<li>mouseleave</li>
				<li>mousemove</li>
				<li>mouseout</li>
				<li>mouseover</li>
				<li>mouseup 등</li>
			</ul>
		</div>
	
		<div class="result_box">
			<div class="outer">
				 <!-- mouseover영역: enter 뒤에도 존재! -->
				<div class="inner">
					<!-- mouseenter -->
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
```
### 7.16.6. JQTest06.html_.scroll(), $(document).height(): 문서 높이, $(document).height():브라우저 높이
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/2e73d401-65f0-481f-a80f-b5e0a8e8d9a1)
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest06.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 초기 게시물 구성 → 스크롤 생성 ---------------------------------
		var docHeight = $(document).height();	// **$(document).height(): 문서의 높이**
		
		// 테스트
		//alert(docHeight);
		//--==>>886 	// 숫자가 다를 것
		
		// 테스트
		//alert($(window).scrollTop());
		//alert($(window).height());				//**$(window).height(): 브라우저 높이**
		
		var scrollHeight = $(window).scrollTop() + $(window).height();
		
		for(var i=0; i<30; i++)
		{
			$("<h3>기존의 읽어온 게시물 "
					+ $(document).height() + "/"
					+ $(window).scrollTop() + "/"	//**같은 값 유지**
					+ $(window).height() 			//**같은 값 유지**
					+ "</h3>").appendTo("body");
			// append  와 .appendTo는 붙이는 위치가 다름
			// append: 	 기준 append 붙이는 위치
			// appendTo: 붙이는 위치 appendTo 기준 
		}
		
		// --------------------------------- 초기 게시물 구성 → 스크롤 생성 
	
		$(window).scroll(function()
		{
			// 테스트
			//alert("확인");
			
			var docHeight = $(document).height();
			var scrollHeight = $(window).scrollTop() + $(window).height();
			
			// 스크롤이 바닥으로 내려졌을 때
			// 태그 10개 추가하여 body에 붙이기
			if(docHeight == scrollHeight)
			{
				for (var i = 0; i < 10; i++)
				{
					$("<h3>추가로 읽어온 게시물 "
							+ $(document).height() + "/"
							+ $(window).scrollTop() + "/"
							+ $(window).height()
							+ "</h3>").appendTo("body");
				}
			}
		});
		
	});
</script>
</head>
<body>
	
</body>
</html>
```
### 7.16.7. JQTest07.html_type="checkbox" 속성 선택
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/0ed4594d-b54b-4f9c-87bb-5fc92e06f0c6)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest07.html</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

   /*
   $(function()
   {
      
   });
   */
   
   $(document).ready(function()
   {
      /*
      $("#allCheck").change(function()
      {
         // 테스트
         alert("change~!!!");
      });
      */
      
      $("#allCheck").click(function()
      {
         // 테스트
         // alert("click~!!!");
         
         // 테스트
         //alert( $(this).attr("checked") );      //-- undefined / undefined
         
         //alert( $(this).prop("checked") );      //-- 속성 → true / false
         //alert( this.checked );            //-- 속성 → true / false
         //alert( $(this).is(":checked") );      //-- 속성 → true / false
         
         // 방법 1.
         //$("div > input:checkbox").prop("checked", this.checked);
         
         // 방법 2.
         // 『$(선택자).children()』
         $("div").children().prop("checked",this.checked);
         
         
         
      });
   });

</script>

</head>
<body>

<label>
   <input type="checkbox" id="allCheck">
   <span style="font-weight: bold;">모두 선택</span>
</label>

<div>
   <input type="checkbox" id="check1"><label for="check1">바나나</label><br>
   <input type="checkbox" id="check2"><label for="check2">딸기</label><br>
   <input type="checkbox" id="check3"><label for="check3">복숭아</label><br>
   <input type="checkbox" id="check4"><label for="check4">수박</label><br>
   <input type="checkbox" id="check5"><label for="check5">멜론</label><br>
   
   <!--
    <label>
      <input type="checkbox">딸기
   </label><br>
   <label>
      <input type="checkbox">복숭아
   </label><br>
   <label>
      <input type="checkbox">수박
   </label><br>
   <label>
      <input type="checkbox">멜론
   </label><br> 
   -->
   
</div>

</body>
</html>
```
### 7.16.8. JQTest08.html_toggle
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/898974a4-903f-410e-8b7f-c667750873c6)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest08</title>
<link rel="stylesheet" type="text/css" href="css/style_.css">
<style type="text/css">
	div.page{border: 1px solid gray;padding:3px;margin:2px;position:absolute;right: 10px;
		/* top:88px; */top:208px;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("button").css({"display":"block", "width":"200px"});
		
		$("button").click(function()
		{
			//$(".page").toggle("slow");
			//$(this).next().toggle("slow");
			
			// 『$(선택자).next()』: document 구조 상 다음 엘리먼트
			
			//$(this).next().toggle(500);		// **숫자가 클수록 느림**
			//$(this).next().toggle(300);
			//$(this).next().toggle(100);
			
			//$(this).next().toggle(300, 동작);
			$(this).next().toggle(300, function()
			{
				alert("토글 기능 테스트 완료~!!!");
			});
		});
	});
</script>

</head>
<body class="section">


<div class="layout">
	<div>
		<h1>toggle</h1> <!-- 에스키모 단추? -->
		<br>
	</div>
	
	<div class="info_box">
		show()/hide()/toggle()<br>
		slideDown()/slideUp()/slideToggle()<br>
		fadeIn()/fadeOut()/fadeToggle()<br>
	</div>
</div>

<button class="btn">Toggle(토글) 버튼</button>
<div class="page">
	<h1>jQuery Toggle</h1>
	<p>
		show()/hide()<br>
		toggle()<br>
		slideDown()/slideUp()<br>
		slideToggle()<br>
		fadeIn()/fadeOut()<br>
		fadeToggle()<br>
	</p>
</div>

<button class="btn">Toggle(토글) 버튼</button>
<div class="page">
	<h1>jQuery Toggle</h1>
	<p>
		show()/hide()<br>
		toggle()<br>
		slideDown()/slideUp()<br>
		slideToggle()<br>
		fadeIn()/fadeOut()<br>
		fadeToggle()<br>
	</p>
</div>

<button class="btn">Toggle(토글) 버튼</button>
<div class="page">
	<h1>jQuery Toggle</h1>
	<p>
		show()/hide()<br>
		toggle()<br>
		slideDown()/slideUp()<br>
		slideToggle()<br>
		fadeIn()/fadeOut()<br>
		fadeToggle()<br>
	</p>
</div>

<button class="btn">Toggle(토글) 버튼</button>
<div class="page">
	<h1>jQuery Toggle</h1>
	<p>
		show()/hide()<br>
		toggle()<br>
		slideDown()/slideUp()<br>
		slideToggle()<br>
		fadeIn()/fadeOut()<br>
		fadeToggle()<br>
	</p>
</div>

<button class="btn">Toggle(토글) 버튼</button>
<div class="page">
	<h1>jQuery Toggle</h1>
	<p>
		show()/hide()<br>
		toggle()<br>
		slideDown()/slideUp()<br>
		slideToggle()<br>
		fadeIn()/fadeOut()<br>
		fadeToggle()<br>
	</p>
</div>

</body>
</html>
```
### 7.16.9. JQTest09.html_jquery.innerfade.js
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/45d27152-2b20-4c1a-82bd-fd3c2c9c1786)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest09.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	ul{list-style:none;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.innerfade.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		// jquery.innerfade.js
		
		$("#innerFade").innerfade(
		{
			animationtype: 'fade'	// Type of animation 'fade' or 'slide' (Default: 'fade')
			, speed: 'slow'			// Fading-/Sliding-Speed in milliseconds or keywords (slow, normal or fast) (Default: 'normal')
			, timeout: '2000'		// Time between the fades in milliseconds (Default: '2000')
			, type: 'random'		// Type of slideshow: 'sequence', 'random' or 'random_start' (Default: 'sequence') 
		}		
		);
		
	})
</script>

</head>
<body>

<ul id="innerFade">
	<li><img src="images/obj01.jpg" alt="" style="width:50%" /></li>
	<li><img src="images/obj02.jpg" alt="" style="width:50%" /></li>
	<li><img src="images/obj03.jpg" alt="" style="width:50%" /></li>
	<li><img src="images/obj04.jpg" alt="" style="width:50%" /></li>
	<li><img src="images/obj05.jpg" alt="" style="width:50%" /></li>
</ul>

</body>
</html>
```
### 7.16.10. JQTest10.html_일정: 자바스크립트
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/fcf57202-c3ea-47b0-a107-b8d4d0636d84)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest10.html</title>
<link rel="stylesheet" type="text/css" href="css/style_.css">
<style type="text/css">
body,div,span,table,th,td{font-size: 12px;}
#list{border: 1px solid gray;border-collapse:collapse;width:800px;}
#list th{width:152px;}
#list td{width:162px;}
#list th, #list td{border: 1px solid gray;padding:3px;}
</style>

<script type="text/javascript">
function add(){
	
	var item = document.getElementById("item").value;				// 제목
	var week = Number(document.getElementById("week").value);		// 요일
	var start = Number(document.getElementById("start").value);	// 시작시간
	var end = Number(document.getElementById("end").value);		// 종료시간
	var color = document.getElementById("color").value;				// 색상
	//console.log(tit+'/'+week+'/'+start+'/'+end+'/'+color);
	
	
	// 내가푼 풀이 -----------------------------------------------------------------
	/* 
	if(start<=end){
		for(var i = start; i<=end; i++){
			var changeE = document.getElementById("list").getElementsByTagName("tr")[i].getElementsByTagName("td")[week-1];
			
			changeE.innerText = item;
			changeE.style.backgroundColor = color;
		}
	}
	 */
	
	// 함께 푼 풀이 -----------------------------------------------------------------
	var tds = document.getElementsByTagName("td");				// 모든 태그들
	//alert(tds.length);
	
	// 월 11:00 ~ 12:00
	// → 0; 4; i+4;
	
	// 요일 0 1 2 3
	// 요일 (td) 이 4가지 이기 때문에... → *4
	//for(var i = (week + (start-1) * 4); i<=(week+(end-1)*4); i+=4)		//→ 0 1 2 3
	for(var i = ((week-1) + (start-1) * 4); i<=((week-1)+(end-1)*4); i+=4)	//→ 1 2 3 4
	{
		tds[i].innerText = item;
		tds[i].style.backgroundColor = color;
	};
}
</script>

</head>
<body class="section">

<div>
	<h1>일정: 자바스크립트</h1>
	<hr />
</div>

<div class="layout">
<table id="list">
	<tr>
		<th>&nbsp;</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
	</tr>
	<tr>
		<th>11:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>12:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>13:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>14:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>15:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>16:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>17:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>18:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</div>

<div style="margin-top: 20px;">
	<label for="item">제목</label>
	<input type="text" id="item" value="테스트">
	<br>
	
	<label for="week">날짜</label>
	<select name="week" id="week">
		<!-- 
		<option value="0">월요일</option>
		<option value="1">화요일</option>
		<option value="2">수요일</option>
		<option value="3">목요일</option>
		 -->
		<option value="1">월요일</option>
		<option value="2">화요일</option>
		<option value="3">수요일</option>
		<option value="4">목요일</option>
	</select>
	<br>
	
	<label for="start">시간</label>
	<select name="start" id="start">
		<option value="1">11:00</option>
		<option value="2" selected>12:00</option>
		<option value="3">13:00</option>
		<option value="4">14:00</option>
		<option value="5">15:00</option>
		<option value="6">16:00</option>
		<option value="7">17:00</option>
		<option value="8">18:00</option>
	</select>
	~
	<select name="end" id="end">
		<option value="1">11:00</option>
		<option value="2">12:00</option>
		<option value="3">13:00</option>
		<option value="4">14:00</option>
		<option value="5" selected>15:00</option>
		<option value="6">16:00</option>
		<option value="7">17:00</option>
		<option value="8">18:00</option>
	</select>
	<br>
	
	<label for="color">색상</label>
	<select name="color" id="color">
		<!-- <option value="#ff3300">빨강</option>
		<option value="#ffff33">노랑</option>
		<option value="#7799ff">파랑</option>
		<option value="#808080">검정</option> -->
		<option value="#F94144">빨강</option>
		<option value="#F9C74F">노랑</option>
		<option value="#38A3A5">파랑</option>
		<option value="#415A77">검정</option>
	</select>
	<br>
	
	<input class="btn" type="button" value="일정추가하기" style="margin-top:15px;" onclick="add()" />
	
</div>

</body>
</html>
```
### 7.16.11. JQTest11.html_일정: 제이쿼리
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/475d0d6f-e2ec-4ab8-a481-a7a35113d3d5)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQTest11.html</title>
<link rel="stylesheet" type="text/css" href="css/style_.css">
<style type="text/css">
body,div,span,table,th,td{font-size: 12px;}
#list{border: 1px solid gray;border-collapse:collapse;width:800px;}
#list th{width:152px;}
#list td{width:162px;}
#list th, #list td{border: 1px solid gray;padding:3px;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

/* eq, children() */
$(function()
{
	
	$('.btn').on("click",function(){
		
		var item = $("#item").val();
		var week = parseInt($("#week").val());
		var start = parseInt($("#start").val());
		var end = parseInt($("#end").val());
		var color = $("#color").val();
		//console.log(item+'/'+week+'/'+start+'/'+end+'/'+color);
		
		// javascript 로 처리했던 기능을 jQuery 로 구성하면 더 간단하다.
		//	1. 모든 tr 들 중 원하는 행을 찾고 (→ eq())
		//	2. 그렇게 찾은 tr 의 자식 td 들 중 (→ children())
		//		원하는 td를 찾아서 (→ eq()) 텍스트를 (→ text()) 삽입하고 색을 바꾼다. (→ css())
		
		// 내가푼 풀이 -----------------------------------------------------------------
		/* if(start<=end){
			for(var i = (start+1); i<=(end+1); i++){
				$("#list tr:nth-child("+ i +") td:nth-child("+ (week+1) +")").css('background',color).text(item);
			}
		} */
		
		// 함께 푼 풀이 -----------------------------------------------------------------
		for (var i = start; i <= end; i++)
		{
			//$("#list tr").eq(i).text("선택");
			
			//$("#list tr").eq(i).children().text("선택");
			
			$("#list tr").eq(i).children().eq(week).css("background",color).text(item);
			
		}
	});
	
	
	
});
function add(){
	//console.log("aaa");
	
}
</script>

</head>
<body class="section">

<div>
	<h1>일정: 제이쿼리</h1>
	<hr />
</div>

<div class="layout">
<table id="list">
	<tr>
		<th>&nbsp;</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
	</tr>
	<tr>
		<th>11:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>12:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>13:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>14:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>15:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>16:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>17:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<th>18:00</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</div>

<div style="margin-top: 20px;">
	<label for="item">제목</label>
	<input type="text" id="item" value="테스트">
	<br>
	
	<label for="week">날짜</label>
	<select name="week" id="week">
		<option value="1">월요일</option>
		<option value="2">화요일</option>
		<option value="3">수요일</option>
		<option value="4">목요일</option>
	</select>
	<br>
	
	<label for="start">시간</label>
	<select name="start" id="start">
		<option value="1">11:00</option>
		<option value="2" selected>12:00</option>
		<option value="3">13:00</option>
		<option value="4">14:00</option>
		<option value="5">15:00</option>
		<option value="6">16:00</option>
		<option value="7">17:00</option>
		<option value="8">18:00</option>
	</select>
	~
	<select name="end" id="end">
		<option value="1">11:00</option>
		<option value="2">12:00</option>
		<option value="3">13:00</option>
		<option value="4" selected>14:00</option>
		<option value="5">15:00</option>
		<option value="6">16:00</option>
		<option value="7">17:00</option>
		<option value="8">18:00</option>
	</select>
	<br>
	
	<label for="color">색상</label>
	<select name="color" id="color">
		<!-- <option value="#ff3300">빨강</option>
		<option value="#ffff33">노랑</option>
		<option value="#7799ff">파랑</option>
		<option value="#808080">검정</option> -->
		<option value="#F94144">빨강</option>
		<option value="#F9C74F">노랑</option>
		<option value="#38A3A5">파랑</option>
		<option value="#415A77">검정</option>
	</select>
	<br>
	
	<input class="btn" type="button" value="일정추가하기" style="margin-top:15px;" onclick="add()" />
	
</div>

</body>
</html>
```

<br>

## 7.17. [AJAX 이용하여 텍스트 바꾸기]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/09c8d532-324e-4d63-917b-89a7a60da041)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/387e5693-6a34-45b5-9faa-1a2dc01fad3c)

### 7.17.1. ajaxTarget.txt
``` txt
AJAX is not a programming language.
AJAX is a technique for accessing web server from a web page.
```
### 7.17.2. AjaxTest01.html
``` java
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest01.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript">

function loadXMLDocs()
{
	//alert("함수 호출~!!!");
	
	// XMLHttpRequest 객체(→ AJAX 객체) 를 담을 변수 선언
	var xmlHttp;
	
	// (클라이언트 측) 브라우저에 따른 분기
	// (클라이언트 측에서) 자신의 브라우저가 XMLHttpRequest 를 지원하고 있는 상황이라면
	if(window.XMLHttpRequest)
	{
		// 테스트
		//alert("XMLHttpRequsest 지원~!!!");
		
		// (이렇게...) 이와 같은 방법으로 객체를 생성하고
		xmlHttp = new XMLHttpRequest();
	}
	else
	{
		// 테스트
		//alert("XMLHttpRequsest 지원 하지 않음~!!!");
		
		// (이렇게...) 이와 같은 방법으로 객체를 생성해라
		xmlHttp = new ActiveXObejct("Microsoft.XMLHTTP");
	}
	
	// ※ 객체를 생성하는 방법의 차이만 있을 뿐 
	//	  여기까지 수행하면 XMLHttpRequset 객체(→ AJAX 객체) 생성 완료~!!!
	
	//**- 함수 호출 → 상황 연출
	//**- 상황 연출 → 함수 호출 ==> 콜백함수(아래가 그 부분)
	
	// 『xmlHttp』 : XMLHttpRequsest 객체
	//	서버로부터 응답이 오면 『readystatechange』 이벤트가 발생하게 된다.
	// 『onreadystatechange』: readystatechange 이벤트가 발생했을 때
	// 동작할 수 있도록 이벤트 헨들러를 등록하는 과정.
	// 즉, 이와같은 이벤트가 발생하게 되면.. 다음의 내용처럼 동작해라~!!! 라는 의미.
	//xmlHttp.onreadystatechange = 기능, 동작, 행위;
	xmlHttp.onreadystatechange = function()
	// ** onclick 처럼 readystatecnage가 함수고, 앞에 on 붙인 것 **
	{
		// 테스트
		//alert("이벤트 발생: readyState →"+ xmlHttp.readyState);
		
		// 응답이 올 때마다
		// readyState 가 그 상황에서의 XMLHttpRequest 상태를 저장하게 된다.
		// 즉, readyState 는 XMLHttpRequest 객체의 property 이다.
		// ==> readyStatechage 이벤트는
		//	   readyState 가 변경될 때 마다 발생하게 된다.
		
		// ※ 『XMLHttpRequest』의 『readyState』는 0에서 4까지 순차적으로 변환한다.
		//	  0 → 요청이 초기화 되지 않음.
		//	  1 → 서버 연결이 이루어지지 않음.
		//	  2 → 요청이 수신됨.
		//	  3 → 요청을 처리중.
		//	  4 → 요청의 처리가 종료되고, 응답이 준비됨.
		
		// 요청의 처리가 종료되고 응답이 준비된 상태라면...
		if (xmlHttp.readyState == 4)
		{
			// ※ 『XMLHttpRequest』 의 『status』는 『HTTP Status』 코드를 의미한다.
			//	  200 → 올바른 응답
			//	  40x → 클라이언트 측 에러
			//	  50x → 서버 측 에러
			
			if(xmlHttp.status == 200)
			{
				// 이 구문을 통해 서버로부터 응답을 정상적으로 받아을 때
				// 그 응답을 가져와서 DOM 을 업데이트 하겠다는 의미.
				// 응답의 속성에는 크게 두가지 가 있는데
				// 『responseText』는 텍스트 형식의 응답일 경우 사용하게 되고
				// 『responseXML』은 응답이 XML 형식일 경우 사용하게 된다.
				document.getElementById("myDiv").innerHTML = xmlHttp.responseText;
			}
		}
	};
	
	// 『XMLHttpRequset』의 『open("페이지 요청 방식","URL",async)』
	//	XMLHttpRequest 객체를 필요한 설정으로 초기화하는데 사용하는 메소드이다.
	// GET 방식이 아닌 POST 방식으로 요청하기 위해서는 
	// 『xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); xmlHttp.send(input1=value1&input2=value2);』
	// 와 같은 구문으로 헤더를 추가해 주어야 한다.
	xmlHttp.open("GET", "ajaxTarget.txt", true);
	xmlHttp.send("");
} 

/* 
function loadXMLDocs()
{
	var xmlHttp;

	if(window.XMLHttpRequest)
		xmlHttp = new XMLHttpRequest();
	else
		xmlHttp = new ActiveObject("Microsoft.XMLHTTP");

	xmlHttp.onreadystatechange = function()
	{
		
		
		if(xmlHttp.readyState == 4)
		{
			if(xmlHttp.status == 200)
				document.getElementById("myDiv").innerHTML = xmlHttp.responseText;
		}
	};
	
	xmlHttp.open("GET","ajaxTarget.txt", true);
	xmlHttp.send("");
}
 */
/* 
function loadXMLDocs()
{
	//alert("확인");
	
	// 함수 선언
	
	// 브라우저 XMLHttpRequset 객체 사용에 따른 선언
	
	// 콜백함수 readystatechage 가 일어나면 실행
		// readyStae 요청이 종료되고 응답이 실행 될 때
			// 응답이 올바른 응답일 때
				// 문서의 #myDiv를 찾아서 텍스트 형식 응답처리해라.
	
	// 페이지 요청방식에 따라 처리
	// 보내면서 마무리.
}
*/
</script>
</head>
<body class="section">

<div class="layout">
	<div id="myDiv">
		<h1>AJAX 를 이용하여 이 텍스트를 바꾸어본다.</h1>
	</div>
	
	<button class="btn" type="button" onclick="loadXMLDocs()">Conetnet 바꾸기</button>
</div>

</body>
</html>
```

<br>

## 7.18. [AJAX 기본 실습: 페이지 내 컨트롤 확인]
| 번호 | 파일명          | 비고                                                             | 코드                                                                                                                                                                                                                                                                                                |
|------|-----------------|------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 1    |                 | test02send.do                                                    | 사용자요청                                                                                                                                                                                                                                                                                          |
| 2    | web.xml         |                                                                  | ``` html <servlet>      <servlet-name>test02send</servlet-name><br> <servlet-class>com.test.ajax.Test02dSend</servlet-class>   </servlet>  <servlet-mapping>    <servlet-name>test02send</servlet-name>    <url-pattern>/test02send.do</url-pattern>   </servlet-mapping> ```                             | 
| 3    | Test02Send.java | - 물리적: 자바파일 - 법적지위: Controller ㄴ Controller(Servlet) | ``` java String view = "AjaxTest02.jsp";  RequestDispatcher dispatcher = request.getRequestDispatcher(view); dispatcher.forward(request, response); ```                                                                                                                                                         |
| 4    | AjaxTest02.jsp  |                                                                  | ```java var url = "test02.do?n1="+ n1 +"&n2="+ n2; ajax = createAjax(); ajax.open("GET", url, true); ajax.onreadystatechange = function() { if(ajax.readyState == 4) { if(ajax.status == 200) { callBack(); } } }; ajax.send("");```                                                                           |
| 5    |                 | test02.do                                                        | 사용자 요청                                                                                                                                                                                                                                                                                         |
| 6    | web.xml         |                                                                  | ``` html <servlet>    <servlet-name>test02</servlet-name>    <servlet-class>com.test.ajax.Test02</servlet-class>   </servlet>      <servlet-mapping>    <servlet-name>test02</servlet-name>    <url-pattern>/test02.do</url-pattern>   </servlet-mapping> ```                                                   |
| 7    | Test02.java     | - 물리적: 자바파일 - 법적지위: Controller ㄴ Controller(Servlet) | ``` java int n1 = Integer.parseInt(request.getParameter("n1")); int n2 = Integer.parseInt(request.getParameter("n2"));  int result = n1 + n2;  request.setAttribute("result", result);  RequestDispatcher dispatcher = request.getRequestDispatcher("Test02_ok.jsp"); dispatcher.forward(request, response);``` |
| 8    | Test02_ok.jsp   |                                                                  | ${result}                                                                                                                                                                                                                                                                                           |
| 9    | AjaxTest02.jsp  |                                                                  | ``` java function callBack() { var data = ajax.responseText; document.getElementById("result").value = data; ```  }                                                                                                                                                                                              |
### 7.18.1. ajax.js
``` java
/**
 * ajax.js
 */

var ajax = null;

// AJAX 객체(→ XMLHttpRequest 객체) 생성 함수
function createAjax()
{
	/*
	// ActiveXObject 를 지원한느 브라우저 라면...
	if(window.ActiveXObject)	//-- IE 7 이전
	{
		//return new ActiveXObejct("Microsoft.XMLHTTP");
		return new ActiveXObejct("Msxml2.XMLHTTP");
		//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		//	 (ActiveXObject 객체 → XMLHttpRequest 객체를 대신할 수 있는 객체)
	}
	else						//-- 그 외 브라우저
	{
		if(window.XMLHttpRequest)//-- XMLHttpRequest 객체 지원 브라우저
		{
			return new XMLHttpRequest();
			//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		}
		else					//-- AJAX 를 지원하지 않는 브라우저
		{
			return null;
			//-- AJAX 사용할 수 없으므로 null 을 반환해라.
		}
		
		return new XMLHttpRequest();
	}
	*/
	
	/*
	if(window.ActiveXObject)	//-- IE 7 이전
		return new ActiveXObejct("Microsoft.XMLHTTP");
	else if(window.XMLHttpRequest)//-- XMLHttpRequest 객체 지원 브라우저
			return new XMLHttpRequest();
	else						//-- AJAX 를 지원하지 않는 브라우저
		return null;
	*/
	
	if(window.XMLHttpRequest)//-- XMLHttpRequest 객체 지원 브라우저
		return new XMLHttpRequest();
	else if(window.ActiveXObject)	//-- IE 7 이전
		return new ActiveXObejct("Microsoft.XMLHTTP");
	else						//-- AJAX 를 지원하지 않는 브라우저
		return null;
}
```
### 7.18.2. AjaxTest02.jsp
``` java
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
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<style type="text/css">
	.short{width: 50px; text-align:right;}
</style>

<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">
function sum()
{
	//alert("확인");
	
	// 데이터 수집
	var n1 = document.getElementById("num1").value;
	var n2 = document.getElementById("num2").value;
	
	// URL 구성
	var url = "test02.do?n1="+ n1 +"&n2="+ n2;
	
	// XMLHttpRequest 객체 생성(→ AJAX 객체)
	ajax = createAjax();			//-- ajax.js
	
	// 『GET』 : 데이터 전송 및 페이지 요청 방식(POST 사용 가능. POST 사용 시 헤더 추가 필요)
	// 『url』 : AJAX 요청 페이지(데이터 수신 및 응답 페이지)
	// 『true』: boolean → true(비동기), false(동기), AJAX 처리 과정에서 동기는 사용 안함.
	ajax.open("GET", url, true);
	//-- 실제 서버와의 연결이 아니고, 일종의 큰 의미에서 환경 설정 부분으로 이해하는 것이 좋겠다.
	//	 (실제 서버 연결은 나중에...)
	
	// ajax 객체(→ XMLHttpRequest 객체)의 readyState 속성은
	// 각 단계별로 변화되며, 0 부터 4 까지 순차적으로 증가하는 형태로 변화한다.
	// 그 때마다... 『readystatechange』 이벤트가 발생하게 된다.
	ajax.onreadystatechange = function()
	{
		// 그 중에서...(0 부터 4 까지의 상태 중에서...)
		// 4가 되는 순간이 요청했던 서버로부터 응답 준비가 완료된 시점이기 때문에
		// 4 인 경우.. 수행해야 할 업무를 진행할수 있도록 처리한다.
		if(ajax.readyState == 4)
		{
			// 서버로부터 응답이 완료되었다 하더라도
			// 그 과정에서 데이터가 올바른 것인지, 에러 메세지를 받은 것인지
			// 알수 없기 때문에 서버로부터 응답 받은 코드를 확인한 후
			// 업무를 진행할 수 있도록 처리(구성)한다.
			if(ajax.status == 200)
			{
				// 업무진행
				//-- 업무 코드를 외부로 추출
				callBack();
			}
		}
	};
	
	// 실제 서버에서 AJAX 요청을 한다.(즉, 이부분이 진짜 연결 작업이다.)
	// GET 방식으로 데이터를 전송하는 경우... 인자값이 ""
	// POST 방식으로 데이터를 전송하는 경우... 인자값이 해당 데이터를 넣는다.
	// 현재는 GET 방식의 요청이다. (비워두는 것은 하지 말자.)
	ajax.send("");
}

// 추출된 업무 코드
//-- AJAX 요청이 완료된 후 호출되는 최종 업무 처리 함수
function callBack()
{
	// 여기서는 두 가지 방법 중 하나로 데이터를 바인딩 한다.
	
	// 1. 서버에서 응답한 데이터가 텍스트 일 경우(단일 데이터)
	var data = ajax.responseText;
	
	// 2. 서버에서 응답한 데이터가 XML 일 경우(다랑의 데이터)
	//var data = ajax.responseXML;	//** XML: 데이터를 구조화시킬 수 있는포멧, 단-수식하는 데이터가 더 많을 수 있음**
	
	// 바인딩한 데이터를 업무에 적용한다.
	document.getElementById("result").value = data;
	
}

</script>

</head>
<body class="section">

<div>
	<h1>AJAX 기본 실습</h1>
	<hr />
</div>

<div class="layout">
	<input type="text" id="num1" class="txt short">
	+
	<input type="text" id="num2" class="txt short">
	<input type="button" value="=" class="btn" onclick="sum()" style="min-width: 30px;">
	<input type="text" id="result" class="txt short">


	<p>같은 페이지에 있는 기타 다른 요소들</p>
	
	<input type="text" />
	
	<input type="text">
	<br>
	
	<input type="checkbox" name="check" value="check1"> 체크1
	<input type="checkbox" name="check" value="check2"> 체크2
	<br>
	
	<input type="radio" name="radio" value="rdo1"> 라디오1
	<input type="radio" name="radio" value="rdo2"> 라디오2
	<br>
	
	<select id="sel">
		<option value="1">선택1</option>
		<option value="2">선택2</option>
		<option value="3">선택3</option>
	</select>

</div>
</body>
</html>
```
### 7.18.3. Test02_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
${result}
```
### 7.18.4. test02send.do
... 내용 없음 ....  
### 7.18.5. /AjaxApp/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>AjaxApp</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
   <!-- AJAX 관련 실습 -->
   <!-- AjaxTest02 → 페이지 내 컨트롤 확인 -->
   <servlet>
  	<servlet-name>test02send</servlet-name>
  	<servlet-class>com.test.ajax.Test02Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test02send</servlet-name>
  	<url-pattern>/test02send.do</url-pattern>
  </servlet-mapping>
  
  
  
   <servlet>
  	<servlet-name>test02</servlet-name>
  	<servlet-class>com.test.ajax.Test02</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test02</servlet-name>
  	<url-pattern>/test02.do</url-pattern>
  </servlet-mapping>
</web-app>
```

<br>

## 7.19. [아이디 중복 검사]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/cc50c5c6-ebb8-4388-a858-1651d628ab6a)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/ced5c82f-dfab-4bcc-a046-754c74bf6381)

### 7.19.1. Test03.java
``` java
/* ==================
	Test02.java
=================== */

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(AjaxTets03.jsp)로 부터 넘어온 데이터 수신
		// → id
		String id = request.getParameter("id");
		
		// id 가 pbg 인 경우...
		// Model → DB 액션 처리 요청 → DAO(처리 요청)
		//								---------------
		//								DTO, Connection 활용
		//
		// → SELECT COUNT(*) AS COUNT FROM MEMBER WHERE ID = 'pbg';
		//			 -----------------						  -----
		//				수신 처리						넘겨주는 데이터
		//				--==>> 1 OR 0
		
		// ※ DB 구성을 별도로 하지 않았기 때문에 컬렉션 자료구조로 대신함~!!!
		
		List<String> db = new ArrayList<String>();
		db.add("superman");
		db.add("batman");
		db.add("admin");
		
		int result = 0;
		
		for (String item : db)
		{
			if(item.equals(id))
			{
				result = 1;
			}
		}
		
		// 최종 result 에 1 이 남아있으면... 이미 존재하는 id → 사용 불가
		// 1로 바뀌지 않고 0이 남아있으면... 존재하지 않는 id → 사용 가능
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test03_ok.jsp");
		dispatcher.forward(request, response);
		
		
		
		
	}
}
```
### 7.19.2. Test03Send.java
``` java
/* ==================
	Test02Send.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03Send extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		//String view = "WEB-INF/view/AjaxTest03.jsp";
		String view = "AjaxTest03.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
		
	}
}
```
### 7.19.3. AjaxTest03.jsp
``` html
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
<title>AjaxTest03</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<style type="text/css">
	#result {display: inline-block; width: 250px; color:#F33;font-size:small;}
</style>

<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">
function check()
{
	//alert("확인");
	
	// 데이터 수집
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var addr = document.getElementById("addr").value;
	
	// URL 구성
	var url = "test03.do?id="+id;
	
	// AJAX 객체 (→ XMLHttpRequest 객체) 생성
	ajax = createAjax();
	
	// 환경 설정 (『open("요청방식", "URL", 비동기/동기)』)
	ajax.open("GET",url,true);
	
	ajax.onreadystatechange = function()
	{
		if(ajax.readyState == 4 && ajax.status == 200)
		{
			// 업무처리 (모듈화 → 외부로 추출)
			callBack();
			
		}
	};
	
	ajax.send("");
	
}

// 아이디 중복 검사의 결과(1 or 0)를 통보받아
// 사용자에게 메세지 출력 → span → #result
function callBack()
{
	// 외부로 추출된 업무 처리 내용 구성(responseText / responseXML)
	
	var data = ajax.responseText;
	
	data = parseInt(data);
	
	if(data==0)
	{
		document.getElementById("result").innerText = "사용 가능한 아이디입니다.";	
	}else
	{
		document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";	
		
	}
	
}

</script>

</head>
<body class="section">

<h1>회원가입</h1>

<div class="layout">
	<div class="info_box" style="display:inline-block;">
		<p>- Test03Send.java</p>
		<p>- AjaxTest03.jsp</p>
		<p>- ajax.js</p>
		<p>- main.css</p>
		<p>- Test03.java</p>
		<p>- Test03_ok.jsp</p>
		<p>- web.xml</p>
		<p>※ url: test03send.do / test03.do</p>
		<p>※ 자료구조 활용 → superman / batman / admin</p>
	</div><br>
	
	<div class="tbl_box">
		<table class="table">
			<tr>
				<th style="width: 80px">아이디</th>
				<td>
					<input type="text" id="id" class="txt conrtol" />
					<input type="button" value="중복검사" class="btn control" onclick="check()" />
					<span id="result"></span>
					<!-- <span id="result">사용 가능한 아이디입니다.</span> -->
					<!-- <span id="result">이미 사용중인 아이디입니다.</span> -->
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="name" class="txt conrtol" />
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" id="addr" class="txt conrtol" />
				</td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>
```
### 7.19.4. Test03_ok.jsp
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
${result}
```
### 7.19.5. test03send.do
... 내용 없음 ....
### 7.19.6. /AjaxApp/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>AjaxApp</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
   <!-- AJAX 관련 실습 -->
   <!-- AjaxTest02 → 페이지 내 컨트롤 확인 -->
   <servlet>
  	<servlet-name>test02send</servlet-name>
  	<servlet-class>com.test.ajax.Test02Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test02send</servlet-name>
  	<url-pattern>/test02send.do</url-pattern>
  </servlet-mapping>
  
  
   <servlet>
  	<servlet-name>test02</servlet-name>
  	<servlet-class>com.test.ajax.Test02</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test02</servlet-name>
  	<url-pattern>/test02.do</url-pattern>
  </servlet-mapping>
  
  <!-- ========================================= -->
  
  <!-- AJAX 관련 실습 -->
  <!-- AjaxTest03 → 아이디 중복 검사 -->
  <servlet>
  	<servlet-name>test03send</servlet-name>
  	<servlet-class>com.test.ajax.Test03Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test03send</servlet-name>
  	<url-pattern>/test03send.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>test03</servlet-name>
  	<servlet-class>com.test.ajax.Test03</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test03</servlet-name>
  	<url-pattern>/test03.do</url-pattern>
  </servlet-mapping>
  
  
</web-app>
```

<br>

## 7.20. [우편번호 검색]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/8e6caf3a-470d-4545-ab82-5e34e43d6ac7)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/60c17d89-1181-484b-a1f6-9705b46973df)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/2ec94d65-edcb-4986-a6d2-0406527d6106)

### 7.20.1. Test04.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test04 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 한글 깨짐 방지 처리
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(AjaxTest04.jsp)로 부터 넘어온 데이터 수신
		// → addr
		String addr = request.getParameter("addr");
		
		// ※ 여기서도 마찬가지로 우편번호 데이터베이스가 이다고 가정하고...
		//		대신 직접 자료구조(ArrayList) 구성
		ArrayList<ZipCodeDTO> db = new ArrayList<ZipCodeDTO>();
		
		if(addr.indexOf("서교") > -1)
		{
			//db.add(new ZipCodeDTO());
			db.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 40 (서교동, 서교동다세대주택)"));
			db.add(new ZipCodeDTO("04048", "서울특별시 마포구 독막로7길 34 (서교동, 서교빌딩)"));
			db.add(new ZipCodeDTO("04029", "서울특별시 마포구 동교로 116 (서교동, 서교동교회)"));
			db.add(new ZipCodeDTO("04030", "서울특별시 마포구 동교로 144-9 (서교동, 서교빌라)"));
			db.add(new ZipCodeDTO("04031", "서울특별시 마포구 동교로 162-6 (서교동, 서교동다세대빌라)"));
			db.add(new ZipCodeDTO("04035", "서울특별시 마포구 동교로12길 41-12 (서교동, 서교마임)"));
		}
		else if(addr.indexOf("연남") > -1)
		{
			db.add(new ZipCodeDTO("03984", "서울특별시 마포구 동교로 241 (연남동, 연남파크빌딩)"));
			db.add(new ZipCodeDTO("03983", "서울특별시 마포구 동교로 263-6 (연남동, 연남동주택)"));
			db.add(new ZipCodeDTO("03980", "서울특별시 마포구 동교로 273-20 (연남동, 연남빌라)"));
			db.add(new ZipCodeDTO("03990", "서울특별시 마포구 동교로27길 44-5 (연남동, 연남원룸)"));
			db.add(new ZipCodeDTO("03983", "서울특별시 마포구 동교로41길 36 (연남동, 연남동주민커뮤니티센터)"));
			db.add(new ZipCodeDTO("03984", "서울특별시 마포구 동교로41길 41 (연남동, 연남동41빌딩)"));
			db.add(new ZipCodeDTO("03983", "서울특별시 마포구 동교로45길 30 (연남동, 연남동주택)"));
			db.add(new ZipCodeDTO("03983", "서울특별시 마포구 동교로47길 26 (연남동, 연남동고깔집)"));
		}
		else if(addr.indexOf("망원") > -1)
		{
			db.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로8안길 23 (합정동, 망원정)"));
			db.add(new ZipCodeDTO("03954", "서울특별시 마포구 마포나루길 386 (망원동, 망원한강수영장)"));
			db.add(new ZipCodeDTO("03954", "서울특별시 마포구 마포나루길 407 (망원동, 망원2호)"));
			db.add(new ZipCodeDTO("04085", "서울특별시 마포구 마포나루길 594 (합정동, 망원수상훈련장)"));
			db.add(new ZipCodeDTO("04006", "서울특별시 마포구 망원로 12 (망원동, 망원아트빌라)"));
			db.add(new ZipCodeDTO("04007", "서울특별시 마포구 망원로 28 (망원동, 망원1-1공영주차장)"));
			db.add(new ZipCodeDTO("04007", "서울특별시 마포구 망원로 34-15 (망원동, 망원동다세대주택)"));
		}
		
		request.setAttribute("lists", db);
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test04_ok.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test04_ok.jsp");
		dispatcher.forward(request, response);
	}
}
```
### 7.20.2. Test04Send.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test04Send extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		//String view = "WEB-INF/view/AjaxTest04.jsp";
		String view = "AjaxTest04.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}
}
```
### 7.20.3. ZipCodeDTO.java
``` java
/* ===================
	ZipCodeDTO.java
=====================*/

package com.test.ajax;

public class ZipCodeDTO
{
	// 주요 속성 구성
	private String zipCode;
	private String address;
	
	// 기본 생성자 추가 구성
	public ZipCodeDTO()
	{
		this("","");
	}
	
	//  사용자 정의 생성자 구성
	public ZipCodeDTO(String zipCode, String address)
	{
		this.zipCode = zipCode;
		this.address = address;
	}
	
	// getter / setter 구성
	public String getZipCode()
	{
		return zipCode;
	}
	public void setZipCode(String zipCode)
	{
		this.zipCode = zipCode;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	
	
}
```
### 7.20.4. AjaxTest04.jsp
``` html
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
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<style type="text/css">
	#result {display: inline-block; width: 250px; color:#F33;font-size:small;}
</style>
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">
function check()
{
	
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var addr = document.getElementById("addr").value;
	var url = "test03.do?id="+id;
	ajax = createAjax();
	ajax.open("GET",url,true);
	
	ajax.onreadystatechange = function()
	{
		if(ajax.readyState == 4 && ajax.status == 200)
			callBack();
	};
	
	ajax.send("");
}

function callBack()
{
	var data = ajax.responseText;
	data = parseInt(data);
	if(data==0)
		document.getElementById("result").innerText = "사용 가능한 아이디입니다.";	
	else
		document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";	
}

// ---------------------------------------------------------------------

function search()
{
	//alert("확인");
	// 데이터 수집
	var addr = document.getElementById("addr").value;
	
	// URL 준비
	var url = "test04.do?addr=" + addr;
	
	// AJAX 객체(→ XMLHttpRequeset 객체) 생성
	ajax = createAjax();
	
	// 설정
	ajax.open("GET", url, true);
	ajax.onreadystatechange = function()
	{
		if(ajax.readyState==4 && ajax.status==200)
		{
			// 수행 업무
			callBack2();
		}
	}
	
	ajax.send("");
}

// 추출된 업무
// → 우편번호 검색 결과를 통보받아
// 	  사용자에게 안내해 줄 수 있도록 처리
function callBack2()
{
	//alert("확인");
	//var data = ajax.responseText;
	
	// XML 문서 전체 참조 객체. (흔히... XML 문서 객체라고 한다.)
	var doc = ajax.responseXML;
	
	// XMl 문서의 최상위 엘리먼트(루트 엘리먼트)
	//-- 현재는 『<list></list>』 엘리먼트
	var root = doc.documentElement;
	
	// 모든 『<item></item>』 엘리먼트 반환 받기
	var itemList = root.getElementsByTagName("item");
	
	// select box 초기화
	document.getElementById("addrResult").innerHTML = "";
	
	// 검색 결과 확인
	if(itemList.length == 0)
	{
		document.getElementById("addrResult").innerHTML
			= "<option>주소를 입력하세요.</option>";
	}else
	{
		document.getElementById("addrResult").innerHTML
			= "<option value='0'>주소를 선택하세요.</option>";
	}
	
	// 검색 결과가 존재할 경우...
	// 반복문을 순환하며 각 데이터 가져오기
	for (var i = 0; i < itemList.length; i++)	//-- 수신한 아이템의 갯수만큼 반복 순화
	{
		var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
		var address = itemList[i].getElementsByTagName("address")[0];
		
		// ※ 태그가 가지는 텍스트는 태그의 첫 번째 자식이고..
		//	텍스트 노드의 값은 nodeValue 로 가져온다.
		
		var zipcodeText = zipcode.firstChild.nodeValue;
		var addressText = address.firstChild.nodeValue;
		
		//select box 에 아이템 (<option></option>) 추가
		document.getElementById("addrResult").innerHTML
			+= "<option value='"+ zipcodeText + "/" + addressText +"'>["+ zipcodeText +"]" + addressText +"</option>"; 
	}
	
}

// ---------------------------------------------------------------------

function selectZipCode(sel)
{		
	/* 
	document.getElementById("addr1").value = sel.value.split("/")[0];
	document.getElementById("addr2").value = sel.value.split("/")[1];
	document.getElementById("addr3").focus();
	 */
	if(sel.value != "0")
	{
		var addrArr = sel.value.split("/");
		document.getElementById("addr1").value = sel.value.split("/")[0];
		document.getElementById("addr2").value = sel.value.split("/")[1];
		document.getElementById("addr3").focus();
	}
}

</script>

</head>
<body class="section">

<div>
	<h1>회원 가입</h1>
	<p>우편번호 검색</p>
	<hr />
</div>

<div class="layout">
	<table class="table">
		<tr>
			<th style="width: 80px;">아이디</th>
			<td>
				<input type="text" id="id" class="txt control">
				<input type="button" value="중복검사" class="btn control" onclick="check()">
				<span id="result"></span>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" id="name" class="txt control">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="addr" class="txt control" placeholder="동 입력">
				<input type="button" value="검색하기" class="btn control" onclick="search()">
				<br>
				<select name="" id="addrResult" class="control" onchange="selectZipCode(this)">
					<option>주소를 입력하세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>주소 검색 결과</th>
			<td>
				<input type="text" id="addr1" class="txt control" readonly="readonly" style="width: 200px;">
				<br>
				<input type="text" id="addr2" class="txt control" readonly="readonly" style="width: 400px;">
				<br>
				<input type="text" id="addr3" class="txt control" style="width: 400px;" placeholder="상세 주소를 입력하세요.">
				<br>
			</td>
		</tr>
	</table>
</div>

</body>
</html>
```
### 7.20.5. Test04_ok.jsp
``` html
<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// check~!!!
	response.setContentType("text/xml");
	//-- AJAX 객체에 데이터를 반환할 때
	//	브라우저가 이 데이터를 XML로 인식해야하기 때문에
	//	MIME 타입을 XML 로 선언한다.
	
	// ※ (수신해서 처리해야 하는) 데이터가 한 개 이상 일 경우...
	//	  XML 이나 JSON과 같이 구조화시킬 수 있는 데이터의 형태로
	//	  전달하는 것이 처리 결과에서 용이하다.
	//	  우편번호에 대한 검색 결과는
	//	  당연히 다량의 데이터를 전송해야 하기 때문에
	//	  일반 텍스트가 아닌 XML 형태로 반환하려고 하는 것이다.
	
	
	//** 중요!!!) xml 앞에 공백이 하나도 있으면 문제가 생김! **
	//** 기본 루트 엘리먼트 하나에 포함되어 있어야 함 **
%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:forEach var="item" items="${lists }">
	<item>
		<zipcode>${item.zipCode }</zipcode>
		<address>${item.address }</address>
	</item>
	</c:forEach>
</list>
```
### 7.20.6. test04send.do
... 내용 없음 ...
### 7.20.7. /AjaxApp/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>AjaxApp</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
   <!-- AJAX 관련 실습 -->
   <!-- AjaxTest02 → 페이지 내 컨트롤 확인 -->
   <servlet>
  	<servlet-name>test02send</servlet-name>
  	<servlet-class>com.test.ajax.Test02Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test02send</servlet-name>
  	<url-pattern>/test02send.do</url-pattern>
  </servlet-mapping>
  
  
   <servlet>
  	<servlet-name>test02</servlet-name>
  	<servlet-class>com.test.ajax.Test02</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test02</servlet-name>
  	<url-pattern>/test02.do</url-pattern>
  </servlet-mapping>
  
  <!-- ========================================= -->
  
  <!-- AJAX 관련 실습 -->
  <!-- AjaxTest03 → 아이디 중복 검사 -->
  <servlet>
  	<servlet-name>test03send</servlet-name>
  	<servlet-class>com.test.ajax.Test03Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test03send</servlet-name>
  	<url-pattern>/test03send.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>test03</servlet-name>
  	<servlet-class>com.test.ajax.Test03</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test03</servlet-name>
  	<url-pattern>/test03.do</url-pattern>
  </servlet-mapping>
  
  <!-- ========================================= -->
  
  <!-- AJAX 관련 실습 -->
  <!-- AjaxTest04 → 우편번호 검색 -->
  <servlet>
  	<servlet-name>test04send</servlet-name>
  	<servlet-class>com.test.ajax.Test04Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test04send</servlet-name>
  	<url-pattern>/test04send.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>test04</servlet-name>
  	<servlet-class>com.test.ajax.Test04</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test04</servlet-name>
  	<url-pattern>/test04.do</url-pattern>
  </servlet-mapping>
  
</web-app>
```

<br>

## 7.21. [AJAX 실습 - 추천 검색어]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/0088011a-71c5-45a8-b0c9-ebc823ae1a30)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/d475352f-de7c-4a54-bf18-c16e30db0f3c)

### 7.21.1. Test05.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test05 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// ※ 완성형 한글 형태로 전송된 데이터 수신
		
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(AjaxTest05.jsp)부터 넘어온 데이터 수신
		// → search
		String search = request.getParameter("search");
		
		//System.out.println(search);
		
		//DB 연결 및 액션 처리
		// .......... WHERE COLUMNNAME LIKE 'search%'; 와 같은 쿼리문 수행
		//	그에 따른 결과 수신
		
		ArrayList<WordDTO> lists = new ArrayList<WordDTO>();
		
		if(search.equals("가"))
		{
			lists.add(new WordDTO("가요대전"));
			lists.add(new WordDTO("가방"));
			lists.add(new WordDTO("가다랑어"));
			lists.add(new WordDTO("가위"));
			lists.add(new WordDTO("가죽"));
			lists.add(new WordDTO("가족"));
			lists.add(new WordDTO("가지"));
			lists.add(new WordDTO("가평"));
		}
		else if(search.equals("가습"))
		{
			lists.add(new WordDTO("가습 손질"));
			lists.add(new WordDTO("가습 구매"));
			lists.add(new WordDTO("가습 분해"));
			lists.add(new WordDTO("가습 교체"));
			lists.add(new WordDTO("가습 수리"));
			lists.add(new WordDTO("가습끈"));
		}
		else if(search.equals("가방"))
		{
			lists.add(new WordDTO("가방 손질"));
			lists.add(new WordDTO("가방 구매"));
			lists.add(new WordDTO("가방 분해"));
			lists.add(new WordDTO("가방 교체"));
			lists.add(new WordDTO("가방 수리"));
			lists.add(new WordDTO("가방끈"));
		}
		else if(search.equals("가방끈"))
		{
			lists.add(new WordDTO("가방끈 매듭"));
			lists.add(new WordDTO("가방끈 매듭 묶기"));
			lists.add(new WordDTO("가방끈 매듭 푸는 법"));
			lists.add(new WordDTO("가방끈 길이 조절"));
			lists.add(new WordDTO("가방끈 교체"));
			lists.add(new WordDTO("가방끈 색상"));
		}
		
		request.setAttribute("lists", lists);
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test05_ok.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test05_ok.jsp");
		dispatcher.forward(request, response);
	}
}
```
### 7.21.2. Test05Send.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test05Send extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		//String view = "WEB-INF/view/AjaxTest05.jsp";
		String view = "AjaxTest05.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}
}
```
### 7.21.3. WordDTO.java
``` java
/* ===========================
	WordDTO.java
=========================== */

package com.test.ajax;

public class WordDTO
{
	// 주요 속성 구성
	private String word;

	// 기본 생성자 구성
	public WordDTO()
	{
		this("");
	}
	
	// 사용자 정의 생성자 구성
	public WordDTO(String word)
	{
		this.word = word;
	}
	
	// getter / setter 구성
	public String getWord()
	{
		return word;
	}

	public void setWord(String word)
	{
		this.word = word;
	}
	
	
}
```
### 7.21.4. AjaxTest05.jsp
``` html
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
<title>AjaxTest05.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<style type="text/css">
#search{width: 500px;}
#list{display:none;border: 1px solid gray;width: 500px; position: absolute;left:67px;}
#list .item{padding: 3px;}
#list #footer{background-color: #ddd; text-align:right;padding: 5px; font-size: small;}
</style>

<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>

<script type="text/javascript">
// 검색창에서 키보드 입력이 발생할 때마다
// 그 때까지 입력된 단어를 서버로 전송하고
// 그 전송된 단어에 맞는 추천 검색을 받아올 수 있도록 처리
function search()
{
	// 데이터 수집(입려된 값 얻어오기)
	var search = document.getElementById("search").value;
	
	//alert(search);
	
	// 서버로 전송하기 전에 유효성 검사 --------------------------------------
	// ① 검색어가 존재할 경우에만 서버로 전송할 수 있도록 처리
	if(search.replace(" ","") == "")
	{
		document.getElementById("list").style.display = "none";
		return;
	}
	// ② 입력된 검색어가 완성형 한글일 경우에만
	//	  검색 키워드를 서버로 전송할 수 있도록 처리
	//	  정규표현식 사용
	var regEx = /^[가-힣]{1,}$/;
	
	if(!regEx.test(search))
	{
		return;		
	}
	// ----------------------------------------서버로 전송하기 전에 유효성 검사
	
	// URL 구성
	var url = "test05.do?search="+search;
	
	// AJAXHttpRequest 객체 (→ AJAX 객체) 생성
	ajax = createAjax();
	
	ajax.open("GET", url, true);
	ajax.onreadystatechange = function()
	{
		if(ajax.readyState==4 && ajax.status==200)
		{
			// 업무 내용 수행(→ 외부의 함수 호출)
			callBack();
		}
	};
	ajax.send("");
}

// 추출된 업무 수행 내용
//-- XML 목록으로 받아온 검색어들을
//	 적절한 리스트로 생성해서 화면에 출력할 수 있도록 처리
function callBack()
{
	// XML 문서 객체
	var doc = ajax.responseXML;
	
	// XML 문서의 최상위 엘리먼트 수신(루트 엘리먼트)
	// → 지금은 『<list></list>』인 상황
	var root = doc.documentElement;
	
	// 루트 엘리먼트 하위의 모든 『<item></item>』 엘리먼트 반환받기
	var itemList = root.getElementsByTagName("item");
	
	// 추천 검색어 출력(노출) 지점 초기화
	document.getElementById("items").innerHTML = "";
	
	// 수신한 데이터(추천 검색어) 삽입하기
	for (var i = 0; i < itemList.length; i++)
	{
		var word = itemList[i].firstChild.nodeValue;
		
		// 출력(노출) 지점에 추가 → items
		document.getElementById("items").innerHTML
			+= "<div class='item'>" + word +"</div>";
			
		// 최종적으로 목록을 화면에 보일 수 있도록 랜딩
		document.getElementById("list").style.display = "block";
	}
}
</script>

</head>
<body class="section">

<div>
	<h1>AJAX 실습 - 추천 검색어</h1>
	<hr />
</div>

<div class="layout">
	<div>
		검색어
		<input type="text" id="search" class="control" placeholder="검색어를 입력하세요"
		onkeyup="search()">
	</div>
	
	<div id="list">
		<div id="items">
			<div class="item">가습기</div>
			<div class="item">가요대전</div>
			<div class="item">가방</div>
			<div class="item">가다랑어</div>
			<div class="item">가위</div>
			<div class="item">가죽</div>
			<div class="item">가족</div>
			<div class="item">가지</div>
			<div class="item">가평</div>
		</div>
		
		<div id="footer">
			추천 검색어
		</div>
	</div>
</div>

</body>
</html>
```
### 7.21.5. Test05_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:forEach var="item" items="${lists }">
	<item>${item.word }</item>
	</c:forEach>
</list>
```
### 7.21.5. test05send.do
... 내용 없음 ....
### 7.21.5. /AjaxApp/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>AjaxApp</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
   <!-- AJAX 관련 실습 -->
   <!-- AjaxTest02 → 페이지 내 컨트롤 확인 -->
   <servlet>
  	<servlet-name>test02send</servlet-name>
  	<servlet-class>com.test.ajax.Test02Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test02send</servlet-name>
  	<url-pattern>/test02send.do</url-pattern>
  </servlet-mapping>
  
  
   <servlet>
  	<servlet-name>test02</servlet-name>
  	<servlet-class>com.test.ajax.Test02</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test02</servlet-name>
  	<url-pattern>/test02.do</url-pattern>
  </servlet-mapping>
  
  <!-- ========================================= -->
  
  <!-- AJAX 관련 실습 -->
  <!-- AjaxTest03 → 아이디 중복 검사 -->
  <servlet>
  	<servlet-name>test03send</servlet-name>
  	<servlet-class>com.test.ajax.Test03Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test03send</servlet-name>
  	<url-pattern>/test03send.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>test03</servlet-name>
  	<servlet-class>com.test.ajax.Test03</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test03</servlet-name>
  	<url-pattern>/test03.do</url-pattern>
  </servlet-mapping>
  
  <!-- ========================================= -->
  
  <!-- AJAX 관련 실습 -->
  <!-- AjaxTest04 → 우편번호 검색 -->
  <servlet>
  	<servlet-name>test04send</servlet-name>
  	<servlet-class>com.test.ajax.Test04Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test04send</servlet-name>
  	<url-pattern>/test04send.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>test04</servlet-name>
  	<servlet-class>com.test.ajax.Test04</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test04</servlet-name>
  	<url-pattern>/test04.do</url-pattern>
  </servlet-mapping>
   
  <!-- ========================================= -->
  
  <!-- AJAX 관련 실습 -->
  <!-- AjaxTest05 → 추천 검색어 처리 -->
  <servlet>
  	<servlet-name>test05send</servlet-name>
  	<servlet-class>com.test.ajax.Test05Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test05send</servlet-name>
  	<url-pattern>/test05send.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>test05</servlet-name>
  	<servlet-class>com.test.ajax.Test05</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>test05</servlet-name>
  	<url-pattern>/test05.do</url-pattern>
  </servlet-mapping>
</web-app>
```

<br>

## 7.22. [jQuery 의 load() 활용 실습]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/668ca59e-663c-464b-a0bb-b4e3c69e5b21)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/70cc6215-9613-4168-be00-020ca00ac50d)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/b4529c82-e46c-46be-b7b7-62a534a3419c)

### 7.22.1. LoadTest01.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoadTest01.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	
	//※ 『load()』
	// 	 『$(선택자).load("로드를 원하는 html 문서의 위치와 이름");』
	//	  - jQuery 의 기능이 수행되는 과정에서 다른 html 문서를 로드
	//	  - HTML 을 읽어들여서 DOM 에 삽입하는 기능을 수행
	// **비동기로 처리함**
	
	$("#btn .btnLoad").click(function()
	{
		//alert("확인");
		
		$("#ctlGrid").load("LoadTest02.html");
		//-- 『비동기』방식으로 페이지 로드
		
		window.alert("여기서 작성한 페이지가 출력되는 시점 확인");
		//-- Line 23 보다 이 메세지 박스가 먼저 출력~!!!
		//	 이유는... 비동기~!!!
		
	})
});
</script>

</head>
<body class="section">

<div>
	<h1>jQuery 의 load() 활용 실습</h1>
	<hr />
</div>

<div class="layout">
	<div>
		<div id="btn">
			<div class="btnLoad">HTML 읽어오기 버튼</div>
		</div>
	</div>
	
	<div id="ctlGrid">
	
	</div>
</div>

</body>
</html>
```
### 7.22.2. LoadTest02.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoadTest02.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

load() 에 대한 실습

</body>
</html>
```

<br>

## 7.23. [jQuery 의 load() 활용 실습: 두수의 연산]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/829e7dad-7ef1-4dce-9d0e-3b6b895ed511)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/3388d98a-5ae5-4840-bb0d-f82d2939a49c)

### 7.23.1. LoadTest03.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoadTest03 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(LoadTest03.jsp)로부터 넘어온 데이터 수신
		// → su1, su2, oper
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		String oper = request.getParameter("oper");
		
		// 업무 로직 처리
		/*
		int result = 0;
		String result = "";
		if(oper.equals("add"))
			result = su1 + su2;
		else if(oper.equals("sub"))
			result = su1 - su2;
		else if(oper.equals("mul"))
			result = su1 * su2;
		else if(oper.equals("div"))
			result = su1 / su2;
		*/
		
		String result = "";
		if(oper.equals("add"))
			result = String.format("%d + %d = %d", su1, su2, (su1+su2));
		else if(oper.equals("sub"))
			result = String.format("%d - %d = %d", su1, su2, (su1-su2));
		else if(oper.equals("mul"))
			result = String.format("%d * %d = %d", su1, su2, (su1*su2));
		else if(oper.equals("div"))
			result = String.format("%d / %d = %d", su1, su2, (su1/su2));
		
		// 반환할 결과값 준비
		request.setAttribute("result", result);
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test03_ok.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("LoadTest03_ok.jsp");
		dispatcher.forward(request, response);
		
		
	}
}
```
### 7.23.2. Test03Send.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03Send extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		//String view = "WEB-INF/view/LoadTest03.jsp";
		String view = "LoadTest03.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}
}
```
### 7.23.3. LoadTest03_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
${result}
```
### 7.23.4. LoadTest03.jsp
``` html
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
<title>LoadTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<style type="text/css">
	.txtNum{width: 100px;text-align:right;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	
	$("#sendButton").click(function()
	{
		//alert("확인");
		
		var su1 = document.getElementById("su1").value;
		// var su1 = $("#su1").val();
		var oper = document.getElementById("oper").value;
		var su2 = document.getElementById("su2").value;
		
		$("#result").load("loadtest03.do?su1="+su1+"&oper="+oper+"&su2="+su2);
		
	})
});



</script>

</head>
<body class="section">

<div>
	<h1>jQuery 의 load() 활용 실습2: 두수의 연산</h1>
	<hr />
</div>

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

loadtest03send.do → Test03Send.java → LoadTest03.jsp
											↓
										loadtest03.do → LoadTest03.java → LoadTest03_ok.jsp

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
```
### 7.23.5. loadtest03send.do
... 내용 없음 ....
### 7.23.5. /AjaxJquery01/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>WebApp00</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- 
  <servlet>
  	<servlet-name></servlet-name>
  	<servlet-class></servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name></servlet-name>
  	<url-pattern></url-pattern>
  </servlet-mapping>
  -->
  
  <!-- LoadTest03: jQuery의 load() 활용 실습 -->
  <servlet>
  	<servlet-name>load03send</servlet-name>
  	<servlet-class>com.test.ajax.Test03Send</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>load03send</servlet-name>
  	<url-pattern>/loadtest03send.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>load03</servlet-name>
  	<servlet-class>com.test.ajax.LoadTest03</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>load03</servlet-name>
  	<url-pattern>/loadtest03.do</url-pattern>
  </servlet-mapping>
</web-app>
```

<br>

## 7.24. [jQuery의 get() 활용 실습]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e0c6afa6-89e0-4733-ad21-bf35a100182e)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/bd16f556-1ded-4f47-adc9-5b1a472a0f1a)

### 7.24.1. GetTest01.jsp
``` java
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
```
### 7.24.2. GetTest01_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// GetTest01_ok.jsp
	
	//String nickName= request.getParameter("nickName");
%>
<%-- <%=nickName %>님 안녕하세요. <br> 반갑습니다. --%>
${param.nickName }님 안녕하세요. 
<br>
반갑습니다.
```
### 7.24.3. /AjaxJquery02/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>WebApp00</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- 
  <servlet>
  	<servlet-name></servlet-name>
  	<servlet-class></servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name></servlet-name>
  	<url-pattern></url-pattern>
  </servlet-mapping>
  -->
  
  <!-- LoadTest03: jQuery의 load() 활용 실습 -->
  <servlet>
  	<servlet-name>getTest02send</servlet-name>
  	<servlet-class>com.test.ajax.GetTest02Controller</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>getTest02send</servlet-name>
  	<url-pattern>/gettest02.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>getTest02</servlet-name>
  	<servlet-class>com.test.ajax.GetTest02OkConroller</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>getTest02</servlet-name>
  	<url-pattern>/gettest02ok.do</url-pattern>
  </servlet-mapping>
</web-app>
```

<br>

## 7.25. [jQuery 의 get() 활용 실습2: 두수의 연산]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/dae70e5b-af5f-4164-bc77-09e07266b8c4)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e1d494e7-fe8b-4cc1-bbec-54ea21286d53)

### 7.25.1. GetTest02Controller.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetTest02Controller extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		String view = "WEB-INF/view/GetTest02.jsp";
		//String view = "GetTest02.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}
}
```
### 7.25.2. GetTest02OkController.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetTest02OkConroller extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(LoadTest03.jsp)로부터 넘어온 데이터 수신
		// → su1, su2, oper
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		String oper = request.getParameter("oper");
		
		// 업무 로직 처리
		
		String result = "";
		if(oper.equals("add"))
			result = String.format("%d + %d = %d", su1, su2, (su1+su2));
		else if(oper.equals("sub"))
			result = String.format("%d - %d = %d", su1, su2, (su1-su2));
		else if(oper.equals("mul"))
			result = String.format("%d * %d = %d", su1, su2, (su1*su2));
		else if(oper.equals("div"))
			result = String.format("%d / %d = %d", su1, su2, (su1/su2));
		
		// 반환할 결과값 준비
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/GetTest02_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("GetTest02_ok.jsp");
		dispatcher.forward(request, response);
		
		
	}
}
```
### 7.25.3. GetTest02_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
${result}
```
### 7.25.4. GetTest02.jsp
``` html
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
<title>GetTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<style type="text/css">
	.txtNum{width: 100px;text-align:right;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	
	$("#sendButton").click(function()
	{
		//alert("확인");
		
		var su1 = $("#su1").val();
		var oper = $("#oper").val();
		var su2 = $("#su2").val();
		
		$.get("gettest02ok.do",{su1:su1,oper:oper,su2:su2},function(data)
		{
			$("#result").html(data);
		});
		
		
	})
});
</script>

</head>
<body class="section">

<div>
	<h1>jQuery 의 get() 활용 실습2: 두수의 연산</h1>
	<hr />
</div>

<!-- gettest02.do
	 → com.test.ajax.GetTest02Controller.java
	 → Web-INF/view/GetTest02.jsp
	 				↓ gettest02ok.do
	 				→ com.test.ajax.GetTest02OkConroller.java
	 				→ WEB-INF/view/GetTest02_ok.jsp
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
```
### 7.25.5. gettest02.do
... 내용 없음 ....

<br>

## 7.26. [jQuery 의 post() 활용 실습]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/564c577c-93f9-442f-8e1b-ed967e6f4ecc)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/fc5d4b80-4563-4c80-8b5a-41b770af9380)

### 7.26.1. PostTest01_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
제목: <b>${param.title }</b>
<br>
내용: <b>${param.content }</b>
```
### 7.26.2. PostTest01.jsp
``` html
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
<title>PostTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
#resultDiv{width: 240px;height:180px;border:2px solid #499bd7;paddin:4px;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#sendBtn").click(function()
	{
		//alert("확인");
		
		// ※ 『post()』
		//	  『$.post(url, data, callBack);』
		//		- 매개변수로 전달받은 URL 을 사용하여 서버에 POST 요청을 전송한다.
		//		- 매개변수
		//		 ·url: (String) POST 함수로 연결하는 서버 측 URL
		//		 ·data: (Object) 이름과 값의 쌍으로 프로퍼티를 가진 객체.
		//				미리 구성 및 인코딩 된 쿼리 스트링.
		//		 ·callBack: (Function) 요청이 완료되면 호출되는 함수.
		
		$.post("PostTest01_ok.jsp"
				,{title:$("#title").val(), content:$("#content").val()}
				, function(data)
				{
					$("#resultDiv").html(data);
				});
	});	
});
</script>

</head>
<body class="section">

<div>
	<h1>jQuery 의 post() 활용 실습</h1>
	<hr />
</div>

<div class="layout">
	<div>
		제목<input type="text" id="title" class="txt" />
		<br />
		내용<input type="text" id="content" class="txt" />
		
		<input type="button" id="sendBtn" value="보내기" class="btn" />
	</div>
	<br>
	
	<div id="resultDiv">
	test
	</div>
</div>

</body>
</html>
```

<br>

## 7.27. [jQuery의 post()활용 실습2: 두수의 연산]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/28f9726c-3165-41de-aa27-574bf57a4b1c)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/387705cd-2e0d-4898-aa27-989caa5b103c)

### 7.27.1. PostTest02Controller.java
``` java
package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostTest02Controller extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		String view = "PostTest02.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
```
### 7.27.2. PostTest02OkController.java
``` java
package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostTest02OkController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(LoadTest03.jsp)로부터 넘어온 데이터 수신
		// → su1, su2, oper
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		String oper = request.getParameter("oper");
		
		// 업무 로직 처리
		
		String result = "";
		if(oper.equals("add"))
			result = String.format("%d + %d = %d", su1, su2, (su1+su2));
		else if(oper.equals("sub"))
			result = String.format("%d - %d = %d", su1, su2, (su1-su2));
		else if(oper.equals("mul"))
			result = String.format("%d * %d = %d", su1, su2, (su1*su2));
		else if(oper.equals("div"))
			result = String.format("%d / %d = %d", su1, su2, (su1/su2));
		
		// 반환할 결과값 준비
		request.setAttribute("result", result);
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/PostTest02_ok.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("PostTest02_ok.jsp");
		dispatcher.forward(request, response);
	}
}
```
### 7.27.3. PostTest02_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
${result}
```
### 7.27.4. PostTest02.jsp
``` html
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
```
### 7.27.5. posttest02.do
... 내용 없음 ....
### 7.27.5. /AjaxJquery03/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>WebApp00</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- 
  <servlet>
  	<servlet-name></servlet-name>
  	<servlet-class></servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name></servlet-name>
  	<url-pattern></url-pattern>
  </servlet-mapping>
  -->
  
  <!-- postTest02 -->
  <servlet>
  	<servlet-name>postTest02send</servlet-name>
  	<servlet-class>com.test.ajax.PostTest02Controller</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>postTest02send</servlet-name>
  	<url-pattern>/posttest02.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>postTest02</servlet-name>
  	<servlet-class>com.test.ajax.PostTest02OkController</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>postTest02</servlet-name>
  	<url-pattern>/posttest02ok.do</url-pattern>
  </servlet-mapping>
</web-app>
```

<br>

## 7.28. [F_JsonApp: JSON 실습 테스트]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/661f71d9-aaca-482b-88aa-960fa30bcf55)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/476c95c7-3a5d-4a01-b296-9048c9fd7546)

### 7.28.1. JsonTest01.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest01.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
var myJsonObject = 
{
	 "test":"hello"
}

/* var myJsonObject = {"test":"hello"} */
</script>
</head>
<body class="section">

<form action="">
	<input type="button" value="click1" onclick="alert(myJsonObject)" />
	<!-- [object Object] -->
	<br>
	<input type="button" value="click2" onclick="alert(typeof myJsonObject)" />
	<!-- **typeof: 어떤 타입인지 확인** -->
	<!-- object -->
</form>

</body>
</html>
```
### 7.28.2. JsonTest02.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest02.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
var myJsonObject2 = 
{
	"test":"hello"
	/* "test":"new test" */
}
</script>
</head>
<body class="section">

<form action="">
	<input type="button" value="click1" onclick="alert(myJsonObject2.test)"><br>
	<!-- hello -->
	
	<input type="button" value="click2" onclick="myJsonObject2.test='new test';alert(myJsonObject2.test)">
</form>

</body>
</html>
```
### 7.28.3. JsonTest03.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest03.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
var myJsonObject3=
{
	"test1":"hello1"
	, "test2": "hello2"
	, "test3": "hello3"
}
</script>
</head>
<body class="section">

<form action="" class="layout">
	<!-- <input class="btn" type="button" value="click1" onclick="myJsonObject3.test1"> -->
	
	<input type="button" class="btn" value="click1" onclick="alert(myJsonObject3.test1)"><br>
	<!-- hello1 -->
	<input type="button" class="btn" value="click1" onclick="alert(myJsonObject3.test2)"><br>
	<!-- hello2 -->
	<input type="button" class="btn" value="click1" onclick="alert(myJsonObject3.test3)">
	<!-- hello3 -->
	
	<br><br>
	
	<input type="button" class="btn" value="click4" onclick="alert(typeof myJsonObject3.test1)"><br>
	<input type="button" class="btn" value="click5" onclick="alert(typeof myJsonObject3.test2)"><br>
	<input type="button" class="btn" value="click6" onclick="alert(typeof myJsonObject3.test3)">
	<!-- 셋 모두 --==>> string -->
	<!-- **typeof를 찍었을 때, test1 의 타입을 찍는 것이 아닌.. hello1의 타입을 확인하는 것** -->
	
</form>

</body>
</html>
```
### 7.28.4. JsonTest04.html_eval()
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest04.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
var myJsonObject4 =
{
	"test" : function()
	{
		alert("Method Test~!!!");
	}
}
</script>
</head>
<body class="section">

<form action="" class="layout">
	<input type="button" class="btn" value="click1" onclick="myJsonObject4.test"><br>
	<!-- → X(동작하지 않음) -->
	<input type="button" class="btn" value="click2" onclick="alert(myJsonObject4.test);">
	<!-- **텍스트로 구성하고 있는 값 자체를 문자열 형태로 구성**
	function(){
		alert("Method Test~!!!");
	}
	 -->

	<br><br>	
	<input type="button" class="btn" value="click3" onclick="alert(myJsonObject4.test());"><br>
	<!-- **더미 처리하듯 나옴**
		Method Test~!!!
		↓
		undefined
	 -->
	 
	 <!-- 『eval()』 : 변수를 자바스크립트의 함수처럼 사용할 수 있도록 해주는 함수
	 					즉, 정적인 문자열을 동적인 코드 형식으로 처리해 주는 함수
	 					보안성 이슈로 조심히 다루어야 할 함수  -->
	 <!-- **자바스크립트는 계륵..?
	 		자바스크립트가 보안상 이유로 문제가 있으나,
	 		유용한 부분이 많기 때문에...
	 		
	 		우리나라에서는 크게 보안적 이슈를 크게 문제 삼고 있지 않으나,
	 		해외의 여러 분야를 고려해서 고민하는 개발자들 사이에.. 
	 		자바스크립트가 문제가 있다는 것을 고민중인 경우가 많음 ** -->
	<input type="button" class="btn" value="click4" onclick="eval('a='+myJsonObject4.test); a();"><br>
	<!-- Method Test~!!! -->
</form>

</body>
</html>
```
### 7.28.5. JsonTest05.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest05</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	var myJsonObejct5 =
	{
		"test" : function(args)
		{
			alert("Method Test: " + args);
		}
	}

	var t = myJsonObejct5.test;
	/* JsonTest04.html → var a = myJsonObject5.test; a(); */
</script>
</head>
<body class="section">

<form action="" class="layout">
	<input type="button" class="btn" value="click1" onclick="t('kyungtae')"><br>
	<!-- Method Test: kyungtae -->
	
	<input type="button" class="btn" value="click2"
	 onclick="eval('var a=' + myJsonObejct5.test); a('sukyoung')"><br>
	<!-- Method Test: sukyoung -->
	 
	<input type="button" class="btn" value="click3"
	 onclick="eval( '(' + myJsonObejct5.test+')(\'daseul\')' )"><br>
	 <!-- myJsonObect5.test('daseul') -->
	 <!-- → Method Test: daseul -->
</form>

</body>
</html>
```
### 7.28.6. JsonTest06.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest06.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">

// ①
/* 
var myJsonObject6=
{
	"test":123	
}
*/

// ②
/* 
var myJsonObject6=
{
	"test":123.456	
}
 */
// ③
/* 
var myJsonObject6=
{
	"test":true
}
 */

// ④
var myJsonObject6=
{
	"test":null
}

</script>
</head>
<body class="section">

<form action="" class="layout">
	<input type="button" class="btn" value="click1" onclick="alert(myJsonObject6.test)"><br>
	<!-- ① → 123 -->
	<!-- ② → 123.456 -->
	<!-- ③ → true -->
	<!-- ④ → null -->
	<!-- ④ →  -->
	
	<input type="button" class="btn" value="click2" onclick="alert(typeof myJsonObject6.test)">
	<!-- ① → number -->
	<!-- ② → number -->
	<!-- ③ → boolean -->
	<!-- ④ → object --> <!-- check~!!! -->
	
	<br><br>
	
	<input type="button" value="click3" class="btn"
		onclick="myJsonObject6.test=false; alert(myJsonObject6.test)">
	<!-- false -->
	<input type="button" value="click4" class="btn"
		onclick="myJsonObject6.test=false; alert(typeof myJsonObject6.test)">
	<!-- boolean -->
		
	<br><br>
	
	<input type="button" value="click5" class="btn"
		onclick="myJsonObject6.test=123; alert(myJsonObject6.test)">
	<!-- 123 -->
	<input type="button" value="click6" class="btn"
		onclick="myJsonObject6.test=123; alert(typeof myJsonObject6.test)">
	<!-- number -->	
	<br><br>
	
	<input type="button" value="click7" class="btn"
		onclick="myJsonObject6.test='123'; alert(myJsonObject6.test)">
	<!-- 123 -->
	<input type="button" value="click8" class="btn"
		onclick="myJsonObject6.test='123'; alert(typeof myJsonObject6.test)">
	<!-- string -->
</form>

</body>
</html>
```
### 7.28.7. JsonTest07.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest07.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
var myJsonObject7 = ["test"]
var myJsonObject7_1 = ["test1", "test2"]
var myJsonObject7_2 = ["test2", "test2",123, 123+1]
</script>
</head>
<body class="section">

<form action="" class="layout">
	<input type="button" class="btn" value="click1" onclick="alert(myJsonObject7)">
	<!-- → test -->
	<input type="button" class="btn" value="click2" onclick="alert(myJsonObject7_1)">
	<!-- → test1,test2 -->
	<input type="button" class="btn" value="click3" onclick="alert(myJsonObject7_2)">
	<!-- → test2,test2,123,124 -->
	<!-- **더미로 출력되는 것을 확인할 수 있음** -->
	
	<br><br>
	
	<input type="button" class="btn" value="click4" onclick="alert(typeof myJsonObject7)">
	<input type="button" class="btn" value="click5" onclick="alert(typeof myJsonObject7_1)">
	<input type="button" class="btn" value="click6" onclick="alert(typeof myJsonObject7_2)">
	<!-- 셋 모두 → object -->
	
	<br><br>
	<input type="button" class="btn" value="click7" onclick="alert(myJsonObject7[0])">
	<!-- → test -->
	<input type="button" class="btn" value="click8" onclick="alert(typeof myJsonObject7[0])">
	<!-- → string -->
	<input type="button" class="btn" value="click9" onclick="alert(myJsonObject7[1])">
	<!-- → undefined -->
	<!-- **자바스크립트 배열이 자바의 배열과 다른점
		고정값이 아님. 내용이 같지 않아도 들어감**-->
	<input type="button" class="btn" value="click10" onclick="alert(typeof myJsonObject7[1])">
	<!-- → undefined -->
	<!-- **undefined 의 타입은 undefined** -->
	
	<br><br>
	<input type="button" class="btn" value="click11"
		onclick="alert(myJsonObject7_1[0] + myJsonObject7_1[1])">
	<!-- → test1test2 -->
	<input type="button" class="btn" value="click12"
		onclick="alert(typeof (myJsonObject7_1[0] + myJsonObject7_1[1]))">
	<!-- string -->
	<!-- **괄호 안 씌울 경우 stringtest2 ** -->
	
	<br><br>
	<input type="button" class="btn" value="click13"
		onclick="alert(myJsonObject7_2[2] + myJsonObject7_2[3])">
	<!-- → 247 -->
	<input type="button" class="btn" value="click14"
		onclick="alert(typeof (myJsonObject7_2[2] + myJsonObject7_2[3]))">
	<!-- → number -->
	
	<br><br>
	<!-- check~!!! -->
	<input type="button" class="btn" value="click15"
		onclick="alert(myJsonObject7_1[0] + myJsonObject7_1[2])">
	<!-- → test1undefined -->
	<!-- **undefined를 문자열로 취급함** -->
	<input type="button" class="btn" value="click16"
		onclick="alert(typeof (myJsonObject7_1[0] + myJsonObject7_1[2]))">
	<!-- → string -->
	
	<br><br>
	<!-- check~!!! -->
	<input type="button" class="btn" value="click17"
		onclick="alert(myJsonObject7_2[3] + myJsonObject7_2[4])">
	<!-- → NaN(Not a Number) -->
	<input type="button" class="btn" value="click18"
		onclick="alert(typeof (myJsonObject7_2[3] + myJsonObject7_2[4]))">
	<!-- → number -->
	<!-- **NaN인지 아닌지 여부 확인을 위해 typeof 를 찍어보는 것은 의미없음!** -->
	
</form>

</body>
</html>
```
### 7.28.8. JsonTest08.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest08.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
var myJsonObject8=
{
	"test": ["ccc", "ddd"]
	, "exam": ["kkk", "ppp"]
}

/* var myJsonObject8={	"test": ["ccc", "ddd"], "exam": ["kkk", "ppp"]} */
</script>
</head>
<body class="section">

<form action="" class="layout">
	<input type="button" class="btn" value="click1" onclick="alert(myJsonObject8)">
	<!-- → [object(자바스크립트 타입) Object(html dom 타입)] -->
	<input type="button" class="btn" value="click2" onclick="alert(typeof myJsonObject8)">
	<!-- → object -->
	
	<br><br>
	
	<input type="button" class="btn" value="click3" onclick="alert(myJsonObject8.test)">
	<!-- → ccc,ddd -->
	<input type="button" class="btn" value="click4" onclick="alert(typeof myJsonObject8.test)">
	<!-- → object -->
	<!-- **배열도 typeof에서는 object** -->
	
	<br><br>
	
	<input type="button" class="btn" value="click5" onclick="alert(myJsonObject8.test[0])">
	<!-- → ccc -->
	<input type="button" class="btn" value="click6" onclick="alert(typeof myJsonObject8.test[0])">
	<!-- → string -->
	
	<!-- ※ 객체 구조상... 2차원 배열의 형태로 볼 수 있지만...
			다음과 같은 접근이나 처리는 불가능하다.
	 -->
	 
	<!-- ccc -->
	<input type="button" class="btn" value="click7" onclick="alert(myJsonObject8.[0][0])">
	<!-- → X -->
	<!-- ppp -->
	<input type="button" class="btn" value="click7" onclick="alert(myJsonObject8.[1][1])">
	<!-- → X -->
	
</form>

</body>
</html>
```
### 7.28.9. JsonTest09.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest09.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
var myJsonObject9 =
{
	"superman": 
	{
		"name":"moonjunghwan"
		, "age": 49
		, "hobby": ["song", "dance"]
	}	
}
</script>
</head>
<body class="section">

<form action="" class="layout">
	<input type="button" class="btn" value="click1" onclick="alert(typeof myJsonObject9)">
	<!-- → object -->
	
	<input type="button" class="btn" value="click2" onclick="alert(typeof myJsonObject9.superman)">
	<!-- → object -->
	
	<input type="button" class="btn" value="click3" onclick="alert(typeof myJsonObject9.superman.name)">
	<!-- → string -->
	
	<input type="button" class="btn" value="click4" onclick="alert(typeof myJsonObject9.superman.age)">
	<!-- → number -->
	
	<input type="button" class="btn" value="click5" onclick="alert(typeof myJsonObject9.superman.hobby)">
	<!-- → object -->
	
	<br><br>
	
	<input type="button" class="btn" value="click6" onclick="alert(myJsonObject9.superman.hobby[0])">
	<!-- → song -->
	<input type="button" class="btn" value="click7" onclick="alert(typeof myJsonObject9.superman.hobby[0])">
	<!-- → string -->
</form>

</body>
</html>
```
### 7.28.10. JsonTest10.html
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonTest10.html</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
function printString(cnt)
{
	alert(cnt);
}
window.onload = function()
{
	var temp = "printString('First')";
	
	/* JSON */
	var printList = 
	{
		"1": "printString('Hi JSON~!!!')"
		, "2": temp
		, "3": "alert('Second')"
		, "4": "printString('Third')"
	}
	
	for (var i = 1; i < 5; i++)	// 1 2 3 4
	{
		eval(printList[i]);
		/* 
		Hi JSON~!!!
		First
		Second
		Third
		*/
	}
};
</script>
</head>
<body>

</body>
</html>
```

<br>

## 7.29. [F_AjaxJquery04: jQuery의 ajax() 활용 실습]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/1720567a-06fa-4133-b43c-b8fa38b8e4ac)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/1dda860d-e562-4b3b-b532-04c1dad6bc72)

### 7.29.1. AjaxTest01.jsp
``` java
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
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">


$(function()
{
	$("#sendBtn").click(function()
	{
		// 테스트
		//alert("확인~!!!");
		
		// data 구성
		var params = "name=" + $.trim($("#name").val())
					+ "&content=" + $.trim($("#content").val());
		
		// check~!!!
		// ※ jQuery 의 ajax() 함수 사용(호출)
		
		//$.ajxa();
		//	↓
		//$.ajxa(
		//{
		//	type: "POST"				// 데이터 전송 및 페이지 요청 방식
		//	, url:"AjaxTest01_ok.jsp"	// 요청 페이지 URL
		//	, data: params				// 요청 페이지(AjaxTest01_ok.jsp)에서 수신하게 되는 데이터
		//	, success: 동작				// 페이지요청 및 데이터전달이 성공했을 때의 처리
		//	, beforeSend: 반환값확인	// 요청 전 확인해야 할 항목 처리(true/false)
		//	, error: 동작				// 처리과정에서 문제가 발생했을 때의 처리
		//});
		
		$.ajax(
		{
            type:"POST"
            , url:"AjaxTest01_ok.jsp"
            , data:params               // url 지정 페이지로 넘길 값   // check~!!
            , success:function(args)
            {
               $("#resultDiv").html(args);
               
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
	//console.log($.trim($("#name").val()));
	if(!$.trim($("#name").val()))
	{
		alert("이름을 입력해야 합니다.");
		$("#name").focus();
		
		return false;
	}
	
	if(!$.trim($("#content").val()))
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
	<h1>jQuery의 ajax() 활용 실습</h1>
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
```
### 7.29.2. AjaxTest01_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%><%
	// AjaxTest02_ok.jsp → XML 구성
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	response.setContentType("text.xml");
%><?xml version="1.0" encoding="UTF-8"?>
<lists>
	<total_dataCount>5</total_dataCount>
	<%
	for (int i=1; i<=5; i++)
	{
	%>
	<comment num="<%=i %>">
		<name><%=name+i %></name>
		<content><%=content+i %></content>
	</comment>
	<%
	}
	%>
</lists>
```

<br>

## 7.30. [jQuery의 ajax() 활용 실습2]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/17492343-b8ac-4f6f-b8a6-702075f16e3d)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e5569f33-87db-47c2-9b25-f71bb90419d6)

### 7.30.1. AjaxTest02.jsp
``` java
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
```
### 7.30.2. AjaxTets02_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%><%
	// AjaxTest02_ok.jsp → XML 구성
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	response.setContentType("text.xml");
%><?xml version="1.0" encoding="UTF-8"?>
<lists>
	<total_dataCount>5</total_dataCount>
	<%
	for (int i=1; i<=5; i++)
	{
	%>
	<comment num="<%=i %>">
		<name><%=name+i %></name>
		<content><%=content+i %></content>
	</comment>
	<%
	}
	%>
</lists>
```

<br>

## 7.31. [jQuery 의 ajax() 활용 실습3: 두수의 연산]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/93a22141-8823-4804-89ff-00814d8725ae)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/7b6bb37b-b954-4ca6-b203-67b2cdbc8ef8)

### 7.31.1. AjaxTest03Controller.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxTest03Controller extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		String view = "WEB-INF/view/AjaxTest03.jsp";
		//String view = "AjaxTest03.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
```
### 7.31.2. AjaxTest03OkController.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxTest03OkController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(LoadTest03.jsp)로부터 넘어온 데이터 수신
		// → su1, su2, oper
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		String oper = request.getParameter("oper");
		
		// 업무 로직 처리
		
		String result = "";
		if(oper.equals("add"))
			result = String.format("%d + %d = %d", su1, su2, (su1+su2));
		else if(oper.equals("sub"))
			result = String.format("%d - %d = %d", su1, su2, (su1-su2));
		else if(oper.equals("mul"))
			result = String.format("%d * %d = %d", su1, su2, (su1*su2));
		else if(oper.equals("div"))
			result = String.format("%d / %d = %d", su1, su2, (su1/su2));
		
		// 반환할 결과값 준비
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/AjaxTest03_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("AjaxTest03_ok.jsp");
		dispatcher.forward(request, response);
		
	}
}
```
### 7.31.3. AjaxTest03_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
${result}
```
### 7.31.4. AjaxTest03.jsp
``` html
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
		});
		
	})
});
</script>

</head>
<body class="section">
 
<div>
	<h1>jQuery 의 ajax() 활용 실습2: 두수의 연산</h1>
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
```
### 7.31.5. ajaxtest03.do
... 내용 없음 ...
### 7.32.6. /AjaxJquery04/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>WebApp00</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- 
  <servlet>
  	<servlet-name></servlet-name>
  	<servlet-class></servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name></servlet-name>
  	<url-pattern></url-pattern>
  </servlet-mapping>
  -->
  
  <!-- ajaxTest03 -->
  <servlet>
  	<servlet-name>ajaxTest03send</servlet-name>
  	<servlet-class>com.test.ajax.AjaxTest03Controller</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>ajaxTest03send</servlet-name>
  	<url-pattern>/ajaxtest03.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>ajaxTest03</servlet-name>
  	<servlet-class>com.test.ajax.AjaxTest03OkController</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>ajaxTest03</servlet-name>
  	<url-pattern>/ajaxtest03ok.do</url-pattern>
  </servlet-mapping>
</web-app>
```

<br>

## 7.32. [jQuery의 ajax()활용 실습4: xml 이용]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/7a3e2b65-9eae-48c6-8c2b-0c2146847bd5)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/27fadab9-cd5a-4a75-9ddc-eea5650d0f22)

### 7.32.1. AjaxTest04Controller.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxTest04Controller extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		String view = "WEB-INF/view/AjaxTest04.jsp";
		//String view = "AjaxTest04.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
```
### 7.32.2. AjaxTest04OkController.java
``` java
/* ==================
	ServletSample.java
=================== */

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxTest04OkController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		request.setAttribute("title", title);
		request.setAttribute("content", content);

		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/AjaxTest04_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("AjaxTest04_ok.jsp");
		dispatcher.forward(request, response);
		
	}
}
```
### 7.32.3. AjaxTest04_ok.jsp
``` java
<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%><%
	// AjaxTest04_ok.jsp → xml 구성
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	response.setContentType("text.xml");
%><?xml version="1.0" encoding="UTF-8"?>
<root>
	<status>true</status>
	<%
	for(int i=1; i<=2; i++)
	{
	%>
	<recodes id="<%=i%>">
		<title><%=title %></title>
		<content><%=content %></content>
	</recodes>
	<%
	}
	%>
</root>
```
### 7.32.4. AjaxTest04.jsp
``` html
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
```
### 7.32.5. ajaxtest04.do
... 내용없음...
### 7.32.6. /AjaxJquery04/WebContent/WEB-INF/web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>WebApp00</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- 
  <servlet>
  	<servlet-name></servlet-name>
  	<servlet-class></servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name></servlet-name>
  	<url-pattern></url-pattern>
  </servlet-mapping>
  -->
  
  <!-- ajaxTest03 -->
  <servlet>
  	<servlet-name>ajaxTest03send</servlet-name>
  	<servlet-class>com.test.ajax.AjaxTest03Controller</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>ajaxTest03send</servlet-name>
  	<url-pattern>/ajaxtest03.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>ajaxTest03</servlet-name>
  	<servlet-class>com.test.ajax.AjaxTest03OkController</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>ajaxTest03</servlet-name>
  	<url-pattern>/ajaxtest03ok.do</url-pattern>
  </servlet-mapping>
  
  <!-- ajaxTest04 -->
  <servlet>
  	<servlet-name>ajaxTest04send</servlet-name>
  	<servlet-class>com.test.ajax.AjaxTest04Controller</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>ajaxTest04send</servlet-name>
  	<url-pattern>/ajaxtest04.do</url-pattern>
  </servlet-mapping>
  
  <servlet>
  	<servlet-name>ajaxTest04</servlet-name>
  	<servlet-class>com.test.ajax.AjaxTest04OkController</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>ajaxTest04</servlet-name>
  	<url-pattern>/ajaxtest04ok.do</url-pattern>
  </servlet-mapping>
</web-app>
```

------------------------------------------------

## 7.2. []

### 7.3.1. WebApp11_scott.sql
``` sql
```
### 7.3.2. ScoreDTO.Java
``` java
```
### 7.2.3. ScoreDAO.Java
``` java
```
### 7.2.4. ScoreList.jsp
``` html
```
### 7.2.5. ScoreInsert.jsp
``` html
```

## 7.3. []

### 7.3.1. .jsp
``` html
```
### 7.3.2. .jsp
``` html
```

## 7.4. []

### 7.4.1. .jsp
``` html
```
### 7.4.2. .jsp
``` html
```

## 7.5. []

### 7.5.1. .jsp
``` html
```
### 7.5.2. .jsp
``` html
```

## 7.6. []

### 7.6.1. .jsp
``` html
```
### 7.6.2. .jsp
``` html
```



## 7.. []

### 7..1. .jsp
``` html
```
### 7..2. .jsp
``` html
```



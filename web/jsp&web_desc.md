
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

## 7.7. [세션처리-로그인]

### 7.7.1. WebApp11_scott.sql
``` java
```
### 7.7.2. ScoreDTO.Java
``` java
```
### 7.7.3. ScoreDAO.Java
``` java
```
### 7.7.4. ScoreList.jsp
``` html
```
### 7.7.5. ScoreInsert.jsp
``` html
```

<br>

## 7.8. [세션처리-로그인]

### 7.8.1. WebApp11_scott.sql
``` java
```
### 7.8.2. ScoreDTO.Java
``` java
```
### 7.8.3. ScoreDAO.Java
``` java
```
### 7.8.4. ScoreList.jsp
``` html
```
### 7.8.5. ScoreInsert.jsp
``` html
```

<br>

## 7.9. [세션처리-로그인]

### 7.9.1. WebApp11_scott.sql
``` java
```
### 7.9.2. ScoreDTO.Java
``` java
```
### 7.9.3. ScoreDAO.Java
``` java
```
### 7.9.4. ScoreList.jsp
``` html
```
### 7.9.5. ScoreInsert.jsp
``` html
```

<br>

## 7.10. [세션처리-로그인]

### 7.10.1. WebApp11_scott.sql
``` java
```
### 7.10.2. ScoreDTO.Java
``` java
```
### 7.10.3. ScoreDAO.Java
``` java
```
### 7.10.4. ScoreList.jsp
``` html
```
### 7.10.5. ScoreInsert.jsp
``` html
```

<br>

## 7.11. [세션처리-로그인]

### 7.11.1. WebApp11_scott.sql
``` java
```
### 7.11.2. ScoreDTO.Java
``` java
```
### 7.11.3. ScoreDAO.Java
``` java
```
### 7.11.4. ScoreList.jsp
``` html
```
### 7.11.5. ScoreInsert.jsp
``` html
```

<br>

## 7.12. [세션처리-로그인]

### 7.12.1. WebApp11_scott.sql
``` java
```
### 7.12.2. ScoreDTO.Java
``` java
```
### 7.12.3. ScoreDAO.Java
``` java
```
### 7.12.4. ScoreList.jsp
``` html
```
### 7.12.5. ScoreInsert.jsp
``` html
```

<br>

## 7.13. [세션처리-로그인]

### 7.13.1. WebApp11_scott.sql
``` java
```
### 7.13.2. ScoreDTO.Java
``` java
```
### 7.13.3. ScoreDAO.Java
``` java
```
### 7.13.4. ScoreList.jsp
``` html
```
### 7.13.5. ScoreInsert.jsp
``` html
```

<br>

## 7.14. [세션처리-로그인]

### 7.14.1. WebApp11_scott.sql
``` java
```
### 7.14.2. ScoreDTO.Java
``` java
```
### 7.14.3. ScoreDAO.Java
``` java
```
### 7.14.4. ScoreList.jsp
``` html
```
### 7.14.5. ScoreInsert.jsp
``` html
```

<br>

## 7.15. [세션처리-로그인]

### 7.15.1. WebApp11_scott.sql
``` java
```
### 7.15.2. ScoreDTO.Java
``` java
```
### 7.15.3. ScoreDAO.Java
``` java
```
### 7.15.4. ScoreList.jsp
``` html
```
### 7.15.5. ScoreInsert.jsp
``` html
```

<br>

## 7.16. [세션처리-로그인]

### 7.16.1. WebApp11_scott.sql
``` java
```
### 7.16.2. ScoreDTO.Java
``` java
```
### 7.16.3. ScoreDAO.Java
``` java
```
### 7.16.4. ScoreList.jsp
``` html
```
### 7.16.5. ScoreInsert.jsp
``` html
```

<br>

## 7.17. [세션처리-로그인]

### 7.17.1. WebApp11_scott.sql
``` java
```
### 7.17.2. ScoreDTO.Java
``` java
```
### 7.17.3. ScoreDAO.Java
``` java
```
### 7.17.4. ScoreList.jsp
``` html
```
### 7.17.5. ScoreInsert.jsp
``` html
```

<br>

## 7.18. [세션처리-로그인]

### 7.18.1. WebApp11_scott.sql
``` java
```
### 7.18.2. ScoreDTO.Java
``` java
```
### 7.18.3. ScoreDAO.Java
``` java
```
### 7.18.4. ScoreList.jsp
``` html
```
### 7.18.5. ScoreInsert.jsp
``` html
```

<br>

## 7.19. [세션처리-로그인]

### 7.19.1. WebApp11_scott.sql
``` java
```
### 7.19.2. ScoreDTO.Java
``` java
```
### 7.19.3. ScoreDAO.Java
``` java
```
### 7.19.4. ScoreList.jsp
``` html
```
### 7.19.5. ScoreInsert.jsp
``` html
```

<br>

## 7.20. [세션처리-로그인]

### 7.20.1. WebApp11_scott.sql
``` java
```
### 7.20.2. ScoreDTO.Java
``` java
```
### 7.20.3. ScoreDAO.Java
``` java
```
### 7.20.4. ScoreList.jsp
``` html
```
### 7.20.5. ScoreInsert.jsp
``` html
```

<br>

## 7.21. [세션처리-로그인]

### 7.21.1. WebApp11_scott.sql
``` java
```
### 7.21.2. ScoreDTO.Java
``` java
```
### 7.21.3. ScoreDAO.Java
``` java
```
### 7.21.4. ScoreList.jsp
``` html
```
### 7.21.5. ScoreInsert.jsp
``` html
```

<br>

## 7.22. [세션처리-로그인]

### 7.22.1. WebApp11_scott.sql
``` java
```
### 7.22.2. ScoreDTO.Java
``` java
```
### 7.22.3. ScoreDAO.Java
``` java
```
### 7.22.4. ScoreList.jsp
``` html
```
### 7.22.5. ScoreInsert.jsp
``` html
```

<br>

## 7.23. [세션처리-로그인]

### 7.23.1. WebApp11_scott.sql
``` java
```
### 7.23.2. ScoreDTO.Java
``` java
```
### 7.23.3. ScoreDAO.Java
``` java
```
### 7.23.4. ScoreList.jsp
``` html
```
### 7.23.5. ScoreInsert.jsp
``` html
```

<br>

## 7.24. [세션처리-로그인]

### 7.24.1. WebApp11_scott.sql
``` java
```
### 7.24.2. ScoreDTO.Java
``` java
```
### 7.24.3. ScoreDAO.Java
``` java
```
### 7.24.4. ScoreList.jsp
``` html
```
### 7.24.5. ScoreInsert.jsp
``` html
```

<br>

## 7.25. [세션처리-로그인]

### 7.25.1. WebApp11_scott.sql
``` java
```
### 7.25.2. ScoreDTO.Java
``` java
```
### 7.25.3. ScoreDAO.Java
``` java
```
### 7.25.4. ScoreList.jsp
``` html
```
### 7.25.5. ScoreInsert.jsp
``` html
```

<br>

## 7.26. [세션처리-로그인]

### 7.26.1. WebApp11_scott.sql
``` java
```
### 7.26.2. ScoreDTO.Java
``` java
```
### 7.26.3. ScoreDAO.Java
``` java
```
### 7.26.4. ScoreList.jsp
``` html
```
### 7.26.5. ScoreInsert.jsp
``` html
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



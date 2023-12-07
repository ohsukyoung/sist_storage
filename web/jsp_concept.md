# 5. JSP(Java Server Page)

## 5.1. JSP(Java Server Pages): 웹 프로그램 작성 언어의 한 종류
## 5.2. JSP(Java Server Pages)는 동적(Dynamic)인 웹 페이지를 비교적 간단히 만들 수 있는 방법을 제공하는
    자바를 기반으로 하고 있는 스크립트(Server Side Script)로
    자바 엔터프라이즈 어플리케이션에서 UI(User Interface) 영역을 담당하고 있다.
## 5.3. JSP(Java Server Pages)는 자바의 서버 환경에서 사용하는 스크립트 방식의 언어로 단일 스레디로 클라이언트의 요청에 서비스한다.
    요청이 있을 때마다... 즉, 객체가 생성될 때 마다...
    프로세스를 생성하는 기존의 CGI와 는 달리 하나의 메모리를 공유하면서 서비스되는 원리를 갖고 있다.
    이러한 원리는 서버측 부하를 줄여주며, JSP 내부에는 보여준느 코드만 작성하고 직접 작업하는 부분은 자바 빈으로 구성하여 둘을 분리할 수 있다.
    이는 서로 영향을 주지 않으면서 수정할 수 있는 장점을 취하며, JAVA 가 갖고 있는 장점인 재상용 성을 높일 수 있게 한다.
``` html
    클라이언트 <------------------------> 서버
    HTML, CSS, Javascript <------------> JSP(JAVA)
    브라우저(IE, CR, FF 등) <-----------> 웹서버(톰캣), 오라클
    요청 <----------------------------> 응답(HTML 웹 페이지)
```
## 5.4. JSP 실행 구조
    1단계. 웹클라이언트에서 웹 서버에 웹 프로그램(페이지) 요청.

    2단계. 웹 서버에서 웹 클라이언트가 요청한 JSP 프로그램(페이지) 로드.

    3단계. JSP 페이지에 대한 변환 실행
         (※ 이 과정에서 일반 『.java』 인 파일로 변환된다. 『-> Servlet』)

    4단계. 『.java』 인 파일로 변환된 Sevlet 의 컴파일(.class) 및 실행.

    5단계. 실행 결과로 동적 생성된 HTML Document 를 클라이언트 측에 응답.

    6단계. 웹 클라이언트는 응답받은 HTML Document 를 브라우저에서 웹 페이지 형태로 출력

## 5.5. 이클립스 JSP 개발 환경 구축
1) 프로젝트(new) 생성 시 『Dynamic Web Project』 선택
2) 프로젝트 명 입력 시 식별자 작성 규칙을 준수
원래 규칙에 따르면 『JspTest001.jsp』와 같이 명명해야 하지만,
클라이언트 측에서 (대소문자 구분 없이) 좀 더 편하게 사용할 수 있도록 일단 지금은(당분간은) 『japtest001.jsp』와 같이 명명한다.
4) Target Runtime 지정 -> 톰캣 설치 디렉터리 연결
5) 프로젝트 생성 후에는 Server 탭에서 톰캣 서버 등록
(단, 서버에 새로 등록했을 경우 서버 관련 설정을 재구성)
6) 톰캣 서버에 프로젝트 등록 -> add and remove
7) 톰캣 서버 시작(재시작)
``` html
※ 이 시점에서...
    포트번호 설정 및 확인 필요
    (오라클이 웹 상에서 port 8080 을 사용하기 때문에 충돌 방지)
    『Project Explorer』 의 『Server』 디렉터리 노드를 확장하면
    『server.xml』 파일이 존재하며, 이 파일을 열어 63 ~ 65 정도 라인의 내용을 수정한다.

    <Connector UIRIEncoding="UTF-8" ... port="3306" />
	       --------------------     ----------
		↑ 추가 삽입              ↑ 수정(기본 8080)
※ xml 파일을 수정한 후에는 반드시 서버를 재시작 해야 한다.          check~!!!
```
8) JSP 페이지 작성(확장자 『.jsp』)
-> WebContent 디렉터리 하위에 작성
※ 페이지 자성 전에 Encoding 방식을 체크 및 설정한다. (UTF-8)  
※ JSP 기본 페이지의 템플릿을 HTML5 기반으로 수정한여 설정한다. (기본 HTML 4.01)  

9) 톰캣 서버가 실행되고 있는 상태에서 
웹 브라우저의 URL 주소창에 다음과 같은 주소를 요청한다. (클라이언트 입장)  
``` html
http://서버주소:포트번호/프로젝트이름/파일이름.jsp

http://localhost:3306/WebApp04/jsptest001.jsp
     -----------
     127.0.0.1
```
※ 원격 접속인 경우 localhost(127.0.0.1) 대신 목적지 서버의 IP Adress 를 작성해야 한다.

## 5.6. ○ jsp 구성 요소
### 5.6.1. 디렉티브(지시어)
- 페이지에 대한 설정 정보 지정. 클래스 속성을 변경.
<%@  %>

· Page
페이지에 대한 기본 정보 입력 (생성하는 문서의 타입, 출력 버퍼의 크기, 에러 페이지 등)
현재 문서를 나타내는 객체
page 디렉티브는 JSP 페이지와 관련된 속성을 정의하고 이 속성들은 웹 컨테이너에 정보를 제공한다.
또한, 한 페이지에 page 디렉티브는 여러 번 등장 할 수 있고 위치도 관계 없다.
하지만 보통 페이지 상단에 기술한다.

주요속성
- language: 스크립트 코드에서 사용되는 프로그래밍 언어 지정
- contentType: 생성할 문서 타입
- import: 사용할 자바 클래스 지정
- session: 세션 사용 여부 지정
- buffer: 출력 버퍼 크기 지정
- autoFlush: 출력 버퍼가 다 채워졌을 경우 자동으로 버퍼에 있는 데이터를 비우게 만들지의 여부 지정
- info: 페이지에 대한 설명
- errPage: 실행 도중 에러 발생 시 보여줄 페이지 지정
- pageEncoding: 페이지 자체의 캐릭터 인코딩 지정

· tablib
태그 라이브러리(tag library)
사용자가 만든 태그 모음(사용자가 직접 기능 설정)

· include
다른 문서를 포함하는 기능
여러 JSP 페이지에서 공통적으로 포함하는 내용이 있을 때 이러한 내용을 매번 반복해서 입력하지 않고 
별도의 파일에 저장해 두었다가 JSP 파일에 삽입되도록 하는 것 -> 생산성 향상
include 디렉티브 처리 과정은
정적으로 include 지시자를 사용한 JSP 페이지가 컴파일 되는 과정에서 include 되는 JSP 페이지 소스 내용을 그대로 포함해서 컴파일 한다.
즉, 복사& 붙여넣기 방시그올 두 개의 파일을 하나로 구성한 후 같이 변화되고 컴파일 된다.

### 5.6.2. 스크립트 요소
- 스크립트 릿(Scriptlet)... 스크립 릿...스크립틀릿...
JSP에 자바 코드를 기술
<% %>

JSP 문서 내에 JAVA 코드를 기술하는 부분이기 때문에 오로지 자바 코드만 올 수 있다.
스크립트 릿에 선언되 변수는 지역 변수의 성격을 가지게 되며
(서블릿 안에 있는 service() 메소드 안에 선언된 변수이므로...)
자바에서 메소드 내에 선언된 변수라고 할 수 있다.

- 표현식(Expression)
HTML 문서 결과값이 포함시키고자 할 때 사용
<%= %>
(즉, 브라우저에 등장시킬 수 있는 영역)

- 선언부(Declaration)
스크립트릿이나 표현식에서 사용할 수 있는 함수 작성 시 사용.
<%! %>

스크립트 릿이나 표션식에서 사용할 수 있는 변수나 메소드를 정의하는
부분이기 때문에 선언부에서 선언된 변수는 서블릿으로 변환되는 과정에서
멤버 변수의 입장을 취하게 되며 전역 변수의 성격을 가진다.
또한, 『_jspInit()』, 『_jspDestory()』 와 같은 생명주기 운영을 위해 메소드를 재정의 할 수 있다.

## 5.7. 코드
### 5.7.1. jsptest001.jsp_디렉티브 영역, 스크립 릿 영역
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/a2582513-2000-49f0-b7f3-d93d6c3efee1)
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- ** 디렉티브영역, page, 텍스트로 작성된 html, utf-8 ** -->

<!-- **
	생긴모양은 html과 유사하지만, 다른 문법!
	- html) 만들어서 전달하면 끝
	- jsp) 각 상황에 맞춰 만들어진 설계서를 기준으로 새롭게 만듦
** -->
<%
	//Scriptlet(스크립트릿) 영역
	
	/* 자바가 오기 때문에, 라인단위 주석-블럭단위 주석사용 가능 */
	String name = "김지민";
	name += "은 홍길동이 아니다.";
	
	int result = 10 + 20;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest001.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2><%=name %></h2>
	<h2><%=result %></h2>
</div>

</body>
</html>
```
### 5.7.2. jsptest002.jsp_『out』 출력 스트림, 『out.println』-> 띄어쓰기,『\n』-> 띄어쓰기,『<br>』 -> 개행
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/f76599ae-0c04-4659-b0d2-16089d0d5ec2)

``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 스크립트 영역-> JSP 에서 JAVA 코드를 기술하는(사용하는) 영역
	int a= 10, b=5, c;
	c = a + b;
	
	//-- 스크립 릿 영역에서 수행된 자바 코드의 실행 결과는
	//	 표현식에 의해 HTML 브라우저 영역에 출력된다.

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest002.jsp</title>
</head>
<body>
<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<!-- 표현식 -->
	<h2>합) <%=a %> + <%=b %> = <%=c %></h2>
</div>
<%
	// 스크립 릿 영역
	
	//※ 『out』 은 내장 객체로서 출력 스트림이다.
	out.print("1) 합: " + a + "+" + b + "="+ c);
	out.println("2) 합: " + a + "+" + b + "="+ c);
	out.println("3) 합: " + a + "+" + b + "="+ c);
	/* ** print, println은 HTML document 영역에서 만들어지므로 개행되지 않음 ** */

	out.println("<br></br>");
	out.println("4) 합" + a + "+" + b + "="+ c);
	out.println("5) 합" + a + "+" + b + "="+ c + "<br>");
	/* ** out.println -> 띄어쓰기 됨  ** */
	
	out.println("<br></br>");
	
	String str = String.format("6) 합: %d + %d = %d", a, b, c);
	out.print(str);
	out.print(str);
	
	out.println("<br></br>");

	/* ** \n -> 띄어쓰기됨 ** */
	str = String.format("7) 합: %d + %d = %d\n", a, b, c);
	out.print(str);
	out.print(str);
	
	out.println("<br></br>");

	/* ** <br> -> 개행됨 ** */
	str = String.format("8) 합: %d + %d = %d<br>", a, b, c);
	out.print(str);
	out.print(str);
	
%>

</body>
</html>
```

### 5.7.3. jsptest003.jsp_『_jspInit()』 메소드, 『_jspDestroy()』 메소드, 『_jspService()』 메소드
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/46532a6f-4d0b-4e05-85f2-2c35817ca2cf)

``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%!
	// ○ 선언부 영역 -> 함수 정의가 가능한 영역
	
	// 선언부에서 선언한 변수 a
	int a = 10;
	
	// 선언부에서 정의한 함수 sum()
	int sum(int x)
	{
		int s=0;
		for (int i=1; i<=x; i++)
			s += i;
		return s;
	}

%>
<%
	// ○ 스크립 릿 영역
	
	// 스크립릿 영역에서 선언한 변수 b
	int b=0;

	a++;
	b++;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest003.jsp</title>
</head>
<body>
<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2>변수의 값 확인</h2>
	<h3>a: <%=a %></h3>
	<h3>b: <%=b %></h3>
</div>

<!-- 
	※ 요청한 페이지(jsptest003.jsp)의 결과를 확인한 후 새로고침을 반복해 보면..
		a 변수(선언부에 선언한 변수) 값만 계속 증가하는 것을 확인할 수 있다.
		a 변수 갑산 계속 증가하는 이유를 확인하기 위해서는
		서블릿(survlet) 코드를 분석해 보아야 한다.
		
		즉, jsptest003.jsp 의 서블릿 코드를 분석해야 한다.
		
		- 경로
		C:\WebStudy\.metadata\.plugins\org.eclipse.wst.server.core
					\tmp0\work\Catalina\localhost\WebApp04\org\apache\jsp
		-----------								  --------
		workspace								  project
		
		- 파일
			jsptest003_jsp.java
			------------	----
			jsp 파일명		서블릿(servlet)의 확장자 -> 컴파일 이전
			
	   ==>> 변수 a는 클래스(jsptest003_jsp)의 전역변수로 선어뇐 것을 확인할 수 있다.
			이는 객체가 소멸되기 전까지는 계속 값이 유지된다는 것을 의미한다.
			변수 b는 메소드(jsptest002_jsp 클래스의 _jspService() 메소드) 내의
			지역변수로 선언된 것을 확인할 수 있다.
			
			『_jspInit()』 메소드와 『_jspDestroy()』 메소드는
			서비스가 시작될 때와 끝날 때 한 번씩만 실행되는 메소드이다.
			반면.. 『_jspService()』 메소드는
			브라우저에 의해 페이지가요청될 때 마다 매번 실행되는 메소드이다.
			
			이로 인해 변수 b는 페이지에 대한 요청이 발생할 때 마다
			새롭게 초기화 되는 과정을 거치게 되는 것이다.
			
			JSP 페이지의 스크립릿 영역에서 선언된 모든 변수는
			이 『_jspService()』 메소드의 지역변수가 된다.
			
			또한, JSP페이지의 선언부영역에서 선언된 모든 변수는
			클래스의 번역변수(인스턴스 변수)가 된다.
			
			JSP 페이지에서 메소드 정의 시
			스크립릿 영역 내부에서는 정의할 수 없다.
			서블릿으로 변환되는 과정에서
			메소드 내부에 또 다른 메소드가 다시 정의되는 상황이 되어버리기때문에
			문법적으로 잘못된 표현이 되는 것이다.
			
			선언부는.. 비록 사용빈도가 낮지만..
			메소드는 선언부 내부에서만 정의할 수 있는 것이다.
		
 -->
</body>
</html>
```

### 5.7.4. jsptest004.java_서블릿 관련 실습
``` java
/* ==================
	Test004.java
	- Servlet 실습
=================== */

// 현재... 자바의 기본 클래스 Test004
// 이를... Servlet 으로 구성하는 방법

// GenericServlet 을 상속받는 클래스로 설계 -> Servlet

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//import javax.servlet.Servlet;

//public class Test004 implements Servlet
//public abstract class Test004 extends GenericServlet
public class Test004 extends GenericServlet
{
	private static final long serialVersionUID = 1L;

	// GenericServlet 의 추상메소드 재정의~!!!
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{
		// **request-> 요청객체**
		// **response-> 응답객체**
		
		// 요청에 대한 응답 방법
		response.setContentType("text/html; charset=UTF-8");
		
		try
		{
			// 출력 스트림 구성
			PrintWriter out = response.getWriter();
			
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("Test004.java");
			out.print("</title>");
			out.print("</head>");
			
			out.print("<body>");
			out.print("<div>");
			out.print("<h1>");
			out.print("서블릿 관련 실습");
			out.print("</h1>");
			out.print("<hr>");
			out.print("</div>");
			
			out.print("<div>");
			out.print("<h2>");
			out.print("GenericServlet 클래스를 이용한 서블릿 테스트");
			out.print("</h2>");
			out.print("</div>");

			out.print("</body>");

			out.print("</html>");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}

}
```

#### 5.7.4.1. web.xml
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>WebApp04</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- **Servlet 과 Servlet-mapping이 같은 이름이어야 함** -->
  <servlet>
  	<servlet-name>Test004</servlet-name>				<!-- ** 매핑을 구분하기 위한 이름 ** -->
  	<servlet-class>com.test.Test004</servlet-class>		<!-- ** Serlvet 클래스 이름 ** -->
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>Test004</servlet-name>
  	<url-pattern>/test004</url-pattern>					<!-- ** Serlvet 대응하는 URL ** -->
  </servlet-mapping>
  
</web-app>
```

<br>

### 5.7.5. [HttpServlet 관련 실습]

#### 5.7.5.1. jsptest005.html_HttpServlet 관련 실습(HttpServlet 을 상속받는 클래스로 설계)
- >**스크립트제어-> id 속성, 서버제어-> name 속성**

- ※ form 태그의 action 속성은 제이터 전송 및 페이지 요청을 해야하는 대상 페이지를 등록하는 기능을 수행.
(생략 시 데이터 전송 및 페이지 요청을 하게 되는 대상은 자기 자신)

- ※ form 태그의 method 속성은 데이터 전송 및 페이지 요청에 대한 방식
(생략 시 데이터 전송 및 페이지 요청을 하게 되는 방식은 get)

- ※ submit 액션 -> form 데이터 전송 및 페이지 요청
``` java
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest005.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div class="layout">
	<h2>HttpServlet 관련 실습</h2>
	
	<!-- ※ 입력 컨트롤을 활용하여 서버로 데이터를 전송하기 위해서는 form 필요 -->
	<!-- ※ form 태그의 action 속성은 제이터 전송 및 페이지 요청을 해야하는 대상 페이지를 등록하는 기능을 수행.
			(생략 시 데이터 전송 및 페이지 요청을 하게 된느 대상은 자기 자신) -->
	<!-- ※ form 태그의 method 속성은 데이터 전송 및 페이지 요청에 대한 방식
			(생략 시 데이터 전송 및 페이지 요청을 하게 되는 방식은 get) -->
	<form action="/WebApp04/login" method="get">
		<!-- ** action="" -> 내가 나 자신을 참조(ex. 내가 전송, 내가 받아 갱신) ** -->
		<!-- ** method="" -> get 방식으로 처리 ** -->
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<!-- name 속성 check~!!! -->
					<!-- **스크립트제어-> id 속성, 서버제어-> name 속성** -->
					<input type="text" name="userId" size="10" maxlength="10" class="txt">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<!-- name 속성 check~!!! -->
					<input type="password" name="userPwd" size="10" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- ※ submit 액션 -> form 데이터 전송 및 페이지 요청 -->
					<input type="submit"  value="로그인" class="btn control">
					<input type="reset"  value="다시입력" class="btn control">
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- **
	http://localhost:3306/WebApp04/jsptest005.jsp?userId=super&userPwd=1234
	ㄴ '?' 앞 -> 요청하는 페이지
	ㄴ '?' 뒤 -> 응답 내용(& 형태로 결합됨)
** -->



</body>
</html>
```

#### 5.7.5.2. Test005.java_요청받은 내용을 응답(출력스크림 구성)
``` html
/* ==================
	Test005.java
	- Servlet 실습
=================== */

// 현재... 자바의 기본 클래스 Test004
// 이를... Servlet 으로 구성하는 방법

// HttpServlet 을 상속받는 클래스로 설계 -> Servlet
// ** HttpServlet이 가장 일반적인 방법 **
// ** HttpServlet api -> https://docs.oracle.com/javaee%2F7%2Fapi%2F%2F/javax/servlet/http/HttpServlet.html **

/* **
우리가 페이지를 요청하는 것이 아니라, servlet(서블릿 컨테이너) 이 요청하는 것
ㄴ 사용자가 get 방식 -> 서블릿 doGet
ㄴ 사용자가 post 방식-> 서블릿 doPost
 ** */
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test005 extends HttpServlet
// ** 추상클래스이지만, 내부적으로 추상메소드를 가지고 있지 않음 **
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
		
		// request -> 요청 객체
		String id = request.getParameter("userId");
		// ** request 객체로부터 userId를 꺼내서 쓸 것이다. **
		String pwd = request.getParameter("userPwd");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String str="아이디:" + id + ", 패스워드: " + pwd;
		
		
		// 응답을 출력 스트림으로 구성하기 위한 준비
		PrintWriter out = response.getWriter();
		
		// 출력 스트림을 활용해서 페이지 렌더링
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset=\"UTF-8\">"); 
		// ** 이중따옴표 처리: "UTF-8" -> \"UTF-8\" **
		out.print("<title>Test005.java</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("");
		out.print("<div>");
		out.print("	<h1>서블릿 관련 실습</h1>");
		out.print("	<hr>");
		out.print("</div>");
		out.print("");
		out.print("<div>");
		out.print("	<h2>HttpServlet 클래스를 활용한 서블릿 테스트</h2>");
		out.print("	");
		out.print("	<p>" + str + "</p>");
		out.print("</div>");
		out.print("");
		out.print("</body>");
		out.print("</html>");
	}
}
```
#### 5.7.5.3. web.xml_ jsp와 java를 servlet을 통해 연결
``` html
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" version="3.1">
  <display-name>WebApp04</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- *************************************************************************************** -->

  <!-- **Servlet 과 Servlet-mapping이 같은 이름이어야 함** -->
  <servlet>
  	<servlet-name>Test004</servlet-name>				<!-- ** 매핑을 구분하기 위한 이름 ** -->
  	<servlet-class>com.test.Test004</servlet-class>		<!-- ** Serlvet 클래스 이름 ** -->
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>Test004</servlet-name>
  	<url-pattern>/test004</url-pattern>					<!-- ** Serlvet 대응하는 URL ** -->
  </servlet-mapping>
  
  <!-- *************************************************************************************** -->
  
  <servlet>
  	<servlet-name>Test005</servlet-name>
  	<servlet-class>com.tets.Test005</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>Test005</servlet-name>
  	<url-pattern>/login</url-pattern>
  </servlet-mapping>
  
  <!-- *************************************************************************************** -->

</web-app>
```
#### 5.7.5.4. ResponseSample.html_HTML 코드 작성을 위한 샘플
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test005.java</title>
</head>
<body>

<div>
	<h1>서블릿 관련 실습</h1>
	<hr>
</div>

<div>
	<h2>HttpServlet 클래스를 활용한 서블릿 테스트</h2>
	
	<p> </p>
</div>

</body>
</html>
```

<br>

### 5.7.6. [JSP를 이용한 데이터 송수신 실습 01]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/326337d8-a76b-4590-b108-168264be3244)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/bc8a3c57-7d1c-4844-87f3-bbe170470bba)

#### 5.7.6.1. Hap.jsp_JSP를 이용한 데이터 송수신 실습 01
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 01</h1>
	<hr>
	<p>Hap.jsp -> HapOk.jsp</p>
</div>

<div class="layout">
	<!-- ※ <form> 의 action 속성 시정 시 『HapOk.jsp』 로 지정해도 되고
			『/WebApp05/HapOk.jsp』 형태로 지정해도 된다.
			단, 『/HapOk.jsp』로 지정하면 안된다. -->
	<form action="/WebApp05/HapOk.jsp" method="post">
	<!-- <form action="HapOk.jsp"> -->
		<div class="input_box">
			<ul>
				<li>정수1 <input type="text" name="su1" class="txt"></li>
				<li>정수2 <input type="text" name="su2" class="txt"></li>
			</ul>			
		</div>
		<div class="btn_box">
			<input type="submit" value="결과 확인" class="btn control">
		</div>
	</form>
	<!-- ① form 내부에 구성한 데이터들을 『HapOk.jsp』 로 전송하겠다. -> su1, su2 -->
	<!-- ② 『HapOk.jsp』 페이지를 요청하겠다.
			 -> 내가 보내는 데이터들을 받고~ 나를 그 페이지와 만날 수 있게해다오~!!! -->
	
</div>


</body>
</html>
```
#### 5.7.6.2. HapOk.jsp_JSP를 이용한 데이터 송수신 실습 01
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 스크립릿 영역
	
	// 이전 페이지(Hap.jsp)로부터 넘어온 데이터 수신 -> su1, su2
	String str1 = request.getParameter("su1");
	String str2 = request.getParameter("su2");
	
	int sum=0;
	
	try
	{
		int n1 = Integer.parseInt(str1);
		int n2 = Integer.parseInt(str2);
		
		sum = n1 + n2;
	}
	catch(Exception e)
	{
		// 예외 발생 시...
		// 클라이언트의 브라우저 화면에 출력되지 않고
		// 서버의 콘솔 창에 오류 메세지가 나오도록 구성하는 코드
		System.out.println(e.toString());
		
		// 예외 발생 시...
		// 해당 내용을 서버 log 기록으로 남기는 처리...
		getServletContext().log("오류: " + e.toString());
		
		// ...
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HapOk.jsp</title>
</head>
<body>
	
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 01</h1>
	<hr>
	<p>Hap.jsp -> HapOk.jsp</p>
</div>
	
<div>
	<!-- <h2>결과: 10</h2> -->
	<h2>결과: <%=sum %></h2>
</div>

	
</body>
</html>
```

<br>

### 5.7.7. [JSP를 이용한 데이터 송수신 실습 02]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/007b1ada-dadf-484b-887d-e83358bd545f)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/6fff8b6b-67b1-41f4-94ae-acd78b2b3b94)

#### 5.7.7.1. Gugudan.jsp_JSP를 이용한 데이터 송수신 실습 02
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp -> GugudanOk.jsp</p>
</div>

<div class="layout">
	<form action="/WebApp05/GugudanOk.jsp" method="post">
		<table class="table">
			<tr>
				<th>원하는 단 입력</th>	
				<td>
					<input type="text" name="dan" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="결과 확인" class="btn control" style="width: 100%;">
				</td>
			</tr>
		</table>
	</form>

</div>

</body>
</html>
```
#### 5.7.7.2. GugudanOk.jsp_JSP를 이용한 데이터 송수신 실습 02
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// [ 내가 푼 풀이 ] ==============================================
	// 스크립릿 영역
	/* int dan = 0;
	String result = "";

	try
	{
		dan = Integer.parseInt(request.getParameter("dan"));
		
		
		for(int i=1; i<=9; i++)
		{
			// System.out.println(dan + " * " + i + " = " + dan*i);
			result += (dan + " * " + i + " = " + dan*i+"<br>");
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}; */
	

	// [ 함께 푼 풀이 ] ==============================================
	// 이전 페이지(Gugudan.jsp)로 부터 데이터 수신 -> dan
	String danStr = request.getParameter("dan");
	int n=0;
	
	try
	{
		n = Integer.parseInt(danStr);
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
<title>GugudanOk.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp -> GugudanOk.jsp</p>
</div>
	<div class="layout">
<!-- 	// [ 내가 푼 풀이 ] ============================================== -->
		<%-- 
		<div class="info_box">결과: <%=dan%> 단</div>
		<div class="result_box"><%=result%></div>
		 --%>
<!-- html 주석문: 브라우저에게 가시적으로 보지 않도록 안내 -> 소스코드보기로 보여짐 -->
<%-- JSP 주석문: sevlet container 가 인식하지 못하는 영역 --%>
		
<!-- 	// [ 함께 푼 풀이 ] ============================================== -->
<%-- 방법1 --%>
<%-- <%
	for(int i=1; i<=9; i++)
	{
		// System.out.println(dan + " * " + i + " = " + dan*i);
		out.print(n + " * " + i + " = " + (n*i)+"<br>");
	}
%> --%>


<%-- 방법2 --%>
  <%for(int i=1; i<=9; i++)
	{%>
		<%=n%> * <%=i%> = <%=(n*i)%> <br>
  <%}%>
	</div>
</body>
</html>
```
<br>

### 5.7.8. [radio, select 데이터 전송]
// 한글 깨짐 방지 처리
request.setCharacterEncoding("UTF-8"); // check~!!!
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/4e792111-3132-497d-a2d8-f5585244190b)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/3d2c33ad-ee4d-4a91-a5bf-e1f827eb2dc8)

#### 5.7.8.1. RadioSelect.jsp_radio, select 데이터 전송
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect.jsp</title>

<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 03</h1>
	<hr>
	<p>RadioSelect.jsp -> RadioSelectOk.jsp</p>
</div>

<div class="layout">
	<h2>radio, select 데이터 전송</h2>
	
	<form action="/WebApp05/RadioSelectOk.jsp" method="get">
	<!-- ** 보내는 값이 많을 때 get적합하지X, post 적합O ** -->
	<!-- ** 
		- 한글 전송시 -> 글씨 깨짐
		  ㄴ보내주는 파일과, 받는 파일을 모두 UTF-8로 해주었으나,
			서블릿(리퀘스트)에서 중간변형으로 인해 글씨가 깨짐
			
			request 객체에 대해 문자에 대한 인코딩 셋팅 필요
			ex) request.setCharacterEncoding("UTF-8"); -> RadioSelectOk.jsp에 작성됨	
	 ** -->
		<div class="input_box" style="display: inline-block;">
			<ul>
				<li>
					<span class="tit">이름</span><input type="text" name="name" class="txt">
				</li>
				<li>
					<span class="tit">성별</span>
					<label><input type="radio" name="gender" value="M">남자</label>
					<label><input type="radio" name="gender" value="F">여자</label>
				</li>
				<li>
					<span class="tit">전공</span>
					<select name="major">
						<option value="국문학">국문학</option>
						<option value="영문학">영문학</option>
						<option value="컴퓨터공학">컴퓨터공학</option>
						<option value="수학">수학</option>
						<option value="신문방송학">신문방송학</option>
						<option value="경영학">경영학</option>
					</select>
				</li>
				<li>
					<span class="tit">취미</span>
					<select name="hobby" size="7" multiple="multiple">
						<option value="영화감상">영화감상</option>
						<option value="음악감상">음악감상</option>
						<option value="공원산책">공원산책</option>
						<option value="배낭여행">배낭여행</option>
						<option value="스노클링">스노클링</option>
						<option value="암벽등반">암벽등반</option>
						<option value="종이접기">종이접기</option>
					</select>
				</li>
			</ul>
		</div>
		<div class="btn_box">
			<input type="submit" value="내용 전송" class="btn control">
		</div>
	</form>
</div>

</body>
</html>
```
#### 5.7.8.2. RadioSelectOk.jsp_radio, select 데이터 전송
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(RadioSelect.jsp)로 부터 데이터 수신
	// -> name
	
	// 한글 깨짐 방지 처리	
	request.setCharacterEncoding("UTF-8");				// check~!!!
	
	String nameStr = request.getParameter("name");			//-- 텍스트박스... 단일값 수신
	String genderStr = request.getParameter("gender");		//-- 라디오버튼... 단일값 수신
	String majorStr = request.getParameter("major");		//-- 선택상자... 단일값 수신
	//String hobbyStr = request.getParameter("hobby");
	String[] hobbyArr = request.getParameterValues("hobby");//-- 선택상자... 다중 데이터 수신
	//-- 다중 선택이 가능한 선택자일 경우...
	// 『getParameterValues()』로 데이터 수신
	// -> 배열 반환
	
	// name 수신 및 처리 -> 특이사항 없음
	
	// gender 수신 및 처리
	String gender = "";
	if(genderStr.equals("M"))
		gender = "남자";
	else if(genderStr.equals("F"))
		gender = "여자";
	else
		gender = "확인불가";
	
	// major 수신 및 처리 -> 특이사항 없음~!!!
	
	// hobby 수신 및 처리
	String hobby = "";
	if(hobbyArr != null)
	{
		for(String item : hobbyArr)
			hobby += "[" + item + "]";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelectOk.jsp</title>
</head>

<body class="section">

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 03</h1>
	<hr>
	<p>RadioSelect.jsp -> RadioSelectOk.jsp</p>
</div>

<div class="layout">
	<h2>radio, select 데이터 전송</h2>
	<ul>
		<li><span class="tit">이름: </span><%=nameStr %></li>
		<li><span class="tit">성별: </span><%=genderStr %>(<%=gender %>)</li>
		<li><span class="tit">전공: </span><%=majorStr %></li>
		<li><span class="tit">취미: </span><%=hobby %></li>
	</ul>
	
</div>
</body>
</html>
```
<br>

### 5.7.9. [checkbox 데이터 전송]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/882d217e-3801-40c1-b494-9703270fc9c8)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/04b548f3-bd7c-404d-9d18-f095fd032e4d)


#### 5.7.9.1. CheckBox.jsp_checkbox 데이터 전송
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp -> CheckBoxOk.jsp</p>
</div>

<div class="layout">
	<h2>checkbox, textarea 데이터 전송</h2>
	
	<form action="/WebApp05/CheckBoxOk.jsp" method="post">
		<div class="input_box" style="display: inline-block;">
			<ul>
				<li>
					<span class="tit">이름</span><input type="text" name="name" class="txt">
				</li>
				<li>
					<span class="tit">메모</span><textarea name="meno" rows="5" cols="30"></textarea>
				</li>
				<li style="display:flex;">
					<span class="tit">이상형</span>
					<div>
						<label><input type="checkbox" name="checkGruop" value="조휴일">조휴일</label>
						<label><input type="checkbox" name="checkGruop" value="유재석">유재석</label>
						<label><input type="checkbox" name="checkGruop" value="류진">류진</label>
						<label><input type="checkbox" name="checkGruop" value="정우성">정우성</label>
						<label><input type="checkbox" name="checkGruop" value="차은우">차은우</label>
						<br>
						
						<label><input type="checkbox" name="checkGruop" value="카리나">카리나</label>
						<label><input type="checkbox" name="checkGruop" value="서강준">서강준</label>
						<label><input type="checkbox" name="checkGruop" value="박은빈">박은빈</label>
						<label><input type="checkbox" name="checkGruop" value="고윤정">고윤정</label>
					</div>
				</li>
			</ul>
			<div class="btn_box"><input type="submit" value="전송하기" class="btn control"></div>
		</div>
	</form>
</div>

</body>
</html>

```
#### 5.7.9.2. CheckBoxOk.jsp_checkbox 데이터 전송
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(CheckBox.jsp)로부터 데이터 수신
	//-> name, memo, checkGroup
	
	// 한글 깨짐 방지 처리
	//**request.getParameter 다음에 하면 적용 안됨~!!!**
	request.setCharacterEncoding("UTF-8");

	// 이름 데이터 수신
	String name = request.getParameter("name");
	
	// 메모 데이터 수신			check~!!!
	//**textarea의 개행은 <**
	String memo = request.getParameter("meno");
	//memo = memo.replace("\n","<br>");
	memo.replaceAll("\n","<br>");
	// ** 정규표현식으로 구성된 문자도 replace 가능 **
	//-- JDK 1.5 이후부터 『replaceAll()』 메소드 사용 가능
	//	『replaceAll()』 을 통해 처리한 결과를 다시 memo 변수에 대입
	//	"안녕하세요\n반갑습니다.\n이윤수입니다."
	//	-> "안녕하세요<br>반갑습니다.<br>이윤수입니다."
	
	// 이상형 데이터 수신
	//String checkGroup = request.getParameter("checkGroup");		//(x)
	
	// ※ 같은 name 속성의 값을 가진 데이터 여러 개를 받는 경우(즉, 다중 데이터로 수신하는 경우)
	//	  이를 배열로 처리해야 한다. -> 『getParameterValues()』

	String[] checkGroup = request.getParameterValues("checkGruop");
	// ※ 배열 데이터를 수신하여 처리할 경우..
	//	수신된 데이터가 전혀 없는 경우
	// 배열의 값 자체가 null이 되어버리기 때문에
	// null 에 대한 확인(검사) 과정이 필요하다.		check~!!!
	
	String str = "";
	if(checkGroup != null)
	{
		for(String item: checkGroup)
				str += "["+ item + "]";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp -> CheckBoxOk.jsp</p>
</div>

<div class="layout">
	<h2>checkbox, textarea 데이터 전송</h2>

	<ul>
		<li><span class="tit">이름: </span><%=name %></li>
		<li><span class="tit">메모: </span><%=memo %></li>
		<li><span class="tit">이상형:</span><%=str %></li>
	</ul>
</div>

</body>
</html>
```

<br>

### 5.7.10. [JSP를 이용한 데이터 송수신 실습 05]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e7f49e2c-cbbe-42a5-bff4-d146fef87033)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/8d8f11e7-8abf-4e40-8beb-157ee46822f2)


#### 5.7.10.1. Table.jsp_JSP를 이용한 데이터 송수신 실습 05
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table.jsp</title>

<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp -> TableOk.jsp</p>
</div>

<div class="layout">
	
	<form action="/WebApp05/TableOk.jsp">
		<table style="max-width:500px;width:100%;">
			<tr>
				<th>가로</th>
				<td><input type="text" name="su1" class="txt"></td>
			</tr>
			<tr>
				<th>세로</th>
				<td><input type="text" name="su2" class="txt"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn control" style="width:280px;">결과 확인</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
```
#### 5.7.10.2. TableOk.jsp_ JSP를 이용한 데이터 송수신 실습 05
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	int num = 1;
	
	/*  [다른사람이 푼 방법] */
	String result = "";
	if((su1*su2)!=0){
		result += "<table>";
		for(int i=0; i<su2; i++)
		{
			result += "<tr>";
			for(int j=0; j<su1; j++)
			{
				result += "<td>" + (num++) + "</td>";
			}
			result += "</tr>";
		}
		result += "</table>";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TableOk.jsp</title>

<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp -> TableOk.jsp</p>
</div>

<div class="layout">

	<!-- [내가 푼 방법] -->
	<%-- <%
	if((su1*su2)!=0){
	%>
	<table>
		<%
		for(int i=0; i<su2; i++)
		{%>
			<tr>
			<%
			for(int j=0; j<su1; j++)
			{%>
				<td>
					<%=num++ %>
				</td>
			<%}%>
			</tr>
		<%
		}%>
	</table>
	<%
	} 
	%> --%>
	
	<!-- [다른사람이 푼 방법] -->
	<%=result %>
	
</body>
</html>
```

------------------------------------------------



### 5.7.. []

#### 5.7..1. .jsp
``` html
```
#### 5.7..2. .jsp
``` html
```



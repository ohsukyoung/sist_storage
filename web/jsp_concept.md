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

## 5.7. JSP 데이터 송수신 실습
``` html
ex) Aaa.html    -> Bbb.jsp
    Aaa.html    -> Bbb.java(Servlet)
    Aaa.jsp     -> Bbb.jsp
    Aaa.jsp     -> Bbb.java(Servlet)
```
- Aaa 페이지에서는 <form> 태그 및 action, method 속성 필요  
	<input> 이나 <button> 태그의 type="submit" 속성 필요  
- Bbb 페이지에서는 request 객체의 getParameter() 메소드나  
	getParameterValues() 메소드 필요  
### 5.7.1. request 내부 객체
request 내부 객체는 웹 브라우저에서 JSP(또는 Servlet) 페이지로 전달되는 정보의 모임으로 HTTP 헤더와 HTTP 바디로 구성되며  
, 웹 컨테이너는 요청된 HTTP 메세지를 통해 HttpServletRequest 객체 타입인 request 객체로 사용된다.  
즉, request 객체는 웹 브라우저가 JSP(또는 Servlet) 페이지로 보내진 내용에 대한 정보를 갖고 있는 내부 객체인 것이다.

### 5.7.2. String getParameter(name)
이름이 name인 파라미터에 할당된 값을 반환하며, 지정된 파라미터 값이 없으면 null을 반환한다.

### 5.7.3. String[] getparmaeterVlaues(name)
이름이 name인 파라미터의 모든 값을 String 배열로 반환한다. 주로 checkbox 등 동일한 이름을 사용하는 form 태그의 값을 반환받기 위해 사용한다.

### 5.7.4. void setCharacterEncoding(encode)
전송된 데이터의 문자 인코딩 방식을 지정한다.

<br>

## 5.8. GET 방식과 POST 방식(데이터 전송 및 페이지 요청 방식)
### 5.8.1. ○ GET 방식
``` html
ex) https://n.news.naver.com/article/661/0000034464?cds=news_media_pc&type=editn

        가. https://n.news.naver.com/article/661/0000034464 ?    -> 요청 페이지
        나. cds=news_media_pc & type=editn                       -> 전송 데이터
``` 
- GET 방식은 엽서를 보내는 방식과 유사한 전송 및 요청 방식
- 주소 + 데이터 (모두 노출)
- 전송할 데이터를 문자열 형태(Query String) 로 URL 뒤에 인수를 붙여서 전송을 수행하는 방법(방식)이다.
- URL 뒤에 인수로 붙어있는 내용을 누구나 볼 수 있고 이로인해 보안성이 취야하다고 할 수 있다.
- 또한, GET 방식은 보낼 수 있는 데이터 량에 한계가 있기 때문에(과거) 많은 데이터를 보내는 경우 
  일정 크기 이상에서는 잘림 현상이 발생한다.(길이 제한을 가진다는 의미이다. URL 최대 길이 2048char)
- 특히나 <form>태그에서의 GET 방식은 서버로 데이터를 전송하는 과정에서 서버 처리가 지연될 경우  
	중복해서 요청이 이루어지는 문제가 발생할 수 있다는 단점을 가지고 있다.
- 형식 및 구조
``` html
	『URL주소?속성=데이터&속성=데이터&...』
	『URL주소?name=value1&tel=value2&...』
```
- GET 방식은 select 적 성격(성향)을 가지고 있다.
서버에서 데이터를 가지고 와서 보여준다거나 하는 용도로 주로 사용한다.  
서버의 갑이나 상태를 바꾸는 용도로는 사용하지 않는다. 즉, 단순 페이지 요청에 많이 사용된다는 것이다.  
- GET 방식의 장점은 여러가지 형태를 통해 간편한 데이터 전송이 가능하다는 것이다.
POST 방식처럼 form 태그를 사용하여 전송도 하고, 링크에 직접 걸어 사용해도 되고, 주소창에 직접 입력해도 된다.  
``` html
	ex)
	<a href="http://url?키=값&키=값">
	<form action="http://url?키=값&키=값">
	window.open(href="http://url?키=값&키=값");
	window.location.href="http://url?키=값&키=값";
	window.location.replace("http://url?키=값&키=값");
```
### 5.8.2. ○ POST 방식
``` html
ex) http://localhost:3306/WebApp05/jsptest005.jsp
```

- 주소만 노출, 데이터는 숨김
- <form> 태그에서 method 속성을 "post"로 설정해서 요청
- 파일의 형태로 전송되기 때문에 URL 상에서는 내용이 나타나지 않는다. 이로 인해 GET 방식에 비해 보안성이 높다고 할 수 있다.
- POST 방식은 HTTP body 안에 숨겨져서 전송된다.
- GET 방식처럼 URL 뒷부분에 추가해서 보내는 것이 아니라 HTTP body 안에 넣어서 보내기 때문에 GET 방식에서 발생할 수 있는 보안성 문제를 어느정도 해결할 수 있다.
- GET 방식ㅇ 비해 대용량의 데이터를 전송할 때 사용한다.
- <form> 태그를 이용해서 submit 하는 일반적인 형태가 POST 방식이다.
- POST 방식은 서버의 값이나 상태를 바꾸기 위해 주로사 용한다. 글쓰기를 하게 되면 글의 내용이 데이터베이스에 저장되고  
수정을 하게 되면 데이터베이스에 수정된 값이 적용될 수 있도록 처리하는 구성인 것이다.

<br>

## 5.9. ■ 포워딩(Forwarding)과 리다이렉트(Redirect) ■
### 5.9.1. ○ 포워딩(Forwarding, 포워드)
``` html
/* ** 
mbc.co.kr -> -> -> imbc.kr
  imbc.kr -> -> -> imbc.kr
** */
``` 
요청을 포워딩 할 때 해당 요청은 서버의 다른 자원에 전달된다.  
이 때에는 다른 자원에 이 요청을 처리할 것을 클라이언트에게 알리지 않는다.  
이와 같은 방식의 처리는 웹 컨테이너 안에서만 일어나고 클라이언트는 알 수 없게 된다.  
포워딩은 리다이렉트와 다르게 객체를 요청에 담고 해당 요청을 사용할 다음 자원에 전송한다.  
따라서 클라이언트는 포워딩이 발생한 사실을 알지 못하는 것이다.  
포워딩은 클라이언트와 통신 없이 서버에서만 처리되기 때문에 리다이렉트보다 나은 성능을 갖는다고 할 수 있다.  

### 5.9.2. ○ 리다이렉트(Redirect, 리다이렉팅, 리디렉션)
``` html
/* ** 
문제상황 발생 -> 요청후 종결됨!
고객센터 문제상황 -> 우리부서가 아니고,, 다른부서로 전화..    
** */
``` 
클라이언트의 요청을 처리한 후 컨테이너는 『sendRedirect()』 메소드가 호출되면 브라우저에 응답을 보낸다.  
이 응답에는 브라우저가 웹 컨테이너의 응답을 받은 후 다시 요청을 보낼 새로운 URL이 포함되어 있다.  
여기에서 하나의 요청이 종결된다.            //check~!!!
새로 부여받은 URL로 브라우저가 완전히 새롭게 요청하기 때문에 이전의 요청 스코프에 저장되어 있던 객체는 새로운 요청이 이루어지기 전에 소멸된다.  
리다이렉트는 추가적으로 발생한 왕복 처리 때문에 포워딩보다 느리다고 할 수 있다.  

기억해야 할 것은...  
최종적으로 수행해야 하는 작업은 새로운 요청에 의한 것이고   
이것을 클라이언트가 알 고있기 때문에 브라우저 창의 주소가 처음 요청한 주소가 아니고 최종 주소값으로 변학 된다.  
또한, 하나의 요청에 담겨있던 객체들은 소멸되고 다음 작업까지 전달되지 않는다.  

※ 기본적으로 클라이언트의 입장에서 편한 것은 포워딩이지만 DB에서 작업이 이루어지고,   
다시 그에 대한 응바을 받은 클라이언트가 새로운 요청을 하게끔 만들어야 하는 경우에는 리다이렉트를 사용해야 한다.  

<br>

## 5.10. 코드
### 5.10.1. jsptest001.jsp_디렉티브 영역, 스크립 릿 영역
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
### 5.10.2. jsptest002.jsp_『out』 출력 스트림, 『out.println』-> 띄어쓰기,『\n』-> 띄어쓰기,『<br>』 -> 개행
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

### 5.10.3. jsptest003.jsp_『_jspInit()』 메소드, 『_jspDestroy()』 메소드, 『_jspService()』 메소드
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

### 5.10.4. jsptest004.java_서블릿 관련 실습
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

#### 5.10.4.1. web.xml
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

### 5.10.5. [HttpServlet 관련 실습]

#### 5.10.5.1. jsptest005.html_HttpServlet 관련 실습(HttpServlet 을 상속받는 클래스로 설계)
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

#### 5.10.5.2. Test005.java_요청받은 내용을 응답(출력스크림 구성)
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
#### 5.10.5.3. web.xml_ jsp와 java를 servlet을 통해 연결
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
#### 5.10.5.4. ResponseSample.html_HTML 코드 작성을 위한 샘플
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

### 5.10.6. [JSP를 이용한 데이터 송수신 실습 01]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/326337d8-a76b-4590-b108-168264be3244)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/bc8a3c57-7d1c-4844-87f3-bbe170470bba)

#### 5.10.6.1. Hap.jsp_JSP를 이용한 데이터 송수신 실습 01
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
#### 5.10.6.2. HapOk.jsp_JSP를 이용한 데이터 송수신 실습 01
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

### 5.10.7. [JSP를 이용한 데이터 송수신 실습 02]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/007b1ada-dadf-484b-887d-e83358bd545f)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/6fff8b6b-67b1-41f4-94ae-acd78b2b3b94)

#### 5.10.7.1. Gugudan.jsp_JSP를 이용한 데이터 송수신 실습 02
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
#### 5.10.7.2. GugudanOk.jsp_JSP를 이용한 데이터 송수신 실습 02
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

### 5.10.8. [radio, select 데이터 전송]
// 한글 깨짐 방지 처리
request.setCharacterEncoding("UTF-8"); // check~!!!
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/4e792111-3132-497d-a2d8-f5585244190b)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/3d2c33ad-ee4d-4a91-a5bf-e1f827eb2dc8)

#### 5.10.8.1. RadioSelect.jsp_radio, select 데이터 전송
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
#### 5.10.8.2. RadioSelectOk.jsp_radio, select 데이터 전송
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

### 5.10.9. [checkbox 데이터 전송]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/882d217e-3801-40c1-b494-9703270fc9c8)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/04b548f3-bd7c-404d-9d18-f095fd032e4d)


#### 5.10.9.1. CheckBox.jsp_checkbox 데이터 전송
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
#### 5.10.9.2. CheckBoxOk.jsp_checkbox 데이터 전송
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

### 5.10.10. [JSP를 이용한 데이터 송수신 실습 05]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e7f49e2c-cbbe-42a5-bff4-d146fef87033)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/8d8f11e7-8abf-4e40-8beb-157ee46822f2)


#### 5.10.10.1. Table.jsp_JSP를 이용한 데이터 송수신 실습 05
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
#### 5.10.10.2. TableOk.jsp_ JSP를 이용한 데이터 송수신 실습 05
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

### 5.10.11. [디렉티브/ WebApp06]

#### 5.10.11.1. Test001.jsp_page 디렉티브 buffer 속성 및 autoFlush 실습
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- **
	과거 리소스 소모 효율성이 중요했으나, 현재는 기술발달로 리소스 소모보다 시간이 중요해졌음
	- buffer: 출력내용만 담아지는 것은 아님.제어해야할 데이터를 **임시로 담아둘 기억공간**
	- autoFlush: 버퍼가 가득 차면 자동으로 보내줄지, 안보내줄지 ** -->

<%-- <%@ page buffer="8kb" autoFlush="true" %> 기본값--%>
<%-- <%@ page buffer="1kb" autoFlush="false" %> 일 경우 에럽 발생--%>
<%-- <%@ page buffer="1kb" autoFlush="true" %> 일 경우 정상 처리 --%>
<%@ page buffer="10kb" autoFlush="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
	<!-- **
	page 디렉티브는 건드릴 일이 거의 없지만, 출력을 제어하는 형태로 속성을 제어할 때가 있음
	** -->
</div>

<div class="layout">
	<h2>반복문 구성</h2>
	
	<%
	for (int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>
</div>

</body>
</html>
```
#### 5.10.11.2. Test002.jsp_include 디렉티브 실습
- 여러 JSP 페이지에서 공통적으로 포함하는 내용이 있을 때 이러한 내용을 매번 입력하지 않고 별도의 파일을 저장해 두었다가 JSP 파일에 삽입하도록 하는 것이 include 디렉티브 이다.
- include 지시어는 JSP에서 서블릿 코드를 생성할 때 텍스트나 코드를 JSP 파일 안으로 포함시키며 포함되는 파일의 내용은 include 지시어가 있는 위치에 삽입된다.
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>include 디렉티브 실습</h1>
	<hr>
	<p>여러 JSP 페이지에서 공통적으로 포함하는 내용이 있을 때
	이러한 내용을 매번 입력하지 않고 별도의 파일을 저장해 두었다가
	JSP 파일에 삽입하도록 하는 것이 include 디렉티브 이다.</p>
	<p>include 지시어는 JSP에서 서블릿 코드를 생성할 때
	텍스트나 코드를 JSP 파일 안으로 포함시키며
	포함되는 파일의 내용은 include 지시어가 있는 위치에 삽입된다.</p>
</div>


<div class="layout">
	<div>	
		<%@ include file="Test003.jsp"%>
	</div>
	<div>
		<h2><%=str %></h2>
		<h2><%=name %></h2>
	</div>
</div>
</body>
</html>
```
#### 5.10.11.3. Test003.jsp_include 디렉티브와 관련한 실습 진행중
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "include 디렉티브와 관련한 실습 진행중";
	String name="이름";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test003.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<p>Test002.jsp 와는 다른 독립적인 페이지</p>
	<p>include 테스트 중</p>
</div>

<div class="layout">

</div>
</body>
</html>
```

### 5.10.12. [이름과 성적 데이터를 입력받는 html 페이지]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/537c4fbd-8b1a-41e4-81c4-87a6226143f1)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/ac2992b1-470e-421b-a27a-240823cf174f)

#### 5.10.12.1. Sand01.html_데이터 송수신 실습 01
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sand02.html</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
 
</head>
<body class="section">
<!-- 
  ○ 데이터 송수신 실습 02
	- 이름과 성적 데이터를 입력받는 html 페이지를 구성한다.
		
		이름		[ textbox ] 	<- 박가영
		국어점수	[ textbox ] 	<- 90
		영어점수	[ textbox ] 	<- 80
		수학점수	[ textbox ] 	<- 70
		
		<전송> <취소>
	- 내용 입력 후 전송 버튼 클릭시
		『박가영님, 성적처리가 완료되었습니다.
		회원님의 점수는 국어:90점, 영어:80점, 수학: 70점 입니다.
		총점은 240점, 평균은 80.0 입니다.』
		라는 내뇽을 출력하는 JSP 페이지(Receive02.jsp)를 구성하여
		데이터를 전달할 수 있도록 한다.
		
	- 사용자 최초 요청 주소는
	http://localhost:3306/WepApp07/Send02.html로 한다.
	
 ○ Send02.html
  	Recive02.jsp
  	
  	(~11:15)
 -->
<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>
 
<div class="layout">
	<form action="Receive02.jsp" method="post">
		<ul>
			<li>
				<span class="tit">이름</span>
				<input type="text" name="userName">
			</li>
			<li>
				<span class="tit">국어점수</span>
				<input type="text" name="userKor">
			</li>
			<li>
				<span class="tit">영어점수</span>
				<input type="text" name="userEng">
			</li>
			<li>
				<span class="tit">수학점수</span>
				<input type="text" name="userMat">
			</li>
		</ul>
		<div class="btn_box">
			<button type="submit" class="btn">전송</button>
			<button type="reset" class="btn">취소</button>
		</div>
	</form>
</div>
 
</body>
</html>
```
#### 5.10.12.2. Receive01.jsp_데이터 송수신 실습 01
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
 
	// 이전 페이지(Send02.html)로 부터 넘어온 데이터 수신
	// -> userName, kor, eng, mat
	request.setCharacterEncoding("UTF-8");
 
	String name = request.getParameter("userName");
	/* 내가 푼 풀이 ======================================= */
	int[] scores = new int[3];
	scores[0] = Integer.parseInt(request.getParameter("userKor"));
	scores[1] = Integer.parseInt(request.getParameter("userEng"));
	scores[2] = Integer.parseInt(request.getParameter("userMat"));
	
	int tot = 0;
	
	for(int item : scores)
		tot += item;
	
	double avg = (double)(tot) / scores.length;
	// **소수점 이하 처리1) Math 함수 & 나누기(/)**
	//avg = Math.floor(avg * 10)/ 10.0;
	// **소수점 이하 처리2) format**
	String avgTxt = String.format("%.1f", avg);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	.info_box span{font-weight:bold;}
</style>
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>가입 확인</h2>
	<div class="info_box">
	『<span><%= name %></span>님, 성적처리가 완료되었습니다.<br>
		회원님의 점수는 국어:<span><%=scores[0] %></span>점
					, 영어:<span><%=scores[1] %></span>점
					, 수학: <span><%=scores[2] %></span>점 입니다.<br>
		총점은 <span><%=tot %></span>점, 평균은 <span><%=avgTxt %></span> 입니다.』
	</div>
</div>
 
</body>
</html>
```

### 5.10.13. [이름과 성적 데이터를 입력받는 html 페이지]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e359ec7e-21ff-4a9a-a2a4-d43153ab5daa)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/cd79a7e5-5226-4939-9204-037bb13c3fbd)

#### 5.10.13.1. Send02.html_데이터 송수신 실습 02
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sand02.html</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
 
</head>
<body class="section">
<!-- 
  ○ 데이터 송수신 실습 02
	- 이름과 성적 데이터를 입력받는 html 페이지를 구성한다.
		
		이름		[ textbox ] 	<- 박가영
		국어점수	[ textbox ] 	<- 90
		영어점수	[ textbox ] 	<- 80
		수학점수	[ textbox ] 	<- 70
		
		<전송> <취소>
	- 내용 입력 후 전송 버튼 클릭시
		『박가영님, 성적처리가 완료되었습니다.
		회원님의 점수는 국어:90점, 영어:80점, 수학: 70점 입니다.
		총점은 240점, 평균은 80.0 입니다.』
		라는 내뇽을 출력하는 JSP 페이지(Receive02.jsp)를 구성하여
		데이터를 전달할 수 있도록 한다.
		
	- 사용자 최초 요청 주소는
	http://localhost:3306/WepApp07/Send02.html로 한다.
	
 ○ Send02.html
  	Recive02.jsp
  	
  	(~11:15)
 -->
<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>
 
<div class="layout">
	<form action="Receive02.jsp" method="post">
		<ul>
			<li>
				<span class="tit">이름</span>
				<input type="text" name="userName">
			</li>
			<li>
				<span class="tit">국어점수</span>
				<input type="text" name="userKor">
			</li>
			<li>
				<span class="tit">영어점수</span>
				<input type="text" name="userEng">
			</li>
			<li>
				<span class="tit">수학점수</span>
				<input type="text" name="userMat">
			</li>
		</ul>
		<div class="btn_box">
			<button type="submit" class="btn">전송</button>
			<button type="reset" class="btn">취소</button>
		</div>
	</form>
</div>
 
</body>
</html>
```
#### 5.10.13.2. Receive02.jsp _데이터 송수신 실습 02
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 
	String name = request.getParameter("userName");
	int[] scores = new int[3];
	scores[0] = Integer.parseInt(request.getParameter("userKor"));
	scores[1] = Integer.parseInt(request.getParameter("userEng"));
	scores[2] = Integer.parseInt(request.getParameter("userMat"));
	
	int tot = 0;
	
	for(int item : scores)
		tot += item;
	
	double avg = (double)(tot) / scores.length;
	avg = Math.floor(avg * 10)/ 10.0;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
 
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>가입 확인</h2>
	<div class="info_box">
	『<span><%= name %></span>님, 성적처리가 완료되었습니다.<br>
		회원님의 점수는 국어:<span><%=scores[0] %></span>점
					, 영어:<span><%=scores[1] %></span>점
					, 수학: <span><%=scores[2] %></span>점 입니다.<br>
		총점은 <span><%=tot %></span>점, 평균은 <span><%=avg %></span> 입니다.』
	</div>
</div>
 
</body>
</html>
```


### 5.10.14. [두 개의 정수와 연산자를 입력받는 html 페이지]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/d1dde9a2-1852-4237-990c-ae3a318a8900)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/28819f73-0c88-447a-8943-13108a239126)

#### 5.10.14.1. Send03.html_데이터 송수신 실습 03
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send03.html</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<!-- 
	○ 데이터 송수신 실습 03
	- 두 개의 정수와 연산자를 입력받는 html 페이지를 구성한다.
	
							select
		정수1 [ textbox ] [ 더하기 ▼ ] 정수2 [ textbox ]
				  ↑		 빼기				  ↑
				  45 		곱하기				  32
				  			나누기
				  			
		< 결과 확인 >  < 취소 > -> button
		
	- 데이터 입력 및 선택 후 결과 확인 버튼 클릭 시
		『입력하신 45와(과) 32의 연산 결과는 77 입니다.』
		라는 내용을 출력하는 JSP 페이지(Receive03.jsp)를 구성하여
		데이터를 전달할 수 있도록 한다.
	
	- 사용자의 최초 요청 주소는
		http://localhost:3306/WebApp07/Send03.html 로 한다.
		
	○ Send03.html
	   Receive03.jsp
	   
	   (~12:25)
 -->
<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>
 
<div class="layout">
	<form action="Receive03.jsp" method="post">
	<!-- **get에서 넘겨주는 데이터가 특수문자 인 경우 링크상에 문제가 있을 수 있으므로
		, post형식을 취하거나 특수문자로 문제가 생기는지(링크 등) 확인할것** -->
		<div class="inpub_box">
			정수1 <input type="text" name="num1" style="width:60px">
			<select name="operation">
				<option value="+">더하기</option>
				<option value="-">빼기</option>
				<option value="*">곱하기</option>
				<option value="/">나누기</option>
			</select>
			정수2 <input type="text" name="num2" style="width:60px">
		</div>
		<div class="btn_box">
			<button type="submit" class="btn">전송</button>
			<button type="reset" class="btn">취소</button>
		</div>
	</form>
</div>
</body>
</html>
```
#### 5.10.14.2. Receive03.jsp _데이터 송수신 실습 03
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Send03.html)로 부터 넘어온 데이터 수신
	// -> num1, num2, op
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("operation");
 
	String result = "";
	
	int num1 = 0;
	int num2 = 0;
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		switch(op)
		{
			case ("+"): result=String.valueOf(num1 + num2); break;
			case ("-"): result=String.valueOf(num1 - num2); break;
			case ("*"): result=String.valueOf(num1 * num2); break;
			case ("/"): result=String.format("%.1f", num1 / (double)num2); break;
		}
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
<title>Receive03.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	.info_box span{font-weight: bold;}
</style>
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>
 
<div class="layout">
	<div class="info_box">
		<!-- 『입력하신 <span>45</span>와(과) <span>32</span>의 연산 결과는 <span>77</span> 입니다.』 -->
		『입력하신 <span><%=num1 %></span>와(과) <span><%=num2 %></span>의 
		연산(<span><%=op %></span>) 결과는 <span><%=result %></span> 입니다.』
		 
	</div>
</div>
</body>
</html>
```


### 5.10.15. [회원 가입과 관련한 기본 정보를 입력받는 html 페이지]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/50eaca82-4aec-4aca-b942-e03d5daf313c)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/58112152-afad-4385-bce8-e12409ccf919)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/cb923124-d24f-470d-8f90-f34ac183f3ef)

#### 5.10.15.1. Send04.html_데이터 송수신 실습 04
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send04.html</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	/* 메세지 */
	ul.input_box > li{display:flex;}
	.input_area{display:flex;flex-direction: column;}
	.msg{display:none;padding-top: 4px;color: blue;}
</style>
 
</head>
<body class="section">
<!-- 
	○ 데이터 송수신 실습 04
		- 회원 가입과 관련한 기본 정보를 입력받는 html 페이지를 작성한다.
		
		- 입력된 데이터를 서버로 전송하기 전에
		(즉, 클라이언트 측에서 작성한 내용을 서버에 제출하기 전에)
		입력 데이터에 대한 기본적인 검사 과정을
		자바스크립트를 활용하여 추가할 수 있도록 한다.
		
		아이디(*)	[ textbox ] 
		패스워드(*) [ textbox ] 
		이름(*)		[ textbox ] 
		전화번호(*)	[ textbox ] 
		
		성별		●여자 ○남자
		
		지역 [ 서울 ▼ ] 
				대전
				광주
				대구
		
		수강과목 □자바기초 □오라클중급 □JDBC심화 □JSP활용
		
		< 회원 가입 >  < 취소 >
		
		- 필수 입력 항목(*)을 포함한 입력 내용을 구성한 후
			회원 가입 버튼 클릭 시
			회원 입력 정보들의 내용을 출력하는 JSP 페이지(Receive04.jsp)를 구성하여
			데이터를 전달할 수 있도록 한다.
			
		- 사용자의 최초 요청 주소는
			http://localhost:3306/WebApp07/Send04.html 로 한다.
			
	○ Send04.html
		Receive04.jsp
 -->
<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>
 
<div class="layout">	
	<!-- [함께 푼 방법] ======================= -->
	<!-- *****①,②***** -->
	<!-- <form action="Receive04.jsp" method="post" name="memeberForm"> -->
	
	<!-- *****③***** -->
	<!-- <form action="Receive04.jsp" method="post" id="memeberForm"> -->
	
	<!-- *****④***** -->
	<!-- ※ form 태그의 『onsubmit』: submit 액션이 발생할 경우
			이 때 호출되는 자바스크립트 함수에서
			return true; 할 경우... Receive04.jsp 로 제어권이 넘어가게 되며
			return false; 할 경우... Receive04.jsp 로 제어권이 넘어가지 않는다.	 -->
			
	<!-- <form action="Receive04.jsp" method="post" onsubmit="return true;"> -->
	<!-- <form action="Receive04.jsp" method="post" onsubmit="return false;"> -->
	<!-- <form action="Receive04.jsp" method="post" onsubmit="functionTest()"> -->
	<!-- <form action="Receive04.jsp" method="post" onsubmit="return functionTest();"> -->
	<form action="Receive04.jsp" method="post" onsubmit="return formCheck();">
		<ul class="input_box" style="display:inline-block;">
			<li style="color: blue;">
				<span>-&nbsp;『*』: 필수값</span>
			</li>
			<li>
				<span class="tit">아이디(*)</span>
				<div class="input_area">
					<input type="text" name="userId" id="userId">
					<span class="msg" id="idMsg">아이디를 입력하세요.</span>
				</div>
			</li>
			<li>
				<span class="tit">패스워드(*)</span>
				<div class="input_area">
					<input type="password" name="userPwd" id="userPwd">
					<span class="msg" id="pwdMsg">패스워드를 입력하세요.</span>
				</div>
			</li>
			<li>
				<span class="tit">이름(*)</span>
				<div class="input_area">
					<input type="text" name="userName" id="userName">
					<span class="msg" id="nameMsg">이름을 입력하세요.</span>
				</div>
			</li>
			<li>
				<span class="tit">전화번호(*)</span>
				<div class="input_area">
					<input type="text" name="userTel" id="userTel">
					<span class="msg" id="telMsg">전화번호를 입력하세요.</span>
				</div>
			</li>
			<li>
				<span class="tit">성별</span>
				<label><input type="radio" name="userGender" value="F" checked>여자</label>
				<label><input type="radio" name="userGender" value="M">남자</label>
			</li>
			<li>
				<span class="tit">지역</span>
				<select name="userCity">
					<option value="">===선택===</option>
					<option value="서울">서울</option>
					<option value="대전">대전</option>
					<option value="광주">광주</option>
					<option value="대구">대구</option>
				</select>
			</li>
			<li>
				<span class="tit">수강과목</span>
				<label><input type="checkbox" name="userSubject" value="자바기초" id="check1">자바기초</label>
				<label><input type="checkbox" name="userSubject" value="오라클중급" id="check2">오라클중급</label>
				<label><input type="checkbox" name="userSubject" value="JDBC심화" id="check3">JDBC심화</label>
				<label><input type="checkbox" name="userSubject" value="JSP활용" id="check4">JSP활용</label>
			</li>
		</ul>
		<div class="btn_box">
			<!-- [내가 푼 방법] ======================= -->
			<!-- *****①,②***** -->
			<!-- <button type="button" class="btn control" onclick="functionTest()">회원 가입</button> -->
			<!-- *****③***** -->
			<!-- <button type="button" class="btn control" onclick="functionTest()">회원 가입</button> -->
			<!-- *****④***** -->
			<button type="submit" class="btn control">회원 가입</button> <!-- **button type 미지정시 submit** -->
			<!-- **onclick -> click이라는 이벤트가 발생 했을 때..** -->
			
			<!-- [함께 푼 방법] ======================= -->
			<button type="reset" class="btn control">취소</button>
		</div>
	</form>
</div>
 
<script type="text/javascript">
/* [내가 푼 방법] ======================= */
/* function strCheck()
{
	var userId = document.getElementById("userId").value;
	var userPwd = document.getElementById("userPwd").value;
	var userName = document.getElementById("userName").value;
	var userId = document.getElementById("userTel").value;
	
	if(userId == "" || userPwd=="" || userName=="" || userId==""){
		alert("필수 값을 입력해주세요.");
		return 	false;
	}else
		return true;
	
} */
 
/* [함께 푼 방법] ======================= */
function functionTest()
{
	//확인
	alert("함수 호출~!!!")
	
	var userId = document.getElementById("userId").value;
	
	// submit 방법 ①
	//document.forms[0].submit();
	// submit 방법 ②
	//memeberForm.submit();
	// submit 방법 ③
	//document.getElementById("memeberForm").submit();
	
	//return true;
	return false;
}
 
function formCheck()
{
	//return false;	//-- 현재 페이지에 그대로 남아있음
	//return true;	//-- 요청 페이지로 제어권 이전
	
	// 문서의 내용 점검 -> 통과(적합) -> return true;
	// -> submit 액션 처리로 제어권 넘김
	// 문서의 내용 점검 -> 반려(부적합) -> return false;
	// -> submit 액션 처리로 제어권을 넘기지 않고 현재 페이지에 분류
	
	// 점검사항 체크...
	// -> 문제 발생(발견) 					-> return false;
	// -> 문제 발생하지 않음(발견되지 않음)	-> return true;
	
	var userId = document.getElementById("userId");
	var userPwd = document.getElementById("userPwd");
	var userName = document.getElementById("userName");
	var userTel = document.getElementById("userTel");
	
	var idMsg = document.getElementById("idMsg");
	var pwdMsg = document.getElementById("pwdMsg");
	var nameMsg = document.getElementById("nameMsg");
	var telMsg = document.getElementById("telMsg");
	
	// form 내부의 컨트롤에 대한 값을 변경하고 이 함수를 다시 호출할 때 마다
	// 기존 안내되었던 ㅇ러 메세지를 지우고 다시 확인할 수 있도록 처리
	idMsg.style.display = "none";
	pwdMsg.style.display = "none";
	nameMsg.style.display = "none";
	telMsg.style.display = "none";
	
	// submit 방법 ④
	if(userId.value == "")		//-- 아이디가 입력되지 않은 상황
	{
		alert("아이디가 입력되지 않은 상황");
		idMsg.style.display = "inline";
		userId.focus();
		return 	false;
	}
	
	if(userPwd.value == "")		//-- 패스워드가 입력되지 않은 상황
	{
		alert("패스워드가 입력되지 않은 상황");
		pwdMsg.style.display = "inline";
		userPwd.focus();
		return 	false;
	}
	
	if(userName.value == "")	//-- 이름이 입력되지 않은 상황
	{
		alert("이름이 입력되지 않은 상황");
		nameMsg.style.display = "inline";
		userName.focus();
		return 	false;
	}
	
	if(userTel.value == "")		//-- 전화번호가 입력되지 않은 상황
	{
		alert("전화번호가 입력되지 않은 상황");
		telMsg.style.display = "inline";
		userTel.focus();
		return 	false;
	}
	
	return true;
}
 
</script>
</body>
</html>
```
#### 5.10.15.2. Receive04.jsp_데이터 송수신 실습 04
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스트립릿 영역
	
	// 이전 페이지(Send04.html)로 부터 넘어온 데이터 수신
	//-> userId, userPw, userName, userTel, userGender, userCity, userSubject
	
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userCity = request.getParameter("userCity");
	
	//String userSubject = request.getParameter("userSubject");
	
	//check~!!!
	String[] userSubjectArr = request.getParameterValues("userSubject");
	
	String genderStr = "";
	if(userGender.equals("F"))
		genderStr="여성";
	else if(userGender.equals("M"))
		genderStr="남성";
	else
		genderStr="";
	
	String userSubjectStr = "";
	if(userSubjectArr != null)
	{
		for(String item :userSubjectArr)
			userSubjectStr+="[" + item + "] ";
	};
	
	// ※ 추후에는 수신된 데이터를... 
	//		쿼리문을 통해 DB에 입력하는 처리 과정 등이 포함될 것임을 염두하며 작업 진행
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	.info_box span{font-weight: bold;}
</style>
</head>
<body class="section">
<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>가입 승인 내역</h2>
	<div class="info_box">
		<ul>
			<li><span class="tit">아이디(*): </span><%=userId %></li>
			<li><span class="tit">패스워드(*): </span><%=userPwd %></li>
			<li><span class="tit">이름(*): </span><%=userName %></li>
			<li><span class="tit">전화번호(*): </span><%=userTel %></li>
			<li><span class="tit">성별: </span><%=genderStr %></li>
			<li><span class="tit">지역: </span><%=userCity %></li>
			<li><span class="tit">수강과목: </span><%=userSubjectStr %></li>
		</ul>
	</div>
</div>
</body>
</html>
```


### 5.10.16. [구구단 결과를 출력하는 JSP(Receive05.jsp)]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/8bf07065-0bc3-4bc2-9446-60d45ad95b52)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/55123adf-6384-4592-83d5-7f5b1ec15719)

#### 5.10.16.1. Send05.html_데이터 송수신 실습 05
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send05.html</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<!-- 
	○ 데이터 송수신 실습 05
		- 구구단 결과를 출력하는 JSP(Receive05.jsp)를 구성한다.
		- 원하는 단수를 입력받아 화면에 출력해주는 형태의 페이지로 구현한다.
		- 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		
					selectbox
		단 수 선택 [ -- 선택 -- ▼ ]
						 1단
						 2단
						 3단
						  :
						 9단
					 
		- select 선택 시
			해당 단의 구구단 내용을 출력하는 JSP 페이지(Receive05.jsp)로 데이터를 전달하여 내요을 구성할 수 있도록 한다.
			
		- 사용자 최초 요청 페이지 주소는
			http://localhost:3306/WebApp07/Send05.html 로 한다.
			
	○ Send05.html
		Receive05.jsp 
 -->
<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>
 
<div class="layout">
	<form action="Receive05.jsp" method="post" name="danForm">
		<div>
			<span class="tit">단 수 선택</span>
			<!-- [내가 푼 풀이]: onclick 사용 ========================= -->
			<!-- <select name="danNum" id="danNum" onclick="danResult()" > -->
			
			<!-- [함께 푼 풀이]: onclick 사용 ========================= -->
			<select name="dan" id="dan" onchange="formChange(this.form)" >
				<option value="">==선택==</option>
				<option value="1">1단</option>
				<option value="2">2단</option>
				<option value="3">3단</option>
				<option value="4">4단</option>
				<option value="5">5단</option>
				<option value="6">6단</option>
				<option value="7">7단</option>
				<option value="8">8단</option>
				<option value="9">9단</option>
			</select>
		</div>
		<!-- <button type="submit">전송</button> -->
	</form>
</div>
<script type="text/javascript">
/* [내가 푼 풀이]: onclick 사용 ========================= */
var danOrigin = 0;
 
function danResult()
{
	var danNum = document.getElementById("dan").value;
	
	if(danNum!="" && (danOrigin != danNum))
	{
		danForm.submit();
		danOrigin = danNum;
	}
}
/* [함께 푼 풀이]: onclick 사용 ========================= */
function formChange(obj)
{
	//확인
	alert(obj);
	//--==>> [object HTMLFormElement]
	
	//※ obj 변수(이 함수의 매개변수)에는 form 객체가 저장되어 있다.
	//	필요에 따라 전송하기 전에 검증 절차를 추가하는 것이 가능하다.
	
	obj.submit();
	//-- 『폼객체.submit()』
	//	함수 호출을 통해 form 객체의 데이터를 서버로 전송하는 것이 가능하다.
}
</script>
 
</body>
</html>
```
#### 5.10.16.2. Receive05.jsp_ 데이터 송수신 실습 05
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(Send05.html)로 부터 넘어온 데이터 수신
	// -> dan
 
	String danStr = request.getParameter("dan");
	
	int dan = 0;
	String result ="";
			
	try
	{
		dan = Integer.parseInt(danStr);
		
		
		for(int i=1; i<= 9; i++)
		{
			result += String.format("%d * %d = %d <br>", dan, i, dan*i);
		}
		
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
<title>Receive05.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>구구단 출력</h2>
	<div class="info_box">
		<%=result %>
		 
	</div>
</div>
</body>
</html>
```


### 5.10.17. [이전 페이지(SendAndReceive06.jsp -> 자기자신)로부터 넘어온 데이터 수신]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/3939aa38-80c5-474a-9d7e-0363ee7afb0d)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/292e7bb3-7839-4ee2-951a-edec2955f02f)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/5b7feaf6-d22c-46a8-b96f-6d498e95b710)

#### 5.10.17.1. SendAndReceive06.jsp_데이터 송수신 실습 06
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(SendAndReceive06.jsp -> 자기자신)로부터 넘어온 데이터 수신
	// -> userInput
	
	request.setCharacterEncoding("UTF-8");
	
	String temp = "";
	temp = request.getParameter("userInput");
	
	if(temp == null)
		temp = "없음";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 06</h1>
	<hr>
</div>
 
<div class="layout">
 
	<!-- <form action="Test9999.jsp" method="post"> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
	</form> -->
 
	<!-- [post 버전] ================================================ -->
	<!-- **form의 action 속성값 없음
		 -> 요청하는 주소 자기자신, 내가 전달하는 데이터도 자기자신에게 보내는 것
	** -->
	
	<!-- <form action="" method="post"> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
	</form> -->
	
	<!-- [get 버전] ================================================ -->
	<!-- <form action="" method="get"> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
	</form> -->
	
	<!-- [action="" 없는 버전] ================================================ -->
	<!-- <form method="get"> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
	</form> -->
	
	<!-- [action="",  method="" 없는 버전] ================================================ -->
	<form> 
		<div class="input_box">
			<span class="tit">입력</span>
			<input type="text" id="userInput" name="userInput" class="txt">
		</div>
		
		<div class="btn_box">
			<button type="submit" class="btn control">테스트</button>
			<button type="reset" class="btn control">취소</button>
		</div>
		
	</form>
	<!-- check~!!! -->
	<!-- ※ form 의 action 속성을 『action=""』와 같이 구성하거나
			action 속성을 생략하여 『<form method="post"』와 같이 구성하게 되면
			페이지 요청 및 데이터 전송에 대한 수신처 페이지는 자기 자신이 된다.
	
	 -->
</div>
 
<div>
	<h2>수신된 데이터 확인</h2>
	<h3> -> <%=temp %></h3>
</div>
 
</body>
</html>
```

### 5.10.18. SendAndReceive07_1.html_데이터 송수신 실습 07_달력을 출력하는 JSP 페이지
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/c48a18f7-e5e1-47dc-8777-be65e64c6285)

``` html
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 자기 자신 페이지(SendAndReceive07.jsp)로 부터 넘어온 데이터 수신
	// -> year, month
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
 
	// Calendar 객체 생성
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2023
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- 12
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 11
	
	// 표시할 달력의 년, 월 구성 -> 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우
	// Line 6~7 을 통해 수신한 데이터로 표시할 달력의 년,월 구성
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 테스트
	//out.print("<h1>selectYear: " + selectYear + "</h1>");
	//out.print("<h1>selectMonth: " + selectMonth + "</h1>");
	
	// 확인한 날짜로 년도 select option 구성
	// <option value="2013">2013</option>
	//						 :
	// <option value="2023" selected="selected">2023</option>
	// <option value="2033">2033</option>
	
	String yOptions = "";
	for(int year=(selectYear-10); year<=(selectYear+10); year++)	// 2012 ~2033
	{
		// 관찰1
		// "<option value="+2013+">"+2013+"</option>"
		// "<option value=2013>2013</option>"
		//yOptions += "<option value='"+year+"'>"+year+"</option>";
		
		// 관찰2
		//if(year==nowYear)
		//	yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		//else
		//	yOptions += "<option value='"+year+"'>"+year+"</option>";
		
		// 상황1. 페이지 최초 요청일 때		-> sYear는 null		/ 현재 년도와 옵션이 같을 때 -> selected(O)
		// 상황2. 페이지 최초 요청이 아닐 때-> sYear는 null 아님/ 선택 년도와 옵션이 같을 때 -> selected(O)
		// 상황3. 나머지
		// **오늘 날짜,오늘 년월을 표시할 수 있도록 구성**
		if (sYear==null && year==nowYear)
			yOptions +="<option value='" + year +"' selected='selected'>"+ year + "</option>";
		else if (sYear!=null && year==Integer.parseInt(sYear))
			yOptions +="<option value='" + year +"' selected='selected'>"+ year + "</option>";
		else
			yOptions += "<option value='"+year+"'>"+year+"</option>";
		
	}
	
	// --------------------------------------------------------------------------------
	
	// 확인한 날짜로 월 select option 구성
	//<option vlaue="1">1</option>
	//				  :
	//<option vlaue="12" selected="selected">12</option>
	
	String mOptions="";
	for(int month=1; month<=12; month++)
	{
		// 관찰1
		//mOptions += "<option vlaue='" + month + "'>" + month + "</option>";
		
		// 관찰2
		//if(month==nowMonth)
		//	mOptions += "<option vlaue='" + month + "' selected='selected'>" + month + "</option>";
		//else
		//	mOptions += "<option vlaue='" + month + "'>" + month + "</option>";
		
		// 상황1. 페이지 최초 요청일 때	   -> sMonth는 null		/ 현재 월과 옵션이 같을 때 -> selected(O)
		// 상황2. 페이지 최초 요청 아닐 때 -> sMonth는 null 아님/ 현재 월과 옵션이 같을 때 -> selected(O)
		// 상황3. 나머지
		
		if(sMonth==null && month==nowMonth)
			mOptions += "<option vlaue='" + month + "' selected='selected'>" + month + "</option>";
		else if (sMonth!=null && month==Integer.parseInt(sMonth))
			mOptions += "<option vlaue='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option vlaue='" + month + "'>" + month + "</option>";
	}
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요
	// (만년 달력)
	//	각자~!!!
	
	// --------------------------------------------------------------------------------
	
	String calendar = "";
	
	// 0단계. 윤년
	// 각 달의 마지막 날짜 배열 구성
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	//			   1   2   3   4   5   6   7   8   9  10  11  12
	
	// 윤년인지 평년인지 확인
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%1400==0)
		months[1] = 29;
	
	int nalsu=0;
	
	// 1단계. 현재 년도 -> 입력받은 년도 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 2단계. 현재 월 -> 입력받은 월의 이전 월까지 날 수 추가
	//int day=0;
	for(int i=0; i<(selectMonth-1); i++)
	{
		nalsu +=months[i];
	}
	
	nalsu ++;	// + 1
	
	// 3단계. 해당 년-해당 월의 첫날 요일 구하기
	String[] weekNames = {"일","월","화","수","목","금","토"};
	int week = nalsu%7;
	
	//System.out.println(week);
	
	// 4단계. 해당 년-해당 월 마지막 날짜 구하기
	int lastDay = months[selectMonth-1];
	
	// 달력 그리기 --------------------------------------------------------------------------------
 
	// 5단계. 해당 년-해당 월 기준 달력구성(출력, 그리기)
	String calStr = "";
	//calStr = "<table border='1'>";
	calStr = "<table>";
	
	// 요일 이름 발생
	calStr += "<tr>";
	for(int i=0; i<weekNames.length; i++)
	{
		if(i==0)	 // -- 일요일
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)//-- 토요일
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else		//-- 평일
			calStr += "<th>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	for(int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
		
	}
	
	// 날짜 td 발생
	for(int i=1; i<=lastDay; i++)
	{
		week++;		//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다)
					//-- 요일도 함께 1씩 증가할 수 있도록 처리
					
		//calStr += "<td>"+ i +"</td>";
		
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)	// 토요일인 오늘
			calStr += "<td class='nowSat'>"+ i +"</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)	// 일요일인 오늘
			calStr += "<td class='nowSun'>"+ i +"</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)	// 평일인 오늘
			calStr += "<td class='now'>"+ i +"</td>";
		else if(week%7==0)	// 오늘이 아닌 토요일
			calStr += "<td class='sat'>"+ i +"</td>";
		else if(week%7==1)	// 오늘이 아닌 일요일
			calStr += "<td class='sun'>"+ i +"</td>";
		else	// 오늘이 아닌 평일
			calStr += "<td>"+ i +"</td>";
			
		if(week%7==0)
			calStr += "</tr><tr>";	
			
				
	}
	
	// 빈 칸 공백 td 발생
	for(int i=0; i<=week; i++,week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}
	
	if(week%7!=0)
		calStr += "</tr>";
	
	
	
	calStr += "</table>";				//-- end table
 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	td{text-align: right;}
	td.sun {color: red;}
	td.sat {color: blue;}
	td.now {background-color: #aef7f7; font-weight:bold;} /* 평일인 오늘 */
	td.nowSat {background-color: #aef7f7; font-weight: bold; color: blue;} /* 토요일인 오늘 */
	td.nowSat {background-color: #aef7f7; font-weight: bold; color: red;} /* 일요일인 오늘 */
</style>
 
</head>
<body class="section">
<%-- <%=nowYear %>
<%=nowMonth %>
<%=nowDay %> --%>
<!-- 
	○ 데이터 송수신 실습07
	
		- 달력을 출력하는 JSP 페이지를 구성한다.
		- 페이지 레이아웃은 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
		- 단, submit 버튼 없이 이벤트 처리할 수 있도록 한다.
		- 전송한 내용을 스스로 수신해서 출력해주는 형태의 페이지로 구성한다.
		- 연도 선택 기본 구성은 현재 연도를 기준으로 이전 10년, 이후 10년 으로 구성한다.
		(기본적으로 만년 달력 형태로 구성하는데 현재의 연, 월은 달력 객체로부터 확인할 수 있도록 한다.)
		- 월 선택 기본 구성은 1월 부터 12월 까지로 구성한다.
		
		  2013
			:
		[ 2023 ▼ ] 년 [ 12 ▼ ] 월	-> 현재 년도, 현재 월
			:
		  2033
		  
		 ----------------------------
		 ----------------------------
		 ----------------------------
		 ----------------------------
		 
		- 연도 select 나 월 select 의 내용이 변화되면 해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		- 사용자 최초 요청 주소는
		http://localhost:3306/WebApp07/SendAndReceive07.jsp
		
	○ SendAndReceive07.jsp
	
 -->
 
<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>
 
<div class="layout">
	<div class="input_box" style="display: inline-block;">
		<form action="" method="get">
		<!-- <form action="" method="post"> -->
			<select id="year" name="year" onchange="formCalendar(this.form)">
				<!-- <option value="2013">2013</option>
				<option value="2014">2014</option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023" selected="selected">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
				<option value="2027">2027</option>
				<option value="2028">2028</option>
				<option value="2029">2029</option>
				<option value="2030">2030</option>
				<option value="2031">2031</option>
				<option value="2032">2032</option>
				<option value="2033">2033</option> -->
				<%=yOptions %>
			</select> 년
			
			<select id="month" name="month" onchange="formCalendar(this.form)">
				<!-- <option vlaue="1">1</option>
				<option vlaue="2">2</option>
				<option vlaue="3">3</option>
				<option vlaue="4">4</option>
				<option vlaue="5">5</option>
				<option vlaue="6">6</option>
				<option vlaue="7">7</option>
				<option vlaue="8">8</option>
				<option vlaue="9">9</option>
				<option vlaue="10">10</option>
				<option vlaue="11">11</option>
				<option vlaue="12" selected="selected">12</option> -->
				<%=mOptions %>
			</select> 월
		</form>
	</div>
	
	<div class="result_box">
		<!-- 달력을 그리게 될 지점 -->
		<%=calStr %>
	</div>
	
</div>
 
<script type="text/javascript">
function formCalendar(obj)
{
	// 유효성 검사가 필요한 경우 삽입할 수 있는 영역~!!!
	
	// ...
	
	obj.submit();
}
</script>
 
</body>
</html>
```

### 5.10.19. SendAndReceive08.jsp_데이터 송수신 실습 08_달력을 출력하는 JSP 페이지
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/5d37885b-3129-458b-b159-773f37bdcdda)

``` html
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
 
	// Calender 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 오늘 날짜 가져오기
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	//int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 이전 페이지(SendAndReceive08)로 부터 넘어온 데이터 수신
	// -> year, month
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	
	// 표시할 달력의 년, 월
	
	int year = nowYear;
	int month = nowMonth;
	
	if(strYear != null)
		year = Integer.parseInt(strYear);
	if(strMonth != null)
		month = Integer.parseInt(strMonth);
	
	// 이전과 이후 구성
	int preYear = year;
	int preMonth = month-1;
	
	if(preMonth < 1)
	{
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year;
	int nextMonth = month+1;
	
	if(nextMonth > 12)
	{
		nextYear = year+1;
		nextMonth = 1;
	}
	
	
	// ---------------------------- calender
	String calendar = "";
	
	// 0단계. 윤년
	// 각 달의 마지막 날짜 배열 구성
	int[] days = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	//			   1   2   3   4   5   6   7   8   9  10  11  12
	
	// 윤년인지 평년인지 확인
	if(year%4==0 && year%100!=0 || year%1400==0)
		days[1] = 29;
	
	//System.out.println(lastDays[1]);
	
	// 1단계. 총 날짜수
	int total=0;
	total = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	//total = (nowYear-1)*365 + ((nowYear-1)/4) - ((nowYear-1)/100) + ((nowYear-1)/400);
	
	// 2단계. 해당 년-1월-1일 ~ 해당 월-1일 까지 총 날짜수 구해서 1 더하기
	//int day=0;
	for(int i=0; i<(month-1); i++)
	{
		total +=days[i];
	}
	total +=1;
	
	// 3단계. 해당 년-해당 월의 첫날 요일 구하기
	String[] weeks = {"일","월","화","수","목","금","토","일"};
	int weekIdx = total%7;
	//System.out.println(nowYear+"년"+nowMonth+"월"+":"+weeks[weekIdx]);
	
	// 4단계. 해당 년-해당 월 마지막 날짜 구하기
	int lastDay = days[12-1];
	//System.out.println(nowMonth);
	
	// 5단계. 해당 년-해당 월 기준 달력구성(출력, 그리기)
	String tBody = "";
	String td = "";
	
	for(int i=0;i<weekIdx;i++)
	{
		td += "<td></td>";
	}
	
	int k=0;
	for(k=1;k<=lastDay;k++)
	{
		td += "<td>"+k+"</td>";
		
		if((k+weekIdx)%7==0)
		{
			tBody += "<tr>"+td+"</tr>";
			td = "";
		}
	}
	
	if(((weekIdx-1)+k)%7!=0)
	{
		for(int i=((weekIdx-1)+k)%7; i<7; i++)
		{
			td += "<td></td>";
		}
	}
	tBody += "<tr>"+td+"</tr>";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<!-- 
	○ 데이터 송수신 실습 08
	
	- 달력을 출력하는 JSP 페이지를 구성한다.
	- 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
	- submit 버튼 없이 이벤트 처리를 한다.
	
	◀ 2023년 12월 ▶
	
	-------------------------
	-------------------------
	-------------------------
	-------------------------
	
	- 『◀』 이나 『▶』 클릭 시
		해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
		
	- 사용자 최초 요청 주소는
	http://localhost:3306/WebApp07/SendAndReceive08.jsp 로 한다.
	
	○ SendAndReceive08.jsp
 -->
 
<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>
 
<div class="layout">
	<div class="input_box" style="display: inline-block;">
		<form action="" method="get">
			<a href="SendAndReceive08.jsp?year=<%=preYear %>&month=<%=preMonth %>">◀</a>&nbsp;&nbsp;
			<%-- <%=nowYear %>년 --%>
			<%=year %>년
			<%-- <%=nowMonth %>월 --%>
			<%=month %>월
			&nbsp;&nbsp;<a href="SendAndReceive08.jsp?year=<%=nextYear %>&month=<%=nextMonth %>">▶</a>
		</form>
	</div>
	<div class="result_box">
		<table id="calendar" name="calendar">
			<thead>
				<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>
			</thead>
			<tbody>			
				<%=tBody %>
			</tbody>
		</table>
	</div>
</div>
 
<script type="text/javascript">
/* function changeCalendar(obj, btn)
{
	if(btn == 1)
	{
		//console.log("왼쪽");
		obj.submit();
	}else if(btn==2)
	{
		obj.submit();
		//console.log("오른쪽");
		
	}else
	{
		
	}
} */
 
</script>
 
</body>
</html>
```


### 5.10.20. [포워딩과 리다이렉트]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/898915c5-e3c4-456a-a058-814ef4770a10)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/414dd208-f23d-4e54-a77d-abb840d60f79)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/1bd56ba2-7cdf-4179-9693-77d961b51bd2)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/9c11cefc-ec7c-4459-a0c2-a0b2b4ebf026)

#### 5.10.20.1. Send09.jsp_포워딩과 리다이렉트
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>
 
<!-- Send09.jsp -> Send09_re.jsp	-> Receive09.jsp -->
<!-- Send09.jsp -> Send09_for.jsp	-> Receive09.jsp -->
 
<!-- 사용자 최초 요청 페이지 -->
<!-- http://localhost:3306/WebApp07/Send09.jsp -->
 
<div>
	<h2>포워딩 및 리다이렉트</h2>
</div>
 
<div class="layout">
	<!-- action 처리 에 대한 분기~!!! -->
	<form action="" method="post" id="testForm">
		<div class="input_box" style="display:inline-block;">
			이름
			<input type="text" name="userName" class="txt">
		</div>
 
		<div class="btn_box">
			<button type="submit" class="btn" style="width: 150px;" onclick="this.form.action='Send09_re.jsp'">리다이렉트</button>
			<button type="submit" class="btn" style="width: 150px;" onclick="this.form.action='Send09_for.jsp'">포워드</button>
			
			
		</div>		
	</form>
</div>
 
</body>
</html>
```
#### 5.10.20.2. Send09_re.jsp_포워딩과 리다이렉트
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ①이전 페이지(Send-9.jsp)로 부터 넘어온 데이터 수신
	// -> userName
	
	request.setCharacterEncoding("UTF-8");
 
	String userName = request.getParameter("userName");
	
	// ② 이페이지에서 수행한 추가 작업
	request.setAttribute("message", "반갑습니다.");
	//-- request 객체의 key(message)의 값 안에
	//	"반갑습니다."를 value로 넣는 작업 수행
	
	// ※
	// ③ 리다이렉트
	response.sendRedirect("Receive09.jsp");
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09_re.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>리다이렉트</h2>
</div>
 
<div>
	<!-- <p>이름: 홍길동</p> -->
	<p>이름: <%=userName %></p>
</div>
 
</body>
</html>
```
#### 5.10.20.3. Send09_for.jsp_포워딩과 리다이렉트
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ① 이전 페이지(Send09.jsp)로 부터 넘어온 데이터 수신
	// -> userName
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	
	// ② 이 페이지에서 수행한 추가 작업
	request.setAttribute("message", "안녕하세요.");
	//-- request 객체의 키 값(message)에 값을 넣는 작업
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09_for.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>리다이렉트</h2>
</div>
 
<div>
	<!-- <p>이름: 홍길동</p> -->
	<p>이름: <%=userName %></p>
</div>
 
<!-- ③ 포워드 -->
<jsp:forward page="Receive09.jsp"></jsp:forward>
<!-- **포워딩 처리를 위한 태그** -->
 
</body>
</html>
```
#### 5.10.20.4. Receive09.jsp_포워딩과 리다이렉트
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(Send09_re.jsp)또는 Send09_for.jsp) 부터 넘어온 데이터 수신
	// -> userName, message
 
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	
	String message = (String)request.getAttribute("message"); //**리턴 오브젝트형**
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>최종 수신 페이지(Receive09.jsp)</h2>
</div>
 
<div>
	<p>이름: <%=userName %></p>
	<p>내용: <%=message %></p>
</div>
</body>
</html>
```

### 5.10.21. []

#### 5.10.21.1. .jsp_데이터 송수신 실습 02
``` html
```
#### 5.10.21.2. .jsp_데이터 송수신 실습 02
``` html
```

### 5.10.22. []

#### 5.10.22.1. .jsp_데이터 송수신 실습 02
``` html
```
#### 5.10.22.2. .jsp_데이터 송수신 실습 02
``` html
```

### 5.10.23. []

#### 5.10.23.1. .jsp_데이터 송수신 실습 02
``` html
```
#### 5.10.23.2. .jsp_데이터 송수신 실습 02
``` html
```

### 5.10.24. []

#### 5.10.24.1. .jsp_데이터 송수신 실습 02
``` html
```
#### 5.10.24.2. .jsp_데이터 송수신 실습 02
``` html
```
------------------------------------------------



### 5.10.. []

#### 5.10..1. .jsp
``` html
```
#### 5.10..2. .jsp
``` html
```



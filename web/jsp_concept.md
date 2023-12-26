# 5. 

## 5.5. 05 ■ JSP(Java Server Page) ■
#### 5.5.1.1. JSP(Java Server Pages): 웹 프로그램 작성 언어의 한 종류
#### 5.5.1.2. JSP(Java Server Pages)는 동적(Dynamic)인 웹 페이지를 비교적 간단히 만들 수 있는 방법을 제공하는
    자바를 기반으로 하고 있는 스크립트(Server Side Script)로
    자바 엔터프라이즈 어플리케이션에서 UI(User Interface) 영역을 담당하고 있다.
#### 5.5.1.3. JSP(Java Server Pages)는 자바의 서버 환경에서 사용하는 스크립트 방식의 언어로 단일 스레디로 클라이언트의 요청에 서비스한다.
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
### 5.5.2. JSP 실행 구조
    1단계. 웹클라이언트에서 웹 서버에 웹 프로그램(페이지) 요청.

    2단계. 웹 서버에서 웹 클라이언트가 요청한 JSP 프로그램(페이지) 로드.

    3단계. JSP 페이지에 대한 변환 실행
         (※ 이 과정에서 일반 『.java』 인 파일로 변환된다. 『-> Servlet』)

    4단계. 『.java』 인 파일로 변환된 Sevlet 의 컴파일(.class) 및 실행.

    5단계. 실행 결과로 동적 생성된 HTML Document 를 클라이언트 측에 응답.

    6단계. 웹 클라이언트는 응답받은 HTML Document 를 브라우저에서 웹 페이지 형태로 출력

### 5.5.3. 이클립스 JSP 개발 환경 구축
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

### 5.5.4. ○ jsp 구성 요소
#### 5.5.4.1. 디렉티브(지시어)
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

#### 5.5.4.2. 스크립트 요소
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

<br>

## 5.6. 06 ■ JSP 데이터 송수신 실습 ■
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
### 5.6.1. request 내부 객체
request 내부 객체는 웹 브라우저에서 JSP(또는 Servlet) 페이지로 전달되는 정보의 모임으로 HTTP 헤더와 HTTP 바디로 구성되며  
, 웹 컨테이너는 요청된 HTTP 메세지를 통해 HttpServletRequest 객체 타입인 request 객체로 사용된다.  
즉, request 객체는 웹 브라우저가 JSP(또는 Servlet) 페이지로 보내진 내용에 대한 정보를 갖고 있는 내부 객체인 것이다.

### 5.6.2. String getParameter(name)
이름이 name인 파라미터에 할당된 값을 반환하며, 지정된 파라미터 값이 없으면 null을 반환한다.

### 5.6.3. String[] getparmaeterVlaues(name)
이름이 name인 파라미터의 모든 값을 String 배열로 반환한다. 주로 checkbox 등 동일한 이름을 사용하는 form 태그의 값을 반환받기 위해 사용한다.

### 5.6.4. void setCharacterEncoding(encode)
전송된 데이터의 문자 인코딩 방식을 지정한다.

<br>

## 5.7. 07 ■ GET 방식과 POST 방식(데이터 전송 및 페이지 요청방식) ■
### 5.7.1. ○ GET 방식
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
### 5.7.2. ○ POST 방식
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

## 5.8. 08 ■ 포워딩(Forwarding)과 리다이렉트(Redirect) ■
### 5.8.1. ○ 포워딩(Forwarding, 포워드)
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

### 5.8.2. ○ 리다이렉트(Redirect, 리다이렉팅, 리디렉션)
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

## 5.9. 09 ■ JAVA Bean(자바 빈) ■

### 5.9.1. ○ 개요
- 자바로 작성되어진 컴포넌트(객체)들을 일반적으로 일컫는 말

### 5.9.2. ○ 사용 목적
- JSP 페이지에서 **로직 부분을 분리**하여 코드를 재사용 함으로써 프로그램의 구성 효율을 높이기 위함

### 5.9.3. ○ JAVA Bean 만들기
- 자바 빈은 자바 클래스이므로 자바 클래스를 설계하는 것과 기본 규칙이 같다.
- 자바 빈에서는 멤버 변수를 프로퍼티(Property)라고 부른다.
- 클래스 선언은 『public』, 프로퍼티 선언은 『private』 으로 한다.
- 프로퍼티 당 하나의 getter 와 setter를 갖는다.
- (매개변수가 없는) 기본 생성자를 포함한다.  
ㄴ **사용자정의 생성자를 매개변수 형태로 만들려면, 기본생성자를 만들어야함**
- 직렬화할 수 있어야 한다.  
ㄴ **시리얼라이즈 ..**
- POJO(Plane Old Java Object)  
ㄴ **특정 클래스를 상속의 개념이 적용되지 않은, 오브젝트를 기반으로 만든 것**

<br>

## 5.10. 10 ■ 쿠키(Cookie)와 세션 ■
### 5.10.1. ○ 쿠키(Cookie)
- 쿠키는 클라이언트에 대한 정보를 클라이언트의 하드디스크에 작은 파일 형태로 저장한 것으로 서버에서 사용자에게 편리한 기능을 제공하기 위해 많이 사용되고, 이 쿠키는 웹 브라우저에 의해 관리된다.

- 쿠키는 텍스트 형태로 저장되기 때문에 변조나 복사등이 가능하여 보안성이 없고 클라이언트에... 예전에는 총 300개 까지 저장 가능했으며,
각 도메인 당 갯수 제한(20개)이나 크기 제한(4096Byte)은 사실상 무의미해져 가고있다.

- 저장되는 위치는 시스템(운영체제)이나 브라우저에 따라 다르며 일반적인 형식(계정명@도메인)도 꾸준히 바뀌어 가고 있다.

- 쿠키는 웹 브라우저가 거쳐간 웹사이트 및 개인의 정보가 기록되기 때문에 개인의 사생활을 침해할 소지가 있으며, 이로 인해 웹 브라우저 자체에 쿠키 거부 기능이 포함되어 있다.
하지만, 쿠키 거부 기능을 설정하게 되면 웹 브라우저와의 연결을 지속시키지 못하기 때문에 문제가 발생하게 된다.
(사실상 거부하는 의미가 없음... 반 강제적)

- 쿠키의 동작 방식 
쿠키의 동작 방식은 웹 서버와 웹 브라우저 간의 상호 협력으로 이루어진다. 웹 서버가 외부 브라우저의 요청에 응답할 때 HTTP 프로토콜에 있는 HTTP 헤더 쿠키 정보를 포함시켜 클라이언트 쪽으로 보낸다.
그리고, 웹 브라우저가 웹 서버에 존재하는 페이지를 요구할 때 그 전에 자신이 방문했을 때 해당 페이지에 대해 웹 서버가 웹 브라우저 쪽으로 심어놓았던 쿠키를 웹 서버로 다시 건네 주어서 이전상태를 웹 서버가 알 수 있도록 한다.

- 쿠키(객체)의 파라미터(속성)  
·`name=value`
: 쿠키는 반드시 이름을 포함해야 한다. 이름은 변수명과 같은 목적으로 사용한다.
·`expires=date`
: 유효기간을 지정한다.  
날짜를 생략할 경우 브라우저 종료 시점까지 쿠키가 남아있게 된다. 유효기간 설정은 그리니치 표준시(Wdy, DD-Mon-TT HH:MM:SS GNT)로 설정하게 된다.  
·`path=path`
: 웹 서버에서 쿠키 값이 디렉터리 간에 유효한 범위를 설정하는 것으로 path 값은 웹 서버의 document root 를 기준으로 설정한다.  
예를 들어... path 가 『/』이면 (『"Path=/;"』) 도메인의 루트(/)에서 시작하는 모든 곳을 접속할 때 해당 쿠키의 갑을 적용할 수 있다.  
생략할 경우 현재 문서의 위치와 디렉터리와 하위 디렉터리가 쿠키의 범위가 된다.
·`domain=domain`
: 한사이트에서 만든 쿠키가 다른 사이트에 영향을 주지 않기 때문에 도메인 항목이 필요하다. 도메인은 자동으로 사이트의 기본 도메인으로 설정된다.  
·`secure`
: 데이터의 전송에 보안이 요구되는 지를 지정한다. true는 브라우저가 안전하다고 판단하는 서버만 나타나게 된다. 기본값(default)은 false 이다.  

- 쿠키의 기본 설정  
① Cooke 객체 생성  
``` java
Cookie c = new Cookie("쿠키이름","쿠키값");
```
② Cooke 객체 설정  
``` java
c.setMaxAge(쿠키유효시간 초 단위 설정)
```
③ Cookie 객체 등록(추가)  
``` java
response.addCookie(c);
```
- JSP 에서 쿠키를 설정하는 방법은 두 가지가 있다.  
첫 번째 방법은   
『response』객체에 『setHeader()』 메소드를 이용하여 쿠키를 설정하는 것이다.  
하지만, 권장하지 않는다.  
``` java
ex) response.setHeader("set_cookie","name=value, expirese=value, ...");
//-- 이 방법은...
//  Header 에 key 와 값, key 와 값, .... 을 String Type 으로 넘기는 것이기 때문에 엄밀히 말하자면 쿠키라는 객체를 넘기는 것이 아니다. 과거에는 쿠키라는 클래스가 존재하지 않있기 때문에 이 방법을 사용했었다.
```
두 번째 방법은  
『Cookie』 클래스를 이용하는 방법이다.  
· `String getCommet()`
: 쿠키에 대한 설명을 가져온다.  
· `String getDomatin()`
: 쿠키가 유효한 도메인 정보를 가져온다.  
· int getMaxAge()
: 쿠키의 유효한 시간 정보를 가져온다.  
· String getName()
: 쿠키의 이름을 가져온다.
· String getPath()
: 쿠키의 유효한 디렉터리 정보를 가져온다.
· String getSecure()
: 쿠키의 보안 설정을 가져온다.  
· String getValue()
: 쿠키의 해당 값을 가져온다.  
· int getVersion()
: 쿠키의 버전 값을 가져온다.  
· void setcomment(string purpose)
: 쿠키에 대한 설명을 설정한다.  
· void setDomain(String Pattern)
: 쿠키가 유효한 도메인 정보를 설정한다.  
· void setMaxAge(int expiry)
: 쿠키가 유효한 시간 정보를 설정한다.  
· void setSecure(string url)
: 쿠키의 보안 설정값을 구성한다.  
· void setValue(String newValue)
: 쿠키의 해당 값을 설정한다.  
· void setVersion(int V)
: 쿠키의 버전 값을 설정한다.  

- JSP 에서 쿠키(Cookie) 유효시간 설정
『setMaxAge(int expiry)』 메소드를 통해 유효시간을 설정한
· 『expiry』가 『음수』일 때
: 브라우저가 종료되면 쿠키가 제거된다.  
· 『expiry』가 『0』일 때
: 생성과 동시에 쿠키가 제거된다.  
· 『expiry』가 『양수』일 때
: 초 단위로 해당 시간만큼 쿠키가 유지된다.  
· 『setMaxAge()』 메소드를 통해 유효시간을 설정하지 (명시하지)않은 경우 기본적으로 음시가 설정되어 브라우저가 종료될 때까지 쿠키가 유지된다.  


### 5.10.2. ○ 세션(Session)
- 쿠키의 경우 브라우저에 상태를 유지하기 위한 정보를 저장하지만(즉, 로컬 PC의 하드디스크에 저장) 세션은 서버의 웹 컨테이너의 상태를 유지하기 위한 정보를 저장하는것으로
『javax.servvlet.http』 패키지의 『HttpSession』 인터페이스를 통해 세션을 사용하게 된다.  
또한 세션은 서버와 관련된 정보를 노출하지 않기 떄문에 쿠키를 사용하는 것보다 『HttpSession』 인터페이스의 세션을 통한 관리가 보다 안정적(보안성 향상)이라 할 수 있다.  

- Session 생성 
Session 을 생성하기 위해서는 페이지 디렉티브(page directive)의 session 속성을 ture 로 설정한다.  
(별도로 설정하지 않아도 자동으로 기본값 적용. 즉, 사용하지 않을 경우만 false 설정.)
ex) <%@ page session="true"%>

- Session 내장 객체의 주요 메소드
· String getId()
: (『세션아이디』라고 한다. 세션 고유 ID를 문자열 형태로 반환한다.)  
· long getCreationTime()
: 세션의 생성된 시간을 구한다.  
(시간은 1970년 1월 1일 이후 흘러간 시간을 의미한다.)  
· long getLastAccessedTime()
: 웹 브라우저가 가장 마지막에 세션에 접근한 시간을 구한다.  
· int getMaxInactiveInerval()
: 세션 유지 시간을 초로 반환한다. 기본값은 30분으로 지정된다.  
· void setMaxInactiveInerval(int interval)
: 세션을 유지할 시간을 interval 에 설정된 초 값으로 설정한다.  
· void invalidate()
: 현재 세션을 종료한다. 세션과 관련된 모든 값을 삭제한다.  
· boolean isNew()
: 클라이언트 『세션아이디』를 할당하지 않은 경우 『true』값을 반환한다.   
새로운 세션인지의 여부를 확인할 때 사용한다.  
· void setAttribue(String key, Objec value)
: 주어진 key 속성의 값을 value 로 지정한다.  
· Object getAttribute(String key)
: 주어진 key 속성의 값을 얻어낸다.  
· void removeAttribue(String key)
: 주어진 key 속성의 값을 제거한다.  

- 한번 생성된 세션은 종료하기 전까지 지속적으로 유지된다. (중간에 사라지지 않음)
단, 은행 인터넷 뱅킹과 같은 서비스 이용 시 일정 시간 동안 사용하지 않으면 로크인 이 풀리는 것 같은 이유는 
임의로 설정을 해두었기 때문이며, 이렇게 임의로 세션을 종료하기 전까지는 지속적으로 유지된다.  
이와 같은 성격으로 웹 어플리케이션을 실행하는 동안 지속적으로 사용하는 데이터의 저장 장소로는 세션이 적합(적당)한다.  

### 5.10.3. ※ 참고
- 스코프(scope) -> 대부분의 교재에서 life cycle (생명주기)로 설명함.
웹 어플리케이션은 page, request, session, application 이라는 4개의 객체의 영역은 객체의 유효기간이라고도 불리며, 객체를 누구와 공요할 것이가를 나타낸다.   
· page 영역
한 번의 웹 브라우저(클라이언트)의 요청에 대해 하나의 JSp 페이지가 호출 되며 웹 브라우저의 요청이 들어오면 이때... 단 한개의 페이지만 대응된다.  
· request 영역
한 번의 웹 브라우저(클라이언트)의 요청에 대해 같은 요청을 공유하는 페이지가 대응되며 웹르라우저의 한 번의 요청이 단지 한 개의 페이지만 요청될 수 있고 같은 request 영역이며 두 개의 페이지가 같은 요청을 공유한다.  
(include 액션 태그, forward 액션 태그 사용 시)
· seession 영역
하나의 웹 브라우저 당 한개의 Session 객체가 생성된다.   같은 웹 브라우저 내에서는 요청되는 페이지들이 같은 객체를 공유한다.  
· applicaiton 영역
하나의 웹 어플리케이션 당 한 개의 application 객체가 생성된다.   대부분의 환경 설정에서 사용된다.   같은 웹 어플리케이션에서 요청되는 페이지들은 같은 객체를 공유한다.  
<br>

## 5.11. 11 ■ Emmet(에밋) ■
>/* **html 생산성 향상 도구** */

### 5.11.1. ○ 개요
- 기존에는 Zen Coding(젠코딩) 이라는 이름으로 사용되었다.
- 이후... Goolge에서 이 도구를 수용하면서 emmet 이라는 이름으로 변경되었다.
- HTML 생산성 향상 도구(HTML 코딩을 빠르게 하기 위한 플러그인)
- CSS 선택자 사용(CSS3 지원)
-> HTML 을 CSS 선택자를 통해 검색하는 방법 대신
CSS 선택자를 통해 HTML 을 생성하도록 하는 개념.

### 5.11.2. ○ 환경 설정
- 대부분의 툴에서 지원하고 있음
(※ 그리고 대부분의 편집기 내에서의 액션 키: Ctrl + E)

- https://emmet.io/
① 메인 페이지 좌측에 있는 Download 메뉴 클릭
-> https://emmet.io/download/ 페이지로 이동
② Download 리스트들 중 본인이 사용할 편집툴의 메뉴 클릭

③ Installation 항목에서 제시한 순서대로 진행

### 5.11.3. ※ 특이사항
```html
Emmet 플러그인 설치 이후 이클립스 기본 단축키와 중복되는 항목이 존재함.
			------------------
				Ctrl + D
==> 단축키 재설정
(이클립스 > 윈도우 > 설정 > General > keys)
```

<br>

## 5.12. 12 ■ JSP 액션 태그(JSP Action Tag) ■

### 5.12.1. ○ 개요

JSP 액션 태그는 클라이언트 혹은 서버에 어떤 동작을 수행하도록 명령을 내리는 태그로 
JSP 페이지 안에서 자바 빈즈를 사용할 수 있도록 하는 액션 태그와 페이지를 활용할 수 있도록 하는 액션 태그로 나눌 수 있다.

- JSP 빈과 관련된 액션 태그
`<jsp:useBean>`, `<jsp:setProperty>`, `<jps:getProperty>`

- JSP 페이지 모듈과 요청흐름 처리를 위한 액션 태그
`<jsp:include>`, `<jsp:forward>`, `<jsp:param>` 등

### 5.12.2. ○ 형식 및 구조

`『<jsp:액션태그 속성="값"> 태그에 들어있는 내용</jsp:액선태그>』`  
`『<jsp:액션태그 속성="값">』` <- 태그에 들어있는 내용이 없을 경우

### 5.12.3. ※ 스코프(Scope)

JSP 액션 태그를 통해 생성된 객체는 그 객체가 사용될 수 있는 스코프 혹은 라이프사이클(Life Cycle : 생명주기) 속성을 갖는데,
이것은 생성된 객체의 레퍼런스가 어디에서 사용될 수 있고, 언제 삭제될 것인지를 기술한다.

- page  
생성된 객체는 단일 클라이언트의 요청에 의해 생성된 페이지 내에서 접근하여 사용될 수 있다.
생성된 객체는 실질적으로 pageContext 에 저장된다.

- request  
생성된 객체는 단일 클라이언트의 요청이 처리되는 동안에 접근하여 사용될 수 있다.
request가 page 와 다른 점은 request 에서는 forward 나 include 를 사용해서 
다른 페이지로 제어가 이동되는 경우에도 객체에 접근하여 사용할 수 있다.
생성된 객체는 실질적으로 HttpServletRequest 에 저장된다.

- session  
생성된 객체는 사용자의 세션이 유지되는 어느 곳에서나 접근하여 사용될 수 있다.
생성된 객체는 실질적으로 HttpSession에 저장된다.

- application  
생성된 객체는 웹 응용프로그램의 라이프 사이클 동안에 웹 응용프로그램에 소속된 임의의 Servlet 과 JSP 에서 접근하여 사용될 수 있다.
생성된 객체는 실질적으로 ServletContext 에 저장된다.

### 5.12.4. ○ <jsp:param>

`<jsp:param>` 태그는 요청한 페이지로 저오를 전달할 때 사용하는 태그로 현재 페이지에서 요청한 페이지로 인자(parameter)와 인자값(value) 형태로 넘겨준다.

`<jsp:param name="paramName" value="var" />`

※ 이 태그는 단독으로 사용하지 못하고 
`<jsp:inclue>` 나 `<jsp:forward>` 태그의 내부에 기술하여 사용한다.

- name  속성
포함되는 JSP 페이지에 전달할 파라미터의 이름을 표시.
- value 속성
전달할 파라미터 값을 표시. 이때, value 속성 값으로 표현식을 사용하는 것도 가능하다.

### 5.12.5. ○ <jsp:forward>
`<jsp:forward>` 태그는 현재 머물고 있는 JSP 페이지에서 URL로 지정한 특정한 페이지로 넘어갈 때 사용하는 태그로
현재 페이지에서 조건에 따라 서로 다른 페이지를 호출할 경우 사용된다. 이 태그의 특이한 점은 현재 페이지에 대한 URL만 나타날 뿐
제어가 넘어간 특정 페이지의 URL 이 전혀 나타나지 않는다는 점이다.
클라이언트의 웹 브라우저 주소란에 보이는 URL 과 실제 브라우저에서 읽어들이고 있는 문서가 서로 다르기 때문에
사용자는 이러한 상황이 벌어지고 있는 지를 감지할 수 없다.
그리고 제어가 넘어갈 때 request 내부 객체도 같이 전달된다.

``` html
<jsp:formard page="이동할페이지이름" />
```

- page 속성
이동할 페이지의 이름을 기술하며 page 속성의 값인 이동할 페이지의 이름은 웹 어플리케이션 상대 경로나, 웹 어플리케이션 절대 경로로 지정할 수 있고, 표현식을 사용할 수도 있다.

- <jsp:forward> 액션 태그에서 
`<jsp:param>` 태그로 프로그램의 제어가 이동할 페이지에 파라미터 값을 전달할 수 있으며
전달받은 값은 `『request.getParameter("파라미터이름")』`으로 넘겨받는다.

```html
<jsp:forward page="이동할페이지이름">
<jsp:param naem="paramName1" value="var1">
<jsp:param naem="paramName2" value="var2">
</jsp:formard>
```

- 단순히 page 속성에 지정된 페이지로 이동하는데 그치는 것이 아니라 이동할 페이지에 자신의 정보를 파라미터 형식으로 전달할 수 있는 것이다.

```html
<jsp:forward page="view.jsp" />
<%
String url = "/To.jsp";
%>
</jsp:forward page="<%=url%>" />
```

### 5.12.6. ○ <jsp:include>
`<jsp:includa>` 태그는 웹페이지를 공통된 페이지를 모듈화하여 레이아웃을 구성(작성)할 수 있도록 지원한 태그이다.
include 디렉티브(`<@ include>`)와 함께
다른 페이지를 현재 페이지에 포함시킬 수 있는 기능을 가진 태그이다.
단, include 디렉티브는 단순하게 소스의 내용이 텍스트로 포함되지만 `<jsp:include>` 액션 태그를 포함시킬 페이지의 처리 결과를 포함시킨다는 점에서 차이를 갖는다.
포함되는 페이지 html, jsp, Servlet 페이지 모두 가능하며 include 디렉티브는 주로 조각 코드를 삽입할 때 사용되고, `<jsp:include>`액션 태그는 페이지를 모듈화 할 때 사용된다.
즉, 템플릿 페이지를 작성할 때 주로 사용된다는 것이다.또한, `<jsp:include>`액션 태그 같은 request 기본 객체를 공유한다.

``` html
<jsp:include page="url" flush="false" />
```

- page 속성  
현재 페이지에 결과가 포함될 대상의 페이지와 이름

- flush 속성  
출력 버퍼의 플러시 유무
포함될 페이지로 이동할 때 현재 페이지가 지금까지 출력 버퍼에 저장한 결과를 어떻게 처리할지를 결정한다.
flush 속성의 값은 false로 설정하는 것이 일반적이다.
flush 속성의 값을 true로 지정할 경우 일단 출력 버퍼의 내용을 웹 브라우저로 전송하게 되는데
이 때, 헤더 정보도 함께 전송된다. 해더 정보가일단 웹 브라우저로 전송되고 나면 이후 헤더 정보를 추가하더라도 결고가 반영되지 않는다.

``` html
<jsp:include page="url" flush="false"> 
<jsp:param naem="paramName1" value="var1">
<jsp:param naem="paramName2" value="var2">
</jsp:include>
```

### 5.12.7. ※ 자바 빈즈(Java Bean)

JSP 페이지에 화면 출력 부분과 로직들이 섞여 있는 형태로 작성할 경우 JSP 페이지를 이해하기 어렵고 디자이너와 협업도 어려워 진다.  
또한, JSP 페이지에 화면 출력 부분과 로직들이 혼재한 형태의 코드는 재사용을 하는 것도 어려워지게 된다.  
JSP에서는 자바로 작성한 클래스 중에 자바빈즈 구약에 맞게 작성된 클래스를 JSP 에서 사용 가능하게 하였으며,  
이를 통해 프리젠테이션(웹 디자이너 측)부분과 비즈니스 로직(개발자 측)을 처리하는 부분을 분리하여 작성할 수 있다.  
이렇게 함으로써 웹의 내용으로부터 웹의 표현 부분을 분리하게 되고 동적인 웹 페이지 제작을 위한 개발과 관리에 있어 명확한 분리가 가능하다.  
또한, 동일 기능이 페이지 구성이 달라서 반복적으로 사용 되는 경우 웹 페이지를 효율적으로 작성, 수정하려면 반복적으로 사용되는 코드를 재사용할 수 있어야 한다.  
빈은 이와 같은 효율적인 코딩 작업을 가능하게 된다.  

현재 개발되었거나 개발중인(작업 중인) 프로그램들은 모두 MVC 기법에 의 해 개발되고 있다.  
MVC 기법은 프로그램을 모델(Model), 뷰(View), 컨트롤러(Controller)로 나누어 개발을 하는데...  
Model 은 로직을 가지고 있는 부분으로 DB와 연동하는 부분이고  
View 는 사용자에게 제공하는 화면으로 UI(User Interface)에 해당하며,  
Controller 는 View 와 Model 사이에서 흐름을 제어하는 개념이다.  

JAP 페이지 MVC 에서 View 에 해당하고, 바로 이 View 를 모듈화 하는 것이 템플릿 페이지이며, 자바 빈즈는 Model에 해당한다고 볼 수 있다.  

### 5.12.8. ○ <jsp:useBean>

`<jsp:useBean>` 액션 태그는 자바객체를 생성하거나 기존에 만들어져 있는 객체를 반환한다.

```html
<jsp:useBean id="name" scope="page|request|sesseion|application" typeSpec />
```

- id 속성  
객체 인스턴스르 식별하는 이름으로 대소문자를 엄격하게 구분한다.
한 번 생성된 Bean 이 소멸할 때 까지는 같은 id 를 중복해서 사용할 수 없다.

- scope 속성  
객체 참조 범위로 기본값(default)은 page 이다.
·page  
객체 참조는 service() 호출이 종료될 떄 소멸.

·request  
HttpsevletRequest 객체가 소멸되지 않는 한 존재하며,컨테이너에 의해 생성된 서블릿은 HttpServletRequest 의 setAttribute() 메소드를 이용하여 객체를 HttpServletRequest 에 바인딩 시킨다.

·sesstion  
객체는 클라이언트의 요청과 구별되며, session 이 살아있는 동안에 존재하며, 컨테이너에 의해 생성된 서블릿은 HttpSession 의 putBalue(String key,Object value)메소드를 이용하여 객체를 HttpSession 에 바인딩 시킨다.

·application  
가장 수명(생명주기)이 길다. SevletContext 의 setAttribute()를 통해 객체를 SevletContext 에 바인딩시킨다.

- typeSpec 속성
```java
class="class_name" |
class="class_name" type="type_name"|
type="type_name" class="class_name" |
beanName="bean_name" type="type_name" |
tpe="type_name" beanName="bean_name" |
type="type_name"
```  

· class
완전한 형태의 클래스 이름으로 beanName 이 정의되어 있지 않은 상황이라면 반드시 정의해야 한다.
· beanName
java.beans.Beans 클래스의 instantiate() 메소드에 ㅏ용할 vean 이름으로 type 과 beanName 을 지정한 경우에는 class를 생략할 수 잇다.
주로 class 인자를 쓰지 않을 경우 사용한다. 내부적으로 컨테이너는 id 와 scope 를 이ㅛㅇ해서 객체를 찾는다.
이 과정에서 만약 찾지 못할 경우 현재 클래스 로더로 instantiate() 메소드를 호출하는데, 이때 bena 의 이름을 인자로 전달한다. 이 인스턴스의 생성이 실패하게 되면 예외가 발생한다.
· type클래스의 형(Type)을 지정하는, 생략 가능한 특성이다.
객체가 이 특성으로 지정된 형(type)이 아닐 경우 ClassCastException 예외가 발생하게 된다.

```html
<jsp:useBean id="name" scope="page" typeSpec>
<jsp:setProperty name="bean_name" prop_expr />
<%
// 스크립릿을 이용하여 다른 속성 값을 호출하는 기능을 가진 함수를 호출할 수 있다.
%>
</jsp:useBean>
```

### 5.12.9. ○ <jsp:setProperty>

`<jsp:setProperty>` 액션 태그는 자바 빈에 속성 값을 할당한다. name 속성에 기술된 이름에 해당하는 bean 클래스는 `<jsp:Bean>` 액션 태그를 이용해서 이 액션이 나타나기 전에 미리 정의되어야 한다.

```html
<jsp:setProperty name="bean_name" prop_expr />
```

- name 속성
<jsp:userBean> 액션 태그에 의해 정의된 bean 인스턴스 이름

- prop_expr  
```html
property="*" |
property="property_name" |
property="property_name" param="parameter_name" |
property="property_name" value="parameter_value" |
```

· property  
값을 설정하고자 하는 bean 속서의 이름으로 『"*"』으로 설정하면 ServeletRequest 안에 모든 인자들 중 bean 속성과 데이터타입이 일치하는 것을 찾아서 각각의 속성들을 각가의 인자들의 값으로 설정한다.
값이 『""』인 경우 속성은 변하지 않는다.

· param  
bean 속성에 설정하고자 하는 값을 파라미터에서 지정하고자 할 경우 사용한다.

· value   
bean 속성에 설정할 값을 지정하며 하나의 <jsp:setProperty> 액션 태그가 param 과 value 를 동시에 가질 수 없다.

### 5.12.10. ○ <jsp:getProperty>

`<jsp:getProperty>` 액션 태그는 bean 의 속성값을 얻는데 사용한다.
bean의 속성값을 얻어 String 으로 변환한 다음 출력 스트림으로 보낸다.

```html
<jsp:getProperty name="name" property="property_name">
```

- name 속성
속성을 얻고자 하는 bean의 인스턴스 이름

- property 속성
얻고자 하는 속성의 이름




<br>

## 5.13. 13 ■ Servlet(서블릿) ■
### 5.13.1. 0. 웹 어플리케이션을 구축하기 위한 웹 프로그램을 구성하는 언어의 한 종류.
(JAVA 기반)

### 5.13.2. 1. JSP 에서 정적인 부분을 담당하고, Servlet 에서는 동적인 처리를 위한 부분으로 사용되어 보다 효율적인 웹 어플리케이션을 구축할 수 있다.
- JSP → 단점. MVC 패턴을 적용하기 힘들다.
- Servlet → 단점. 웹 페이지(view) 작성이 번거롭고 복잡하다. (불편)
- Servlet + JSP → MVC 패턴 적용 및 웹 페이지(view)를 보다 편리하게 작성.
		단점. 구조가 복잡해지게 된다.

### 5.13.3. 2. JSP 는 내부적으로 Web Container 가 Servlet 으로 변경시켜준다.

### 5.13.4. 3. WEB-INF 는 환경 설정 파일이 저장되는 곳
(→ 외부에서는 접근 불가 / 금지)  check~!!!
- lib : 라이브러리 파일을 저장(ojdbc.jar, jstil.jar 등) 
- J2EE
- J2SE
- classes : class 파일이 저장(servlet)
『classes > com > util > MyUtil.class』
원래는 이렇게 만들어야 하지만 이클립스가 자동으로 연결
실제 위치는
『C:\WebStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\WebApp20\org\apache\jsp』

* .jar : java
* .war : web(프로젝트 아래 모든 것을 압출할 때)
* .ear : jar + war
web.xml : context path 의 환경 설정

### 5.13.5. 4. 『init()』 과 『destory()』는 단 한 번 호출되며
『service()』는 클라이언트의 요청이 있을 때 마다 호출된다.
이제는 JSP를 『service()』 메소드 내부에 코딩하는 것과 같다.

### 5.13.6. 5. 『GenericServlet』 이나 『HttpServlet』을 활용한다.

### 5.13.7. 6. URL 패턴을 지정하는 방법은 크게 3 가지 이다.
- 『/a』
- 『/*』
- 『.do』

### 5.13.8. 7. web.xml 을 수정하면 서버를 꼭 재구동한 이후에 실행해야 한다.

### 5.13.9. 8. 지금까지는
JSP(입력) → JSP(처리, 결과) 였으나
JSP 와 함께 Servelet 을 다루게 된 이후에는
JPS(입력) → Servlet(결과를 위한 처리) → JSP(결과) 방식으로 구성된다.

<br>

## 5.14. 14 ■ EL(Express Language)과 JSTL(JSP Standard Tag Library) ■

>- JSP 에서 표현식 쓰는 것:                  `<%= 표현식%>`  
								↓  1. 아래의 형태로 대체 될 것  
								↓  2. 제이쿼리 선택자 운용방식과 비슷함`'$(선택자)'`  
>- EL 을 쓰는데 있어서 가장 많이 사용하는 것: `"${aName}"`

### 5.14.1. ○ EL(Expression Language: 표현 언어)

EL 은 JSTL 1.0 스펙에서 잠깐 소개되었다가 JSP 2.0 부터 공식적으로 포함되었으며 JSP 페이지에서 사용되는 자바 코드를 대신해서 액션 태그 엘리먼트의 속성에 값을 지정하는 역할을 한다.
예를 들어, `<someTags:aTag>`` 액션 태그 엘리먼트의 속성은 `attribute`` 이고 속성값은 `<% pageContent.getAttribute("aName")%>` 인 경우

`<someTags:aTag attribute="<% pageContent.getAttribute("aName")%>">` 의 방식으로 표현하지만

표현 언어(EL)에서는 다음과 같이 표현한다.
`<someTags:aTag attribute="${aName}">`

### 5.14.2. ○ JSTL(JSP Standard Tag Library)

JSP 에서는 XML 처럼 사용자가 태그를 정의해서 사용하는 것이 가능하며 이와 같은 사용자 정의 태그를 커스텀 태그라고 하는데 이들 중 자주 사용하는 것을 표준으로 만들어 놓은 것이 JSTL 이다.

JSP Standard Tag Libray(JSTL)는 일반적으로 웹 어플리케이션 기능인 반복(iteration)과 조건, 데이터 관리, 포맷, XML 조작, 데이터베이스 액세스를 구현하는 커스텀 태그 라이브러리 모음이다.

JSP 의 스크립트와 HTML 코드를 혼용하여 사용하면 개발의 편의성을 제공하긴 하지만 코드의 복잡성을 증대시키는 문제가 있다.
이와 같은 문제를 해결하기 위해 로직 부분의 JSP 코드를 태그로 대치시켜 HTML 과 같은 태그로 이루어진 코딩 방법이 제시되었다.

JSTL 은 JSP 로직을 담당하는 부분인 if, for, while, DB 처리 등과 관련된 표준 커스텀 태그를 제공함으로써 코드를 간결하고 가독성이 좋도록 하며
데이터 포맷, 반복 콘텐트 또는 조건 콘텐트와 같은 전형적인 표현 레이어를 위한 표준 구현을 제공하기 때문에 JSP작성자들이 어플리케이션 개발에 집중하는데 도움이 된다.

JPS(JSTL) 작성 시 주의할 점은
액션 태그도 그렇지만 JSTL 커스텀 태그도 XML 기반에서 작성되었기 때문에 모든 태그는 시작 태그와 종료 태그의 쌍으로 이루어져야 한다는 것이다.

기존의 컨텍스트에서 JSTL을 사용하기 위해서는 웹 어플리케이션의 WEB-INF/lib 디렉터리에 필요한 라이브러리를 복사하여 붙여넣으면 된다.
JSTL 의 주된 라이브러리 파일은 `jstl.jar`, `standard.jar` 파일이고, `jaxen-full.jar`, `sxpath.jar`, `jaxp-api.jar` 파일이 필요하다.
이 파일들을 적재하고 컨텍스트를 리로드한다.

- JSTL 을 사용하기 위한 환경 설정  
· 『https://jakarta.apache.org/』 에 접속  
· 왼편에 구성된 메뉴 목록들 중 『Taglibs』 클릭  
→ 『https://tomcat.apache.org/taglibs/』  
· 왼편에 구성된 메뉴 목록들 중 『Standard』 클릭  
→ 『https://tomcat.apache.org/taglibs/standard/』  
· 본문의 내용 중 『Standard 1.1』 항목의 『download』 클릭  
→ 『https://archive.apache.org/dist/jakarta/taglibs/standard/』  
· 본문의 내용 중 『binaries/』 클릭  
→ 『https://archive.apache.org/dist/jakarta/taglibs/standard/binaries/』  
· 본문의 내용 중 『jakarta-taglibs-standard-1.1.2.zip 2004-10-25 20:57  933K』 클릭  
→ 다운로드 대화창 → 파일 다운로드 및 저장  
→ 다운로드 완료 및 압축 해제  

이후...(압축 해제 후)...
『C:\Downloads\12_JSTL\jakarta-taglibs-standard-1.1.2\lib』 디렉터리 안에 있는 『jstl.jar』파일과 『standard.jar』파일
이렇게 두 개의 jar 파일을 현재 작업할(작업중인) 프로젝트의 『WebContent > WEB-INF > lib』 경로에 복사하여 붙여넣기 한다.

다음으로 ...
이클립스 환경 설정(Window > preferences) 클릭
→ Web 항목 > JSP Files > Editer > Templates 접근

리스트 항목들 중 (체크박스는 건드리지 말고...)
new JSP Files(html5) 항목 선택 후 수정(Edit 버튼 클릭)

이어 열리는 대화창에서
최초 디렉티브(page) 아래에 다음과 같은 내용 추가
```html
『<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>』
```

- JSP 사용

JSTL 은 태생이 커스텀 태그이기 때문에 JSP 와 밀접한 관계가 있다.
`application`, `session`, `request`, `response`, `pageContext` 등의
내장 객체에 쉽게 접근하며, 그 외에도 파리미터, 쿠키, 헤더 등을 
복잡한 코드를 사용하지 않고 쉽게 직관적으로 사용할 수 있다.
또한, 기본저인 연산이나 객체 비교 등을 `『.equals()』`메소드 등을
사용하는 태신 `『==』`와 같이 쉽게 구현하였으며,
조건, 반복, 이동에 따른 태그를 지원하기 때문에 태그만으로도 반복 기능을 구현할 수 있다.

JSTL 의 처리 영역은 크게 4가지로 나누어진다.
```html
core,           format,  xml,      sql
(기본 핵심 기능) (형식화) (xml처리) (sql처리)
```

### 5.14.3. ※ 주요 분류 및 종류

○ Core  
- 기능: 변수지원, 흐름제어, URL처리 등  
- 접두어(Prefix) : c  
- URI : http://java.sun.com/jsp/jstl/core  
○ XML  
- 기능: XML 코어, 흐름제어, XML 변환  
- 접두어(Prefix) : x  
- URI : http://java.sun.com/jsp/jstl/xml  
○ 국제화(형식화)  
- 기능: 지역, 메세지 형식, 숫자 및 날짜 형식 등  
- 접두어(Prefix) : fmt  
- URI : http://java.sun.com/jsp/jstl/fmt  
○ 데이터베이스  
- 기능: SQL 지원  
- 접두어(Prefix) : sql  
- URI : http://java.sun.com/jsp/jstl/sql  
○ Functions  
- 기능: 컬렉션처리, String처리 등   
- 접두어(Prefix) : fn  
- URI : http://java.sun.com/jsp/jstl/functions  


### 5.14.4. ※ JSTL에 taglib 추가
```html
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
```

<br>

## 5.15. 15 ■ DBCP(DataBase Connection Pool) ■

### 5.15.1. ○ 커넥션 풀(Connection Pool) 기법이란, 데이터베이스와 연결된 커넥션을 미리 만들어 풀(pool)속에 저장해 두고 있다가
필요할 때에 커넥션을 풀에서 꺼내어 가져다 쓰고 다시 풀에 반환하는 기법을 말한다.

### 5.15.2. ○ 데이터베이스를 연결하기 위한 커넥션(Connection)은 객체이다.
이 객체는 새롭게 만들어지는 과정에서 많은 시스템 자원을 요구하게 된다.
객체가 메모리에 할당되고, 객체에 사용할 여러 자원들에 대한 초기화 작업 
그리고 객체가 더 이상 필요하지 않게 되었을 때 메모리를 회수하는 과정 등에서 많은 비용이 발생하고 요구되는 것이다.

### 5.15.3. ○ JSP 페이지를 생성할 때 마다 커넥션을 생성해서 사용하게 되면 
커넥션을 생성하고 닫는데 많은 시스템 자원을 요구하게 되기 때문에 
동시 접속자수가 많은 웹사이트의 경우 전체 성능을 떨어뜨리는 원인이 될 수 있다.
이러한 성능 저하 문제를 해결하기 위해 사용하는 일반적인 방식이 커넥션 풀(Connection Poll)기법인 것이다.

### 5.15.4. ○ DBCP를 사용하기 위해서는 기본적으로 세 개의 패키지가 필요하다.
- Jakarta-Commons DBCP 1.2.1 (commons-dbcp-1.2.1.jar)
- Jakarta-Commons Collections 3.1 (commons-collections-3.1.jar)
- Jakarta-Commons Pool 1.2 (common-pool-1.2.jar)

※ 하지만, 톰캣 6.x 부터 톰캣 서버 내부에 기본적으로 탑재되어 제공되기 때문에
(경로: Tomcat Root/lib 또는 Tomcat Root/common/lib)
(파일: tomcat-dbcp.jar)
다른 파일을 추가하거나 변경하지 않아도 무방하다.

### 5.15.5. ○ 실습 환경 설정
1. Eclipse > Project Explorer > servers > Tomcat ... > context.xml
파일 접근 및 열기
2. 해당 파일의 맨 아래에 즉, 『</Context>』 닫히기 전에...
```html
<Resource name="jdbc/myOracle" auth="Container"
	type="javax.sql.DataSource"
	driverClassName="oracle.jdbc.drifer.OracleDriver"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	username="사용자계정명" password="계정패스워드"
	maxActive="20" maxIdle="10" maxWait="-1">
</Resource>
```
내용을 추가한다.

-name
: 리소스 식별을 위한 이름
- auth
: 해당 리소스를 사용하게 되는 주체
- type
: 리소스의 타입(패키지 경로 포함)
- driverClassName
: 사용할 JDBC Driver 의 클래스 이름
- url
: JDBC Driver 에 의해 연결할 Connection 에 대한 URL
- username
: Connection 을 연결할 사용자 이름(오라클 사용자)
- password
: Connection 을 연결할 사용자 이름에 대한 비밀번호(오라클 암호)
- maxActive
: Connection Pool 이 제공할 최대 Connection 의 갯수
(사이트 최대 커넥션 사용량을 기준으로 지정. 동시 접속자 수를 감안하여 지정.)
- maxIdle
: 사용되지 않고 풀(pool)에 저장할 수 있는 최대 Connection 의 갯수
- maxWait
: 대기시간. 단위는 1/1000ch.
0 보다 작게 설정한 경우 무한히(응답을 받을 때 까지) 대기.

<br>

## 5.16. 16 ■ 모델2 기반의 MVC 패턴 ■

>- 디자인패턴: 여러 경우에 적용하는 공식(알고리즘)
>- 나중에 우리가 Spring 이라는 프레임워크에 들어가게 되면
어떤 생성문에 객체를 생성하는 것이 아니라,
컨테이너 안에서 조절하는 것 -> 의존성 주입(의존 객체 주입) -> 안에 부품을 결합시키는 것과 똑같음

### 5.16.1. ○ 개요
MVC 패턴에서 MVC는 각각 Model, View, Controller 를 의미하는 것으로
Model 은 데이터 또는 기본 기능(업무 로직)을 말하며,
View 는 유저 인터페이스를 말한다.
이 두가지는 시스템 개발에 있어서 반드시 필요한 부분이다.

MVC 패턴은 C 패턴이라고 불러도 괜찮을 만큼
한 마디로 말해 Controller 라는 레이어 계층을 두는 것이 가장 중요하다.
즉, Graphical User Interface 를 활용하는 과정에서
Model 과 View 계층 사이에
Controller 계층을 만들어 사용할 수 있도록 하는 것이다.

이렇게... 필수적인 두 계층 사이에
필수적이지 않은 다른 계층을 두는 이유는
두 계층(Model 과 View)이 직접적으로 결합되는 것을 막는 것으로
Controller 계층은 Model 계층과 View 계층 사이에서 결합을 막아준다.
Model 과 View의 직접적인 결합은 이 둘을 함께 바뀌도록 만들어 버린다.
이것을 Controller 계층이 막아준다는 것이다.
따라서... Controller 계층의 로직은 간단하게 설계해야 한다.

### 5.16.2. ○ Web Application 에서의 MVC 구조

JSP 는 로직과 프리젠테이션을 알맞게 구분하기 위해
Model2 구조를 지원하고 있으며,
Model2 구조의 개념과 구현 방법, 장단점 등을 이해하고
적용시키는 것이 중요하다.

- Model1 구조  
모델1 구조는 일반적으로 JSP 페이지만으로 구성되어 있는 구조를 말한다.
즉, JSP 페이지에서 동적인 부분(로직 부분)은 스크립릿으로 처리하고
그 외 나머지 부분은 템플릿으로 처리하는 구조인 것이다.
모델1과 모델2의 가장 큰 차이점은
클라이언트 요청의 진입 지점이 다르다는 것이다.

· 장점  
개발 시간이 단축된다.
단순한 페이지의 흐름을 바탕으로 MVC 구조에 대한
추가적인 이해가 필요하지 않다.

· 단점  
HTML, Javascript, JSP 로직이 한 페이지에 작성되어
어플리케이션이 복잡해질수록 유지보수가 힘들어진다. (거의 불가능)
디자이너와 개발자 사이에 밀접하고 원활한 소통이 요구된다.

- Model2 구조  
모델2구조는 JSP 와 Servlet 그리고 JavaBean 컴포넌트를 함께 사용하며,
모델2에서 클라이언트 요청의 진입하는 지점은 컨트롤러이며,
대부분의 웹 어플리케이션의 컨트롤러는 Servlet 이 담당한다.

· 장점  
로직과 프리젠테이션의 분리로 인해 어플리케이션이 명로해지고
유지보수나 확장이 용이하다.
디자이너와의 작업이 분리되어 있기 때문에
업무 진행이 원활하고 책임의 소재가 명확하다.

· 단점  
개발 초기에 아키텍처 디자인을 위한 분석... 구성... 등의
시간 소요로 개발 기간이 전체적으로 늘어난다.
MVC 구조에 대한개발자들의 이해를 필요로하며,
이에 대한 이유로 사전 교육 기간등이 소요될 수 있다.

### 5.16.3. ※ MVC(Model2) 구조

- 모델(Model)  
비즈니스 로직과 관련된 부분만 처리  
데이터베이스 관련 로직 구현  
Java Beans  

- 뷰(View)  
사용자에게 알맞은 화면을 보여주는 역할을 수행  
JSP  

- 컨트롤러(Controller)  
어플리케이션의 흐름 제어나 사용자의 요청 구현  
사용자 인증, 보안 설정, 전체 어플리케이션에 공통으로 영향을 주는 요소 구현  
사용자의 요청에 대해 알맞은 모델 사용  
사용자에게 보여줄 뷰 선택  
Servlet  

### 5.16.4. ※ MVC(Model2) 구현

- JSP 기반의 웹 어플리케이션에서 Controller 에 포함되어야 할 작업
· 웹 브라우저(클라이언트)의 요청을 받는다.  
· 웹 브라우저(클라이언트)가 요구하는 작업을 분석한다.  
· 요청한 작업을 처리하는 비즈니스 로직을 수행하는
모델(Model:JavaBean)을 사용한다.  
· 처리 결과를 request 또는 session 에 저장한다.  
· 적절한 뷰(View:JSP)를 선택하여
해당 뷰로 포워딩(forwarding)한다.  

- JSP 기반의 웹 어플리케이션에서 View 에 포함되어야 할 작업
· 서블릿(Servlet)에서 dispatcher.forwarding(request, response)로
해당 JSP 페이지와 request, response 를 공유한 경우
해당 JSP 페이지에서 request.getAttribute("result")와 같은 기능을 사용하여
결과를 화면에 표시할 수 있도록 처리한다.  

- JSP 기반의 웹 어플리케이션에서 Model 에 포함되어야 할 작업
· 컨트롤러(Controller)의 요청을 받는다.  
· 비즈니스 로직을 처리한다.  
· 처리한 비즈니스 로직의 결과를 컨트롤러(Controller)로 반환한다.  

-------------------------------------------------------------------------------------------------

### 5.16.5. ○ MVC 관련 실습1

- prj : WebApp24  
· web.xml           → URL 매핑  
· MVCBegin.Java     → Controllder 역할 (서블릿 클래스)  
· MVCBegin.jsp      → View 역할 (JSP 페이지)  

- 사용자 최초 요청 주소
http://localhost:3306/WebApp24/mvcbegin

-------------------------------------------------------------------------------------------------

### 5.16.6. ○ MVC 관련 실습2

- prj : WebApp25  
· web.xml            → URL 매핑  
· MVCTest01.Java     → Controllder 역할 (서블릿 클래스)  
· MVCTest01.jsp      → View 역할 (JSP 페이지)  

- 사용자 최초 요청 주소
http://localhost:3306/WebApp25/mvctest01

-------------------------------------------------------------------------------------------------

### 5.16.7. ○ MVC 관련 실습3

- prj : WebApp25  
· web.xml            → URL 매핑  
· MVCTest02.Java     → Controllder 역할 (서블릿 클래스)  
· MVCTest02Model.java  → Model 역할 (일반 자바 클래스)                ++  
· MVCTest02.jsp      → View 역할 (JSP 페이지)  

- 사용자 최초 요청 주소
http://localhost:3306/WebApp25/mvctest02

-------------------------------------------------------------------------------------------------

### 5.16.8. ○  폼(form) 데이터 전송 및 수신 과정 비교

※ MVC 패턴 적용 이전 단계와 MVC 패턴 적용 이후 단계를
반드시 비교하여 이해할 수 있도록 할 것

- A
· prj: WebApp26

· HelloSend01.html  
· HelloReceive01.jsp  

· 사용자 최초 요청 주소
http://localhost:3306/WebApp26/HelloSend01.html  

- B
· prj: WebApp27

· HelloSend02.html  
· HelloReceive02.jsp  
· web.xml

· 사용자 최초 요청 주소
http://localhost:3306/WebApp27/HelloSend02.html  

- C
· prj: WebApp28

· HelloSend03.html  
· HelloSend03Controller.java  
· HelloReceive03.jsp  
· HelloReceive03Controller.java  
· HelloReceive03Model.java  
· web.xml

· 사용자 최초 요청 주소
http://localhost:3306/WebApp28/hello

<br>

## 5.17. 17 ■ jQuery(제이쿼리) ■

>- 자바스크립트로 가능한 문법은 제이쿼리로 가능하고, 제이쿼리로 가능한 것은 자바스크립트로 가능하다.
>- 자바스크립트로 가능하다면 왜 쓸까? -> 제이쿼리가 자바스크립트보다 축약해서 작성 가능

### 5.17.1. ○ 개요

- jQuery 는 빠르고 간결한 Javascript Library
- HTML Document traversing, 이벤트 처리, 애니메이션,
AJAX 를 단순화 하여 빠른 웹 개발을 가능하게 한다.
- CSS 규격 지원: CSS 1 ~ 3 와 기본 XPath 지원.
- 다양한 브라우저 지원.
- 경량 파일(약 90kb 수준의 파일 크기)
- John Resig 에 의해 개발.

### 5.17.2. ○ jQuery 를 사용함으로써 얻을 수 있는 장점

- HTML 과 DOM, CSS 의 변경이 간편하다.
- 이벤트 처리가 편하다.
- 애니메이션과 같은 각종 효과를 적용하기 쉽다.
- AJAX, JSON 과 같은 처리가 간편하다.
- 브라우저 호환성을 해결할 수 있다.

### 5.17.3. ○ jQuery 다운로드 및 라이브러라 포함

- jQuery 다운로드
http://jquery.com/

- jQuery 를 사용하기 위한 라이브러리 포함
1. 로컬 PC 저장소에 물리적으로 존재할 때
(즉, 제이쿼리 파일을 다운로드 받은 경우,
특정 디렉터리 안에 들어있을 때 그 경로까지 지정해주어야 한다.)
```html
<script type="text/javascript" src="jquery.x.x.x.js"></script>
```
2. CDN으로 경로 지정
```html
<script type="text/javascript" src="http://code.jquery.com/jquery.x.x.x.js"></script>
```

- jQuery UI 를 사용하기 위한 CSS 및 라이브러리 포함
```html
<link rel="stylesheet" href="jquery-ui.css"></link>
<script type="text/javascript" src="jquery.x.x.x.js"></script>
<script type="text/javascript" src="jquery-ui-.x.x.x.custon.min.js"></script>
```
또는
```html
<link rel="stylesheet" href="http://code.jquery.com/ui/.....css"></link>
<script type="text/javascript" src="http://code.jquery.com/ui/.....js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/...-ui.js"></script>
```

### 5.17.4. ○ jQuery 의 사용 방법(2가지)

1. http://jquery.com/ 에서 파일을 다운로드하여 사용하는 방법
※ 다운로드 받을 수 있는 종류
- 『production』 버전  
: 소스를 압축(불필요한 공백 및 개행 제거)해서 웹 서버에서 빠르게 실행할 수 있도록 경량화/최소화 한 버전.
- 『development』 버전  
: 테스트나 디버깅 또는 코드에 대한 분석을 위해
	압축을 하지 않고 가독성을 높인 버전.
	(공백 및 개행 처리가 되어있음.)

2. CDN(Content Delivery Network) 을 통해 사용하는 방법
별도의 파일을 다운로드 받을 필요 없이
『<script type="text/javascript" 
	src="http://code.jquery.com/jquery-x.x.x.js"></script>』
와 같은 구문을 통해 참조하여 포함시킨다.

### 5.17.5. ○ jQuery 참조 및 학습 사이트
- http://try.jquery.com/
- http://learn.jquery.com/
- http://www.w3schools.com/jquery/


<br>

## 5.18. ■ AJAX(에이작스) ■

○ 개요

AJAX 는 XML 에 기반한 종합 기술로
**비동기** 자바스크립트 XML (Asychronous Javascript And Xml) 을 줄인 말로 자바스크립트로 HTTP 요청을 보내서 XML 응답을 받아 사용하는 기술이다.

AJAX 는 하나의 독립된 기술이.. 아니다.
화면은 HTML + CSS 로 구성 및 작성하고
화면에 대한 조작과 상호작용은 문객체모델(Document Object Model: DOM) 로 처리하고
데이터 교환은 XML 형식으로 처리하며,
데이터 변환과 검색은 XML 기술인 XSL 과 XPath 를 사용하며,
비동기 통신에는 웹 브라우저 안에 내장되어 있는 
XMLHttpRequest 객체를 사용하고, 이 모~~~든 것을 하나로 묶어주는 개념으로
Javascript / jQuery 를 사용한느 것.
이 것을 AJAX 라고 한다.

○ 특징

- 비동기 자바스크립트 XML
- 자바스크립트로 HTTP 요청을 보내서 XML 응답을 받아 사용
- 처리 과정  
	① HTTP 요청을 보냄  
	② XML 문서를 응답으로 받음  
	③ 자동으로 XML 객체 생성  
	④ 자바스크립트는 XML 객체에 접근하여 다양한 작업을 수행  

==> HTML+CSS, DOM, XML, XSLT, XPath, XMLHttpRequest, Javascript 를 합쳐서 사용

<br>

## 5.19. 

<br>

## 5.20. 

<br>

## 5.21.  코드
### 5.21. 1. jsptest001.jsp_디렉티브 영역, 스크립 릿 영역
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
### 5.21. 2. jsptest002.jsp_『out』 출력 스트림, 『out.println』-> 띄어쓰기,『\n』-> 띄어쓰기,『<br>』 -> 개행
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

### 5.21. 3. jsptest003.jsp_『_jspInit()』 메소드, 『_jspDestroy()』 메소드, 『_jspService()』 메소드
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

### 5.21. 4. jsptest004.java_서블릿 관련 실습
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

#### 5.21. 4.1. web.xml
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

### 5.21. 5. [HttpServlet 관련 실습]

#### 5.21. 5.1. jsptest005.html_HttpServlet 관련 실습(HttpServlet 을 상속받는 클래스로 설계)
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

#### 5.21. 5.2. Test005.java_요청받은 내용을 응답(출력스크림 구성)
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
#### 5.21. 5.3. web.xml_ jsp와 java를 servlet을 통해 연결
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
#### 5.21. 5.4. ResponseSample.html_HTML 코드 작성을 위한 샘플
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

### 5.21. 6. [JSP를 이용한 데이터 송수신 실습 01]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/326337d8-a76b-4590-b108-168264be3244)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/bc8a3c57-7d1c-4844-87f3-bbe170470bba)

#### 5.21. 6.1. Hap.jsp_JSP를 이용한 데이터 송수신 실습 01
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
#### 5.21. 6.2. HapOk.jsp_JSP를 이용한 데이터 송수신 실습 01
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

### 5.21. 7. [JSP를 이용한 데이터 송수신 실습 02]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/007b1ada-dadf-484b-887d-e83358bd545f)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/6fff8b6b-67b1-41f4-94ae-acd78b2b3b94)

#### 5.21. 7.1. Gugudan.jsp_JSP를 이용한 데이터 송수신 실습 02
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
#### 5.21. 7.2. GugudanOk.jsp_JSP를 이용한 데이터 송수신 실습 02
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

### 5.21. 8. [radio, select 데이터 전송]
// 한글 깨짐 방지 처리
request.setCharacterEncoding("UTF-8"); // check~!!!
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/4e792111-3132-497d-a2d8-f5585244190b)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/3d2c33ad-ee4d-4a91-a5bf-e1f827eb2dc8)

#### 5.21. 8.1. RadioSelect.jsp_radio, select 데이터 전송
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
#### 5.21. 8.2. RadioSelectOk.jsp_radio, select 데이터 전송
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

### 5.21. 9. [checkbox 데이터 전송]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/882d217e-3801-40c1-b494-9703270fc9c8)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/04b548f3-bd7c-404d-9d18-f095fd032e4d)


#### 5.21. 9.1. CheckBox.jsp_checkbox 데이터 전송
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
#### 5.21. 9.2. CheckBoxOk.jsp_checkbox 데이터 전송
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

### 5.21. 10. [JSP를 이용한 데이터 송수신 실습 05]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e7f49e2c-cbbe-42a5-bff4-d146fef87033)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/8d8f11e7-8abf-4e40-8beb-157ee46822f2)


#### 5.21. 10.1. Table.jsp_JSP를 이용한 데이터 송수신 실습 05
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
#### 5.21. 10.2. TableOk.jsp_ JSP를 이용한 데이터 송수신 실습 05
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

### 5.21. 11. [디렉티브/ WebApp06]

#### 5.21. 11.1. Test001.jsp_page 디렉티브 buffer 속성 및 autoFlush 실습
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
#### 5.21. 11.2. Test002.jsp_include 디렉티브 실습
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
#### 5.21. 11.3. Test003.jsp_include 디렉티브와 관련한 실습 진행중
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

### 5.21. 12. [이름과 성적 데이터를 입력받는 html 페이지]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/537c4fbd-8b1a-41e4-81c4-87a6226143f1)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/ac2992b1-470e-421b-a27a-240823cf174f)

#### 5.21. 12.1. Sand01.html_데이터 송수신 실습 01
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
#### 5.21. 12.2. Receive01.jsp_데이터 송수신 실습 01
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

### 5.21. 13. [이름과 성적 데이터를 입력받는 html 페이지]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e359ec7e-21ff-4a9a-a2a4-d43153ab5daa)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/cd79a7e5-5226-4939-9204-037bb13c3fbd)

#### 5.21. 13.1. Send02.html_데이터 송수신 실습 02
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
#### 5.21. 13.2. Receive02.jsp _데이터 송수신 실습 02
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


### 5.21. 14. [두 개의 정수와 연산자를 입력받는 html 페이지]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/d1dde9a2-1852-4237-990c-ae3a318a8900)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/28819f73-0c88-447a-8943-13108a239126)

#### 5.21. 14.1. Send03.html_데이터 송수신 실습 03
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
#### 5.21. 14.2. Receive03.jsp _데이터 송수신 실습 03
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


### 5.21. 15. [회원 가입과 관련한 기본 정보를 입력받는 html 페이지]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/50eaca82-4aec-4aca-b942-e03d5daf313c)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/58112152-afad-4385-bce8-e12409ccf919)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/cb923124-d24f-470d-8f90-f34ac183f3ef)

#### 5.21. 15.1. Send04.html_데이터 송수신 실습 04
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
#### 5.21. 15.2. Receive04.jsp_데이터 송수신 실습 04
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


### 5.21. 16. [구구단 결과를 출력하는 JSP(Receive05.jsp)]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/8bf07065-0bc3-4bc2-9446-60d45ad95b52)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/55123adf-6384-4592-83d5-7f5b1ec15719)

#### 5.21. 16.1. Send05.html_데이터 송수신 실습 05
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
#### 5.21. 16.2. Receive05.jsp_ 데이터 송수신 실습 05
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


### 5.21. 17. [이전 페이지(SendAndReceive06.jsp -> 자기자신)로부터 넘어온 데이터 수신]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/3939aa38-80c5-474a-9d7e-0363ee7afb0d)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/292e7bb3-7839-4ee2-951a-edec2955f02f)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/5b7feaf6-d22c-46a8-b96f-6d498e95b710)

#### 5.21. 17.1. SendAndReceive06.jsp_데이터 송수신 실습 06
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

### 5.21. 18. SendAndReceive07_1.html_데이터 송수신 실습 07_달력을 출력하는 JSP 페이지
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

### 5.21. 19. SendAndReceive08.jsp_데이터 송수신 실습 08_달력을 출력하는 JSP 페이지
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


### 5.21. 20. [포워딩과 리다이렉트]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/898915c5-e3c4-456a-a058-814ef4770a10)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/414dd208-f23d-4e54-a77d-abb840d60f79)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/1bd56ba2-7cdf-4179-9693-77d961b51bd2)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/9c11cefc-ec7c-4459-a0c2-a0b2b4ebf026)

#### 5.21. 20.1. Send09.jsp_포워딩과 리다이렉트
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
#### 5.21. 20.2. Send09_re.jsp_포워딩과 리다이렉트
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
#### 5.21. 20.3. Send09_for.jsp_포워딩과 리다이렉트
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
#### 5.21. 20.4. Receive09.jsp_포워딩과 리다이렉트
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

### 5.21. 21. [■ 포워딩 / 리다이렉트 관련 중요한 실습(forward 처리) ■]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/fc0ecc99-4a9c-466f-a803-ebc2e6f570dc)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/ccef45a1-a7ea-4ea4-858a-96cbbfaa966a)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/5660ea3f-37fb-44ce-a4f0-5140370d9cae)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/4e34682b-c20d-4f54-ab2f-492406ae0ceb)

#### 5.21. 21.1. Send10.jsp_사용자 최초 요청 페이지
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>
 
<!-- ■■■ 포워딩 / 리다이렉트 관련 중요한 실습 ■■■ -->
 
<!-- ① 사용자 최초 요청 페이지 -->
<!-- 	사칙 연산 수행을 위한 정수 입력 페이지 구성 -->
<!-- 	연산자를 함께 입력받을 수 있도록 처리 -->
<!-- 	정수1/ 정수2/ 연산자 -->
<!-- 	http://localhost:3306/WebApp07/Send10.jsp -->
 
<!-- ② 연산 전용 페이지 -->
<!-- 	스크립트 코드만 존재 (+ jsp:forward 액션 태그) -->
<!-- 	-> 추후 이 코드를 독립적인 java로 분리 -> Servlet으로 구성할 예정 -->
<!-- 	http://localhost:3306/WebApp07/Forward10.jsp -->
 
<!-- ③ 최종 결과 출력 페이지 -->
<!-- 	연산 전용 페이지에서 처리한 결과를 넘겨받아 클라이언트와 대면할 페이지로 구성 -->
<!-- 	-> 추후 이 페이지는 jsp view 페이지의 역할을 수행할 예정 -->
<!-- 	http://localhost:336/WebApp07/Receive10.jsp -->
 
<div class="layout">
	<!-- JSP 액션 태그 활용하여 forward 처리하는 페이지로...  -->
	<!-- <form action="Forward10.jsp" method="post"> -->
 
	<!-- JSP 액션 태그 없이 forward 처리하는 페이지로 ... -->
	<form action="Forward10_1.jsp" method="post">
		<div>
			정수1
			<input type="text" name="num1" class="txt" style="width: 60px;">
			
			<select name="calResult">
				<option selected="selected">연산선택</option>
				<option value="1">더하기</option>
				<option value="2">빼기</option>
				<option value="3">곱하기</option>
				<option value="4">나누기</option>
			</select>
			정수2
			<input type="text" name="num2" class="txt" style="width: 60px;">
			
			<button type="submit" class="btn control">확인</button>
		</div>
	</form>
</div>
 
</body>
</html>
```
#### 5.21. 21.2. Forward10.jsp_연산 전용 페이지
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Forward10.jsp
	
	// 이전 페이지(Send10.jsp)로 부터 넘어온 데이터 수신
	// -> num1, calResult, num2
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String calResult = request.getParameter("calResult");
	
	int num1 = 0;
	int num2 = 0;
	String result = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(calResult.equals("1"))		// 더하기
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if (calResult.equals("2")) // 빼기
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if (calResult.equals("3"))	// 곱하기
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if (calResult.equals("4"))	// 나누기
			result = String.format("%d / %d = %.1f", num1, num2, (num1/num2));
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	// 요청에 내용 추가
	request.setAttribute("resultStr", result);
	// **파라미터값에는 요청한 내용 뿐 아니라 get 한 모든 내용 처리 가능**
	// **맵 자료구조. 객체의 형태로 가져옴**
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward10.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<!-- JSP 액션 태그를 활용한 forward 처리 -->
<jsp:forward page="Receive10.jsp"></jsp:forward>
 
</body>
</html>
```
#### 5.21. 21.3. Forward10_1.jsp_연산 전용 페이지
``` html
<%@ page contentType="text/html; charset=UTF-8"%>	<!-- **JSP라는 정체성. 지우면 안됨** -->
<%
	// Forward10.jsp
	
	// 이전 페이지(Send10.jsp)로 부터 넘어온 데이터 수신
	// -> num1, calResult, num2
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String calResult = request.getParameter("calResult");
	
	int num1 = 0;
	int num2 = 0;
	String result = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(calResult.equals("1"))		// 더하기
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if (calResult.equals("2")) // 빼기
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if (calResult.equals("3"))	// 곱하기
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if (calResult.equals("4"))	// 나누기
			result = String.format("%d / %d = %.1f", num1, num2, (num1/num2));
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	// 요청에 내용 추가
	request.setAttribute("resultStr", result);
	// **파라미터값에는 요청한 내용 뿐 아니라 get 한 모든 내용 처리 가능**
	// **맵 자료구조. 객체의 형태로 가져옴**
	
	// check~!!!
	RequestDispatcher dispatcher = request.getRequestDispatcher("Receive10.jsp");
	dispatcher.forward(request,response);
	
	/* ==========================================================================
	■■■ 『RequestDispatcher』 인터페이스 ■■■
	// **서블릿 컨테이너가 쓰는 도구**
	
	※ 이 인터페이스는 『forward()』와 『include()』 만 있다.  
	
	※ 처리 과정 및 개념  
	
		일반적으로 HttpSevlet 을 상속받는 클래스... 서블릿  
		
		이렇게 작성된 클래스 내부에는  
		실제 요청을 서비스 하는 『doGet()』과 『doPost()』 메소드가 정의되어 있으며 (service()메소드가 이들의 상위 메소드)  
		
		**SevletConatiner** 는 **『HttpSevlet』의 인스턴스를 생성**하고	**『init()』 메소드를 실행**해주고,  
		이 메소드에 의해 매핑된 URL에 (페이지 요청 방식에 따라) **doGet()과 doPost() 중 선택하여 메소드를 호출**해주고(실행시켜주고)  
		Container 가 종료될 때 **『distroy()』 메소드를 호출**해주고, 관련된 처리 과정이 마무리 된다.  
		
		즉, SevletConatiner 가  
		inint()		-> 처음  
		seveice()	-> 중간중간 요청이 있을 때마다  
		destroy()	-> 마지막  
		메소드를 호출한다.(절대 우리가 직접 호출하는 것이 아니다~!!!)  
		
		결국 『HttpSevlet』은 하나의 인스턴스만 생성되어 멀티 스레딩으로 돌아가게 된다.  
		// **스레드: 하나의 작업단위,**   
		// **멀티스레드: 처음에 연사람A, 다음사람이 열고 수정B, A가 닫으면 순서가 꼬일 수 있으므로 규칙을 만들어 무결성을 해치지 않는게 중요**  
		// **ㄴ 멀티 스레드 세이프티 vs. 멀티 스레드 언세이프티**		
		
		이렇게 구성되는 『HttpSevlet』의 상속된 클래스의 인스턴스는 스레드에 안전하게 설계(스레드 세이프티)되어야 하고  
		따라서 스레드에 안전하게 설계되지 않은 경우 상위 클래스를 마구 접근하게 되어 에러가 발생할 수 밖에 없다.  
		
		이와 같은 이유로 환경 설정이나 J2EE 서비스에 관한 내용은 『ServletContext』 에서 할 수 있게 된다.  
		(※ ServeletContext : 서블릿에 대한 환경, 상태 등을 설정할 수 있는 객체)  
		이 『ServeletContext』는 『getServletContext()』로만 받을 수 있다.  
		그렇기 때문에 이 『getServletContext()』는 동기화가 제대로 구현되어 있을 것이라고 예측할 수 있다.  
		그 이유는 멀티 스레드가 안전하게 설계(세이프티)되어 있어야  
		우리가 『ServeltContext』의 『setAttribute()』나 『getAttribute()』를 스레드 걱정없이 마음대로 읽고 쓸 수 있기 때문이다.  
		
		『SevletContext』의 또 다른 커다란 기능 중 하나는  
		다른 서블릿 인스턴스를 가져올 수 있다거나 서블릿 환경 설정값을 가져올 수 있는 기능이다.  
		
		**『RequestDispatcher』** 역시 그 기능 중의 하나이다.  
		사전적인 의미로는... 요청을 제공하는 **도구**. 즉, 요청을 보내주는 **인터페이스**이다.  
		
		현재... 요청을 다른 서블릿(혹은 JSP)으로 보내야하는 상황.  
		그런데, 위에 언급한 바와 같이 서블릿의 인스턴스는 하나만 생성되고 이것이 멀티 스레딩으로 돌아가고 있다.  
		
		그렇기 때문에 새로운 서블릿을 그 서블릿을 실행하는 거산으로는 안되고  
		이미 돌아가고 있는 서블릿 인스턴스의 스레드를 하나 더 추가해야 한다.  
		이것은 서블릿 개발자가 처리해야 할 영역을 벗어났기 때문에 이 일은 『Dispatcher』가 대신 수행해 준다는 것이다.  
		
		하지만 이 『Dispatcher』는  
		『HttpServletRequest』,『HttpSevletResponse』를 생성해 줄 수 없다.  
		그렇기 때문에 『Dispatcher』가 생성해준 새로운 서블릿 스레드를 실행시키기위해 『doGet()』이나 『doPost()』를 호출해야 한다.
		
		이와 같은 이유로 『dispatcher.forward(request, response);』구문을 통해 request 와 response 를 넘겨주는 것이다.
		
		
	============================================================================= */
	
%>
```

#### 5.21. 21.4. Receive10.jsp_최종 결과 출력 페이지
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Forward10.jsp)로 부터 넘어온 데이터 수신
	// -> resultStr
	
	// **setAttribute 한 내용은 무조건 getAttribute 한다. 모든 것을 담을 수 있으므로 Object 형**
	String result = (String)request.getAttribute("resultStr");	// 다운캐스팅
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>
 
<div>
	<!-- <h2>연산 결과: 235</h2> -->
	<h2>연산 결과: <%=result %></h2>
</div>
 
</body>
</html>
```

### 5.21. 22. [■ 포워딩 / 리다이렉트 관련 중요한 실습( redirect 처리)■]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/dd28973b-a568-48c6-81d9-3bd80616e9e5)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/ce1759df-397b-4488-a6b3-7b0cc16e38dc)

#### 5.21. 22.1. Send11.jps_사용자 최초 요청 페이지
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send11.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>
 
<!-- ■■■ 포워딩 / 리다이렉트 관련 중요한 실습 ■■■ -->
 
<!-- ① 사용자 최초 요청 페이지 -->
<!-- 	사칙 연산 수행을 위한 정수 입력 페이지 구성 -->
<!-- 	연산자를 함께 입력받을 수 있도록 처리 -->
<!-- 	정수1/ 정수2/ 연산자 -->
<!-- 	http://localhost:3306/WebApp07/Send11.jsp -->
 
<!-- ② 연산 전용 페이지 -->
<!-- 	스크립트 코드만 존재 (response.sendRedirect() 메소드 포함) -->
<!-- 	-> 추후 이 코드를 독립적인 java로 분리 -> Servlet으로 구성할 예정 -->
<!-- 	http://localhost:3306/WebApp07/Forward11.jsp -->
 
<!-- ③ 최종 결과 출력 페이지 -->
<!-- 	연산 전용 페이지에서 처리한 결과를 넘겨받아 클라이언트와 대면할 페이지로 구성 -->
<!-- 	-> 추후 이 페이지는 jsp view 페이지의 역할을 수행할 예정 -->
<!-- 	http://localhost:336/WebApp07/Receive11.jsp -->
 
<div class="layout">
 
	<!-- redirect 처리하는 페이지로 ... -->
	<form action="Forward11.jsp" method="post">
		<div>
			정수1
			<input type="text" name="num1" class="txt" style="width: 60px;">
			
			<select name="calResult">
				<option selected="selected">연산선택</option>
				<option value="1">더하기</option>
				<option value="2">빼기</option>
				<option value="3">곱하기</option>
				<option value="4">나누기</option>
			</select>
			정수2
			<input type="text" name="num2" class="txt" style="width: 60px;">
			
			<button type="submit" class="btn control">확인</button>
		</div>
	</form>
</div>
 
</body>
</html>
```
#### 5.21. 22.2. Forward11.js_연산 전용 페이지
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect11.jsp
	
	// 이전 페이지(Send11.jsp)로 부터 넘어온 데이터 수신
	// 	-> num1, calResult, num2
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("calResult");
	
	// 연산 처리
	String str ="";
	if (op.equals("1"))
		str += String.format("%d", (num1+num2));
	else if(op.equals("2"))
		str += String.format("%d", (num1-num2));
	else if(op.equals("3"))
		str += String.format("%d", (num1*num2));
	else if(op.equals("4"))
		str += String.format("%.1f", (num1/(double)num2));
	
	// check~!!!
	// 사용자에게 요청할 페이지를 안내
	//response.sendRedirect("Receive11.jsp");
	
	// check~!!!
	// 결과 데이터 재전송 -> sendRedirect() 메소드 사용
	// ※ response 객체의 중요 메소드 중 하나인 
	// 『sendRedirect(String location)』: 지정된 URL(location)로 요청을 재전송한다.
	//		즉, 사용자가 다시 해당 요청을 수행할 수 있도록 한내한다.
	response.sendRedirect("Receive11.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
	//-- 클라이언트에 Receive11.jsp 페이지를 다시 요청할 수 있도록 안내~!!!
	//	이에 더하여... get 방식의 요청 URL 구성을 통해 넘길 데이터 처리~!!!
	
%>
```
#### 5.21. 22.3. Receive11.jsp_최종 결과 출력 페이지
``` html
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Redirect11.jsp)로 부터 넘어온 데이터와 수신
	// 『Receive11.jsp?num1=27&num2=27&op=4&str1.0』와 같은 형태~!!! check~!!!
	//-- 직접 Redirect11.jsp 로 부터 데이터를 넘겨받는 것이 아니라
	//	클라이언트가 새로운 요청을 하는 과정에서 넘긴 값을 수신하게 되는 개념~!!! check~!!!
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String str = request.getParameter("str");
	
	if(op.equals("1"))
		op = "+";
	else if(op.equals("2"))
		op = "-";
	else if(op.equals("3"))
		op = "*";
	else if(op.equals("4"))
		op = "/";
	
	String strResult = String.format("%s %s %s = %s", num1, op, num2, str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
 
<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>
 
<div>
	<!-- <h2>연산 결과: 223</h2> -->
	<h2>연산 결과: <%=strResult %></h2>
</div>
 
</body>
</html>
```

### 5.21. 23. Test001.jsp_ 데이터베이스 연결 실습
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/9b0b41bb-119b-4641-b965-701c86b29b84)
``` html
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "";

	try
	{
		Connection conn = DBConn.getConnection();
		
		if(conn != null)
			str += "데이터베이스 연결 성공~!!!";
	}
	catch(Exception e)
	{
		//System.out.println(e.toString());
		
		str += e.toString();
	}
%>
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
	<h1>데이터베이스 연결 실습</h1>
	<hr>
</div>

<div>
	<!-- <h2>확인결과 : 데이터베이스 연결 성공~!!!</h2> -->
	<h2>확인결과 : <%=str %></h2>
</div>

</body>
</html>
```

### 5.21. 24. [데이터베이스 연결 및 데이터 처리]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/29ed8371-f396-4237-b8d1-c83804bb4157)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/fa9bc74c-b379-4deb-b5dc-c061b3533799)

#### 5.21. 24.1. WebApp08_scott.sql
``` sql
SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;


-- 휴지통 비우기
PURGE RECYCLEBIN;
--==>> RECYCLEBIN이(가) 비워졌습니다.

SELECT *
FROM TAB;

-- 기존 테이블 제거
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.

--------------------------------------------------------------------------------

--○ 실습 테이블 생성(TBL_MEMVER)
CREATE TABLE TBL_MEMBER
( SID NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMEBER이(가) 생성되었습니다.


--○ 시퀀스 생성 (MEMBERSEQ)
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.


--○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID,NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '문정환', '010-1111-1111');
--> 한줄구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '문정환', '010-1111-1111')
;

--○ 샘플 데이터 추가 입력
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '정한울', '010-2222-2222')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '최혜인', '010-3333-3333')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '길현욱', '010-4444-4444')
;


--○ 테이블 전체 조회 쿼리문 구성(리스트 확인)
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	문정환	010-1111-1111
2	정한울	010-2222-2222
3	최혜인	010-3333-3333
4	길현욱	010-4444-4444
*/

--○ 인원 수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> 한줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 4

--○ 커밋
COMMIT;
--==>> 커밋 완료.
```

#### 5.21. 24.2. Test002.jsp_데이터베이스 연결 및 데이터 처리
``` html
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/* **현재는 String을 쓰지만, 나중에는 String Buffer나, Stringbuilder 써야함** */

	// 결과값 변수
	String str ="";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(select)
	String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
	
	// 작업 객체 실행 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	
	ResultSet rs  = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 -> 반복문 구성
	str += "<table class ='table' style='width: 100%;'>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='telTitle'>전화번호</th>";
	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td>"+rs.getString("SID")+"</td>";
		str += "<td>"+rs.getString("NAME")+"</td>";
		str += "<td>"+rs.getString("TEL")+"</td>";
		str += "</tr>";
			
	}
	str += "</table>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	input {width: 200px;}
	button {width: 208px; height: 50px; font-weight: bold;}
	#numTitle {width: 50px;}
	#nameTitle {width: 100px;}
	#telTitle {width: 160px;}
	.errMsg {font-weight: small; color: red;}
	.table tr:not(first-child){text-align: center;}
</style>

</head>
<body class="section">

<script type="text/javascript">
// 필수 입력 항목 (-> 이름)에 대한 기본적인 입력 화면
function formCheck()
{
	//alert('함수 호출~!!!');
	
	var uName = document.getElementById("userName");
	var uErr = document.getElementBId("nameErr");
	
	nameErr.style.display = "none";
	
	if(uName.value=="")
	{
		nameErr.style.display="inline";
		return false;
	}
	
	return false;
}
</script>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div class="layout">
	<!-- 데이터 입력 -->
	<form class="_box" action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table style="background:white;">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameErr">이름을 입력해야 합니다.</span>	
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="userTel" name="userTel" class="txt"></td>
			</tr>
			<tr>
				<th></th>
				<td><button type="submit" id="btnAdd" class="btn control">데이터 추가</button></td>
			</tr>
		</table>
	</form>
	
	<div  class="result_box">
	<%=str %>
	<!-- 처리결과 -->
		<!-- <table class ="table" style="width: 100%;">
			<tr>
				<th id="numTitle">번호</th>
				<th id="nameTitle">이름</th>
				<th id="telTitle">전화번호</th>
			</tr>
			<tr>
				<td>5</td>
				<td>박나영</td>
				<td>010-5555-5555</td>
			</tr>
			<tr>
				<td>6</td>
				<td>정현욱</td>
				<td>010-6666-6666</td>
			</tr>
		</table> -->
	</div>
</div>

</body>
</html>
```
#### 5.21. 24.3. Memberinsert.jsp_이전 페이지(Test002.jsp)로 부터 넘어온 데이터 수신
``` html
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 이전 페이지(Test002.jsp)로 부터 넘어온 데이터 수신
	// -> userName, userTel
	
	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(insert)
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
			+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);
	
	// DB 액션 처리 -> 작업 객체 생성 및 쿼리문 수행
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result <1)
	{
		// 입력 액션 처리가 정상적으로 이루어지지 않은 경우
		response.sendRedirect("Error.jsp");
		//-- 내가 잘 아는 에러 페이지 소개시켜줄게..
	}
	else
	{
		// 입력 액션 처리가 정상저긍로 이루어진 경우
		response.sendRedirect("Test002.jsp");
		//-- 이 페이지로 오기 전에 네가 머물던 리스트 페이지 주소를 새롭게 다시 요청해서 찾아가봐~!!!
		//	네가 입력하려는 내용이 추가된 상태로 리스트의 내용이 바뀌어 있을거야...
	}
	
%>
```

## 5.21. JSP, JAVA, SQL 통합
### 5.21.1. [이름, 국어점수, 영어점수, 수학점수를 입력받아 총점과 평균을 계산하여 리스트를 출력]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/d9fd8210-9ae4-4d51-9802-202a0040eb2a)

#### 5.21.1.1. WebApp09_scott.sql
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
#### 5.21.1.2. ScoreList.jsp
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
#### 5.21.1.3. ScoreInsert.jsp
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

### 5.21.2. [데이터베이스 연동 회원관리 실습]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/c002fc3c-c4c4-4dcd-8434-e569400c20d3)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/743af3f7-cfb0-400f-8da0-fe9a61f80bf9)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/9f82e9a0-4231-4d3b-b74d-e5cff6db6f30)


#### 5.21.2.1. WebApp10_scott.sql
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
#### 5.21.2.2. MemberDAO.java
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
#### 5.21.2.3. MemberDTO.java
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
#### 5.21.2.4. Memberinsert.jsp
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
#### 5.21.2.5. MemberList.jsp
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

### 5.21.3. [성적 리스트 출력 프로그램(ver.2)]
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/668ccd72-dd1c-4e2c-bee4-4f0f26494118)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/748a4330-b31c-4b5d-9f19-3c03c12af2ea)


#### 5.21.3.1. WebApp11_scott.sql
>> 9와 동일<<
#### 5.21.3.2. ScoreDTO.Java
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
#### 5.21.3.3. ScoreDAO.Java
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
#### 5.21.3.4. ScoreList.jsp
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
#### 5.21.3.5. ScoreInsert.jsp
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

### 5.21.4. [회원 성적 관리 및 출력 페이지(ver.2)]

#### 5.21.4.1. WebApp12_scott.sql
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
#### 5.21.4.2. MemberDAO.java
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
#### 5.21.4.3. MemberDTO.java
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
#### 5.21.4.4. MemberScoreDAO.java
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
#### 5.21.4.5. MemberScoreDTO.java
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
#### 5.21.4.6. MemberDelete.jsp
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
#### 5.21.4.7. MemberInsert.jsp
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
#### 5.21.4.8. MemberInsertForm.jsp
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
#### 5.21.4.9. MemberScoreDelete.jsp
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
#### 5.21.4.10. MemberScoreInsert.jsp
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
#### 5.21.4.11. MemberScoreInsertForm.jsp
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
#### 5.21.4.12. MemberScoreSelect.jsp
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

#### 5.21.4.13. MemberScoreUpdate.jsp
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
#### 5.21.4.14. MemberScoreUpdateForm.jsp
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
#### 5.21.4.15. MemberSelect.jsp
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
#### 5.21.4.16. MemberUpdate.jsp
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
#### 5.21.4.17. MemberUpdateForm.jsp
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
#### 5.21.4.18. Notice.jsp
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

------------------------------------------------

### 5.21.2. []

#### 5.21.3.1. WebApp11_scott.sql
``` sql
```
#### 5.21.3.2. ScoreDTO.Java
``` java
```
#### 5.21.2.3. ScoreDAO.Java
``` java
```
#### 5.21.2.4. ScoreList.jsp
``` html
```
#### 5.21.2.5. ScoreInsert.jsp
``` html
```

### 5.21.3. []

#### 5.21.3.1. .jsp
``` html
```
#### 5.21.3.2. .jsp
``` html
```

### 5.21.4. []

#### 5.21.4.1. .jsp
``` html
```
#### 5.21.4.2. .jsp
``` html
```

### 5.21.5. []

#### 5.21.5.1. .jsp
``` html
```
#### 5.21.5.2. .jsp
``` html
```

### 5.21.6. []

#### 5.21.6.1. .jsp
``` html
```
#### 5.21.6.2. .jsp
``` html
```



### 5.21. . []

#### 5.21. .1. .jsp
``` html
```
#### 5.21. .2. .jsp
``` html
```



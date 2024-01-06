# 5. 

## 5.5. 05 ■ JSP(Java Server Page) ■
#### 5.5.1.1. JSP(Java Server Pages): 웹 프로그램 작성 언어의 한 종류
#### 5.5.1.2. JSP(Java Server Pages)는 동적(Dynamic)인 웹 페이지를 비교적 간단히 만들 수 있는 방법을 제공하는 자바를 기반으로 하고 있는 스크립트(Server Side Script)로
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

`<jsp:param>` 태그는 요청한 페이지로 정보를 전달할 때 사용하는 태그로 현재 페이지에서 요청한 페이지로 인자(parameter)와 인자값(value) 형태로 넘겨준다.

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
예를 들어, `<someTags:aTag>` 액션 태그 엘리먼트의 속성은 `attribute` 이고 속성값은 `<% pageContent.getAttribute("aName")%>` 인 경우

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

### 5.18.1. ○ 개요

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

### 5.18.2. ○ 특징

- 비동기 자바스크립트 XML
- 자바스크립트로 HTTP 요청을 보내서 XML 응답을 받아 사용
- 처리 과정  
	① HTTP 요청을 보냄  
	② XML 문서를 응답으로 받음  
	③ 자동으로 XML 객체 생성  
	④ 자바스크립트는 XML 객체에 접근하여 다양한 작업을 수행  

==> HTML+CSS, DOM, XML, XSLT, XPath, XMLHttpRequest, Javascript 를 합쳐서 사용

### 5.18.3. ○ 장점

- 비동기 통신을 사용함으로써 데이터를 보내고 나서도 사용자는 다른 작업을 수행할 수 있다.
- 데이터만 들어가있는 형식으로 응답을 받았기 때문에 전통적인 웹 어플리케이션 방식에 비해 서버 처리속도가 빠르고 전송 데이터 양도 훨씬 적다.
- 응답으로 받은 XML 문서를 XML 객체로 접근하여 스크립트로 조작하고 XPath 를 사용하여 XML 문서를 검색하거나 XSL 을 사용하여 변환을 할 수 있다.
    따라서 실행 속도가 빠르다.
- 불필요한 데이터 요청을 최소화할 수 있고 많은 일들이 클라이언트인 웹 브라우저에서 처리될 수 있다.

### 5.18.4. ○ 단점
- 외부 검색 엔진이 웹페이지를 검색할 수 없는 문제가 있다.
- AJAX 는 클라이언트 풀링 방식으로 실시간 서비스를 제공할 수 없다.
- AJAX 가 포함된 HTML 페이지가 속한 서버가 아닌 다른 서버로 요청을 보낼 수 없고, 클라이언트 PC의 파일에 접근할 수도 없다.

### 5.18.5. ○ 기존 웹사이트에서 AJAX 를 사용하여 효과가 있는 경우 또는, AJAX 어플리케이션으로 개발할 필요가 있는 경우

- 웹 페이지를 전환하지 않고 현제 페이지에서 다른 동작을 수행하고자 할 때
- 불필요한 팝업을 사용하여 처리하는 작업을 다른 방법을 통해 대체하려 할 때
- 여러 번 불필요한 화면을 다시 출력할 때
- 특정한 데이터를 반복 사용하면서 다양한 작업을 수행할 때

### 5.18.6. ○ 주의 사항

- 뒤로가기 버튼 사용의 어려움  
    AJAX는 Javascript 를 사용하여 동작하기 때문에 페이지 단위의 브라우저에서 사용자 경험(UX) 과 다르게 작동하는 경우가 있다.
    특히, 뒤로가기 버튼의 기능 상실로 AJAX 를 유해한 기술로 매도하기도 한다.
    (뒤로가기 버튼은 웹 서핑을 수행하는 사용자들이 일반 클릭 다음으로 많이 사용하는 기술이므로...)
    하지만, 이미 iframe 을 사용한 해결책이 제시된 바 있으며 AJAX 를 활용한 서비스 사용 경험이 증대되며 이런 문제는 줄어들고 있다.

- 진행상황 파악의 어려움  
    XMLHttpRequest 를 통해 통신하는 경우 웹 페이지의 로딩과는 달리 사용자에게 아무런 진행 정보가 주어지지 않는다.
    그래서 아직 요청이 완료되지 않았는데 사용자가 페이지를 떠나거나 기다림을 참지 못한 사용자가 다른 기능을 수행함으로써 오작동을 일으킬 우려가 발생하게 된다.
    이 경우 사용자의 요청이 처리중에 있다는 표시를 화면에 보여주도록 처리할 수 있다. 중간 중간 "loading" 상태 표시를 통해 사용자의 요청이 처리중임을 알려주는 방법을 예로 들 수 있다.
    이러한 상태는 XMLHttpRequest.readStaate 의 상태를 통해 판단할 수 있다. 또한, 이때 사용할 수 있는 이미지를 활용하기도 한다.

### 5.18.7. ○ 참고 사이트

-http://www.w3.org
-http://www.w3schools.com

### 5.18.8. ○ AJAX 의 필요성

기존의 웹 브러우저는 서버로부터 페이지 단위로만 데이터를 수신하여 받을 수 있었다.  
때문에 간단한 상호작용을 하려고 해도 페이지 전체를 로딩해야 했고 이것은 대역폭 낭비를 초래하게 되었다.  
하지만, AJAX를 사용하면 XML 파일 조각 단위로 데이터를 받아올 수 있기 때문에 전체 페이지를 다시 로드하지 않아도 페이지 일부를 동적으로 갱신할 수 있다.  

### 5.18.9. ○ AJAX 객체의 사용

AJAX 객체를 사용하려면 먼저 AJAX 생성 함수를 사용하여 AJAX 객체를 만들어야 한다.  
인터넷 익스플로러의 경우 『new ActiveXObject("Microsoft.XNMLHTTP")』를 실행하며
모질라 웹 브라우저의 경우 『new XMLHttpReequest()』를 실행하여 AJAX 객체를 생성한다.  
인터넷 익스플로러 7.0 이후부터는 모질라 웹 브라우저 처럼 『new XMLHttpRequest()』를 통해 객체를 생성할 수 있다.

<br>

## 5.19. ■ JSON(JavaScript Object Notation) ■ / 제이슨

> 자바스크립트를 이용해 객체를 표현하는 표현방법

### 5.19.1. ○ JSON(JavaScript Object Notation) 이란?
- JavaScript Object Notation, RFC 4627
- Javascript 구문 형식을 따르며, 언제나 플랫폼에 독립적
- 미디어 타입: 'application/json'
- 표현 가능한 자료형
	: object, array, string, number, boolean, null

### 5.19.2. ○ 개요  
JSON(JavaScript Object Notation)은
네트워크 상에서(대표적으로 인터넷 상에서) 데이터를 주고 받을 때,
그 데이터를 표현하는 방법이다.
자료의 종류에 큰 제한은 없으며
특히 프로그램의 변수값을 표현하는데 적합하다.

JSON(JavaScript Object Notation)은 **경량 데이터 교환 방식**으로
사람이 읽고 쓰기에 용이하며,
기계가 분석하고 생성하는 과정도 비교적 단순하고 용이하다.
JavaScript Programming Language, Standard ECMA-262 3rd Edition의 일부 토대를 두고 있으며,
JSON은 완벽하게 언어로부터 독립적이지만
C 계열 언어, 자바, 자바스크립트 등 다수 개발자들에게
매우 친숙한 관습을 사용하는 텍스트 형식이다.
이와 같은 특성들로 인해 JSON 은 이상적인 데이터 교환 언어로 사용되고 있다.

※ JSON은 문자열 형식이기 때문에 네트워크 전송 시 유리하다.(유용하다.)
데이터에 접근하기 위해서는 Native JSOn 객체로 변환해야 한다.
(JavaScript 는 JSON 전역 객체를 통해 문자열과 JSON 객체의 상호 변환을 지원한다.)

※ 문자열에서 Native Object 로 변환하는 것으 파싱(Parsing)이라 한다,
네트워크를 통해 전달할 수 있게 객체를 문자열로 변환하는 과정은 문자열화(Stringfication)라고 한다.

### 5.19.3. ○ 특징(※ JSON의 특징은.. 곧 XML의 단점 → 데이터의 크기, 속도)  
① 경량 데이터 교환 방식  
② 데이터 표현이 단순하고 직관적  
③ Javascript 에서 eval()을 통해 parsing 가능  
- 라이브러리 필요 없음(예외의 경우도 존재함)
- 크로스 브라우저 호환 문제 없음

### 5.19.4. ○ 구조  
JSON은 두개의 구조를 기본으로 두고 있다.
- name / value 형태의 쌍으로 collection 타입  
	다양한 언어들에서 objec, record, struct(구조체), hashtable,
	키가 존재하는 list, 연상 배열 등으로 실현되었다.
- 값들의 순서화된 리스트  
	대부분 언어들에서 array, vector, list, sequence 등으로 실현되었다.

### 5.19.5. ○ 참조 페이지  
JSON 공식 홈페이지  
- http://www.json.org

### 5.19.6. ○ JSON의 기본 문법  
※ http://www.json.org/json-ko.html → 설명 문서 참조  
① 표현하고자 하는 데이터는 『{}』로 감싼다.  
② 데이터는 『name:value』형식으로 표현한다.  
③ 각각의 값들은 『,』로 구분한다.  
④ name 은 『""』로 감싸거나 그냥 사용해도 무방하다.  
- 『"name":"박둘리"』 또는 『name:"박둘리"』  
⑤ value 는 string, numver, 배열, true, false, null 등  
- string 『""』로 감싼다.  
- 배열은 『[]』로 값들을 감싼다.

1) 프로퍼티 ↔ 값
``` javascript 
var obj =
{ "프로퍼티명": "값" }
```
2) 메소드
``` javascript 
var obj =
{ "메소드명" : function(){...} }
```
3) 메소드(인수)
``` java
var obj = 
{ "메소드명" : function(인수){...} }
```

### 5.19.7. ○ JSON 의 데이터 타입(자료형)
- string
- number
- boolean
- null
- array
- object

※ JSON Object 의 각 프로퍼티 자료형은 『typeof』를 통해 확인이 가능하다.

- string  
· string 은 큰 따옴표 안에 둘러싸인 zero 이상의 유니코드 문자들의 조합이며, backslash escape 가 적용된다.  
· 하나의 문자(character)도 하나의 문자열(character string)로 표현된다.  
· 문자열은 반드시 이중인용부호 『""』로 감싸준다.  
· 모든 문자를 \uxxx (\u에 이어 4자리의 16진수로 표현한 unicode)로 표현 가능.  
``` html
"가나다"                 → 단순 문자열   
"\uAC00\uB098\uB2E4"    → escape 표기한 "가나다" 문자열  
"foo\\bar\n"            → backslash(\\)와 개행(\n)  
```

- number  
· number 는 8진수나 16진수 형식을 사용하지 않는다.
· 정수, 실수 모두 처리가 가능하다.
· 정수와 부동소수점 포함 10진 표기로 한정한다.
``` html
10                        → 정수 값
-110                      → 음의 정수 값
30.1                      → 실수 값
1.0e-10                   → 지수 표현 값
```

- boolean  
· boolean 은 true / false 데이터를 사용한다.  
· true, false 모두 소문자 기술.  
· C 나 JAVA 에서 사용하는 boolean 형과 비슷하다.  

- null  
· null은 어떤 특정 형태를 담기 이전의 상태로... object 로 취급받게 되며,
데이터가 할당되면(담기면), 할당된 데잉터에 따라 다시 구분된다.  
· 반드시 『null』이라고 소문자 기술.

- array  
· array 는 데이터들이 순서화된 collection 이다.(순서를 가진 값의 집합)  
· array 는 『[』로 시작해서 『]』로 끝내어 표현한다.(『[]』로 감싸서 표현)  
· 『,』(컴마)로 데이터들을 구분한다.  
· 1차원 형태, 2차원 형태 모두 존재한다.  
``` java 
["foo", "bar", "baz"]           			→ 문자열의 배열
[{"foo": "bar"}, {"key":"value}]           	→ 오브젝트 배열
[[10, 20],[40, 50]]           				→ 배열의 배열
[]           								→ 빈 배열
[{"foo", "bar"}, "baz", 100, true, null]    → 복잡한 배열(→ 가능)
```

- object  
· object 는 name 과 value 쌍들의 비순서화된 SET 이다.
· object 는 『{』로 시작하고 『}』로 끝내어 표현한다.(『{}』로 감싸서 표현)
· 각 anme 뒤에 『:』(콜론)을 붙인다. (이름과 값은 『:』로 구분)
· 『,』(컴마)로 쌍들 간을 구분한다.(『,』로 멤버 구분)
· 이름과 값의 집합, 이름은 항상 문자열, 값은 JSON의 자료형 가능
``` java
{
	"name":{"first":"John","last":"Doe"}
	, "blog":"http://blog.example.com"
	, "age": 52
	, "interests": ["Web","XML", "REST"]
}
```

### 5.19.8. ○ 일시(날짜)
- JSON 에서 기본적으로 제공하는 자료형에 일시(날짜)는 없음.
- 개발자 스스로 규칙을 정해서 사용
- 가장 단순한 방법으로는 UNIX 시간을 수치로 표현.  
	(12334567890 → 2009년 2월 14일 8시 31분 30초)
- UNIX 는 타임존을 다루지 못함  
	타임존이 필요할 시 Javascript 의 Date 객체 toString() 메소드 이용.  
	("Mon Nov 01 2023 05: 43:35 GMT+0900" → Firefox 3.6)   
	("Mon Nov 01 05: 43:35 GMT+0900 2023" → IE 8)   
- Javascript 는 브라우저 별로 출력 내용이 달라지기 때문에 표준적인 ISO-8601 사용 권장  
	("2023-05-12T14:41:15+0900")

### 5.19.9. ○ 링크
- 단순히 URI 를 문자열로 표현
	{ "href":"http:example.com/foo/bar" }
- URI 는 상대 URI 가 아닌 절대 URI로 표현 권장
- 멤버 이름을 링크를 나타내는 값으로 지정하여 표현 권장

<br>

## 5.20. 

<br>

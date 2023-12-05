# ✅ web 개념

<BR>

# 1. HTML
## 1.1. 
### 1.1.1. 

<br><br>

# 2. CSS
## 2.1. 
### 2.1.1. 

<br><br>

# 3. Javascript
: HTML 문서에 **상호작용** 하는 요소와 **동적** 요소를 추가하기 위해 사용하는 언어
특징) 
- 컴파일 과정이 필요없거나 처리 과정이 적은 프로그램에 유리한 스크립트 언어
- HTML 코딩에서 자바스크립트 명시만으로 웹 브라우저 자동 실행
- 웹페이지에서 가장 많이 사용되는 스크립팅(Scripting)언어
## 3.1. 사용법
### 3.1.1. Inline Javascript(HTML Tag 속에 지정하여 사용)
``` html
<a href="javascript:location.href='http://www.com'">네이버</a>
```
### 3.1.2. Embeded Javascript와 Script Block(Script Block 속에 일괄 지정하여 사용)
``` html
<script type="text/javascript">
    document.write("어쩌구 저쩌구");
</script>
```
### 3.1.3. Linked Javascript(외부 파일을 링크하여 여러 개의 파일에 일괄 지정하여 사용)
``` html
<script type="text/javascript" src="url 경로지정"></script>
```

<br>

## 3.2. 기초 구문 & 주요 데이터타입
### 3.2.1. 주석문(comment)
- 라인 단위 주석문의 경우 2개의 slash(<//>)를 주석문 앞에 붙여 사용하고
- 블럭 단위 주석문의 경우 </* 여러줄 주석*/>과 같이 사용한다.
### 3.2.2. 명령 line 처리
2개 이상의 script 명령을 사용할 경우<;(세미콜론)>으로 구분해 줄 수 있도록 한다.
(개행 역시 구분자의 역할을 수행하지만 <;>을 붙여서 사용할 수 있도록 한다.)
### 3.2.3. 주요 데이터타입
- 정수: 0~9사이의 각 자릿수에 해당하는 음수와 양수 따옴표 속에 넣지 않는다.
- 실수: 0~9사이의 각 자릿수에 해당하는 음수와 양수를 포함한 부동 소수. 따옴표 속에 넣지 않는다.
- Boolean(true or false): true 와 false 의 논리형
- String(문자열): 사용할 수 있는 모든 문자를 의미하며 따옴표(<" ">)속에 넣어서 사용한다.

<br>

### 3.2.4. 배열
#### 3.2.4.1. 1차원 배열 선언 - 크기 지정 없이 선언 가능
``` javascript
var 변수명 = enw Array();
변수명[0] = 값1;
변수명[1] = 값2;
변수명[2] = 값3;
...

var 변수명 = new Array(값1, 값2, 값3, ...);

var 변수명 = [값1, 값2, 값3, ...];
```

#### 3.2.4.2. 2차원 배열 선언 -크기 지정 없이 선언 가능
``` javascript
var 변수명 = new Array();
변수명[0] = new Array();
변수명[1] = new Array();
변수명[2] = new Array();
...

변수명[0][0] = 값1;
변수명[0][1] = 값2;
변수명[0][2] = 값3;
...

var 변수명 = new Array(new Array(), new Array(), new Array(), ...);
변수명[0][0] = 값1;
변수명[0][1] = 값2;
변수명[0][2] = 값3;
...

var 변수명 [[값1, 값2, 값3, ... ], [], []];
```

#### 3.2.4.3. 문자열.split(구분자)
``` javascript
var str = "1 2 3 4 5";
var arr = str.split(" "); //-- 1차원 배열 반환
for (var n=0; n<arr.length; n++)
{
    document.getElementById("result").value += arr[n] + " ";
}
//--==>> 1 2 3 4 5
```

<br>

## 3.3. 코드
### 3.3.1. Test001.html_자바스크립트 코드 선언, 도큐먼트에 스크립트로 출력(document.write("출력내용"))
``` javascript
document.write("2023년 11월의 끝");
//-- 출력을 지시하는 자바스크립트 명령어
//	출력 내용: 문자열, 변수명, 연산결과
```

### 3.3.2. Test002.html_document.write의 개행(&lt;br&gt;) 및 태그 삽입
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/47421ebd-ad31-4843-9821-a443c72cf9f1)

``` javascript
document.write("<h1>2023년 11월이 저무는 시점에서 ... </h1>");
// **.write에서 태그상으로 텍스트를 넣어 출력 가능**
document.write("이윤수");

// **그냥 텍스트 출력으로는 개행되지 않음**
document.write("2023년 11월이 저무는 시점에서 ...");
document.write("이윤수");
//--==>> 2023년 11월이 저무는 시점에서 ...이윤수

document.write("<br>감기 조심합시다~!!!<br>");
document.write("문정환");
//--==>> 감기 조심합시다~!!!
//		 문정환

// **나뉜상태로 태그를 감싸는 형태 가능**
document.write("<h2>");
document.write("기운냅시다~!!!");
document.write("</h2>");

document.write("<h3>" + "힘들어도 조금만 참아보겠다" + "</h3>");
```

### 3.3.3. Test003.html_javascript는 body에 출력되지 않음
``` html
<html>
<head>
<meta charset="UTF-8">
<title>Test003.html</title>
 
<!-- javascript의 위치는 title 밑이거나 body 안에서도 실행됨 -->
<script type="text/javascript">
	document.write("2023년 11월이 저무는 어느날");
</script>
 
</head>
<body>
 
<!-- body 영역에는 아무 내용도 존재하지 않음 -->
 
</body>
</html>
```

### 3.3.4. Test004.html_Linked Javascript(외부 파일을 링크)
『jsTest.js』라는 파일을 호출하는 형식을 취하고 있다.
호출하는 대상 파일의 경로 포함 파일명을 src 속성을 통해 명시하게 되며
이 때, 자바스크립트 파이르이 확장자는 반드시 『*.js』 이어야 한다.
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test004.html</title>
<script type="text/javascript" src="js/jsTest.js"></script>
 
</head>
<body>
 
</body>
</html>
```

### 3.3.5. Test005.html_Embeded Javascript(파일 내부 선언)
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test005.html</title>
<script type="text/javascript">
	num1=10;				        // 변수 선언 및 초기화 -> var num1=10;
							            // (변수 선언 과정이 특별히 존재하지 않음)
	document.write("num1=");// 단순 문자열 출력 -> "num1="
	document.write(num1);	  // write() 함수에 num1 이라는 변수를 넘겨주는 상황
							            // -> num1 에 담겨있는 10이 출력
							
	document.write("num1";) // 이 구문과 비교 가능~!!!
</script>
 
</head>
<body>
 
</body>
</html>
```

### 3.3.6. Test006.html_document.write()안에서 개행("<br>")
- .write안에서 개행은 '\n'(X) -> '&lt;br&gt;'(O)
- num1 이라는 변수는 정수를 담은 변수이나, 문자도 담을 수 있음
``` javascript 
  num1=10;							// 변수 num1 에 10 대입
	document.write("num1=");			// 문자열 출력
	document.write(num1);				// 변수 출력
	
	num1=100;							// 변수 num1 에 100 대입(기존 10에ㅓ 덮어쓰기)
	//document.write("\n num1=");			// 문자열 출력 -> 개행 안됨~!!! check~!!!
	document.write("<br>num1=");		// 라인 스킵(개행)을 위해 사용한 <br>
	document.write(num1);				// 변수 출력
	
	num1="2023년 11월이 저무는 어느날...";// 변수 num1에 문자열 대입
	document.write("<br>num1=");
	document.write(num1);
	
	num2=200;							// 변수 num2 구성
	
	num1= num2;							// 변수 num1에 num2 대입
	document.write("<br>num1=");
	document.write(num1);
```

### 3.3.7. Test007.html_변수선언에서의 자료형(var) 지정 없어도 실행에서 문제없음
``` javascript
num1=10;

var num2;		//** 없어도 에러나진 않음
num2=20;

var num3=30;

document.write("num1=" + num1);
document.write("<br>num2="+num2);
document.write("<br>num3=");
document.write(num3);
```

### 3.3.8. Test008.html_나누기(/) 소숫점까지, 나머지(%) 가 있으면 반올림됨
``` javascript
num1=7;
num2=3;

res=num1 + num2;					// 더하기(덧셈 연산)
document.write("num1 + num2 = ");
document.write(res);

res=num1 - num2;					// 빼기(뺄셈 연산)
document.write("<br>num1 - num2 = ");
document.write(res);

res=num1 * num2;					// 곱하기(곱셈 연산)
document.write("<br>num1 * num2 = ");
document.write(res);

res=num1 / num2;					// 나누기(나눗셈 연산) check~!!!
document.write("<br>num1 / num2 = ");//-- 결과값으로 반환되는 데이터의 형태 관찰
document.write(res);

res=num1 % num2;					// 나머지(나눗셈 연산) check~!!!
document.write("<br>num1 % num2 = ");// **나머지 올림됨**
document.write(res);
```

### 3.3.9. Test009.html_ ++, --
- ++,-- 가능
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/b77c9f5a-92c0-401b-9f19-01316c635524)

``` javascript
num1 = 7;
num2 = 3;

document.write("원래의 num1: ");
document.write(num1);

++num1;
document.write("<br>첫 번째 ++num1: ");
document.write(num1);

++num1;
document.write("<br>두 번째 ++num1: ");
document.write(num1);

document.write("<br><br>원래의 num2: ");
document.write(num2);

--num2;
document.write("<br><br>첫 번째 --num2: ");
document.write(num2);

--num2;
document.write("<br>두 번째 --num2: ");
document.write(num2);
```

### 3.3.10. Test010.html_ 복합대입연산자(+=,-=,*=,/=,%=)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/b3bde22c-f1fe-43a9-8a1c-b354f6694a92)

``` javascript
num1=7;
num2=3;

num1+=num2;
document.write("num1 += num2 -> ");
document.write(num1);

num1=7;
num2=3;

num1-=num2;
document.write("<br>num1 -= num2 -> ");
document.write(num1);

num1=7;
num2=3;

num1*=num2;
document.write("<br>num1 *= num2 -> ");
document.write(num1);

num1=7;
num2=3;

num1/=num2;
document.write("<br>num1 /= num2 -> ");
document.write(num1);

num1=7;
num2=3;

num1%=num2;
document.write("<br>num1 %= num2 -> ");
document.write(num1);
```

### 3.3.11. Test011.html_관계연산자, 삼항연산자, 조건연산자
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e125d619-1d68-46d9-8d80-72d948ea0e9c)

``` javascript
* **관계연산자 -> true or false 반환** */
/* **삼항연산자, 조건연산자 가능** */
	num1=7;
	num2=3;
	
	res=(num1==num2);
	document.write("num1 == num2 -> ");
	document.write(res);
	
	res=(num1>=num2);
	document.write("<br>num1>=num2 -> ");
	document.write(res);
	
	res=(num1<=num2);
	document.write("<br>num1<=num2 -> ");
	document.write(res);
	
	//----------------------------------------------
	document.write("<br><br><br><br>");
	
	res = (num1<10 && num2<10);
	document.write("<br>num1<10 && num2<10 -> ");
	document.write(res);
	
	res = (num1>10 && num2>10);
	document.write("<br>num1>10 && num2>10 -> ");
	document.write(res);
	
	res = (num1>10 && num2>10);
	document.write("<br>num1>10 || num2>10 -> ");
	document.write(res);
	
	res = (num1>10 || num2<10);
	document.write("<br>num1>10 || num2<10 -> ");
	document.write(res);
	
	res = !(num1 == num2);
	document.write("<br>!(num1==num2) -> ");
	document.write(res);
	
	//----------------------------------------------
	document.write("<br><br><br><br>");
	
	human = "연인";
	
	res = (human == "연인")?"사랑":"우정";
	document.write("<br>res= ");
	document.write(res);
	
	human="친구";
	
	res=(human=="연인")?"사랑":"우정";
	document.write("<br>res= ");
	document.write(res);
```

### 3.3.12. Test012.html_alter 태그, 내부-외부 스크립트 내용 공유함, js 위치에 따라 실행여부 달라질 수 있음
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/617f48cd-fe51-4cb2-91e7-eeeb889bbd5d)
-.write에서는 태그 인식 되나, alert에서는 태그 인식 되지않음
-.alter는 코드순서와 상관없이 먼저 처리됨 
- javascript 개수와 상관없이 모두 실행됨
- 내부 script와 외부 script는 내용을 공유함
- javascript의 위치에 따라서 실행여부가 달라질 수 있음

- 소문자 시작이름() -> 
- 대문자 시작이름() -> 자바스크립트 생성자함수 호출
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test012.html</title>
 
<script type="text/javascript">
	//alert(message);	//** 경고창
	//--==>> 아무것도 뜨지 않음(오류가 있기 때문에)
	
	message="<h1>Hello~!!</h1>";
	
	//alert(message);	//** 경고창
	//--==>> 경고창의 버튼 선택후, document 출력됨
 
	document.write(message);
	
	alert(message);	//** 경고창
</script>
<script type="text/javascript" src="js/alertTest.js"></script>
 
<script type="text/javascript">
	// Date 내장 객체: 현재 시스템의 날짜와 시간
	// var dt = Date().toString();
	var dt=String(Date());
	document.write(dt);
</script>
 
</head>
<body>
 
</body>
</html>
```

### 3.3.13. Test013.html_함수는 호출해야 실행됨/ document.onload 이벤트 등록
- 함수는 호출해야 실행됨
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test013.html</title>
 
<script type="text/javascript">
	/* 이벤트 등록 방법 ② */
	/* document.onload = 행위, 동작, 기능 */
	document.onload = windowOnload();
	
	function windowOnload()
	{
		alert("경고창~!!!");
	}
</script>
 
</head>
<!-- 이벤트 등록 방법 ① -->
<!-- <body onload="windowOnload()"> -->
<body>
 
<h1>정한울</h1>
<h2>배부르다~!!!</h2>
<h3>짜게 먹었네~!!!</h3>
 
</body>
</html>
```

### 3.3.14. Test014.html_함수 등록
``` javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test014.html</title>
 
<script type="text/javascript">
	var msg="2023년 11월이 저무는 어느날...";
	
	function buttonOnclick1()
	{
		// 테스트
		alert("첫 번째 버튼 클릭 확인~!!!");
	}
	function buttonOnclick2()
	{
		// 테스트
		alert("두 번째 버튼 클릭 확인~!!!");
	}
</script>
 
</head>
<body>
	<input type="button" id="btn01" value="Button1" onclick="buttonOnclick1()"><br>
	<input type="button" id="btn02" value="Button2" onclick="buttonOnclick2()"><br>
</body>
</html>
```

### 3.3.15. Test015.html_텍스트 가져오기 (document.getElementById("아이디명").value) / 숫자형으로 변환(parseInt)
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test015.html</title>
... 중략 ...
 
<script type="text/javascript">
 
// 1. aaa 쓰고 A버튼 클릭하면 옆에 입력창에 aaa
// 2. bbb 쓰고 B버튼 클릭하면 옆에 입력창에 aaabbb
 
 
// ★ [id는 문서 안에서 고유하므로, 가장 많이 활용하게 된다.(Oracle의 식별자 개념과 유사)]
 
	function actionBtnA()
	{
		// 테스트
		//alert("A버튼 클릭 확인~!!!");
		
		// 텍스트를 가져오는 것이 아니라, 입력창 객체(Object) 자체를 가져온다!
		// value : 텍스트 박스 내부에 적힌 텍스트를 가져오기 위해
		// ★【[txtLeft] 텍스트박스 오브젝트.value】 = 작성된 내용을 가져올 수 있다!
		
		//alert(document.getElementById("txtLeft"));
		//alert(document.getElementById("txtLeft").value);
		
		// 둘 다 객체 타입으로 저장된다!!!
		var txt01 = document.getElementById("txtLeft");
		var txt02 = document.getElementById("txtRight");
		
		// 테스트
		//alert(txt01);
		//--==>> [object HTMLInputElement] 오브젝트 타입이 나온 것을 확인할 수 있다!
		
		//alert(txt01.value);
		//--==>> 123 (123을 입력창에 입력하자, 123이 안내창으로 떴다!)
		
		var leftStr = txt01.value;
		// ① 텍스트박스 1에 적힌 문자열을 leftStr에 저장해서
		
		txt02.value = leftStr;
		// ② 텍스트박스 2의 value에 대입해 준다!
		
	}
	
	function actionBtnB()
	{
		// 테스트
		//alert("B버튼 클릭 확인~!!!");
		
		var txt01 = document.getElementById("txtLeft");
		var txt02 = document.getElementById("txtRight");
		
		var rightVal = txt02.value;
		txt01.value = rightVal;
		
	}
	
/* 	function gogo()
	{
		var a = document.getElementById("txtNumber01");
		var b = document.getElementById("txtNumber02");
		
		var result = a.value + b.value;
		
		txtResult.value = result;
	} */
	
	function actionBtnResult()
	{
		// [내 풀이]===============================================================
		// 테스트
		//alert("함수 호출 확인~!!!");
		
		//var a = document.getElementById("txtNumber01");
		//var b = document.getElementById("txtNumber02");
		
		// parseInt 로 바꿔주지 않으면, 문자열 결합 연산이 이루어지기 때문에
		// 반드시 정수 타입으로 형변환 해 주어야 한다.
		
		//var result = parseInt(a.value) + parseInt(b.value);
		
		//txtResult.value = result;
		//========================================================================
			
			
		// [선생님 해설]==========================================================
		
		// ⓐ 오브젝트 가져오기
		//var num1 = document.getElement.getElementById("txtNumber01");
		
		// ⓑ 텍스트 자체를 가져오기
		var num1 = document.getElementById("txtNumber01").value;
		var num2 = document.getElementById("txtNumber02").value;
		
		// 확인
		//alert(num1);
		//alert(num2);
		
		//var result = num1 + num2;				//-- 문자열 결합
		// parseInt()
		//var result = parseInt(num1 + num2);	//--(Ⅹ) 문자열을 결합한 결과를 숫자로 변환하게 된다! 
												//  "12" + "23" = "1223" → parseInt() → 1223 (Ⅹ)
												//-- 문자열 결합된 결과물을 정수형태로 변환
 
		
		//var result = parseInt(num1) + parseInt(num2);
											
		
		// 확인
		//alert(result);
		
		
		// var result = parseInt(num1) + parseInt(num2);
		//                       "12"             "23"
		//				--------------   -------------
		//
		
		var result = Number(num1) + Number(num2);
		// 앞글자가 대문자인 메소드는, 생성자를 의미한다
		// Number 객체에 변수를 넣어주게 되면 그 변수 또한 정수형으로 변환되므로 이렇게도 작성할 수 있다.
		
		
		// 확인
		//alert(result);
		
		document.getElementById("txtResult").value = result;
		
		
		// 위의 처리 내용과 같은 결과 (짧은 처리)
		
		/* document.getElementById("txtResult").value
		= parseInt(document.getElementById("txtNumber01").value)
		+ parseInt(document.getElementById("txtNumber02").value); */
		
		
		// ※ 자바스크립트가 자동으로 형변환 하는 것을 믿지 말고(의존하지 말고)
		//    사용자가 직접 정의하여 형변환을 하도록 하자.
		
		//========================================================================
	}

</script>
 
</head>
<body class="section">
 
<div>
	<h1>자바스크립트 기본 관찰</h1>
	<hr>
</div>
 
<div class="btn_box">
	<input type="text" class="box" id="txtLeft">
	<input type="button" value="A버튼" class="btn" id="btnA" onclick="actionBtnA()">
	<input type="button" value="B버튼" class="btn" id="btnB" onclick="actionBtnB()">
	<input type="text" class="box" id="txtRight">
	
	<br><br><br>
	<hr>
	
	<input type="text" class="numberBox" id="txtNumber01">
	+
	<input type="text" class="numberBox" id="txtNumber02">
	<input type="button" value=" = " class="btn w_auto" id="btnResult" onclick="actionBtnResult()">
	<input type="text" class="numberBox" id="txtResult" disabled="disabled">
	
	<!--disabled : 사용자가 입력값을 넣을 수 없지만, 개발자가 값을 넣어줄 수 있다.  -->
	<!-- equal 버튼이 클릭되었을 때 처리해야 한다. -->
	
<div>
```

### 3.3.16. Test016_1.html_합, 차, 곱, 몫을 연산
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/59663cdd-4fea-42e4-8706-233430691440)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test016_1.html</title>
 
<style type="text/css">
 
	* {color: #223322; font-family: 나눔고딕코딩; font-weight: bold;}
	input:focus {background-color: #eeeedd;}
	input.btn {width: 80px; font-weight: bold; font-family: 맑은 고딕;}
	input.op{width: 60px;}
	input.btn:hover{color: orange; background-color: #334433;}
	input.btn:active{color: red;}
	.txtNum {width: 80px;}
	#result {width: 120px; text-align: center;}
 
</style>
<link rel="stylesheet" href="css/style.css">
 
<script type="text/javascript">
 
// ⓐ [함수를 각각 구성하는 방식]---------------------
/* 	function test1()
	{
		alert("덧셈 연산 수행")
		
	}
	
	function test2()
	{
		alert("뺄셈 연산 수행")
		
	}
	
	function test3()
	{
		alert("곱셈 연산 수행")
		
	}
	
	function test4()
	{
		alert("나눗셈 연산 수행")
		
	} */
 
//---------------------------------------------------
 
// ★ ⓑ [하나의 함수로 처리하는 방식]===============
	
	// 【매개변수 형태로 test(1) test(2) test(3) test(4) 구분하면 된다!!】
	// 자바스크립트도 객체지향 언어이므로 this 키워드 사용 가능.
	
/* 	function test1(num)
	{
		//alert("연산 수행");
		alert(num);
 
	}
 */
 
	function test1(obj)
	{
		//alert("연산 수행");
		//alert(num);
		
		// ⓐ**********
		//  alert(obj);
		// ************
		// ⓐ object 타입으로 객체가 넘어온다.
		
		// ⓑ*****************
		//   alert(obj.value);
		//  ******************
		// ⓑ object가 갖는(this의 객체 = object)의 value("더하기", "빼기", ...)가
		//    넘어온다!!
		
		var vNum1 = document.getElementById("num1").value;
		var vNum2 = document.getElementById("num2").value;
		var vResult = 0;
		
		// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		// 자바의 경우 if (String.equals("라라")) 처럼 작성하지만
		// 자바스크립트는 == 로도 문자열 비교가 가능하다!
		// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		
		if (obj.value == "더하기")
		{
			// 테스트
			//alert("덧셈 연산 수행");
			vResult = parseInt(vNum1) + parseInt(vNum2);
		}
		else if (obj.value == "빼기")
		{
			// 테스트
			//alert("뺄셈 연산 수행");
			vResult = parseInt(vNum1) - parseInt(vNum2);
		}
		else if (obj.value == "곱하기")
		{
			// 테스트
			//alert("곱셈 연산 수행");
			vResult = parseInt(vNum1) * parseInt(vNum2);
		}
		else if (obj.value == "나누기")
		{
			// 테스트
			//alert("나눗셈 연산 수행");
			vResult = parseInt(vNum1) / parseInt(vNum2);
			
			// 자바스크립트는 나눗셈 연산을 할 때도
			// 피연산자 중 하나를 실수 타입으로 바꿀 필요가 없다.
		}
		
		// 테스트
		//alert(vResult);
		
		document.getElementById("result").value = vResult;
 
	}
 
 
//===================================================
	
</script>
</head>
<body class="section">
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
 
<div class="layout">
	<div class="info_box">
		<p>사용자로부터 두 개의 정수를 입력받고</p>
		<p>합, 차, 곱, 몫을 연산하여 연산 결과를 페이지에 출력할 수 있도록 한다.</p>
		<p>HTML, CSS, Javascript 를 활용하여 처리한다.</p>
	</div>
	
	<div>
		<form>
			정수1 <input type="text" id="num1" class="txtNum">
			정수2 <input type="text" id="num2" class="txtNum">
			<br><br>
			
			<!-- 	
			<input type="button" class="btn" value="더하기">
			<input type="button" class="btn" value="빼기">
			<input type="button" class="btn" value="곱하기">
			<input type="button" class="btn" value="나누기">
			<br><br>
	 		-->		
			
			<!-- [각각에 대한 함수를 생성했을 경우]
			<input type="button" class="btn" value="더하기" onclick="test1()">
			<input type="button" class="btn" value="빼기" onclick="test2()">
			<input type="button" class="btn" value="곱하기" onclick="test3()">
			<input type="button" class="btn" value="나누기" onclick="test4()">
			<br><br>
			-->
			
			<!--
			<input type="button" class="btn" value="더하기" onclick="test1(1)">
			<input type="button" class="btn" value="빼기" onclick="test1(2)">
			<input type="button" class="btn" value="곱하기" onclick="test1(3)">
			<input type="button" class="btn" value="나누기" onclick="test1(4)">
			<br><br> 
			-->
			
			<input type="button" class="btn" value="더하기" onclick="test1(this)">
			<input type="button" class="btn" value="빼기" onclick="test1(this)">
			<input type="button" class="btn" value="곱하기" onclick="test1(this)">
			<input type="button" class="btn" value="나누기" onclick="test1(this)">
			<br><br>
			
			<!--
			★[this]★======================================== 
			this 라는 키워드가 포함되어있는 객체 자체를 의미한다
			this가 어디에 쓰였느냐에 따라 this가 포함된 객체 의미
			-->
			
			<!--
			<input type="button" class="btn" value="더하기" onclick="test1(this)">
			→ this가 포함된 객체 전부!!
			 -->
			
			
	
			결과 <input type="text" id="result" class="txtNum" disabled="disabled">
			<input type="reset" class="btn" value="취소">
			
			<!-- 사용자에게 모두 정수1, 정수2 를 가져오는 연산은 똑같다. -->
			<!-- 연산만 다를 뿐이지, result 창에 결과를 집어넣는 것도 똑같다. -->
			<!-- 하나의 함수로도 처리 가능하다!! -->
			
		</form>
	</div>
</div>
 
</body>
</html>
```

### 3.3.17. Test017_1.html_금액 화폐단위 출력
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/a79eafe3-ed2c-4798-9b37-71e274e68018)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test017.html</title>
<link rel="stylesheet" type="text/css" href="css/myCssStyle.css">
<link rel="stylesheet" href="css/style.css">
 
<script type="text/javascript">
 
	function myCalculate()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		var moneyStr = document.getElementById("money").value;
		
		// 입력값에 대한 유효성 검사 코드 삽입 가능
		
		var money = parseInt(moneyStr);
		
		document.getElementById("totalMoney").value = money;
		
		// 【Math.floor】 : 소수점 아랫자리 절삭 함수!
		//  Math 객체 내부에 있는 floor 함수는 소수점 아랫자리를 절삭시키는 함수이다.
		// 그런데, parseInt()로 실수값을 감싸도, 실수 → 정수형으로 변환되는 과정에서 소수점이 사라지므로
		// 같은 결과가 출력된다는 것을 알 수 있다.
		
		//var m500 = money/500;
		//var m500 = Math.floor(money/500);
		var m500 = parseInt(money/500);
		
		// 확인
		//alert(m500);
		
		//alert(123.456);
		//alert(parseInt(123.456));		[소수점 아래자리 절삭!!]		
		//--==>> 123 이 안내창으로 출력된다.
		
		//alert(123.456)
		//alert(Math.floor(123.456));	[소수점 아래자리 절삭!!]		
		//--==>> 123 이 안내창으로 출력된다.
		
		money = money%500;					// money %= 500;
		var m100 = parseInt(money/100)		// var m100 = Math.floor(money/100); (parseInt와 같은 결과를 반환한다!)
		
		money = money%100;					// money %= 100;
		var m50 = parseInt(money/50);		// var m50 = Math.floor(money/50);
		
		money = money%50;					// money %= 50;
		var m10 = parseInt(money/10);		// var m10 = Math.floor(money/10);
		
		
		document.getElementById("m500").value = m500;
		document.getElementById("m100").value = m100;
		document.getElementById("m50").value = m50;
		document.getElementById("m10").value = m10;
	}
 
 
</script>
 
 
</head>
<body class="section">
 
<!-- 
	특정 금액(10원 ~ 990월)을 사용자로부터 입력받아
	화폐 단위로 구분하여 출력하는 페이지를 구성한다.
	화폐 단위는 편의상 오백원, 백원, 오십원, 십원으로 구분한다.
	HTML, CSS< Javascript 를 활용한다.
	
	페이지 기본 레이아웃 구성
	--------------------------------------------------------------------
	
	금액	 [			] 원
	
	<결과> <취소>
	
	총액	[			] 원
	오백원		[		] 개
	백원		[		] 개
	오십원		[		] 개
	십원		[		] 개	
	
	--------------------------------------------------------------------
 -->
 
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
		
<div class="layout">
	<form>
		<div class="input_box">
		금액 	<input type="text" id="money" class="Money">
		</div>
		
		<div class="btn_box">
		<input type="button" id="resultButton" class="btn" value="결과" onclick="myCalculate()">
		<input type="button" id="cancelButton" class="btn" value="취소">
		</div>
		
		<div class="result_box">
			<ul>
				<li>
					<span class="tit">총액</span>
					<input type="text" id="totalMoney" class="Money" disabled="disabled"> 원
				</li>
				<li>
					<span class="tit">오백원</span>
					<input type="text" id="m500" class="Money" disabled="disabled"> 개
				</li>
				<li>
					<span class="tit">백원</span>
					<input type="text" id="m100" class="Money" disabled="disabled"> 개
				</li>
				<li>
					<span class="tit">오십원</span>
					<input type="text" id="m50" class="Money" disabled="disabled"> 개
				</li>
				<li>
					<span class="tit">십원</span>
					<input type="text" id="m10" class="Money" disabled="disabled"> 개
				</li>
			</ul>
		</div>		
		
	</form>
</div>
 
</body>
</html>
```

### 3.3.18. Test018_1.html_국어,수학,영어의 평균 및 판정결과/ 반올림(Math.round)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/e7e7f3b0-df42-4bf4-8055-c89a7ff86e04)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test018_1.html</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body class="section">
<!-- 
	사용자로부터 이름, 국어점수, 영어점수, 수학점수를 입력받아
	평균점수와 판정결과를 출력하는 페이지를 구성한다.
	판정 결과는 합격, 과락, 불합격 중 하나로 처리한다.
	
	합격은 모든 과목 점수가 40점 이상이면서 평균 점수가 60점 이상인 경우,
	과락은 평균이 60점 이상이지만 한 과목이라도 과목 점수가 40점 미만의 과목이 존재하는 경우
	불합격은 평균 점수가 60점 미만인 경우로 처리한다.
	
	HTML, CSS, Javascript 활용한다.
	
	페이지 레이아웃
	---------------------------------------------------------------
	
	이름		[		]
	국어점수	[		]
	영어점수	[		]
	수학점수	[		]
	
	< 처리 결과 확인 >
	평균		판정결과
	[		]	[		]
	
	----------------------------------------------------------------
 -->
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
<div class="layout">
	<form>
		<div class="input_box">
			<ul>
				<li>
					<span class="tit">이름</span>
					<input type="text" id="eng">
				</li>
				<li>
					<span class="tit">국어</span>
					<input type="text" id="kor">
				</li>
				<li>
					<span class="tit">수학</span>
					<input type="text" id="mat">
				</li>
				<li>
					<span class="tit">영어</span>
					<input type="text" id="eng">
				</li>
			</ul>
		</div>
		<div class="btn_box">
			<input type="button" value="처리 결과" onclick="actionPerformed()">
		</div>
		<div class="result_box">
			<ul>
				<li>
					<span class="tit">평균</span>
					<input type="text" id="avg">
				</li>
				<li>
					<span class="tit">판정결과</span>
					<input type="text" id="result">
				</li>
			</ul>
		</div>
	</form>
 
</div>
 
<script type="text/javascript">
	function actionPerformed()
	{
		// 확인
		//alert("함수 호출 확인!");
		
		var korStr = document.getElementById("kor").value;
		var engStr = document.getElementById("kor").value;
		var matStr = document.getElementById("kor").value;
		
		var nKor = parseInt(korStr);
		var nEng = parseInt(engStr);
		var nMat = parseInt(matStr);
		
		var nTot = 0;
		var nAvg = 0;
		var resultStr = "";
		
		nTot = nKor + nEng + nMat;
		
		console.log(nTot);
		
		nAvg = Math.round(nTot/3);		// Math.round: 반올림
		
		document.getElementById("avg").value = nAvg;
		
		if(nKor>=40 && nEng>=40 && nMat>=40 && nAvg>=60)
			resultStr = "합격";
		else if(nAvg>=60)
			resultStr = "과락";
		else
			resultStr = "불합격";
		
		document.getElementById("result").value = resultStr;
		
		
		
	}
</script>
 
</body>
</html>
```

### 3.3.19. Test019_1.html_1~n까지의 합
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/20b0fb82-dcd7-4690-b351-14e816737635)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test019_1.html</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
 
<!--
	사용자로부터 임의의 정수 n 을 입력받아
	1 부터 n 까지의 합을 계산하되
	n 은 100 이상만 허용하고,
	출력 시 10의 배수가 될 때마다 중간 합을 출력할 수 있는 페이지를 구성한다.
	반복문을 활용할 수 있도록 한다.
	
	HTML, CSS, Javascript 활용
	
	페이지 레이아웃					(입력값은 100 이상만 가능~!!!)
	------------------------------------------------------------------
	
	정수 입력(100 이상) [		] -> 조건 유효성 -> textbox, num으로 식별
		< 결과 >	< 취소 >
		
	-------------------------------- -> textarea, result 로 식별
	1 ~ 10 : 55 	┐
	1 ~ 20 : 210 	│
	1 ~ 30 : xxx 	│중간 합
		: 			│
	1 ~ 100 : 5050  ┘
	1 ~ 101 : 2021 ─ 최종 합
	--------------------------------	
	
	------------------------------------------------------------------ 
 -->
 
<div class="section">
	<div>
		<h1>자바스크립트 활용</h1>
		<hr>
	</div>
 
	<form class="layout">
		<div class="input_box">
			정수 입력(100 이상)
			<input type="text" id="num" class="txt">
		</div>
		<div class="btn_box">
			<input type="button" value="결과" class="btn" onclick="myCalculate()">
			<input type="button" value="취소" class="btn">
		</div>
		<div class="result_box">
			<textarea id="result" cols="300" rows="10" style="resize: none; width:400px;" readonly="readonly"></textarea>	<!-- -- readonly="readonly" -->
		</div>
	</form>
</div>
 
<script type="text/javascript">
 
function myCalculate()
{
	// 확인
	//alert("함수 호출 확인~!!!");
	
	document.getElementById("result").value="";		//-- check~!!!
	
	var nNum = Number(document.getElementById("num").value);
	var nSum = 0;
	
	if(nNum < 100){
		alert("입력값은 100 이상만 가능합니다~!!!");
		return;										//-- check~!!!
	}
 
	for(var n=1; n<=nNum; n++)	//-- 1 부터 사용자가 입력한 값(nNum)까지 1씩 증가하며 반복 수행
	{
		nSum += n;
		//document.getElementById("result").value += "1 ~" + n + " : " + nSum + "<br>";
		//document.getElementById("result").value += "1 ~" + n + " : " + nSum + "\n";
		if(n%10==0)
		{
			document.getElementById("result").value += "1 ~" + n + " : " + nSum + "\n";
		}
	}
	document.getElementById("result").value += ">> 1 ~" + nNum + " : " + nSum;
}
 
</script>
</body>
</html>
```


### 3.3.20. Test020_1.html_1차원 배열에서 짝수고르기
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/9b592a0a-6fa8-4ac7-b0c4-7135a89d8624)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test020_1.html</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body onload="init()">
<!-- **onload는 바디에서 불려질때 사용가능. 모든 태그에서 로드되는 것은 아님** -->
 
<!-- 
	지정된 정수가 요소로 구성된 1차원 배열의 숫자 데이터들 중...
	짝수만 골라서 출력하는 페이지를 구현한다.
	HTML, CSS, Javascript 활용한다.
	또한, 자바스크립트 배열을 활용한다.
	
	지정 배열 -> 4,7,9,1,3,2,5,6,8
	
	페이지 레이아웃
	----------------------------------------------------------------
	
	초기 배열 상태 [ 4 7 9 1 3 2 5 6 8 ] -> 지정된 배열			arr1
	
	< 결과 확인 >
	
	짝수만 출력[ 4 2 6 8 ] 										arr2
	
	----------------------------------------------------------------
 -->
 
<div class="section">
	<div>
		<h1>자바스크립트 활용</h1>
		<hr>
	</div>
	
	<form class="layout">
		<div class="input_box">
			<span class="tit">초기 배열 상태</span>
			<input type="text" id="arr1" disabled>
		</div>
		<div class="btn_box">
			<input type="button" value="결과확인" id="btnResult" onclick="resultShow()">
		</div>
		<div class="result_box">
			<span class="tit">짝수만 출력</span>
			<input type="text" id="arr2" disabled>
		</div>
	</form>
</div>
 
 
<script type="text/javascript">
// 함께 푼 풀이 -------------------------------
var arr = [4, 7, 9, 1, 3, 2, 5, 6, 8];
function init()
{
	//document.getElementById("arr1").value=arr;		// 더미 check~!!! 
	// **더미이므로 잠깐 확인하는 정도는 괜찮지만, 실제로 얻어지는 데이터의 유형이 다르기 때문에 더미로 접근하지 말것**
	var str ="";
	for(var n=0; n<arr.length; n++)
	{
		str += arr[n]+ " ";		
	}
	
	document.getElementById("arr1").value = str;
}
 
function resultShow()
{
	var str ="";
	for(var n=0; n<arr.length; n++)
	{
		if(arr[n]%2==0)
			str += arr[n]+ " ";
	}
	
	document.getElementById("arr2").value = str;
	
}
 
</script>
</body>
</html>
```

### 3.3.21. Test021_1.html_임의의 정수 받아 배열로 만들고 큰 수 구하기
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/8a06dbf3-6f4d-4171-8b9c-f73626fac62a)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test021.html</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
 
<!-- 
	사용자로부터 임의의 정수를 임의의 갯수만큼 입력받고,
	그 내용으로 배열을 구성하여,
	구성한 정수들 중 가장 큰 수를 출력하는 페이지를 구현한다.
	HTML, CSS, Javascript 활용한다.
	
	페이지 레이아웃
	-------------------------------------------------------------------
	
	데이터 입력(공백 구분) [ 21 86 258 43 7 ] -> 배열 구성			txt01
			
			< 결과 확인 >
	- 전체 출력 [ 21 86 258 43 7 ] 			  -> 배열 전체 출력		txt02
	- 가장 큰 수 	[ 258 ] 										txt03
	
	-------------------------------------------------------------------
 -->
 
<div class="section">
	<div>
		<h1>자바스크립트 활용</h1>
		<hr>
	</div>
	
	<form class="layout">
		<div class="input_box">
			<span class="tit">데이터 입력(공백 구분)</span>
			<input type="text" id="txt01">
		</div>
		<div class="btn_box">
			<input type="button" value="결과 확인" id="btnResult" onclick="resultShow()">
		</div>
		<div class="result_box">
			<ul>
				<li>
					<span class="tit">전체 출력</span>
					<input type="text" id="txt02" disabled>					
				</li>
				<li>
					<span class="tit">가장 큰 수</span>
					<input type="text" id="txt03" disabled>					
				</li>
			</ul>
		</div>
	</form>
</div>
 
<script type="text/javascript">
function resultShow()
{
	var txt01 = document.getElementById("txt01").value;
	
	var arr = txt01.split(" ");
	var max = 0;
	
	for(var i=0; i<arr.length; i++)
	{
		document.getElementById("txt02").value += arr[i] + " ";
		if(max < parseInt(arr[i])){
			max = arr[i];
			console.log(max);			
		}
	}
	
	document.getElementById("txt03").value = max;
	//console.log(txt01);
}
</script>
 
</body>
</html>
```

### 3.3.22. Test022.html_사용자 입력창(prompt())
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/fbd360aa-a0bb-499a-aedb-628b6bd5678e)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/15b4db28-2e2d-48d2-a77c-8018b41c942d)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test022.html</title>
<link rel="stylesheet" href="css/style.css">
 
<style type="text/css">
	textarea {/* font-family: 나눔고딕코딩; */font-weight: bold; margin: 2px;}
	#txtCount {width: 40px; text-align:right;}
</style>
</head>
<body class="section">
 
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
 
<!-- 
	여러 명의 이름과 전화번호를 입력받고
	그 내용을 전체 출력하는 페이지를 구현한다.
	HTML, CSS, Javascript 를 활용한다.
	
	※ prompt() 활용
	
	페이지 레이아웃
	------------------------------------------------
	< 회원 정보 입력 >
	
	전체 회원 수: [  ] 명
	-----------------------
		이름	전화번호
	-----------------------
			:
			:
	
	------------------------------------------------
 -->
 
<div class="layout">
	<form>
		<div class="btn_box input_box">
			<input type="button" value="회원 정보 입력" class="btn" onclick="addMember()">
		</div>
		
		<div class="result_box">
			<span>전체 회원수: </span>
			<input type="text" id="txtCount" class="txt" readonly="readonly">명
		</div>
	
		<div>
			<textarea rows="10" cols="30" id="txtResult" readonly="readonly"></textarea>	
		</div>	
	</form>
</div>
 
<script type="text/javascript">
function addMember()
{
	// 확인
	//alert("함수 호출 확인~!!!");
	
	//var temp = prompt("안내: ");
	
	var str = "";
	var arr = new Array();
	var n = 0;
	
	do
	{
		// ※ <prompt()>: 대화창을 통해 데이터 입력 안내
		//				-> 입력 데이터를 받아와 변수에 담아내기
		str = prompt("이름 전화번호("+ (n+1)+")");
		
		//확인
		//alert(str);
		
		if(str==null || str =='.' || str==" " || str=="")
			break;
		
		arr[n] = str;
		
		// 확인
		alert(arr[n]);
		
		n++;		
		
	} while (true);
	
	document.getElementById("txtCount").value = arr.length;
	/* **
	배열을 가지고 있는 구조가 자바와 다르기 때문에 자바라면 불가능한 구조
	자바- 배열을 연결되어 가지고 있음
	자바스크립트- 배열이 연결되어있음
	** */
	
	document.getElementById("txtResult").value = "	이름	전화번호\n";
	/* **
	txtResult를 클리어 할 필요 없음.
	ㄴ 이유: 누적합을 출력하는 구조가 아니기 때문에
	** */
	
	for(var n=0; n<arr.length; n++)
	{
		document.getElementById("txtResult").value += arr[n] + "\n";
	}
	
	
}
</script>
 
</body>
</html>
```

### 3.3.23. Test023_1.html_여러명데이터 등수부여 출력(함께 푼 풀이)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/855d7b5d-7e7b-41b1-b16e-533459a61102)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test023.html</title>
<link rel="stylesheet" href="css/style.css">
 
</head>
<body class="section">
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
<!-- 
	<prompt()>를 활용하여 여러 명의 성적 데이터를 입력 받고,
	등수를 부여하여, 리스트를 출력하는 페이지를 구성한다.
	HTML, CSS, Javascript 활용한다.
	
	페이지 레이아웃
	-----------------------------------------------------------
	
	< 성적 정보 입력 > ------------- prompt() --------------- 이름 국어 영어 수학(1):
	
	전체 인원 수: [    ] 명
	--------------------------------------------- ---- textarea
	이름	국어	영어	수학	총점	등수
	김다슬	80 		70 		60 		xxx 	1등
	오수경	70  	60 		50 		xxx 	2등
	김경태	60  	50 		40 		xxx 	3등
	박범구	50  	40 		30 		xxx 	4등
	---------------------------------------------
	
	-----------------------------------------------------------
 -->
<div class="layout">
	<form>
		<div class="btn_box input_box">
			<input type="button" value="성적 정보 입력" onclick="scoreInsert()">
		</div>
		
		<div class="result_box">
			<span class="tit">전체 인원 수: </span>
			<input type="text" id="txtCount" style="width: 40px">명
		</div>
		
		<div>
			<textarea rows="10" cols="50" id="txtResult" readonly="readonly"></textarea>	
		</div>			
	</form>
</div>
 
<script type="text/javascript">
function scoreInsert()
{
	var str = "";
	var arr = new Array();
	var temp;
	var n = 0;
 
	// -- 입력값 받아오기 및 총점계산
	do
	{
		str = prompt("이름 국어 영어 수학("+(n+1)+"):");
		
		if(str=="" || str==" " || str==null || str==".")
			break;
		
		arr[n] = str.split(" ");
		
		arr[n][4] = parseInt(arr[n][1]) + parseInt(arr[n][2]) + parseInt(arr[n][3]);
					
		n++;
		
	} while (true);
	
	// -- [test] 등수 정상 출력을 위한 샘플 데이터
	//arr = new Array(new Array("오수경", 70, 60, 50, 180),new Array("김경태", 60, 50, 40, 150),new Array("박범구", 50, 40, 30, 120),new Array("김다슬", 80, 70, 60, 210));
	
	// -- 점수 내림차순정렬
	if(arr.length>0){
		document.getElementById("txtCount").value = arr.length;
		
		for(var j=1; j<arr.length; j++)
		{
			for(var k=0; k<arr.length-j; k++)
			{
				// -- [test] 바뀌는 여부 확인
				//console.log("1="+arr[k][4]);
				//console.log("2="+arr[k+1][4]);
				//console.log(parseInt(arr[k][4]) < parseInt(arr[k+1][4]));
				if(parseInt(arr[k][4]) < parseInt(arr[k+1][4]))
				{
					temp 	= arr[k];
					arr[k] 	= arr[k+1];
					arr[k+1]= temp;
				}
				//console.log("-------------");
			}
		}		
		
		//-- 헤더 출력
		document.getElementById("txtResult").value = "이름\t국어\t영어\t수학\t총점\t등수\n";
			
		//-- 데이터 출력
		for(var k=0; k<arr.length; k++)
		{
			for(var m=0; m<arr[k].length; m++)
			{
				document.getElementById("txtResult").value += arr[k][m] + "\t";
			}
			document.getElementById("txtResult").value += (k+1) + "등" + "\n";
		}
	}
	
}
</script>
</body>
</html>
```

### 3.3.24. Test024.html_자바스크립트를 활용한 테이블 동적 생성
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/7e305983-5e4c-4f8c-9254-d252c9086904)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test024.html</title>
<link rel="stylesheet" href="css/style.css">
 
</head>
<body class="section">
<div>
	<h1>자바스크립트를 활용한 테이블 동적 생성</h1>
	<hr>
</div>
 
<div class="layout">
	<form>
		<ul class="input_box">
			<li>
				<span stlye="tit">이름</span> <input type="text" id="txtName" class="txt">
			</li>			
			<li>
				<span stlye="tit">전화번호</span> <input type="text" id="txtTel" class="txt">
			</li>			
			<li>
				<span stlye="tit">주소</span> <input type="text" id="txtAddr" class="txt">
			</li>			
		</ul>
		
		<div class="btn_box">
			<button type="button" onclick="addMember()">회원 정보 입력</button>
		</div>
		
		<div class="tbl_ty01">
			<table border="1" id="memberTbl">
				<tr><td>이름</td><td>전화번호</td><td>주소</td></tr>
				<tr><td>임하성</td><td>010-1111-1111</td><td>제주 서귀포</td></tr>
				<tr><td>김민지</td><td>010-2222-2222</td><td>전남 여수</td></tr>
				<tr><td>정현욱</td><td>010-3333-3333</td><td>경남 산청</td></tr>
				<tr><td>박나영</td><td>010-4444-4444</td><td>서울 마포구</td></tr>
			</table>
		</div>
	</form>
</div>
 
<script type="text/javascript">
function addMember()
{
	// 확인
	
	var name = document.getElementById("txtName").value;	// "길현욱"
	var tel = document.getElementById("txtTel").value;		// "010-5555-5555"
	var addr = document.getElementById("txtAddr").value;	// "경기도 분당"
	
	// 확인
	//alert(name + " " + tel + " " + addr);
	
	// table 엘리먼트 접근(#memberTbl);
	var tableNode = document.getElementById("memberTbl");
	
	// 확인
	//alert(tableNode);
	
	// table tr td th
	// table thead tbody tr td th
	
	// tbody 엘리먼트 접근 -> 사용하지 않는 경우 생략
	// ※ 주의. 브라우저에 따라 다른 결과
	
	// 테스트
	//alert(tableNode.childNodes[0].nodeType);
	//--==>> 출력결과: 3
	
	//alert(tableNode.childNodes[0]);
	//--==>> 출력결과: [object Text]
	
	//alert(tableNode.childNodes[1]);
	//--==>> 출력결과: [object HTMLTableSectionElement]
	
	/* **
	- childNodes: 자식노드
	- 보통 복수의 엘리먼트는 배열(ex.childNodes)
	** */
	
	// **tbody를 쓰게 될 경우 참조하기**
	/* 
	if(tableNoe.childnodes[0].nodeType==1)
	{
		tbodyNode = tableNode.childNodes[0];	// IE
	}
	else
	{
		tbodyNode = tableNode.childNodes[1];	// CR, FF (IE를 제외한 거의 모든 브라우저)
	}
	 */
	 
	// <tr></tr> 엘리먼트 동적 생성
	// <td></td> 엘리먼트 동적 생성
	
	var trNode = document.createElement("tr");		//<tr></tr> 
	// **여는태그 닫는태그 따로 만드는 것이 아니라, ↖구문 작성시 알아서 생성됨**
	/* 
	var tdNode1 = document.createElement("td");		// <td></td>
	var nameNode = document.createTextNode(name);	// <td> 노드에 추가할 "길현욱" 텍스트 노드 ㅐㅇ성
	// **텍스트를 기반으로 작성된 가지**
	
	var tdNode2 = document.createElement("td");		// <td></td>
	var telNode = document.createTextNode(tel);		// <td> 노드에 추가할 "010-5555-5555"
	
	var tdNode = document.createElement("td");		// <td></td>
	var addrNode = documtne.createTextNode(addr);	// <td> 노드에 추가할 "경기도 분당"
	
	tdNode1.appendChild(nameNode);					// <td>"길현욱"</td>
	tdNode2.appendChild(telNode);					// <td>"010-5555-5555"</td>
	tdNode3.appendChild(addrNode);					// <td>"경기도 분당"</td>
	*/
	
	trNode.appendChild(createTdNode(name));			// <tr><td>"길현욱"</td></tr>
	trNode.appendChild(createTdNode(tel));			// <tr><td>"길현욱"</td><td>"010-5555-5555"</td></tr>
	trNode.appendChild(createTdNode(addr));			// <tr><td>"길현욱"</td><td>"010-5555-5555"</td><td>"경기도 분당"</td></tr>
 
	tableNode.appendChild(trNode);
}
 
 
function createTdNode(val)
{
	var textNode = document.createTextNode(val);
	var tdNode = document.createElement("td");
	tdNode.appendChild(textNode);
	
	return tdNode;
}
 
 
</script>
</body>
</html>
```

### 3.3.25. Test025_01.html(함께 푼 풀이)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/400c413f-2783-4305-936d-37e307eaa231)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test025_1.html</title>
<link rel="stylesheet" href="css/style.css">
 
</head>
<body class="section">
 
<div>
	<h1>테이블 동적 생성으로 만년달력 그리기</h1>
	<hr>
</div>
 
<div class="layout">
	<form>
		<div class="input_box">
			<input type="text" id="txtYear" class="txt" style="width: 80px">년
			<input type="text" id="txtMonth" class="txt" style="width: 40px">월
		</div>
 
		<div class="btn_box">
			<input type="button" class="btn" value="만년달력 그리기" onclick="actionCalendar()">
		</div>		
	
		<!-- 5-1 & 5-2 인 경우... -->
		
		<div>
			<table border="1" id="calendarTbl">
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</table>		
		</div>
			
		
		<!-- 5-3 인 경우... -->
		<!-- <div>
			<div id="newCalendarBox"></div>
		</div> -->
	</form>
</div>
 
<script type="text/javascript">
function actionCalendar()
{
 
	// 사용자가 입력한 년, 월 가져오기
	var yearStr = document.getElementById("txtYear").value;
	var monthStr = document.getElementById("txtMonth").value;
	
	// 문자열 형태로 확인해 볼수 있는 유효성 검사 코드 삽입 가능~!!!
	var year = parseInt(yearStr);
	var month = parseInt(monthStr);
	
	// **년도, 월 따로 필터링**
	/*
	if (year < 1)
	{
		alert("입력 년도 이상~!!!");
		return;
	}
	
	if (month < 1 || month > 12)
	{
		alert("입력 월 이상");
		return
	}
	 */
	 
	// **년도, 월 같이 필터링**
	if (year < 1 || month < 1 || month > 12)
	{
		alert("입력한 년 또는 월이 유효하지 않습니다~!!!");
		return;
	}
	
	// ※ 사용자가 입력한 년도, 월 -> 여기에 해당하는 1일의 요일 알아내기~!!
	
	// Math.floor();		-> 소수부 절삭	-> parseInt()
	// Math.ceil();			-> 소수부 올림
	// Math.round();		-> 소수부 반올림
	
	// 1단계. 1년 1월 1일 부터.. 입력 년도 기준 전년도 12월 31일 까지의 총 날짜 수 구하기
	//**자바에서는 정수 / 정수 가 정수만 나오지만, 자바스크립트에서는 소수점까지 모두 출력됨**
	var total = 0;
	total = (year-1)*365 + parseInt((year-1)/4) - parseInt((year-1)/100) + parseInt((year-1)/400);
	
	// 의미 확인
	//alert("1년1월1일 ~ "+ (year-1) + "년 12월 31일: "+ total + "일");
	//--==>> 1년1월1일 ~ 2023년 12월 31일: 738885일
	
	// 2단계. 해당 년도의 1월 1일부터.. 해당 년도 해당 월 1일 까지의 총 날짜 수 구해서 1단계에 더하기
	//		1단계 더하기
	var m = [31,28,31,30,31,30,31,30,31,31,30,31];
	
	// 확인
	//alert(m.length);
	//--==>> 12
	
	// (a)
	/* 
	for (var i=0; i<month-1; i++)
		total += m[i];
	total++;
	
	if (month >= 3 && (year%4==0 && year%100!=0 || year%400==0))
		total++;
	 */
	 
	// (b)
	if(year%4==0 && year%100!=0 || year%400==0)
		m[1]=29;
	
	for(var i=0; i<month-1; i++)
		total += m[i];
	total++;
	
	// 의미 확인
	//alert("1년1월1일 ~ "+ (year-1) + "년 12월 31일: "+ total + "일");
	//--==>> 1년1월1일 ~ 2023년 12월 31일: 738946일
	
	// 3단계. 해당 년도의 해당 월의 첫 날(1일)의 요일 구하기
	var days = total%7;
	// 확인
	//alert(days);
	//--==>> 5 (2024년 3월 기준) -> 2024년 3월 1일은 금요일
	//--==>> 2 (2023년 8월 기준) -> 2023년 8월 1일은 화요일
	
	// 4단계. 해당 년도 해당 월의 마지막 날짜 구하기
	//		(28일 or 29일 or 30일 or 31일)
	var lastDay = m[month-1];
 
	// 위에서 (a)방식으로 처리했을 경우는 추가 연산 필요
	/* 
	if(month==2 && (year%4==0 && year%100!=0 || year%400==0))	//**2월인 동시에 윤년이라면**
	{
		lastDay=29;
	}
	 */
	 
	// 확인
	//alert(lastDay);
	//--==>> 29 (2024년 2월 기준)
	//		28 (2023년 2월 기준)
	//		31 (2024년 3월 기준)
	 
	// 5단계. 해당 년도 해당 월 기준 달력 구성(출력, 그리기)
	
	// 5-1. 기존 테이블 활용하기
	//------------------------------------------------------------------------------------
	
	/*
	var tableNode = document.getElementById("calendarTbl");
	// <table id=calendarTbl>...</table>
	
	var trNode = document.createElement("tr");
	// <tr>..</tr>
	
	//	- 해당월의 1일이 시작되기 전에 빈칸 td 채우기
	for(var i=0; i<days; i++)
	{
		trNode.appendChild(createTdNode(""));
	}
	//	- 1일 부터.. 해당 월의 마지막 날짜까지 빈칸 td 채우기
	var d = 1;
	for(var d=1; d<=lastDay; d++)
	{
		trNode.appendChild(createTdNode(d));		// 어떤 형태인지 확인
		
		// 일요일을 그리기 시작할 때...
		// 기존 tr 구성을 마무리하고
		// 다시 새로운 tr을 구성
		
		// check~!!! ---------------------------------
		if((d+days)%7==0) 							// 일요일을 그리기 전에...
		{
			//tableNode.appendChild(trNode);			// trNode 를 tableNode 에 추가
			tbodyNode.appendChild(trNode);
			trNode = document.createElement("tr");	// 새로운 trNode 구성
		}
		// ---------------------------------- check~!!!
	}
	
	// 확인
	//-- 31일 까지 출력한 날짜에서 확인한 결과
	//alert(d);
	//--==>> 32 **(2023년 3월 -> 31이 마지막 날, d 출력은 32)**
	
	//	- 날짜 구성 이후 마지막 빈칸 td 채우기
	//		(최종적으로 처리된 날짜가 일요일 개행이 적용되지 않은 경우만...)
	// **중요**
	if( ((d-1)+days)%7!=0 )
	{
		for(var i=0; i<7; i++,d++)	//**d 도 1씩 증가시켜야함**
		{
			trNode.appendChild(createTdNode(""));
			
			if((d+days)%7==0)
			{
				//tableNode.appendChild(trNode);
				tbodyNode.appendChild(trNode);
				break;			
			}				
		}
	}
	
	//tableNode.appendChild(trNode);
	*/
	//--------------------------------------------------------------- 기존 테이블 활용하기
 
	
	
	// 5-2. tbody 활용하기
	//------------------------------------------------------------------------------------
	
	var tableNode = document.getElementById("calendarTbl");
	var tbodyNode = null;
	
	// 확인
	//alert(tableNode);							//--==>> [object HTMLTableElement]
	//alert(tableNode.childNodes[0]);			//--==>> [object Text]
	//alert(tableNode.childNodes[0].nodeType) 	//--==>> 3
	//alert(tableNode.childNodes[1]);			//--==>> [object HTMLTableSectionElement]
	
	if(tableNode.childNodes[0].nodeType==1)
		tbodyNode = tableNode.childNodes[0];
	else
		tbodyNode = tableNode.childNodes[1];	// 크롬
	
	// 확인
	//alert(tbodyNode.childNodes.length);			//--==>> 2
	//alert(tbodyNode.childNodes[0]);				//--==>> [object HTMLTableElement]
	//alert(tbodyNode.childNodes[1]);				//--==>> [object Text]
	
	// tbodyNode 의 기존 자식 노드 삭제 과정
	for (var n=tbodyNode.childNodes.length-1; n>=0; n--)	// 1 0
	{
		tbodyNode.removeChild(tbodyNode.childNodes[n]);
	}
	
	// <table></table>
	
	var trNode = document.createElement("tr");		//<tr></tr>
	
	// 요일 이름 다시 출력하기
	var dayNames = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	for(var i=0; i<dayNames.length; i++)
	{
		trNode.appendChild(createTdNode(dayNames[i]));
	}
	tbodyNode.appendChild(trNode);
	
	//*******************위의 내용과 같은 부분*******************
	var trNode = document.createElement("tr");
	// <tr>..</tr>
	
	//	- 해당월의 1일이 시작되기 전에 빈칸 td 채우기
	for(var i=0; i<days; i++)
	{
		trNode.appendChild(createTdNode(""));
	}
	//	- 1일 부터.. 해당 월의 마지막 날짜까지 빈칸 td 채우기
	var d = 1;
	for(var d=1; d<=lastDay; d++)
	{
		trNode.appendChild(createTdNode(d));		// 어떤 형태인지 확인
		
		// 일요일을 그리기 시작할 때...
		// 기존 tr 구성을 마무리하고
		// 다시 새로운 tr을 구성
		
		// check~!!! ---------------------------------
		if((d+days)%7==0) 							// 일요일을 그리기 전에...
		{
			//tableNode.appendChild(trNode);			// trNode 를 tableNode 에 추가
			tbodyNode.appendChild(trNode);
			trNode = document.createElement("tr");	// 새로운 trNode 구성
		}
		// ---------------------------------- check~!!!
	}
	
	// 확인
	//-- 31일 까지 출력한 날짜에서 확인한 결과
	//alert(d);
	//--==>> 32 **(2023년 3월 -> 31이 마지막 날, d 출력은 32)**
	
	//	- 날짜 구성 이후 마지막 빈칸 td 채우기
	//		(최종적으로 처리된 날짜가 일요일 개행이 적용되지 않은 경우만...)
	// **중요**
	if( ((d-1)+days)%7!=0 )
	{
		for(var i=0; i<7; i++,d++)	//**d 도 1씩 증가시켜야함**
		{
			trNode.appendChild(createTdNode(""));
			
			if((d+days)%7==0)
			{
				//tableNode.appendChild(trNode);
				tbodyNode.appendChild(trNode);
				break;			
			}				
		}
	}
	
	//tableNode.appendChild(trNode);
	
	//--------------------------------------------------------------------- tbody 활용하기
	
	
	// 5-3. 새로운 달력 그리기
	//------------------------------------------------------------------------------------
	/* 
	var calendarBox = document.getElementById("newCalendarBox");
	
	var tableNode = document.createElement("table");		//<table></table>
	
	var trNode = document.createElement("tr");				//<tr></tr>
	
	var dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fir", "Sat"];
	for(var i=0; i<dayNames.length; i++)
		trNode.appendChild(createTdNode(dayNames[i]));
	tableNode.appendChild(trNode);
	
	// S: *******************위의 내용과 같은 부분*******************
	var trNode = document.createElement("tr");
	// <tr>..</tr>
	
	//	- 해당월의 1일이 시작되기 전에 빈칸 td 채우기
	for(var i=0; i<days; i++)
	{
		trNode.appendChild(createTdNode(""));
	}
	//	- 1일 부터.. 해당 월의 마지막 날짜까지 빈칸 td 채우기
	var d = 1;
	for(var d=1; d<=lastDay; d++)
	{
		trNode.appendChild(createTdNode(d));		// 어떤 형태인지 확인
		
		// 일요일을 그리기 시작할 때...
		// 기존 tr 구성을 마무리하고
		// 다시 새로운 tr을 구성
		
		// check~!!! ---------------------------------
		if((d+days)%7==0) 							// 일요일을 그리기 전에...
		{
			//tableNode.appendChild(trNode);			// trNode 를 tableNode 에 추가
			tbodyNode.appendChild(trNode);
			trNode = document.createElement("tr");	// 새로운 trNode 구성
		}
		// ---------------------------------- check~!!!
	}
	
	// 확인
	//-- 31일 까지 출력한 날짜에서 확인한 결과
	//alert(d);
	//--==>> 32 **(2023년 3월 -> 31이 마지막 날, d 출력은 32)**
	
	//	- 날짜 구성 이후 마지막 빈칸 td 채우기
	//		(최종적으로 처리된 날짜가 일요일 개행이 적용되지 않은 경우만...)
	// **중요**
	if( ((d-1)+days)%7!=0 )
	{
		for(var i=0; i<7; i++,d++)	//**d 도 1씩 증가시켜야함**
		{
			trNode.appendChild(createTdNode(""));
			
			if((d+days)%7==0)
			{
				//tableNode.appendChild(trNode);
				tbodyNode.appendChild(trNode);
				break;			
			}				
		}
	}
	
	//tableNode.appendChild(trNode);
	
	// E: *******************위의 내용과 같은 부분*******************
	
	// check~!!!
	// ****
	calendarBox.appendChild(tableNode);
	 */
	//----------------------------------------------------------------- 새로운 달력 그리기
	
	//		- 해당 월의 1일이 시작되기 전에 빈 칸 td 채우기
	
	
}
 
function createTdNode(val) 							// "홍길동"
{
	var textNode = document.createTextNode(val);	// ㄴ "홍길동"
	var tdNode = document.createElement("td");		// <td></td>
	tdNode.appendChild(textNode);					// <td></td>
													//		ㄴ "홍길동"
	return tdNode;									// <td>홍길동</td>
}
</script>
 
</body>
</html>
```

### 3.3.26. Test026_01.html_가위, 바위, 보 게임
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/dfde5a60-bffc-4967-b37a-1dea15d23df9)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test026_1.html</title>
<link rel="stylesheet" href="css/style.css">
 
</head>
<body class="section">
	
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
 
<!-- 
	가위, 바위, 보 게임을 구성한다.
	HTML, CSS, Javascript 를 활용한다.
	자바스크립트의 난수 발생 함수를 찾아 활용한다.
	(https://www.w3schools.com/js/js_random.asp)
	ㄴ 한명의 개발자가 학습 사이트 개발..(북유럽사람..?)
		ㄴ 세심하게 다루고 있는 좋은 사이트라고 알고있음
	
	-> http://w3schools.com
	-> http://koxo.com
	
	페이지 레이아웃
	---------------------------------------------------
	입력(1.가위, 2.바위, 3.보)	[ 2 ] <게임 결과 확인>
	
	[ 사용자:바위, 컴퓨터: 보 -> 컴퓨터가 이겼습니다. ]
	
	---------------------------------------------------
 -->
	
<div class="layout">
	<div class="input_box btn_box">
		<span class="tit">입력(1.가위, 2.바위, 3.보)</span> &nbsp;
		<input type="text" style="width: 50px;" id="txtUser"> &nbsp;
		<input type="button" value="게임 결과 확인" onclick="startGame()">
	</div>
	<div class="result_box">
		<input type="text" id="txtResult" style="width: 400px">
	</div>
</div>
<script type="text/javascript">
function startGame()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var strArr = ["가위", "바위", "보"];
	
	// ※ Math.random();	-- 0.0 ~ 1.0 사이의 실수
	
	// 확인
	//alert(Math.random());
	//--==>> 0.049615637999615325
	//		 0.3941272592445273
	//		 0.16831448825637696
	
	// 현재 우리에게 필요한 것은
	// 1~3 의 정수 형태의 난수
	//parseInt(Math.random())*3;		// 0 
	//parseInt(Math.random()*3); 		// 0 1 2
	//parseInt(Math.random()*3)+1;		// 1 2 3
	var c = parseInt(Math.random()*3)+1;
	
	//확인
	//alert(c);
	//--==>> 1~3 사이의 정수 형태의 난수 발생 확인
	
	var u = parseInt(document.getElementById("txtUser").value);
	
	var message = "사용자: "+ strArr[u-1] + "\t컴퓨터: "+ strArr[c-1];
	
	// 확인
	//alert(message);
	/* 
	if(u==1 && c==1 || u==2 && c==2 || u==2 && c==3)
		message +="\t-> 비겼습니다.";
	else if (u==1 && c==2 || u==2 && c==3 || u==3 && c==1)
		message += "\t-> 컴퓨터가 이겼습니다.";
	else
		message += "\t-> 당신이 이겼습니다.";
	 */
	
	if(u==c)
		message +="\t-> 비겼습니다.";		
	else if (u%3 == (c+2)%3)
		message += "\t-> 컴퓨터가 이겼습니다.";
	else
		message += "\t-> 당신이 이겼습니다.";
	 
	document.getElementById("txtResult").value= message;
	
}
 
</script>
	
	
</body>
</html>
```

### 3.3.27. Test027_01.html_로또 번호 오름차순/Math.random(), 무명함수 sort()
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/f77d5023-6cc5-4590-b0a8-014feaf7a492)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test027_1.html</title>
<link rel="stylesheet" href="css/style.css">
 
</head>
<body class="section">
	
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
 
<!-- 
	로또 번호(1~45)를 중복되지 않은 정수 6개를 생성하여
	출력해주는 페이지를 구현한다.
	HTML, CSS, Javascript 를 활용한다.
	난수 발생 함수를 활용한다.
	번호순으로 오름차순 정렬하여 출력할 수 있도록 한다.
	사용자가 주문한 장 수 만큼 출력 할 수 있도록 한다.
	
	페이지 레이아웃
	-----------------------------------------------------------
	
	로또 [ 3 ] 장 <주문하기>					#txtCount
		  ㄴ text 	ㄴ button
	
	결과
	--------------------------- -> textarea 	#resultArea
	1 2 5 8 10 12
	6 13 22 23 29 31
	2 3 21 34 42 44
	---------------------------
	
	-----------------------------------------------------------	
 -->
<div class="layout">
	<div class="input_box btn_box">
		<span class="tit">로또</span> &nbsp;
		<input type="text" style="width: 50px;" id="txtCount" value="3"> 장&nbsp;
		<input type="button" value="주문하기" onclick="createLotto()">
		<!-- <button type=button onclick="createLotto()">주문하기</button> -->
	</div>
	<div class="result_box">
		<textarea rows="20" cols="40" id="resultArea"></textarea>
	</div>
</div>
 
<script type="text/javascript">
function createLotto()
{
	
	document.getElementById("resultArea").value = "";	// **초기화**
	
	var count = parseInt(document.getElementById("txtCount").value);
	
	for(var i=0; i<count; i++)
	{
		// 로또 1게임 실행
		document.getElementById("resultArea").value += runLottoSingle() + "\n";
		
	}
	
}
// 로또 한게임 실행 함수
function runLottoSingle()
{
	// 방 6개로 구성된 배열 생성	
	var lottoArray = new Array(6);
	
	// 공(ball) 45개로 구성된 배열 생성
	var arr = new Array(45);
	
	// 1 ~ 45 까지의 로또 번호를 공에 채우기(새겨 넣기)
	for(var i=1; i<=arr.length; i++)
		arr[i-1] = i;
	
	// 확인
	//alert(arr[9]);		//--==>> 9
	//alert(arr[30]);		//--==>> 31
	
	// 뒤섞기
	for(var i=0; i<arr.length; i++)			//0~44
	{
		var j = parseInt(Math.random()*45);	//0~44 까지의 정수 형태의 난수 발생
		
		var temp = arr[i];					// (임의의 자리 번호 뽑기)
		arr[i] = arr[j];					//	┐ 
		arr[j] = temp;						//  ┘자리 바꾸기
	}
	
	// 확인
	//alert(arr);
	
	// 배열의 요소 옮겨닮기
	for(var i=0; i<lottoArray.length; i++)	// 0 1 2 3 4 5
		lottoArray[i] = arr[i];
	
	// 확인
	//return lottoArray;						// 더미 반환
	
	// 정렬 수행
	//lottoArray.sort(기능);
	lottoArray.sort(function(a, b)
	{
		return Number(a) - Number(b);
	});
	// **무명함수, (오름차순 a-b/ 내림차순 b-a) **
	// **(참조: https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/sort)**
	
	// 기능, 동작, 행위 -> 함수 -> 함수 정의 -> 불러다 쓸 수 있는 형태
	//											(이름이 정해진 함수)
	
	// 구성된 배열(최종 결과값) 반환
	return lottoArray;	
}
 
</script>
</body>
</html>
```

### 3.3.28. Test028.html_라디오버튼, 체크박스 다루기(1)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/2dbf00cc-26b6-452f-a998-4d8a4b3dbc28)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test028.html</title>
<link rel="stylesheet" href="css/style.css">
 
</head>
<body class="section">
 
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>라디오버튼, 체크박스 다루기(1)</h2>
	<form>
		<div>
			---- 사이즈 선택 ---- <br><br>
			
			<!-- **같은 그룹일 경우 name을 같게 해야함** -->
			<input type="radio" name="radioGruop" id="a" value="1"> <label for="a">싱글</label>
			<!-- **라디오 독립적인 컨트롤 시 label과 input 따로, 아닐시 같이 만들기** -->
			<label><input type="radio" name="radioGruop" id="b" value="2"> 더블</label>
			<label><input type="radio" name="radioGruop" id="c" value="3"> 파인트</label>
			<label><input type="radio" name="radioGruop" id="d" value="4"> 쿼터</label>
			<label><input type="radio" name="radioGruop" id="e" value="500"> 패밀리</label>
			<label><input type="radio" name="radioGruop" id="f" value="6"> 하프갤런</label>
		</div>
		
		<div class="btn_box">
			<button type="button" class="btn" onclick="actionChoice()">확인</button>
		</div>
		
	</form>
</div>
<script type="text/javascript">
function actionChoice()
{
	// 확인
	//alert("함수 호출~!!!");
 
	//var radio1 = document.getElementById("a");
	var radioObj = document.getElementsByName("radioGruop");
	/* **
		radio 컨트롤시 신경써야 하는 부분
		1) getElementsByName 사용('s'에 유의!)
	**	*/
	
	// 확인
	//alert(radioObj);
	//--==>> [object NodeList] -> 자바스크립트 배열
	//alert(radioObj.length);
	//--==>> 6 
	
	var message="선택된 항목이 존재하지 않습니다.";
	for (var i = 0; i < radioObj.length; i++)	// 0 1 2 3 4 5
	{
		// 확인
		//alert(radioObj[i].checked);
		
		if(radioObj[i].checked)
		{
			// 확인
			//alert(i);
			//alert(radioObj[i].value);
			
			message = "당신이 선택한 사이즈는 아이크림의 종류를 "
						+ radioObj[i].value + "개 고를 수 있습니다.";
			break;	//**불필요하게 도는 횟수를 줄일 수 있음**
		}	
	}
	alert(message);
}
</script>
</body>
</html>
```

### 3.3.29. Test029.html_라디오버튼, 체크박스 다루기(2)
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/f3adb592-5cf7-4e09-953e-ac35fb848f4d)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test029.html</title>
<link rel="stylesheet" href="css/style.css">
 
</head>
<body class="section">
 
<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>
 
<div class="layout">
	<h2>라디오버튼, 체크박스 다루기(2)</h2>
	<form>
		<div>
			--- 과목 선택 ---<br><br>
			<input type="checkbox" name="checkGroup" id="a" value="j001(자바기초)">
			<label for="a">JAVA Beginning</label>
			
			<label>
				<input type="checkbox" name="checkGroup" id="b" value="o002(오라클)">
				Oracle
			</label>
			<label>
				<input type="checkbox" name="checkGroup" id="c" value="o003(자바심화)">
				JAVA Advanced
			</label>
			<br><br>
			<label>
				<input type="checkbox" name="checkGroup" id="d" value="w102(웹클라이언트)">
				Web Client
			</label>
			<label>
				<input type="checkbox" name="checkGroup" id="e" value="w304(웹APP서버)">
				JSP/Servlet
			</label>
			<label>
				<input type="checkbox" name="checkGroup" id="f" value="f204(프레임워크)">
				Framework
			</label>
		</div>
		
		
		<div class="btn_box">
			<button type="button" onclick="actionChoice()">선택 완료</button>
		</div>
	</form>
</div>
<script type="text/javascript">
function actionChoice()
{
	// 확인
	//alert("함수 호출~!!!");
	
	var checkObj = document.getElementsByName("checkGroup");
	var msg = "";
	var flag = true;
	
	// 확인
	//alert(checkObj);
	//--==>> [object NodeList] -> 자바스크립트 배열
	//alert(checkObj.length);
	//--==>> 6
	
	// 확인
	//alert(checkObj[0].checked);
	//--==>> true(체크 설정 시) / false (체크 해제 시)
	
	for(var i=0; i<checkObj.length; i++)	// 0 1 2 3 4 5
	{
		// 확인
		//alert(checkObj[i].checked);
		
		if(checkObj[i].checked)
		{
			msg += checkObj[i].value + " ";
			flag = false;			
		}
	}
	
	if(flag)
	{
		msg="선택한 과목이 없습니다.";
		alert(msg);
	}else
	{
		alert(msg);		
	}
	
}
</script>
</body>
</html>
```

### 3.3.30. Test030.html_아이스크림 주문/this
![image](https://github.com/ohsukyoung/sist_storage/assets/143863402/5a6c8583-609e-408e-bc50-0424ad183123)

``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test030.html</title>

<style type="text/css">
	@font-face {
				    font-family: 'CookieRun-Regular';
				    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
				    font-weight: normal;
				    font-style: normal;
				}
				
	* {font-family: 'CookieRun-Regular'; color: #ed2499; text-align: center; background-color: #ffcfd6;}
	
	
	form {background-image: url("https://isplus.com/data/isp/image/2017/12/21/isphtm_20171221112824165729.jpg");
		   padding: 20pt; border-radius: 40pt; color: #8f3251; margin: auto; text-align: center;}
		   
	label { color: #e06c8f; background-color: #defaf1; margin: 10pt; border-radius: 20pt; padding: 3pt; vertical-align: middle; line-height: 25pt; justify-content: center;}

	span {background-color: #e86d96; color: white;  padding: 15pt; border-radius: 20pt; border: thick;}

	h1 { padding: 10pt; background-color: #defaf1; border-radius: 20pt; text-align: center; border: thick;}
</style>


<script type="text/javascript">

	//*************************************************************
	// 체크박스를 선택 할 때, 최대로 선택 가능한 값이 몇인지를
	// 체크박스 선택 함수에서도 확인할 수 있어야 하기 때문에
	// 전역변수로 선언해 주었다~~
	//************************************************************
	var cnt = 0;				//-- 선택할 수 있는 아이스크림의 개수는
	var userCnt = 0;			//-- 사용자가 선택한 아이스크림의 개수

	// 사이즈 선택 시 호출
	function countSet(val)
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		//alert(val);
		
		// 매개변수로 넘겨받은 데이터를 이용하여
		// 선택할 수 있는 아이스크림의 개수 설정
		cnt = parseInt(val);
		
		// 확인
		alert("당신이 선택할 수 있는 아이스크림의 개수는 『" + cnt + "』 입니다.");
	}
	
	// 아이스크림 종류 선택 시 호출
	function actionChoice(obj)
	{
		// 확인
		//alert("함수 호출~!!!");
		//alert("체크되었는지의 여부");
		
		//===============================================================
		// checked 속성 : 체크되었을 때 true 반환.
		// 체크박스의 기본 설정으로 부여하게 되면, 디폴트값이 checked!
		//===============================================================
			
		//alert(obj);
		//alert(obj.checked);
		
		
		//-- 체크 설정되며 클릭된 상황 vs 체크 해제되며 클릭된 상황 → 판단 가능~!!!
		//--==>> true / false → 클릭 액션에 의해 check 되었을 때 true
		
		
		
		
		
		if (obj.checked)	//-- true → 체크 설정
		{
			if (userCnt >= cnt)
			{
				alert("선택할 수 있는 개수를 초과하였습니다~!!!");
				
				// check~!!!
				
				obj.checked = false;
				
				return;
				// return 문 뒤에 작성하면, 함수가 종료된 이후이므로
				// 작성 내용이 반영되지 않는다. 반드시 return 이전에 작성하자.
			}
			
			
			// 사용자가 선택한 개수 증가
			userCnt++;
		}
		else				//-- flase → 체크 해제
		{
			// 사용자가 선택한 개수 감소 
			userCnt--;
		}
		
		// 확인
		//alert("userCnt : " + userCnt);
		//alert(cnt + " 중 " + userCnt + " 선택");
		
	}

</script>


</head>
<body>
<!-- 
	1. 사이즈 선택
	2. 몇 종류의 아이스크림을 선택할 수 있는지 앞에서 했던 내용에 준하도록 처리.
	3. 최대 선택 가능 → 
	   초과해서 선택할 경우 ("선택 개수를 초과하셨습니다.")
	    → 확인 버튼 누르면 마지막에 선택한 항목을 체크 해제한다.
	
	
 -->

<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>

<div>
	<h2>아이스크림 주문</h2>
	
	<form>
		--- 사이즈 선택 --- <br><br>
		<span>
			<input type="radio" id="a1" name="radioGroup" value="1" onclick="countSet(1)"> 싱글
			<input type="radio" id="b1" name="radioGroup" value="2" onclick="countSet(2)"> 더블
			<input type="radio" id="c1" name="radioGroup" value="3" onclick="countSet(3)"> 파인트
			<input type="radio" id="d1" name="radioGroup" value="4" onclick="countSet(4)"> 쿼터
			<input type="radio" id="e1" name="radioGroup" value="5" onclick="countSet(5)"> 패밀리
			<input type="radio" id="f1" name="radioGroup" value="6" onclick="countSet(6)"> 하프갤런
		</span>
		<br><br>
		
		
		-- 종류 선택 -- <br><br>
		
		<label>																	<!-- "" 큰 따옴표 안에 문자열을 넣을 때는 작은 따옴표 '' 로 문자열을 전달하자.  -->
																				<!-- '엄마=\'A\'' 이스케이프 문자를 사용한 '' 따옴표 문자열 포함.-->
			<input type="checkbox" name="checkGroup" id="a2" value="엄마" onclick="actionChoice(this)"> 엄마는외계인
		</label>		
			<!-- [this] : this 가 포함된 객체 전체를 가져온다. 여기서의 this는 checkbox 오브젝트 전체를 의미한다. -->
		
		<label>
			<input type="checkbox" name="checkGroup" id="b2" value="레인" onclick="actionChoice(this)"> 레인보우샤베트
		</label>
		
		<label>
			<input type="checkbox" name="checkGroup" id="c2" value="민트" onclick="actionChoice(this)"> 민트초코
		</label>
		<br>
		
		<label>
			<input type="checkbox" name="checkGroup" id="d2" value="바람" onclick="actionChoice(this)"> 바람과함께사라지다
		</label>
		<label>
			<input type="checkbox" name="checkGroup" id="e2" value="애플" onclick="actionChoice(this)"> 애플민트
		</label>
		<label>
			<input type="checkbox" name="checkGroup" id="f2" value="나무" onclick="actionChoice(this)"> 초코나무숲
		</label>
		<br>
		
		<label>
			<input type="checkbox" name="checkGroup" id="g2" value="피스" onclick="actionChoice(this)"> 피스타치오아몬드
		</label>
		<label>
			<input type="checkbox" name="checkGroup" id="h2" value="봉봉" onclick="actionChoice(this)"> 아몬드봉봉
		</label>
		<label>
			<input type="checkbox" name="checkGroup" id="i2" value="요거" onclick="actionChoice(this)"> 요거트31
		</label>
		<br>
		
		<label>
			<input type="checkbox" name="checkGroup" id="j2" value="체리" onclick="actionChoice(this)"> 체리쥬빌레
		</label>
		<label>
			<input type="checkbox" name="checkGroup" id="k2" value="슈팅" onclick="actionChoice(this)"> 슈팅스타
		</label>
		<label>
			<input type="checkbox" name="checkGroup" id="l2" value="사랑" onclick="actionChoice(this)"> 사랑에빠진딸기
		</label>
		<br>
		
		<label>
			<input type="checkbox" name="checkGroup" id="m2" value="치즈" onclick="actionChoice(this)"> 뉴욕치즈케이크
		</label>
		<label>
			<input type="checkbox" name="checkGroup" id="n2" value="쿠앤크" onclick="actionChoice(this)"> 쿠앤크
		</label>
		<label>
			<input type="checkbox" name="checkGroup" id="o2" value="베리" onclick="actionChoice(this)"> 베리베리스트로베리
		</label>
		<br>
		
	
	</form>
</div>

</body>
</html>
```

### 3.3.31. Test031_1.html_선택목록(select) 다루기/ formclear(), .reset(), .forms[0].reset(), .focus()
``` html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test031_1.html</title>
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript">

	// select 를 다루어보기 위한 테스트 함수 정의
	function selectTest()
	{
		// 확인
		//alert("함수 호출~!!!");
		
		
		// **컨트롤 하는 방법을 여러가지로 알아둬야함**
		
		// 첫 번째 방법 ========================================================
		/* 
		var positionStr = document.getElementById("userPosition").value;
		
		// 확인
		alert(positionStr);
		*/
		
		// 두 번째 방법 ========================================================
		/* 
		var positionObj = document.getElementById("userPosition");
		var positionOptions = positionObj.options;		//**배열~!!!**
		var positionMsg = "";
		
		// 확인
		//alert(positionOptions);
		//--==>> [object HTMLOptionsCollection] -> 자바스크립트 배열
		
		//alert(positionOptions.length);
		//--==>> 4
		
		for (var i = 0; i < positionOptions.length; i++)		// 0 1 2 3
		{
			// 확인
			//alert(positionOptions[i].selected);
			//--==>> 선택된 옵션 항목에 따라 true/false 형태로 확인
			//		ture false false false (부장 선택된 상태)
			//		false false false true (사원 선택된 상태)
			
			if(positionOptions[i].selected)
			{
				// 확인
				//alert(i);
				//--==>> 0 (부장 선택된 상태)
				//		 3 (사원 선택된 상태)
				
				// 단일 선택
				//positionMsg = positionOptions[i].value;
				//break;
				
				// 다중 선택
				positionMsg = positionOptions[i].value + " ";
				// **다중 선택에서는 break 쓰면 X**
			}
		}
		
		// 확인
		alert(positionMsg); 
		*/
		
		// 세 번째 방법 =====================================================
		/* 
		var positionObj = document.getElementById("userPosition");
		
		// 확인
		//alert(positionObj.selectedIndex);
		//--==>> 부장->0, 과장->1, 대리->2, 사원->3
		
		// 확인
		//alert(positionObj.options[2].value);
		//--==>> cde(대리)
		//alert(positionObj.options[0].value);
		//--==>> zaq(부장)
		
		positionMsg = positionObj.options[positionObj.selectedIndex].value;
		//			  ------------------- 배열
		//								 -------------------------- 선택된 인덱스 번호
		//															------ 배열의 값
		
		// 확인
		alert(positionMsg);
		 */
		
	}
function addMember()
{
	var uName = document.getElementById("userName").value;
	var uSsn = document.getElementById("userSsn").value;
	
	//var uCity = document.getElementById("userCity").value
	var cityObj = document.getElementById("userCity");
	
	//alert(cityObj.selectedIndex);
	//--==>> 서울 -> 0, 대전 -> 1, 대구 -> 3
	
	//alert(cityObj.options[cityObj.selectedIndex].value);
	//--==>> 1123(서울), 3328(대전), 4239(광주), 5832(대구)
	
	
	
	var uCity = cityObj.options[cityObj.selectedIndex].value;
	
	var BuseoObj = document.getElementById("userDepartment");
	var uBuseo = BuseoObj.options[BuseoObj.selectedIndex].value;
	
	var positionObj = document.getElementById("userPosition");
	var uPosition = positionObj.options[positionObj.selectedIndex].value;
	
	var uBasicPay = document.getElementById("userBasicPay").value;
	
	// 테이블 그리기 ---------------------------------------------------
	
	var tableNode = document.getElementById("memberList");
	
	var trNode = document.createElement("tr");
	
	trNode.appendChild(createTdNode(uName));
	trNode.appendChild(createTdNode(uSsn));
	trNode.appendChild(createTdNode(uCity));
	trNode.appendChild(createTdNode(uBuseo));
	trNode.appendChild(createTdNode(uPosition));
	trNode.appendChild(createTdNode(uBasicPay));
	
	tableNode.appendChild(trNode)	
	// ---------------------------------------------------- 테이블 그리기
	
	//formclear();									//check~!!!
													//**데이터 입력후 내용 리셋**
	
	//document.getElementById("listForm").reset();	//check~!!!
	document.forms[0].reset();						//check~!!!
	
	document.getElementById("userName").focus();		//check~!!!
	
}
function createTdNode(val)
{
	var txtNode = document.createTextNode(val);
	var tdNode = document.createElement("td");
	tdNode.appendChild(txtNode);
	
	return tdNode;
}
function formclear()
{
	document.getElementById("userName").value = "";
	document.getElementById("userSsn").value = "";
	var cityObj = document.getElementById("userCity");
	cityObj.options[0].selected = true;
	
	var buseoObj = document.getElementById("userDepartment");
	buseoObj.options[3].selected = true;
	
	var jikwiObj = document.getElementById("userPosition");
	document.getElementById("userBasicPay").value= "";
}

</script>


</head>
<body class="section">

<div>
	<h1>자바스크립트 활용</h1>
	<hr>
</div>

<div>
	<h2>선택목록(select) 다루기</h2>
	
	
	<form id="listForm">
		<table>
			<tr>	
				<td>이름</td>
				<td>
					<input type="text" id="userName">
				</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" id="userSsn">
				</td>
			</tr>
			<tr>
			
			<!-- "서울" "마포구"... 이런식으로 사용자 입력으로 받으면 처리가 불가능하다. -->
			<!-- 선택지에서 선택할 수 있도록 변경해야 한다! 【text → select[드롭다운]】 -->
			
				<td>지역</td>
				<td>
					<!-- <input type="text" id="userCity"> -->
					<select id="userCity">
						<option value="1123(서울)">서울</option>
						<option value="3328(대전)">대전</option>
						<option value="4239(광주)">광주</option>
						<option value="5832(대구)">대구</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<!-- <input type="text" id="userDepartment"> -->
					<select id="userDepartment">
						<option value="9987(개발부)">개발부</option>
						<option value="9986(인사부)">인사부</option>
						<option value="9985(자재부)">자재부</option>
						<option value="9984(영업부)" selected>영업부</option>
						<option value="9983(총무부)">총무부</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>직위</td>
				<td>
					<!-- <input type="text" id="userPosition"> -->
					<select id="userPosition">
						<option value="zaq(부장)">부장</option>
						<option value="xsw(과장)">과장</option>
						<option value="cde(대리)">대리</option>
						<option value="bgt(사원)" selected>사원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>기본급</td>
				<td>
					<input type="text" id="userBasicPay">
				</td>
			</tr>
			<tr class="btn_box">
				<td colspan="2" style="text-align: center">
					
					<!-- 선택된 값을 가져오는 1,2,3 방법 -->
					<!-- <input type="button" value="직원 추가" class="btn" style="width: 48%"
					onclick="selectTest()"> -->
					
					<!-- 직원 추가 기능  -->
					<input type="button" value="직원 추가" class="btn"
					onclick="addMember()">
					
					<input type="reset" value="입력 취소" class="btn">
				</td>
			</tr>
		</table>
		<br>
		
		
		<table id="memberList">
			<tr>
				<td>이름</td>
				<td>주민번호</td>
				<td>지역</td>
				<td>부서</td>
				<td>직위</td>
				<td>기본급</td>
			</tr>
		</table>
		
	</form>
</div>


</body>
</html>
```

### 3.3.32.
``` html
```

### 3.3.33.
``` html
```

### 3.3.34.
``` html
```

### 3.3.35.
``` html
```

### 3.3.36.
``` html
```

### 3.3.37.
``` html
```

### 3.3.38.
``` html
```

### 3.3.34.
``` html
```









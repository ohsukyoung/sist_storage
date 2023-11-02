# ✅ (PL/SQL)개념

<BR>

# 1. 개념
## 1.1. PL/SQL
1. PL/SQL(Procedural Language extension to SQL) 은
   프로그래밍 언어의 특성을 가지는 SQL의 확장이며 데이터 조작과 질의 문장은 PL/SQL의 절차적 코드 안에 포함된다.  
   또한, PL/SQL 을 사용하면 SQL 로 할 수 없는 절차적 작업이 가능하다.  
   여기에서 『절차적』 이라는 단어가 가지는 의미는 어떤 것이 어떤 과정을 거쳐 어떻게 완료되는지 그 방법을 정확하게 코드에 기술한다는 것을 의미한다.  
 
>--* PL/SQL?  
이제 곧 배울 프로시저나 트리거나 펑션들은 PL/SQL영역에 속한다.  
크게 SQL문법과 PL/SQL 둘로 나누어져있다고 볼 수 있다.  
PL/SQL은 SQL문법의 확장판이라고 볼 수 있다. PL은 절차적인(P) 언어(L)라는 의미를 품고있다.  
지금까지는 자바랑 다른 구조로 오라클을 들여다보았지만, PL/SQL은 프로그램적 특성을 가져 자바와 비슷한 부분이 많다고 느낄 것이다.  
(변수선언, 조건에 따른분기, 반복문, TRUE FALSE로 실행흐름을 컨트롤하는 등)  
따라서, PL/SQL은 변수를 선언하고 어떤 것이 어떤 과정을 거쳐 완료되는지 코드에 기술하므로 절차적이라는 단어로 표현할 수 있을 것이다.  

 
2. PL/SQL 은 절차적으로 표현하기 위해  
   변수를 선언할 수 있는 기능,  
   참과 거짓을 구별할 수 있는 기능,  
   실행흐름을 컨트롤할 수 있는 기능 등을 제공한다.  
 
3. PL/SQL 은 블럭 구조로 되어 있으며,  
   블럭은 선언 부분, 실행 부분, 예외 처리 부분의 세 부분으로 구성되어 있다.  
   또한, 반드시 실행 부분은 존재해야 하며, 구조는 다음과 같다.  
 

>--* 블럭구조?  
자바에서 {}로 영역구분을 하듯 PL/SQL은 블럭단위로 구조화하며, 영역을 나누기 때문에 구분을 잘 해서 사용해야 한다.
PL/SQL 구문은 독립적인 워크시트를 가져야하는 것은 아니지만 PL/SQL 구문은 실행할 부분을 꼭 블럭잡아서 실행하지 않으면 F5 누른것처럼 전부 실행되어 버린다.
(오라클이 아닌 SQL DEVELOPER가 그렇게 설정해놓음)
실습할 때 SQL구문들과 구분하여 사용하기 헷갈리므로 짤막한 PL/SQL 구문이더라도 독립적으로 워크시트를 나누어서 작성하겠다.

 
4. 형식 및 구조
``` SQL
[DECLARE]
    -- 선언문(DECLARATIONS)
BEGIN
    -- 실행문(STATEMENTS)
    
    [EXCEPTION]
        -- 예외 처리문(EXCEPTION HANDLERS)
END;
```
 
5. 변수 선언
``` SQL
DECLARE
    -- 변수 선언부
    변수명 자료형;
    변수명 자료형 :=초기값;
BEGIN
END;
```
 
--※ 블럭(영역)을 잡아(선택하여) 실행~!!! CHECK~!!!  
 
--※ DBMS_OUTPUT.PUT_LINE() 을 통해 화면에 결과를 출력하기 위한 환경변수 설정
``` SQL
SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.(스크립트 출력 아래에 나옴)
```
--  SERVEROUTPUT이라는 리소스를 이용하는데, 이걸 사용하지 않는데 켜져있으면  
--  다른 곳에서도 리소스를 소모하는데 리소스 소모가 크기 때문에 필요할 때만 켜서 쓰라는 의도가 담겨있음  
   
--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성  
``` SQL
DECLARE
    -- 선언부(변수 선언과 초기화)
    V1 NUMBER :=10;
    -- int a = 10;
    -- *PL/SQL은 자료형을 뒤에 선언* 
    V2 VARCHAR2(30) :='HELLO';
    V3 VARCHAR2(30) :='Oracle';
BEGIN
    -- 실행부(연산 및 처리)
    -- System.out.prinln(V1);
    DBMS_OUTPUT.PUT_LINE(V1);       --> 출력구문
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
 
--==>>
/*
10
HELLO
Oracle
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
``` 
 
--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
``` SQL
DECLARE
    -- 선언부
    V1 NUMBER := 10;
    V2 VARCHAR2(30) := 'HELLO';
    V3 VARCHAR2(30) := 'ORACLE';
BEGIN
    -- 실행부
    -- (연산 및 처리)
    V1 := V1 + 20;          -- NUM1 = NUM1 + 20 -> NUM1 += 20; 자바의 복합대입연산자 오라클에는 없다.
    V2 := V2 || '정한울';
    V3 := V3 || 'World~!!!';
    
    -- (결과출력)
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>>
/*
30
HELLO정한울
ORACLEWorld~!!!
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```

# 2. 조건문
## IF 문(조건문)
``` SQL
-- IF ~ THEN ~ ELSE ~ END IF;                   --> CASE에서 쓰이는 THEN, ELSE와 같은 의미
```
1. PL/SQL 의 IF 문장은 다른 언어의 IF 조건문과 거의 유사하다.  
   일치하는 조건에 따라 선택적으로 작업을 수행할 수 있도록 한다.  
   TRUE 이면 THEN 과 ELSE 사이의 문장을 수행하고 FALSE 나 NULL 이면 ELSE 와 END IF; 사이의 문장을 수행하게 된다.  
 
 
2. 형식 및 구조
``` SQL
IF 조건
    THEN 처리문;
END IF;
```
 
``` SQL
IF 조건
    THEN 처리문;
ELSE
    처리문;
END IF;
```
-- ELSE에는 처리문앞에 THEN 이 안붙는 것을 주의하자!!  
 
``` SQL
IF 조건
    THEN 처리문;
ELSIF
    THEN 처리문;
ELSIF
    THEN 처리문;
ELSE
    처리문;
END IF;
```
-- 오라클도 IF문 중첩이 가능하다! 하지만 자바처럼 ELSE IF 형태가 되어버리면  
-- 각각의 ELSE IF마다 END IF; 가 필요해지므로 ELSIF로 표현하도록 정해놓음  
 
 
 
--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
 
``` SQL 
DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
FAIL
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```
 
``` SQL 
DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
BEST
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```



























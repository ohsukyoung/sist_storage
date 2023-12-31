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

## 1.2. 중요핵심 정리
1. 뼈대잡기  
``` SQL
DECLARE
BEGIN
END;
```
-- 처음에는 이 뼈대를 먼저 꼭 작성하기!!!

2. 자료구조 선언 및 대입  
자바는 자료형 변수명; 이지만  
PL/SQL은 변수명 자료형; 으로 변수선언한다.  
이는 테이블 만들 때 컬럼명 자료형 이런 방식으로 만든 것을 가져온 것이라고 생각하기

자바에서는 대입하는 것을 =으로 하지만, PL/SQL은 := 를 사용한다.  

3. 출력  
``` SQL
DBMS_OUTPUT = SYSTEM.OUT
PUT_LINE() = PRINTLN()
```

4. 구문 표현  
``` SQL
자바에서는 특정 구문을
구문
{

}
으로 표현하지만..
오라클은 

구문

END 구문;
인 형태이다.
```
5. 데이터타입
컬럼명 데이터타입;

GRADE NUMBER;	-- NUMBER의 최대값 길이(38)을 가짐
GRACE CHAR;	-- CHAR의 최소값을 가짐

변수명 데이터타입;

<BR>

# 2. 조건문
## 2.1. IF 문(조건문)
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

## 2.2. CASE 문(조건문)
``` SQL
-- CASE ~ WHEN ~ TEHN ~ ELSE ~ END CASE;
``` 
1. 형식 및 구조  
``` SQL
CASE 변수
     WHEN 값1 THEN 실행문;
     WHEN 값2 THEN 실행문;
     ELSE 실행문;
END CASE;
```

``` SQL 
ACCEPT NUM PROMPT '남자1 여자2 입력하세요';
-- *외부로부터 값을 받아들여 올 것인데, 사용자에게 안내메세지 출력*  
 
DECLARE
    -- 선언부
    -- (주요 변수 선언)
--    SEL NUMBER := 1;
    SEL NUMBER := &NUM;
    RESULT VARCHAR2(10) := '남자';
BEGIN
    -- 실행부
    -- (테스트)
    DBMS_OUTPUT.PUT_LINE('SEL : ' || SEL);
    -- System.out.println("sel : " + sel);
    DBMS_OUTPUT.PUT_LINE('RESULT : ' || RESULT);
END;

 
ACCEPT NUM PROMPT '남자1 여자2 입력하세요';
-- *외부로부터 값을 받아들여 올 것인데, 사용자에게 안내메세지 출력*  
 
DECLARE
    -- 선언부
    -- (주요 변수 선언)
--    SEL NUMBER := 1;
    SEL NUMBER := &NUM;
    RESULT VARCHAR2(20) := '확인불가';
BEGIN
    -- 실행부
    -- (테스트)
--    DBMS_OUTPUT.PUT_LINE('SEL : ' || SEL);
    -- System.out.println("sel : " + sel);
--    DBMS_OUTPUT.PUT_LINE('RESULT : ' || RESULT);
 
    -- (연산 및 처리)
    /*CASE SEL
        WHEN 1
        THEN DBMS_OUTPUT.PUT_LINE('남자입니다.');
        WHEN 2
        THEN DBMS_OUTPUT.PUT_LINE('여자입니다.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('확인불가');
    END CASE;
    */
    
    CASE SEL
        WHEN 1
        THEN RESULT := '남자';
        WHEN 2
        THEN RESULT := '여자';
        ELSE RESULT := '확인불가';
    END CASE;
    
    -- (결과 출력)
    DBMS_OUTPUT.PUT_LINE('처리 결과는 '|| RESULT || '입니다.');
    
END;
```
>-- *인코딩방식이 모두 다름*  
-- *파이널 프로젝트 자료형 지정할때(테이블 컬럼) 여유있게 만들기*  
 
--※ 외부 입력 처리  
``` SQL
-- ACCEPT 구문
-- ACCEPT 변수명 PROMPT '메세지';
```
--> 외부 변수로부터 입력받은 데이터를 내부 변수에 전달할 때  
-- <&외부변수명> 형태로 접근하게 된다.  

# 3. 반복문
## 3.1. 기본 반복문
``` SQL
 LOOP ~ END LOOP;
``` 
 1. 조건과 상관없이 무조건 반복하는 구문.  
 
 2. 형식 및 구조  
    >-- *EXIT는 반복문에서 구성되는 것이 아니라, 반복문을 빠져나가기 위해 수행하는 것*  
``` SQL
/*
LOOP
    -- 실행문
    
    EXIT WHEN 조건;   -- 조건이 참인 경우 반복문을 빠져나간다.
END LOOP;
*/
``` 
-- 1 부터 10 까지의 수 출력(LOOP문 활용)
``` SQL
DECLARE
    N   NUMBER;
BEGIN
    N := 1;
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        
        EXIT WHEN N>=10;
        N := N+1;           -- N++; N+=1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
```
## 3.2. WHILE 반복문
``` SQL
-- WHILE LOOP ~ END LOOP;  
-- *와일, 루프시작했다, 엔드, 루프끝났다~*  
```
 
1. 제어 조건이 TRUE 인 동안 일련의 문장을 반복하기 위해 WHILE LOOP 구문을 사용한다.  
     조건은 반복이 시작되는 시점에 체크하게 되어 LOOP 내의 문장이 한 번도 수행되지 않을 경우도 있다.  
     LOOP 를 시작할 때 조건이 FALSE 이면, 반복 문장을 탈출하게 된다.  
 
2. 형식 및 구조  
``` SQL
/*
WHILE 조건 LOOP   -- 조건이 참인 경우 반복 수행
    -- 실행문;
END LOOP;
*/
 
-- 1부터 10 까지의 수 출력(WHILE LOOP 문 활용)
DECLARE
    N NUMBER;
BEGIN
    N := 0;
    
    WHILE N<10 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```

## 3.3. FOR 반복문  
``` SQL
-- FOR LOOP ~ END LOOP;  
-- *FOR문보다 향상된 FOR문에 가까움*  
/*
FOR(INT N : 자료구조)
 
*/
``` 
1. <시작수>에서 1씩 증가하여 <끝냄수> 가 될 때까지 반복 수행한다.  

2. 형식 및 구조  
``` SQL
/*
FOR 카운터 LOOP 시작수.. 끝냄수 LOOP
    -- 실행문;
END LOOP
*/
 
-- 1 부터 10 까지의 수 출력(FOR LOOP 문 활용)
DECLARE
    N NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/*
1
2
3
4
5
6
7
8
9
10
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```

<BR>

# 4. 자료형
## 4.1. %TYPE
1. 특정 테이블에 포함되어 있는 컬럼의 데이터타입(자료형)을 참조하는 데이터 타입    
 
2. 형식 및 구조
``` SQL
변수명 테이블.컬럼명%TYPE [:= 초기값];
``` 
>-- *변수명 VARCHAR2(30);*  
-- *이미 있는 테이블의 컬럼구조와 데이터타입을 직접 확인하는게 아니라, %TYPE을 통해서 알아서 설정하는 법*  
 
-- HR.EMPLOYEES 테이블의 특정 데이터를 변수에 저장  
``` SQL
DECLARE
--    V_NAME  VARCHAR2(20);
    V_NAME  EMPLOYEES.FIRST_NAME%TYPE;
    -- *내부적으로 윗줄의 주석같이 오라클이 처리해줌*  
BEGIN
    -- *맞는 방법*  
    SELECT FIRST_NAME INTO V_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
    -- *맞지 않는 방법*
    /*
    V_NAME := (
        SELECT FIRST_NAME
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID = 103);
    */
   -- 'PLSQL 에서 조회후 처리되는 구조'와 'SQL에서 처리되는 구조'가 달라서 위의 구조로는 처리되지 않음

--    SELECT FIRST_NAME, LAST_NAME INTO V_NAME,V_LASTNAME
    -- *여러셀 가져오는 것도 가능* 
```

<BR>

# 5. FUNCTION(함수)
1. 함수란 하나 이상의 PL/SQL 문으로 구성된 서브루틴으로  
    코드를 다시 사용할 수 있도록 캡슐화 하는데 사용된다.    
    오라클에서는 오라클에 정의된 기본 제공 함수를 사용하거나  
    직접 스토어드 함수를 만들 수 있다. (->사용자 정의 함수)  
    이 사용자 정의 함수는 시스템 함수처럼 쿼리에서 호출하거나  
    저장 프로시저처럼 EXECUTE 문을 통해 실행할 수 있다.  
>-- *날짜, 숫자등 함수 -> 오라클 내장 함수*  
-- *우리가 직접 지정해서 함수를 불러다 쓸 수 있음*   

2. 형식 및 구조
``` SQL
CREATE [OR REPLACE] FUNCTION 함수명
[( 매개변수명1 자료형
,  매개변수명2 자료형
)]
RETURN 데이터타입
IS
    -- 주요 변수 선언
BEGIN
    -- 실행문
    ...
    RETURN (값);
    
    [EXCEPTION]
        -- 예외 처리 구문;
END;
```
>-- *뷰처럼 함수는 틀을 만들고 끼워넣어 실행하는 것*  

>-- *다른 객체들과 달리 오라클의 FUNCTION에서는 **RETURN 데이터타입** 이 있다!*  
-- *EX) 자바 함수 -> 반환자료형 함수명()( ... RETURN XXX;}*  
-- *자바에서는 RETURN이 함수안에 있어서 내용을 모두 확인해야 알 수 있었다*  
-- *자바는 곡물통이 있을 경우 뚜껑을 열어서 내용을 확인해야 곡물인지 알 수 있지만,*  
-- *오라클은 곡물통 밖에 '곡물'이라고 스티커를 붙여 둔 것*  

--※ 사용자 정의 함수(스토어드 함수)는  
--   IN 파라미터(입력 매개변수)만 사용할 수 있으며  
--   반드시 반환될 값의 데이터타입을 RETURN 문에 선언해야 하고,  
--   FUNCTION 은 반드시 단일 값만 반환한다.  

>--  *함수는 입력매개변수만 가능하지만*  
--  *프로시저의 경우 입출력매개변수 가능?*  

>--  *입력 매개변수, 출력 매개변수, 입출력 매개변수*  
--  *입력매개변수     -> 이거 건네줄테니 이걸로 일하렴.*  
--  *출력매개변수     -> 이거 건네줄테니 작업하고, 여기에 담아 건네주렴.*  
--  *입출력매개변수   -> 이거 건네줄테니 이걸로 작업하고 여기에 담아 건네주렴.*   

``` SQL
--○ TBL_INSA 테이블 전용 성별 확인 함수 정의(생성)  
--   --------------------  
--    매개변수 구조(형태) → '771212-1022432' → 'YYMMDD-NNNNNNN'  

--   함수명 : FN_GENDER()  
--                     ↑ 주민등록번호 → '771212-1022432'
```
>-- *오라클에서 테이블전용 함수를 구성해야한다                        -> 아님!*  
-- *하이픈('771212-1022432')이 들어간 형태의 함수를 만든다는 의미    -> 맞음!*  

``` SQL
-- 선언부
CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)    -- 매개변수     : 자리수(길이) 지정 안함
RETURN VARCHAR2                                         -- 반환자료형   : 자리수(길이) 지정 안함
-- 정의부
IS
    -- 선언부  -> 주요 변수 선언(및 초기화)
    V_RESULT    VARCHAR2(20);
BEGIN
    -- 실행부  -> 연산 및 처리(그리고 결과값 반환)
    IF ( SUBSTR(V_SSN,8,1) IN ('1','3') )
        THEN V_RESULT := '남자';
    ELSIF ( SUBSTR(V_SSN,8,1) IN ('2','4') )
        THEN V_RESULT := '여자';
    ELSE
        V_RESULT := '성별확인불가';
    END IF;
    
    -- 결과값 반환       CHECK~!!!
    RETURN V_RESULT;
    -- *결과값 반환하지 않으면 넘어가지 않음*  
END;
--==>> Function FN_GENDER이(가) 컴파일되었습니다.
```
>-- *매개변수 여러개도 지정가능*  
-- *CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2, COL1 NUMBER)...*  

>-- *SET SERVEROUTPUT ON; 하지 않는 이유: 어제의 과정에서는 결과를 출력하기 위한 것이었고,  
-- *오늘의 실습은 함수를 선언하는 형태이기 때문에 하지 않는다.*

## 5.2. ☑ 20231103_02_scott.sql
--○ 20231103_01_scott(plsql).sql 파일에서  
--   FN_GENDER() 함수 생성 후 테스트  
``` SQL
SELECT NUM, NAME, SSN, FN_GENDER(SSN) "성별"
FROM TBL_INSA;
--==>> 
/*
1001	홍길동	771212-1022432	남자
1002	이순신	801007-1544236	남자
... 중략 ...
1060	김신애	810809-2111111	여자
*/
```

<BR>

# 6. PROCEDURE(프로시저)
1. PL/SQL 에서 가장 대표적인 구조인 스토어드 프로시저는  
 개발자가 자주 작성해야 하는 업무의 흐름을   
 미리 작성하여 데이터베이스 내에 저장해 두어다가  
 필요할 때 마다 호출하여 실행할 수 있도록 처리해 주는 구문이다.  

>-- *PL/SQL의 주인공은 프로시저!*  

>-- *미리 절차에 의거해 수행하는 것이 함수와 같은데 뭐가 다를까?*  
-- *오라클에서의 함수는 VOID가 리턴자료형이 없다.*  
-- *물론, 프로시저가 리턴자료형인것은 아니지만,*  
-- *RETURN 자료형이 VOID인 것을 생각하면서 그림을 그려보자.*  

2. 형식 및 구조
``` SQL
CREATE [OR REPLACE] PROCEDURE 프로시저명
[( 매개변수 IN 데이터타입
,  매개변수 OUT 데이터타입
,  매개변수 INOUT 데이터타입
)]
IS
    [-- 주요 변수 선언]
BEGIN
    -- 실행 구문;
    ...
    [EXCEPTION
        -- 예외 처리 구문;]
END;
```
>-- *매개변수가 없는 프로시저도 존재*  
-- *함수와 다르게 선언부와 IS 사이에 리턴이 없음*  
-- *자바에서는 순차적,절차적이라는 말은 적합하지 않지만.. 메소드안에서는 적합던 것과는 다르게  
-- *프로시저에서는 **절차적** 이 중요함*  

--※ FUNCTION 과 비교했을 때 <RETURN 반환자료형> 부분이 존재하지 않으며,  
--   <RETURN> 문 자체도 존재하지 않고,  
--   프로시저 실행 시 넘겨주게 되는 매개변수의 종류는  
--   IN(입력), OUT(출력), INPUT(입출력) 으로 구분된다.  

3. 실행(호출)
``` SQL
EXE[CUTE] 프로시저명[(인수1, 인수2, ...)];
```

--※ 프로시저 실습을 위한 테이블 생성은...  
--  **<20231103_02_scott.sql>** 파일 참조~!!!  
>-- *프로시저를 잘 이해하기 위해서는 복잡한 테이블이어야하는데,*  
-- *이 구조가 논리적으로 맞지 않을 수 있음. -> 이렇게 이해하고 갈 것*  

--○ 프로시저 생성  
--   프로시저명: PRC_STUDENT_INSERT(아이디, 패스워드, 이름, 전화, 주소)  

>-- *뼈대잡기*  
``` SQL
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( 아이디
, 패스워드
, 이름
, 전화
, 주소
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDW 테이블에 데이터 입력 -> INSERT
    INSERT INTO TBL_IDPW(ID,PW)
    VALUES(V_ID,V_PW);
    
    -- TBL_STUDENTS 테이블에 데이터 입력 -> INSERT
    INSERT INTO TBL_STUDENTS(ID,NAME,TEL,ADDR)
    VALUES(V_ID,V_NAME, V_TEL, V_ADDR);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_INSERT이(가) 컴파일되었습니다.
```
## 6.1. ☑ 20231103_02_scott.sql
--○ 프로시저 생성 후 실행  
``` SQL
EXEC PRC_STUDENT_INSERT('wool','java006$','정한울','010-2222-2222','서울 강남구');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
```
--○ 프로시저 호출 이후 확인
``` SQL
SELECT*
FROM TBL_IDPW;
--==>>
/*
moon	java006$
wool	java006$
*/

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
moon	문정환	010-1111-1111	제주도 서귀포시
wool	정한울	010-2222-2222	서울 강남구
*/
```

<BR>

# 7. 프로시저 내에서의 예외 처리
--○ TBL_NUMBER 테이블에 데이터를 입력하는 프로시저를 작성  
--   단, 이 프로시저를 통해 데이터를 입력하는 경우  
--   CITY(지역) 항목에 '서울', '경기', '대전'만 입력이 가능하도록 구성한다.  
--   이 지역 외의 다른 지역을 프로시저 호출을 통해 입력하려는 경우  
--   (즉, 유효하지 않은 데이터 입력을 시도하려는 경우)  
--   예외에 대한 처리를 하려고 한다.  
--   프로시저명: PRC_MEMBER_INSERT()  
``` SQL
실행 예)
EXEC PRC_MEMBER_INSERT('박범구', '010-1111-1111', '서울');
--> 데이터 입력 ○

EXEC PRC_MEMBER_INSERT('김경태', '010-2222-2222', '부산');
--> 데이터 입력 x
```
``` SQL
CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 선언
    V_NUM               TBL_MEMBER.NUM%TYPE;
    
    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR     EXCEPTION;  -- *예외타입, 이름자유롭게 선언 가능*  
BEGIN
    -- 프로시저를 통해 입력 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
    -- 가장 먼저 확인할 수 있도록 코드 구성
    IF (V_CITY NOT IN ('서울', '경기', '대전'))
        -- 예외 발생 CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR;   -- *THRROW: 예외를 발생시키겠다*  
    END IF;

    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(NUM),0) INTO V_NUM
    FROM TBL_MEMBER;

    -- 쿼리문 구성 -> INSERT
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1) ,V_NAME, V_TEL, V_CITY);
    
    -- 예외 처리 구문
    -- *TRY~CATCH: 예외에 대한 분기처리*  
    -- *커밋보다 예외처리구문을 먼저 작성하기*  
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '서울,경기,대전만 입력이 가능합니다.'); -- *오라클 내장 함수*  
            -- *20001부터 사용자 지정 에러코드 지정가능*  
            -- *EXCEPTION 테이블 참조하여 에러코드 넣기*  
        WHEN OTHERS     -- *기타 다른 에러가 날 경우*  
            THEN ROLLBACK;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.
```

# 8. CURSOR(커서)
>-- *커서(상자)는 압축해 넣어서 뚜껑을 닫아놓았다가, 뚜껑을 열면 왁~~~!하고 나오는 모양*  
  
1. 오라클에서는 하나의 레코드가 아닌 여러 레코드로 구성된 작업 영역에서   
    SQL 문을 실행하고 그 과정에서 발생한 정보를 저장하기 위해서 커서(CURSOR)를 사용하며  
    커서에는 암시적인 커서와 명시적인 커서가 있다.  
      
2. 암시적인 커서는 모든 SQL 구문에 존재하며 SQL문 실행 후 오직 하나의 행(ROW)만 출력하게 된다.  
    그러나 SQL문을 실행한 결과물(RESULT SET)이 여러행(ROW)으로 구셩된 경우  
    커서(CURSOR)를 명시적으로 선언해야 여러 행(ROW)을 다룰 수 있다.

--○ 커서 이용 전 상황(단일 행 접근 시)  
``` SQL
SET SERVEROUTPUT ON;
--==>> [스크립트 출력] 작업이 완료되었습니다.(0.063초)

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
END;
--==>> 
/*
홍길동 -- 011-2356-4528

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```

--○ 커서 이용 전 상황(다중 행 접근 시)
``` SQL
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
END;
--==>> 에러 발생(01422. 00000 -  "exact fetch returns more than requested number of rows")
```

/* 2-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
```SQL
-- *반복문을 활용해 INSA 테이블 출력*  
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN
    FOR N IN 1001 .. 1061 LOOP
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM = V_NUM;
        
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
    END LOOP;
END;
--==>>
/*
홍길동 -- 011-2356-4528
  :
최혜인 -- 010-2509-1783
*/
```

``` SQL
일반변수 -> 선언
예외변수 -> 선언

변수명 자료형     -- *이런형태를 취함*  
V_NUM   NUMBER;
U_ERR   EXCEPTION;
커서명  CURSOR;   -- (X)
```

>-- *선생님이 만든 정의(우리끼리는)/ 내부적으로는 선언으로 표현하기도함*  
``` SQL
커서 -> 정의

TABLE   테이블명
INDEX   인덱스명
USER    유저명

CURSOR  커서명   -- (O)
```
>-- *선언과 정의의 쓰임이 변수명-자료형의 위치가 다름*   

--○ 커서 이용 후 상황  
``` SQL
DECLARE
    -- 주요 변수 선언
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서 정의  CHECK~!!!
    CURSOR CUR_INSA_SELECT     -- *눌러 담은 모양*  
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    -- 오픈 커서
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 (와~!!!)쏟아져 나오는 데이터들 처리(반복문을 활용하여 처리) 
    LOOP
        -- 한 행 한 행 받아다가 처리하는 행위 -> 가져오다(데려오다)    -> 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- 언제까지??? (EXIT WHEN)
        --  -> 커서에서 더 이상 데이터가 쏟아져 나오지 않는 상태...  -> 『NOTFOUND』
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL );
    END LOOP;
    
    -- 클로즈 커서
    CLOSE CUR_INSA_SELECT;
    
    -- *오라클 자체 커서의 경우, 오픈해 쓰면 자동으로 닫기 때문에... 클로즈 커서때문에 에러가 나는 경우가 있다.*  
    -- *이럴 대는 클로즈 커서만 주석처리하고 재실행해보기*  
END;
```


<BR>


# 9. TRIGGER(트리거)
-- 사전적인 의미: 방아쇠, 촉발시키다, 야기하다, 유발하다.  
>-- *부비트랩은 내가 계속 지켜보다가 터트리는 것이 아니라, 설치만 해두고 떠나면 알아서 터지는것이 중요함*  

1. TRIGGER(트리거)란 DML 작업 즉, INSERT, UPDATE, DELETE 작업이 일어날 때 
    자동적으로 실행되는(유발되는, 촉발되는) 객체로  
    이와 같은 특징을 강조하여 DML TRIGGER 라고 부르기도 한다.  
    TRIGGER 는 무결성 뿐 아니라 다음과 같은 작업에도 널리 사용된다.

-- 자동으로 파생된 열 값 생성  
-- 잘못된 트랜잭션 방지  
-- 복잡한 보안 권한 강제 수행  
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행  
-- 복잡한 업무 규칙 강제 적용  
-- 투명한 이벤트 로깅 제공  
-- 복잡한 감사 제공  
-- 동기 테이블 복제 유지관리  
-- 테이블 액세스 통계 수집  

-- *S: 설명 ---------------------------------------------------------------------*  
-- 자동으로 파생된 열 값 생성
>-- *선생님이 떠나고 반장에 떠든사람 적는것*

-- 잘못된 트랜잭션 방지  
-- 복잡한 보안 권한 강제 수행  
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행  
>-- *사원정보 등록에서 참조하는 값에 등록된 내용만 등록가능*    
-- *-> 하지만.. 나누어져 있는 상태여서, 제약조건으로 제한 할 수 없을때 사용가능*  

-- 복잡한 업무 규칙 강제 적용  
>-- *업무시간에는 메시전 프로그램이 안 돌도록 시스템안에 삽입해 놓은 것/ 업무시간 이후에 접근가능*  

-- 투명한 이벤트 로깅 제공  
>-- *자동으로 파생된~이랑 같이 보면 좋음. 로그:기록, 로깅:로그를 남기는 것. INSER, DELETE 기록을 볼 수 있게 하는 것*  

-- 복잡한 감사 제공  
>-- *자동으로 파생된~,투명한 이벤트~와 같은 카테고리의 개념*  

-- 동기 테이블 복제 유지관리  
>-- *파급력으로 작동해야하는 것*  

-- 테이블 액세스 통계 수집  
>-- *자동으로 파생된~,투명한 이벤트~,복잡한 감사~와 같은 카테고리의 개념*  

>-- *==============================================*  
-- *공통특징: 사람이 하나하나 관리하기 힘들다*  
-- *==============================================*  

-- *E: 설명 ---------------------------------------------------------------------*  

2. TRIGGER(트리거) 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다.  
>-- *프로시저를 호출하는 형태로 이용X, 사용자가 있는지도 모르고 사용*  

3. 특징 및 종류  
--      - BEFORE STATEMENT   
--      - BEFORE ROW  
--      - AFTER STATEMENT  
--      - AFTER ROW
   
>-- *앞에서 동작해야하는 트리거: BEFORE, 사후동작: AFTER*  
-- *하나의 케이스에서 동작:STARTEMENT, 모든 행을 스캔할때: ROW*  

4. 형식 및 구조  
``` SQL
CRAETE [OR REPLACE] TRIGGER 트리거명
    [BEFORE | AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명    -- *ON 테이블명: 어디에 장착할지*
    [FOR EACH ROW [WHEN TRIGGER 조건]]               -- *ROW에서 'FOR EACH ROW' 사용(FOR:각각의 행에 대해)*
                                                     -- *STATEMENT에서 'FOR EACH ROW' 삭제*
[DECLARE]
    -- 선언구문;
BEGIN
    -- 실행구문;
END;
```
## 9.1. AFTER STATEMENT TRIGGER 상황 실습
-- ※ DML 작업에 대한 이벤트 기록  
-- *떠든사람 적기, 떠들기 전에 예측해서 적을 수 없음*  

--○ TRIGGER(트리거) 생성
``` SQL
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
        AFTER                                       -- *사후에 작동*
        INSERT OR UPDATE OR DELETE ON TBL_TEST1     -- *INSERT OR UPDATE OR DELETE: 가 일어나면*   
BEGIN                                               -- *ON TBL_TEST1: 어디를 기준으로 작동하는지*   
    -- 이벤트 종류 구분(조건문을 통한 분기)
    IF(INSERTING)                                   -- **INSERTING**  
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(공통)THEN INSERT~*
            VALUES('INSERT 쿼리가 실행되었습니다.');
    ELSIF (UPDATING)                                -- **UPDATING**
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(공통)THEN INSERT~*
            VALUES('UPDATE 쿼리가 실행되었습니다.');
    ELSIF (DELETING)                                -- **DELETING**
        THEN INSERT INTO TBL_EVENTLOG(MEMO)         -- *(공통)THEN INSERT~*
            VALUES('DELETE 쿼리가 실행되었습니다.');
    END IF;
    
    --COMMIT;
    -- ※ TRIGGER 내에서는 COMMIT / ROLLBACK 구문 사용 불가~!!! CHECK~!!!
END;
--==>> Trigger TRG_EVENTLOG이(가) 컴파일되었습니다.
```
### 9.1.1. ☑ 20231107_02_scott.sql
``` SQL
--○ 실습을 위한 준비 -> 테이블 생성(TBL_TES)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.

--○ 실습을 위한 준비 -> 테이블 생성(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO  VARCHAR2(200)
, INJA  DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG이(가) 생성되었습니다.

--○ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 확인
SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음

SELECT *
FROM TBL_EVENTLOG;
--==>> 조회 결과 없음
```
``` SQL
--○ 생성한 TRIGGER 작동여부 확인
--  -> TBL_TEST1 테이블을 대상으로 INSERT, UPDATE, DELETE 수행

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(1, '이윤수', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(2, '강혜성', '010-2222-2222');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(3, '문정환', '010-3333-3333');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET NAME='박가영', TEL='010-4444-4444'
WHERE ID=1;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_TEST1;
/*
1	박가영	010-4444-4444
2	강혜성	010-2222-2222
3	문정환	010-3333-3333
*/

DELETE
FROM TBL_TEST1
WHERE ID IN (2,3);
--==>> 2개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 1	박가영	010-4444-4444

DELETE
FROM TBL_TEST1
WHERE ID=1;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음

SELECT *
FROM TBL_EVENTLOG;
--==>>
/*
INSERT 쿼리가 실행되었습니다.	2023-11-07 16:14:33
INSERT 쿼리가 실행되었습니다.	2023-11-07 16:15:19
INSERT 쿼리가 실행되었습니다.	2023-11-07 16:17:49
UPDATE 쿼리가 실행되었습니다.	2023-11-07 16:18:59
DELETE 쿼리가 실행되었습니다.	2023-11-07 16:19:36
DELETE 쿼리가 실행되었습니다.	2023-11-07 16:20:17
*/
-- *쓰는 사람 입장에서는 별도의 함수나 프로시저를 쓴다는 개념을 모르고, 미리 걸어둔 조건에 의해 돌아가는 것* 
```

## 9.2. BEFORE STATEMENT TRIGGER 상황 실습
-- ※ DML 작업 수행 전에 작업에 대한 가능여부 확인  

--○ TRIGGER(트리거) 생성 -> TRG_TEST1_DML
-- *호출해서 쓰는 것이 아니기 때문에 중요하지 않지만,*  
-- *트리거 삭제등을 실행할때 구분지어질 수 있도록 규칙에 맞게 적기*  

``` SQL
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE                                          -- *사전에 작동되어 입력하지 못하게*  
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
--DECLARE
    -- 변수선언..  -- *구문적으로 사용은 가능하나,*
                   -- *사용자의 의지와 상관없이 실행되기 때문에.. 트리거에서 변수선언은 하지 않는다*  
BEGIN
--    IF (작업시간이 오전 9시 이전이거나... 오후 6시 이후라면)
--        THEN 작업을 수행하지 못하게 처리하겠다.
--    END IF;

    IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 9 OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        -- *6시 이후로 작업하지 못하도록... (시간>17) OR (시간>=18)으로 해야함*  
        THEN RAISE_APPLICATION_ERROR(-20003, '작업 시간은 09:00 ~ 18:00 까지만 가능합니다.');
    END IF;
END;
--==>> Trigger TRG_TEST1_DML이(가) 컴파일되었습니다.
```
### 9.2.1. ☑ 20231107_02_scott.sql
``` SQL
-- *로컬시간 6시 이후로 바꾸고 실행*  
SELECT SYSDATE
FROM DUAL;
--==>> 2023-11-07 18:49:00

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(1,'김다슬','010-1111-1111');
--==>> 에러 발생(ORA-20003: 작업 시간은 09:00 ~ 18:00 까지만 가능합니다.)

-- *로컬시간 6시 이전으로 바꾸고 실행*  
SELECT SYSDATE
FROM DUAL;
--==>> 2023-11-07 16:49:55

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(1,'김다슬','010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;

UPDATE TBL_TEST1
SET NAME='오수경', TEL='010-2222-2222'
WHERE ID=1;
--==>> 1 행 이(가) 업데이트되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(2,'김경태','010-3333-3333');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 
/*
2	김경태	010-3333-3333
1	오수경	010-2222-2222
*/

COMMIT;

-- *로컬시간 오전 9시 이전으로 바꾸고 실행*  
UPDATE TBL_TEST1
SET NAME='박범구', TEL='010-3333-3333'
WHERE ID=1;
--==>> 에러 발생 (ORA-20003: 작업 시간은 09:00 ~ 18:00 까지만 가능합니다.)

DELETE
FROM TBL_TEST1
WHERE ID=2;
--==>> 에러 발생 (ORA-20003: 작업 시간은 09:00 ~ 18:00 까지만 가능합니다.)
```

## 9.3. BEFORE ROW TRIGGER 상황 실습
-- ※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델  

``` SQL
--○ TRIGGER(트리거) 생성 -> TRG_TEST2_DELETE
-- *부모테이블에서 지울때 참조되고 있는 자식 데이터 삭제*  
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
        BEFORE
        DELETE ON TBL_TEST2
        FOR EACH ROW                        -- *FOR EACH ROW: 각각 하나씩 확인* 
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;     -- *『:OLD.』
END;
--==>> Trigger TRG_TEST2_DELETE이(가) 컴파일되었습니다.
```
``` SQL
-- *                UPDATE 시점
-- *--------------------●-------------------------
-- *     『:OLD』                 『:NEW』

-- *사실, UPDATE라는 쿼리문은 오라클에 내부에 존재하지 않음*
-- *UPDATE        ====>> DELETE + INSERT
-- *비효율의 크기 ====>> 'UPDATE * 10' > 'INSERT * 10'

-- ※ 『:OLD』  
--    참조 전 열의 값
--    - INSERT: 입력하기 이전 자료 즉, 입력할 자료
--    - DELETE: 삭제하기 이전 자료 즉, 삭제할 자료

-- ※ UPDATE
--    내부적으로 DELETE 그리고 INSERT 가 결합된 형태
--    UPDATE 하기 이전의 데이터는 『:OLD』
--    UPDATE 수행한 이후의 데이터는 『:NEW』
```
### 9.3.1. ☑ 20231107_02_scott.sql
``` SQL
--○ 실습 환경 구성을 위한 테이블 생성 -> TBL_TEST2
CREATE TABLE TBL_TEST2
( CODE NUMBER
, NAME VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2이(가) 생성되었습니다.

--○ 실습 환경 구성을 위한 테이블 생성 -> TBL_TEST3
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
            REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3이(가) 생성되었습니다.

--○ 실습 관련 데이터 입력
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1,'텔레비전');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2,'냉장고');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3,'세탁기');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(4,'건조기');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM TBL_TEST2;
--==>> 
/*
1	텔레비전
2	냉장고
3	세탁기
4	건조기
*/

COMMIT;
--==>> 커밋 완료.

--○ 실습 관련 데이터 입력
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1,1,30); -- 텔레비전
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2,1,50); -- 텔레비전
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3,1,60); -- 텔레비전
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4,2,20); -- 냉장고
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5,2,20); -- 냉장고
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6,3,40); -- 세탁기
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7,1,30); -- 텔레비전
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8,4,30); -- 건조기
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9,3,10); -- 세탁기
--==>> 1 행 이(가) 삽입되었습니다. * 9

SELECT *
FROM TBL_TEST3;
/*
1	1	30
2	1	50
3	1	60
4	2	20
5	2	20
6	3	40
7	1	30
8	4	30
9	3	10
*/

COMMIT;
--==>> 커밋 완료.
```
``` SQL
--○ 부모 테이블(TBL_TEST2)의 데이터 삭제 시도
SELECT *
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1	텔레비전

DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 에러 발생(ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found)
-- *참조하고 있는 자식 레코드가 있어서 삭제할수 없음*  

--○ TRIGGER 생성 이후 확인
DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST3;
--==>>
/*
4	2	20
5	2	20
6	3	40
8	4	30
9	3	10
*/
-- *부모테이블의 1을참조하고있던 데이터 모두 삭제됨*  

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST3;
--==>>
/*
6	3	40
8	4	30
9	3	10
*/
```
## 9.4. AFTER ROW TRIGGER 상황 실습
-- ※ 참조 테이블 관련 트랜잭션 처리  
-- *가장 많이 사용됨*  
-- *프로시저에서 입고,출고를 할 때 관련제고 컨트롤이 중요했는데, AFTER ROW로 가능*  
-- *ROW TRIGGER의 경우 1:다 하나가 여러건에 걸쳐 두루 파장이 일어나야 하는 경우 ROW TRIGGER 사용*  
``` SQL
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_입고
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 + 새로입고되는수량
            WHERE 상품코드 = 새로입고되는상품코드;
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_입고
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 + :NEW.입고수량
            WHERE 상품코드 = :NEW.상품코드;
    END IF;
END;
--==>> Trigger TRG_IBGO이(가) 컴파일되었습니다.
```
### 9.4.1. ☑ 20231107_02_scott.sql
``` SQL
-- ※ 실습을 위한 준비
UPDATE TBL_상품
SET 재고수량 = 0;
--==>> 17개 행 이(가) 업데이트되었습니다.

TRUNCATE TABLE TBL_입고;
--==>> Table TBL_입고이(가) 잘렸습니다.

TRUNCATE TABLE TBL_출고;
--==>> Table TBL_출고이(가) 잘렸습니다.

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	0
H002	죠스바	500	0
H003	보석바	500	0
H004	누가바	600	0
H005	쌍쌍바	700	0
H006	수박바	500	0
H007	알껌바	500	0
C001	빵빠레	1600	0
C002	월드콘	1500	0
C003	메타콘	1500	0
C004	구구콘	1600	0
C005	슈퍼콘	1700	0
E001	빵또아	2600	0
E002	투게더	2500	0
E003	팥빙수	2500	0
E004	셀렉션	2600	0
E005	설레임	2700	0
*/

ROLLBACK;
-- *ROLLBACK 해도 TRUNCATE는 되돌아가지 않음*  
-- *TRUNCATE: 테이블의 가위로 오려냄*  
-- *잘라낸 것은 ROLLBACK 되지 않음(오토커밋) -> 잘 판단해서 쓰기*  

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	0
H002	죠스바	500	0
H003	보석바	500	0
H004	누가바	600	0
H005	쌍쌍바	700	0
H006	수박바	500	0
H007	알껌바	500	0
C001	빵빠레	1600	0
C002	월드콘	1500	0
C003	메타콘	1500	0
C004	구구콘	1600	0
C005	슈퍼콘	1700	0
E001	빵또아	2600	0
E002	투게더	2500	0
E003	팥빙수	2500	0
E004	셀렉션	2600	0
E005	설레임	2700	0
*/

--○ TRIGGER(트리거) 생성 이후 실습 테스트
INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(1, 'H001', SYSDATE, 40, 1000);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_입고;
--==>> 
/*
1	H001	2023-11-08 09:11:22	40	1000
*/

COMMIT;

SELECT *
FROM TBL_상품;
--==>>
/*         :
H001	바밤바	600	40
*/

INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(2, 'H001',SYSDATE, 20, 1000);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_상품;
--==>>
/*         :
H001	바밤바	600	60
*/

COMMIT;
--==>> 커밋 완료.
```


<BR>


# 10. TRIGGER(트리거)
1. PL/SQL 의 패키지는 관계되는 타입, 프로그램 객체, 서브 프로그램(PROCEDURE, FUNCTION 등)을 논리적으로 묶어놓은 것이다.  
    오라클에서 제공하는 패키지 중 하나가 바로 <DBMS_OUTPUT>이다.  
    
2. 패키지는 서로 유사한 업무에 사용되는 여러 개의 프로시저와 함수를 하나의 패키지로 만들어 관리함으로써  
    향후 유지보수가 편리하고 전체 프로그램을 모듈화 할 수 있다는 장점이 있다.  

3. 패키지는 명세부(PACKAGE SPECIFICATION)와 몸체부(PACKAGE BODY)로 구성되어 있으며  
    명세 부분에는 TYPE, CONSTRAINT, VARIABLE, EXCEPTION, XURSOR, SUBPROGRAM 이 선언되고  
    몸체 부분에는 이들의 실제 내용이 존재한다.  
    그리고, 호출할 때에는 <패키지명. 프로시저명>과 같은 형식의 참조를 이용해야 한다.  
    
4. 형식 및 구조(명세부)  

>-- *상자안에 어떤 내용이 있는지 라벨을 붙이는 것*  
-- *따라서 명세부-몸체부의 패키지명은 같아야 함*  
``` SQL
CRAEATE [OR REPLACE] PACKAGE 패키지명
IS
    전역변수  선언;
    커서 선언;
    예외 선언;
    함수 선언;
    프로시저 선언;
        :
END 패키지명;
```
5. 형식 및 구조(몸체부)
``` SQL
CREATE [OR REPLACE] PACKAGE BODY 패키지명
IS
    FUNCTION 함수명[(인수,...)]
    RETURN 자료형
    IS
        변수 선언;
    BEGIN
        함수 몸체 구성 코드;
        RETURN 값;
    END;
    
    PROCEDURE 프로시저명[(인수, ...)]
    IS
        변수 선언;
    BEGIN
        프로시저 몸체 구성 코드;
    END;
END 패키지명;
```
-- 패키지 등록 실습  
-- (1) 명세부 작성  
``` SQL
CREATE OR REPLACE PACKAGE INSA_PACK     -- *명세부라는 특정 단어X*  
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2;
    
END INSA_PACK;
--==>> Package INSA_PACK이(가) 컴파일되었습니다.
```
-- (2) 몸체부 작성  
>-- *뼈대...나머지는 함수 정의와 같음~*  
``` SQL
CREATE OR REPLACE PACKAGE BODY INSA_PACK     -- *BODY: 몸체부라는 특정 단어O* 
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)      
    RETURN VARCHAR2
    IS
    BEGIN
    END;
    
END INSA_PACK;                               -- *END BODY 아님!*  
```
``` SQL
CREATE OR REPLACE PACKAGE BODY INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)      
    RETURN VARCHAR2
    IS
        V_RESULT VARCHAR2(20);
    BEGIN
        IF (SUBSTR(V_SSN,8,1) IN ('1','3'))
            THEN V_RESULT := '남자';
        ELSIF (SUBSTR(V_SSN,8,1) IN ('2','4'))
            THEN V_RESULT := '여자';
        ELSE
            V_RESULT := '확인불가';
        END IF;
        
        RETURN V_RESULT;
    END;
    
END INSA_PACK;
--==>> Package Body INSA_PACK이(가) 컴파일되었습니다.
```
### 9.4.1. ☑ 20231108_02_scott.sql
``` sql
--○ 패키지 활용 실습
SELECT INSA_PACK.FN_GENDER('801007-1544236') "함수호출결과"
FROM DUAL;
--==>> 남자

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN) "함수호출결과"
FROM TBL_INSA;
--==>>
/*
홍길동	771212-1022432	남자
이순신	801007-1544236	남자
이순애	770922-2312547	여자
            :
김신애	810809-2111111	여자
최혜인	970812-2234567	여자
*/
```










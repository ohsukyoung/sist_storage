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
--○ 20231103_01_scott(qlsql).sql 파일에서  
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








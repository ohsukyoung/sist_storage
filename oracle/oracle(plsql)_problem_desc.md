# 페이지 20231102_02_scott(plsql).sql

## 1. 문제
--○ 임의의 정수 2개를 외부로부터(사용자로부터) 입력받아 이들의 덧셈 결과를 출력하는 PL/SQL 구문을 작성한다.  
--  실행 예)  
--  첫 번째 정수를 입력하세요 -> 10  
--  두 번째 정수를 입력하세요 -> 20  
--==>> 10 + 20 = 30  
### 1.2. 답
``` SQL
ACCEPT NUM1 PROMPT '첫 번째 정수를 입력하세요';
ACCEPT NUM2 PROMPT '두 번째 정수를 입력하세요';
 
DECLARE
    -- 선언부
    -- (주요 변수 선언)
    SEL1 NUMBER := &NUM1;
    SEL2 NUMBER := &NUM2;
    TOTSUM NUMBER := SEL1 + SEL2;
    RESULT VARCHAR2(20) := '확인불가';
BEGIN
    -- 실행부
    
    -- (연산 및 처리)
    
    -- (결과 출력)
    DBMS_OUTPUT.PUT_LINE(SEL1 || ' + ' || SEL2 || ' = ' || TOTSUM);
END;
 
ACCEPT N1 PROMPT '첫 번째 정수를 입력하세요';
ACCEPT N2 PROMPT '두 번째 정수를 입력하세요';
 
DECLARE
    -- 주요 변수 선언
    NUM1 NUMBER := &N1;
    NUM2 NUMBER := &N2;
    TOTAL NUMBER := 0;
BEGIN
    -- 테스트
--    DBMS_OUTPUT.PUT_LINE('NUM1 : '|| NUM1);
--    DBMS_OUTPUT.PUT_LINE('NUM2 : '|| NUM2);
--    DBMS_OUTPUT.PUT_LINE('TOTAL :  '|| TOTAL);
    
    -- 연산 및 처리
    TOTAL := NUM1+NUM2;
    
    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' || TOTAL);
END;
--==>>
/*
13 + 24 = 37
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```

## 2. 문제
--○ 사용자로부터 입력받은 금액을 화폐단위로 구분하여 출력하는 프로그램을 작성한다.  
--   단, 입력에 대한 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.  
/*  
실행 예)  
바인딩 변수 입력 대화창 -> 금액 입력  
   
입력받은 금액 총액 : 990원  
화폐단위 : 오백원 1, 백원 4, 오십원 1, 십원 4  
*/  
 
### 2.2. 답
``` SQL
ACCEPT TOT PROMPT '금액을 입력해주세요'
 
DECLARE
    -- 선언부
    -- (주요 변수 선언)
    TOTAL NUMBER    := &TOT;
    CNT500 NUMBER   := 0;
    CNT100 NUMBER   := 0;
    CNT50 NUMBER    := 0;
    CNT10 NUMBER    := 0;
BEGIN
    -- 실행부
    -- (연산 및 처리)
    CNT500  := TRUNC(TOTAL/500);
    CNT100  := TRUNC((TOTAL - CNT500*500)/100);
    CNT50   := TRUNC((TOTAL - CNT500*500 - CNT100*100)/50);
    CNT10   := TRUNC((TOTAL - CNT500*500 - CNT100*100 -CNT50*50)/10);
    
    -- (결과 출력)
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : '||TOTAL);
    DBMS_OUTPUT.PUT_LINE('화폐단위 : 오백원 '   ||CNT500
                                ||', 백원 '     ||CNT100
                                ||', 오십원 '   ||CNT50
                                ||', 십원 '     ||CNT10);
END;
--==>>
/*
입력받은 금액 총액 : 990
화폐단위 : 오백원 1, 백원 4, 오십원 1, 십원 4
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```
### 2.3. 해설
``` SQL
ACCEPT INPUT PROMPT '금액 입력';
DECLARE
    --○ 주요 변수 선언
    MONEY   NUMBER := &INPUT; --연산을 위해 입력값을 담아둘 변수
    MONEY2  NUMBER := &INPUT; --결과 출력을 위해 입력값을 담아둘 변수
                              --(MONEY 변수가 연산을 처리하는 과정에서 값이 변하기 때문에...)
 
    M500    NUMBER;           -- 500원 짜리 갯수를 담아둘 변수
    M100    NUMBER;           -- 100원 짜리 갯수를 담아둘 변수
    M50     NUMBER;           --  50원 짜리 갯수를 담아둘 변수
    M10     NUMBER;           --  10원 짜리 갯수를 담아둘 변수
    -- *오라클도 변수 첫글자에 숫자올수 없음 --
BEGIN
    --○ 연산 및 처리
    -- MONEY 를 500으로 나눠서 몫을 취하고 나머지는 버린다.   -> 500원 갯수
    M500 := TRUNC(MONEY / 500);
    
    -- MONEY 를 500으로 나눠서 몫을 버리고 나머지는 취한다.   -> 500원 갯수 확인하고 남은 금액
    -- 이 금액으로 MONEY 를 갱신
    MONEY := MOD(MONEY,500);
    
    -- MONEY 를 100으로 나눠서 몫을 취하고 나머지는 버린다.   -> 100원 갯수
    M100 := TRUNC(MONEY / 100);
    
    -- MONEY 를 100으로 나눠서 몫을 버리고 나머지는 취한다.   -> 100원 갯수 확인하고 남은 금액
    -- 이 금액으로 MONEY 를 갱신
    MONEY := MOD(MONEY,100);
    
    -- MONEY 를 50으로 나눠서 몫을 취하고 나머지는 버린다.   -> 50원 갯수
    M50 := TRUNC(MONEY / 50);
    
    -- MONEY 를 50으로 나눠서 몫을 버리고 나머지는 취한다.   -> 50원 갯수 확인하고 남은 금액
    -- 이 금액으로 MONEY 를 갱신
    MONEY := MOD(MONEY,50);
    
    -- MONEY 를 10으로 나눠서 몫을 취하고 나머지는 버린다.   -> 10원의 갯수
    M10 := TRUNC(MONEY / 10);
    
    --○ 결과 출력
    -- 취합된 결과(화폐 단위별 갯수)를 형식에 맞게 최종 출력한다.
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액: '|| MONEY2 ||'원이다.');
    DBMS_OUTPUT.PUT_LINE('화폐단위 : 오백원 '   ||M500
                                ||', 백원 '     ||M100
                                ||', 오십원 '   ||M50
                                ||', 십원 '     ||M10);
END;
--==>>
/*
입력받은 금액 총액: 990원이다.
화폐단위 : 오백원 1, 백원 4, 오십원 1, 십원 4
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```
## 3. 문제
--○ 사용자로부터 임의의 단(구구단)을 입력받아 해당 단수의 구구단을 출력하는 PL/SQL 구문을 작성한다.  
``` SQL
/*
2 * 1 = 2
2 * 2 = 2
    :
2 * 9 = 18
*/
```
### 3.2. 답
``` SQL
-- 1. LOOP 문의 경우
ACCEPT INPUT PROMPT '단 입력';
DECLARE
    N NUMBER;
    DAN NUMBER := &INPUT;
BEGIN
    N := 1;
    LOOP 
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN*N);
        EXIT WHEN N>=9;
        N := N+1;
    END LOOP;
END;
 
-- 2. WHILE LOOP 문의 경우
ACCEPT INPUT PROMPT '단 입력';
DECLARE
    N NUMBER;
    DAN NUMBER := &INPUT;
BEGIN
    N := 1;
    WHILE N<10 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * '|| N || ' = ' || DAN*N);
        N := N+1;
    END LOOP;
END;
 
-- 3. FOR LOOP 문의 경우
ACCEPT INPUT PROMPT '단 입력';
DECLARE
    N NUMBER;
    DAN NUMBER := &INPUT;
BEGIN
    FOR N IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN*N);
    END LOOP;
END;
 
--==>>
-- 1,2,3 모두
/*
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```
### 3.3. 해설
``` SQL
-- 1. LOOP 문의 경우
ACCEPT NUM PROMPT '단을 입력하세요';
DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN*N);
        EXIT WHEN N>=9;
        N := N+1;
    END LOOP;
END;
 
 
-- 2. WHILE LOOP 문의 경우
ACCEPT NUM PROMPT '단을 입력하세요';
DECLARE
    DAN NUMBER := &NUM;
    N NUMBER;
BEGIN
    N := 0;
    WHILE N<9 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * '|| N || ' = ' || DAN*N);
    END LOOP;
END;
 
-- 3. FOR LOOP 문의 경우
ACCEPT NUM PROMPT '단을 입력하세요';
DECLARE
    DAN NUMBER := &NUM;
    N NUMBER;
BEGIN
    FOR N IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN*N );
    END LOOP;    
END;
 
--==>>
-- 1,2,3 모두
/*
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```
## 4. 문제
--○ 구구단 전체(2단 ~ 9 단)를 출력하는 PL/SQL 구문을 작성한다.  
--   단, 이중 반복문(반복문의 중첩) 구문을 활용한다.  
``` SQL
/*
실행 예)
==[2단]==
2 * 1 = 2
2 * 2 = 4
    :
==[3단]==
3 * 1 = 3
    :
9 * 9 = 81
*/
``` 
-- 1. LOOP 문의 경우  
-- 2. WHILE LOOP 문의 경우  
-- 3. FOR LOOP 문의 경우  
### 4.1. 답
``` SQL
-- 1. LOOP 문의 경우
DECLARE
    DAN NUMBER := 2;
    N   NUMBER;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('==['||DAN||'단]==');
        N := 1;
        LOOP
            DBMS_OUTPUT.PUT_LINE(DAN||' * '||N||' = '||DAN*N);
            N := N+1;
            
            EXIT WHEN N > 9;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        DAN := DAN+1;
        
        EXIT WHEN DAN > 9;
    END LOOP;
END;
-- 2. WHILE LOOP 문의 경우
DECLARE
    DAN NUMBER := 2;
    N   NUMBER;
BEGIN
    WHILE DAN<= 9 LOOP
        N := 1;
        
        DBMS_OUTPUT.PUT_LINE('==['||DAN||'단]==');
        WHILE N<= 9 LOOP
            DBMS_OUTPUT.PUT_LINE(DAN||' * '||N||' = '||DAN*N);
            N := N+1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        
        DAN := DAN+1;
    END LOOP;
END;
 
-- 3. FOR LOOP 문의 경우
DECLARE
    DAN NUMBER := 2;
    N   NUMBER;
BEGIN
    FOR DAN IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE('==['||DAN||'단]==');
        
        FOR N IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE(DAN || ' * '|| N || ' = ' || DAN*N);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        
    END LOOP;
END;
--==>>
/*
==[1단]==
1 * 1 = 1
1 * 2 = 2
1 * 3 = 3
1 * 4 = 4
1 * 5 = 5
1 * 6 = 6
1 * 7 = 7
1 * 8 = 8
1 * 9 = 9
 
==[2단]==
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18
 
==[3단]==
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27
 
==[4단]==
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36
 
==[5단]==
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45
 
==[6단]==
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54
 
==[7단]==
7 * 1 = 7
7 * 2 = 14
7 * 3 = 21
7 * 4 = 28
7 * 5 = 35
7 * 6 = 42
7 * 7 = 49
7 * 8 = 56
7 * 9 = 63
 
==[8단]==
8 * 1 = 8
8 * 2 = 16
8 * 3 = 24
8 * 4 = 32
8 * 5 = 40
8 * 6 = 48
8 * 7 = 56
8 * 8 = 64
8 * 9 = 72
 
==[9단]==
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81
 
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```

<BR>

# 페이지 20231018_02_scott.sql
## 1. 문제
--○ EMPLOYEES 테이블을 대상으로 108번 사원(Nancy)의  
--   SALARY 를 변수에 담아 출력하는 PL/SQL 구문을 작성한다.  
### 1.2. 답
``` SQL
DECLARE
    V_SALARY    EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT SALARY INTO V_SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 108;
    
    DBMS_OUTPUT.PUT_LINE(V_SALARY);
END;
/*
12008
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```
## 2. 문제
--○ EMPLOYEES 테이블의 특정 레코드 항목 여러 개를 변숭에 저장
--   103번 사원의 FIRST_NAME, PHONE_NUMBER, EMAIL 항목을 변수에 저장하여 출력
--   Alexander, 590.XXX, AHUNOLD
### 2.2. 답
``` SQL
DESC EMPLOYEES;
/*
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4) 
*/
DECLARE
    -- FIRST_NAME   VARCHAR2(20) 
    -- PHONE_NUMBER VARCHAR2(20)
    -- EMAIL        VARCHAR2(25)
    V_FIRST_NAME    EMPLOYEES.FIRST_NAME%TYPE;
    V_PHONE_NUMBER  EMPLOYEES.PHONE_NUMBER%TYPE;
    V_EMAIL         EMPLOYEES.EMAIL%TYPE;
BEGIN
    SELECT FIRST_NAME,PHONE_NUMBER,EMAIL 
            INTO V_FIRST_NAME, V_PHONE_NUMBER, V_EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME||', '||V_PHONE_NUMBER||', '||V_EMAIL);
END;
--==>> Alexander, 590.423.4567, AHUNOLD
 
--○ %ROWTYPE
 
-- 1. 테이블의 레코드와 같은 구조의 구조체 변수를 선언(여러 개의 컬럼)
 
-- 2. 형식 및 구조
-- 변수명 테이블명%ROWTYPE;
 
DECLARE
--    V_FIRST_NAME    EMPLOYEES.FIRST_NAME%TYPE;
--    V_PHONE_NUMBER  EMPLOYEES.PHONE_NUMBER%TYPE;
--    V_EMAIL         EMPLOYEES.EMAIL%TYPE;
    -- *각각 선언하는 변수가 많으면, 테이블 자체를 *
    
    V_EMP   EMPLOYEES%ROWTYPE;  --*행에대한 타입을 모두
BEGIN
    SELECT FIRST_NAME,PHONE_NUMBER,EMAIL 
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME||', '||V_EMP.PHONE_NUMBER||', '||V_EMP.EMAIL);    
--    DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME||', '||V_PHONE_NUMBER||', '||V_EMAIL);
END;
--==>> Alexander, 590.423.4567, AHUNOLD
 
--○ EMPLOYEES 테이블의 전체 레코드 항목 여러 개를 변수에 저장
--   모든 사원의 FIRST_NAME, PHONE_NUMGR,EMAIL 항목을 변수에 저장하여 출력
DECLARE
    V_EMP   EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME||', '||V_EMP.PHONE_NUMBER||', '||V_EMP.EMAIL); 
END;
--==>> 에러 발생
-- (ORA-01422: exact fetch returns more than requested number of rows)
-- *하나의 값만 담을 수 있는데 여러 행의 레코드 값을 담게 되어 에러*
 
--> 여러 개의 행(ROWS)정보를 얻어와 담을고 하면 
--  단일 변수에 저장하는 것 자체가 불가능해진다.
```

<BR>

# 페이지 20231102_05_scott(plsql).sql
## 📌 1. 안내
--○ TBL_INSA 테이블의 여러 명의 데이터 여러 개를 변수에 저장하여 출력
-- (반복문 활용)
``` SQL
DECLARE
    V_INSA   TBL_INSA%ROWTYPE;
BEGIN
    SELECT NAME, TEL, BUSEO 
            INTO V_INSA.NAME, V_INSA.TEL, V_INSA.BUSEO
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_INSA.NAME || ' - ' || V_INSA.TEL || ' - ' || V_INSA.BUSEO);
END;
--==>> 에러발생
 
DECLARE
    V_INSA   TBL_INSA%ROWTYPE;
BEGIN
    -- 조회 -> 단일 레코드 얻어오기 -> 변수에 담아내기
    SELECT NAME, TEL, BUSEO 
            INTO V_INSA.NAME, V_INSA.TEL, V_INSA.BUSEO
    FROM TBL_INSA
    WHERE NUM=1001;
    
    -- 출력
    DBMS_OUTPUT.PUT_LINE(V_INSA.NAME || ' - ' || V_INSA.TEL || ' - ' || V_INSA.BUSEO);
END;
--==>>
/*
홍길동 - 011-2356-4528 - 기획부
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
 
DECLARE
    V_INSA   TBL_INSA%ROWTYPE;
BEGIN
    -- 조회 -> 단일 레코드 얻어오기 -> 변수에 담아내기
    SELECT NAME, TEL, BUSEO 
            INTO V_INSA.NAME, V_INSA.TEL, V_INSA.BUSEO
    FROM TBL_INSA
    WHERE NUM=1002;
    
    -- 출력
    DBMS_OUTPUT.PUT_LINE(V_INSA.NAME || ' - ' || V_INSA.TEL || ' - ' || V_INSA.BUSEO);
END;
--==>>
/*
이순신 - 010-4758-6532 - 총무부
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
 
DECLARE
    V_INSA   TBL_INSA%ROWTYPE;
BEGIN
    -- 반복문 구성
    LOOP
        -- 조회 -> 단일 레코드 얻어오기 -> 변수에 담아내기
        SELECT NAME, TEL, BUSEO 
                INTO V_INSA.NAME, V_INSA.TEL, V_INSA.BUSEO
        FROM TBL_INSA
        WHERE NUM=1002; -- *현재는 상수
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_INSA.NAME || ' - ' || V_INSA.TEL || ' - ' || V_INSA.BUSEO);
    END LOOP;
END;
 
DECLARE
    V_INSA   TBL_INSA%ROWTYPE;
--    V_NUM    NUMBER;  -- *이렇게 해도 상관없지만, 논리적으로 TBL_INSA 테이블의 NUM 타입이 맞음*
    V_NUM    TBL_INSA.NUM%TYPE := 1001;
BEGIN
    -- 반복문 구성
    LOOP
        -- 조회 -> 단일 레코드 얻어오기 -> 변수에 담아내기
        SELECT NAME, TEL, BUSEO 
                INTO V_INSA.NAME, V_INSA.TEL, V_INSA.BUSEO
        FROM TBL_INSA
        WHERE NUM=V_NUM;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_INSA.NAME || ' - ' || V_INSA.TEL || ' - ' || V_INSA.BUSEO);
        
        -- 사원번호 1씩 증가시키는 구문
        V_NUM := V_NUM + 1;
        
        -- 반복문을 탈출하게 되는 조건(반복 종료)
        EXIT WHEN V_NUM > 1060;
        
    END LOOP;
END;
--==>>
/*
홍길동 - 011-2356-4528 - 기획부
이순신 - 010-4758-6532 - 총무부
이순애 - 010-4231-1236 - 개발부
:
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
```
>-- *이 방식의 문제점: 1)시작번호 알아야함, 2)끝번호 알아야함, 3)시리얼번호(연속된 번호) 여야 가능*  

<BR>

# 페이지 20231102_06_scott.sql
## 📌 1. 안내
``` SQL
SELECT NUM, NAME, TEL, BUSEO
FROM TBL_INSA
WHERE NUM = 1001;
-- *오라클 내부 가장 많이쓰는 구조체변수-> 커서*  
-- *현재는 커서를 안쓰고 반복문을 활용하는 방법 익히는중*

```

<BR>


# 페이지 20231103_01_scott(plsql).sql

## 1. 문제
--○ 임의의 정수 두 개를 매개변수(입력 파라미터)로 넘겨받아 -> (A,B)  
--   A 의 B 승의 값을 반환하는 사용자 정의 함수를 작성한다.  
--   단, 기존의 오라클 내장 함수를 이용하지 않고, 반복문을 활용하여 작성한다.  
-- 함수명 : FN_POW()  
/*
사용 예)
SELECT FN_POW(10,3)
FROM DUAL;
--==>> 1000
*/
### 1.2. 답
``` SQL
CREATE OR REPLACE FUNCTION FN_POW(V_N1 NUMBER, V_N2 NUMBER)
RETURN NUMBER
IS
    -- 선언부
    V_I      NUMBER := 1;   -- 증가변수
    V_RESULT NUMBER := V_N1;-- 결과값
BEGIN
    -- 실행부    
    LOOP
        EXIT WHEN V_I >= V_N2;
        V_RESULT := V_RESULT * V_N1;
        V_I := V_I + 1;
    END LOOP;
    
    -- 결과값 반환
    RETURN V_RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.
```
### 1.3. 해설
``` SQL
/*
FN_POW(10,3)
    기준 1 * 10 * 10 * 10 -> 1000 -(O)
    기준 0 * 10 * 10 * 10 -> 0    -(X)
*/
CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;    -- 반환 결과값 변수 -> 1로 초기화~!!! CHECK~!!!
    V_NUM       NUMBER;         -- 루프 변수
BEGIN
    -- 반복문 구성
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;   -- V_RESULT *= A;
    END LOOP;
    
    -- 최종 결과값 반환
    RETURN V_RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.
-- *PLSQL의 경우 컴파일 되었다고 해서, 로직이 문제가 없다는 것은 아님*  
```
### 1.4. ☑ 20231103_02_scott.sql
--○ 20231103_01_scott(plsql).sql 파일에서  
--   FN_POW() 함수 생성 후 테스트  
``` SQL
SELECT FN_POW(10,3) "RESULT"
FROM DUAL;
--==>> 1000
```
## 2. 문제
--○ TBL_INSA 테이블의 급여 계산 전용 함수를 정의한다.  
--   급여는 <(기본급*12)+수당> 기반으로 연산을 수행한다.  
-- 함수명: FN_PAY(기본급, 수당)  

--BASICPAY
--SUDANG
### 2.2. 답
``` SQL
CREATE OR REPLACE FUNCTION FN_PAY(V_BPAY NUMBER, V_SUDANG NUMBER)
RETURN NUMBER
IS
    V_RESULT NUMBER;
BEGIN
    V_RESULT := V_BPAY*12 + V_SUDANG;
    
    RETURN V_RESULT;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.
```
### 2.3. 해설
``` SQL
CREATE OR REPLACE FUNCTION FN_PAY(VBASICPAY NUMBER, VSUDANG NUMBER)
RETURN NUMBER
IS
    -- 주요 변수 선언
    VRESULT NUMBER;
BEGIN
    -- 연산 및 처리
    VRESULT := (NVL(VBASICPAY,0)*12) + NVL(VSUDANG,0);
    
    -- 최종 결과값 반환
    RETURN VRESULT;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.

-- *기본급 누락, 수락 누락 등이 있으면 -> NULL*  
-- *따라서, 안정적이기 위해 NULL을 고려해 연산 및 처리 하기*  
```
### 2.4. ☑ 20231103_02_scott.sql
--○ 20231103_01_scott(plsql).sql 파일에서  
--   FN_PAY() 함수 생성 후 테스트  
``` SQL
SELECT NUM, NAME, BASICPAY, SUDANG, FN_PAY(BASICPAY,SUDANG) "급여"
FROM TBL_INSA;
--==>> 
/*
1001	홍길동	2610000	200000	31520000
1002	이순신	1320000	200000	16040000
... 중략 ...
1060	김신애	900000	102000	10902000
*/
```
## 3. 문제
--○ TBL_INSA 테이블에서
--   입사일을 기준으로 현재까지 근무년수를 반환하는 함수를 정의한다.
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
-- 함수명: FN_WORKYEAR(입사일)
>-- *현재의 기준은 내년에 조회하더라도 가능하도록* 

--IBSADATE: 입사일
### 3.2. 답
``` SQL
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN VARCHAR2
IS
    V_RESULT NUMBER;
    V_RESULT2 VARCHAR2(20);
BEGIN
    V_RESULT := TRUNC(MONTHS_BETWEEN(SYSDATE,VIBSADATE)/12,1);
    V_RESULT2 := (TO_CHAR(V_RESULT) ||'='||TRUNC(V_RESULT)||'년'||MOD(V_RESULT,1)*12||'개월');
    
    V_RESULT2 := (TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE,VIBSADATE)/12))||'년')
                 ||(TO_CHAR(TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,VIBSADATE),12)))||'개월');
                 
    RETURN V_RESULT2;
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.
```
### 3.3. 해설
``` SQL
-- 1
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD'))/12 "RESULT"
FROM DUAL;
--==>> 25.06314046321186778176025487853444842692

-- 2
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD'))/12) || '년' ||
        TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, TO_DATE('1998-10-11','YYYY-MM-DD')),12)) || '개월'
FROM DUAL;
--==>> 25년0개월

-- 3: 년의 소수점 첫째자리까지
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS 
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE) / 12 ,1);
    
    RETURN VRESULT;
END;

-- 4: X년 X개월
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN VARCHAR2
IS 
    VRESULT VARCHAR2(20);
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE) / 12) || '년' ||
               TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,VIBSADATE),12))||'개월';
    
    RETURN VRESULT;
END;
```
### 3.4. 해설
--○ 20231103_01_scott(plsql).sql 파일에서  
--   FN_WORKYEAR() 함수 생성 후 테스트  
``` SQL
SELECT *
FROM TBL_INSA;

DESC TBL_INSA;

SELECT FN_WORKYEAR(IBSADATE) "RESULT"
FROM TBL_INSA;

SELECT NUM, NAME, IBSADATE, FN_WORKYEAR(IBSADATE) "RESULT"
FROM TBL_INSA;
```
### 3.4. ☑ 20231103_02_scott.sql
--○ 20231103_01_scott(plsql).sql 파일에서  
--   FN_WORKYEAR() 함수 생성 후 테스트  
``` SQL
SELECT NUM, NAME, IBSADATE, FN_WORKYEAR(IBSADATE) "RESULT"
FROM TBL_INSA;
```

## 4. 문제
--○ 데이터 입력 시 특정 항목의 데이터만 입력하면  
--  내부적으로 다른 추가항목에 대한 처리가 함께 이루어질 수 있도록 하는 프로시저를 작성한다.(생성한다.)  
--  프로시저명: PRC_SUNGJUK_INSERT()  

``` SQL
문제 인식)  
현재 TBL_SUNGJUK 테이블은  
HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE  
(학번, 이름, 국어점수, 영어점수, 수학점수, 총점, 평균, 등급) 컬럼으로 구성되어 있다.  
이 컬럼을 대상으로 특정 항목(학번, 이름, 국어점수, 영어점수, 수학점수)만 입력하면  
추가 항목(총점, 평균, 등급)은 알아서 처리될 수 있도록 프로시저를 구성하라는 것이다.  

실행 예)  
EXEC PRC_SUNGJUC_INSERT(1,'김다슬',90,80,70);  

-> 이와 같은 프로시저 호출로 처리된 결과  

학번 이름   국어점수 영어점수 수학점수  총점  평균  등급  
1    김다슬    90       80       70     240     80    B  
```
### 4.1. 답
``` SQL
CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.TOT%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
  -- 연산
  V_TOT := V_KOR + V_ENG + V_MAT;
  V_AVG := (V_TOT) / 3;
  
  IF V_AVG >= 90
    THEN V_GRADE := 'A';
  ELSIF V_AVG >= 80
    THEN V_GRADE := 'B';
  ELSIF V_AVG >= 70
    THEN V_GRADE := 'C';
  ELSE
    V_GRADE := 'D';
  END IF;

  -- 데이터 입력
  INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
         VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
  
  -- 커밋
  COMMIT;
END;
--==>> Procedure PRC_SUNGJUC_INSERT이(가) 컴파일되었습니다.
```
### 4.3. 해설
``` SQL
CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( 학번
, 성명
, 국어점수
, 영어점수
, 수학점수
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_SUNGJUC_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- 선언부
    -- INSERT 쿼리문을 수행하기 위해 필요한 추가 변수 구성
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 실행부
    -- 선언부에 추가로 선언한 주요 변수들에 값을 담아내야 한다.
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF (V_AVG>=90)
    -- *오라클에서는 괄호()가 있어야 한다는 규칙은 없음, 있어도 상관없음*
        THEN V_GRADE := 'A';
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- INSERT 쿼리문 수행
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUC_INSERT이(가) 컴파일되었습니다.
```
### 4.4. ☑ 20231103_02_scott.sql
-- ※ 프로시저를 생성하는 구문은  
--    <20231103_01_scott(plsql).sql>파일 참조~!!  

--○ 프로시저 생성 후 실행(호출)  
``` SQL
EXEC PRC_SUNGJUC_INSERT(1, '김다슬', 90, 80, 70);
EXEC PRC_SUNGJUC_INSERT(2, '노은하', 80, 70, 65);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
```
--○ 프로시저 호출 이후 테이블 조회
``` SQL
SELECT *
FROM TBL_SUNGJUK;
--==>> 
/*
1	김다슬	90	80	70	240	80	B
2	노은하	80	70	65	215	71.7	C
*/
```
## 5. 문제
--○ TBL_SUNGJUCK 테이블에서 특정 학생의 점수 (학번, 국어점수, 영어점수, 수학점수) 데이터 수정 시  
--  총점, 평균, 등급까지 함께 수정되는 프로시저를 생성한다.  
-- 프로시저명: PRC_SUNGJUK_UPDATE()  
``` SQL
실행 예)
EXEC PRC_SUNGJUK_UPDATE(2,50,50,50);

-> 이와 같은 프로시저 호출로 처리된 결과  

학번 이름   국어점수 영어점수 수학점수  총점  평균  등급  
1    김다슬    90       80       70     240     80    B
2    노은하    50       50       50     150     50    F
```
### 5.2. 답
``` SQL
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.TOT%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 연산
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := (V_TOT) / 3;
    
    IF (V_AVG>=90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- 데이터 입력
    UPDATE TBL_SUNGJUK
    SET KOR=V_KOR, ENG=V_ENG, MAT=V_MAT, TOT=V_TOT, AVG=V_AVG, GRADE=V_GRADE
    WHERE HAKBUN = V_HAKBUN;
      
    -- 커밋
    COMMIT;
END;
```
### 5.3. 해설

### 5.4. ☑ 20231103_02_scott.sql
``` SQL
EXEC PRC_SUNGJUK_UPDATE(2,50,50,50);
--==>>
/*
1	김다슬	90	80	70	240	80	B
2	노은하	50	50	50	150	50	F
*/

```

## 6. 문제
--○ TBL_STUDENTS 테이블에서 전화번호와 주소 데이터를 수정하는(변경하는) 프로시저를 작성한다.  
--  단, ID와 PW가 일치는 경우에만 수정을 진행 할 수 있도록 처리한다.  
-- 프로시저명: PRG_STUDENT_UPDATE()   
``` SQL
실행 예)
EXEC PRC_STUDENT_UPDATE('moon', 'java000$', '010-9999-9999', '강원도 횡성');
--> 데이터 수정 X

EXEC PRC_STUDENT_UPDATE('moon', 'java006$', '010-9999-9999', '강원도 횡성');
--> 데이터 수정 O
```
### 6.2. 답
``` SQL
DESC TBL_STUDENTS;

CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
BEGIN
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID
      AND (SELECT PW
            FROM TBL_IDPW
            WHERE ID=V_ID)= V_PW;
      
    COMMIT;
END;
```
### 6.3. 해설
``` SQL
-- 방법1
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
    V_PW2   TBL_IDPW.PW%TYPE;       -- 사용자가 입력한 PW를 담을 변수
    V_FLAG  NUMBER := 0;            -- 패스워드일치:1 / 패스워드불일치:2
BEGIN
    -- 작성개념1) FROM TBL_IDPW를 통해 ID 확인;
    
    -- 작성개념2) 'moon'일 것이다고 가정하고
    --              사용자가 입력한 PW를 받을 수 있도록 작성    
    SELECT PW INTO V_PW2
    FROM TBL_IDPW
    WHERE ID = 'moon';
    
    -- 조건에 따라 분기(사용자 입력PW, 테이블을 통해 얻은 PW - 일치/ 불일치)
    IF (V_PW = V_PW2)       -- 패스워드 일치
        THEN V_FLAG := 1;
    ELSE                    -- 패스워드 불일치
        V_FLAG := 2;
    END IF;
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID
--      AND 패스워드 일치;
      AND V_FLAG = 1;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE이(가) 컴파일되었습니다.


-- 방법2
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
BEGIN
    
    -- 두개의 테이블을 JOIN 해서 업데이트
    UPDATE (SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR    -- 괄호 안의 서브쿼리만 잡아서 조회해보기
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2   
            ON T1.ID = T2.ID) T
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE T.ID = V_ID
      AND T.PW = V_PW;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE이(가) 컴파일되었습니다.
```
### 6.4. ☑ 20231103_02_scott.sql
--○ TBL_STUDENT 테이블 조회
``` SQL
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
moon	문정환	010-1111-1111	제주도 서귀포시
wool	정한울	010-2222-2222	서울 강남구
*/

SELECT *
FROM TBL_IDPW;
--==>>
/*
moon	java006$
wool	java006$
*/
```

--○ 방법1) 프로시저 생성 후 실행 & 조회 ---------------------------------------
``` SQL
--○ 프로시저 생성 후 실행 테스트(잘못된 테스트)  
EXEC PRC_STUDENT_UPDATE('moon', 'java000$', '010-9999-9999', '강원도 횡성');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
moon	문정환	010-1111-1111	제주도 서귀포시
wool	정한울	010-2222-2222	서울 강남구
*/

--○ 프로시저 생성 후 실행 테스트(올바른 테스트)
EXEC PRC_STUDENT_UPDATE('moon', 'java006$', '010-9999-9999', '강원도 횡성');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
moon	문정환	010-9999-9999	강원도 횡성
wool	정한울	010-2222-2222	서울 강남구
*/
```
--○ 방법2) 프로시저 생성 후 실행 & 조회 ---------------------------------------
``` SQL
--○ 프로시저 생성 후 실행 테스트(잘못된 테스트)
EXEC PRC_STUDENT_UPDATE('wool', 'java000$', '010-8888-8888', '전남 목포');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
moon	문정환	010-9999-9999	강원도 횡성
wool	정한울	010-2222-2222	서울 강남구
*/

--○ 프로시저 생성 후 실행 테스트(올바른 테스트)
EXEC PRC_STUDENT_UPDATE('wool', 'java006$', '010-8888-8888', '전남 목포');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
moon	문정환	010-9999-9999	강원도 횡성
wool	정한울	010-8888-8888	전남 목포
*/
```
<BR>

# 페이지 20231106_01_scott(plsql).sql

## 1. 문제
--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.  
--  NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG 으로 구성된 컬럼 중  
--  NUM(사원번호) 을 제외한 항목의 데이터 입력 시   
--  해당 항목의 값은 기존 부여된 사원 번호의 마지막 번호 그 다음 번호를  
--  자동으로 입력 처리할 수 있는 프로시저를 구성한다.  
--  프로시저명 : PRC_INSA_INSERT()
``` SQL
실행 예)
EXEC PRC_INSA_INSERT('최혜인', '970812-2234567', SYSDATE, '서울', '010-2509-1783', '개발부', '대리', 2000000, 2000000) -- 이백만, 이백만
-> 위와 같이 프로시저 호출 및 실행

1061 최혜인 970812-2234567 2023-11-06 서울 010-2509-1783 개발부 대리 2000000 2000000
```
### 1.2. 답
``` SQL
CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME      IN TBL_INSA.NAME%TYPE
, V_SSN       IN TBL_INSA.SSN%TYPE
, V_IBSADATE  IN TBL_INSA.IBSADATE%TYPE
, V_CITY      IN TBL_INSA.CITY%TYPE
, V_TEL       IN TBL_INSA.TEL%TYPE
, V_BUSEO     IN TBL_INSA.BUSEO%TYPE
, V_JIKWI     IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY  IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG    IN TBL_INSA.SUDANG%TYPE
)
IS
  V_NUM   TBL_INSA.NUM%TYPE;
BEGIN
    /*
    -- 기존 부여된 사원번호의 마지막 번호
    SELECT MAX(NVL(NUM,0)) INTO NUM
    FROM TBL_INSA;
            
    -- 데이터 입력 쿼리문 구성
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG) 
            VALUES (V_NUM+1, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    -- 커밋
    COMMIT;
    */
    
    -- 기존 부여된 사원번호의 마지막 번호
    SELECT MAX(NVL(NUM,0)) + 1 INTO NUM
    FROM TBL_INSA;
            
    -- 데이터 입력 쿼리문 구성
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG) 
            VALUES (V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    -- 커밋
    COMMIT;
END;
```

### 1.4. ☑ 20231106_02_scott.sql
``` SQL
DESC TBL_INSA;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)
*/

--○ 프로시저 생성 후 실행 테스트(올바른 테스트)
--    <20231106_01_scott(plsql).sql>파일 참조~!!
EXEC PRC_INSA_INSERT('최혜인', '970812-2234567', SYSDATE, '서울', '010-2509-1783', '개발부', '대리', 2000000, 2000000);

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_INSA;
/*      :
1061	최혜인	970812-2234567	2023-11-06	서울	010-2509-1783	개발부	대리	2000000	2000000
*/
```
## 2. 문제
--※ 20231106_02_scott.sql 파일을 활용하여  
--   TBL_상품, TBL_입고 테이블을 대상으로  
--   TBL_입고 테이블에 데이터 입력 시(즉, 입고 이벤트 발생 시)  
--   TBL_상품 테이블에 해당 상품에 대한 재고수량이 함께 변동될 수 있는 기능을 가진 프로시저를 작성한다.  
--   단, 이 과정에서 입고번호는 자동 증가 처리한다.(시퀀스 사용 안함)  
--   TBL_입고 테이블 구성 컬럼은   
--   입고번호, 상품코드, 입고일자, 입고수량, 입고단가이며  
--   프로시저 호출을 통해 전달할 파라미터는 상품코드, 입고수량, 입고단가이다.  

--   프로시저명 : PRC_입고_INSERT(상품코드, 입고수량, 입고단가)  
--   프로시저명 : PRC_입고_INSERT(H001, 50, 500)  
### 2.2. 답
``` SQL
CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드 IN TBL_상품.상품코드%TYPE
, V_입고수량 IN TBL_입고.입고수량%TYPE
, V_입고단가 IN TBL_입고.입고단가%TYPE
)
IS
    -- 선언부
    -- 아래의 쿼리문을 수행하기 위해 필요한 변수 추가 선언
    V_입고번호 TBL_입고.입고번호%TYPE;
    V_재고수량 TBL_입고.입고단가%TYPE;    
BEGIN
    -- 실행부
    -- 선언한 변수에 값 담아내기
    -- SELECT 쿼리문 수행 -> 입고번호 확인
    SELECT NVL(MAX(입고번호),0) INTO V_입고번호
    FROM TBL_입고;
    
    -- INSERT 쿼리문 수행: 입고 테이블 데이터 삽입
    -- *입고일자는 TABLE의 디폴트 SYSDATE를 가져옴*  
    INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가)
         VALUES ((V_입고번호+1), V_상품코드, V_입고수량, V_입고단가);
         
    -- 기존 재고수량
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- UPDDATE 쿼리문 수행: 상품 테이블 재고수량 업데이트
    UPDATE TBL_상품
    SET 재고수량 = V_재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 예외 처리
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
    -- *이외의 다른 상황이 발생하면, 롤백해라*  
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.

```
### 2.4. ☑ 20231106_02_scott.sql
``` SQL
--○ 테이블 조회(입고내역 확인)
SELECT *
FROM TBL_입고;
--==>> 조회 결과 없음

--※ TBL_입고 테이블에 <입고> 이벤트 발생 시 ...
--   관련 테이블에 수행되어야 하는 내용

-- (1) INSERT -> TBL_입고
--     INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
--     VALUES(1,'H001', SYSDATE, 30, 400);

-- (2) UPDATE -> TBL_상품
--     UPDATE TBl_상품
--     SET 재고수량 = 기존재고수량 + 입고수량     -- CHECK~!!!
--     WHERE 상품코드 = 'H001';



SELECT *
FROM TBL_상품;
/*
상품코드	상품명	소비자가격	재고수량
H001	    바밤바	    600	    0
*/
SELECT *
FROM TBL_입고;
/*
입고번호 상품코드 입고일자 입고수량 입고단가
*/

--○ 생성한 프로시저가 제대로 작동하는지 여부 확인 -> 프로시저 호출
EXEC PRC_입고_INSERT(상품코드, 입고수량, 입고단가);

EXEC PRC_입고_INSERT('H001', 30, 500);

SELECT *
FROM TBL_상품;
/*
상품코드	상품명	소비자가격	재고수량
H001	    바밤바	    600	    0
*/

SELECT *
FROM TBL_입고;
/*
입고번호 상품코드 입고일자 입고수량 입고단가
1	H001	2023-11-06	30	400
*/

EXEC PRC_입고_INSERT('H002', 20, 400);

SELECT *
FROM TBL_상품;
/*        :
H001	바밤바	600	30
H002	죠스바	500	20
*/

SELECT *
FROM TBL_입고;
/*
1	H001	2023-11-06	30	400
2	H002	2023-11-06	20	400
*/
```
## 3. 문제
--○ TBL_NUMBER 테이블에 데이터를 입력하는 프로시저를 작성  
--   단, 이 프로시저를 통해 데이터를 입력하는 경우  
--   CITY(지역) 항목에 '서울', '경기', '대전'만 입력이 가능하도록 구성한다.  
--   이 지역 외의 다른 지역을 프로시저 호출을 통해 입력하려는 경우  
--   (즉, 유효하지 않은 데이터 입력을 시도하려는 경우) 예외에 대한 처리를 하려고 한다.  
--   프로시저명: PRC_MEMBER_INSERT()  
/*
실행 예)
EXEC PRC_MEMBER_INSERT('박범구', '010-1111-1111', '서울');
--> 데이터 입력 ○

EXEC PRC_MEMBER_INSERT('김경태', '010-2222-2222', '부산');
--> 데이터 입력 X
*/

### 3.2. 답
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
            ROLLBACK;
        WHEN OTHERS     -- *기타 다른 에러가 날 경우*  
            THEN ROLLBACK;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시) TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.  
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.  
--   또한, 출고수량이 재고수량보다 많은 경우... 출고 액션을 취소할 수 있도록 처리한다.  
--   (출고가 이루어지지 않도록...) -> 예외 처리 활용 CHECK~!!!  
--   프로시저명: PRC_출고_INSERT()

/*
실행 예)
EXEC PRC_출고_INSERT('H001', 10, 600);
-> 이 시점에서 상품 테이블의 바밤바 재고수량은 70개

EXEC PRC_출고 IWNERT('H001', 80, 600);

-> 에러 발생
-- (20002, 재고부족~!!!)
*/

CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드 IN TBL_출고.상품코드%TYPE
, V_출고수량 IN TBL_출고.출고수량%TYPE
, V_출고단가 IN TBL_출고.출고단가%TYPE
)
IS
    V_NUM               TBL_상품.재고수량%TYPE;
    USER_DEFINE_ERROR2   EXCEPTION;
BEGIN
    SELECT 재고수량 INTO V_NUM
    FROM TBL_상품 
    WHERE 상품코드=V_상품코드;
    
    IF (V_NUM<V_출고수량)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
        VALUES((SELECT NVL(MAX(출고번호),0) +1 FROM TBL_출고), V_상품코드, V_출고수량, V_출고단가);
        
    UPDATE TBL_상품
    SET 재고수량 =  V_NUM - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002,'출고수량이 재고수량보다 많습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
        
    -- 커밋
    COMMIT;
END;
```
### 3.3. 해설
``` SQL
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드 IN TBL_출고.상품코드%TYPE
, V_출고수량 IN TBL_출고.출고수량%TYPE
, V_출고단가 IN TBL_출고.출고단가%TYPE
)
IS
    -- 주요 변수 선언
    V_출고번호 TBL_출고.출고번호%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
    
    -- 사용자 정의 예외 선언
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 쿼리문 수행 이전에 수행 여부를 확인하는 과정에서
    -- 재고수량 파악 -> 기존 재고를 확인하는 과정이 선행되어야 한다.
    -- 그래야 프로시저 호출 시 넘겨받는 출고수량과 비교가 가능하기 때문...
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- 출고를 정상적으로 진행해줄 것인지에 대한 여부 확인
    -- 위에서 파악한 재고수량보다 현재 프로시저에서 넘겨받은 출고수량이 많으면
    -- 예외발생~!!!
    IF (V_출고수량>V_재고수량)
        -- 예외발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 출고번호얻어내기 -> 위에서 선언한 변수에 값 담아내기
    SELECT NVL(MAX(출고번호),0) + 1 INTO V_출고번호
    FROM TBL_출고;

    -- 쿼리문 구성 -> INSERT(TBL_출고)
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES(V_출고번호, V_상품코드, V_출고수량, V_출고단가);
    
    -- 쿼리문 구성 -> UPDATE(TBL_상품)
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    -- *예외처리는 커밋보다 상위에 있는 것을 실무적인 차원에서 권장함*
    -- *절차적인 언어이기 때문에, 종종 COMMIT 이후 예외처리를 하기도 하는 문제 발생*  
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.


```
### 3.4. ☑ 20231106_02_scott.sql
``` SQL
-- ■■■ 프로시저 내에서의 예외 처리 ■■■--
--○ 실습 테이블 생성(TBL_NUMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
, CONSTRAINT NUMBER_NUM_PK PRIMARY KEY(NUM)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인
EXEC PRC_MEMBER_INSERT('박범구', '010-1111-1111', '서울');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_MEMBER;
--==>> 1	박범구	010-1111-1111	서울

EXEC PRC_MEMBER_INSERT('김경태', '010-2222-2222', '부산');
--==>> 에러발생
--     (ORA-20001: 서울,경기,대전만 입력이 가능합니다.)

SELECT *
FROM TBL_MEMBER;
--==>> 1	박범구	010-1111-1111	서울
```
## 4. 문제
--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시) TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.  
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.  
--   또한, 출고수량이 재고수량보다 많은 경우... 출고 액션을 취소할 수 있도록 처리한다.  
--   (출고가 이루어지지 않도록...) -> 예외 처리 활용 CHECK~!!!  
--   프로시저명: PRC_출고_INSERT()  
``` SQL
실행 예)
EXEC PRC_출고_INSERT('H001', 10, 600);
-> 이 시점에서 상품 테이블의 바밤바 재고수량은 70개

EXEC PRC_출고 IWNERT('H001', 80, 600);

-> 에러 발생
-- (20002, 재고부족~!!!)
```

### 4.1. 답
``` SQL
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드 IN TBL_출고.상품코드%TYPE
, V_출고수량 IN TBL_출고.출고수량%TYPE
, V_출고단가 IN TBL_출고.출고단가%TYPE
)
IS
    V_NUM               TBL_상품.재고수량%TYPE;
    USER_DEFINE_ERROR2   EXCEPTION;
BEGIN
    SELECT 재고수량 INTO V_NUM
    FROM TBL_상품 
    WHERE 상품코드=V_상품코드;
    
    IF (V_NUM<V_출고수량)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
        VALUES((SELECT NVL(MAX(출고번호),0) +1 FROM TBL_출고), V_상품코드, V_출고수량, V_출고단가);
        
    UPDATE TBL_상품
    SET 재고수량 =  V_NUM - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002,'출고수량이 재고수량보다 많습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
        
    -- 커밋
    COMMIT;
END;
```
### 4.3. 해설
``` SQL
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드 IN TBL_출고.상품코드%TYPE
, V_출고수량 IN TBL_출고.출고수량%TYPE
, V_출고단가 IN TBL_출고.출고단가%TYPE
)
IS
    -- 주요 변수 선언
    V_출고번호 TBL_출고.출고번호%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
    
    -- 사용자 정의 예외 선언
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 쿼리문 수행 이전에 수행 여부를 확인하는 과정에서
    -- 재고수량 파악 -> 기존 재고를 확인하는 과정이 선행되어야 한다.
    -- 그래야 프로시저 호출 시 넘겨받는 출고수량과 비교가 가능하기 때문...
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- 출고를 정상적으로 진행해줄 것인지에 대한 여부 확인
    -- 위에서 파악한 재고수량보다 현재 프로시저에서 넘겨받은 출고수량이 많으면
    -- 예외발생~!!!
    IF (V_출고수량>V_재고수량)
        -- 예외발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 출고번호얻어내기 -> 위에서 선언한 변수에 값 담아내기
    SELECT NVL(MAX(출고번호),0) + 1 INTO V_출고번호
    FROM TBL_출고;

    -- 쿼리문 구성 -> INSERT(TBL_출고)
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES(V_출고번호, V_상품코드, V_출고수량, V_출고단가);
    
    -- 쿼리문 구성 -> UPDATE(TBL_상품)
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    -- *예외처리는 커밋보다 상위에 있는 것을 실무적인 차원에서 권장함*
    -- *절차적인 언어이기 때문에, 종종 COMMIT 이후 예외처리를 하기도 하는 문제 발생*  
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.
```
### 4.4. ☑ 20231106_02_scott.sql
``` SQL
SELECT *
FROM TBL_출고;
--==>> 조회결과 없음

EXEC PRC_출고_INSERT('H001', 20, 600);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C001', 20, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C001', 20, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C001', 10, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_출고;
--==>> 
/*
1	H001	2023-11-06	20	600
2	C001	2023-11-06	20	1500
3	C001	2023-11-06	20	1500
4	C001	2023-11-06	10	1500
5	H001	2023-11-06	10	500
6	H001	2023-11-06	10	500
7	H001	2023-11-06	10	500
*/

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	30
H002	죠스바	500	50
H003	보석바	500	35
H004	누가바	600	70
H005	쌍쌍바	700	0
H006	수박바	500	0
H007	알껌바	500	0
C001	빵빠레	1600	20
C002	월드콘	1500	20
C003	메타콘	1500	20
C004	구구콘	1600	20
C005	슈퍼콘	1700	0
E001	빵또아	2600	0
E002	투게더	2500	0
E003	팥빙수	2500	0
E004	셀렉션	2600	0
E005	설레임	2700	0
*/

EXEC PRC_출고_INSERT('C001', 30, 1500);
--==>> 에러발생
--      ORA-20002: 재고부족~!!!

EXEC PRC_출고_INSERT('H001', 10, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('H001', 10, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('H001', 10, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('H002', 20, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('H003', 15, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

-------------------------------------------------------------------------------
SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	30
H002	죠스바	500	30
          :
*/

SELECT *
FROM TBL_출고;
--==>>
/*
          :
8	H002	2023-11-06	20	500
          :
*/

EXEC PRC_출고_INSERT('H001', 10, 600);

EXEC PRC_출고_INSERT('H001', 80, 600);
```
## 5. 문제
--○ TBL_출고 테이블에서 출고수량을 수정(변경)하는 프로시저를 작성한다.  
--   프로시저명: PRC_출고_UPDATE()  
``` SQL
/*
실행 예)
EXEC PRC_출고_UPDATE(출고번호, 변경할수량);
*/
```
-- *출고번호가 잘못되었을 때, 기존 수량를 +, 수정되어야 하는 수량-*  

### 5.1. 답
``` SQL
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( V_출고번호    IN TBL_출고.출고번호%TYPE
, V_변경수량    IN TBL_출고.출고수량%TYPE
)
IS
    V_상품코드 TBL_출고.상품코드%TYPE;
    V_출고수량 TBL_출고.출고수량%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR3 EXCEPTION;
BEGIN
    -- 출고테이블의 상품코드, 출고수량
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- 상품테이블의 재고수량
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    IF ((V_재고수량+V_출고수량)<V_변경수량)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    UPDATE TBL_상품
    SET 재고수량 = (V_재고수량+V_출고수량) - V_변경수량
    WHERE 상품코드 = V_상품코드;
    
    UPDATE TBL_출고
    SET 출고수량 = V_변경수량
    WHERE 출고번호 = V_출고번호;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    COMMIT;
END;


SELECT *
FROM TBL_출고;
--==>>
/*
출고번호	상품코드	출고일자	출고수량	출고단가
1	        H001	    2023-11-06	    20	    600
2	        C001	    2023-11-06	    20	    1500
*/
SELECT *
FROM TBL_상품;
--==>> 
/*
상품코드	상품명	소비자가격	재고수량
H001	    바밤바	    600	    30
H002	    죠스바	    500	    40
*/

-- *변경할 수량을 빼는 것은 재고수량에서 그냥 빼는 것이 아니라,
--  *출고에서 뺀 수량을 더하고 난 다음 빼는 것이다.
/*
1. 출고 테이블에서 V_상품코드, V_출고수량
2. 상품 테이블에서 V_상품코드에 해당하는 재고수량 가져오기
3. (원래 재고수량 + V_출고수량) < 변경할수량
     -> 에러발생
     
4. UPDATE 구문
상품테이블에서 재고수량  = 재고수량 + V_출고수량 - 변경할 수량

5. 예외처리...
*/
```
### 5.3. 해설
``` SQL

```
### 5.4. ☑ 20231106_02_scott.sql
``` SQL
/* 5-문제: 내 프로시저 확인 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- H002	죠스바	500	30
-- 8	H002	2023-11-06	20	500
EXEC PRC_출고_UPDATE(8, 60);
--==>> 에러 발생
--      (ORA-20002: 재고부족~!!!)

EXEC PRC_출고_UPDATE(8, 10);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_상품;
--==>>
/*
          :
H002	죠스바	500	40
          :
*/

SELECT *
FROM TBL_출고;
--==>>
/*
          :
8	H002	2023-11-06	10	500
          :
*/


/* 5-문제: 함께 프로시저 확인 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT *
FROM TBL_상품;
/*         :
H003	보석바	500	20
*/
SELECT *
FROM TBL_출고;
/*              :
9	H003	2023-11-06	15	500
*/

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 ->프로시저 호출
EXEC PRC_출고_UPDATE(9,40);
--==>> 에러 발생
--      (ORA-20002: 재고부족~!!)

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 ->프로시저 호출
EXEC PRC_출고_UPDATE(9,25);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 이후 테이블 조회(확인)
SELECT *
FROM TBL_출고;
--==>>
/*                :
9	H003	2023-11-06	25	500
*/

SELECT *
FROM TBL_상품;
--==>>
/*                :
H003	보석바	500	10
*/
```



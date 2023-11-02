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

# 페이지 20231102_05_scott(qlsql).sql
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


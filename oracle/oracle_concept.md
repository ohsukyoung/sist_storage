## ✅ 개념

<BR>

### 1. 개념
#### 1.1. 관계형 데이터베이스(RDBMS)
: 각각의 데이터를 테이블의 형태로 연결시켜 저장해 놓은 구조. 그리고 이들 각각의 테이블 간의 관계를 설정하여 연결시켜 놓은 구조
``` SQL
 ※ SELECT 문의 처리(PARSING) 순서
 
    SELECT      컬럼명     -- ⑤ ┐
    FROM        테이블명   -- ① ┘
    WHERE       조건절     -- ② +
    GROUP BY    절         -- ③ +
    HAVING      조건절     -- ④ +
    ORDER BY    절         -- ⑤ +
```
>-- *테이블 스페이스에서 `FROM`을 가장 먼저 찾음*  
-- *`FROM` - `WHERE` - `GROUP BY` - `HAVING` - `SELECT` - `ORDER BY`*  
-- *1,5는 반드시 있어야함*  
-- *+는 단독으로 존재가능*
#### 1.2. 오라클의 주요 자료형(DATA TYPE)
##### 1.2.1. MSSQL 서버
###### 1.2.1.1. 정수 표현타입
``` SQL
    tinyint     0 ~ 255             1byte
    smallint    -32.768 ~ 32.767    2byte
    int         -21억 ~ 21억        4byte
    bigint      엄청큼              8byte
```
###### 1.2.1.2. 실수 표현 타입
``` SQL
float, real
```
###### 1.2.1.2. 숫자 표현 타입
``` SQL
decimal, numeric
```
###### 1.2.1.2. 문자 표현 타입
``` SQL
char, varchar, Nvarchar
```
> ※ ORACLE 은 숫자 표현 타입이 한 가지로 통일되어 있다.
##### 1.2.2. 숫자형 
``` SQL
          NUMBER       -> -10의 38승-1 ~ 10의 38승
          NUMBER(3)    -> -999  ~ 999       --** 길이를 명시해야 메모리 낭비가 적음
          NUMBER(4)    -> -9999 ~ 9999
          NUMBER(4,1)  -> -999.9 ~ 999.9    --** 두번째 자리: 소수점 이하 자리
```
> ※ ORACLE 의 문자 표현 타입
##### 1.2.3. 문자형
``` SQL
          CHAR         -> 고정형 크기
                          (무조건 지정된 크기 소모)
                          
          CHAR(10)     <---- '강의장'       6Byte 이지만 10Byte 를 소모      --** 10바이트를 담을 수 있는 문자열 지정                
          CHAR(10)     <---- '잠든홍길동'   10Byte
          CHAR(10)     <---- '오잠깬홍길동' 10Byte 를 초과하므로 입력 불가
```
``` SQL
          VARCHAR2     -> 가변형 크기
                          (상황에 따라 크기가 변경)
          VARCHAR2(10)  <---- '강의장'       6Byte
          VARCHAR2(10)  <---- '잠든홍길동'   10Byte
          VARCHAR2(10)  <---- '오잠깬홍길동' 10Byte 를 초과하므로 입력 불가
```
> -- *CHAR가 VARCHAR2보다 효율적임 -> 데이터외에 데이터에 대한 정보가 VARCHAR2가 더 큼*
``` SQL
          NCHAR        -> 유니코드 기반 고정형 크기(글자수)
          NCHAR(10)     <---- 10글자
          
          NVARCHAR2    -> 유니코드 기반 가변형 크기(글자수)
          NVARCHAR2(10) <---- 10글자
```
##### 1.2.3. 날짜형



### 2. 테이블 관련
#### 2.1. 소유의 테이블 조회
``` SQL
SELECT *
FROM TAB;
--==>>
/*
BONUS	        TABLE	-- 보너스(BONUS) 데이터 테이블
DEPT	        TABLE	-- 부서(DEPARTMENTS) 데이터 테이블
EMP	            TABLE	-- 사원(EMPLOYEES) 데이터 테이블
SALGRADE	    TABLE	-- 급여(SAL) 데이터 테이블
 
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
*/
```
#### 2.2. 각 테이블의 데이터 조회
``` SQL
SELECT *
FROM TAB;
SELECT *
FROM DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
```
#### 2.3. DEPT 테이블에 존재하는 컬럼의 구조 확인
``` SQL
DESCRIBE DEPT;
DESC DEPT; -- DESCRIBE 를 DESC로 단축 가
--==>>
/*
이름     널?       유형       -- *널? : NULL 상태 수용 컬럼인지*    
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
*/
```
### 3. 형식 지정
``` SQL
ALTER SESSEION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> 2023-10-18

ALTER SESSEION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>> 2023-10-18 12

ALTER SESSEION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--** 24시를 기준으로 시간 설정됨 EX. 오후 1시 ->13
--==>>2023-10-18 14:05:55
```







<br><br>
*******
<br>

## 작성샘플
### SQL
``` SQL

```
### 하단 설명
-- *하단설명내용*

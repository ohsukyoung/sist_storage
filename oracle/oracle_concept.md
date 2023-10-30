# ✅ 개념

<BR>

# 1. 개념
## 1.1. 오라클의 주요 자료형(DATA TYPE)
### 1.1.1. MSSQL 서버
#### 1.1.1.1. 정수 표현타입
``` SQL
    tinyint     0 ~ 255             1byte
    smallint    -32.768 ~ 32.767    2byte
    int         -21억 ~ 21억        4byte
    bigint      엄청큼              8byte
```
#### 1.1.1.2. 실수 표현 타입
``` SQL
float, real
```
#### 1.1.1.2. 숫자 표현 타입
``` SQL
decimal, numeric
```
#### 1.1.1.2. 문자 표현 타입
``` SQL
char, varchar, Nvarchar
```
> ※ ORACLE 은 숫자 표현 타입이 한 가지로 통일되어 있다.
### 1.1.2. 숫자형 
``` SQL
          NUMBER       -> -10의 38승-1 ~ 10의 38승
          NUMBER(3)    -> -999  ~ 999       --** 길이를 명시해야 메모리 낭비가 적음
          NUMBER(4)    -> -9999 ~ 9999
          NUMBER(4,1)  -> -999.9 ~ 999.9    --** 두번째 자리: 소수점 이하 자리
```
> ※ ORACLE 의 문자 표현 타입
### 1.2.3. 문자형
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
### 1.2.3. 날짜형

<BR>

# 2. 테이블 관련
## 2.1. 소유의 테이블 조회
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
## 2.2. 각 테이블의 데이터 조회
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
## 2.3. DEPT 테이블에 존재하는 컬럼의 구조 확인
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
## 2.4. 현재 시간 및 날짜
### 2.4.1. 형식 지정
``` SQL
ALTER SESSEION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> 2023-10-18

ALTER SESSEION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>> 2023-10-18 12

ALTER SESSEION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--** 24시를 기준으로 시간 설정됨 EX. 오후 1시 ->13
--==>>2023-10-18 14:05:55
```
### 2.4.2. 현재 시간 및 날짜 반환
``` SQL
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>> 2023-10-19 10:43:40	2023-10-19 10:43:40	23/10/19 10:43:40.000000000
```
### 2.4.3. 날짜 언어 및 원 설정 
``` SQL
ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.
ALTER SESSION SET NLS_CURRENCY='￦'; 
```

## 2.5. 휴지통 비우기
``` SQL
PUGER RECYCLEBIN;
```
## 2.6. 커멘트
> -- *커멘트를 안달아도 크게 상과없지만, 같이 일하기 좋은사람이 될 수 있고 내가 관리하기에도 좋다.*
### 2.6.1. 테이블 레벨 커멘트
#### 2.6.1.1. 테이블 레벨 커멘트 정보 확인
``` SQL
SELECT *
FROM USER_TAB_COMMENTS;
/*
DEPT	        TABLE	
EMP	            TABLE	
BONUS	        TABLE	
TBL_EMP	        TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
SALGRADE	    TABLE	
EMP4	        TABLE	
TBL_DEPT	    TABLE	
EMP5	        TABLE	
*/
```
#### 2.6.1.2. 테이블 레벨 커멘트 정보 입력
``` SQL
COMMENT ON TABLE TBL_EMP IS '사원정보';
--==>> Comment이(가) 생성되었습니다.
```
### 2.6.2. 컬럼 레벨 커멘트
``` SQL
COMMENT 작성형식1) COMMENT ON TABLE 테이블명 IS '커멘트';
```
#### 2.6.2.1. 컬럼 레벨 커멘트 정보 확인
``` SQL
SELECT *
FROM USER_COL_COMMENTS;
/*
TBL_EMP	    HIREDATE	
EMP4	    EMPNO	
BIN$IhHBS6pBRP627poXcYfBUA==$0	DEPTNO	
EMP4	    COMM	
... 중략 ...
TBL_DEPT	DEPTNO	
*/

--○ 커멘트 정보 입력 후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE	사원 정보
*/
```
#### 2.6.2.2. 컬럼 레벨 커멘트 정보 입력
--○ 테이블에 소속된 컬럼에 대한 커멘트 데이터 입력
``` SQL
COMMENT ON COLUMN TBl_DEPT.DEPTNO IS '부서 번호';
--==>> Comment이(가) 생성되었습니다.

--○ 확인
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';
/*
TBL_DEPT	DEPTNO	부서 번호
...중략...
*/
```
## 2.7. NULL
NULL은 상태의 값을 의미.  
실제 존재하지 않는 값이기 때문에 NULL 이 연산에 포함될 경우 그 결과는 무조건 NULL
>-- *엄밀히 말하면, NULL은 상태의 값*
``` SQL
--○ NULL 의 처리
SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>> (NULL) (NULL) (NULL-2), (NULL/2)				
--** 실제로 값이 보이지 않음
```
### 2.7.1. NULL의 표현
※ NULL은 실제 존재하는 값이 아니기 때문에 일반적인 연산자를 활용하여 비교할 수 없다.  
    NULL 을 대상으로 사용할 수 없는 연산자들...  
    >=, <=, =, >, <,  
    같지 않다(3가지): !=, <>, ^=  

<BR>


# 3. 관계형 데이터베이스(RDBMS)
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

## 3.1. 별칭(ALIAS)
: 테이블을 조회하는 과정에서 각 컬럼의 이름에는 별칭(ALIAS)을 부여할 수 있다.  
기본 구문의 형식은 『컬럼명 AS "별칭이름"』의 형태로 작성되며 이 때, 『AS』는 생략이 가능하다.  
또한, 별칭 이름을 감싸는 『""』도 생략이 가능하지만 ""』 를 생략할 경우 별칭 내에서 공백은 사용할 수 없다.  
공백의 등장은 해당 컬럼의 표현에 대한 종결을 의미하므로 별칭의 이름 내부에 공백을 사용해야 할 경우 『""』 를 사용하여 별칭을 부여할 수 있도록 한다. 
``` SQL
EMPNO AS "사원번호"  --: SQL에서는 문자열은 '(작은따옴표)이지만, AS(별칭)을 지을때는 "(큰따옴표)
                    --   '일시 에러발생(ORA-00923: FROM keyword not found where expected)
 ENAME "사원명"      --: AS 생략 가능
 JOB 직종명          --: " 생략 가능
 SAL "급   여"       --: 별칭안에 공백이 있을 시 " 생략불가
```
## 3.2. DDL: 정의어(테이블 생성, 변경, 삭제, 복사)
DB를 구축하거나 수정할 때 사용(DB구조, DATA 형식, 접근방식)
> 구조적으로 생성 CREATE  
            변경 ALTER  
            삭제 DROP  
### 3.2.1. 테이블 생성
CREATE TABLE 테이블명 (속성명 데이터 타입 NOT NULL)
``` SQL
CREATE TABLE EMP4
( EMPNO NUMBER(4)
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2)
);
--==>> Table EMP4이(가) 생성되었습니다.
```
#### 3.2.1.1. 뷰 생성
> CREATE OR REPLACE VIEW VIEW_SAWON2  
AS  
SELECT
FROM...
``` SQL
CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.*
        , CASE WHEN T.현재나이 >= 40 THEN T.급여*0.7 
               WHEN T.현재나이 >= 30 THEN T.급여*0.5
               WHEN T.현재나이 >= 20 THEN T.급여*0.3
               ELSE 0
          END "나이보너스"
FROM
(
    SELECT SANAME "사원명"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
                ELSE '성별확인불가'
           END "성별"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
                WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) 
                ELSE -1
           END "현재나이"
         , SAL "급여"
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON2이(가) 생성되었습니다.
```
### 3.2.2. 테이블 컬럼 구조의 추가 및 제거
--○ TBL_EMP 테이블에 주민등록번호 데이터를 담을 수 있는 컬럼 추가
--** 테이블의 구조가 바뀌기 때문에 ALTER
``` SQL
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP이(가) 변경되었습니다.
```
### 3.2.3. 테이블 삭제
``` SQL
DROP TABLE TBL_EXAMPLE1;
--==>> Table TBL_EXAMPLE1이(가) 삭제되었습니다.
```
### 3.2.4. 테이블 복사
--○ 대상 테이블의 내용에 따라 테이블 생성(TBL_EMP)
``` SQL
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
```
## 3.3. DML: 데이터 조작어(데이터 검색, 삽입, 삭제, 갱신)
사용자가 실질적으로 저장된 데이터를 관리하는 언어
> 데이터     검색 SELECT  
            삽입 INSERT  
            삭제 DELETE  
            갱신 UPDATE
### 3.3.1. 데이터 검색
``` SQL
SELECT EMPNO, ENAME, SSN
FROM TBL_EMP;
```
> -- *※ 테이블 내에서 컬럼의 순서는 구조적으로 의미 없음.*  
-- *얼마든지 SELECT로 원하는 모양으로 만들 수 있기 때문에*
### 3.3.2. 데이터 삽입
> `INSERT` `INTO` 테이블명 `VALUES`('A','B')
``` SQL
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '남궁민', '0202023234567', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 2300);
```
### 3.3.3. 데이터 삭제
> `DELETE` `FROM` 테이블명 [WHERE]
> -- *조회 후 삭제!*
``` SQL
--** 바로 삭제하지 않는다!
 
--○ 삭제할 내용 조회
SELECT *
FROM TBL_DEPT
WHERE DEPTNO = 50;
--==>> 50	연구부	인천
 
--○ 조회 후 삭제
DELETE TBL_DEPT
WHERE DEPTNO = 50;
--==>> 1 행 이(가) 삭제되었습니다.
*/
```
### 3.3.4. 데이터 갱신
> `UPDATE` 테이블명 `SET` 속성명 = 데이터 [WHERE]
``` SQL
UPDATE TBL_DEPT
SET DNAME = '연구부', LOC = 'RUDRL'
WHERE DEPTNO = 50;
```
## 3.4. DCL: 데이터 제어어 (COMMIT, ROLLBACK, GRANT)
데이터 보안, 무결성, 회복, 병행제어를 정의하는 언어
### 3.4.1. COMMIT
츠랜잭션 처리가 정상적으로 완료되면 수행한 내용을 DB에 반영하는 명령어
### 3.4.2. ROLLBACK
변경되었으나 커밋되지 않은 내용을 취소하고 이전상태로 되돌리는 명령어
>--※ COMMIT 을 실행한 이후로 DML(INSERT, UPDATE, DELETE) 구문을 통해 변경된 데이터를 휘소할 수 있는 것 뿐...  
--   DML 명령을 사용한 후 COMMIT을 수행하고 나서 ROLLBACK을 실행해봐야 아무소용이 없다.
-- *CREATE, ALTER 는 AUTO COMMIT!! 주의하기!!*
### 3.4.3. GRANT
권한부여
#### 3.4.3.1. 사용자 등급
#### 3.4.3.2. 테이블 속성 권한

### 3.4.4. REVOKE
권한취소

## 3.5. DML>SELECT
### 3.5.1. 조건 연산자
#### 3.5.1.1. 비교연산자
`=`,`<`,`>`,`<=`,`>=`...
#### 3.5.1.2. 논리연산자
`NOT`,`AND`,`OR`
#### 3.5.1.3. LIKE 연산자
`%`,`_`,`#`,`[]`,`[^]` 
--※ WILD CARD(CHARACTER) -> 『3%』  
--   『LIKE』 와 함께 사용되는 『%』는 모든 글자를 의미하고  
--   『LIKE』 와 함께 사용되는 『_』는 아무 글자 한 개를 의미한다. 
##### 3.5.1.3.1. ESCAPE 
--※ ESCAPE 로 정한 문자의 다음 한 글자를 와일드 카드에서 탈출시켜라..
--   일반적으로 사용 빈도가 낮은  특수문자(특수기호)를 사용한다.
> -- *쓰려고 하는 % 앞에 안쓰는 문자를 넣고, ESCAPE 뒤에 '안쓰는문자' 로 작성*
-- *안쓰는 문자: $, \, / 등 문법적으로 중복되지 않는 문자*
``` SQL
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> 금시계	순금 99.99% 함유된 최고급 시계
```
#### 3.5.1.4. OR, IN, =ANY
--※ 아래의의 3가지 유형의 쿼리문은 모두 같은 결과를 반환한다.  
--    하지만, 맨 위의 쿼리문(OR)이 가장 빠르게 처리된다.(정말 얼마 안되지만...)  
--    물론 메모리에 대한 내용이 아니라 CPU에 대한 내용이므로 이 부분까지 감안하여 쿼리문을 구성하게 되는 경우가 많지 않다.  
--    -> <IN> <=ANY>는 위 상황에서 모두 같은 연산 효과를 가져간다. 이를 모두는 내부적으로 <OR> 구조로 변경되어 연산 처리 된다.
``` SQL
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN'
   OR JOB = 'CLOERK';
 
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'CLOERK');
 
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB =ANY ('SALESMAN', 'CLOERK');
```
#### 3.5.1.4. DISTINCT
중복 행(레코드)을 제거하는 함수 --** 디스팅트
### 3.5.2. 하위질의
### 3.5.3. 그룹함수
: GROUP BY 절에 지정된 속성의 값 집계
-- SUM() 합, AVG() 평균, COUNT() 카운트, MAX() 최대값, MIN() 최소값  
-- ,VARIENCE() 분산, STDDEV() 표준편차  
 
--※ 그룹함수의 가장 큰 특징  
--   처리해야 할 데이터들 중 NULL이 존재한다면(포함되어 있다면)  
--   이 NULL은 제외한 상태로 연산을 수행한다는 것이다.  
--   즉, NULL은 연산의 대상에서 제외된다.  
#### 3.5.3.1. SUM() 합
``` SQL
SELECT SAL
FROM EMP;
/*
800
1600
1250
2975
1250
2850
2450
3000
5000
1500
1100
950
3000
1300
*/
 
SELECT SUM(SAL) -- 800 + 1600 + ... + 1300
FROM EMP;
--==>> 29025
 
SELECT COMM
FROM EMP;
/*
(null)
300
500
(null)
1400
(null)
(null)
(null)
(null)
0
(null)
(null)
(null)
(null)
*/
 
SELECT SUM(COMM)    -- NULL + 300 + 500 + NULL + ... + NULL --(X)
FROM EMP;
--==>> 2200
```
#### 3.5.3.2. COUNT() 행(레코드)의 갯수 조회 -> 데이터가 몇 건인지... 확인...
``` SQL
SELECT COUNT(COMM)
FROM EMP;
--==>> 4
 
SELECT COUNT(*)
FROM EMP;
--==>> 14
-- COUNT를 수행할때는 NULL 이 조회에서 빠질 수 있으므로 (*)으로 조회
```
#### 3.5.3.3. AVG() 평균 반환
``` SQL
SELECT AVG(COMM) "COL1"
     , SUM(COMM) / COUNT(COMM) "COL2"
     , 2200 / 4 "COL3"  -- NULL을 제외하고 연산
     , 2200 / 14 "COL4" -- 정답
FROM EMP;
 
--※ 데이터가 NULL인 컬럼의 레코드는 연산 대상에서 제외되기 때문에
-- 주의하여 연산 처리해야 한다.
```
#### 3.5.3.4. VARIANCE() 표준편차 / STDDEV() 분산
-- ※ 표준편차의 제곱이 분산, 분산의 제곱근이 표준편차
``` SQL
SELECT VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>> 1398313.87362637362637362637362637362637	1182.503223516271699458653359613061928508
 
SELECT POWER(STDDEV(SAL),2) "COL1"
     , VARIANCE(SAL) "COL2"
FROM EMP;
--==>> 
/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/
```
#### 3.5.3.5. MAX() 최대값 / MIN() 최소값
-- 오라클에서는 NULL을 가장 큰 값으로 간주한다.  
-- (ORACLE 9I 까지는 NULL을 가장 작은 값으로 간주했었다.)  
-- (MSSQL 은 NULL을 가장 작은 값으로 간주한다.)  
``` SQL
SELECT MAX(SAL) "COL1"
     , MIN(SAL) "COL2"
FROM EMP;
--==>>800
 
--※ 주의
SELECT DEPTNO, SUM(SAL) --** DEPTNO : 14건, SUM(SAL)은 단일건
FROM EMP;
--==>> 에러 발생(ORA-00937: not a single-group group function)

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY 1;
/*
10	8750
20	10875
30	9400
*/
```
#### 3.5.3.6. ROLLUP()
N+1 레벨까지 (하위 -> 상위)
--○ TBL_EMP 테이블을 대상으로 부서별 급여합 조회
--   부서번호, 급여합 항목  조회
``` SQL
SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
/*
10	    8750
20	    10875
30	    9400
(null)	8700     -- 부서번호가 NULL 인 사원들의 급여합
*/
```
``` SQL
SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
	8700  -- 부서번호가 NULL 인 사원들의 급여합
	37725 -- 모든부서 직원들의 급여합
*/
```
#### 3.5.3.7. GROUPING()
``` SQL
SELECT GROUPING(DEPTNO), DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
 
/*
GROUPING(DEPTNO)	부서번호	급여합
0	                    10	    8750
0	                    20	    10875
0	                    30	    9400
0	                (null)	    8700
1	                (null)	    37725
*/
```
#### 3.5.3.8. CUBE() -> ROLLUP() 보다 더 자세한 결과를 반환받는다.
-- ※ ROLLUP()과 CUBE() 는 그룹을 묶어주는 방식이 다르다.(차이)  
-EX.  
   
--ROLLUP(A,B,C)  
-- -> (A,B,C) / (A,B) / (A) / ()  
   
--CUBE(A,B,C)  
-- -> (A,B,C) / (A,B) / (A,C) / (B,C) / (A)/ (B)/ (C) {}  
   
--> 아래의 과정(ROLLUP())은 묶음 방식이 다소 모자랄 때가 있고  
-- 아래의 과정(CUBE())은 묶음 방식이 다지나칠 때가 있기 때문에  
-- 다음과 같은 방식의 쿼리를 더 많이 사용하게 된다.  
-- 다음 작성하는 퀄리는 조회하고 자하는 그룹만  
-- <GROUPING SETS>를 사용하여 선택적으로 묶어줌  
``` SQL
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
/*
DEPTNO	JOB	SUM(SAL)
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (null)	    8750
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400
(null)	ANALYST	    6000    - 모든 부서 ANALYST 직종의 급여합 -- 추가
(null)	CLERK	    4150    - 모든 부서 CLECK 직종의 급여합
(null)	MANAGER	    8275    - 모든 부서 MANAGER 직종의 급여합
(null)	PRESIDENT	5000    - 모든 부서 PRESIDNT 직종의 급여합
(null)	SALESMAN	5600
(null)	(null)	    29025
*/
```
#### 3.5.3.9. 중첩 그룹함수 / 분석함수
--※ 그룹함수는 2 LEVEL 까지 중첩해서 사용할 수 있다.  
-- 함수는 일반적으로 중첩에 대한 제한이 없는데, 그룹함수는 논리적인 특성상 제한되어있음(이것도 오라클만 중첩되고, 나머지는 중첩도 안됨)  
``` SQL
SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
9400
10875
8750
*/
 
SELECT MAX(SUM(SAL)) "COL1"
FROM EMP
GROUP BY DEPTNO;
--==>> 10875
```

### 3.5.4. WINDOW 함수
GROUP BY 절 사용하지 않고 속성값 집계
>- PARTITION BY : 함수 적용범위  
- ORDER BY: PARTITION 안에서 정렬 기준이 되는 속성
#### 3.5.4.1. RANK() -> 등수(순위)를 반환하는 함수
##### 3.5.4.1.1. RANK() - ORDER BY
등수(순위)를 반환하는 함수
``` SQL
SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"   --** 급여 내림차순 기준 등수 매기기
FROM EMP;
--==>>
/*
7839	KING	10	5000	1
7902	FORD	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	4
7698	BLAKE	30	2850	5
7782	CLARK	10	2450	6
*/
```
##### 3.5.4.1.2. RANK() - PARTITION BY
``` SQL
SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP;
/*
7839	KING	10	5000	1	1
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7698	BLAKE	30	2850	1	5
```
#### 3.5.4.2. DENSE_RANK() -> 서열을 반환하는 함수
``` SQL
SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여서열"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "전체급여서열"
FROM EMP
ORDER BY 3,4 DESC;
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	5
7934	MILLER	10	1300	3	8
7902	FORD	20	3000	1	2   -> 1
7788	SCOTT	20	3000	1	2   -> 1
7566	JONES	20	2975	2	3   -> 2
*/
```
##### 3.5.4.1-2.1 RANK() / DENSE_RANK() 이전 사용
-- RANK() / DENSE_RANK()  
--> 오라클 9i부터 적용되었던 함수 (MSSQL은 아마도 2005부터 적용...)  
 
--> 하위 버전에서는 RANK() 나 DENSE_RANK() 를 사용할 수 없기 때문에  
--  이 함수를 활용하지 않는 다른 방법을 찾아야 한다.  
--  예를 들어... 급여 순위를 구하고자 한다면...  
--  해당 사원의 급여보다 더 큰 값이 몇 개인지 확인한 후  
--  확인한 숫자에 『+1』을 추가로 연산해 주면...  
--  그 값이 곧 해당 사원의 등수가 된다.  
``` SQL
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;        -- SMITH 의 급여
--==>> 14               -- SMITH 의 등수
```
#### 3.5.4.3. ROW_NUMBER() -> 공동순위x, 연속
-- 정렬한 ENAME을 기준으로 관찰번호 부여했다.(위의 코드와 다른 부분: SELECT의 ORDER BY)  
 
--※ 게시판의 게시물 번호를 SEQUENCE나 IDENTITY를 사용하게 되면  
--   게시물을 삭제했을 경우... 삭제한 게시물으리 자리에 다음 번호를 가진 게시물이 등록되는 상황이 발생하게 된다.
--   이는... 보안성 측면이나... 미관상 ... 바람직하지 않은 상태일 수 있기 때문에 ROW_NUMBER()의 사용을 고려해 볼 수 있다.  
--   관리의 목적으로 사용할 때에는 SEQUENCE 나 IDENTITY 를 사용하지만,  
--   단순히 게시물을 목록화하여 사용자에게 리스트 형식으로 보여줄 때에는 사용하지 않는 것이 바람직할 수 있다.
 
--   방법1) 중간에 번호가 없는것을 사용자가 알게 된다면(게시물을 삭제하기 때문에)  
--   사용자의 입장에서는 필터링을 많이하는 게시판이라고 생각이 들어 신뢰성이 떨어진다.  
 
--   방법2) 기동력을 앞세우기 위해서 사용자에게 보여지는 게시물 번호가 실제 DB번호로 연동하기도 한다.  

``` SQL
SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "관찰"
    , ENAME "사원명", SAL "급여", HIREDATE "입사일"
FROM EMP;
/*
1	KING	5000	1981-11-17
2	FORD	3000	1981-12-03
3	SCOTT	3000	1987-07-13
4	JONES	2975	1981-04-02
5	BLAKE	2850	1981-05-01
6	CLARK	2450	1981-06-09
7	ALLEN	1600	1981-02-20
8	TURNER	1500	1981-09-08
9	MILLER	1300	1982-01-23
10	WARD	1250	1981-02-22
11	MARTIN	1250	1981-09-28
12	ADAMS	1100	1987-07-13
13	JAMES	 950	1981-12-03
14	SMITH	 800	1980-12-17
*/
 
SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "관찰"
    , ENAME "사원명", SAL "급여", HIREDATE "입사일"
FROM EMP
ORDER BY ENAME;
/*
12	ADAMS	1100	1987-07-13
7	ALLEN	1600	1981-02-20
5	BLAKE	2850	1981-05-01
6	CLARK	2450	1981-06-09
2	FORD	3000	1981-12-03
13	JAMES	 950	1981-12-03
4	JONES	2975	1981-04-02
1	KING	5000	1981-11-17
11	MARTIN	1250	1981-09-28
9	MILLER	1300	1982-01-23
3	SCOTT	3000	1987-07-13
14	SMITH	 800	1980-12-17
8	TURNER	1500	1981-09-08
10	WARD	1250	1981-02-22
*/
-- '관찰'이라고 부여된 번호는 정렬을 바꿔도 고유의 번호처럼 붙어있음을 확인한다.
```
#### 3.5.4.4. SEQUENCE(시퀀스: 주문번호)
--    -> 사전적인 의미: 1. (일련의) 연속적인 사건들 2. (사건, 행동 등의) 순서
``` SQL 
-- ○ 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD   -- 기본적인 시퀀스 생성 구문
START WITH 1                -- 시작값 설정
INCREMENT BY 1              -- 증가값 설정
NOMAXVALUE                  -- 최대값 설정 옵션
NOCACHE;                    -- 캐시 사용 안함 설정 옵션
--==>> Sequence SEQ_BOARD이(가) 생성되었습니다.
```
-- 캐시란, 입장하기 위해 많은 인원이 한꺼번에 들어가려고 하면 들어갈 수 없을 때  
-- 입장권을 뽑아서 입장으로 했을 경우 들어갈 수는 있지만 대기시간이 있을 수 있는데  
-- 한꺼번에 여러장을 뽑아서 나누어주는 것과 같다.  

## 3.6. GROUP BY 절
>-- *GROUP BY와 조건에 데이터 타입 통일*  
-- *GROUP BY 에서 묶어준 방식을 통일(EX. EXTRACT이면, EXTRACT로)*  
-- *단순히 형을 맞춘다고 해서 해결되지 않음*  
``` SQL
SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY')
ORDER BY 1;
--==>> 에러발생: GROUP BY와 SELECT의 형을 맞춰야함
 
SELECT TO_CHAR(HIREDATE, 'YYYY') "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
--==>> 에러발생(ORA-00979: not a GROUP BY expression)
 
SELECT TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY')) "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
--==>> 에러발생(ORA-00979: not a GROUP BY expression)
 
SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0
            THEN TO_CHAR(HIREDATE, 'YYYY')
            ELSE '전체'
        END "입사년도"
    , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY') --> '전체'를 출력해야 하기 때문에 , EXTRACT(YEAR FROM HIREDATE) 사용x
ORDER BY 1;

SELECT ROW_NUMBER() OVER(ORDER BY ENAME) "관찰"
    , ENAME "사원명", SAL "급여", HIREDATE "입사일"
FROM EMP
ORDER BY ENAME;
/*
1	ADAMS	1100	1987-07-13
2	ALLEN	1600	1981-02-20
3	BLAKE	2850	1981-05-01
4	CLARK	2450	1981-06-09
5	FORD	3000	1981-12-03
6	JAMES	 950	1981-12-03
7	JONES	2975	1981-04-02
8	KING	5000	1981-11-17
9	MARTIN	1250	1981-09-28
10	MILLER	1300	1982-01-23
11	SCOTT	3000	1987-07-13
12	SMITH	 800	1980-12-17
13	TURNER	1500	1981-09-08
14	WARD	1250	1981-02-22
*/
```
## 3.7. HAVING
--○ EMP 테이블에서 부서번호가 20, 30인 부서를 대상으로
--   부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다.
``` SQL
-- 방법 1 WHERE 있는 경우
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)    -- OR
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;    -- 그룹에 대한 조건
--==>> 30	9400
-- SELECT 문의 PARSING 순서를 유의하면서 HAVING 사용하기
 
-- 방법 2 WHERE 없는 경우
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000
AND DEPTNO IN (20, 30);
```
-- EMP 테이블 전체를 1차로 메모리에 퍼올림 + 뒷부분 실행 (VS) WHERE절이 있을 경우, 테이블에서 WHERE 절까지 1차로 메모리에 퍼올림 + 뒷부분 실행  
-- 쿼리문의 효율성이 극명하게 다름. 두 번째의 방식으로 쿼리문을 구성하는 것이 바람직함  

## 3.8. ORDER BY
>-- *`ASC`: 오름차순*  
-- *`DESC`: 내림차순*  
>-- *어떤 데이터가 먼저나오고 나중에 나오고는 관계형 데이터베이스에서는 크게 연관이 없음*  
-- *보기 좋으려고 정렬하면 안된다 -> 부하가 많이 걸림*   
-- FROM - WHERE - GROUP BY - HAVING - SELECT - `ORDER BY`
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY DEPTNO ASC;    -- DEPTNO -> 정렬 기준 : 부서번호
                        -- ASC    -> 정렬 유형 : 오름차순(생략가능)
                        -- DESC   -> 정렬 유형 : 내림차순
```
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 연봉 DESC;
--** '연봉'이라는 별칭을 기준으로 정렬가능 -> SELECT 가 ORDER BY보다 앞에 있어서
```
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 2; -- 부서번호 오름차순
--> EMP 테이블이 갖고있는 고유한 컬럼 순서(2->ENAME)가 아니라
--  SELECT 처리 되는 두 번째 컬럼(2->DEPTNO, 부서번호)을 기준으로 정렬
--  ASC는 생략된 상태 -> 오름차순 정렬
--  오라클에서 기본 인덱스는 자바와 달리 1부터 시작
--  최종적으로... 현재 <ORDER BY 2>구문은 -> <ORDER BY DEPTNO ASC>이다.
 
--** 2 -> EMP 의 두번째가 아니라, SELECT의 두번째에 해당
--** 2 -> JAVA는 0번부터 부여했지만, ORACLE은 1번부터 부여됨
```
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여" 
        , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 2, 4;
-- 부서번호, 급여 기준 오름차순 정렬
-- (1차)     (2차)
```
``` SQL
SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 3, 4 DESC;
--**    -----  --
--** 오름차순  내림차순
--① 2      -> DEPTNO(부서번호) 기준 오름차순 정렬 
--② 3      -> JOB(직종)        기준 오름차순 정렬
--③ 4 DESC -> SAL(급여)        기준 내림차순 정렬
```
<BR>
## 3.9. WHERE 절
``` SQL
--○ TBL_EMP 테이블에서 20번 부서에 근무하는 사원들 중 급여가 가장 많은 사원의
--   사원번호, 사원명, 직종명, 급여 항목을 조회하는 쿼리문을 구성한다.
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE DEPTNO = 20 ;
/*
7369	SMITH	CLERK	800
7566	JONES	MANAGER	2975
7788	SCOTT	ANALYST	3000
7876	ADAMS	CLERK	1100
7902	FORD	ANALYST	3000
*/
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE DEPTNO = 20 AND SAL >=ALL (SELECT SAL
                                 FROM TBL_EMP
                                 WHERE DEPTNO = 20);
/*
7902	FORD	ANALYST	3000
7788	SCOTT	ANALYST	3000
*/
```

# 4. 함수
## 4.1. NULL의 처리
### 4.1.1. NVL()
--첫 번째 파라미터 값이 NULL 이면, 두 번째 파라미터 값을 반환한다.  
--첫 번째 파라미터 앖이 NULL 이 아니면, 그 값을 그대로 반환한다.  
``` SQL
SELECT ENAME "사원명", NVL(COMM,1234) "수당"
FROM TBL_EMP;
```
### 4.1.2. NVL2()
--> 첫 번째 파라미터 값이 NULL 이 아닌 경우, 두 번째 파라미터 값을 반환하고
--  첫 번째 파라미터 값이 NULL 인 경우, 세 번째 파리미터 값을 반환한다.
``` SQL
SELECT ENAME "사원명", NVL2(COMM, '청기올려', '백기올려')"수당확인"
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , NVL2(COMM, SAL*12+COMM, SAL*12) "연봉"
FROM TBL_EMP;
```
### 4.1.3. COALESCE()
--> 매개변수 제한이 없는 형태로 인지하고 활용한다.  
--  맨 앞에 있는 매개변수부터 차례로 NULL 인지 아닌지 확인하여  
--  NULL 이 아닌 경우 그 값을 반환하고, NULL 인 경우에는 그 다음 매개변수의 값을 반환한다.  
--  NVL()이나 NVL2() 와 비교했을 때 모~~~~ 든 경우의 수를 고려할 수 있다는 특징을 갖는다.  
``` SQL
SELECT NULL"COL1"
    , COALESCE(NULL, NULL, NULL, 40) "COL2"
FROM DUAL;
--==>> 	40

SELECT EMPNO, ENAME, SAL, COMMM
    ,COALESCE(SAL*12_COMM, SAL+12, COMM, 0) "연봉"
FROM TBL_EMP;
```
## 4.2. 대소문자 변환(UPPER(), LOWER(), INITCAP)
--UPPER() 는 모두 대문자로 변환  
--LOWER() 는 모두 소문자로 변환  
--INITCAP() 은 첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 반환  
``` SQL
SELECT 'oRaCLe' "COL1"
    , UPPER('oRaCLe') "COL2"
    , LOWER('oRaCLe') "COL3"
    , INITCAP('oRaCLe') "COL3"
FROM DUAL;
--==>>oRaCLe	ORACLE	oracle	Oracle
```
## 4.3. 사이값 구하기(BETWEEN ⓐ AND ⓑ)
--※ <BTWEEN ⓐ AND ⓑ>는 날짜형, 숫자형, 문자형 데이터에 모두 적용된다.
--    단, 문자형이 경우 아스키코드 순서를 다르기 때문에(사전식 배열)  
--    대문자가 앞쪽에 위치하고, 소문자가 뒤 쪽에 위치한다.  
--    또한, <BTWEEN ⓐ AND ⓑ>는 해당 구문이 수행되는 시점에서  
--    오를 내부적으로는 부등호 연산자의 형태로 바뀌어 연산 처리한다.
### 4.3.1. 날짜형 사이값
``` SQL
--○ BETWEEN ⓐ AND ⓑ
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02','YYYY-MM-DD')
                   AND TO_DATE('1981-09-28','YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	1981-05-01
CLARK	MANAGER	1981-06-09
TURNER	SALESMAN	1981-09-08
*/
-----------●------------------●-------------
--        1981.4.2            1921.9.28
```
### 4.3.2. 숫자형 사이값
--○ TBL_EMP 테이블에서 급여(SAL)가 2450 에서 3000 까지의 직원들을 모두 조회한다.
``` SQL
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2450 AND 3000;
--==>>
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7902	FORD	ANALYST	7566	1981-12-03	3000		20
*/
-----------●------------------●-------------
--        2450                3000
```
### 4.3.3. 문자형 사이값
--○ TBL_EMP 테이블에서 직원들의 이름이 'C'로 시작하는 이름부터 'S'로 시작하는 이름인 경우 모든 항목을 조회한다.
``` SQL
SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
-----------●------------------○-------------    --** 사전식 배열 기준('S'로만 이름이 있다면 검색됨)
--        'C'                 'S'
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7839	KING	PRESIDENT		1981-11-17	5000		10
7900	JAMES	CLERK	7698	1981-12-03	950		30
7902	FORD	ANALYST	7566	1981-12-03	3000		20
7934	MILLER	CLERK	7782	1982-01-23	1300		10
*/
```
## 4.4. 날짜 관련
--※ 날짜 연산의 기본 단위는 일수(DAY)이다~!!! CHECK~!!!
``` SQL
SELECT SYSDATE "COL1"       -- 2023-10-20 15:40:02
     , SYSDATE + 1 "COL2"   -- 2023-10-21 15:40:02
     , SYSDATE - 2 "COL3"   -- 2023-10-18 15:40:02	
     , SYSDATE + 30 "COL4"  -- 2023-11-19 15:40:02
FROM DUAL;
```
--○ 시간 단위 연산
``` SQL
SELECT SYSDATE "COL1"           -- 2023-10-20 15:45:15
     , SYSDATE + 1/24 "COL2"    -- 2023-10-20 16:45:15
     , SYSDATE - 1/24 "COL3"    -- 2023-10-20 14:45:15
FROM DUAL;
--** 1/24 -> 1시간
```
## 4.5. 결합
### 4.5.1. 컬럼과 컬럼의 연결(결합)
>-- *`,` 를 사용하거나 `||` 를 사용*  
>--※ 오라클에서는 문자 타입의 형태로 형(TYPE)을 반환하는 별도의 과정 없이  
--    『||』 만 삽입해 주면 간단히 컬럽과 컬럽(서로 다른 종류의 데이터)을 결합하는 것이 가능하다.  
--    cf) MSSQL 에서는 모든 데이터를 문자열로 CONVERT 해야 한다. 
``` SQL
SELECT 1+2
FROM DUAL;
-- *온전히 결합이라고 보기 어려움, 하나의 컬럼에 연산을 넣은 것*
 
SELECT '김둘리', '박또치'
FROM DUAL;
 
SELECT '김둘리' + '박또치'
FROM DUAL;
--=>> 에러발생(ORA-01722: invalid number)
 
SELECT '김둘리' || '박또치'
FROM DUAL;
--==>> 김둘리박또치
 
SELECT ENAME, JOB
FROM TBL_EMP;
 
SELECT ENAME || JOB
FROM TBL_EMP;
--==>>
/*
SMITHCLERK
박또치SALSESMAN
*/
```
### 4.5.2. 특수문자 출력
>--※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)  
--    홑따옴표 두 개각 홑따옴표 하나(어퍼스트로피)를 의미한다.  
--    홑따옴표 하나(<'>)는 문자열의 시작을 나타내고,  
--    홑따옴표 두개(<''>)는 문자열 영역 안에서 어퍼스트로피를 나타내며  
--    다시 마지막에 등장하는 홑따옴표 하나(<'>)는 문자열 영역의 종료를 의미하게 되는 것이다.
### 4.5.3. 문자열 결합 (CONCAT)
--○ CONCAT() : 문자열 기반으로 데이터 결합을 수행하는 함수. 오로지 2개의 문자열만 결합시킬 수 있다.
``` SQL
SELECT ENAME || JOB "COL1"
    ,CONCAT(ENAME, JOB) "COL2"
FROM EMP;
/*
SMITHCLERK	SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
*/
```
--> 내부적으로 형 변환이 일어나며 결합을 수행하게 된다.  
--  CONCAT() 은 문자열과 문자열을 결합시켜주는 함수이지만  
--  내부적으로 숫자나 날짜를 문자로 변환해주는 과정이 포함되어 있다.  
``` SQL
SELECT '서로' || '배려하며' || '지내자' "COL1"
    , CONCAT('서로','배려하며','지내자') "COL2"
FROM DUAL;
--==>> 에러발생 (ORA-00909: invalid number of arguments)

SELECT ENAME || JOB || EMPNO
    ,CONCAT(ENAME,CONCAT(JOB, EMPNO))
FROM EMP;
--==>>
/*
SMITHCLERK7369	SMITHCLERK7369
ALLENSALESMAN7499	ALLENSALESMAN7499
*/
```
### 4.5.4. 문자열 추출 (SUBSTR())
```
obj.substring()
----
문자열 -> 문자열.substring(n, m)
                          ------
                          문자열의 n 부터 n-1 까지... (인덱스는 0 부터)
```
#### 4.5.4.1. SUBSTR() 개수기반 / SUBSTRB() 바이트 기반
>-- *바이트 기반인 경우 조심해서 사용해야함 -> UTF-8 에서 문자가 끊겨 잘려서 문제가 생길 수 있음*
--> 문자열을 추출하는 기능을 가진 함수  
--  첫 번째 파라미터 값은 대상 문자열(추출의 대상, TARGET)  
--  두 번째 파라미터 값은 추출을 시작하는 위치(인덱스, START) -> 인덱스는 1부터 시작...  
--  세 번째 파라미터 값은 추출할 문자열의 갯수(갯수, COUNT)   -> 생략시.. 문자열 길이 끝까지...  
``` SQL
SELECT ENAME "COL1"
      ,SUBSTR(ENAME, 1, 2) "COL2"
FROM EMP;
/*
SMITH	SM
ALLEN	AL
*/
```
#### 4.5.4.2. ○ LENGTH() 글자 수 / LENGTHB() 바이트 수
``` SQL
SELECT ENAME "COL1"
     , LENGTH(ENAME) "COL2"
     , LENGTHB(ENAME) "COL3"
FROM EMP;
/*
SMITH	5	5
*/
```
### 4.5.5. 문자열 찾기 (SUBSTR())
--> 첫 번째 파라미터 값에 해당하는 문자열에서... (대상 문자열, TARGET)  
--  두 번째 파리미터 값을 통해 넘겨준 문자열이 등장하는 위치를 찾아라~!!!  
--  세 번째 파라미터 값은 찾기 시작하는 (스캔을 시작하는) 위치  
--  네 번째 파라미터 값은 몇 번째 등장하는 값을 찾을 것인지에 대한 설정 -> (1일 경우 생략 가능)  
--> 마지막 파라미터 값으 생략한 형태로 사용 -> 마지막 파라미터 -> 1
``` SQL
SELECT 'ORACLE ORAHOME BIORA' "COL1"
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "COL2"   -- 1
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "COL3"   -- 8
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "COL4"   -- 8
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2)    "COL5"   -- 8
      , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 3) "COL6"   -- 0
FROM DUAL;
--==>> ORACLE ORAHOME BIORA	1	8	8	8	0
```
### 4.5.6. 문자열 바꾸기 (REVERSE())
-- 대상 문자열을 거꾸로 반환한다. (단, 한글은 제외 - 사용 불가)
``` SQL
SELECT 'ORACLE' "COL1"
      , REVERSE('ORACLE') "COL2"
      , REVERSE('오라클') "COL3"
FROM DUAL;
--==>> ORACLE	ELCARO	???
```
### 4.5.7. 문자열 채우기
#### 4.5.7.1. 왼쪽부터 문자열로 채우기 (LPAD())
--> Byte 를 확보하여 왼쪽부터 문자열로 채우는 기능을 가진 함수
``` SQL
SELECT 'ORACLE' "COL1"
    , LPAD('ORACLE',10,'*') "COL2"
FROM DUAL;
--> ① 10Bype 공간을 확보 한다.                 -> 두 번째 파라미터 값에 의해
--  ② 확보한 공간에 'OREACLE' 문자열을 담는다  -> 첫 번째 파라미터 값에 의해
--  ③ 남아있는 Byte 공간을 왼쪽부터 세 번째 파라미터 값으로 채운다.
--  ④ 이렇게 구성된 최종 결과값을 반환한다.
--==>> ORACLE	****ORACLE
```
#### 4.5.7.2. 오른쪽부터 문자열로 채우기 (RPAD())
--> Byte 를 확보하여 오른쪽부터 문자열로 채우는 기능을 가진 함수
``` SQL
SELECT 'ORACLE' "COL1"
    , RPAD('ORACLE',10,'*') "COL2"
FROM DUAL;
--==>>ORACLE	ORACLE****
```
### 4.5.8. 문자열 특정문자 확인해 가져오기, 지우기 (LTRIN()) 
``` SQL
SELECT 'ORAORAORAORACLEORACLE' "COL1"   -- 오라 오라 오라 오라클 오라클
      , LTRIM('ORAORAORAORACLEORACLE', 'ORA') "COL2" 
      , LTRIM('AAAAAAAAAORACLEORACLE', 'ORA') "COL3"
      , LTRIM('ORAORAORAoRACLEORACLE', 'ORA') "COL4" 
      , LTRIM('ORAORA ORAORACLEORACLE', 'ORA')"COL5" -- 왼쪽 공백 제거
      , LTRIM('                ORACLE', ' ')  "COL6" -- 두 번째 파라미터 생략
      , LTRIM('                ORACLE') "COL7" 
FROM DUAL;
--==>> 
/*
ORAORAORAORACLEORACLE	
CLEORACLE	
CLEORACLE	
oRACLEORACLE	 
ORAORACLEORACLE	
ORACLE	
ORACLE
*/
--**O 확인 'ORA'에 문자존재 O -> 삭제
--**R 확인 'ORA'에 문자존재 O -> 삭제
--**A 확인 'ORA'에 문자존재 O -> 삭제
--              :
--**C 확인 'ORA'에 문자존재 X -> 미삭제, 끝
```
``` SQL
SELECT LTRIM('김이신이김김이이신김김김이김이김박이김신', '김신이') "COL1"
FROM DUAL;
--==>> 박이김신
```
### 4.5.9. 공백제거 (TRIM())
``` SQL
SELECT TRIM('          TEST           ') "COL1"
    , LTRIM('          TEST           ') "COL2"
    , RTRIM('          TEST           ') "COL3"
FROM DUAL;
--==>> TEST	TEST           	          TEST
```
### 4.5.10. 문자열 비 완성형 처리 (TRANSLATE())
--> 첫번째 파라미터 값에 해당하는 문자열을 대상으로  
--  왼쪽부터 **연속적으로 등장**하는 두 번째 파라미터 값에서 지정한 글자와  
--  같은 글자가 등장할 경우 이를 제거한 결과값을 반환한다. **제거 후 남은 결과값 반환**  
--  단, 완성형으로 처리되지 않는다. **하나씩 하나씩 처리함**
``` SQL
--> 1 : 1로 바꿔준다,
SELECT TRANSLATE('MY ORACLE SERVER'
                ,'ABCDEFGHIJKLMNOPQRSTUVWZYZ'
                ,'abcdefghijklmnopqrstuvwzyz') "COL1"
FROM DUAL;
--==>> my oracle server
--** 첫번째 파라미터 값 M
--   -> 두번째 파라미터에서 M 찾기
--   -> 세번째 파라미터에서 같은 위치에 해당하는 m으로 변환
 
SELECT TRANSLATE('010-9322-9643'
                , '0123456789'
                , '공일이삼사오육칠팔구') "COL1"
FROM DUAL;
--==>> 공일공-구삼이이-구육사삼
```
### 4.5.11. 바꾸기 (REPLACE())
``` SQL
SELECT REPLACE('MY ORACLE SERVER ORAHOME', 'ORA', '오라') "COL1"
FROM DUAL;
--==>> MY 오라CLE SERVER 오라HOME
```

### 4.5.12. 수학함수
#### 4.5.12.1. 반올림 (ROUND())
``` SQL
SELECT 48.678 "COL1"            -- 48.678
     , ROUND(48.678, 2) "COL2"  -- 48.68     -- 소수점 이하 둘째자리까지 표현 -> 두번째 파라미터
     --** 소수점이하 둘째자리까지 나타내라X
     --** 소수점이하 둘째자리까지 표현해라O
     , ROUND(48.674,2) "COL3"   -- 48.67
     , ROUND(48.674,1) "COL4"   -- 48.7
     , ROUND(48.684,0) "COL5"   -- 49
     , ROUND(48.684)   "COL6"   -- 49         -- 정수까지만 보여달라는 0 생략가능
     , ROUND(48.684,-1)"COL7"   -- 50
     , ROUND(48.684,-2)"COL8"   -- 0
     , ROUND(48.684,-3)"COL9"   -- 0
FROM DUAL;
--==>> 48.678	48.68	48.67	48.7	49
```
#### 4.5.12.2. 절삭 (TRUNC())
``` SQL
SELECT 48.678 "COL1"            -- 48.678
     , TRUNC(48.678, 2) "COL2"  -- 48.67     -- 소수점 이하 둘째자리까지 표현 -> 두번째 파라미터
     , TRUNC(48.674,2) "COL3"   -- 48.67
     , TRUNC(48.674,1) "COL4"   -- 48.6
     , TRUNC(48.684,0) "COL5"   -- 48
     , TRUNC(48.684)   "COL6"   -- 48         -- 정수까지만 보여달라는 0 생략가능
     , TRUNC(48.684,-1)"COL7"   -- 40
     , TRUNC(48.684,-2)"COL8"   -- 0
     , TRUNC(48.684,-3)"COL9"   -- 0
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0
```
#### 4.5.12.3. 나머지를 반환 (MOB())  -> %
``` SQL
SELECT MOD(5,2) "COL1"
FROM DUAL;
--==>> 1
```
#### 4.5.12.4. 제곱의 결과 반환 (POWER())
``` SQL
SELECT POWER(5,3) "COL1"
FROM DUAL;
--==>> 125
--> 5의 3승 결과값으로 반환
```
#### 4.5.12.5. 루트 결과값 (SQRT())
``` SQL
SELECT SQRT(2) "COL1"
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
```
#### 4.5.12.6. 로그 함수 (LOG())
``` SQL
SELECT LOG(10, 100) "COL1"
      , LOG(10, 20) 
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677
```
#### 4.5.12.7. 자연 로그 (LN())
``` SQL
SELECT LN(95) "COL1"
FROM DUAL;
--==>> 4.55387689160054083460978676511404117675
```
#### 4.5.12.8. 삼각함수
``` SQL
--○ 삼각함수
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
----==>> 0.8414709848078965066525023216302989996233	
--       0.5403023058681397174009366074429766037354	
--       1.55740772465490223050697480745836017308
 
-->> 각각 싸인, 코싸인, 탄젠트 결과값을 반환한다.
 
--○ 삼각함수의 역함수(범위: -1 ~ 1)
SELECT SIN(0.5), COS(0.5), TAN(0.5)
FROM DUAL;
----==>> 
/*
0.4794255386042030002732879352155713880819	
0.8775825618903727161162815826038296520119	
0.5463024898437905132551794657802853832851
*/
```
#### 4.5.12.9. 서명, 부호, 특징 (SIGN())
--> 연산 결과값이 양수이면 1, 0이면 0, 음수이면 -1을 반환한다.  
--> 매출이나 수지에 관련하여 적자 및 흑자의 개념을 가질 때 종종 사용된다.
``` SQL
SELECT SIGN(5-2) "COL1"
    , SIGN(5-5) "COL2"
    , SIGN(5-6) "COL3"
FROM DUAL;
--==>> 1	0	-1
```
#### 4.5.12.10. 아스키코드 값 (ASCII() ↔ CHR()/ -> 서로 대응(상응)하는 함수)
``` SQL
SELECT ASCII('A') "COL1"
       , CHR(65) "COL2"
FROM DUAL;
--==>> 65	A
-- <ASCIII()> : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
-- <CHR()>    : 매개변수로 넘겨받은 아스키코드 값으로 해당 문자를 반환한다.
```
### 4.5.13. 날짜함수
#### 4.5.13.1. 날짜타입으로 변환 (TO_DATE)
--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 수행하는 과정에서 내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다.
``` SQL
--○ 날짜 - 날짜 -> 일수
SELECT TO_DATE('2024-03-19','YYYY-MM-DD') - TO_DATE('2023-08-22', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 210
 
--○ 데이터 타입의 변환
SELECT TO_DATE('2023-10-20', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 2023-10-20 00:00:00
 
SELECT TO_DATE('2023-10-32', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러발생
--        (ORA-01847: day of month must be between 1 and last day of month)
 
SELECT TO_DATE('2023-02-29', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러 발생(ORA-01839: date not valid for month specified)
 
SELECT TO_DATE('2023-13-20', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러 발생()
```
#### 4.5.13.1. 개월 수를 더하거나 빼기 (ADD_MONTHS())
``` SQL
SELECT SYSDATE "COL1"
    , ADD_MONTHS(SYSDATE, 2) "COL2"
    , ADD_MONTHS(SYSDATE, 3) "COL3"
    , ADD_MONTHS(SYSDATE, -2) "COL4"
    , ADD_MONTHS(SYSDATE, -3) "COL5"
FROM DUAL;
--==>> 
/*
2023-10-20 16:19:46 -> 현재	
2023-12-20 16:19:46	-> 2개월 후
2024-01-20 16:19:46	-> 3개월 후
2023-08-20 16:19:46	-> 2개월 전
2023-07-20 16:19:46 -> 3개월 전
*/
```
#### 4.5.13.2. 첫번째 인자에서 두 번째 인자값 뺀 개월수 (MONTHS_BETWEEN())
--> 첫 번째 인자값에서 두 번째 인자값을 뺀 개월수를 반환한다.
``` SQL
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31','YYYY-MM-DD')) "COL1"
FROM DUAL;
--==> 256.667209901433691756272401433691756272
 
--> 개월 수의 차이를 반환하는 함수
--  결과값의 부호가 <->(음수)로 반환되었을 경우에는
--  첫 번째 인자값에 해당하는 날짜보다
--  두 번째 인자값에 해당하는 날짜가 <미래>라는 의미로 확인할 수 있다.
```
#### 4.5.13.3. 가까운 요일의 날 (NEXT_DAY())
``` SQL
SELECT NEXT_DAY(SYSDATE, '토') "COL1"
    , NEXT_DAY(SYSDATE, '월') "COL2"
FROM DUAL;
--==>> 2023-10-21 16:25:45	2023-10-22 16:25:45
```
#### 4.5.13.4. 마지막 날 (LAST_DAY())
--> 해당 날짜가 포함되어 있는 그달의 마지막 날을 반환한다.
``` SQL
SELECT SYSDATE "COL1"                                       -- 2023-10-20
    , LAST_DAY(SYSDATE) "COL2"                              -- 2023-10-31
    , LAST_DAY(TO_DATE('2023-02-12', 'YYYY-MM-DD')) "COL3"  -- 2023-02-28
    , LAST_DAY(TO_DATE('2020-02-12', 'YYYY-MM-DD')) "COL3"  -- 2020-02-29
FROM DUAL;
```
#### 4.5.13.5. 날짜 반올림 (ROUND())
--※ 날짜 데이터를 대사으로 반올림, 절삭 등의 연산을 수행할 수 있다.
``` SQL
--○ 날짜 반올림
SELECT SYSDATE "COL1"                   -- 2023-10-23 -> 기본 현재 날짜
     , ROUND(SYSDATE, 'YEAR') "COL2"    -- 2024-01-01 -> 년도까지 유효한 데이터 (상반기/하반기 기준)
     , ROUND(SYSDATE, 'MONTH') "COL3"   -- 2023-11-01 -> 월까지 유효한 데이터 (15일 기준)
     , ROUND(SYSDATE, 'DD') "COL4"      -- 2023-10-23 -> 일까지 유효한 데이터 (정오 기준)
     , ROUND(SYSDATE, 'DAY') "COL5"     -- 2023-10-22 -> 일까지 유효한 데이터 (수요일 정오 기준)
FROM DUAL;
```
#### 4.5.13.5. 날짜 반올림 (TRUNC())
``` SQL
--○ 날짜 절삭
SELECT SYSDATE "COL1"                   -- 2023-10-23 -> 기본 현재 날짜
     , TRUNC(SYSDATE, 'YEAR') "COL2"    -- 2023-01-01 -> 년도까지 유효한 데이터
     , TRUNC(SYSDATE, 'MONTH') "COL3"   -- 2023-10-01 -> 월까지 유효한 데이터
     , TRUNC(SYSDATE, 'DD') "COL4"      -- 2023-10-23 -> 일까지 유효한 데이터
     , TRUNC(SYSDATE, 'DAY') "COL5"     -- 2023-10-22 -> 그 전 주에 해당하는 일요일
FROM DUAL;
```
### 4.5.14. 변환 함수
-- TO_CHAR()    : 숫자나 날짜 데이터를 문자 타입으로 변환시켜주는 함수  
-- TO_DATE()    : 문자 데이터를 날짜 타입으로 변환시켜주는 함수  
-- TO_NUMBER()  : 문자 데이터를 숫자 타입으로 변환시켜주는 함수  
#### 4.5.14.1. 날짜형 -> 문자형
##### 4.5.14.1.1. TO_CHAR()
--** 문자타입: 좌측정렬  
--** 숫자타입: 우측정렬  
``` SQL
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"    -- 2023-10-23
     , TO_CHAR(SYSDATE, 'YYYY') "COL2"          -- 2023     --** 2023이라는 문자타입
     , TO_CHAR(SYSDATE, 'YEAR') "COL3"          -- TWENTY TWENTY-THREE
     , TO_CHAR(SYSDATE, 'MM') "COL4"            -- 10       --** 10이라는 문자타입
     , TO_CHAR(SYSDATE, 'MONTH') "COL5"         -- 10월
     , TO_CHAR(SYSDATE, 'MON') "COL6"           -- 10월
     , TO_CHAR(SYSDATE, 'DD') "COL7"            -- 23
     , TO_CHAR(SYSDATE, 'MM-DD') "COL8"         -- 10-23
     , TO_CHAR(SYSDATE, 'DAY') "COL9"           -- 월요일
     , TO_CHAR(SYSDATE, 'DY') "COL10"           -- 월
     , TO_CHAR(SYSDATE, 'HH24') "COL11"         -- 10         --** 오후 10시라면, 20으로 결과나옴
     , TO_CHAR(SYSDATE, 'HH') "COL12"           -- 10
     , TO_CHAR(SYSDATE, 'HH AM') "COL13"        -- 10 오전    --** 현재가 오전이면 오전
     , TO_CHAR(SYSDATE, 'HH PM') "COL14"        -- 10 오전    --** 현재가 오후이면 오후
     , TO_CHAR(SYSDATE, 'MI') "COL15"           -- 31
     , TO_CHAR(SYSDATE, 'SS') "COL16"           -- 20
     , TO_CHAR(SYSDATE, 'SSSSS') "COL17"        -- 37880      --** 00시부터 흘러온 전체 초
     , TO_CHAR(SYSDATE, 'Q') "COL18"            -- 4          --** 분기(123/456/789/101112)
FROM DUAL;
 
SELECT 10 "COL1"
     , '10' "COL2"
FROM DUAL;
--==>> 
/*
--** COL1 : 숫자, 좌측 정렬
--** COL2 : 문자, 우측 정렬
COL1    COL2
-----   -----
   10	10
*/
```
##### 4.5.14.1.2. EXTRACT()
``` SQL
--○ EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "COL1"      -- 2023 -> 연도를 추출하여 문자타입으로...
     , TO_CHAR(SYSDATE, 'MM') "COL2"        -- 10   -> 월을..
     , TO_CHAR(SYSDATE, 'DD') "COL3"        -- 23   -> 일을..
     , EXTRACT(YEAR FROM SYSDATE) "COL4"    -- 2023 -> 연도를..
     , EXTRACT(MONTH FROM SYSDATE) "COL5"   -- 10   -> 월을..
     , EXTRACT(DAY FROM SYSDATE) "COL5"     -- 23   -> 일을..
FROM DUAL;
--==>> 2023	10	23	2023	10	23
-->> 년, 월, 일 이외의 다른 항목은 불가~!!!
```
##### 4.5.14.1.3. TO_CHAR() -> 형식 맞춤 표기 결과값 반환
--○ TO_CHAR() 활용 -> 형식 맞춤 표기 결과값 반환
``` SQL
SELECT 60000 "COL1"                     -- 60000
     , TO_CHAR(60000, '99,999') "COL2"  -- 60,000 -- 첫번째 파라미터값: 대상, 두번째 파라미터값: 형식
     , TO_CHAR(60000, '$99,999') "COL3" -- $60,000
     , TO_CHAR(60000, 'L99,999') "COL4" -- ￦60,000 -- 원(￦) 
     --**나라마다 통화가 다르기 때문에 영역을 잡아둔 것이지, 숫자라서 오른쪽 정렬이 아님
    , LTRIM(TO_CHAR(60000, 'L99,999')) "COL4" -- ￦60,000 -- 원(￦) 
     --**왼쪽 공백 제거
FROM DUAL;
--==>> 60000	 60,000	 $60,000	        ￦60,000	￦60,000
```
##### 4.5.14.1.4. TO_YMINTERNAL(), TO_DSINTERVAL() --** YM 년~월까지, DS 날짜~초까지
--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분초 후를 조회한다.
--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분초 후를 조회한다.
``` SQL
SELECT SYSDATE "현재시간"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "연산결과"
FROM DUAL;
--==>> 2023-10-23 11:22:25	
--     2024-12-26 15:27:31
```
#### 4.5.14.1. 숫자형 -> 문자형
``` SQL
SELECT 7 "COL1"
     , '7' "COL2"
     , TO_CHAR(7) "COL3"
FROM DUAL;
--==>> 7	7	7
--> 조회 결과가 좌측 정렬인지 우측 정렬인지 확인~!!!

SELECT '4' "COL1"
     , TO_NUMBER(4) "COL2"
     , 4 "COL3"
     , TO_CHAR('4') "COL4"
     , TO_NUMBER('04') "COL5"
FROM DUAL;
--==>> 4	4	4	4	4
--> 조회 결과가 좌측 정렬인지 우측 정렬인지 확인~!!!
```
## 4.6. 조건문, 분기문
### 4.6.1. CASE 구문
> /* `CASE` `WHEN` `THEN` `ELSE` `END` */
``` SQL
--** 상황자체를 분기로 처리
SELECT CASE 3+3 WHEN 2 THEN '3+3=2'
                WHEN 3 THEN '3+3=3'
                WHEN 4 THEN '3+3=4'
                ELSE '몰라'
       END
FROM DUAL;
--==>> 몰라
```
``` SQL
SELECT CASE WHEN 5+2=4 THEN '5+2=4' 
            WHEN 6-1=3 THEN '6-1=3'
            WHEN 7+0=7 THEN '7+0=0'
            ELSE '몰라' 
       END
FROM DUAL;
--==>> 7+0=0
```
### 4.6.2. DECODE()
``` SQL
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2는 몰라요') "확인"
FROM DUAL;
--==>> 5-3=3
--** 5-2를 1과 비교해서 맞으면 '5-2=1'
--         2와 비교해서 맞으면 '5-2=2'
--         3과 비교해서 맞으면 '5-2=3'
```
### 4.6.3.

<BR>

# 5. 서브쿼리
## 5.1. INLINE VIEW
서브쿼리가 FROM 절에서 안에서 사용되는 경우, 해당 서브쿼리를 '인라인뷰'라고 한다. FROM 절에서 사용된 서브쿼리의 결과가 하나의 테이블에 대한 뷰(View)처럼 사용된다.
``` SQL
SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
     , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "전체연봉순위"
FROM EMP
WHERE 전체연봉순위 1등부터 5등까지;
 
SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
     , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "전체연봉순위"
FROM EMP
WHERE RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) <= 5;
--==>> 에러발생(ORA-30483: window  functions are not allowed here)
 
--※ 위의 내용은 RANK() OVER() 함수를 WHERE 조건절에서 사용한 경우이며...
--   이 함수는 WHERE 조건절에서 사용할 수 없기 때문에 발생하는 에러이다.
--   이 경우, 우리는 INLINE VIEW 를 활용해서 풀이해야 한다.
 
SELECT T.*
FROM
(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
         , RANK() OVER(ORDER BY (SAL+12+NVL(COMM,0)) DESC) "전체연봉순위"
    FROM EMP
) T
WHERE T."전체연봉순위" <= 5;
```
## 5.2. 서브 상관 쿼리(=상관 서브 쿼리)
-- 프롬절에 내부쿼리가 들어있는것 = 서브쿼리
 
-- 메인 쿼리가 있는 테이블의 컬럼이
-- 서브 쿼리의 조건절(WHERE절, HAVING절)에 사용되는 경우
-- 우리는 이 쿼리문을 서브 상관 쿼리(상관 서브 쿼리)라고 부른다.
``` SQL
SELECT ENAME "사원명", SAL "급여", 1 "급여등수"
FROM EMP;
 
SELECT ENAME "사원명", SAL "급여", (1) "급여등수"
FROM EMP;
 
SELECT ENAME "사원명", SAL "급여", (SELECT COUNT(*) + 1
                                    FROM EMP
                                    WHERE SAL > 1600;) "급여등수"
FROM EMP;
 
SELECT E.ENAME "사원명", E.SAL "급여", (SELECT COUNT(*) + 1
                                        FROM EMP
                                        WHERE SAL > E.SAL) "급여등수"
```

<BR>

# 6. JOIN
2개의 릴레이션에서 연관된 튜플을 결합해 하나의 새로운 릴레이션을 반환
>-- *조인의 사전적 뜻: 합치다, 결합하다*   
-- *92 코드: 92년에 확정되어서 쓰자한 코드*  
-- *99 코드: 99년에 확정되어서 쓰자한 코드*  
 
>-- *======================================================*  
-- * 결론: 실무에서 모두 쓰이기 때문에... 둘다 알아야 함*  
-- *======================================================*  
## 6.1. SQL 1992 CODE
### 6.1.1. CROSS JOIN
--** 모든 결합 유형이 다 들어있는 코드  
--> 수학에서 말하는 데카르트 곱(CATERSIAN PRODUCT)  
``` SQL
SELECT *
FROM EMP, DEPT;     -- EMP 테이블과, DEPT 테이블을 퍼올려라
/*EX)
EMPNO	ENAME	JOB	MGR	HIREDATE	SAL	COMM	DEPTNO	DEPTNO_1	DNAME	LOC  
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	10	ACCOUNTING	NEW YORK
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	20	RESEARCH	DALLAS
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	30	SALES	CHICAGO
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	40	OPERATIONS	BOSTON*/
--==>> SMITH가 여러가지와 결합해서 보여짐
```
### 6.1.2. EQUI JOIN ( = INNER JOIN)
서로 정확하게 일치하는 데이터들 끼리 연결하여 결합시키는 결합 방법
``` SQL
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
/*
7782	CLARK	MANAGER	    7839	1981-06-09 00:00:00	2450	(null)	10	10	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT	(null)	1981-11-17 00:00:00	5000	(null)	10	10	ACCOUNTING	NEW YORK
... 중략 ...
*/
 
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>>
/*
7782	CLARK	MANAGER	7839	1981-06-09 00:00:00	2450		10	10	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT		1981-11-17 00:00:00	5000		10	10	ACCOUNTING	NEW YORK
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10	10	ACCOUNTING	NEW YORK
... 중략 ...
*/
```
### 6.1.2. EQUI JOIN 시 (+)를 활용한 결합 방법 (= OUTER JOIN)
``` SQL
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 총 14건의 데이터가 결합되어 조화된 상황
-- 즉, 부서번호를 갖지 못한 사원들(5) 모두 누락
-- 또한, 소속 사원을 갖지 못한 부서(2) 모두 누락
 
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--> 총 19 거의 데이터가 결합되어 조회된 상황
-- 소속 사원을 갖지 못한 부서(2) 누락 -------------------------(+)
-- 부서번호를 갖지 못한 사원들(5) 모두 조회
/*
7934	MILLER	CLERK	    7782	1982-01-23 00:00:00	1300		10	10	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT		1981-11-17 00:00:00	5000		10	10	ACCOUNTING	NEW YORK
7782	CLARK	MANAGER	7839	1981-06-09 00:00:00	2450		10	10	ACCOUNTING	NEW YORK
... 중략 ...
8007	박나영	SALESMAN	7698	2023-10-24 14:47:30	1000					
8006	정현욱	SALESMAN	7698	2023-10-24 14:47:30	2500					
8003	김민지	SALESMAN	7698	2023-10-24 14:47:30	1700					
8002	임하성	CLERK	7566	2023-10-24 14:47:30	2000	10				
8001	이윤수	CLERK	7566	2023-10-24 14:47:30	1500	10				
*/
 
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--> 총 16 건의 데이터가 결합되어 조회된 상황
-- 소속 사원을 갖지 못한 부서(2) 모두 조회
-- 부서번호를 갖지 못한 사원들(5) 누락 -------------------------(+)
 
--※ <(+)> 가 없는 쪽 테이블의 데이터를 모두 메모리에 적재한 후             -- 기준
--   <(+)> 가 있는 쪽 테이블의 데이터를 하나하나 확인하여 결합시키는 형태로 -- 추가(첨가)
--   JOIN 이 이루어진다.
 
/*
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20	20	RESEARCH	DALLAS
7499	ALLEN	SALESMAN	7698	1981-02-20 00:00:00	1600	300	30	30	SALES	CHICAGO
... 중략 ...
								50	개발부	서울
								40	OPERATIONS	BOSTON
*/
 
--이와 같은 이유로...
SELECT *
FROM TBL_EMP E, TBL_DEPT D
FROM E.DEPTNO(+) = D.DEPTNO(+);
-- 이런식의 JOIN은 존재하지 않는다.
```
### 6.1.3. NON EQUI JOIN
범위 안에 적합한 것들끼리 연결시키는 결합 방법
>-- *정확하게 일치하는 조건으로 조인이 아님*
``` SQL
ELECT *
FROM EMP, SALGRADE
WHERE EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL;
--** EMP테이블과 SQLGRADE 테이블을 조합하는데, EMP테이블의 급여가 SALGRADE의 낮은 값부터 SALGRADE테이블의 높은값 사이의 값만 추출한다.
 
SELECT *
FROM EMP E, SALGRADE S                      --** 결합은 , 콤마로
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;    --** 결합조건은 WHERE에 기재
/*
7369	SMITH	CLERK	    7902	1980-12-17 00:00:00	800		20	1	700	1200
7900	JAMES	CLERK	    7698	1981-12-03 00:00:00	950		30	1	700	1200
7876	ADAMS	CLERK	    7788	1987-07-13 00:00:00	1100		20	1	700	1200
*/
```
## 6.2. SQL 1999 CODE
-> <JOIN> 키워드 등장 -> JOIN(결합)의 유형 명시  
>-- *JOIN이라는 키워드가 보인다 ! -> 99코드*  
--                     *안보인다! -> 92코드*  
--                              -> <ON> 키워드 등장   -> 결합 조건은 WHERE 대신 ON  
### 6.2.1. CROSS JOIN
``` SQL
SELECT *
FROM EMP CROSS JOIN DEPT;
```
### 6.2.2. [INNER] JOIN
``` SQL
SELECT *
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;
``` 
>-- *엘리어스(ALIAS- 별칭) 가능*
``` SQL
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
``` 
>-- *INNER 생략 가능*
``` SQL
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
```
### 6.2.3. OUTER JOIN
### 6.2.3.1. LEFT [OUTER] JOIN
### 6.2.3.2. RIGHT [OUTER] JOIN
### 6.2.3.3. FULL [OUTER] JOIN
>-- *눈여겨서 봐야할 부분*  

``` SQL
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- WHERE E.DEPTNO = D.DEPTNO(+);
 
SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- WHERE E.DEPTNO(+) = D.DEPTNO;
 
SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
 
--** OUTER 생략가능
SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
 
 
--※ 참고
--1번)
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO
AND E.JOB = 'CLERK';
--> 이와 같은 방법으로 쿼리문을 구성해도 조회 결과를 얻는 과정에는 문제가 없다.
 
--2번)
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'CLERK';
--> 하지만 이와 같은 구성하여 조회하는 것을 권장한다.
```
>-- *==============================*  
-- * ON: 결합조건*  
-- * WHERE는: 조회조건*  
-- *==============================*  
 
>-- *SELECT 조건 처럼*   
-- *WHERE 절은 웨어 조건에 맞는 것만 1차적으로 퍼올림*  
-- *1번) TBL_DEPT 조건 & TBL_EMP 모두 퍼올림*  
-- *2번) TBL_DEPT 와 TBL_EMP조건에 맞는 것만 퍼올림*
## 6.3. SELF JOIN(자기조인)
``` SQL
- EMP 테이블의 데이터를 다음과 같이 조회할 수 있도록 쿼리문을 구성한다.
/*
---------------------------------------------------------
사원번호 사원명 직종명 관리자번호 관리자명 관리자직종명
7369     SMITH  CLERK   7902      FORD      ANALYST  
*/
 
SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E2.EMPNO "관리자번호" --E1.MGR "관리자번호" -- 주석처리된 것처럼 작성해도 되지만, 부모에 해당하는 테이블로 작성
     , E2.ENAME "관리자명", E2.JOB "관리자직종명"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO
ORDER BY 1;
 
SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E2.EMPNO "관리자번호" --E1.MGR "관리자번호" -- 주석처리된 것처럼 작성해도 되지만, 부모에 해당하는 테이블로 작성
     , E2.ENAME "관리자명", E2.JOB "관리자직종명"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
ORDER BY 1;
 
/*
7369	SMITH	CLERK	    7902	FORD	ANALYST
7499	ALLEN	SALESMAN	7698	BLAKE	MANAGER
7521	WARD	SALESMAN	7698	BLAKE	MANAGER
7566	JONES	MANAGER	    7839	KING	PRESIDENT
7654	MARTIN	SALESMAN	7698	BLAKE	MANAGER
7698	BLAKE	MANAGER	    7839	KING	PRESIDENT
7782	CLARK	MANAGER	    7839	KING	PRESIDENT
7788	SCOTT	ANALYST	    7566	JONES	MANAGER
7839	KING	PRESIDENT	(null)  (null)	(null)	
7844	TURNER	SALESMAN	7698	BLAKE	MANAGER
7876	ADAMS	CLERK	    7788	SCOTT	ANALYST
7900	JAMES	CLERK	    7698	BLAKE	MANAGER
7902	FORD	ANALYST	    7566	JONES	MANAGER
7934	MILLER	CLERK	    7782	CLARK	MANAGER
*/
```
## 6.4. JOIN 컬럼 소속 명시
``` SQL
SELECT 부서번호, 부서명, 사원명, 직종명, 급여
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
 
SELECT DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>> 에러 발생(ORA-00918: column ambiguously defined)
--     두 테이블 간 중복되는 칼럼에 대한
--     소속 테이블을 정해줘야 (명시해줘야) 한다.
```
--※ 두 테이블 간 중복되는 컬럼에 대해 소속 테이블을 명시하는 경우  
--   부모 테이블의 칼럼을 참조할 수 있도록 처리해야 한다.  
 
>-- *두개의 테이블이 있을 경우 부모테이블을 가져와서 써야함*
-- *부모테이블이란?* 
-- *EMP의 DEPTNO 값이 여러개 있는데 DEPT는 DEPTNO 값이 하나만 있음 -> 따라서 부모테이블은 DEPTNO*
``` SQL
SELECT *
FROM DEPT;      -- 부모테이블
 
SELECT *
FROM EMP;       -- 자식테이블
 
SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
``` 
-- 두 테이블에 모두 포함되어 있는 중복된 컬럼이 아니더라도  
-- 컬럼의 소속 테이블을 명시해 줄 수 있기를 권장한다.  
``` SQL
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
``` 
``` SQL
>-- *즉, 소속테이블을 명시하지 않으면 해당 SELECT를 찾기위해 여러 테이블을 조회한다.*  
-- *따라서 소속테이블을 명시함으로써 오라클에게 작업지시를 명확하게 하여, 불필요한 작업을 최소화한다.*  
 
-- *아우터조인에서 공통된 데이터를 가져올때 부모테이블이 아니면 셀렉트해서 가져올 수 없다.*  
``` SQL
SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
/*
DEPTNO	DNAME	    ENAME	JOB	    SAL
40  	OPERATIONS	(null)	(null)  (null)  -- DEPTNO가 40	
*/
 
SELECT E.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--==>>
/*
DEPTNO	DNAME	    ENAME	JOB	    SAL
(null)	OPERATIONS	(null)	(null)  (null)	-- DEPTNO가 (null)
*/
```
## 6.5. 세 개 이상의 테이블 조인(JOIN, 결합)
-- 형식 1. (SQL 1992 CODE)
``` SQL
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명1 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
```
-- 형식 2. (SQL 1999 CODE)
``` SQL 
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1 JOIN 테이블명2
ON 테이블명1.컬럼명1 = 테이블명2.컬럼명1
        JOIN 테이블명3
        ON 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
```
## 6.6. NATUAL JOIN
>-- *쿼리가 실행되는지 확인하기 위해서 NATURAL 조인을 하는 것은 괜찮으나,*  
-- *오라클에게 알아서 하도록하는 NATRUAL을 사용하게 되면 오라클은 맞는 정보를 찾기위해*  
-- *불필요한 메모리를 잡아 먹기 때문에, 실제 코드로 사용은 적절하지 않다.*  
``` SQL
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E NATURAL JOIN DEPT D;
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
...중략...
*/

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
USING(DEPTNO);
--** 쿼리 자체는 짧아보일 수 있으나,
--** 오라클은 변환과정을 거치기 때문에 권장하지 않는다.
```

<BR>

# 7. 집합연산자
2개 이상의 테이블을 하로 통합
>-- *JOIN은  두 개의 테이블을 좌 우   로 결합해서 보는 것*  
-- *UNION은 두 개의 테이블을 위 아래 로 결합해서 보는 것*
--※ 컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우 JOIN을 사용하지만  
--   레코드와 레코드를 결합하고자 하는 경우 UNION / UNION ALL 을 사용할 수 있다. 
## 7.1. UNION
중복행 1회 출력
## 7.2. UNION ALL
중복행 그대로 출력

>-- *===================================================================*  
-- * 결론: UNION 을 쓰는 것이 UNION ALL 보다 리소스 소모가 크기 때문에,*  
-- *        실무에서는 UNION ALL을 더 많이 쓴다.*  
-- *===================================================================*  
 
--※ UNION 은 항상 결과물의 첫 번째 컬럼을 기준으로 오름차순 정렬을 수행한다.  
--   반면, UNION ALL 은 결합된 순서(쿼리문에서 테이블을 명시한 순서)대로  
--   조회한 결과를 있는 그대로 반환한다. (-> 정렬 없음)  
--   이로 인해 UNION 이 부하가 더 크다. (-> 리소스 소모가 더 크다)  
--   또한, UNION 은 결과물에 대한 중보된 레코드(행)가 존재할 경우  
--   중복을 제거하고 1개 행만 조회된 결과를 반환하게 된다.  

## 7.3. INTERSECT 교집합  
-- TBL_UMUNBACKUP 테이블과 TBL_JUMUN 테이블에서  
-- 제품코드와 주문수량의 값이 똑같은 행만 추출해서 조회하고자 한다.
``` SQL
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
맛동산	30
빼빼로	20
홈런볼	10
*/
```
## 7.4. MINUS 차집합
``` SQL
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
감자깡	10
꼬북칩	30
마이쮸	20
맛동산	20
빅파이	10
빅파이	20
사또밥	10
사또밥	30
오예스	20
포스틱	20
포카칩	10
포카칩	20
포카칩	30
홈런볼	20
*/
```

<BR>

# 8. 정규화(Normalization)
>-- *웹 개발자관점에서 중요도는 낮지만, FINAL PJ에서 가장 핵심이 되는 부분이고 DBA에게 정말 중요하다!!!*  

--○ 정규화란?  
--   한 마디로 데이터베이스 서버의 메모리 낭비를 막기 위해  
--   어떤 하나의 테이블을... 식별자를 가지는 여러 개의 테이블로 **나누는 과정**을 말한다. 
  
>-- *특정컬럼 값이 필요할때 테이블을 가져다 쓸텐데, 메모리는 특정값만 가져오는게 아니라 테이블 전체를 퍼올리기 때문에*  
-- *테이블이 작을 수록 메모리 낭비가 적어진다.*  
  
-- ex) 윤수가... 옥장판을 판매한다.  
--     고객리스트 -> 거래처 직원 명단이 적혀있는 수첩의 정보를 데이터베이스화 하려고 한다.

``` SQL
-- 테이블명: 거래처직원  
    10Byte    10Byte        10Byte      10Byte       10Byte 10Byte  10Byte
--------------------------------------------------------------------------------
거래처회사명  회사주소     회사전화     거래처직원명  직급  이메일   휴대폰
--------------------------------------------------------------------------------
    LG        서울여의도   02-345-6789   최혜인       부장  chi@na... 010-23...      
    LG        서울여의도   02-345-6789   채다선       과장  cds@da... 010-76...      
    LG        서울여의도   02-345-6789   정현욱       대리  chy@da... 010-98...      
    LG        서울여의도   02-345-6789   정한울       부장  chw@na... 010-39...      
    SK        서울소공동   02-987-6543   임하성       부장  lhs@na... 010-12...      
    LG        부산동래구   051-221-2211  이주형       대리  ljh@em... 010-55...      
    SK        서울소공동   02-987-6543   오수경       과장  osk@na... 010-88...     
                                            :
--------------------------------------------------------------------------------
```

**가정)** 서울 여의도 LG(본사)라는 회사에 근무하는 거래처 직원 명단이 총 100만 명이라고 가정한다.  
(한 행(레코드)은 70Byte)  
어느 날... <서울여의도>에 위치한 LG 본사가 <경기분당>으로 사옥을 이전하게 되었다.  
회사주소는 <경기분당>으로 바뀌고, 회사전화는 <031-111-2222>로 바뀌게 되었다.       
그러면... 100만 명의 회사주소와 회사전화를 변경해야 한다.          
-- 이 때 수행되어야 할 쿼리문 -> UPDATE  
      
``` SQL
      UPDATE 거래처직원  
      SET 회사주소 = '경기분당', 회사전화 = '031-111-2222'  
      WHERE 거래처회사명 = 'LG' AND 회사주소 = '서울여의도';  
```
-- 100만 개 행을 하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다.  
         즉, 100만 * 70Byte 를 모두  
         하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다는 말이다.  
         
-> 이는 테이블의 설계가 잘못되었으므로 DB 서버는 조만간 메모리 고갈로 인해 DOWN 될 것이다.  
-> 그러므로 정규화 과정을 수행해야 한다.  
 
>-- *여러가지 정규화(제7정규형까지, 제6정규형까지..)가 있지만, 우리는 실무를 기준으로 정규화를 볼 예정*   
## 8.1. 제 1 정규화(형)  
--> 어떤 하나의 테이블에 반복되는 컬럼 값들이 존재한다면  
--  값들이 **반복되어 나오는 컬럼**을 **분리**하여 새로운 테이블을 만들어준다.  
    
```SQL
-- 테이블명 : 회사 -> 부모테이블(참조받는 테이블)  
10Byte     10Byte       10Byte        10Byte      
-------------------------------------------------  
회사ID    거래처회사명  회사주소     회사전화  
+++++++
참조받는 컬럼
------------------------------------------------- 
10            LG        서울여의도   02-345-6789         
20            LG        부산동래구   051-221-2211         
30            SK        서울소공동   02-987-6543       
------------------------------------------------- 
-- [무결성]회사ID는 하나만 이어야하고, 비어있으면 안됨  
```
```SQL 
-- 테이블명 : 직원 -> 자식테이블(참조하는 테이블)  
10Byte       10Byte 10Byte  10Byte      10Byte  
------------------------------------------------  
거래처직원명  직급  이메일   휴대폰      회사ID  
                                        ========
                                        참조하는 컬럼
------------------------------------------------  
최혜인       부장  chi@na... 010-23...   10  
채다선       과장  cds@da... 010-76...   10  
정현욱       대리  chy@da... 010-98...   10  
정한울       부장  chw@na... 010-39...   10  
임하성       부장  lhs@na... 010-12...   20  
이주형       대리  ljh@em... 010-55...   30  
오수경       과장  osk@na... 010-88...   10  
------------------------------------------------  
```
--> 제 1 정규화를 수행하는 과정에서 분리된 테이블은 반드시 부모테이블과 자식 테이블이 관계를 갖게 된다.  
>-- *무결성: 결점이 없다.*  
-- *관계형 DB의 경우 특정한 부분에서 결점이 있다고 하더라도, 참조하고 있는 테이블이 있기 때문에 전반적으로 신뢰성이 떨어진다.*  
```SQL
                                    -- 제약조건
    --> 부모 테이블 -> 참조받는 컬럼 -> PRIMARY KEY(기본키, 고유키)
    --  자식 테이블 -> 참조하는 컬럼 -> FOREIGN KEY(외래키, 참조키)
```
--※ 참조받는 컬럼이 갖는 특징  
--   반드시 고유한 값(데이터)만 들어와야 한다. 즉, 중복된 값(데이터)이 있어서는 안된다.  
--   또한, 비어있으면(NULL이 있어서는) 안된다. 즉, NOT NULL 이어야 한다.  
    
--> 제 1 정규화를 수행하는 과정에서 부모테이블의 PRIMARY KEY 는 항상 자식 테이블의 FOREIGN KEY 로 전이된다.  
    
>-- *========================================================================*  
    -- *결론: 정규화는 쪼개는 것*  
    -- *제 1 정규화는 반복된 내용을 쪼개는 것이다.*  
    -- *부모테이블에는 참조받는 컬럼(PRIMARY KEY,중복x,비어있음x)*  
    -- *자식테이블에는 참조하는 컬럼(부모의 PK를 참조하는 FOREIGN KEY)*  
    -- *========================================================================*
    
-- 테이블이 분리(분할)되기 이전 상태로 조회  
>-- *JOIN을 통해서 조회*  
``` SQL
    SELECT A.거래처회사명, A.회사주소, A.회사전화
         , B.거래처직원명, B.직급, B.이메일, B.휴대폰
    FROM 회사 A, 직원 B
    WHERE A.회사ID = B.회사ID;
```
    
**가정)** 서울 여의도 LG(본사)라는 회사에 근무하는 거래처 직원 명단이 총 100만 명이라고 가정한다.  
-- [삭제](한 행(레코드)은 70Byte)  

어느 날... <서울여의도>에 위치한 LG 본사가 <경기분당>으로 사옥을 이전하게 되었다.  
회사주소는 <경기분당>으로 바뀌고, 회사전화는 <031-111-2222>로 바뀌게 되었다.  

-- [수정전]그러면... 100만 명의 회사주소와 회사전화를 변경해야 한다.  
**-- [수정후]그러면... 회사 1건의 회사주소와 회사전화를 변경해야 한다.** 

-- 이 때 수행되어야 할 쿼리문 -> UPDATE  
```SQL
-- [수정전]
UPDATE 거래처직원  
SET 회사주소 = '경기분당', 회사전화 = '031-111-2222'  
WHERE 거래처회사명 = 'LG' AND 회사주소 = '서울여의도';  
--                    ↓
-- [수정후]
UPDATE 회사
SET 회사주소 = '경기분당', 회사번화 = '031-111-2222'
WHERE 회사ID = 10;
```
-- [수정전]100만 개 행을 하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다.  
**-- [수정후]1 개 행을 하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다.**  
 [수정전]즉, 100만 * 70 Byte 를 모두  
**[수정후]즉, 1 * 40 Byte 를 모두**  
 하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다는 말이다.  
 
 -> 정규화 이전에는 100만 건을 처리해야 할 업무에서
    1건만 처리하면 되는 업무로 바뀐 상황이기 때문에
    DB 서버는 메모리 고갈이 일어나지 않고 아주 빠르게 처리될 것이다.
``` SQL    
--      **[정규화 이후]**                 |         [정규화 이전]
-- 거래처회사명, 회사전화 
SELECT 거래처회사명, 회사전화         | SELECT 거래처회사명, 회사전화
FROM 회사;                            | FROM 거래처직원;
--> 3*40 Byte                         | --> 200만*70 Byte

-- 거래처직원명, 직급
SELECT 거래처직원명, 직급             | SELECT 거래처직원명, 직급
FROM 직원;                            | FROM 직원;
--> 200만*50 Byte                     | --> 200만*70 Byte

-- 거래처회사명, 거래처직원명
SELECT 거래처회사명, 거래처직원명     | SELECT 거래처회사명, 거래처직원명
FROM 회사 A JOIN 직원 B               | FROM 거래처직원;
ON A.회사ID = B.회사ID                | 
--> (3*40) + (200만*50) Byte          | --> 200만*70 Byte
--==>> 3개의 경우 모두 정규화 이전의 Byte 가 작음
```

``` SQL    
-- 테이블명 : 주문
--------------------------------------------------------------------------------
    고객ID        제품코드        주문일자            주문수량
    ++++++++++++++++++++++++++++++++++++++
                    P.K
--------------------------------------------------------------------------------
    UJY1234(엄재용)     P-KKBK(꿀꽈배기)  2023-10-30 07:20:31     20
    PBK8835(박범구)     P-KKBC(꼬북칩)    2023-10-30 07:21:40     20
    PNY3235(박나영)     P-KKDS(쿠크다스)  2023-10-30 08:10:10     13
    PKY5834(박가영)     P-SWKK(새우깡)    2023-10-30 09:07:04     12
                                        :
--------------------------------------------------------------------------------
```
### (페이지 20231030_01_hr.sql)
#### 1. 문제
-- 위의 주문 테이블에서 PK로 해야하는 키는?  
-- 고객ID   일 경우: 고객1이 더이상 구매X  
-- 제품코드 일 경우: 제품코드1이 더이상 판매X  
-- 고객ID + 제품코드 일 경우: 고객이 제품을 한번밖에 구매못함  
-- 고객ID + 제품코드 + 주문일자 일 경우: 같은값 2개 일때?  

``` SQL
    -- UJY1234(엄재용)     P-KKBK(꿀꽈배기)  2023-10-30 07:20:31     20
    -- UJY1234(엄재용)     P-KKBK(꿀꽈배기)  2023-10-30 07:20:31     20
    --------------------------------------------------------------------
    -- UJY1234(엄재용)     P-KKBK(꿀꽈배기)  2023-10-30 07:20:31     40 -> 으로 구성되기 때문에 3개로 복합 PK 가능
```
>-- *PK는 1개만 가능*  
-- *제약조건을 구성하는 컬럼은 여러개가 될 수 있음*  
 
-- ※ 하나의 테이블에 존재하는 PRIMARY KEY 의 최대 갯수는 1개이다.  
--    하지만, PRIMARY KEY 를 이루는(구성하는) 컬럼의 갯수는 복수(여러개)인 것이 가능하다.  
--    컬럼 1개로만 구성된 PRIMARY KEY 를 SINGLE PRIMARY KEY 라고 부른다.  
--    (단일 프라이머리 키)  
--    두 개 이상의 컬럼으로 구성된 PRIMARY KEY 를 COMPOSITE PRIMARY KEY 라고 부른다.  
--    (복합 프라이머리 키)  
>-- *복합 프라이머리 키는 개념적으론 가능하나, 권장하지는 않음*  
## 8.2. 제 2 정규화(형)  
--> 제 1 정규화를 마친 결과물에서 PRIMARY KEY 가 SINGLE COLUMN 이라면 제 2 정규화는 수행하지 않는다.  
-- 하지만, PRIMARY KEY 가 COMPOSITE COLUMN 이라면 반.드.시. 제 2 정규화를 수행해야 한다.  

--> 식별자가 아닌 컬럼은 식별자 전체 컬럼에 대해 의존적이어야 하는데  
--  식별자 전체 컬럼이 아닌 일부 식별자 컬럼에 대해서만 의존적이라면  
--  이를 분리하여 새로운 테이블을 생성해 준다.  
--  이 과정을 제 2 정규화라 한다.  
    
``` SQL
-- 테이블명: 과목 -> 부모 테이블
--------------------------------------------------------------------------------
과목번호    과목명     교수번호  교수자명  강의실코드   강의실설명
++++++++               ++++++++
            P.K
--------------------------------------------------------------------------------
    J0101   자바기초    21       슈바이처  A301        전산실습실 3층 40석 규모
    J0101   자바기초    10       장영실    T502        전자공학관 5층 60석 규모   
    J0102   자바중급    22       테슬라    T502        전자공학관 5층 60석 규모   
    03188   오라클중급  22       테슬라    A301        전산실습실 3층 40석 규모   
    03189   오라클심화  10       장영실    T502        전자공학관 5층 60석 규모   
    J3345   JSP응용     20       맥스웰    K101        인문과학관 1층 90석 규모
                                    :
--------------------------------------------------------------------------------
 ```
``` SQL
-- 테이블명: 점수 -> 자식 테이블
----------------------------------------------
과목번호  교수번호  학번              점수
========  ========
        F.K
++++++++            ++++++++
            P.K
----------------------------------------------
 03188      22      2308225(김동민)    92
 03188      22      2308227(김수환)    80
 03189      10      2308229(노은하)    92
                        :
----------------------------------------------
```
 
``` SQL
 -- 테이블명: 과목
 과목번호   과목명     과목설명    필수여부    구성학점
 
 
 -- 테이블명: 교수
 교수번호   교수자명    주민번호    주소  사용교수실   ...
```
## 8.3. 제 3 정규화(형)  
--> 식별자가 아닌 컬럼이 식별자가 아닌 컬럼에 의존적인 상황이라면  
--  이를 분리하여 새로운 테이블을 생성해 주어야 한다.  
--  이 과정을 제 3 정규형이라 한다.  
 
>-- *강의실 설명은 강의실코드에 의존적-> 식별자 아닌 칼럼이 식별자 아닌 컬럼에 의존적*  
 
>-- *========================================================================*  
-- *결론: 정규화는 분리하는 것(쪼개는 것)*  
-- * DB 서버의 메모리 낭비를 막기위해 분리함  
-- * 너무 분리하게 되면 원래 형태의 표로 만들기가 불가능해서 식별자를 갖게끔 분리하는 것이 중요하다.  
-- * 정규화는 절차와 순서가 있기 때문에 의 규칙대로 단계별로 수행하는 것이 좋다  
-- * 꼭 1-2-3-4 - 역정규화 순서대로 해야한다

>-- 제 1정규화는 특정 컬럼의 값이 중복된 내용을 분리하는 것이고, 수행한 결과물은 부모와 자식으로 나뉘어짐 ex. lg-회사   
-- 부모테이블의 참조하는 키는 P.K, 참조 받는 키는 F.K  
-- 제약조건 P.K는 테이블당 1개를 갖는다.(unique & not null) P.K가 없는 것은 존재하나 최대 1개 가질 수 있다.  
-- 하나의 P.K를 갖고 있을 경우 복합 P.K 라고 한다.  

>-- 단일 정규형으로 수행되는 테이블은 정규화 실행x  
-- 복합 P.K로 구성된 경우 문제가 있을 경우가 있어서 제 2 정규화 진행  

>-- 제 2정규화는 복합 F.K로 의존적인 테이블을 정규화 진행 ex. 과목번호- 과목명, 교수번호-교수자명  
-- 제 3정규화는 식별자가 아닌 컬럼이 식별자가 아닌 컬럼을 참조할 때 정규화 진행 ex. 강의실설명  
-- *========================================================================*  
## 8.3.1. ※ 관계(Relation)의 종류
### 8.3.1.1. 1 : 다(many)
--> 제 1 정규화를 적용하여 수행을 마친 결과물에서 나타나는 바람직한 관계.  
-- 관계형 데이터베이스를 활용하는 과정에서 추구해야 하는 관계.  
### 8.3.1.1. 1 : 1
--> 논리적, 물리적으로 존재할 수 있는 관계이긴 하지만  
--  관계형 데이터베이스 설계 과정에서 가급적이면 피해야 할 관계.  
>-- *구태여 1:1이어야 하는지 확인해야하는 관계*  
### 8.3.1.1. 다 : 다
--> 논리적인 모델에서는 존재할 수 있지만  
--  실제 물리적인 모델링에서는 존재할 수 없는 관계.  

``` SQL
-- 테이블명: 고객                          - 테이블명: 제품
-----------------------------------------  ---------------------------------------
고객번호  고객명   이메일      전화번호    제품번호    제품명   제품단가 제품설명
  1001    강혜성   khs@test... 010-1....   pswk     새우깡        500    새우가...
  1002    길현욱   khw@test... 010-2....   pkjk     감자깡        700    감자를...
  1003    김경태   kkt@test... 010-3....   pkkm     고구마깡      800    고구마를...
  1004    김다슬   kds@test... 010-4....   jkc      자갈치        400    자갈을...
            :                                           :  
-----------------------------------------  ---------------------------------------
 
                    - 테이블명: 주문접수(판매)
                    ---------------------------------------------------------
                    주문번호    고객번호    제품번호    주문일자    주문수량
                      :
                      25        1001        pjkc      2023-10-30 ..   20
                      26        1002        pjkc      2023-10-30 ..   10
                      27        1003        pkkm      2023-10-30 ..   10
                      28        1003        pkkm      2023-10-30 ..   13
```
>-- *다:다가 논리적으로 존재할 수 있으나, 위의 테이블에서 실행되기 어렵다*
## 8.4. 제 4 정규화(형)  
--> 위에서 확인한 내용과 같이 <many(다) : many(다)> 관계를  
--  <1(일) : many(다)> 관계로 꺠뜨리는 과정이 바로 제 4정규화 수행 과정이다.  
--  -> 파생 테이블 생성 -> 다:다 관계를 1:다 관계로 깨뜨리는 역할 수행. ex. 주문-수강신청  

>-- *성적표에 수강신청이 없다고 해서, 실제 코드 내에 수강신청코드가 없다고 생각하면 안됨*
``` SQL
학생이름        과목
윤수              국어
하성              사회

        수강신청
        수강신청번호  신청자학번   과목코드
        1001        2310123(윤수)  1201(국어)

---------------
윤수      가방
하성      신발
민지      바지

구매
구매번호    구매자 제품코드 일자
---------------------------------
1234    120(민지) 2023(치마) 2023....


반품(구매자외 구매코드 필요함)
-----------------------------
구매코드(필요~~!!) 구매자   일자                반품사유
    xxxxx    2023... 사이즈가 안맞아서      흑흑...
```
## 8.5. 역정규화(비정규화)(형)  
>-- *정규화는 나누고 쪼개고 분리, 역정규화는 정규화를 역행(합치는) 것*    
-- *역정규화를 해야하는지 아닌지는 업무파악을 꼼꼼히 해야 가능*  
``` SQL 
-- A 경우 ->

-- 테이블명: 부서         -- 테이블명: 사원
-----------------------   ------------------------------------------ + -------
-- 부서번호 부서명 주소   사원번호 사원명 지급 급여 입사일 부서번호    부서명
-----------------------   ------------------------------------------ + -------
-- 10개 레코드(행)        1,000,000 개 레코드(행)
-----------------------   ------------------------------------------ + -------

--> 조회 결과물
---------------------------
-- 부서명 사원명 직급 급여
---------------------------
```
--> <부서> 테이블과 <사원> 테이블을 JOIN 했을 때의 크기  
--  (10 * 30 Byte) + (1000000 * 60Byte) = 300 + 600000000 = 360000300 Byte  

--> <사원> 테이블을 역정규화 한 후 이 테이블만 읽어올 때의 크기  
--  (즉, 부서 테이블의 부서명 컬럼을 사원 테이블에 추가한 경우)  
--  10000000 * 70 Byte = 70000000 Byte  
``` SQL
-- B 경우 ->

-- 테이블명: 부서         -- 테이블명: 사원
-----------------------   ------------------------------------------ + -------
-- 부서번호 부서명 주소   사원번호 사원명 지급 급여 입사일 부서번호    부서명
-----------------------   ------------------------------------------ + -------
-- 500,000개 레코드(행)        1,000,000 개 레코드(행)
-----------------------   ------------------------------------------ + -------

--> 조회 결과물
---------------------------
-- 부서명 사원명 직급 급여
---------------------------
```
--> <부서> 테이블과 <사원> 테이블을 JOIN 했을 때의 크기  
--  (500000 * 30 Byte) + (1000000 * 60Byte) = 15000000 + 60000000 = 75000000 Byte  

--> <사원> 테이블을 역정규화 한 후 이 테이블만 읽어올 때의 크기  
--  (즉, 부서 테이블의 부서명 컬럼을 사원 테이블에 추가한 경우)  
--  10000000 * 70 Byte = 70000000 Byte  

>-- *부모테이블과 자식테이블의 레코드수가 차이가 크면 정규화를 하는게 나은 방법  
-- *                                     차이가 크지 않으면 정규화를 안 하는게 나은 방법  
 
## 8.6. 용어 참고
1. 관계(relationship, relation)
    - 모든 엔트리(entry)는 단일 값을 가진다.
    - 각 열(column)은 유일한 이름을 가지며 순서는 무의미하다.
    - 테이블은 모든 행(row==튜플==tuple)은 동일하지 않으며 순서는 무의미하다.
    
2. 속성(attribute)
    - 테이블의 열(column)을 나타낸다.
    - 자료의 이름을 가진 최소 논리적 단위: 객체의 성질, 상태 기술
    - 일반 파일(file)의 항목(아이템==item==필드==field)에 해당한다.
    - 엔티티(entitity)의 특성과 상태를 기술
    - 속성(attribute)의 이름은 모두 달라야 한다.
    
3. 튜플(tuple)
    - 테이블의 행(row==엔티티==entity)
    - 연관된 몇 개의 속성으로 구성
    - 개념 정보 단위
    - 일반 파일(file)의 레코드(record)에 해당한다.
    - 튜플 변수(tuple varialbe)
    : 튜플(tuple)을 가리키는 변수, 모든 투플 집합을 도메인으로 하는 변수
    
4. 도메인(domain)
    - 각 속성(attribute)이 가질 수 있도록 허용된 값들의 집합
    - 속성 명과 도메인 명이 반드시 동일할 필요는 없음.
    - 모든 릴레이션에서 모든 속성들의 도메인은 원자적(atomic)이어야 함.
    - 원자적 도메인
    :  도메인의 원소가 더 이상 나누어질 수 없는 단일체일 때를 나타냄
    
5. 릴레이션(relation)
    - 파일 시스템에서 파일과 같은 내겸
    - 중복된 튜플(tuble==entity==엔티티)을 포함하지 않는다. -> 모두 상이함(튜플의 유일성)
    - 릴레이션은 튜플(tuple==entity==엔티티)의 집합. 따라서 튜플의 순서는 무의미하다.
    - 속성9attribute)간에는 순서가 없다.  

## 8.7. 무결성(Integrity)
## 8.7.1. 무결성 종류
무결성에는 개체 무결성(Entity Integrity)  
              참조 무결성(Relational Integrity)
              도메인 무결성(Domain Integrity)이 있다.
1. 무결성에는 개체 무결성(Entity Integrity)
              참조 무결성(Relational Integrity)
              도메인 무결성(Domain Integrity)이 있다.
              
2. 개체 무결성(Entity Integrity)
    개체 무결성은 릴레이션에서 저장되는 투플(tuple)의 
    유일성을 보장하기 위한 제약조건이다.
 
3. 참조 무결성(Relational Integrity)
    참조 무결성은 릴레이션 간의 데이터 일관성을 보장하기 위한 제약조건이다.
 
4. 도메인 무결성(Doamin Integrity)
    도메인 무결성은 허용 가능한 범위를 지정하기 위한 제약조건이다.
    
5. 제약조건의 종류
    - PRIMARY KEY(PK:P) -> 기본키, 고유키, 식별키, 식별자
     해당 컬럼의 값은 반드시 존재해야 하며, 유일해야 한다.
     (NOT NULL 과 UNIQUE 가 결합된 형태)
     
    - FOREIGN KEY(FP:F:R) -> 외래키, 외부키, 참조키
        해당 컬럼의 값은 참조되는 테이블의 컬럼 데이터들 중 하나와 일치하거나 NULL을 가진다.
        
    - UNIQUE(UK:U)
        테이블 내에서 해당 컬럼의 값은 항상 유일해야 한다.
    
    - NOT NULL(NN:CK:C)
        해당 컬럼은 NULL을 포함할 수 없다.
        
    - CHECK(CK:C)
        해당 컬럼에 저장 가능한 데이터의 범위나 조건을 지정한다.
    
    -- *NOT NULL제약조건을 CHECK의 일부라고 보기도 하지만, 제약조건 명시나 구조가 달라서 CHECK를 다르게 분리하였다.*  

## 8.8. 제약조건
### 8.8.1. PRIMARY KEY
1. 테이블에 대한 기본 키를 생성한다.
2. 테이블에서 각 행을 유일하게 식별하는 컬럼 또는 컬럼의 집합이다.  
--      기본 키는 테이블 당 하나만 존재한다.  
--      그러나 반드시 하나의 컬럼만으로 구성된 것은 아니다.  
--      NULL 일 수 없고, 이미 테이블에 존재하고 있는 데이터를  
--      다시 입력할 수 없도록 처리한다.(유일성)  
--      UNIQUE INDEX가 오래클 내부적으로 자동으로 생성된다.  
 
3. 형식 및 구조  
-- *[BRAKET]컬럼의 이름은 생략가능  
(1) 컬럼 레벨의 형식
``` SQL
      컬럼명, 데이터타입[CONSTRACT CONSTRATIONT명] PRIMARY KEY(컬럼명,...)]  
``` 
(2) 테이블 레벨의 형식
``` SQL
      컬럼명의 데이터타입,
      컬럼명의 데이터타입,
      CONSTRATINT CONASTRAINT명 PRIMARY KEY(컬럼명,...)
```
>-- *특별한 코멘트가 없는 한, 테이블 레벨형식으로 이름_컬럼명구조*  
 
4. CONSTRAINT 추가 시 CONSTRAINT 명을 생략하면  
--      오라클 서버가 자동적으로 CONSTRAINT명을 부여한다.  
--      일반적으로 CONSTRAINT명은
``` SQL
<테이블명_컬럼명_CONSTRAINT약자>
```
--      형식으로 기술한다.
#### 📌 1. 안내
-- ○ PK 지정 실습((1) 컬럼 레벨의 형식)
``` SQL
CREATE TABLE TBL_TEST1
( COL1 NUMBER(5) PRIMARY KEY
  ,COL2 VARCHAR2(30)
 
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.
 
SELECT *
FROM TBL_TEST1;
 
DESC TBL_TEST1;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    -> PK 제약조건 확인불가
COL2          VARCHAR2(30) 
*/
-- 데이터 입력
-- *일반적인 방법*
INSERT INTO TBL_TEST1 VALUES();

-- *권장방법: INSERT VALUE값에 어떤 것을 넣는지 명시*
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1, 'ABCD');

-- *가능*
INSERT INTO TBL_TEST1(COL2,COL1) VALUES('ABCD', 1);
INSERT INTO TBL_TEST1(COL2) VALUES('ABCD');

-- 데이터 입력
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1, 'TEST'); 
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1, 'TEST'); --> 에러 발생

-- *제약조건을 실행해도 진행되었으나, 제약조건으로 인해 1번이후부터 에러 발생*
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1, 'ABCD'); --> 에러 발생
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(2, 'TEST'); 
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(3, NULL);   --> 가능 첫번째 컬럼만 NULL 불가
INSERT INTO TBL_TEST1(COL1) VALUES(4);
INSERT INTO TBL_TEST1(COL1) VALUES(4);              --> 에러 발생
INSERT INTO TBL_TEST1(COL1) VALUES(4);
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(5, 'ABCD'); 
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(NULL, NULL);--> 에러 발생
INSERT INTO TBL_TEST1(COL2) VALUES('ABCD');         --> 에러 발생
 
-- 확인
SELECT *
FROM TBL_TEST1;
--==>> 
/*
1	TEST
2	TEST
3	
4	
5	ABCD
*/

--※ 제약조건 확인
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='TBL_TEST1';
--==>> HR	SYS_C007091	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			2023-10-30	HR	SYS_C007091

--※ 제약조건이 지정된 컬럼 확인(조회)
SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>> 
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	COLUMN_NAME	POSITION
HR	    SYS_C007091	    TBL_TEST1	COL1	    1
*/
```

-- ○ PK 지정 실습((2) 테이블 레벨의 형식)
``` SQL
-- 테이블 생성
CREATE TABLE TBL_TEST2
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST2_COL1_PK PRIMARY KEY(COL1) -- *제약조건의이름 제약조건(적용할컬럼명)  
)
--==>> Table TBL_TEST2이(가) 생성되었습니다.
 
-- 데이터 입력
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(1, 'TEST'); --> 에러발생 (ORA-00001: unique constraint (HR.TEST2_COL1_PK) violated)
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(1, 'ABCD'); --> 에러발생 (ORA-00001: unique constraint (HR.TEST2_COL1_PK) violated)
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST2(COL1) VALUES(4);
INSERT INTO TBL_TEST2(COL1) VALUES(4); --> 에러발생
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(NULL, NULL); --> 에러발생 (ORA-01400: cannot insert NULL into ("HR"."TBL_TEST2"."COL1"))
INSERT INTO TBL_TEST2(COL2) VALUES('KKKK');          --> 에러발생 (ORA-01400: cannot insert NULL into ("HR"."TBL_TEST2"."COL1"))
 
--○ 확인
SELECT * 
FROM TBL_TEST2;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

--○ USER_CONSTRAINTS 와 USER_CONS_COLUMNS 를 대상으로
--   제약조건이 설정된 내용에 대해서
--   소유주, 제약조건명, 테이블명, 제약조건종류, 컬럼명 항목을 조회한다.
SELECT UC.OWNER "소유주", UC.CONSTRAINT_NAME "제약조건명", UC.TABLE_NAME "테이블명", UC.CONSTRAINT_TYPE "제약조건종류", UCC.COLUMN_NAME "컬럼명"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST2';
--==>> HR	TEST2_COL1_PK	TBL_TEST2	P	COL1
-- *제약조건명이 오라클이 임의부여한 이름이 아닌, 우리가 지정한 이름으로 부여되어 있음*  
```

--○ PK 지정 실습((3) 다중 컬럼 PK 지정)
``` SQL
-- 테이블 생성
 
--CREATE TABLE TBL_TEST3
--( COL1 NUMBER(5)
--, COL2 VARCHAR2(30)
--, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1) 
--, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL2) 
--);
--==>> PRIMARY KEY(COL1) , PRIMARY KEY(COL2) 이렇게 실행X
 
CREATE TABLE TBL_TEST3
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1, COL2) 
);
--==>> Table TBL_TEST3이(가) 생성되었습니다.
 
-- 데이터 입력
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1,'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1,'TEST'); --> 에러 발생(ORA-00001: unique constraint (HR.TEST3_COL1_COL2_PK) violated)
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1,'ABCD'); --> 가능 --*복합으로 묶여 있다면, 둘의 합이 정확하게 일치하는 지 체크함*
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2,'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2,'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, NULL);    --> 에러 발생
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, NULL); --> 에러 발생
 
SELECT *
FROM TBL_TEST3;
--==>>
/*
1	ABCD
1	TEST
2	ABCD
2	TEST
*/
 
--○ USER_CONSTRAINTS 와 USER_CONS_COLUMNS 를 대상으로
--   제약조건이 설정된 내용에 대해서
--   소유주, 제약조건명, 테이블명, 제약조건종류, 컬럼명 항목을 조회한다.
SELECT UC.OWNER "소유주", UC.CONSTRAINT_NAME "제약조건명", UC.TABLE_NAME "테이블명", UC.CONSTRAINT_TYPE "제약조건종류", UCC.COLUMN_NAME "컬럼명"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST3';
--==>> 
/*
HR	TEST3_COL1_COL2_PK	TBL_TEST3	P	COL1
HR	TEST3_COL1_COL2_PK	TBL_TEST3	P	COL2
*/
-- * TBL_TEST3 PRIMARY KEY 가 2개(X) -> 복합 PRIMARY KEY (O)
```
--○ PK 지정 실습((4) 테이블 생성 이후 제약조건 추가 설정)
``` SQL
-- 테이블 생성
CREATE TABLE TBL_TEST4
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
);
--==>> Table TBL_TEST4이(가) 생성되었습니다.
 
--※ 이미 생성된(만들어져 있는) 상태의 테이블에
--   부여하려는 제약조건을 위반한 데이터가 포함되어 있을 경우
--   해당 테이블에 제약조건을 추가하는 것은 불가능하다.
 
-- 제약조건 추가
ALTER TABLE TBL_TEST4
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4이(가) 변경되었습니다.
 
-- *제약조건을 변경하는 것은 문법적으로 가능하나,*
-- *삭제후 다시 생성을 권장*
INSERT INTO TBL_TEST4(COL1,COL2) VALUE;
 
--※ 제약조건 확인 전용 뷰(VIEW) 생성
-- *VIEW 만들때는 SELECT 확인후 생성!*  
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
    , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
    , UC.TABLE_NAME "TABLE_NAME"
    , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
    , UCC.COLUMN_NAME "COLUMN_NAME"
    , UC.SEARCH_CONDITION "SEARCH_CONDITION"
    , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK이(가) 생성되었습니다.
 
--○ 생성된 뷰(VIEW)를 통한 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1
```
#### 8.8.1.1. 생성된 뷰를 통해 제약조건 확인
--※ 제약조건 확인 전용 뷰(VIEW) 생성  
>-- *VIEW 만들때는 SELECT 확인후 생성!*  
``` SQL
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
    , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
    , UC.TABLE_NAME "TABLE_NAME"
    , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
    , UCC.COLUMN_NAME "COLUMN_NAME"
    , UC.SEARCH_CONDITION "SEARCH_CONDITION"
    , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK이(가) 생성되었습니다.
 
--○ 생성된 뷰(VIEW)를 통한 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1		
```
### 8.8.2. FOREIGN KEY

### 8.8.3. UNIQUE(UK:U)
1. 테이블에서 지정한 컬럼의 데이터가 중복되지 않고 유일할 수 있도록 설정하는 제약조건.  
--      PRIMARY KEY 와 유사한 제약조건이지만, **NULL을 허용**한다는 차이점이 있다.  
--      내부적으로 PRIMARY KEY와 마찬가지로 UNIQUE INDEX 가 자동 생성된다.  
--      **하나의 테이블 내**에서 **UNIQUE 제약조건은 여러 번 설정하는 것이 가능**하다.  
--      즉, 하나의 테이블에 UNIQUE 제약조건을 여러 개 만드는 것은 가능하다는 것이다.  
>-- *UNIQUE에는 NOT NULL제약조건이 포함되어있지 않다.*  
``` SQL
/* 
--회원 테이블
회원번호    아이디     패스워드    성명  주민번호 휴대폰번호 우편번호 주소1 주소2
P.K        P.K(X)/U                         U        U
*/
```
 
2. 형식 및 구조  
(1) 컬럼 레벨의 형식
``` SQL
-- 컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명] UNIQUE
```
(2) 테이블 레벨의 형식
``` SQL
-- 컬럼명 데이터타입,
-- 컬럼명 데이터타입,
-- CONSTRAINT CONSTARINT명 UNIZUE(컬럼명,...)
```
## 📌 2. 안내
--○ UK 지정 실습((1) 컬럼 레벨의 형식)
``` SQL
-- 테이블 생성
CREATE TABLE TBL_TEST5
( COL1 NUMBER(5)    PRIMARY KEY
, COL2 VARCHAR(30)  UNIQUE
);
--==>> Table TBL_TEST5이(가) 생성되었습니다.
 
-- 제약조건 조회
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST5';
--==>> 
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	CONSTRAINT_TYPE	COLUMN_NAME	SEARCH_CONDITION	DELETE_RULE
HR	    SYS_C007095	    TBL_TEST5	    P	        COL1		
HR	    SYS_C007096	    TBL_TEST5	    U	        COL2		
*/
 
-- 데이터 입력
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(1,'TEST');
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(1,'TEST'); --> 에러 발생(ORA-00001: unique constraint (HR.SYS_C007095) violated)
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2,'ABCD');
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(3,'ABCD'); --> 에러 발생(INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2,'ABCD');)
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST5(COL1) VALUES(4);
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(5,'ABCD'); --> 에러 발생(ORA-00001: unique constraint (HR.SYS_C007096) violated)
 
SELECT *
FROM TBL_TEST5;
--==>>
/*
1	TEST
2	ABCD
3	
4	
*/
```

--○ UK 지정 실습((2) 테이블 레벨의 형식)
``` SQL
-- 테이블 생성
CREATE TABLE TBL_TEST6
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST6_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST6_COL2_UK UNIQUE(COL2)
);
--==>> Table TBL_TEST6이(가) 생성되었습니다.
 
-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST6';
--==>> 
/*
HR	TEST6_COL1_PK	TBL_TEST6	P	COL1		
HR	TEST6_COL2_UK	TBL_TEST6	U	COL2		
*/
-- *UNIQUE는 복합 UNIQUE없음*  
``` 
--○ UK 지정 실습((3) 테이블 생성 이후 제약조건 추가)
``` SQL
-- 테이블 생성
CREATE TABLE TBL_TEST7
( COL1 NUMBER(5)
, COL2 VARCHAR(30)
);
--==>> Table TBL_TEST7이(가) 생성되었습니다.
 
-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST7';
--==>> 조회 결과 없음
 
-- 제약조건 추가
ALTER TABLE TBL_TEST7
ADD CONSTRAINT TEST7_COL1_PK PRIMARY KEY(COL1);
-- +
ALTER TABLE TBL_TEST7
ADD CONSTRAINT TETS7_COL2_UK UNIQUE(COL2);
-- 
ALTER TABLE TBL_TEST7
ADD( CONSTRAINT TEST7_COL1_PK PRIMARY KEY(COL1)
    ,CONSTRAINT TEST7_COL2_UK UNIQUE(COL2));
--==>> Table TBL_TEST7이(가) 변경되었습니다.
 
-- 제약조건 추가 후 다시 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST7';
--==>>
/*
HR	TEST7_COL1_PK	TBL_TEST7	P	COL1		
HR	TEST7_COL2_UK	TBL_TEST7	U	COL2		
*/
```


































| 함수명 | 내용 | 비고 |
| :--- | :---: | ---: |
| 열1 | 열2 | 열3 |
| 열4 | 열5 | 열6 |

<br><br>
*******
<br>

# 작성샘플
## SQL
``` SQL

```
### 하단 설명
-- *하단설명내용*

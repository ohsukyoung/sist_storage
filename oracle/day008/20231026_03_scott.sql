SELECT USER
FROM DUAL;

--■■■ UNION / UNION ALL ■■■--

--** JOIN은  두 개의 테이블을 좌 우   로 결합해서 보는 것
--** UNION은 두 개의 테이블을 위 아래 로 결합해서 보는 것

--○ 실습 테이블 생성(테이블명: TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- 주문 테이블 생성
( JUNO      NUMBER                  -- 주문 번호
, JECODE    VARCHAR2(30)            -- 제품 코드
, JUSU      NUMBER                  -- 주문 수량
, JUDAY     DATE DEFAULT SYSDATE    -- 주문 일자
);
--==>> Table TBL_JUMUN이(가) 생성되었습니다.
-- 고객의 주문이 발생(접수)되었을 경우
-- 주문 내용에 대한 데이터가 입력될 수 있도록 처리하는 테이블

-- 실습 진행 간 제품 코드(JECODE)에는
-- 편의상 제품의 코드를 참조한다고 가정하고 제품의 이름을 입력한다.

--○ 데이터 입력 -> 고객의 주문 발생(접수)
/*INSERT INTO TBL_JUMUN
VALUES(1, '포스틱', 20, TO_DATE('2001-11-01 09:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(2, '빅파이', 10, TO_DATE('2001-11-01 10:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(3, '사또밥', 30, TO_DATE('2001-11-01 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(4, '포카칩', 20, TO_DATE('2001-11-02 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(5, '포카칩', 30, TO_DATE('2001-11-03 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(6, '빅파이', 20, TO_DATE('2001-11-04 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(7, '홈런볼', 10, TO_DATE('2001-11-05 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(8, '홈런볼', 10, TO_DATE('2001-11-06 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(9, '오예스', 20, TO_DATE('2001-11-07 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(10, '사또밥', 10, TO_DATE('2001-11-08 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(11, '빼빼로', 20, TO_DATE('2001-11-09 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(12, '감자깡', 10, TO_DATE('2001-11-10 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(13, '빼빼로', 20, TO_DATE('2001-11-11 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(14, '홈런볼', 20, TO_DATE('2001-11-12 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(15, '포카칩', 10, TO_DATE('2001-11-13 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(16, '포카칩', 20, TO_DATE('2001-11-16 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(17, '마이쮸', 20, TO_DATE('2001-11-17 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(18, '맛동산', 30, TO_DATE('2001-11-18 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(19, '맛동산', 20, TO_DATE('2001-11-19 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(20, '꼬북칩', 30, TO_DATE('2001-11-20 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));
*/
--==>> 1 행 이(가) 삽입되었습니다. * 20

SELECT *
FROM TBL_JUMUN;
/*
1	포스틱	20	2001-11-01
2	빅파이	10	2001-11-01
3	사또밥	30	2001-11-01
4	포카칩	20	2001-11-02
5	포카칩	30	2001-11-03
6	빅파이	20	2001-11-04
7	홈런볼	10	2001-11-05
8	홈런볼	10	2001-11-06
9	오예스	20	2001-11-07
10	사또밥	10	2001-11-08
11	빼빼로	20	2001-11-09
12	감자깡	10	2001-11-10
13	빼빼로	20	2001-11-11
14	홈런볼	20	2001-11-12
15	포카칩	10	2001-11-13
16	포카칩	20	2001-11-16
17	마이쮸	20	2001-11-17
18	맛동산	30	2001-11-18
19	맛동산	20	2001-11-19
20	꼬북칩	30	2001-11-20
*/

--○ 커밋
COMMIT;
--==>> 커밋완료

--○ 날짜에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT *
FROM TBL_JUMUN;
/*
1	포스틱	20	2001-11-01 09:10:10
2	빅파이	10	2001-11-01 10:10:10
3	사또밥	30	2001-11-01 11:10:10
4	포카칩	20	2001-11-02 11:10:10
5	포카칩	30	2001-11-03 11:10:10
6	빅파이	20	2001-11-04 11:10:10
7	홈런볼	10	2001-11-05 11:10:10
8	홈런볼	10	2001-11-06 11:10:10
9	오예스	20	2001-11-07 11:10:10
10	사또밥	10	2001-11-08 11:10:10
11	빼빼로	20	2001-11-09 11:10:10
12	감자깡	10	2001-11-10 11:10:10
13	빼빼로	20	2001-11-11 11:10:10
14	홈런볼	20	2001-11-12 11:10:10
15	포카칩	10	2001-11-13 11:10:10
16	포카칩	20	2001-11-16 11:10:10
17	마이쮸	20	2001-11-17 11:10:10
18	맛동산	30	2001-11-18 11:10:10
19	맛동산	20	2001-11-19 11:10:10
20	꼬북칩	30	2001-11-20 11:10:10
*/

--○ 추가 데이터 입력 -> 2001년 부터 시작된 주문이 현재(2023)까지 계속 발생~!!! 진행중~!!!
INSERT INTO TBL_JUMUN VALUES(98764, '꼬북칩', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98765, '빼빼로', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98766, '빼빼로', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98767, '에이스', 40, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98768, '홈런볼', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98769, '감자깡', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98770, '맛동산', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98771, '웨하스', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98772, '맛동산', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98773, '오레오', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98774, '빼빼로', 50, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98775, '오감자', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.


SELECT *
FROM TBL_JUMUN;
/*
1	    포스틱	20	2001-11-01 09:10:10
2	    빅파이	10	2001-11-01 10:10:10
3	    사또밥	30	2001-11-01 11:10:10
4	    포카칩	20	2001-11-02 11:10:10
5	    포카칩	30	2001-11-03 11:10:10
6	    빅파이	20	2001-11-04 11:10:10
7	    홈런볼	10	2001-11-05 11:10:10
8	    홈런볼	10	2001-11-06 11:10:10
9	    오예스	20	2001-11-07 11:10:10
10	    사또밥	10	2001-11-08 11:10:10
11	    빼빼로	20	2001-11-09 11:10:10
12	    감자깡	10	2001-11-10 11:10:10
13	    빼빼로	20	2001-11-11 11:10:10
14	    홈런볼	20	2001-11-12 11:10:10
15	    포카칩	10	2001-11-13 11:10:10
16	    포카칩	20	2001-11-16 11:10:10
17	    마이쮸	20	2001-11-17 11:10:10
18	    맛동산	30	2001-11-18 11:10:10
19	    맛동산	20	2001-11-19 11:10:10
20	    꼬북칩	30	2001-11-20 11:10:10
98764	꼬북칩	10	2023-10-26 12:46:12
98765	빼빼로	30	2023-10-26 12:46:56
98766	빼빼로	20	2023-10-26 12:47:25
98767	에이스	40	2023-10-26 12:47:52
98768	홈런볼	10	2023-10-26 12:48:16
98769	감자깡	20	2023-10-26 12:48:48
98770	맛동산	10	2023-10-26 12:49:05
98771	웨하스	20	2023-10-26 12:49:26
98772	맛동산	30	2023-10-26 12:49:45
98773	오레오	20	2023-10-26 12:50:08
98774	빼빼로	50	2023-10-26 12:50:30
98775	오감자	10	2023-10-26 12:50:52
*/

--※ 현욱이가 과자 쇼핑몰 운영 중
--   TBL_JUBUN 테이블이 무거워진 상황
--   어플리케이션과의 연동으로 인해 주문 내역을
--   앞으로는 다른 테이블에 저장될 수 있도록 만드는 것은 거의 불가능한 상황.
--   기존의 모든 데이터를 덮어놓고 지우는 것도 불가능한 상황.
--   -> 결과적으로...
--      현재까지 누적된 주문 데이터 중
--      금일 발생한 주문 내역을 제외하고
--      나머지 데이터를 다른 테이블(TBL_JUMUNBAKUP)로
--      데이터를 이관하여 백업을 수행할 계획

--** 데이터가 무거워졌다 -> 수많은 데이터가 쌓였다
--** 데이터가 무거워졌을 때, 새로만는 것이 아니라
--** 기존 데이터를 옮기고 다시 기존 흐름대로 사용한다

--** 기존 데이터를 지우는것은 절대 안됨
--** 쇼핑몰 내역을 확인하거나
--** 반품해야하는 것과 비슷하다

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ 오늘건을 제외한 나머지건을 TBL_JUMUNBACKUP 에 옮기기
SELECT *
FROM TBL_JUMUN
WHERE 금일발생한주문이아닌것;

-- 옮길 테이블 검색
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');

-- 테이블 복사
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');

-- 테이블 삭제
--DROP TABLE TBL_JUMUNBAKUP;

--○ 확인
SELECT *
FROM TBL_JUMUNBACKUP;

-- 테이블 명 수정
--ALTER TABLE TBL_JUMUNBAKUP RENAME TO TBL_JUMUNBACKUP;

--> TBL_JUMUN 테이블의 데이터들 중
--  금일 주문 내역 이외의 데이터는 모두 TBL_JUMUNBACKUP 테이블에
--  백업을 마친 상태~!!!

/* 2-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--  TBL_JUMUN 테이블의 데이터들 중
--  백업을 마친 데이터들... 즉, 금일 발생한 주문 내역이 아닌 데이터들
--  제거
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');

DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');
--==>> 20개 행 이(가) 삭제되었습니다.
--      (93763개 행이 삭제)

--○ 확인
SELECT *
FROM TBL_JUMUN;

-- 커밋
COMMIT;
--==>> 커밋 완료.

--※ 아직 제품 발송이 이루어지지 않은 금일 주문 데이터를 제외하고
--   이전의 모든 주문 데이터들이 삭제된 상황이므로
--   테이블은 행(레코드)의 갯수가 줄어들어 매우 가벼워진 상황이다.

--  그런데, 지금까지 주문받은 내역에 대한 정보를
--  제품별 총 주문량으로 나타내어야 할 상황이 발생하게 되었다.
--  그렇다면, TBL_JUMUNBACKUP 테이블의 레코드(행)와
--  TBL_JUMUN 테이블의 레코드(행)을 모두 합쳐
--  하나의 테이블을 조회하는 것과 같은 결과를 확인할 수 있도록
--  조회가 이루어져야한다.

--※ 컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우
--   JOIN을 사용하지만
--   레코드와 레코드를 결합하고자 하는 경우
--   UNION / UNION ALL 을 사용할 수 있다.

SELECT *
FROM TBL_JUMUNBACKUP;

SELECT *
FROM TBL_JUMUN;

------------------------------------

SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;
--** 현재 상태에서 JUMUN과 JUMUNBACKUP의 값이 같음
------------------------------------

SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;

SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;
--** JUMUN과 JUMUNBACKUP 의 위치를 바꾸면
--** UNION에서 JUMUN이 위에 있을 경우 첫 번째 컬럼을 기준으로 오름차순 진행
--** UNION은 중복된 값이 있는 경우 제외하고 진행
--** UNION ALL은 

--**===================================================================
--** 결론: UNION 을 쓰는 것이 UNION ALL 보다 리소스 소모가 크기 때문에,
--**        실무에서는 UNION ALL을 더 많이 쓴다.
--**===================================================================

--※ UNION 은 항상 결과물의 첫 번째 컬럼을 기준으로
--   오름차순 정렬을 수행한다.
--   반면, UNION ALL 은 결합된 순서(쿼리문에서 테이블을 명시한 순서)대로
--   조회한 결과를 있는 그대로 반환한다. (-> 정렬 없음)
--   이로 인해 UNION 이 부하가 더 크다. (-> 리소스 소모가 더 크다)
--   또한, UNION 은 결과물에 대한 중보된 레코드(행)가 존재할 경우
--   중복을 제거하고 1개 행만 조회된 결과를 반환하게 된다.

--○ 지금가지 주문받은 데이터를 통해
--   제품별 총 주문량을 조회할 수 있는 쿼리문을 구성한다.

--** 총 빼뺴로는 x 개 주문되었고
SELECT JECODE, SUM(JUSU)
FROM (
SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP
)
GROUP BY JECODE HAVING SUM(JUSU) >= 100
ORDER BY 1;

SELECT T.JECODE "제품명", SUM(T.JUSU) "주문량"
FROM (
    SELECT *
    FROM TBL_JUMUN
    UNION ALL
    SELECT *
    FROM TBL_JUMUNBACKUP
) T
GROUP BY T.JECODE
ORDER BY 1;
/*
감자깡	30
꼬북칩	40
마이쮸	20
맛동산	90
빅파이	30
빼빼로	140
사또밥	40
에이스	40
오감자	10
오레오	20
오예스	20
웨하스	20
포스틱	20
포카칩	80
홈런볼	50
*/

--○ INTERSECT / MINUS (교집합 / 차집합)

-- TBL_UMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
-- 제품코드와 주문수량의 값이 똑같은 행만 추출해서 조회하고자 한다.
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

/* 3-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블을 대상으로
--   제품코드와 주문량의 값이 똑같은 행의 정보를
--   주문번호, 제품코드, 주문량, 주문일자 항목으로 조회한다.

--방법1: IN 사용
SELECT *
FROM (
    SELECT *
    FROM TBL_JUMUN
    UNION ALL
    SELECT *
    FROM TBL_JUMUNBACKUP
) T
WHERE (T.JECODE, T.JUSU) IN (
                    SELECT JECODE, JUSU
                    FROM TBL_JUMUNBACKUP
                    INTERSECT
                    SELECT JECODE, JUSU
                    FROM TBL_JUMUN
                );
--방법2: JOIN 사용
SELECT T.JUNO, T.JECODE, T.JUSU, T.JUDAY
FROM 
(
    SELECT *
    FROM TBL_JUMUN
    UNION ALL
    SELECT *
    FROM TBL_JUMUNBACKUP
) T JOIN (
                    SELECT JECODE, JUSU
                    FROM TBL_JUMUNBACKUP
                    INTERSECT
                    SELECT JECODE, JUSU
                    FROM TBL_JUMUN
                ) F
ON T.JECODE = F.JECODE AND T.JUSU = F.JUSU;
ON (T.JECODE, T.JUSU) = (F.JECODE, F.JUSU);
/*
98766	빼빼로	20	2023-10-26 14:52:38
98768	홈런볼	10	2023-10-26 14:52:40
98772	맛동산	30	2023-10-26 14:52:44
7	홈런볼	10	2001-11-05 11:10:10
8	홈런볼	10	2001-11-06 11:10:10
11	빼빼로	20	2001-11-09 11:10:10
13	빼빼로	20	2001-11-11 11:10:10
18	맛동산	30	2001-11-18 11:10:10
*/

/* 3-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 주문번호, 제품코드, 주문량, 주문일자
/*
18	맛동산	30	2001-11-18 11:10:10
98772	맛동산	30	2023-10-26 14:52:44
11	빼빼로	20	2001-11-09 11:10:10
13	빼빼로	20	2001-11-11 11:10:10
98766	빼빼로	20	2023-10-26 14:52:38
7	홈런볼	10	2001-11-05 11:10:10
8	홈런볼	10	2001-11-06 11:10:10
98768	홈런볼	10	2023-10-26 14:52:40
*/
SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUN;
--==>> 조회결과 없음
--** 이유: 주문번호~ 주문일자까지 모두 같은 레코드는 없다. -> 주문일자는 초까지 있음

-- 방법1
SELECT T2.JUSU "주문번호", T1.JECODE "제품코드", T1.JUSU "주문수량", T2.JUDAY "주문일자"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE AND T1.JUSU = T2.JUSU;


-- 방법2
SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
--WHERE T.JUCODE IN ('맛동산', '빼빼로', '홈런볼')
--    AND T.JUSU IN (30,20,10);
--==> x 
--** 맛동산 30,20,10 / 빼빼로 30,20,10 / 홈런볼 30,20,10 모두 나와서 에러상황발생
WHERE T.JECODE 와 T.JUSU의 묶음 결과가 '맛동산30', '빼빼로20', '홈런볼10';

SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(T.JECODE, T.JUSU) IN ('맛동산30', '빼빼로20', '홈런볼10');

SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(T.JECODE, T.JUSU) IN (
                                    SELECT CONCAT(JECODE, JUSU)
                                    FROM TBL_JUMUNBACKUP
                                    INTERSECT
                                    SELECT CONCAT(JECODE, JUSU)
                                    FROM TBL_JUMUN
                                  );
--==>> CONCAT()의 형태로 같게 묶어서 조회하기
--------------------------------------------------------------------------------

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	WARD	1250
30	SALES	TURNER	1500
30	SALES	ALLEN	1600
30	SALES	JAMES	950
30	SALES	BLAKE	2850
30	SALES	MARTIN	1250
*/

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D;
--==>> 에러 발생(ORA-00905: missing keyword)
--** 무엇을 가지고 결합하라는 옵션을 없애버림

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E NATURAL JOIN DEPT D;
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	WARD	1250
30	SALES	TURNER	1500
30	SALES	ALLEN	1600
30	SALES	JAMES	950
30	SALES	BLAKE	2850
30	SALES	MARTIN	1250
*/
--** 쿼리가 실행되는지 확인하기 위해서 NATURAL 조인을 하는 것은 괜찮으나,
--** 오라클에게 알아서 하도록하는 NATRUAL을 사용하게 되면 오라클은 맞는 정보를 찾기위해
--** 불필요한 메모리를 잡아 먹기 때문에, 실제 코드로 사용은 적절하지 않다.

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
USING(DEPTNO);
--** 쿼리 자체는 짧아보일 수 있으나,
--** 오라클은 변환과정을 거치기 때문에 권장하지 않는다.

/* 4-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_EMP 테이블에서 급여가 가장 많은 사원의
--   사원번호, 사원명, 직종명, 급여 항목을 조회한다.
SELECT E.사원번호, E.사원명, E.직종명, E.급여
FROM
(SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명"
      , SAL "급여", RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM TBL_EMP
) E
WHERE E.전체급여순위 =1;
--==>> 7839	KING	PRESIDENT	5000

/* 4-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 급여를 가장 많이 받는 사원의 급여
SELECT MAX(SAL)
FROM TBL_EMP;
--==>> 5000

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL-EMP
WHERE 급여 = (급여를 가장많이 받는 사원의 급여);

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL = (
             SELECT MAX(SAL)
             FROM TBL_EMP
            );
--==>> 7839	KING	PRESIDENT	5000

--** 그룹함수를 쓰지 않더라도 찾을 수 있는 구문
-- <=ANY>

-- <=ALL>

SELECT SAL
FROM TBL_EMP;
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
1500
2000
1700
2500
1000
*/

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL =ANY (800, 1600, 1250, 2975, 1250, 2850, 2450, 3000, 5000, 1500, 1100, 950, 3000, 1300, 1500, 2000, 1700, 2500, 1000);
--*8 괄호 안에 있는 어떤 값이라도 같으면

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL =ALL (800, 1600, 1250, 2975, 1250, 2850, 2450, 3000, 5000, 1500, 1100, 950, 3000, 1300, 1500, 2000, 1700, 2500, 1000);
--** 괄호 안의 모든 값과 같으면

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL >=ALL (800, 1600, 1250, 2975, 1250, 2850, 2450, 3000, 5000, 1500, 1100, 950, 3000, 1300, 1500, 2000, 1700, 2500, 1000);
--** 하나하나의 값과 모두 크거나 같은 값을 찾는 구문

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL >=ALL (SELECT SAL
                 FROM TBL_EMP);
--==>> 7839	KING	PRESIDENT	5000

/* 5-문제 & 내가 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
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
/* 5-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL = (가장많은급여)
  AND DEPTNO = 20;

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM TBL_EMP)       --**20번 부서 상관없이 가장 많은 급여를 받는 사원 --> 5000
  AND DEPTNO = 20;

-- 방법1
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM TBL_EMP
            WHERE DEPTNO = 20) -- 'WHERE DEPTNO = 20'는 꼭 필요한 구문
  AND DEPTNO = 20;

-- 방법2
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE SAL >=ALL (SELECT SAL
                 FROM TBL_EMP
                 WHERE DEPTNO = 20) -- (800, 2975, 3000, 1100, 3000)
  AND DEPTNO = 20;
/*
7902	FORD	ANALYST	3000
7788	SCOTT	ANALYST	3000
*/
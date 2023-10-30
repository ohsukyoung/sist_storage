SELECT USER
FROM DUAL;
--==>> HR

--■■■ 정규화(Normalization) ■■■--
-- *웹 개발자관점에서 중요도는 낮지만, FINAL PJ에서 가장 핵심이 되는 부분이고 DBA에게 정말 중요하다!!!*

--○ 정규화란?  
--   한 마디로 데이터베이스 서버의 메모리 낭비를 막기 위해  
--   어떤 하나의 테이블을... 식별자를 가지는 여러 개의 테이블로 **나누는 과정**을 말한다. 
  
-- *특정컬럼 값이 필요할때 테이블을 가져다 쓸텐데, 메모리는 특정값만 가져오는게 아니라 테이블 전체를 퍼올리기 때문에*  
-- *테이블이 작을 수록 메모리 낭비가 적어진다.*  
  
-- ex) 윤수가... 옥장판을 판매한다.  
--     고객리스트 -> 거래처 직원 명단이 적혀있는 수첩의 정보를 데이터베이스화 하려고 한다.  
  
-- 테이블명: 거래처직원  
/*
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

가정) 서울 여의도 LG(본사)라는 회사에 근무하는 거래처 직원 명단이 총 100만 명이라고 가정한다.  
      (한 행(레코드)은 70Byte)  
        
      어느 날... <서울여의도>에 위치한 LG 본사가 <경기분당>으로 사옥을 이전하게 되었다.  
      회사주소는 <경기분당>으로 바뀌고, 회사전화는 <031-111-2222>로 바뀌게 되었다.  
        
      그러면... 100만 명의 회사주소와 회사전화를 변경해야 한다.  
        
      -- 이 때 수행되어야 할 쿼리문 -> UPDATE  
      
      UPDATE 거래처직원  
      SET 회사주소 = '경기분당', 회사전화 = '031-111-2222'  
      WHERE 거래처회사명 = 'LG' AND 회사주소 = '서울여의도';  
      
      -- 100만 개 행을 하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다.  
         즉, 100만 * 70Byte 를 모두  
         하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다는 말이다.  
         
         -> 이는 테이블의 설계가 잘못되었으므로  
            DB 서버는 조만간 메모리 고갈로 인해 DOWN 될 것이다.  
                  
                -> 그러므로 정규화 과정을 수행해야 한다.  
*/

-- *여러가지 정규화(제7정규형까지, 제6정규형까지..)가 있지만, 우리는 실무를 기준으로 정규화를 볼 예정*   
-- 제 1 정규화(형)  
    --> 어떤 하나의 테이블에 반복되는 컬럼 값들이 존재한다면  
    --  값들이 **반복되어 나오는 컬럼**을 **분리**하여 새로운 테이블을 만들어준다.  
/*
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
*/
    --> 제 1 정규화를 수행하는 과정에서 분리된 테이블은 반드시 부모테이블과 자식 테이블이 관계를 갖게 된다.
    -- *무결성: 결점이 없다.*
    -- *관계형 DB의 경우 특정한 부분에서 결점이 있다고 하더라도, 참조하고 있는 테이블이 있기 때문에 전반적으로 신뢰성이 떨어진다.*
    
                                    -- 제약조건
    --> 부모 테이블 -> 참조받는 컬럼 -> PRIMARY KEY(기본키, 고유키)
    --  자식 테이블 -> 참조하는 컬럼 -> FOREIGN KEY(외래키, 참조키)
    
    --※ 참조받는 컬럼이 갖는 특징  
    --   반드시 고유한 값(데이터)만 들어와야 한다. 즉, 중복된 값(데이터)이 있어서는 안된다.
    --   또한, 비어있으면(NULL이 있어서는) 안된다. 즉, NOT NULL 이어야 한다.
    
    --> 제 1 정규화를 수행하는 과정에서 부모테이블의 PRIMARY KEY 는 항상 자식 테이블의 FOREIGN KEY 로 전이된다.
    
    -- *========================================================================*
    -- *결론: 정규화는 쪼개는 것*  
    -- *제 1 정규화는 반복된 내용을 쪼개는 것이다.*  
    -- *부모테이블에는 참조받는 컬럼(PRIMARY KEY,중복x,비어있음x)*  
    -- *자식테이블에는 참조하는 컬럼(부모의 PK를 참조하는 FOREIGN KEY)*  
    -- *========================================================================*
    
    -- 테이블이 분리(분할)되기 이전 상태로 조회  
    -- *JOIN을 통해서 조회*  
    /*
    SELECT A.거래처회사명, A.회사주소, A.회사전화
         , B.거래처직원명, B.직급, B.이메일, B.휴대폰
    FROM 회사 A, 직원 B
    WHERE A.회사ID = B.회사ID;
    */
    
    /*
    가정) 서울 여의도 LG(본사)라는 회사에 근무하는 거래처 직원 명단이 총 100만 명이라고 가정한다.  
      -- [삭제](한 행(레코드)은 70Byte)  
        
      어느 날... <서울여의도>에 위치한 LG 본사가 <경기분당>으로 사옥을 이전하게 되었다.  
      회사주소는 <경기분당>으로 바뀌고, 회사전화는 <031-111-2222>로 바뀌게 되었다.  
        
      -- [수정전]그러면... 100만 명의 회사주소와 회사전화를 변경해야 한다. 
      -- [수정후]그러면... 회사 1건의 회사주소와 회사전화를 변경해야 한다. 
        
      -- 이 때 수행되어야 할 쿼리문 -> UPDATE  
      
      -- [수정전]
      UPDATE 거래처직원  
      SET 회사주소 = '경기분당', 회사전화 = '031-111-2222'  
      WHERE 거래처회사명 = 'LG' AND 회사주소 = '서울여의도';  
      --                    ↓
      -- [수정후]
      UPDATE 회사
      SET 회사주소 = '경기분당', 회사번화 = '031-111-2222'
      WHERE 회사ID = 10;
      
      -- [수정전]100만 개 행을 하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다.  
      -- [수정후]1 개 행을 하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다.  
         [수정전]즉, 100만 * 70 Byte 를 모두  
         [수정후]즉, 1 * 40 Byte 를 모두  
         하드디스크상에서 읽어서 메모리에 로드시켜 주어야 한다는 말이다.  
         
         -> 정규화 이전에는 100만 건을 처리해야 할 업무에서
            1건만 처리하면 되는 업무로 바뀐 상황이기 때문에
            DB 서버는 메모리 고갈이 일어나지 않고 아주 빠르게 처리될 것이다.
            
    --      [정규화 이후]                 |         [정규화 이전]
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
    
    */
    
-- 테이블명 : 주문
/*
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
*/
/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 위의 주문 테이블에서 PK로 해야하는 키는?
-- 고객ID   일 경우: 고객1이 더이상 구매X
-- 제품코드 일 경우: 제품코드1이 더이상 판매X
-- 고객ID + 제품코드 일 경우: 고객이 제품을 한번밖에 구매못함
-- 고객ID + 제품코드 + 주문일자 일 경우: 같은값 2개 일때?
    -- UJY1234(엄재용)     P-KKBK(꿀꽈배기)  2023-10-30 07:20:31     20
    -- UJY1234(엄재용)     P-KKBK(꿀꽈배기)  2023-10-30 07:20:31     20
    --------------------------------------------------------------------
    -- UJY1234(엄재용)     P-KKBK(꿀꽈배기)  2023-10-30 07:20:31     40 -> 으로 구성되기 때문에 3개로 복합 PK 가능

-- *PK는 1개만 가능*
-- *제약조건을 구성하는 컬럼은 여러개가 될 수 있음*

-- ※ 하나의 테이블에 존재하는 PRIMARY KEY 의 최대 갯수는 1개이다.
--    하지만, PRIMARY KEY 를 이루는(구성하는) 컬럼의 갯수는 복수(여러개)인 것이 가능하다.
--    컬럼 1개로만 구성된 PRIMARY KEY 를 SINGLE PRIMARY KEY 라고 부른다.
--    (단일 프라이머리 키)
--    두 개 이상의 컬럼으로 구성된 PRIMARY KEY 를 COMPOSITE PRIMARY KEY 라고 부른다.
--    (복합 프라이머리 키)
-- *복합 프라이머리 키는 개념적으론 가능하나, 권장하지는 않음*
    
-- 제 2 정규화(형)  
    --> 제 1 정규화를 마친 결과물에서 PRIMARY KEY 가 SINGLE COLUMN 이라면 제 2 정규화는 수행하지 않는다.  
    -- 하지만, PRIMARY KEY 가 COMPOSITE COLUMN 이라면 반.드.시. 제 2 정규화를 수행해야 한다.  
    
    --> 식별자가 아닌 컬럼은 식별자 전체 컬럼에 대해 의존적이어야 하는데
    --  식별자 전체 컬럼이 아닌 일부 식별자 컬럼에 대해서만 의존적이라면
    --  이를 분리하여 새로운 테이블을 생성해 준다.
    --  이 과정을 제 2 정규화라 한다.
    
/*
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
*/

/*
 -- 테이블명: 과목
 과목번호   과목명     과목설명    필수여부    구성학점
 
 
 -- 테이블명: 교수
 교수번호   교수자명    주민번호    주소  사용교수실   ...

*/
-- 제 3 정규화(형)  
--> 식별자가 아닌 컬럼이 식별자가 아닌 컬럼에 의존적인 상황이라면
--  이를 분리하여 새로운 테이블을 생성해 주어야 한다.
--  이 과정을 제 3 정규형이라 한다.

-- *강의실 설명은 강의실코드에 의존적-> 식별자 아닌 칼럼이 식별자 아닌 컬럼에 의존적*

    -- *========================================================================*
    -- *결론: 정규화는 분리하는 것(쪼개는 것)*
    -- * DB 서버의 메모리 낭비를 막기위해 분리함
    -- * 너무 분리하게 되면 원래 형태의 표로 만들기가 불가능해서 식별자를 갖게끔 분리하는 것이 중요하다.
    
    -- * 정규화는 절차와 순서가 있기 때문에 의 규칙대로 단계별로 수행하는 것이 좋다
    -- * 꼭 1-2-3-4 - 역정규화 순서대로 해야한다
    
    -- 제 1정규화는 특정 컬럼의 값이 중복된 내용을 분리하는 것이고, 수행한 결과물은 부모와 자식으로 나뉘어짐 ex. lg-회사 
    -- 부모테이블의 참조하는 키는 P.K, 참조 받는 키는 F.K
    -- 제약조건 P.K는 테이블당 1개를 갖는다.(unique & not null) P.K가 없는 것은 존재하나 최대 1개 가질 수 있다.
    -- 하나의 P.K를 갖고 있을 경우 복합 P.K 라고 한다.
    
    -- 단일 정규형으로 수행되는 테이블은 정규화 실행x
    -- 복합 P.K로 구성된 경우 문제가 있을 경우가 있어서 제 2 정규화 진행
    
    -- 제 2정규화는 복합 F.K로 의존적인 테이블을 정규화 진행 ex. 과목번호- 과목명, 교수번호-교수자명
    -- 제 3정규화는 식별자가 아닌 컬럼이 식별자가 아닌 컬럼을 참조할 때 정규화 진행 ex. 강의실설명
    
    -- *========================================================================*
    
--※ 관계(Relation)의 종류
     
    -- 1 : 다(many)
        --> 제 1 정규화를 적용하여 수행을 마친 결과물에서 나타나는 바람직한 관계.
        -- 관계형 데이터베이스를 활용하는 과정에서 추구해야 하는 관계.
    
    -- 1 : 1
        --> 논리적, 물리적으로 존재할 수 있는 관계이긴 하지만
        --  관계형 데이터베이스 설계 과정에서 가급적이면 피해야 할 관계.
        -- *구태여 1:1이어야 하는지 확인해야하는 관계*
    
    -- 다 : 다
        --> 논리적인 모델에서는 존재할 수 있지만
        --  실제 물리적인 모델링에서는 존재할 수 없는 관계.
    
/* 
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
*/
-- *다:다가 논리적으로 존재할 수 있으나, 위의 테이블에서 실행되기 어렵다*

-- 제 4 정규화(형)  
    --> 위에서 확인한 내용과 같이 <many(다) : many(다)> 관계를
    --  <1(일) : many(다)> 관계로 꺠뜨리는 과정이 바로 제 4정규화 수행 과정이다.
    --  -> 파생 테이블 생성 -> 다:다 관계를 1:다 관계로 깨뜨리는 역할 수행. ex. 주문-수강신청
    
    -- *성적표에 수강신청이 없다고 해서, 실제 코드 내에 수강신청코드가 없다고 생각하면 안됨*
    /*
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
    */

-- 역정규화(비정규화)(형)  
-- *정규화는 나누고 쪼개고 분리, 역정규화는 정규화를 역행(합치는) 것*    
-- *역정규화를 해야하는지 아닌지는 업무파악을 꼼꼼히 해야 가능*  

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
    
    --> <부서> 테이블과 <사원> 테이블을 JOIN 했을 때의 크기
    --  (10 * 30 Byte) + (1000000 * 60Byte) = 300 + 600000000 = 360000300 Byte
    
    --> <사원> 테이블을 역정규화 한 후 이 테이블만 읽어올 때의 크기
    --  (즉, 부서 테이블의 부서명 컬럼을 사원 테이블에 추가한 경우)
    --  10000000 * 70 Byte = 70000000 Byte
    
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
    
    --> <부서> 테이블과 <사원> 테이블을 JOIN 했을 때의 크기
    --  (500000 * 30 Byte) + (1000000 * 60Byte) = 15000000 + 60000000 = 75000000 Byte
    
    --> <사원> 테이블을 역정규화 한 후 이 테이블만 읽어올 때의 크기
    --  (즉, 부서 테이블의 부서명 컬럼을 사원 테이블에 추가한 경우)
    --  10000000 * 70 Byte = 70000000 Byte
    
    -- *부모테이블과 자식테이블의 레코드수가 차이가 크면 정규화를 하는게 나은 방법
    -- *                                     차이가 크지 않으면 정규화를 안 하는게 나은 방법

--------------------------------------------------------------------------------

/*
1. 도메인이자 원자값
2. 부분적 함수 제거
3. 이행 함수 제거
bcnf. 결정자 이자 후보키 제거
4. 다치 종속 제거
5. 조인 종속 제거
*/

--※ 참고
/*
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
        
*/

--------------------------------------------------------------------------------

-- *참고*  
--■■■ 무결성(Integrity) ■■■--  
/*
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
*/

--■■■ PRIMARY KEY ■■■--

-- 1. 테이블에 대한 기본 키를 생성한다.
-- 2. 테이블에서 각 행을 유일하게 식별하는 컬럼 또는 컬럼의 집합이다.
--      기본 키는 테이블 당 하나만 존재한다.
--      그러나 반드시 하나의 컬럼만으로 구성된 것은 아니다.
--      NULL 일 수 없고, 이미 테이블에 존재하고 있는 데이터를
--      다시 입력할 수 없도록 처리한다.(유일성)
--      UNIQUE INDEX가 오래클 내부적으로 자동으로 생성된다.

-- 3. 형식 및 구조
-- *[BRAKET]컬럼의 이름은 생략가능
-- (1) 컬럼 레벨의 형식
--      컬럼명, 데이터타입[CONSTRACT CONSTRATIONT명] PRIMARY KEY(컬럼명,...)]

-- (2) 테이블 레벨의 형식
--      컬럼명의 데이터타입,
--      컬럼명의 데이터타입,
--      CONSTRATINT CONASTRAINT명 PRIMARY KEY(컬럼명,...)
-- *특별한 코멘트가 없는 한, 테이블 레벨형식으로 이름_컬럼명구조*  

-- 4. CONSTRAINT 추가 시 CONSTRAINT 명을 생략하면
--      오라클 서버가 자동적으로 CONSTRAINT명을 부여한다.
--      일반적으로 CONSTRAINT명은 <테이블명_컬럼명_CONSTRAINT약자>
--      형식으로 기술한다.

-- ○ PK 지정 실습((1) 컬럼 레벨의 형식)
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

-- 커밋
COMMIT;
--==>> 커밋 완료.

--※ 제약조건 확인
SELECT *
FROM USER_CONSTRAINTS;
--==>>
/*
OWNER	CONSTRAINT_NAME	CONSTRAINT_TYPE	TABLE_NAME	SEARCH_CONDITION	R_OWNER	R_CONSTRAINT_NAME	DELETE_RULE	STATUS	DEFERRABLE	DEFERRED	VALIDATED	GENERATED	BAD	RELY	LAST_CHANGE	INDEX_OWNER	INDEX_NAME	INVALID	VIEW_RELATED
HR	SYS_C004102	O	EMP_DETAILS_VIEW					ENABLED	NOT DEFERRABLE	IMMEDIATE	NOT VALIDATED	GENERATED NAME			2014-05-29				
HR	JHIST_DATE_INTERVAL	C	JOB_HISTORY	end_date > start_date				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_JOB_NN	C	JOB_HISTORY	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_END_DATE_NN	C	JOB_HISTORY	"END_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_START_DATE_NN	C	JOB_HISTORY	"START_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_EMPLOYEE_NN	C	JOB_HISTORY	"EMPLOYEE_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_SALARY_MIN	C	EMPLOYEES	salary > 0				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_JOB_NN	C	EMPLOYEES	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_HIRE_DATE_NN	C	EMPLOYEES	"HIRE_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_EMAIL_NN	C	EMPLOYEES	"EMAIL" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_LAST_NAME_NN	C	EMPLOYEES	"LAST_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JOB_TITLE_NN	C	JOBS	"JOB_TITLE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_NAME_NN	C	DEPARTMENTS	"DEPARTMENT_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	LOC_CITY_NN	C	LOCATIONS	"CITY" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	COUNTRY_ID_NN	C	COUNTRIES	"COUNTRY_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	REGION_ID_NN	C	REGIONS	"REGION_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_EMP_FK	R	JOB_HISTORY		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_MGR_FK	R	DEPARTMENTS		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_MANAGER_FK	R	EMPLOYEES		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_JOB_FK	R	JOB_HISTORY		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_JOB_FK	R	EMPLOYEES		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_DEPT_FK	R	JOB_HISTORY		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_DEPT_FK	R	EMPLOYEES		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_LOC_FK	R	DEPARTMENTS		HR	LOC_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	LOC_C_ID_FK	R	LOCATIONS		HR	COUNTRY_C_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	COUNTR_REG_FK	R	COUNTRIES		HR	REG_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	COUNTRY_C_ID_PK	P	COUNTRIES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	COUNTRY_C_ID_PK		
HR	DEPT_ID_PK	P	DEPARTMENTS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	DEPT_ID_PK		
HR	EMP_EMAIL_UK	U	EMPLOYEES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	EMP_EMAIL_UK		
HR	EMP_EMP_ID_PK	P	EMPLOYEES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	EMP_EMP_ID_PK		
HR	JHIST_EMP_ID_ST_DATE_PK	P	JOB_HISTORY					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	JHIST_EMP_ID_ST_DATE_PK		
HR	JOB_ID_PK	P	JOBS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	JOB_ID_PK		
HR	LOC_ID_PK	P	LOCATIONS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	LOC_ID_PK		
HR	REG_ID_PK	P	REGIONS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	REG_ID_PK		
HR	SYS_C007091	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			2023-10-30	HR	SYS_C007091		*/
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='TBL_TEST1';
--==>> HR	SYS_C007091	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			2023-10-30	HR	SYS_C007091		

--※ 제약조건이 지정된 컬럼 확인(조회)
SELECT *
FROM USER_CONS_COLUMNS;
--==>> 
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	COLUMN_NAME	POSITION
HR	SYS_C007091	TBL_TEST1	COL1	1
HR	REGION_ID_NN	REGIONS	REGION_ID	
HR	REG_ID_PK	REGIONS	REGION_ID	1
HR	LOC_CITY_NN	LOCATIONS	CITY	
HR	LOC_ID_PK	LOCATIONS	LOCATION_ID	1
HR	LOC_C_ID_FK	LOCATIONS	COUNTRY_ID	1
HR	JHIST_EMPLOYEE_NN	JOB_HISTORY	EMPLOYEE_ID	
HR	JHIST_START_DATE_NN	JOB_HISTORY	START_DATE	
HR	JHIST_END_DATE_NN	JOB_HISTORY	END_DATE	
HR	JHIST_JOB_NN	JOB_HISTORY	JOB_ID	
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	START_DATE	
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	END_DATE	
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	EMPLOYEE_ID	1
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	START_DATE	2
HR	JHIST_JOB_FK	JOB_HISTORY	JOB_ID	1
HR	JHIST_EMP_FK	JOB_HISTORY	EMPLOYEE_ID	1
HR	JHIST_DEPT_FK	JOB_HISTORY	DEPARTMENT_ID	1
HR	JOB_TITLE_NN	JOBS	JOB_TITLE	
HR	JOB_ID_PK	JOBS	JOB_ID	1
HR	EMP_LAST_NAME_NN	EMPLOYEES	LAST_NAME	
HR	EMP_EMAIL_NN	EMPLOYEES	EMAIL	
HR	EMP_HIRE_DATE_NN	EMPLOYEES	HIRE_DATE	
HR	EMP_JOB_NN	EMPLOYEES	JOB_ID	
HR	EMP_SALARY_MIN	EMPLOYEES	SALARY	
HR	EMP_EMAIL_UK	EMPLOYEES	EMAIL	1
HR	EMP_EMP_ID_PK	EMPLOYEES	EMPLOYEE_ID	1
HR	EMP_DEPT_FK	EMPLOYEES	DEPARTMENT_ID	1
HR	EMP_JOB_FK	EMPLOYEES	JOB_ID	1
HR	EMP_MANAGER_FK	EMPLOYEES	MANAGER_ID	1
HR	DEPT_NAME_NN	DEPARTMENTS	DEPARTMENT_NAME	
HR	DEPT_ID_PK	DEPARTMENTS	DEPARTMENT_ID	1
HR	DEPT_LOC_FK	DEPARTMENTS	LOCATION_ID	1
HR	DEPT_MGR_FK	DEPARTMENTS	MANAGER_ID	1
HR	COUNTRY_ID_NN	COUNTRIES	COUNTRY_ID	
HR	COUNTRY_C_ID_PK	COUNTRIES	COUNTRY_ID	1
HR	COUNTR_REG_FK	COUNTRIES	REGION_ID	1*/

SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>> 
/*
OWNER	CONSTRAINT_NAME	TABLE_NAME	COLUMN_NAME	POSITION
HR	    SYS_C007091	    TBL_TEST1	COL1	    1
*/

/* 1-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ USER_CONSTRAINTS 와 USER_CONS_COLUMNS 를 대상으로
--   제약조건이 설정된 내용에 대해서
--   소유주, 제약조건명, 테이블명, 제약조건종류, 컬럼명 항목을 조회한다.

-- 1992
SELECT UC.OWNER "소유주", UC.CONSTRAINT_NAME "제약조건명", UC.TABLE_NAME "테이블명", UC.CONSTRAINT_TYPE "제약조건종류", UCC.COLUMN_NAME "컬럼명"
FROM USER_CONSTRAINTS UC , USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007091	TBL_TEST1	P	COL1

-- 1999
SELECT UC.OWNER "소유주", UC.CONSTRAINT_NAME "제약조건명", UC.TABLE_NAME "테이블명", UC.CONSTRAINT_TYPE "제약조건종류", UCC.COLUMN_NAME "컬럼명"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007091	TBL_TEST1	P	COL1

/* 2-문제 & 함께 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- ○ PK 지정 실습((2) 테이블 레벨의 형식)
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

--○ 커밋
COMMIT;
--==>> 커밋 완료

--○ USER_CONSTRAINTS 와 USER_CONS_COLUMNS 를 대상으로
--   제약조건이 설정된 내용에 대해서
--   소유주, 제약조건명, 테이블명, 제약조건종류, 컬럼명 항목을 조회한다.
SELECT UC.OWNER "소유주", UC.CONSTRAINT_NAME "제약조건명", UC.TABLE_NAME "테이블명", UC.CONSTRAINT_TYPE "제약조건종류", UCC.COLUMN_NAME "컬럼명"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST2';
--==>> HR	TEST2_COL1_PK	TBL_TEST2	P	COL1
-- *제약조건명이 오라클이 임의부여한 이름이 아닌, 우리가 지정한 이름으로 부여되어 있음*  

--○ PK 지정 실습((3) 다중 컬럼 PK 지정)
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

--○ PK 지정 실습((4) 테이블 생성 이후 제약조건 추가 설정)
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

-- *FOREIGN KEY는 나중에 볼 것*
--------------------------------------------------------------------------------

--■■■ UNIQUE(UK:U) ■■■--
-- 1. 테이블에서 지정한 컬럼의 데이터가 중복되지 않고 유일할 수 있도록 설정하는 제약조건.  
--      PRIMARY KEY 와 유사한 제약조건이지만, **NULL을 허용**한다는 차이점이 있다.  
--      내부적으로 PRIMARY KEY와 마찬가지로 UNIQUE INDEX 가 자동 생성된다.  
--      **하나의 테이블 내**에서 **UNIQUE 제약조건은 여러 번 설정하는 것이 가능**하다.  
--      즉, 하나의 테이블에 UNIQUE 제약조건을 여러 개 만드는 것은 가능하다는 것이다.  
-- *UNIQUE에는 NOT NULL제약조건이 포함되어있지 않다.*  
/* 
--회원 테이블
회원번호    아이디     패스워드    성명  주민번호 휴대폰번호 우편번호 주소1 주소2
P.K        P.K(X)/U                         U        U
*/


-- 2. 형식 및 구조
-- (1) 컬럼 레벨의 형식
-- 컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명] UNIQUE

-- (2) 테이블 레벨의 형식
-- 컬럼명 데이터타입,
-- 컬럼명 데이터타입,
-- CONSTRAINT CONSTARINT명 UNIZUE(컬럼명,...)

--○ UK 지정 실습((1) 컬럼 레벨의 형식)
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

COMMIT;
--==>> 커밋 완료.

--○ UK 지정 실습((2) 테이블 레벨의 형식)
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

--○ UK 지정 실습((3) 테이블 생성 이후 제약조건 추가)
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

--------------------------------------------------------------------------------
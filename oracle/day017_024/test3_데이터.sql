-- 데이터 입력
-- 1. 관리자 데이터
EXEC PRC_ADMIN_PW ('M'||LPAD(TO_CHAR(SEQ_M.NEXTVAL), 3, '0'), '채다선', 'CDS','961023-2222222');

-- 관리자 데이터 업데이트
EXEC PRC_ADMIN_UPDATE('M001', '채다선', '961023');

SELECT *
FROM ADMIN;

--2. 교수 데이터
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '오수경', 'OSK','941111-2222223', '010-1111-1111');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '박가영', 'PKY','951010-2222224', '010-2222-2222');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '김경태', 'KKT','991111-1111111', '010-3333-3333');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '박범구', 'PPK','981111-1111112', '010-4444-4444');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '김수환', 'KSH','951212-1111113', '010-5555-5555');

-- 교수 데이터 업데이트
EXEC PRC_PROF_UPDATE('P001', '오수경', '2222223', '010-1111-2222');


--3. 학생 데이터
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '홍길동', 'STUDENT_01', '771212-1022432', '01123564528');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이순신', 'STUDENT_02', '801007-1544236', '01047586532');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이순애', 'STUDENT_03', '770922-2312547', '01042311236');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '김정훈', 'STUDENT_04', '790304-1788896', '01952364221');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '한석봉', 'STUDENT_05', '811112-1566789', '01852113542');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이기자', 'STUDENT_06', '780505-2978541', '01032145357');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '장인철', 'STUDENT_07', '780506-1625148', '01123452525');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '김영년', 'STUDENT_08', '821011-2362514', '01622224444');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '나윤균', 'STUDENT_09', '810810-1552147', '01911112222');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '김종서', 'STUDENT_10', '751010-1122233', '01132145555');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '유관순', 'STUDENT_11', '801010-2987897', '01088884422');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '정한국', 'STUDENT_12', '760909-1333333', '01822224242');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '조미숙', 'STUDENT_13', '790102-2777777', '01966664444');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '황진이', 'STUDENT_14', '810707-2574812', '01032145467');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이현숙', 'STUDENT_15', '800606-2954687', '01625483365');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이상헌', 'STUDENT_16', '781010-1666678', '01045261234');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '엄용수', 'STUDENT_17', '820507-1452365', '01032542542');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이성길', 'STUDENT_18', '801028-1849534', '01813333333');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '박문수', 'STUDENT_19', '780710-1985632', '01747474848');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '유영희', 'STUDENT_20', '800304-2741258', '01195958585');

-- 학생 데이터 업데이트
EXEC PRC_STUDENTS_UPDATE('S020', '유영희', '2741258', '01095958585');

SELECT *
FROM STUDENTS;

--4. 강의실 데이터
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'F강의실');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'C강의실');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'G강의실');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'H강의실');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'A강의실');



--5. 교재 데이터
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '채쌤의 자바 프로그래밍 핵심');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '오라클로 배우는 데이터베이스 개론과 실습');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '자바의 정석');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), 'HTML + CSS + 자바스크립트 웹 표준의 정석');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '스프링 5 마스터');



--6. 과목 데이터
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Java');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Oracle Database');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'HTML/CSS/JavaScript');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Spring Framework');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'JSP');



--7. 과정 데이터
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java를 활용한 Full-Stack개발자 양성과정');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), '자바_스프링 기반 빅데이터 Full-stack 개발자 양성과정');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java(자바)_AWS 활용한 Full-Stack 개발자 양성과정(A)');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java(자바)_AWS 활용한 Full-Stack 개발자 양성과정(B)');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), '자바(Java)기반 Web_스마트플랫폼 Full-Stack 개발자 양성과정');


--8. 개설과정 데이터 과정 룸 교수
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'CR001', 'CL001', 'P001');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD') , TO_DATE('2024-08-08', 'YYYY-MM-DD'), 'CR002', 'CL002', 'P002');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-01-15', 'YYYY-MM-DD') , TO_DATE('2024-08-07', 'YYYY-MM-DD') , 'CR003', 'CL003', 'P003');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-11-13', 'YYYY-MM-DD') , TO_DATE('2024-06-10', 'YYYY-MM-DD'), 'CR004', 'CL004', 'P004');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR005', 'CL005', 'P005');
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 5, 5, 5);  -- 같은 과정정보
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 1, 5, 5);  -- 같은 강의실, 교수, 과정기간 / 다른 과정
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 1, 1, 5);    -- 같은 과정기간, 교수 / 다른 과정, 강의실
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 1, 1, 1);    -- 같은 과정기간 / 다른 과정, 강의실, 교수
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-27' ,'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 1, 1, 5);

-- 개설과정 업데이트 데이터
EXEC PRC_CR_DETAIL_UPDATE('CD200', TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'CR001', 'CL001', 'P001');


--9. 개설과목 데이터 과목 교재 개설과정
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14','YYYY-MM-DD'), TO_DATE('2024-04-25','YYYY-MM-DD'), 'SJ001', 'BK001', 'CD001');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-04-26','YYYY-MM-DD'), TO_DATE('2024-06-27','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD001');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-03-11','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD002');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-03-12','YYYY-MM-DD'), TO_DATE('2024-08-08', 'YYYY-MM-DD'), 'SJ003', 'BK003', 'CD002');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-15','YYYY-MM-DD'), TO_DATE('2024-03-05','YYYY-MM-DD'), 'SJ001', 'BK001', 'CD003');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-03-06','YYYY-MM-DD'), TO_DATE('2024-05-05','YYYY-MM-DD'), 'SJ003', 'BK003', 'CD003');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-11-13','YYYY-MM-DD'), TO_DATE('2024-01-15','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD004');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-03-11','YYYY-MM-DD'), 'SJ004', 'BK004', 'CD004');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21','YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'SJ001', 'BK001', 'CD005');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-10-16','YYYY-MM-DD'), TO_DATE('2023-12-25','YYYY-MM-DD'), 'SJ003', 'BK003', 'CD005');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-12-26','YYYY-MM-DD'), TO_DATE('2024-03-18','YYYY-MM-DD'), 'SJ005', 'BK005', 'CD005');

--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-08-22','YYYY-MM-DD'), TO_DATE('2024-10-05','YYYY-MM-DD'), 1, 1, 1); -- 중복된 과목, 중복된 과목기간
--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-08-22','YYYY-MM-DD'), TO_DATE('2024-10-05','YYYY-MM-DD'), 2, 1, 1); -- 중복된 과목기간
--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14','YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 1, 1, 1); -- 중복된 과목, 중복된 과정


-- 개설과목 업데이트 데이터
EXEC PRC_SUB_DETAIL_UPDATE('SD200', TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'SJ001', 'BK001', 'CD005');


--9. 개설과목(배점) 데이터 개설과목코드
EXEC PRC_SD_UPDATE('SD001', 20, 40, 40);
EXEC PRC_SD_UPDATE('SD002', 40, 40, 20);
EXEC PRC_SD_UPDATE('SD003', 30, 40, 30);
EXEC PRC_SD_UPDATE('SD004', 30, 35, 35);
EXEC PRC_SD_UPDATE('SD005', 40, 20, 40);
EXEC PRC_SD_UPDATE('SD006', 20, 40, 40);
EXEC PRC_SD_UPDATE('SD007', 40, 40, 20);
EXEC PRC_SD_UPDATE('SD008', 30, 40, 30);
EXEC PRC_SD_UPDATE('SD009', 30, 35, 35);
EXEC PRC_SD_UPDATE('SD010', 40, 20, 40);
EXEC PRC_SD_UPDATE('SD011', 40, 20, 40);


--10. 수강신청 데이터 과정개설코드 학생코드
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S001');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S002');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S003');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S004');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S005');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S006');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S007');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S008');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S009');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S010');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S011');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S012');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S013');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S014');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S015');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S016');

SELECT *
FROM SCORE;

ROLLBACK;

SELECT *
FROM SUB_DETAIL;

CREATE OR REPLACE VIEW APPLYED_VIEW
AS
SELECT S.STD_NO "학생코드", S.STD_NAME "학생명", S.SUBJECT_NAME "과목명", SD.SUB_BEGIN ||' ~ '||SD.SUB_END "과목기간"
     , A.APPLY_NO "수강코드", SD.SUB_NO "개설과목코드"
FROM STUDENTS S JOIN APPLY A
  ON S.STD_NO = A.STD_NO
    JOIN CR_DETAIL CD
      ON CD.CR_NO = A.CR_NO
        JOIN SUB_DETAIL SD
          ON CD.CR_NO = SD.CR_NO
            JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO;
              
SELECT *
FROM APPLYED_VIEW1;

CREATE OR REPLACE VIEW POSSIBE_VIEW
AS
SELECT S.STD_NO "학생코드", S.STD_NAME "학생명", S.SUBJECT_NAME "과목명", SD.SUB_BEGIN ||' ~ '||SD.SUB_END "과목기간"
     , A.APPLY_NO "수강코드", SD.SUB_NO "개설과목코드", (SD.SUB_END || '~' || SD.SUB_END+7 ||'까지') " 성적처리가능일자"
FROM STUDENTS S JOIN APPLY A
  ON S.STD_NO = A.STD_NO
    JOIN CR_DETAIL CD
      ON CD.CR_NO = A.CR_NO
        JOIN SUB_DETAIL SD
          ON CD.CR_NO = SD.CR_NO
            JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO
WHERE SD.SUB_END < SYSDATE AND  SYSDATE <= SD.SUB_END+7;

SELECT *
FROM POSSIBE_VIEW;

--11. 성적처리 데이터 / 수강신청코드 과목개설코드
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 50, 100, 40, 'AP010', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 80, 100, 40, 'AP011', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP012', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP013', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP013', 'SD010');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 50, 30, 'AP014', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 50, 30, 'AP014', 'SD010');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP014', 'SD011');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD010');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD011');

-- 성적처리 업데이트 데이터
EXEC PRC_SCORE_UPDATE('SC020', 80, 80, 80);


--12. 중도탈락사유 데이터
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '취업');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '수업태도불량');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '개인사정');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '생계곤란');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '확인불가(사라짐)');


--13. 중도탈락 데이터
EXEC PRC_FAIL_INSERT('FA'||LPAD(TO_CHAR(SEQ_FA.NEXTVAL), 3, '0'), SYSDATE, 'FR003', 'AP015');


SELECT *
FROM PROF
WHERE PRF_NAME = '오수경';

-- 학생         SEQ_S.NEXTVAL
-- 강의실         SEQ_CL.NEXTVAL
-- 교재         SEQ_BK.NEXTVAL
-- 과목         SEQ_SJ.NEXTVAL
-- 과정         SEQ_CR.NEXTVAL
-- 과정개설         SEQ_CD.NEXTVAL
-- 과목개설         SEQ_SD.NEXTVAL
-- 수강신청         SEQ_AP.NEXTVAL
-- 성적처리         SEQ_SC.NEXTVAL
-- 중도탈락사유         SEQ_FR.NEXTVAL
-- 중도탈락         SEQ_FA.NEXTVAL


COMMIT;
--==> 커밋 완료.


SELECT S.STD_NO "학생코드", S.STD_NAME "학생명" ,SJ.SUBJECT_NAME "과목명"
     , A.APPLY_NO "수강코드", SD.SUB_NO "개설과목코드"
FROM STUDENTS S JOIN APPLY A
  ON S.STD_NO = A.STD_NO
    JOIN SCORE SC
      ON A.APPLY_NO = SC.APPLY_NO
        JOIN SUB_DETAIL SD
          ON SD.SUB_NO = SC.SUB_NO
            JOIN SUBJECT SJ
              ON SJ.SUBJECT_NO = SD.SUBJECT_NO
WHERE SD.SUB_END +7 < SYSDATE
  AND SC.SCORE_NO IS NULL; 









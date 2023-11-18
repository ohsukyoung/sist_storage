-- ��
-- <������> ���� ���� ��� �� ���� (VIEW_SUB_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_SUB_INFO
AS
SELECT C.COURSE_NAME "������", R.ROOM_NAME "���ǽǸ�", S.SUBJECT_NAME "�����"
     , (TO_CHAR(SD.SUB_BEGIN) || ' ~ ' || TO_CHAR(SD.SUB_END)) "����Ⱓ", B.BOOK_NAME "�����"
     , P.PRF_NAME "�����ڸ�"
FROM SUB_DETAIL SD, BOOK B, SUBJECT S, CR_DETAIL CD, CLASSROOM R, COURSE C, PROF P 
WHERE SD.BOOK_NO = B.BOOK_NO
  AND SD.SUBJECT_NO = S.SUBJECT_NO
  AND SD.CR_NO = CD.CR_NO
  AND CD.COURSE_NO = C.COURSE_NO
  AND CD.ROOM_NO = R.ROOM_NO
  AND CD.PRF_NO = P.PRF_NO;

SELECT *
FROM VIEW_SUB_INFO;


-- <������> ���� ���� ��� �� ���� (VIEW VIEW_CR_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_CR_INFO
AS
SELECT C3.COURSE_NAME "������", C1.ROOM_NAME "���ǽǸ�", J.SUBJECT_NAME "�����",TO_CHAR(S1.SUB_BEGIN) ||' ~ '||
      TO_CHAR(S1.SUB_END) "����Ⱓ", B.BOOK_NAME "�����", P.PRF_NAME "�����ڸ�"
FROM CLASSROOM C1 JOIN CR_DETAIL C2 
ON C1.ROOM_NO = C2.ROOM_NO
    JOIN COURSE C3
      ON C2.COURSE_NO = C3.COURSE_NO
        JOIN SUB_DETAIL S1
          ON C2.CR_NO = S1.CR_NO
                JOIN SUBJECT J
                  ON J.SUBJECT_NO = S1.SUBJECT_NO
                        JOIN BOOK B
                          ON B.BOOK_NO = S1.BOOK_NO
                                JOIN PROF P
                                  ON P.PRF_NO = C2.PRF_NO;
                  
SELECT *                
FROM VIEW_CR_INFO;

-- <������> ������ ���� ��� �� ���� (VIEW_PROF_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_PROF_INFO
AS
SELECT P.PRF_NAME "������", S.SUBJECT_NAME "�����",  SD.SUB_BEGIN || ' ~ ' || SD.SUB_END "����Ⱓ"
     , B.BOOK_NAME "�����", C.ROOM_NAME "���ǽ�"
     , CASE WHEN SYSDATE < SD.SUB_BEGIN THEN '����'
            WHEN SYSDATE >= SD.SUB_BEGIN AND SYSDATE <= SD.SUB_END THEN '������'
            WHEN SYSDATE > SD.SUB_END THEN '�Ϸ�'
            ELSE 'Ȯ�κҰ�'
       END "�������࿩��"
FROM PROF P LEFT JOIN CR_DETAIL CD
    ON P.PRF_NO = CD.PRF_NO
    LEFT JOIN CLASSROOM C
        ON CD.ROOM_NO = C.ROOM_NO
            LEFT JOIN SUB_DETAIL SD
            ON CD.CR_NO = SD.CR_NO
                LEFT JOIN SUBJECT S
                ON SD.SUBJECT_NO = S.SUBJECT_NO
                    LEFT JOIN BOOK B
                    ON SD.BOOK_NO = B.BOOK_NO;

SELECT *
FROM VIEW_PROF_INFO;

-- <������> �л� ���� ��� �� ���� (VIEW_STUDENT_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_STUDENT_INFO
AS
SELECT ST.STD_NAME "�л���", C.COURSE_NAME "������" , S.SUBJECT_NAME "�����" ,(ATTEND_SC + WRITE_SC + PRACTICE_SC) "����"
FROM STUDENTS ST LEFT JOIN APPLY A
  ON ST.STD_NO = A.STD_NO
    LEFT JOIN SCORE SC
      ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN SUB_DETAIL SD
          ON SD.SUB_NO =SC.SUB_NO
            LEFT JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO
               LEFT JOIN CR_DETAIL CD
                 ON CD.CR_NO = SD.CR_NO
                   LEFT JOIN COURSE C 
                    ON C.COURSE_NO = CD.COURSE_NO;

SELECT *
FROM VIEW_STUDENT_INFO;

-- <������> ���� ���� ��� �� ���� (VIEW_SCORE_INFO) -- Ȯ�οϷ�
/*
CREATE OR REPLACE VIEW VIEW_SCORE_INFO
AS
SELECT P.PRF_NAME ������
     , SB.SUBJECT_NAME �����
     , TO_CHAR(SD.SUB_BEGIN) || ' ~ ' ||  TO_CHAR(SD.SUB_END) ����Ⱓ
     , B.BOOK_NAME �����
     , S.STD_NAME �л���
     , SC.ATTEND_SC  ���
     , SC.WRITE_SC   �ʱ�
     , SC.PRACTICE_SC    �Ǳ�
     , (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) ��������
     , RANK() OVER(PARTITION BY SB.SUBJECT_NAME ORDER BY NVL(SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC, 0) DESC) ������
     , CASE WHEN F.FAIL_NO IS NOT NULL THEN 'Y'
            WHEN F.FAIL_NO IS NULL THEN 'N'
            ELSE 'ERROR'
       END  �ߵ�Ż������
FROM APPLY A LEFT JOIN STUDENTS S
ON S.STD_NO = A.STD_NO
    LEFT JOIN SCORE SC
    ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN FAIL F
        ON A.APPLY_NO = F.APPLY_NO
            LEFT JOIN SUB_DETAIL SD
            ON SC.SUB_NO = SD.SUB_NO
                LEFT JOIN CR_DETAIL CD
                ON SD.CR_NO = CD.CR_NO
                    LEFT JOIN PROF P
                    ON CD.PRF_NO = P.PRF_NO
                    LEFT JOIN SUBJECT SB
                    ON SD.SUBJECT_NO = SB.SUBJECT_NO
                        LEFT JOIN BOOK B
                        ON SD.BOOK_NO = B.BOOK_NO;
*/
CREATE OR REPLACE VIEW VIEW_SCOREPRF_INFO
AS
SELECT P.PRF_NAME ������, S.SUBJECT_NAME �����, TO_CHAR(SD.SUB_BEGIN) || ' ~ ' ||  TO_CHAR(SD.SUB_END) ����Ⱓ, B.BOOK_NAME �����
FROM PROF P LEFT JOIN CR_DETAIL CD
ON P.PRF_NO = CD.PRF_NO
    LEFT JOIN COURSE C
    ON CD.COURSE_NO = C.COURSE_NO
        LEFT JOIN SUB_DETAIL SD
        ON CD.CR_NO = SD.CR_NO
            LEFT JOIN SUBJECT S
            ON SD.SUBJECT_NO = S.SUBJECT_NO
                LEFT JOIN BOOK B
                ON SD.BOOK_NO = B.BOOK_NO;

CREATE OR REPLACE VIEW VIEW_SCORE_INFO
AS               
SELECT SB.SUBJECT_NAME �����
     , S.STD_NAME �л���
     , SC.ATTEND_SC  ���
     , SC.WRITE_SC   �ʱ�
     , SC.PRACTICE_SC    �Ǳ�
     , (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) ��������
     , RANK() OVER(PARTITION BY SB.SUBJECT_NAME ORDER BY NVL(SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC, 0) DESC) ������
     , CASE WHEN F.FAIL_NO IS NOT NULL THEN 'Y'
            WHEN F.FAIL_NO IS NULL THEN 'N'
            ELSE 'ERROR'
       END  �ߵ�Ż������
FROM APPLY A LEFT JOIN STUDENTS S
ON A. STD_NO = S.STD_NO
    LEFT JOIN SCORE SC
    ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN FAIL F
        ON A.APPLY_NO = F.APPLY_NO
            LEFT JOIN SUB_DETAIL SD
            ON SD.SUB_NO = SC.SUB_NO
                LEFT JOIN SUBJECT SB
                ON SD.SUBJECT_NO = SB.SUBJECT_NO;
SELECT *
FROM VIEW_SCOREPRF_INFO;


SELECT *
FROM VIEW_SCORE_INFO
WHERE ����� = 'Oracle Database';

-- <�л�> ���� ���� ��� �� ���� (VIEW_STUDENTSC_INFO) - Ȯ�οϷ�
CREATE OR REPLACE VIEW VIEW_STUDENTSC_INFO
AS
SELECT   S.STD_NO "�л��ڵ�"
       , S.STD_NAME "�л��̸�"
       , C.COURSE_NAME "������"
       , SB.SUBJECT_NAME "�����"
       , TO_CHAR(CBD.CR_BEGIN,'YYYY-MM-DD') || ' ~ ' || TO_CHAR(CBD.CR_END,'YYYY-MM-DD') "�����Ⱓ"
       , TO_CHAR(SBD.SUB_BEGIN,'YYYY-MM-DD') || ' ~ ' || TO_CHAR(SBD.SUB_END,'YYYY-MM-DD') "�ش�������Ⱓ"
       , B.BOOK_NAME "�����"
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.ATTEND_SC) ELSE 0 END "���" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.WRITE_SC) ELSE 0 END "�ʱ�" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.PRACTICE_SC) ELSE 0 END "�Ǳ�" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) ELSE 0 END "����"
--       , SC.ATTEND_SC "���" 
--       , SC.WRITE_SC "�ʱ�"
--       , SC.PRACTICE_SC "�Ǳ�"
--       , SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC "����"
     , RANK() OVER (PARTITION BY SUBJECT_NAME ORDER BY (SC. ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) DESC) "���"
     , F.FAIL_DATE "�ߵ�Ż������"
     , FR.FR "Ż������"
FROM COURSE C JOIN CR_DETAIL CBD
    ON C.COURSE_NO = CBD.COURSE_NO
    JOIN SUB_DETAIL SBD 
    ON SBD.CR_NO = CBD.CR_NO
    JOIN SUBJECT SB
    ON SBD.SUBJECT_NO = SB.SUBJECT_NO
    JOIN BOOK B
    ON B.BOOK_NO = SBD.BOOK_NO
    JOIN SCORE SC
    ON SC.SUB_NO = SBD.SUB_NO
    JOIN APPLY A
    ON A.APPLY_NO = SC.APPLY_NO
    JOIN STUDENTS S
    ON S.STD_NO = A.STD_NO
    LEFT JOIN FAIL F
    ON A.APPLY_NO = F.APPLY_NO
    LEFT JOIN FAIL_REASON FR
    ON  F.FR_NO = FR.FR_NO;
    
SELECT *
FROM VIEW_STUDENTSC_INFO;  
    
    
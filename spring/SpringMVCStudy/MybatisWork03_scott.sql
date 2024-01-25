SELECT USER
FROM DUAL;
--==>> SCOTT


--�� �ǽ� ���̺� ����
CREATE TABLE TBL_STUDENT
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT STUDENT_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_STUDENT��(��) �����Ǿ����ϴ�.


--�� ������ �Է�
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(1, '������', '010-1111-1111');
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(2, '������', '010-2222-2222');
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(3, '������', '010-3333-3333');
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(4, '�ڹ���', '010-4444-4444');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4


--�� Ȯ��
SELECT SID, NAME, TEL
FROM TBL_STUDENT;
--==>> 
/*
1	������	010-1111-1111
2	������	010-2222-2222
3	������	010-3333-3333
4	�ڹ���	010-4444-4444
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ǽ����̺� ����
CREATE TABLE TBL_GRADE
( SID   NUMBER
, SUB1  NUMBER(3)
, SUB2  NUMBER(3)
, SUB3  NUMBER(3)
, CONSTRAINT GRADE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT GRADE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_STUDENT(SID)
, CONSTRAINT GRADE_SUB1_CK CHECK(SUB1 BETWEEN 0 AND 100)
, CONSTRAINT GRADE_SUB2_CK CHECK(SUB2 BETWEEN 0 AND 100)
, CONSTRAINT GRADE_SUB3_CK CHECK(SUB3 BETWEEN 0 AND 100)
);
--==>> Table TBL_GRADE��(��) �����Ǿ����ϴ�.


--�� ������ �Է�
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(1,90,90,80);
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(2,92,92,92);
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(3,70,60,50);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3


--�� Ȯ��
SELECT *
FROM TBL_GRADE;
--==>>
/*
1	90	90	80
2	92	92	92
3	70	60	50
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �� ����(STUDENTVIEW)
CREATE OR REPLACE VIEW STUDENTVIEW
AS
SELECT S.SID AS SID
     , S.NAME AS NAME
     , S.TEL AS TEL
     , (SELECT COUNT(*)
        FROM TBL_GRADE
        WHERE SID = S.SID) AS SUB
FROM TBL_STUDENT S;
--==>> View STUDENTVIEW��(��) �����Ǿ����ϴ�.


--�� �� ����(GRADEVIEW)
CREATE OR REPLACE VIEW GRADEVIEW
AS
SELECT S.SID AS SID
     , S.NAME AS NAME
     , NVL(G.SUB1, -1) AS SUB1
     , NVL(G.SUB2, -1) AS SUB2
     , NVL(G.SUB3, -1) AS SUB3
     , NVL((G.SUB1 + G.SUB2 + G.SUB3), -1) AS TOT
     , NVL(ROUND((G.SUB1 + G.SUB2 + G.SUB3)/3,1),-1) AS AVG
     , (CASE WHEN NVL((G.SUB1 + G.SUB2 + G.SUB3)/3, -1) <= 60 THEN '���հ�'
             WHEN (G.SUB1<=40) OR (G.SUB2<=40) OR (G.SUB3<=40) THEN '����'
             ELSE '�հ�'
        END) AS CH
--    ,RANK() OVER(ORDER BY (SUB1+SUB2+SUB3) DESC) AS RANK
FROM TBL_STUDENT S LEFT JOIN TBL_GRADE G
ON S.SID = G.SID;
--==>> View GRADEVIEW��(��) �����Ǿ����ϴ�.


--�� ��(STUDENTVIEW) ��ȸ
SELECT SID, NAME, TEL, SUB
FROM STUDENTVIEW
ORDER BY SID;
--==>>
/*
1	������	010-1111-1111	1
2	������	010-2222-2222	1
3	������	010-3333-3333	1
4	�ڹ���	010-4444-4444	0
*/

--��
SELECT SID, NAME, TEL, SUB
FROM STUDENTVIEW
WHERE SID = 1;

--��
UPDATE TBL_STUDENT
SET NAME='����', TEL='010-7777-7777'
WHERE SID = 4;

ROLLBACK;


--�� ��(GRADEVIEW) ��ȸ
SELECT SID, NAME, SUB1, SUB2, SUB3, TOT, AVG, CH
FROM GRADEVIEW
ORDER BY SID;
--==>>
/*
1	������	90	90	80	260	86.7	�հ�
2	������	92	92	92	276	92	�հ�
3	������	70	60	50	180	60	���հ�
4	�ڹ���	-1	-1	-1	-1	-1	���հ�
*/

--�� �ο� �� Ȯ��
SELECT COUNT(*) AS COUNT
FROM TBL_STUDENT;
--==>> 4


--�� ���� ó�� �� Ȯ��
SELECT COUNT(*) AS COUNT
FROM TBL_GRADE;


--�� �л� ������ ����
DELETE
FROM TBL_STUDENT
WHERE SID = 4;

--�� ���� ������ ����
DELETE
FROM TBL_GRADE
WHERE SID=3;

--��
ROLLBACK;

COMMIT;

--��
--��
--��
--��












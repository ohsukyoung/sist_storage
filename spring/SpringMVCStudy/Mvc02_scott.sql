SELECT USER
FROM DUAL;
--==>> SCOTT

DESC TBL_MEMBERLIST;
--==>>
/*
�̸�    ��?       ����            
----- -------- ------------- 
ID    NOT NULL VARCHAR2(30)  
PW    NOT NULL VARCHAR2(50)  
NAME  NOT NULL VARCHAR2(50)  
TEL   NOT NULL VARCHAR2(50)  
EMAIL          VARCHAR2(100)
*/

DROP TABLE TBL_MEMBERLIST;
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� �ٽ� ����(TBL_MEMBERLIST)
CREATE TABLE TBL_MEMBERLIST
( MID        NUMBER
, NAME       VARCHAR2(30)
, TELEPHONE  VARCHAR2(50)
, CONSTRAINT MEMBERLIST_MID_PK PRIMARY KEY(MID)
);
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� ������ ����(MEMBERLISTSEQ)
CREATE SEQUENCE MEMBERLISTSEQ
NOCACHE;
--==>> Sequence MEMBERLISTSEQ��(��) �����Ǿ����ϴ�.


--�� �Է� ������ ���� �� ���� ������ �Է�
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)
VALUES(MEMBERLISTSEQ.NEXTVAL, '������', '010-1111-2222');
--> �� �� ����
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) VALUES(MEMBERLISTSEQ.NEXTVAL, '������', '010-1111-2222')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) VALUES(MEMBERLISTSEQ.NEXTVAL, '�ڰ���', '010-3333-4444')
;


--�� Ȯ��
SELECT MID, NAME, TELEPHONE
FROM TBL_MEMBERLIST
ORDER BY MID;
--==>> 
/*
1	������	010-1111-2222
2	�ڰ���	010-3333-4444
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ο� �� ��ȸ ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERLIST;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST
;
--==>> 2

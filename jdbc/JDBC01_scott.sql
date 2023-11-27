SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;

PURGE RECYCLEBIN;

DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ���� ������ �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1,'ȫ�浿','010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>> 1	ȫ�浿	010-1111-1111

--�� Ŀ�� CHECK~!!!
COMMIT;
--==>> Ŀ�� �Ϸ�.

/*
** JDBC�� Ŀ���̳� �ѹ� ���ϸ� �ݵ�� ���� ����**
*/

--�� �ڹٿ��� Test003.java ���� �� �ٽ� Ȯ��
SELECT *
FROM TBL_MEMBER;
/*
2	������	010-2222-2222
1	ȫ�浿	010-1111-1111
*/



SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
/*
1	������	010-1111-1111
2	���ϼ�	010-3333-3333
3	�����	010-4444-4444
4	����ȯ	010-5555-5555
5	���ѿ�	010-6666-6666
6	���ѿ�	010-6666-6666
7	������	010-7777-7777
*/

TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �߷Ƚ��ϴ�.

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>> ��ȸ��� ����

DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� CallableStatement �ǽ��� ���� ���ν��� �ۼ�
--  ���ν��� ��   : PRC_MEMBERINSERT
--  ���ν��� ��� : TBL_MEMBER ���̺� �����͸� �Է��ϴ� ���ν���

CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT
( VNAME    IN TBL_MEMBER.NAME%TYPE
, VTEL     IN TBL_MEMBER.TEL%TYPE
)
IS
    VSID      TBL_MEMBER.SID%TYPE;
BEGIN
    
    SELECT NVL(MAX(SID),0)+1 INTO VSID
    FROM TBL_MEMBER;

    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
    VALUES(VSID, VNAME, VTEL);
    
    COMMIT;
END;

SELECT *
FROM TBL_MEMBER;
--==>>
/*
3	��ٽ�	010-1111-1111
4	������	010-2222-2222
5	�����	010-3333-3333
6	�ڹ���	010-4444-4444
*/

DELETE
FROM TBL_MEMBER;


--�� CallableStatement �ǽ��� ���� ���ν��� ����
-- ���ν��� ��   : PRC_MEMBERSELECT
-- ���ν��� ��� : TBL_MEMBER ���̺��� �����͸� �о���� ���ν���
--  �� <SYS_REFCURSOR> �ڷ����� �̿��Ͽ� Ŀ�� �ٷ��

CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT
( VRESULT   OUT SYS_REFCURSOR

)
IS
    -- �ֿ� ���� ����
    -- -> Ŀ�� ���� -> ��¿� �Ű������� ��ü
BEGIN
    OPEN VRESULT FOR
        SELECT SID, NAME, TEL
        FROM TBL_MEMBER
        ORDER BY SID;
        
--    CLOSE VRESULT;
    /* �����ϴ� ������ Ŀ���� ����� ���� Ŀ���� ���� �ʴ´�!
        ����Ŭ�� �ƴ�, �ڹٿ��� ����� ���̱� ������
    */
    
--    COMMIT;
END;
--==>> Procedure PRC_MEMBERSELECT��(��) �����ϵǾ����ϴ�.


COMMIT;
--==>> Ŀ�� �Ϸ�.


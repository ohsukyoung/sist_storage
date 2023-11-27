SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER
ORDER BY 1;
--==>>
/*
1	������	010-1111-1111
2	���ϼ�	010-3333-3333
3	�����	010-4444-4444
*/


--�� ������ �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '����ȯ', '010-5555-5555');
--> �� �� ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '����ȯ', '010-5555-5555')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT SID, NAME, TEL 
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	������	010-1111-1111
2	���ϼ�	010-3333-3333
3	�����	010-4444-4444
4	����ȯ	010-5555-5555
*/

COMMIT;

SELECT USER
FROM DUAL;

--���� UNION / UNION ALL ����--

--** JOIN��  �� ���� ���̺��� �� ��   �� �����ؼ� ���� ��
--** UNION�� �� ���� ���̺��� �� �Ʒ� �� �����ؼ� ���� ��

--�� �ǽ� ���̺� ����(���̺��: TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- �ֹ� ���̺� ����
( JUNO      NUMBER                  -- �ֹ� ��ȣ
, JECODE    VARCHAR2(30)            -- ��ǰ �ڵ�
, JUSU      NUMBER                  -- �ֹ� ����
, JUDAY     DATE DEFAULT SYSDATE    -- �ֹ� ����
);
--==>> Table TBL_JUMUN��(��) �����Ǿ����ϴ�.
-- ���� �ֹ��� �߻�(����)�Ǿ��� ���
-- �ֹ� ���뿡 ���� �����Ͱ� �Էµ� �� �ֵ��� ó���ϴ� ���̺�

-- �ǽ� ���� �� ��ǰ �ڵ�(JECODE)����
-- ���ǻ� ��ǰ�� �ڵ带 �����Ѵٰ� �����ϰ� ��ǰ�� �̸��� �Է��Ѵ�.

--�� ������ �Է� -> ���� �ֹ� �߻�(����)
/*INSERT INTO TBL_JUMUN
VALUES(1, '����ƽ', 20, TO_DATE('2001-11-01 09:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(2, '������', 10, TO_DATE('2001-11-01 10:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(3, '��ǹ�', 30, TO_DATE('2001-11-01 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(4, '��īĨ', 20, TO_DATE('2001-11-02 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(5, '��īĨ', 30, TO_DATE('2001-11-03 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(6, '������', 20, TO_DATE('2001-11-04 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(7, 'Ȩ����', 10, TO_DATE('2001-11-05 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(8, 'Ȩ����', 10, TO_DATE('2001-11-06 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(9, '������', 20, TO_DATE('2001-11-07 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(10, '��ǹ�', 10, TO_DATE('2001-11-08 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(11, '������', 20, TO_DATE('2001-11-09 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(12, '���ڱ�', 10, TO_DATE('2001-11-10 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(13, '������', 20, TO_DATE('2001-11-11 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(14, 'Ȩ����', 20, TO_DATE('2001-11-12 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(15, '��īĨ', 10, TO_DATE('2001-11-13 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(16, '��īĨ', 20, TO_DATE('2001-11-16 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(17, '������', 20, TO_DATE('2001-11-17 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(18, '������', 30, TO_DATE('2001-11-18 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(19, '������', 20, TO_DATE('2001-11-19 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(20, '����Ĩ', 30, TO_DATE('2001-11-20 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));
*/
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 20

SELECT *
FROM TBL_JUMUN;
/*
1	����ƽ	20	2001-11-01
2	������	10	2001-11-01
3	��ǹ�	30	2001-11-01
4	��īĨ	20	2001-11-02
5	��īĨ	30	2001-11-03
6	������	20	2001-11-04
7	Ȩ����	10	2001-11-05
8	Ȩ����	10	2001-11-06
9	������	20	2001-11-07
10	��ǹ�	10	2001-11-08
11	������	20	2001-11-09
12	���ڱ�	10	2001-11-10
13	������	20	2001-11-11
14	Ȩ����	20	2001-11-12
15	��īĨ	10	2001-11-13
16	��īĨ	20	2001-11-16
17	������	20	2001-11-17
18	������	30	2001-11-18
19	������	20	2001-11-19
20	����Ĩ	30	2001-11-20
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�ԿϷ�

--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_JUMUN;
/*
1	����ƽ	20	2001-11-01 09:10:10
2	������	10	2001-11-01 10:10:10
3	��ǹ�	30	2001-11-01 11:10:10
4	��īĨ	20	2001-11-02 11:10:10
5	��īĨ	30	2001-11-03 11:10:10
6	������	20	2001-11-04 11:10:10
7	Ȩ����	10	2001-11-05 11:10:10
8	Ȩ����	10	2001-11-06 11:10:10
9	������	20	2001-11-07 11:10:10
10	��ǹ�	10	2001-11-08 11:10:10
11	������	20	2001-11-09 11:10:10
12	���ڱ�	10	2001-11-10 11:10:10
13	������	20	2001-11-11 11:10:10
14	Ȩ����	20	2001-11-12 11:10:10
15	��īĨ	10	2001-11-13 11:10:10
16	��īĨ	20	2001-11-16 11:10:10
17	������	20	2001-11-17 11:10:10
18	������	30	2001-11-18 11:10:10
19	������	20	2001-11-19 11:10:10
20	����Ĩ	30	2001-11-20 11:10:10
*/

--�� �߰� ������ �Է� -> 2001�� ���� ���۵� �ֹ��� ����(2023)���� ��� �߻�~!!! ������~!!!
INSERT INTO TBL_JUMUN VALUES(98764, '����Ĩ', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98765, '������', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98766, '������', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98767, '���̽�', 40, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98768, 'Ȩ����', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98769, '���ڱ�', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98770, '������', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98771, '���Ͻ�', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98772, '������', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98773, '������', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98774, '������', 50, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98775, '������', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT *
FROM TBL_JUMUN;
/*
1	    ����ƽ	20	2001-11-01 09:10:10
2	    ������	10	2001-11-01 10:10:10
3	    ��ǹ�	30	2001-11-01 11:10:10
4	    ��īĨ	20	2001-11-02 11:10:10
5	    ��īĨ	30	2001-11-03 11:10:10
6	    ������	20	2001-11-04 11:10:10
7	    Ȩ����	10	2001-11-05 11:10:10
8	    Ȩ����	10	2001-11-06 11:10:10
9	    ������	20	2001-11-07 11:10:10
10	    ��ǹ�	10	2001-11-08 11:10:10
11	    ������	20	2001-11-09 11:10:10
12	    ���ڱ�	10	2001-11-10 11:10:10
13	    ������	20	2001-11-11 11:10:10
14	    Ȩ����	20	2001-11-12 11:10:10
15	    ��īĨ	10	2001-11-13 11:10:10
16	    ��īĨ	20	2001-11-16 11:10:10
17	    ������	20	2001-11-17 11:10:10
18	    ������	30	2001-11-18 11:10:10
19	    ������	20	2001-11-19 11:10:10
20	    ����Ĩ	30	2001-11-20 11:10:10
98764	����Ĩ	10	2023-10-26 12:46:12
98765	������	30	2023-10-26 12:46:56
98766	������	20	2023-10-26 12:47:25
98767	���̽�	40	2023-10-26 12:47:52
98768	Ȩ����	10	2023-10-26 12:48:16
98769	���ڱ�	20	2023-10-26 12:48:48
98770	������	10	2023-10-26 12:49:05
98771	���Ͻ�	20	2023-10-26 12:49:26
98772	������	30	2023-10-26 12:49:45
98773	������	20	2023-10-26 12:50:08
98774	������	50	2023-10-26 12:50:30
98775	������	10	2023-10-26 12:50:52
*/

--�� �����̰� ���� ���θ� � ��
--   TBL_JUBUN ���̺��� ���ſ��� ��Ȳ
--   ���ø����̼ǰ��� �������� ���� �ֹ� ������
--   �����δ� �ٸ� ���̺� ����� �� �ֵ��� ����� ���� ���� �Ұ����� ��Ȳ.
--   ������ ��� �����͸� ������� ����� �͵� �Ұ����� ��Ȳ.
--   -> ���������...
--      ������� ������ �ֹ� ������ ��
--      ���� �߻��� �ֹ� ������ �����ϰ�
--      ������ �����͸� �ٸ� ���̺�(TBL_JUMUNBAKUP)��
--      �����͸� �̰��Ͽ� ����� ������ ��ȹ

--** �����Ͱ� ���ſ����� -> ������ �����Ͱ� �׿���
--** �����Ͱ� ���ſ����� ��, ���θ��� ���� �ƴ϶�
--** ���� �����͸� �ű�� �ٽ� ���� �帧��� ����Ѵ�

--** ���� �����͸� ����°��� ���� �ȵ�
--** ���θ� ������ Ȯ���ϰų�
--** ��ǰ�ؾ��ϴ� �Ͱ� ����ϴ�

/* 1-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� ���ð��� ������ ���������� TBL_JUMUNBACKUP �� �ű��
SELECT *
FROM TBL_JUMUN
WHERE ���Ϲ߻����ֹ��̾ƴѰ�;

-- �ű� ���̺� �˻�
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');

-- ���̺� ����
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');

-- ���̺� ����
--DROP TABLE TBL_JUMUNBAKUP;

--�� Ȯ��
SELECT *
FROM TBL_JUMUNBACKUP;

-- ���̺� �� ����
--ALTER TABLE TBL_JUMUNBAKUP RENAME TO TBL_JUMUNBACKUP;

--> TBL_JUMUN ���̺��� �����͵� ��
--  ���� �ֹ� ���� �̿��� �����ʹ� ��� TBL_JUMUNBACKUP ���̺�
--  ����� ��ģ ����~!!!

/* 2-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--  TBL_JUMUN ���̺��� �����͵� ��
--  ����� ��ģ �����͵�... ��, ���� �߻��� �ֹ� ������ �ƴ� �����͵�
--  ����
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');

DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');
--==>> 20�� �� ��(��) �����Ǿ����ϴ�.
--      (93763�� ���� ����)

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ���� ��ǰ �߼��� �̷������ ���� ���� �ֹ� �����͸� �����ϰ�
--   ������ ��� �ֹ� �����͵��� ������ ��Ȳ�̹Ƿ�
--   ���̺��� ��(���ڵ�)�� ������ �پ��� �ſ� �������� ��Ȳ�̴�.

--  �׷���, ���ݱ��� �ֹ����� ������ ���� ������
--  ��ǰ�� �� �ֹ������� ��Ÿ����� �� ��Ȳ�� �߻��ϰ� �Ǿ���.
--  �׷��ٸ�, TBL_JUMUNBACKUP ���̺��� ���ڵ�(��)��
--  TBL_JUMUN ���̺��� ���ڵ�(��)�� ��� ����
--  �ϳ��� ���̺��� ��ȸ�ϴ� �Ͱ� ���� ����� Ȯ���� �� �ֵ���
--  ��ȸ�� �̷�������Ѵ�.

--�� �÷��� �÷��� ���踦 ����Ͽ� ���̺��� �����ϰ��� �ϴ� ���
--   JOIN�� ���������
--   ���ڵ�� ���ڵ带 �����ϰ��� �ϴ� ���
--   UNION / UNION ALL �� ����� �� �ִ�.

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
--** ���� ���¿��� JUMUN�� JUMUNBACKUP�� ���� ����
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
--** JUMUN�� JUMUNBACKUP �� ��ġ�� �ٲٸ�
--** UNION���� JUMUN�� ���� ���� ��� ù ��° �÷��� �������� �������� ����
--** UNION�� �ߺ��� ���� �ִ� ��� �����ϰ� ����
--** UNION ALL�� 

--**===================================================================
--** ���: UNION �� ���� ���� UNION ALL ���� ���ҽ� �Ҹ� ũ�� ������,
--**        �ǹ������� UNION ALL�� �� ���� ����.
--**===================================================================

--�� UNION �� �׻� ������� ù ��° �÷��� ��������
--   �������� ������ �����Ѵ�.
--   �ݸ�, UNION ALL �� ���յ� ����(���������� ���̺��� ����� ����)���
--   ��ȸ�� ����� �ִ� �״�� ��ȯ�Ѵ�. (-> ���� ����)
--   �̷� ���� UNION �� ���ϰ� �� ũ��. (-> ���ҽ� �Ҹ� �� ũ��)
--   ����, UNION �� ������� ���� �ߺ��� ���ڵ�(��)�� ������ ���
--   �ߺ��� �����ϰ� 1�� �ุ ��ȸ�� ����� ��ȯ�ϰ� �ȴ�.

--�� ���ݰ��� �ֹ����� �����͸� ����
--   ��ǰ�� �� �ֹ����� ��ȸ�� �� �ִ� �������� �����Ѵ�.

--** �� �����δ� x �� �ֹ��Ǿ���
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

SELECT T.JECODE "��ǰ��", SUM(T.JUSU) "�ֹ���"
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
���ڱ�	30
����Ĩ	40
������	20
������	90
������	30
������	140
��ǹ�	40
���̽�	40
������	10
������	20
������	20
���Ͻ�	20
����ƽ	20
��īĨ	80
Ȩ����	50
*/

--�� INTERSECT / MINUS (������ / ������)

-- TBL_UMUNBACKUP ���̺�� TBL_JUMUN ���̺���
-- ��ǰ�ڵ�� �ֹ������� ���� �Ȱ��� �ุ �����ؼ� ��ȸ�ϰ��� �Ѵ�.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
������	30
������	20
Ȩ����	10
*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
���ڱ�	10
����Ĩ	30
������	20
������	20
������	10
������	20
��ǹ�	10
��ǹ�	30
������	20
����ƽ	20
��īĨ	10
��īĨ	20
��īĨ	30
Ȩ����	20
*/

/* 3-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺��� �������
--   ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������
--   �ֹ���ȣ, ��ǰ�ڵ�, �ֹ���, �ֹ����� �׸����� ��ȸ�Ѵ�.

--���1: IN ���
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
--���2: JOIN ���
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
98766	������	20	2023-10-26 14:52:38
98768	Ȩ����	10	2023-10-26 14:52:40
98772	������	30	2023-10-26 14:52:44
7	Ȩ����	10	2001-11-05 11:10:10
8	Ȩ����	10	2001-11-06 11:10:10
11	������	20	2001-11-09 11:10:10
13	������	20	2001-11-11 11:10:10
18	������	30	2001-11-18 11:10:10
*/

/* 3-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- �ֹ���ȣ, ��ǰ�ڵ�, �ֹ���, �ֹ�����
/*
18	������	30	2001-11-18 11:10:10
98772	������	30	2023-10-26 14:52:44
11	������	20	2001-11-09 11:10:10
13	������	20	2001-11-11 11:10:10
98766	������	20	2023-10-26 14:52:38
7	Ȩ����	10	2001-11-05 11:10:10
8	Ȩ����	10	2001-11-06 11:10:10
98768	Ȩ����	10	2023-10-26 14:52:40
*/
SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUN;
--==>> ��ȸ��� ����
--** ����: �ֹ���ȣ~ �ֹ����ڱ��� ��� ���� ���ڵ�� ����. -> �ֹ����ڴ� �ʱ��� ����

-- ���1
SELECT T2.JUSU "�ֹ���ȣ", T1.JECODE "��ǰ�ڵ�", T1.JUSU "�ֹ�����", T2.JUDAY "�ֹ�����"
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


-- ���2
SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
--WHERE T.JUCODE IN ('������', '������', 'Ȩ����')
--    AND T.JUSU IN (30,20,10);
--==> x 
--** ������ 30,20,10 / ������ 30,20,10 / Ȩ���� 30,20,10 ��� ���ͼ� ������Ȳ�߻�
WHERE T.JECODE �� T.JUSU�� ���� ����� '������30', '������20', 'Ȩ����10';

SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(T.JECODE, T.JUSU) IN ('������30', '������20', 'Ȩ����10');

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
--==>> CONCAT()�� ���·� ���� ��� ��ȸ�ϱ�
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
--==>> ���� �߻�(ORA-00905: missing keyword)
--** ������ ������ �����϶�� �ɼ��� ���ֹ���

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
--** ������ ����Ǵ��� Ȯ���ϱ� ���ؼ� NATURAL ������ �ϴ� ���� ��������,
--** ����Ŭ���� �˾Ƽ� �ϵ����ϴ� NATRUAL�� ����ϰ� �Ǹ� ����Ŭ�� �´� ������ ã������
--** ���ʿ��� �޸𸮸� ��� �Ա� ������, ���� �ڵ�� ����� �������� �ʴ�.

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
USING(DEPTNO);
--** ���� ��ü�� ª�ƺ��� �� ������,
--** ����Ŭ�� ��ȯ������ ��ġ�� ������ �������� �ʴ´�.

/* 4-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� �޿��� ���� ���� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
SELECT E.�����ȣ, E.�����, E.������, E.�޿�
FROM
(SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������"
      , SAL "�޿�", RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����"
FROM TBL_EMP
) E
WHERE E.��ü�޿����� =1;
--==>> 7839	KING	PRESIDENT	5000

/* 4-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- �޿��� ���� ���� �޴� ����� �޿�
SELECT MAX(SAL)
FROM TBL_EMP;
--==>> 5000

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL-EMP
WHERE �޿� = (�޿��� ���帹�� �޴� ����� �޿�);

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL = (
             SELECT MAX(SAL)
             FROM TBL_EMP
            );
--==>> 7839	KING	PRESIDENT	5000

--** �׷��Լ��� ���� �ʴ��� ã�� �� �ִ� ����
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

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL =ANY (800, 1600, 1250, 2975, 1250, 2850, 2450, 3000, 5000, 1500, 1100, 950, 3000, 1300, 1500, 2000, 1700, 2500, 1000);
--*8 ��ȣ �ȿ� �ִ� � ���̶� ������

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL =ALL (800, 1600, 1250, 2975, 1250, 2850, 2450, 3000, 5000, 1500, 1100, 950, 3000, 1300, 1500, 2000, 1700, 2500, 1000);
--** ��ȣ ���� ��� ���� ������

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL >=ALL (800, 1600, 1250, 2975, 1250, 2850, 2450, 3000, 5000, 1500, 1100, 950, 3000, 1300, 1500, 2000, 1700, 2500, 1000);
--** �ϳ��ϳ��� ���� ��� ũ�ų� ���� ���� ã�� ����

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL >=ALL (SELECT SAL
                 FROM TBL_EMP);
--==>> 7839	KING	PRESIDENT	5000

/* 5-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ��ϴ� ����� �� �޿��� ���� ���� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� �����Ѵ�.
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE DEPTNO = 20 ;
/*
7369	SMITH	CLERK	800
7566	JONES	MANAGER	2975
7788	SCOTT	ANALYST	3000
7876	ADAMS	CLERK	1100
7902	FORD	ANALYST	3000
*/
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE DEPTNO = 20 AND SAL >=ALL (SELECT SAL
                                 FROM TBL_EMP
                                 WHERE DEPTNO = 20);
/*
7902	FORD	ANALYST	3000
7788	SCOTT	ANALYST	3000
*/
/* 5-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL = (���帹���޿�)
  AND DEPTNO = 20;

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM TBL_EMP)       --**20�� �μ� ������� ���� ���� �޿��� �޴� ��� --> 5000
  AND DEPTNO = 20;

-- ���1
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
            FROM TBL_EMP
            WHERE DEPTNO = 20) -- 'WHERE DEPTNO = 20'�� �� �ʿ��� ����
  AND DEPTNO = 20;

-- ���2
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE SAL >=ALL (SELECT SAL
                 FROM TBL_EMP
                 WHERE DEPTNO = 20) -- (800, 2975, 3000, 1100, 3000)
  AND DEPTNO = 20;
/*
7902	FORD	ANALYST	3000
7788	SCOTT	ANALYST	3000
*/
SELECT USER
FROM DUAL;
--==>> SCOTT

--���� PL/SQL ����--

-- 1. PL/SQL(Procedural Language extension to SQL) ��
--    ���α׷��� ����� Ư���� ������ SQL�� Ȯ���̸�
--    ������ ���۰� ���� ������ PL/SQL�� ������ �ڵ� �ȿ� ���Եȴ�.
--    ����, PL/SQL �� ����ϸ� SQL �� �� �� ���� ������ �۾��� �����ϴ�.
--    ���⿡�� ���������� �̶�� �ܾ ������ �ǹ̴�
--    � ���� � ������ ���� ��� �Ϸ�Ǵ���
--    �� ����� ��Ȯ�ϰ� �ڵ忡 ����Ѵٴ� ���� �ǹ��Ѵ�.

/*
- PL/SQL?
���� �� ��� ���ν����� Ʈ���ų� ��ǵ��� PL/SQL������ ���Ѵ�.
ũ�� SQL������ PL/SQL �ѷ� ���������ִٰ� �� �� �ִ�.
PL/SQL�� SQL������ Ȯ�����̶�� �� �� �ִ�. PL�� ��������(P) ���(L)��� �ǹ̸� ǰ���ִ�.
���ݱ����� �ڹٶ� �ٸ� ������ ����Ŭ�� �鿩�ٺ�������,
PL/SQL�� ���α׷��� Ư���� ���� �ڹٿ� ����� �κ��� ���ٰ� ���� ���̴�
(��������, ���ǿ� �����б�, �ݺ���, TRUE FALSE�� �����帧�� ��Ʈ���ϴ� ��)
����, PL/SQL�� ������ �����ϰ� � ���� � ������ ���� �Ϸ�Ǵ���
�ڵ忡 ����ϹǷ� �������̶�� �ܾ�� ǥ���� �� ���� ���̴�.
*/

-- 2. PL/SQL �� ���������� ǥ���ϱ� ����
--    ������ ������ �� �ִ� ���,
--    ���� ������ ������ �� �ִ� ���,
--    �����帧�� ��Ʈ���� �� �ִ� ��� ���� �����Ѵ�.

-- 3. PL/SQL �� �� ������ �Ǿ� ������,
--    ���� ���� �κ�, ���� �κ�, ���� ó�� �κ���
--    �� �κ����� �����Ǿ� �ִ�.
--    ����, �ݵ�� ���� �κ��� �����ؾ� �ϸ�, ������ ������ ����.

/*
- ������?
�ڹٿ��� {}�� ���������� �ϵ� PL/SQL�� �������� ����ȭ�ϸ�,
������ ������ ������ ������ �� �ؼ� ����ؾ� �Ѵ�.
PL/SQL ������ �������� ��ũ��Ʈ�� �������ϴ� ���� �ƴ�����
PL/SQL ������ ������ �κ��� �� ����Ƽ� �������� ������ F5 ������ó��
���� ����Ǿ� ������.(����Ŭ�� �ƴ� SQL DEVELOPER�� �׷��� �����س���)
�ǽ��� �� SQL������� �����Ͽ� ����ϱ� �򰥸��Ƿ�
©���� PL/SQL �����̴��� ���������� ��ũ��Ʈ�� ����� �ۼ��ϰڴ�.
*/

-- 4. ���� �� ����
/*
[DECLARE]
    -- ����(DECLARATIONS)
BEGIN
    -- ���๮(STATEMENTS)
    
    [EXCEPTION]
        -- ���� ó����(EXCEPTION HANDLERS)
END;
*/

-- 5. ���� ����
/*
DECLARE
    -- ���� �����
    ������ �ڷ���;
    ������ �ڷ��� :=�ʱⰪ;
BEGIN
END;
*/

--�� ��(����)�� ���(�����Ͽ�) ����~!!! CHECK~!!!

--�� DBMS_OUTPUT.PUT_LINE() �� ����
--   ȭ�鿡 ����� ����ϱ� ���� ȯ�溯�� ����
SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.(��ũ��Ʈ ��� �Ʒ��� ����)
--  SERVEROUTPUT�̶�� ���ҽ��� �̿��ϴµ�, �̰� ������� �ʴµ� ����������
--  �ٸ� �������� ���ҽ��� �Ҹ��ϴµ� ���ҽ� �Ҹ� ũ�� ������
--  �ʿ��� ���� �Ѽ� ����� �ǵ��� �������

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����(���� ����� �ʱ�ȭ)
    V1 NUMBER :=10;
    -- int a = 10;
    -- *PL/SQL�� �ڷ����� �ڿ� ����* 
    V2 VARCHAR2(30) :='HELLO';
    V3 VARCHAR2(30) :='Oracle';
BEGIN
    -- �����(���� �� ó��)
    -- System.out.prinln(V1);
    DBMS_OUTPUT.PUT_LINE(V1);       --> ��±���
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;

--==>>
/*
10
HELLO
Oracle


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    V1 NUMBER := 10;
    V2 VARCHAR2(30) := 'HELLO';
    V3 VARCHAR2(30) := 'ORACLE';
BEGIN
    -- �����
    -- (���� �� ó��)
    V1 := V1 + 20;          -- NUM1 = NUM1 + 20 -> NUM1 += 20; �ڹ��� ���մ��Կ����� ����Ŭ���� ����.
    V2 := V2 || '���ѿ�';
    V3 := V3 || 'World~!!!';
    
    -- (������)
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>>
/*
30
HELLO���ѿ�
ORACLEWorld~!!!


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/



--�� IF ��(���ǹ�)

-- IF ~ THEN ~ ELSE ~ END IF;                   --> CASE���� ���̴� THEN, ELSE�� ���� �ǹ�

-- 1. PL/SQL �� IF ������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
--    ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
--    TRUE �̸� THEN �� ELSE ������ ������ �����ϰ�
--    FALSE �� NULL �̸� ELSE �� END IF; ������ ������ �����ϰ� �ȴ�.


-- 2. ���� �� ����
/*
IF ����
    THEN ó����;
END IF;
*/

/*
IF ����
    THEN ó����;
ELSE
    ó����;
END IF;
*/
-- ELSE���� ó�����տ� THEN �� �Ⱥٴ� ���� ��������!!

/*
IF ����
    THEN ó����;
ELSIF
    THEN ó����;
ELSIF
    THEN ó����;
ELSE
    ó����;
END IF;
*/
-- ����Ŭ�� IF�� ��ø�� �����ϴ�! ������ �ڹ�ó�� ELSE IF ���°� �Ǿ������
-- ������ ELSE IF���� END IF; �� �ʿ������Ƿ� ELSIF�� ǥ���ϵ��� ���س���



--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
FAIL


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/



DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
BEST


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/
--------------------------------------------------------------------------------
/* ����~! */

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'C'
        THEN DBMS_OUTPUT.PUT_LINE('GOOD');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('GOOD');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;

--�� CASE ��(���ǹ�)
-- CASE ~ WHEN ~ TEHN ~ ELSE ~ END CASE;

-- 1. ���� �� ����
/*
CASE ����
     WHEN ��1 THEN ���๮;
     WHEN ��2 THEN ���๮;
     ELSE ���๮;
END CASE;
*/

ACCEPT NUM PROMPT '����1 ����2 �Է��ϼ���';
-- *�ܺηκ��� ���� �޾Ƶ鿩 �� ���ε�, ����ڿ��� �ȳ��޼��� ���*  

DECLARE
    -- �����
    -- (�ֿ� ���� ����)
--    SEL NUMBER := 1;
    SEL NUMBER := &NUM;
    RESULT VARCHAR2(10) := '����';
BEGIN
    -- �����
    -- (�׽�Ʈ)
    DBMS_OUTPUT.PUT_LINE('SEL : ' || SEL);
    -- System.out.println("sel : " + sel);
    DBMS_OUTPUT.PUT_LINE('RESULT : ' || RESULT);
END;

ACCEPT NUM PROMPT '����1 ����2 �Է��ϼ���';
-- *�ܺηκ��� ���� �޾Ƶ鿩 �� ���ε�, ����ڿ��� �ȳ��޼��� ���*  

DECLARE
    -- �����
    -- (�ֿ� ���� ����)
--    SEL NUMBER := 1;
    SEL NUMBER := &NUM;
    RESULT VARCHAR2(20) := 'Ȯ�κҰ�';
BEGIN
    -- �����
    -- (�׽�Ʈ)
--    DBMS_OUTPUT.PUT_LINE('SEL : ' || SEL);
    -- System.out.println("sel : " + sel);
--    DBMS_OUTPUT.PUT_LINE('RESULT : ' || RESULT);

    -- (���� �� ó��)
    /*CASE SEL
        WHEN 1
        THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
        WHEN 2
        THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Ȯ�κҰ�');
    END CASE;
    */
    
    CASE SEL
        WHEN 1
        THEN RESULT := '����';
        WHEN 2
        THEN RESULT := '����';
        ELSE RESULT := 'Ȯ�κҰ�';
    END CASE;
    
    -- (��� ���)
    DBMS_OUTPUT.PUT_LINE('ó�� ����� '|| RESULT || '�Դϴ�.');
    
END;
-- *���ڵ������ ��� �ٸ�*
-- *���̳� ������Ʈ �ڷ��� �����Ҷ�(���̺� �÷�) �����ְ� �����*

--�� �ܺ� �Է� ó��
-- ACCEPT ����
-- ACCEPT ������ PROMPT '�޼���';
--> �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
-- <&�ܺκ�����> ���·� �����ϰ� �ȴ�.

/* 1-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� ������ ���� 2���� �ܺηκ���(����ڷκ���) �Է¹޾�
--   �̵��� ���� ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
--  ���� ��)
--  ù ��° ������ �Է��ϼ��� -> 10
--  �� ��° ������ �Է��ϼ��� -> 20
--==>> 10 + 20 = 30

ACCEPT NUM1 PROMPT 'ù ��° ������ �Է��ϼ���';
ACCEPT NUM2 PROMPT '�� ��° ������ �Է��ϼ���';

DECLARE
    -- �����
    -- (�ֿ� ���� ����)
    SEL1 NUMBER := &NUM1;
    SEL2 NUMBER := &NUM2;
    TOTSUM NUMBER := SEL1 + SEL2;
    RESULT VARCHAR2(20) := 'Ȯ�κҰ�';
BEGIN
    -- �����
    
    -- (���� �� ó��)
    
    -- (��� ���)
    DBMS_OUTPUT.PUT_LINE(SEL1 || ' + ' || SEL2 || ' = ' || TOTSUM);
END;

ACCEPT N1 PROMPT 'ù ��° ������ �Է��ϼ���';
ACCEPT N2 PROMPT '�� ��° ������ �Է��ϼ���';

DECLARE
    -- �ֿ� ���� ����
    NUM1 NUMBER := &N1;
    NUM2 NUMBER := &N2;
    TOTAL NUMBER := 0;
BEGIN
    -- �׽�Ʈ
--    DBMS_OUTPUT.PUT_LINE('NUM1 : '|| NUM1);
--    DBMS_OUTPUT.PUT_LINE('NUM2 : '|| NUM2);
--    DBMS_OUTPUT.PUT_LINE('TOTAL :  '|| TOTAL);
    
    -- ���� �� ó��
    TOTAL := NUM1+NUM2;
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' || TOTAL);
END;
--==>>
/*
13 + 24 = 37


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

/* 2-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ������� �����Ͽ� ����ϴ� ���α׷��� �ۼ��Ѵ�.
--   ��, �Է¿� ���� ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ -> �ݾ� �Է�

�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : ����� 1, ��� 4, ���ʿ� 1, �ʿ� 4
*/

ACCEPT TOT PROMPT '�ݾ��� �Է����ּ���'

DECLARE
    -- �����
    -- (�ֿ� ���� ����)
    TOTAL NUMBER    := &TOT;
    CNT500 NUMBER   := 0;
    CNT100 NUMBER   := 0;
    CNT50 NUMBER    := 0;
    CNT10 NUMBER    := 0;
BEGIN
    -- �����
    -- (���� �� ó��)
    CNT500  := TRUNC(TOTAL/500);
    CNT100  := TRUNC((TOTAL - CNT500*500)/100);
    CNT50   := TRUNC((TOTAL - CNT500*500 - CNT100*100)/50);
    CNT10   := TRUNC((TOTAL - CNT500*500 - CNT100*100 -CNT50*50)/10);
    
    -- (��� ���)
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� : '||TOTAL);
    DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� '   ||CNT500
                                ||', ��� '     ||CNT100
                                ||', ���ʿ� '   ||CNT50
                                ||', �ʿ� '     ||CNT10);
END;
--==>>
/*
�Է¹��� �ݾ� �Ѿ� : 990
ȭ����� : ����� 1, ��� 4, ���ʿ� 1, �ʿ� 4


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

/* 2-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
ACCEPT INPUT PROMPT '�ݾ� �Է�';
DECLARE
    --�� �ֿ� ���� ����
    MONEY   NUMBER := &INPUT; --������ ���� �Է°��� ��Ƶ� ����
    MONEY2  NUMBER := &INPUT; --��� ����� ���� �Է°��� ��Ƶ� ����
                              --(MONEY ������ ������ ó���ϴ� �������� ���� ���ϱ� ������...)

    M500    NUMBER;           -- 500�� ¥�� ������ ��Ƶ� ����
    M100    NUMBER;           -- 100�� ¥�� ������ ��Ƶ� ����
    M50     NUMBER;           --  50�� ¥�� ������ ��Ƶ� ����
    M10     NUMBER;           --  10�� ¥�� ������ ��Ƶ� ����
    -- *����Ŭ�� ���� ù���ڿ� ���ڿü� ���� --
BEGIN
    --�� ���� �� ó��
    -- MONEY �� 500���� ������ ���� ���ϰ� �������� ������.   -> 500�� ����
    M500 := TRUNC(MONEY / 500);
    
    -- MONEY �� 500���� ������ ���� ������ �������� ���Ѵ�.   -> 500�� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� �ݾ����� MONEY �� ����
    MONEY := MOD(MONEY,500);
    
    -- MONEY �� 100���� ������ ���� ���ϰ� �������� ������.   -> 100�� ����
    M100 := TRUNC(MONEY / 100);
    
    -- MONEY �� 100���� ������ ���� ������ �������� ���Ѵ�.   -> 100�� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� �ݾ����� MONEY �� ����
    MONEY := MOD(MONEY,100);
    
    -- MONEY �� 50���� ������ ���� ���ϰ� �������� ������.   -> 50�� ����
    M50 := TRUNC(MONEY / 50);
    
    -- MONEY �� 50���� ������ ���� ������ �������� ���Ѵ�.   -> 50�� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� �ݾ����� MONEY �� ����
    MONEY := MOD(MONEY,50);
    
    -- MONEY �� 10���� ������ ���� ���ϰ� �������� ������.   -> 10���� ����
    M10 := TRUNC(MONEY / 10);
    
    --�� ��� ���
    -- ���յ� ���(ȭ�� ������ ����)�� ���Ŀ� �°� ���� ����Ѵ�.
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ�: '|| MONEY2 ||'���̴�.');
    DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� '   ||M500
                                ||', ��� '     ||M100
                                ||', ���ʿ� '   ||M50
                                ||', �ʿ� '     ||M10);
END;
--==>>
/*
�Է¹��� �ݾ� �Ѿ�: 990���̴�.
ȭ����� : ����� 1, ��� 4, ���ʿ� 1, �ʿ� 4


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� �⺻ �ݺ���
-- LOOP ~ END LOOP;

-- 1. ���ǰ� ������� ������ �ݺ��ϴ� ����.


-- 2. ���� �� ����
    -- *EXIT�� �ݺ������� �����Ǵ� ���� �ƴ϶�, �ݺ����� ���������� ���� �����ϴ� ��*
/*
LOOP
    -- ���๮
    
    EXIT WHEN ����;   -- ������ ���� ��� �ݺ����� ����������.
END LOOP;
*/

-- 1 ���� 10 ������ �� ���(LOOP�� Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    N := 1;
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        
        EXIT WHEN N>=10;
        N := N+1;           -- N++; N+=1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� WHILE �ݺ���
-- WHILE LOOP ~ END LOOP;
-- *����, ���������ߴ�, ����, ����������~*

-- 1. ���� ������ TRUE �� ���� �Ϸ��� ������ �ݺ��ϱ� ����
--      WHILE LOOP ������ ����Ѵ�.
--      ������ �ݺ��� ���۵Ǵ� ������ üũ�ϰ� �Ǿ�
--      LOOP ���� ������ �� ���� ������� ���� ��쵵 �ִ�.
--      LOOP �� ������ �� ������ FALSE �̸�, �ݺ� ������ Ż���ϰ� �ȴ�.

-- 2. ���� �� ����
/*
WHILE ���� LOOP   -- ������ ���� ��� �ݺ� ����
    -- ���๮;
END LOOP;
*/

-- 1���� 10 ������ �� ���(WHILE LOOP �� Ȱ��)
DECLARE
    N NUMBER;
BEGIN
    N := 0;
    
    WHILE N<10 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� FOR �ݺ���
-- FOR LOOP ~ END LOOP;
-- *FOR������ ���� FOR���� �����*
/*
FOR(INT N : �ڷᱸ��)

*/

-- 1. <���ۼ�>���� 1�� �����Ͽ� <������> �� �� ������ �ݺ� �����Ѵ�.

-- 2. ���� �� ����
/*
FOR ī���� LOOP ���ۼ�.. ������ LOOP
    -- ���๮;
END LOOP
*/

-- 1 ���� 10 ������ �� ���(FOR LOOP �� Ȱ��)
DECLARE
    N NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

/* 3-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� ����ڷκ��� ������ ��(������)�� �Է¹޾�
--   �ش� �ܼ��� �������� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
/*
2 * 1 = 2
2 * 2 = 2
    :
2 * 9 = 18
*/
-- 1. LOOP ���� ���
ACCEPT INPUT PROMPT '�� �Է�';
DECLARE
    N NUMBER;
    DAN NUMBER := &INPUT;
BEGIN
    N := 1;
    LOOP 
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN*N);
        EXIT WHEN N>=9;
        N := N+1;
    END LOOP;
END;

-- 2. WHILE LOOP ���� ���
ACCEPT INPUT PROMPT '�� �Է�';
DECLARE
    N NUMBER;
    DAN NUMBER := &INPUT;
BEGIN
    N := 1;
    WHILE N<10 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * '|| N || ' = ' || DAN*N);
        N := N+1;
    END LOOP;
END;

-- 3. FOR LOOP ���� ���
ACCEPT INPUT PROMPT '�� �Է�';
DECLARE
    N NUMBER;
    DAN NUMBER := &INPUT;
BEGIN
    FOR N IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN*N);
    END LOOP;
END;

--==>>
-- 1,2,3 ���
/*
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

/* 3-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 1. LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';
DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN*N);
        EXIT WHEN N>=9;
        N := N+1;
    END LOOP;
END;


-- 2. WHILE LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';
DECLARE
    DAN NUMBER := &NUM;
    N NUMBER;
BEGIN
    N := 0;
    WHILE N<9 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * '|| N || ' = ' || DAN*N);
    END LOOP;
END;

-- 3. FOR LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';
DECLARE
    DAN NUMBER := &NUM;
    N NUMBER;
BEGIN
    FOR N IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN*N );
    END LOOP;    
END;

--==>>
-- 1,2,3 ���
/*
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

/* 4-���� & �Բ� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� ������ ��ü(2�� ~ 9 ��)�� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
--   ��, ���� �ݺ���(�ݺ����� ��ø) ������ Ȱ���Ѵ�.
/*
���� ��)
==[2��]==
2 * 1 = 2
2 * 2 = 4
    :
==[3��]==
3 * 1 = 3
    :
9 * 9 = 81
*/

-- 1. LOOP ���� ���
-- 2. WHILE LOOP ���� ���
-- 3. FOR LOOP ���� ���

-- 1. LOOP ���� ���
DECLARE
    DAN NUMBER := 2;
    N   NUMBER;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('==['||DAN||'��]==');
        N := 1;
        LOOP
            DBMS_OUTPUT.PUT_LINE(DAN||' * '||N||' = '||DAN*N);
            N := N+1;
            
            EXIT WHEN N > 9;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        DAN := DAN+1;
        
        EXIT WHEN DAN > 9;
    END LOOP;
END;
-- 2. WHILE LOOP ���� ���
DECLARE
    DAN NUMBER := 2;
    N   NUMBER;
BEGIN
    WHILE DAN<= 9 LOOP
        N := 1;
        
        DBMS_OUTPUT.PUT_LINE('==['||DAN||'��]==');
        WHILE N<= 9 LOOP
            DBMS_OUTPUT.PUT_LINE(DAN||' * '||N||' = '||DAN*N);
            N := N+1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        
        DAN := DAN+1;
    END LOOP;
END;

-- 3. FOR LOOP ���� ���
DECLARE
    DAN NUMBER := 2;
    N   NUMBER;
BEGIN
    FOR DAN IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE('==['||DAN||'��]==');
        
        FOR N IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE(DAN || ' * '|| N || ' = ' || DAN*N);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
        
    END LOOP;
END;
--==>>
/*
==[1��]==
1 * 1 = 1
1 * 2 = 2
1 * 3 = 3
1 * 4 = 4
1 * 5 = 5
1 * 6 = 6
1 * 7 = 7
1 * 8 = 8
1 * 9 = 9

==[2��]==
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18

==[3��]==
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27

==[4��]==
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36

==[5��]==
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45

==[6��]==
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54

==[7��]==
7 * 1 = 7
7 * 2 = 14
7 * 3 = 21
7 * 4 = 28
7 * 5 = 35
7 * 6 = 42
7 * 7 = 49
7 * 8 = 56
7 * 9 = 63

==[8��]==
8 * 1 = 8
8 * 2 = 16
8 * 3 = 24
8 * 4 = 32
8 * 5 = 40
8 * 6 = 48
8 * 7 = 56
8 * 8 = 64
8 * 9 = 72

==[9��]==
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81



PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

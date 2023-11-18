-- TEAM3 ������ Ȱ���� �� �ִ� ȯ�� ����

--�� ����Ŭ ����� ���� ����(TEAM3/java006$)
CREATE USER TEAM3
IDENTIFIED BY java006$;
--==>> User TEAM3��(��) �����Ǿ����ϴ�.


GRANT CONNECT, RESOURCE, UNLIMITED
TABLESPACE TO TEAM3;
--==>> Grant��(��) �����߽��ϴ�.

ALTER USER TEAM3 DEFAULT TABLESPACE USERS;
--==>> User TEAM3��(��) ����Ǿ����ϴ�.

SELECT *
FROM DBA_USERS;
--==>> TEAM3   50      OPEN      2024-05-08   USERS   TEMP   2023-11-10   DEFAULT   DEFAULT_CONSUMER_GROUP      10G 11G    N   PASSWORD

--�� ���̺� ���������ϵ��� CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO TEAM3;
--==>> Grant��(��) �����߽��ϴ�.

--�� �� ���������ϵ��� CREATE VIEW ���� �ο�
GRANT CREATE VIEW TO TEAM3;
--==>> Grant��(��) �����߽��ϴ�.

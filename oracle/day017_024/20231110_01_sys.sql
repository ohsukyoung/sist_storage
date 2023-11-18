-- TEAM3 계정을 활용할 수 있는 환경 설정

--○ 오라클 사용자 계정 생성(TEAM3/java006$)
CREATE USER TEAM3
IDENTIFIED BY java006$;
--==>> User TEAM3이(가) 생성되었습니다.


GRANT CONNECT, RESOURCE, UNLIMITED
TABLESPACE TO TEAM3;
--==>> Grant을(를) 성공했습니다.

ALTER USER TEAM3 DEFAULT TABLESPACE USERS;
--==>> User TEAM3이(가) 변경되었습니다.

SELECT *
FROM DBA_USERS;
--==>> TEAM3   50      OPEN      2024-05-08   USERS   TEMP   2023-11-10   DEFAULT   DEFAULT_CONSUMER_GROUP      10G 11G    N   PASSWORD

--○ 테이블 생성가능하도록 CREATE TABLE 권한 부여
GRANT CREATE TABLE TO TEAM3;
--==>> Grant을(를) 성공했습니다.

--○ 뷰 생성가능하도록 CREATE VIEW 권한 부여
GRANT CREATE VIEW TO TEAM3;
--==>> Grant을(를) 성공했습니다.

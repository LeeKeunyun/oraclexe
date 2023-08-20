/*
DCL(Data Control Language)
    DCL은 테이블에 데이터를 조작할 때 필요한 권한을 조작하는 명령어

관련 키워드
    CONNECT     : 데이터베이스에 접속하는 권한을 제공합니다.
    RESOUCE     : 테이블, 시퀀스 프로시저 등을 생성할 수 있는 권한을 부여합니다.
    ALTER, DROP : 객체의 변경 또는 삭제 권한을 제공합니다.
    DBA : 데이터베이스 관리자로서 시스템을 완전히 제어할 수 있는 권한을 부여합니다.
*/

ALTER SESSION SET "_ORACLE_SCRIPT"=true;




/* 
1. 사용자 생성하기
*/
CREATE USER scott2 IDENTIFIED BY tiger;
-- 결과 : User SCOTT2이(가) 생성되었습니다.



/* 
2. GRANT 접속 권한주기
*/
GRANT CREATE SESSION TO scott2;
-- 또는
GRANT CONNECT TO scott2;

-- 결과 : Grant을(를) 성공했습니다.



/* 
3. GRANT 접속 해제
*/
REVOKE CREATE SESSION FROM scott2;
-- 또는
REVOKE CONNECT FROM scott2;

-- 결과 : Revoke을(를) 성공했습니다.





/*
4. OBJECT 권한주기
*/
GRANT CREATE SEQUENCE TO scott2;
GRANT CREATE SYNONYM TO scott2;
GRANT CREATE TABLE TO scott2;
GRANT CREATE PROCEDURE TO scott2;
GRANT CREATE VIEW TO scott2;



/*
5. 모든 권한주기
*/
GRANT CONNECT, DBA, RESOURCE TO scott2;
-- 결과 : Grant을(를) 성공했습니다.




/*
6. 권한 해제하기
*/
REVOKE CONNECT, DBA, RESOURCE FROM scott2;
-- 결과 : Revoke을(를) 성공했습니다.

-- ==============================================
-- 참고사항 : 연습시, 1 -> 5 -> 6 순으로 진행
-- ==============================================



/*
7. 사용자 비밀번호 변경

 ※ 주의 : 비번 변경은 시스템 중단 리스크가 있다.
*/
-- ALTER USER scott2 IDENTIFIED BY tiger2;







/*
8. ROLE - 권한 그룹
*/

-- 8-1. role 생성방법
CREATE ROLE role01;




-- =============================
-- 아래 내용 보충 필요


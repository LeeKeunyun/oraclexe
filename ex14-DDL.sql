
/*
DDL (Data Definition Language) - 데이터 정의어
    데이터 베이스 내의 구조 및 객체(테이블, 시퀀스 ... 등)를 생성, 변경, 삭제하기 위해 사용되는 sql 문입니다.
*/



/*
1. CREATE TABLE 문
    데이터를 저장할 테이블을 생성합니다.
*/
/*
CREATE TABLE DEPT
(
    DEPTNO NUMBER(6)
    , DNAME VARCHAR2(200) -- 200 BYTE
    , LOC VARCHAR2(200) -- 영문외의 언어는 1글자가 2~4바이트. 한글은 1글자가 2~3바이트임에 주의. (200 바이트 공간에 200글자가 들어가는게 아니다!)
    , CREATE_DATE DATE DEFAULT SYSDATE
)
;
*/



/*
2. 데이터 유형
    VARCHAR2(SIZE) : 가변 길이 문자 데이터 (최대 4000 바이트)
    NUMBER(P,S)    : 가변 길이 숫자 데이터
    CHAR(SIZE)     : 고정 길이 문자 (최대 2000)
    DATE           : 날짜 및 시간 값
    CLOB           : 문자 데이터 (최대 4 기가바이트)
    BLOB           : 바이너리 데이터 (최대 4 기가)
    BFILE          : 파일위치와 메타데이터 저장 (최대 4 기가)
*/

-- 2-1. DEPARTMENTS 테이블을 dept 에 데이터복사하기
/*
INSERT INTO DEPT
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, SYSDATE
FROM DEPARTMENTS
;
*/


/*
2-2. CTAS 는 "Create Table As Select" 의 약자로
데이터베이스에서 새로운 테이블을 생성하는 기법입니다.
이 기법은 기존 테이블에서 SELECT 문을 사용하여 데이터를 조회한 후,
그 결과를 새로운 테이블로 생성하는 방법입니다.
*/

SELECT * FROM DEPT;
DESC DEPT;
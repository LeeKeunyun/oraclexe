
/*
DDL (Data Definition Language) - 데이터 정의어
    데이터 베이스 내의 구조 및 객체(테이블, 시퀀스 ... 등)를 생성, 변경, 삭제하기 위해 사용되는 sql 문입니다.
*/

-- -------------------------------------------------------------

/*
1. CREATE TABLE 문
    데이터를 저장할 테이블을 생성합니다.
*/
/*
CREATE TABLE DEPT
(
    DEPTNO NUMBER(6)
    , DNAME VARCHAR2(200) -- 200 BYTE
    , LOC VARCHAR2(200)
    , CREATE_DATE DATE DEFAULT SYSDATE
)
;
*/


-- -------------------------------------------------------------

/*
2. 데이터 유형
    VARCHAR2(SIZE) : 가변 길이 문자 데이터 (최대 4000 바이트)
    NUMBER(P,S)    : 가변 길이 숫자 데이터
    CHAR(SIZE)     : 고정 길이 문자 (최대 2000)
    DATE           : 날짜 및 시간 값
    CLOB           : 문자 데이터 (최대 4 기가바이트)
    BLOB           : 바이너리 데이터 (최대 4 기가)
    BFILE          : 파일위치와 메타데이터 저장 (최대 4 기가)
    
    
    ※ 한글 ?
     : 영문외의 언어는 1글자가 2~4바이트. 
     : 한글은 1글자가 2~3바이트임에 주의. 
       (200 바이트 공간에 200글자가 들어가는게 아니다!)
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

/*
-- 2-2-1. 테이블 복사하기 => 제약조건은 복사가 안된다.
CREATE TABLE DEPT2 AS
SELECT * FROM DEPT;

-- 2-2-2. 테이블 구조만 복사하기 (조건이 항상 거짓이 되는 편법사용)
CREATE TABLE DEPT3 AS
SELECT * FROM DEPT WHERE 1=2;
*/








-- -------------------------------------------------------------

/*
3. ALTER 문
    데이터베이스 객체 구조나 속성을 변경할 때 사용되는 SQL 명령문입니다.
*/

/*
-- 3-1. 테이블 일단 생성
CREATE TABLE SIMPLE (NUM NUMBER);

-- 3-2. 컬럼 추가
ALTER TABLE SIMPLE
ADD (
    NAME VARCHAR2(3)
);

-- 3-3. 컬럼 수정
ALTER TABLE SIMPLE
MODIFY
(
    NAME VARCHAR2(30)
);

-- 3-4. 컬럼 삭제
ALTER TABLE SIMPLE
DROP COLUMN NAME;

-- 3-5. 컬럼 삭제 다른 방법
ALTER TABLE SIMPLE
DROP(NAME);
*/








-- -------------------------------------------------------------

/*
4. DROP 문
    객체를 삭제할 때 사용되는 SQL 명령문 입니다.
    
    ※ 참고 : 테이블도 하나의 객체입니다.
*/

-- 4-1. 테이블 삭제
-- DROP TABLE SIMPLE;

SELECT * FROM SIMPLE;
DESC SIMPLE;
















-- -------------------------------------------------------------

/*
5. 제약조건(Constraint)
    테이블의 해당컬럼에 원하지 않는 데이터를 입력/수정/삭제 되는 것을 방지하기
    위해 테이블 생성 또는 변경시 설정하는 조건입니다. (저장된 데이터의 신뢰성 높이기 위함)
    
    NOT NULL
        NULL 로 입력이 되어서는 안되는 컬럼에 부여하는
        조건으로 컬럼 레벨에서만 부여 할 수 있는 제약조건입니다.
    UNIQUE KEY(유일키)
        저장된 값이 중복되지 않고 오직 유일하게 유지되어야 할 때
        사용하는 제약조건입니다.(NULL 허용된다)    
    PRIMARY KEY(대표키 또는 기본키)
        NOT NULL 조건과 UNIQUE KEY 를 합친 조건입니다.
    CHECK
        조건에 맞는 데이터만 입력되도록 조건을 부여하는 제약조건입니다.
    FOREIGN KEY(외래키 또는 참조키)
        부모 테이블의 PRIMARY 를 참조하는 컬럼에 붙이는 제약조건입니다.
        
*/

/*
-- 5-1.
-- DEFAULT 문 : 데이터 입력될 때 해당 컬럼에 값이 별도로 지정되지 않을 경우, 디폴트값을 저장하게 한다
CREATE TABLE DEPT4
(
    DEPTNO NUMBER(2) CONSTRAINT DEPT4_DEPTNO_PK PRIMARY KEY
    , DNAME VARCHAR2(15) DEFAULT '영업부'
    , LOC CHAR(1) CONSTRAINT DEPT4_LOC_CK CHECK(LOC IN('1', '2'))
);

INSERT INTO DEPT4 (DEPTNO, DNAME, LOC) VALUES (1, null, '1'); 
-- 성공
-- 왜 DNAME 값이 영업부가 아니고 NULL 로 설정되어 있는가 ? 
-- 그것은 CREATE 시 NULL 값을 강제로 넣도록 SQL 문을 짰기 때문이다.

INSERT INTO DEPT4 (DEPTNO, LOC) VALUES (1, '1'); 
-- 실패(ORA-00001: 무결성 제약 조건(HR.DEPT4_DEPTNO_PK)에 위배됩니다)

INSERT INTO DEPT4 (DEPTNO, LOC) VALUES (2, '1'); 
-- 성공
-- DNAME 에 영업부 값이 설정되어 있다

INSERT INTO DEPT4 (DEPTNO, LOC) VALUES (3, '3'); 
-- 실패(ORA-02290: 체크 제약조건(HR.DEPT4_LOC_CK)이 위배되었습니다)
*/




-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------

/*
-- 5-2. 외래키를 만들기 위해서는 부모테이블 필요
-- 부모테이블 생성
CREATE TABLE DEPT5
(
    DEPTNO NUMBER(2) PRIMARY KEY
    , DNAME VARCHAR2(15) NOT NULL
);
-- 부모테이블 DEPT5 를 참조하는 자식테이블 생성
--DROP TABLE EMP;

-- CONSTRAINT EMP_DEPT5_FK : DEPT5 테이블의 DEPTNO 를 참조해서 외래키를 만들겠다 를 의미.
CREATE TABLE EMP
(
    EMPNO NUMBER(4) PRIMARY KEY
    , ENAME VARCHAR2(15) NOT NULL
    , DEPTNO NUMBER(2)
    , CONSTRAINT EMP_DEPT5_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT5(DEPTNO)
);

INSERT INTO DEPT5 (DEPTNO, DNAME) VALUES (1, '개발부');
INSERT INTO DEPT5 (DEPTNO, DNAME) VALUES (2, '기획부');
INSERT INTO DEPT5 (DEPTNO, DNAME) VALUES (3, '디자인');
COMMIT;
INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (1, 'A', 1);
INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (2, 'B', 3);
COMMIT;
DELETE FROM EMP WHERE EMPNO = 2; --성공
ROLLBACK;
-- ----------------- 아래 부분 주의 ! ---------------------------------
DELETE FROM DEPT5 WHERE DEPTNO = 1;
-- 실패(ORA-02292: 무결성 제약조건(HR.EMP_DEPT5_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다)

DELETE FROM EMP WHERE EMPNO = 1;
DELETE FROM DEPT5 WHERE DEPTNO = 1; --성공
-- ------------------------------------------------------------------
*/





-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- 5-3. 제약조건 조회
SELECT * FROM USER_CONSTRAINTS;

-- 5-4. 5-2 에서 걸었었던 제약조건 조회
SELECT * FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'EMP_DEPT5_FK';

-- 5-5. 특정테이블 내 제약조건 조회
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP';

/*
-- 5-6. 제약조건은 수정 불가능. 삭제만 가능합니다.
ALTER TABLE EMP
DROP CONSTRAINT EMP_DEPT5_FK;

-- 5-7. 제약조건 추가하기
ALTER TABLE EMP
ADD (
    CONSTRAINT EMP_DEPT5_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT5(DEPTNO)
);
*/

-- 5-8. 외래키가 어디 제약조건을 참조하는지 확인
-- EMP 의 외래키 참조조건 관련 값 (R_CONSTRAINT_NAME = SYS_C008362) 을 따라가 보면 됨
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP', 'DEPT5');





SELECT * FROM DEPT5;
SELECT * FROM EMP;
DESC DEPT5;
DESC EMP;
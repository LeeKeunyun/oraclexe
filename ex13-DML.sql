
/*
DML (Data Manipulation Language)
    DB 에서 데이터를 조작하고 처리하는 sql
    
    INSERT : 테이블에 새로운 레코드 삽입
    UPDATE : 테이블에 기존 레코드를 갱신(업데이트) 하는데 사용
    DELETE : 테이블에서 특정 레코드를 삭제
    
    SELECT 는 DML 에 포함될 수 있지만, 보통 DQL (Data Query Language) 로 분류한다.
    
*/


/*
1. INSERT

[기본형식]
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
    VALUES (값1, 값2, ...);
    
    또는
    
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...) subquery;
*/

/*
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES (280, 'public Relations', 100, 1700);

commit; -- DML 결과를 영구적으로 DB 에 반영
*/
select * from DEPARTMENTS;




/*
2. NULL 값을 가진 행 삽입 (열 생략)  
*/

/*
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES (290, 'Purchasing');
commit; -- DML 결과를 영구적으로 DB 에 반영
*/





/*
3. ROLLBACK : DML문의 실행결과를 취소할 때
*/
/*
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES (300, 'Purchasing');
ROLLBACK;
*/




/*
4. NULL 키워드 지정
*/
/*
INSERT INTO DEPARTMENTS
VALUES (300, 'Finance', NULL, NULL);
*/




/*
5. insert 서브쿼리
*/
/*
CREATE TABLE SALES_REPS
AS (
    SELECT EMPLOYEE_ID ID, LAST_NAME NAME, SALARY, COMMISSION_PCT
    FROM EMPLOYEES
    WHERE 1 = 2
    )
;
*/
select * from SALES_REPS;
DESC SALES_REPS;

-- JOB_ID 에서 REP 가 포함된 사원
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
;
/*
INSERT INTO SALES_REPS (ID, NAME, SALARY, COMMISSION_PCT)
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
;
*/





/*
6. UPDATE
    테이블의 기존 값을 수정합니다.
    
[기본형식]
    UPDATE 테이블명
    SET 컬럼명1 = 수정값, 컬럼명2 = 수정값, ... 컬럼명N = 수정값
    WHERE 조건절
*/

/*
-- 일단 임시 테이블을 만들고
CREATE TABLE COPY_EMP
AS SELECT * FROM EMPLOYEES WHERE 1 = 2 -- 스키마(속성값)만 만듬
;
DESC COPY_EMP;
INSERT INTO COPY_EMP
SELECT * FROM EMPLOYEES;
*/


-- 6-1. 업데이트를 해보자
/*
UPDATE COPY_EMP
SET DEPARTMENT_ID = 50
WHERE EMPLOYEE_ID = 113
;
*/

-- 6-2. 모든 행의 데이터를 (일괄) 변경
-- 주의! 일괄 변경은 항상 조심하자.
/*
UPDATE COPY_EMP
SET DEPARTMENT_ID = 110;
*/



-- 6-3. 서브쿼리 사용
/*
UPDATE COPY_EMP
SET DEPARTMENT_ID = (
    SELECT
        DEPARTMENT_ID
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEE_ID = 100
)
WHERE JOB_ID = (
    SELECT
        JOB_ID
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEE_ID = 200
)
;
*/
-- 사원번호 200번 1명의 부서번호를 10 에서 90으로 변경해라
-- SELECT * FROM COPY_EMP WHERE JOB_ID = 'AD_ASST';











/*
7. DELETE
    DELETE 문을 사용하여 테이블에서 기존 행을 제거할 수 있습니다.

*/

-- 7-1. 개별 삭제
/*
DELETE FROM COPY_EMP
WHERE EMPLOYEE_ID = '200';
*/

-- 7-2. 전체 삭제
-- 주의! 일괄 변경은 항상 조심하자.
/*
DELETE FROM COPY_EMP;
*/








/*
8. TRUNCATE 문
    테이블을 빈 상태로, 테이블 구조 그대로 남겨둔채 테이블에서 모든 행을 제거합니다.
    DML 문이 아니라 DDL(데이터 정의어) 문이므로 쉽게 UNDO 할 수 없습니다.    
*/

/*
TRUNCATE TABLE COPY_EMP;
-- 결과 : Table COPY_EMP이(가) 잘렸습니다.
-- 주의! 롤백해도 데이터 복구안됨!
*/
SELECT * FROM COPY_EMP;







/*

================================================
중요 !!!!!!!!!!!!!!!!!!!
================================================

9. 트랜잭션(Transaction)
    데이터 처리의 한 단위입니다.
    오라클에서 발생하는 여러 개의 SQL 명령문을
    하나의 논리적인 작업 단위로 처리하는데 이를 트랜잭션이라고 합니다.
    
    COMMIT : SQL문의 결과를 영구적으로 DB에 반영
    ROLLBACK : SQL문의 실행결과를 취소할 때
    SAVEPOINT : 트랜잭션의 한 지점에 표시하는 임시 저장점
  
*/

/*
-- 9-1. 예시
CREATE TABLE MEMBER
(
    NUM NUMBER PRIMARY KEY,
    NAME VARCHAR2(30),
    ADDR VARCHAR2(50)
)
;

-- 9-2.
-- INSERT 시,
-- 테이블명과 VALUES 사이 컬럼이 생략되면,
-- 테이블내 전체 멤버에 대한 VALUE 를 써줘야 한다
INSERT INTO MEMBER VALUES(1, '피카츄', '태초마을');
COMMIT;
INSERT INTO MEMBER VALUES(2, '라이츄', '태초마을');
INSERT INTO MEMBER VALUES(3, '파이리', '태초마을');
INSERT INTO MEMBER VALUES(4, '꼬부기', '태초마을');

*/

SELECT * FROM MEMBER;
DESC MEMBER;

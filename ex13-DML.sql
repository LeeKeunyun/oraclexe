
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

CREATE TABLE SALES_REPS
AS (
    SELECT EMPLOYEE_ID, LAST_NAME NAME, SALARY, COMMISSION_PCT
    FROM EMPLOYEES
    WHERE 1 = 2
    )
;
select * from SALES_REPS;
DESC SALES_REPS;

-- JOB_ID 에서 REP 가 포함된 사원
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
;
INSERT INTO SALES_REPS (ID, NAME, SALARY, COMMISSION_PCT)
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
;


/*
집합 연산자
    여러 테이블 또는 집합의 결과를 조합하고 조작하는 연산자.
    select 리스트의 표현식은 컬럼 개수가 일치해야 합니다.
    데이터 유형도 일치해야 합니다.
    
    UNION, UNION ALL, INTERSECT, MINUS

*/


/*
1. union 연산자
    2개의 쿼리 결과를 합치고, 중복된 행을 제거합니다.
*/
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID
;
-- 115개 : 직원 ID 200 AD_ASST 중복값이 없다

/*
2. union all 연산자
    2개의 쿼리 결과를 합치고, 중복된 행을 포함하여 모두 반환합니다.
*/
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID
;
-- 117개 : 직원 ID 200 AD_ASST 중복값이 있다


/*
3. INTERSECT 연산자
    2개의 쿼리 결과 중에서 공통된 행만 반환합니다.
*/
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
INTERSECT
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID
;
-- 2개


/*
4. MINUS 연산자
    첫번째 쿼리 결과 중에서 두번째 쿼리 결과에 존재하지 않는 행만 반환합니다.
*/
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
MINUS
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID
;
-- 전체 EMPLOYEES 107개 - 두테이블 중복되는 2개 : 105개

-- --------------------------------------------------
-- 주의 ! 이상 쿼리는 데이터 유형 일치시켜야 한다.
-- --------------------------------------------------
DESC EMPLOYEES;
DESC JOB_HISTORY;



/*
5. 조인하지 않은 두 테이블의 특정 컬럼들을 UNION 하여 가져오기
*/
SELECT LOCATION_ID, DEPARTMENT_NAME AS "Department", TO_CHAR(NULL) "Warehouse location"
FROM DEPARTMENTS --STATE_PROVINCE 컬럼이 없다
UNION
SELECT LOCATION_ID, TO_CHAR(NULL) AS "Department", state_province
FROM LOCATIONS --DEPARTMENT_NAME 컬럼이 없다
;

SELECT EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID, 0
FROM JOB_HISTORY --SALARY 컬럼이 없다
;


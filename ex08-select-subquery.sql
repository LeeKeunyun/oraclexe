/*
1. Subquery 구문
 SELECT 문에 포함되는 SELECT 문 입니다.
*/

-- 1-1. 단일 행 서브쿼리 실행
--  하나의 조회 결과값을 조건으로 하여 또 쿼리를 실행한다.
select last_name, salary
from employees
where salary > ( SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Abel');
-- Abel 사원의 salary(급여)보다 큰 사원의 last_name 과 salary 를 표시해라.
--  ※ Abel 사원의 salary(급여) 는 11000.


-- 1-2. 서브쿼리에서 그룹 함수 사용
select last_name, job_id, salary
from employees
where salary > ( SELECT MIN(SALARY) FROM EMPLOYEES );
-- 돈을 제일 적게 받는 사원의 급여는 2100 인데, 이를 바탕으로 또 쿼리를 조회함



/*
1-3. 여러 행 서브쿼리
 IN
   리스트의 임의 멤버와 같음
 ANY
   =, <>, >, <, <=, >= 연산자가 앞에 있어야 합니다.  
   < ANY는 최대값보다 작음을 의미합니다.
   > ANY는 최소값보다 큼을 의미합니다.
   = ANY는 IN과 같습니다.
 ALL
   > ALL은 최대값보다 큼을 의미합니다.
   < ALL은 최소값보다 작음을 의미합니다.
   
*/


-- 1-3-1.
select 
    employee_id
    , last_name
    , job_id
    , salary
from
    employees
where
    salary < ANY (
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            JOB_ID = 'IT_PROG'
        -- 4200, 4800, 6000, 9000
    )
and
   job_id <> 'IT_PROG'
;
-- IT_PROG 는 9000 이 최대인데,
-- 9000 최대값보다 작은 IT_PROG 이 아닌 사원을 구해라



-- 1-3-2.
select 
    employee_id
    , last_name
    , job_id
    , salary
from
    employees
where
    salary > ALL (
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            JOB_ID = 'IT_PROG'
        -- 4200, 4800, 6000, 9000
    )
and
   job_id <> 'IT_PROG'
;
-- IT_PROG 는 9000 이 최대인데,
-- 9000 최대값보다 큰 IT_PROG 이 아닌 사원을 구해라



-- 1-3-3.
select 
    employee_id
    , last_name
    , job_id
    , salary
from
    employees
where
    salary IN (
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            JOB_ID = 'IT_PROG'
        -- 4200, 4800, 6000, 9000
    )
and
   job_id <> 'IT_PROG'
;
-- IT_PROG 는 4200, 4800, 6000, 9000 이 있는데,
-- IT_PROG 이 아닌 사원 중 4200, 4800, 6000, 9000 에 해당되는 사원을 조회해라


-- =====================================================


/*
 1-4. EXISTS 연산자
  서브쿼리에서 최소한 한 개의 행을 반환하면 TRUE 로 평가됩니다.
*/
select * from departments
where NOT EXISTS (
    SELECT
        *
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
)
;
-- 결과 16개
--  먼저 부서 쿼리를 조회해서 부서 ID 를 가지고 사원 테이블의 부서 ID 와 비교를 한다.
--  그래서 사원이 1명이라도 있으면 TRUE 가 되는데
--  NOT EXIST 가 있으므로 FALSE 로 반전된다
-- 결국, 사원이 없는 부서를 표시한다.
-- (전체부서 27개 = 사원있는 부서 11개 + 사원없는 부서 16개)
--
-- 따라서, 16개가 최종결과가 나온다.

select * from departments
where NOT IN (
    SELECT
        department_id
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
)
; 




select * from departments
where EXISTS (
    SELECT
        *
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
)
;
-- 결과 11개 (사원 있는 부서)












/*
 1-5. 서브쿼리의 null 값
  반환된 값 중 하나가 null 값이면
  전체 쿼리가 행을 반환하지 않습니다.
  
  null 값을 비교하는 모든 조건은 결과가
  null 이기 때문입니다.
*/
select emp.last_name
from employees emp
where emp.employee_id NOT IN (
    SELECT MGR.MANAGER_ID
    FROM EMPLOYEES MGR
);
-- 결과 0개

SELECT MGR.MANAGER_ID FROM EMPLOYEES MGR;
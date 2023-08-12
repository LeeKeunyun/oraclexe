
/*
with 절
    with 절은 서브쿼리 결과를 임시로 정의하고 사용할 수 있는 기능이다.
    공통테이블표현식 CTE(Common Table Expression) 
    
    주로 복잡한 쿼리를 간결하게 작성하거나 가독성을 높이는데 활용된다.
*/


-- 1. 부서별 평균 급여를 계산하는 쿼리
/* 
    SELECT
        DEPARTMENT_ID
        , AVG(SALARY) AS AVGSALARY
    FROM
        EMPLOYEES
    GROUP BY
        DEPARTMENT_ID
    ;
*/
WITH AvgSalByDept AS (
    SELECT
        DEPARTMENT_ID
        , AVG(SALARY) AS AVGSALARY
    FROM
        EMPLOYEES
    GROUP BY
        DEPARTMENT_ID
)
SELECT D.DEPARTMENT_NAME, AvgSalByDept.AVGSALARY
FROM DEPARTMENTS D
JOIN AvgSalByDept
ON D.DEPARTMENT_ID = AvgSalByDept.DEPARTMENT_ID
;

-- WITH 절로 계층표현 : 난이도 상
WITH RecursiveCTE (ID, NAME, MANAGER_ID, DEPTH) AS (
    SELECT EMPLOYEE_ID, LAST_NAME, MANAGER_ID, 0
    FROM EMPLOYEES
    WHERE MANAGER_ID IS NULL --최상위 매니저
    UNION ALL
    SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.MANAGER_ID, RC.DEPTH + 1
    FROM EMPLOYEES E
    INNER JOIN RecursiveCTE RC ON E.MANAGER_ID = RC.id
)

SELECT ID, NAME, MANAGER_ID, DEPTH
FROM RecursiveCTE
;

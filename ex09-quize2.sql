-- 1. 각 직원의 성(last_name)과 해당 직원의 매니저인 직원의 성(last_name) 조회하기
SELECT
    E.EMPLOYEE_ID "직원ID"
    , E.LAST_NAME "직원의 성"
    , NVL2(E.MANAGER_ID, TO_CHAR(E.MANAGER_ID), '매니저 없음') AS "매니저ID"
    , NVL(M.LAST_NAME, '미해당') AS "매니저의 성"
FROM
    EMPLOYEES E
LEFT OUTER JOIN
    EMPLOYEES M
ON
    E.MANAGER_ID = M.EMPLOYEE_ID
ORDER BY E.EMPLOYEE_ID
;

-- 2. 각 직원의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기
SELECT
    E.EMPLOYEE_ID "직원ID"
    , E.LAST_NAME "직원의 성"
    , NVL2(E.DEPARTMENT_ID, TO_CHAR(E.DEPARTMENT_ID), '부서 없음') "부서ID"
    , NVL(D.DEPARTMENT_NAME, '미해당') "부서 이름"
FROM
    EMPLOYEES E
LEFT OUTER JOIN
    DEPARTMENTS D
ON
    E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY
    E.EMPLOYEE_ID
;

-- 3. 각 부서의 이름(department_name)과 해당 부서의 평균 급여(avg_salary) 조회하기
SELECT
    D.DEPARTMENT_ID "부서ID"
    , D.DEPARTMENT_NAME "부서 이름"
    , AVG(E.SALARY) "평균 급여"
FROM DEPARTMENTS D
JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
;

-- 4. 각 부서의 이름(department_name)과 해당 부서의 최대 급여(max_salary) 조회하기
SELECT
    D.DEPARTMENT_ID "부서ID"
    , D.DEPARTMENT_NAME "부서 이름"
    , MAX(E.SALARY) "최대 급여"
FROM DEPARTMENTS D
JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
;
-- 5. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 최소 급여(min_salary) 조회하기
SELECT
    E.EMPLOYEE_ID "직원ID"
    , E.LAST_NAME "직원의 성"
    , D.DEPARTMENT_ID "부서ID"
    , D.DEPARTMENT_NAME "부서명"
    , MIN(S.SALARY) "최소 급여"
FROM
    EMPLOYEES E
JOIN
    DEPARTMENTS D
ON
    E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN
    EMPLOYEES S
ON
    D.DEPARTMENT_ID = S.DEPARTMENT_ID
GROUP BY
    E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
ORDER BY
    E.EMPLOYEE_ID
;

-- 위보다 더 좋은 쿼리
SELECT
    OE.EMPLOYEE_ID "직원 ID"
    , OE.LAST_NAME "직원의 성"
    , OD.DEPARTMENT_ID "부서ID"
    , OD.DEPARTMENT_NAME "부서명"
    , OD.SALARY "최소 급여"
FROM
    EMPLOYEES OE
JOIN
    (
        SELECT
            D.DEPARTMENT_ID
            , D.DEPARTMENT_NAME
            , MIN(E.SALARY) "SALARY"
        FROM
            DEPARTMENTS D
        JOIN
            EMPLOYEES E
        ON
            D.DEPARTMENT_ID = E.DEPARTMENT_ID
        GROUP BY
            D.DEPARTMENT_ID, D.DEPARTMENT_NAME
    ) OD
ON
    OE.DEPARTMENT_ID = OD.DEPARTMENT_ID
;

-- 6. 각 부서의 이름(department_name)과 해당 부서에 속한 직원 중 가장 높은 급여(highest_salary) 조회하기
/* 3번 문제와 답이 같음 */

-- 7. 각 직원의 성(last_name)과 해당 직원의 매니저의 성(last_name) 및 부서 이름(department_name) 조회하기
SELECT
    E.EMPLOYEE_ID "직원ID"
    , E.LAST_NAME "직원의 성"
    , NVL2(E.MANAGER_ID, TO_CHAR(E.MANAGER_ID), '매니저 없음') "매니저ID"
    , NVL(M.LAST_NAME, TO_CHAR('미해당')) "매니저의 성"
    , NVL2(M.DEPARTMENT_ID, TO_CHAR(M.DEPARTMENT_ID), '부서 없음') "부서ID"
    , NVL(D.DEPARTMENT_NAME, TO_CHAR('미해당')) "부서 이름"
FROM
    EMPLOYEES E
LEFT OUTER JOIN
    EMPLOYEES M
ON
    E.MANAGER_ID = M.EMPLOYEE_ID
LEFT OUTER JOIN
    DEPARTMENTS D
ON
    M.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY
    E.EMPLOYEE_ID
;

-- 8. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 매니저의 성(last_name) 조회하기
SELECT
    E.EMPLOYEE_ID "직원ID"
    , E.LAST_NAME "직원의 성"
    , E.DEPARTMENT_ID "부서ID"
    , D.DEPARTMENT_NAME "부서명"
    , D.MANAGER_ID "부서 매니저 ID"
    , R.LAST_NAME "부서 매니저 성"
FROM
    EMPLOYEES E
LEFT OUTER JOIN
    DEPARTMENTS D
ON
    E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT OUTER JOIN
    EMPLOYEES R
ON
    D.MANAGER_ID = R.EMPLOYEE_ID
ORDER BY
    E.EMPLOYEE_ID
;

-- 더 좋은 쿼리 ????
SELECT
    OE.EMPLOYEE_ID "직원ID"
    , OE.LAST_NAME "직원의 성"
    , OE.DEPARTMENT_ID "부서ID"
    , OE.DEPARTMENT_NAME "부서명"
    , OE.MANAGER_ID "부서 매니저 ID"
    , OM.LAST_NAME "부서 매니저 성"
FROM
    (
        SELECT
            E.EMPLOYEE_ID
            , E.LAST_NAME
            , E.DEPARTMENT_ID
            , D.DEPARTMENT_NAME
            , D.MANAGER_ID
        FROM EMPLOYEES E
        JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    ) OE
JOIN
    EMPLOYEES OM
ON
    OE.MANAGER_ID = OM.EMPLOYEE_ID
ORDER BY
    OE.EMPLOYEE_ID
;

-- 9. 각 직원의 성(last_name)과 해당 직원의 보고 상사가 있는 경우 보고 상사의 성(last_name) 조회하기
-- 10. 직원들 중에서 급여(salary)가 10000 이상인 직원들의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기
SELECT
    E.EMPLOYEE_ID
    , E.LAST_NAME
    , E.SALARY
    , E.DEPARTMENT_ID
    , D.DEPARTMENT_NAME
FROM
    EMPLOYEES E
JOIN
    DEPARTMENTS D
ON
    E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE
    E.SALARY >= 10000
ORDER BY
    E.EMPLOYEE_ID;
/*
11.
각 부서의 이름(department_name), 해당 부서의 매니저의 ID(manager_id)와 매니저의 성(last_name),
직원의 ID(employee_id), 직원의 성(last_name), 그리고 해당 직원의 급여(salary) 조회하기.
직원들의 급여(salary)가 해당 부서의 평균 급여보다 높은 직원들을 조회합니다.
결과는 부서 이름과 직원의 급여가 높은 순으로 정렬됩니다.
*/ 
/*
SELECT
    E.DEPARTMENT_ID
    , AVG(E.SALARY)
FROM
    EMPLOYEES E
GROUP BY
    E.DEPARTMENT_ID
;
*/

SELECT
    E.EMPLOYEE_ID "직원 ID"
    , E.LAST_NAME "직원 성"
    , E.DEPARTMENT_ID "직원 부서 ID"
    , E.SALARY "직원 급여"
    , D.DEPARTMENT_NAME "부서명"
    , D.MANAGER_ID "부서 매니저 ID"
    , M.LAST_NAME "부서 매니저 성"
    , CAL.SALARY "부서 평균 급여"
FROM
    EMPLOYEES E
JOIN
    DEPARTMENTS D
ON
    E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN
    EMPLOYEES M
ON
    D.MANAGER_ID = M.EMPLOYEE_ID
JOIN
    (
        SELECT
            DEPARTMENT_ID
            , AVG(SALARY) AS "SALARY"
        FROM
            EMPLOYEES
        GROUP BY
            DEPARTMENT_ID
    ) CAL
ON
    E.DEPARTMENT_ID = CAL.DEPARTMENT_ID
WHERE
    E.SALARY >= CAL.SALARY
ORDER BY
    D.DEPARTMENT_ID, E.SALARY DESC
;

/*
-- ?????????????????
SELECT
    D.DEPARTMENT_NAME
    , D.MANAGER_ID
    , M.LAST_NAME
FROM
    DEPARTMENTS D
JOIN
    EMPLOYEES M
ON
    D.MANAGER_ID = M.EMPLOYEE_ID
;
-- 11

SELECT
    E.EMPLOYEE_ID
    , E.LAST_NAME
    , E.SALARY
FROM
    EMPLOYEES E
;
-- 107
*/

-- =======================================================
-- 1번째 방법 : 서브 쿼리 방식
-- =======================================================
SELECT
    D.DEPARTMENT_ID
    , D.DEPARTMENT_NAME
    , D.MANAGER_ID
    , M.LAST_NAME
    , E.EMPLOYEE_ID
    , E.LAST_NAME
    , E.SALARY
FROM
    DEPARTMENTS D
JOIN
    EMPLOYEES M
ON
    D.MANAGER_ID = M.EMPLOYEE_ID
JOIN
    EMPLOYEES E
ON
    D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE
    1 = 1
    AND E.SALARY > (
        SELECT
            AVG(E1.SALARY)
        FROM
            EMPLOYEES E1
        WHERE
            E1.DEPARTMENT_ID = D.DEPARTMENT_ID
    )
ORDER BY
    D.DEPARTMENT_NAME, E.SALARY DESC    
;

-- =======================================================
-- 2번째 방법 : 조인 방식
-- =======================================================
SELECT
    D.DEPARTMENT_ID
    , D.DEPARTMENT_NAME
    , D.MANAGER_ID
    , M.LAST_NAME
    , E.EMPLOYEE_ID
    , E.LAST_NAME
    , E.SALARY
FROM
    DEPARTMENTS D
JOIN
    EMPLOYEES M
ON
    D.MANAGER_ID = M.EMPLOYEE_ID
JOIN
    EMPLOYEES E
ON
    D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN (
    SELECT
        DEPARTMENT_ID
        , AVG(SALARY) "AVG_SALARY"
    FROM
        EMPLOYEES
    GROUP BY
        DEPARTMENT_ID
) DA
ON
    D.DEPARTMENT_ID = DA.DEPARTMENT_ID
WHERE
    E.SALARY > DA.AVG_SALARY
ORDER BY
    D.DEPARTMENT_NAME, E.SALARY DESC    
;

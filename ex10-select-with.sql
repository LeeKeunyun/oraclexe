
/*
with ��
    with ���� �������� ����� �ӽ÷� �����ϰ� ����� �� �ִ� ����̴�.
    �������̺�ǥ���� CTE(Common Table Expression) 
    
    �ַ� ������ ������ �����ϰ� �ۼ��ϰų� �������� ���̴µ� Ȱ��ȴ�.
*/


-- 1. �μ��� ��� �޿��� ����ϴ� ����
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

-- WITH ���� ����ǥ�� : ���̵� ��
WITH RecursiveCTE (ID, NAME, MANAGER_ID, DEPTH) AS (
    SELECT EMPLOYEE_ID, LAST_NAME, MANAGER_ID, 0
    FROM EMPLOYEES
    WHERE MANAGER_ID IS NULL --�ֻ��� �Ŵ���
    UNION ALL
    SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.MANAGER_ID, RC.DEPTH + 1
    FROM EMPLOYEES E
    INNER JOIN RecursiveCTE RC ON E.MANAGER_ID = RC.id
)

SELECT ID, NAME, MANAGER_ID, DEPTH
FROM RecursiveCTE
;

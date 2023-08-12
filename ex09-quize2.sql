-- 1. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ������ ��(last_name) ��ȸ�ϱ�
SELECT
    E.EMPLOYEE_ID "����ID"
    , E.LAST_NAME "������ ��"
    , NVL2(E.MANAGER_ID, TO_CHAR(E.MANAGER_ID), '�Ŵ��� ����') AS "�Ŵ���ID"
    , NVL(M.LAST_NAME, '���ش�') AS "�Ŵ����� ��"
FROM
    EMPLOYEES E
LEFT OUTER JOIN
    EMPLOYEES M
ON
    E.MANAGER_ID = M.EMPLOYEE_ID
ORDER BY E.EMPLOYEE_ID
;

-- 2. �� ������ ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT
    E.EMPLOYEE_ID "����ID"
    , E.LAST_NAME "������ ��"
    , NVL2(E.DEPARTMENT_ID, TO_CHAR(E.DEPARTMENT_ID), '�μ� ����') "�μ�ID"
    , NVL(D.DEPARTMENT_NAME, '���ش�') "�μ� �̸�"
FROM
    EMPLOYEES E
LEFT OUTER JOIN
    DEPARTMENTS D
ON
    E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY
    E.EMPLOYEE_ID
;

-- 3. �� �μ��� �̸�(department_name)�� �ش� �μ��� ��� �޿�(avg_salary) ��ȸ�ϱ�
SELECT
    D.DEPARTMENT_ID "�μ�ID"
    , D.DEPARTMENT_NAME "�μ� �̸�"
    , AVG(E.SALARY) "��� �޿�"
FROM DEPARTMENTS D
JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
;

-- 4. �� �μ��� �̸�(department_name)�� �ش� �μ��� �ִ� �޿�(max_salary) ��ȸ�ϱ�
SELECT
    D.DEPARTMENT_ID "�μ�ID"
    , D.DEPARTMENT_NAME "�μ� �̸�"
    , MAX(E.SALARY) "�ִ� �޿�"
FROM DEPARTMENTS D
JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
;
-- 5. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �ּ� �޿�(min_salary) ��ȸ�ϱ�
SELECT
    E.EMPLOYEE_ID "����ID"
    , E.LAST_NAME "������ ��"
    , D.DEPARTMENT_ID "�μ�ID"
    , D.DEPARTMENT_NAME "�μ���"
    , MIN(S.SALARY) "�ּ� �޿�"
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

-- ������ �� ���� ����
SELECT
    OE.EMPLOYEE_ID "���� ID"
    , OE.LAST_NAME "������ ��"
    , OD.DEPARTMENT_ID "�μ�ID"
    , OD.DEPARTMENT_NAME "�μ���"
    , OD.SALARY "�ּ� �޿�"
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

-- 6. �� �μ��� �̸�(department_name)�� �ش� �μ��� ���� ���� �� ���� ���� �޿�(highest_salary) ��ȸ�ϱ�
/* 3�� ������ ���� ���� */

-- 7. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ��(last_name) �� �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT
    E.EMPLOYEE_ID "����ID"
    , E.LAST_NAME "������ ��"
    , NVL2(E.MANAGER_ID, TO_CHAR(E.MANAGER_ID), '�Ŵ��� ����') "�Ŵ���ID"
    , NVL(M.LAST_NAME, TO_CHAR('���ش�')) "�Ŵ����� ��"
    , NVL2(M.DEPARTMENT_ID, TO_CHAR(M.DEPARTMENT_ID), '�μ� ����') "�μ�ID"
    , NVL(D.DEPARTMENT_NAME, TO_CHAR('���ش�')) "�μ� �̸�"
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

-- 8. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �Ŵ����� ��(last_name) ��ȸ�ϱ�
SELECT
    E.EMPLOYEE_ID "����ID"
    , E.LAST_NAME "������ ��"
    , E.DEPARTMENT_ID "�μ�ID"
    , D.DEPARTMENT_NAME "�μ���"
    , D.MANAGER_ID "�μ� �Ŵ��� ID"
    , R.LAST_NAME "�μ� �Ŵ��� ��"
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

-- �� ���� ���� ????
SELECT
    OE.EMPLOYEE_ID "����ID"
    , OE.LAST_NAME "������ ��"
    , OE.DEPARTMENT_ID "�μ�ID"
    , OE.DEPARTMENT_NAME "�μ���"
    , OE.MANAGER_ID "�μ� �Ŵ��� ID"
    , OM.LAST_NAME "�μ� �Ŵ��� ��"
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

-- 9. �� ������ ��(last_name)�� �ش� ������ ���� ��簡 �ִ� ��� ���� ����� ��(last_name) ��ȸ�ϱ�
-- 10. ������ �߿��� �޿�(salary)�� 10000 �̻��� �������� ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
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
�� �μ��� �̸�(department_name), �ش� �μ��� �Ŵ����� ID(manager_id)�� �Ŵ����� ��(last_name),
������ ID(employee_id), ������ ��(last_name), �׸��� �ش� ������ �޿�(salary) ��ȸ�ϱ�.
�������� �޿�(salary)�� �ش� �μ��� ��� �޿����� ���� �������� ��ȸ�մϴ�.
����� �μ� �̸��� ������ �޿��� ���� ������ ���ĵ˴ϴ�.
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
    E.EMPLOYEE_ID "���� ID"
    , E.LAST_NAME "���� ��"
    , E.DEPARTMENT_ID "���� �μ� ID"
    , E.SALARY "���� �޿�"
    , D.DEPARTMENT_NAME "�μ���"
    , D.MANAGER_ID "�μ� �Ŵ��� ID"
    , M.LAST_NAME "�μ� �Ŵ��� ��"
    , CAL.SALARY "�μ� ��� �޿�"
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
-- 1��° ��� : ���� ���� ���
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
-- 2��° ��� : ���� ���
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

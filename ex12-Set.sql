
/*
���� ������
    ���� ���̺� �Ǵ� ������ ����� �����ϰ� �����ϴ� ������.
    select ����Ʈ�� ǥ������ �÷� ������ ��ġ�ؾ� �մϴ�.
    ������ ������ ��ġ�ؾ� �մϴ�.
    
    UNION, UNION ALL, INTERSECT, MINUS

*/


/*
1. union ������
    2���� ���� ����� ��ġ��, �ߺ��� ���� �����մϴ�.
*/
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID
;
-- 115�� : ���� ID 200 AD_ASST �ߺ����� ����

/*
2. union all ������
    2���� ���� ����� ��ġ��, �ߺ��� ���� �����Ͽ� ��� ��ȯ�մϴ�.
*/
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID
;
-- 117�� : ���� ID 200 AD_ASST �ߺ����� �ִ�


/*
3. INTERSECT ������
    2���� ���� ��� �߿��� ����� �ุ ��ȯ�մϴ�.
*/
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
INTERSECT
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID
;
-- 2��


/*
4. MINUS ������
    ù��° ���� ��� �߿��� �ι�° ���� ����� �������� �ʴ� �ุ ��ȯ�մϴ�.
*/
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
MINUS
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID
;
-- ��ü EMPLOYEES 107�� - �����̺� �ߺ��Ǵ� 2�� : 105��

-- --------------------------------------------------
-- ���� ! �̻� ������ ������ ���� ��ġ���Ѿ� �Ѵ�.
-- --------------------------------------------------
DESC EMPLOYEES;
DESC JOB_HISTORY;



/*
5. �������� ���� �� ���̺��� Ư�� �÷����� UNION �Ͽ� ��������
*/
SELECT LOCATION_ID, DEPARTMENT_NAME AS "Department", TO_CHAR(NULL) "Warehouse location"
FROM DEPARTMENTS --STATE_PROVINCE �÷��� ����
UNION
SELECT LOCATION_ID, TO_CHAR(NULL) AS "Department", state_province
FROM LOCATIONS --DEPARTMENT_NAME �÷��� ����
;

SELECT EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID, 0
FROM JOB_HISTORY --SALARY �÷��� ����
;


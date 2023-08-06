/*
1. Subquery ����
 SELECT ���� ���ԵǴ� SELECT �� �Դϴ�.
*/

-- 1-1. ���� �� �������� ����
--  �ϳ��� ��ȸ ������� �������� �Ͽ� �� ������ �����Ѵ�.
select last_name, salary
from employees
where salary > ( SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Abel');
-- Abel ����� salary(�޿�)���� ū ����� last_name �� salary �� ǥ���ض�.
--  �� Abel ����� salary(�޿�) �� 11000.


-- 1-2. ������������ �׷� �Լ� ���
select last_name, job_id, salary
from employees
where salary > ( SELECT MIN(SALARY) FROM EMPLOYEES );
-- ���� ���� ���� �޴� ����� �޿��� 2100 �ε�, �̸� �������� �� ������ ��ȸ��



/*
1-3. ���� �� ��������
 IN
   ����Ʈ�� ���� ����� ����
 ANY
   =, <>, >, <, <=, >= �����ڰ� �տ� �־�� �մϴ�.  
   < ANY�� �ִ밪���� ������ �ǹ��մϴ�.
   > ANY�� �ּҰ����� ŭ�� �ǹ��մϴ�.
   = ANY�� IN�� �����ϴ�.
 ALL
   > ALL�� �ִ밪���� ŭ�� �ǹ��մϴ�.
   < ALL�� �ּҰ����� ������ �ǹ��մϴ�.
   
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
-- IT_PROG �� 9000 �� �ִ��ε�,
-- 9000 �ִ밪���� ���� IT_PROG �� �ƴ� ����� ���ض�



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
-- IT_PROG �� 9000 �� �ִ��ε�,
-- 9000 �ִ밪���� ū IT_PROG �� �ƴ� ����� ���ض�



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
-- IT_PROG �� 4200, 4800, 6000, 9000 �� �ִµ�,
-- IT_PROG �� �ƴ� ��� �� 4200, 4800, 6000, 9000 �� �ش�Ǵ� ����� ��ȸ�ض�


-- =====================================================


/*
 1-4. EXISTS ������
  ������������ �ּ��� �� ���� ���� ��ȯ�ϸ� TRUE �� �򰡵˴ϴ�.
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
-- ��� 16��
--  ���� �μ� ������ ��ȸ�ؼ� �μ� ID �� ������ ��� ���̺��� �μ� ID �� �񱳸� �Ѵ�.
--  �׷��� ����� 1���̶� ������ TRUE �� �Ǵµ�
--  NOT EXIST �� �����Ƿ� FALSE �� �����ȴ�
-- �ᱹ, ����� ���� �μ��� ǥ���Ѵ�.
-- (��ü�μ� 27�� = ����ִ� �μ� 11�� + ������� �μ� 16��)
--
-- ����, 16���� ��������� ���´�.

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
-- ��� 11�� (��� �ִ� �μ�)












/*
 1-5. ���������� null ��
  ��ȯ�� �� �� �ϳ��� null ���̸�
  ��ü ������ ���� ��ȯ���� �ʽ��ϴ�.
  
  null ���� ���ϴ� ��� ������ �����
  null �̱� �����Դϴ�.
*/
select emp.last_name
from employees emp
where emp.employee_id NOT IN (
    SELECT MGR.MANAGER_ID
    FROM EMPLOYEES MGR
);
-- ��� 0��

SELECT MGR.MANAGER_ID FROM EMPLOYEES MGR;
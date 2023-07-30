
/*
    1. order by 

    asc : ��������, �⺻��
    desc : ��������
    
    select ���� �� �������� ��ġ�Կ� ����
*/

select employee_id, last_name, job_id, salary, hire_date
from employees
order by hire_date; -- 01/01/13 , 02/06/07 ������ ǥ��

select employee_id, last_name, job_id, salary, hire_date
from employees
order by hire_date desc; -- 08/04/21 , 08/03/24 ������ ǥ��


-- 2. �� alias �� �������� ����

select employee_id, last_name, job_id, salary*12 AS annsal
from employees
order by annsal; -- salary �� 12 �� ���� ���� ��Ī���� ����, ��Ī�� �������� ������

-- ���ǻ��� : ��Ī�� ordey by ���� �����ִ�







/*******************************************************

3.
select ������ �Ʒ��� ���� �Ǿ� ������ �� ���� ����Ŭ���� � ������� �о���ϱ� ?
 => from ���� ���� ���� �а�, ORDER BY ���� ���� ���߿� �д´�

SELECT [distinct] �÷�1, �÷�2               .5
FROM                                                     .1 
WHERE                                                   .2
GROUP BY                                             .3
HAVING                                                  .4
ORDER BY                                              .6

*******************************************************/



-- 4. �� ���� ��ġ�� ����Ͽ� ����

select employee_id, last_name, job_id, salary*12 AS annsal
from employees
order by 3; -- job_id �÷��� ����


-- 5. ���� ���� �������� ����

select last_name, job_id, department_id, salary
from employees
order by department_id, salary desc;



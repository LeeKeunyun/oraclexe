
/* Q1.

*/

select
    last_name "��"
    , first_name "�̸�"
    , salary "�޿�"
from
    employees
;    
    

/* Q2.

*/
select
    job_id "���� ID"
    , job_title "������"
from
    jobs
;    


/* Q3.

*/
select
    department_id "�μ� ID"
    , department_name "�μ���"
from
    departments
;    

/* Q4.

*/
select
    location_id "���� ID"
    , city "����"
from
    locations
;    

/* Q5.

*/
select
    first_name "�̸�"
    , salary "�޿�"
from employees
where salary >= 5000
--order by �޿�
;    



/* Q6.

*/
select
    first_name "�̸�"
    , hire_date "�ٹ� ������"
from employees
where SUBSTR(hire_date,1,2) >= 05
order by "�ٹ� ������";


select
    first_name "�̸�"
    , hire_date "�ٹ� ������"
from employees
where hire_date >'05/01/01'
order by "�ٹ� ������";


select
    first_name "�̸�"
    , hire_date "�ٹ� ������"
from employees
where hire_date > TO_DATE('2005-01-01', 'YYYY-MM-DD')
order by "�ٹ� ������"; -- �̰��� �ùٸ� �� ???



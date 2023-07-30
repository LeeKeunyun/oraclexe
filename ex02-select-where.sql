

-- 1. where �⺻ ����

select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

-- 2. ���ڿʹ� �޸� ���ڿ��� ' ��ȣ�� �翷�� �ٴ´�
--    �̶� ��ҹ��ڸ� �����ؼ� ��� ��
select employee_id, last_name, job_id, department_id
from employees
where last_name = 'Whalen';

/*
   3. ��¥ ���� ������ �����ؼ� ��� ��  
*/
select last_name, hire_date
from employees
where hire_date = '03/06/17';

/*
      4.
       �⺻ ��¥ ǥ�������� DD-MM-RR �̴�.
       �׷��� SQL developer ������ ȯ�漳�� (�����ͺ��̽� > NLS > ��¥����(F)) �� RR/MM/DD ������ �Ǿ� ���� ���, ����� RR/MM/DD �� ���´�
*/
select last_name, hire_date
from employees
where last_name  = 'King'; -- 03/06/17


/*
   5. �ܼ��� sqlplus �� �Ʒ� ������ �����ϸ� DD-MM-RR ����� ���´�
*/
select last_name, hire_date
from employees
where last_name  = 'King'; -- 17-06-03



/*
 6. ������
  = 
  > 
  >= 
  < 
  <=                           
  <>                                         ���� ����
   BETWEEN ... AND ...                �� �� ����(��谪 ����)
   IN(set)                                   �� ����Ʈ �� ��ġ�ϴ� �� �˻�
   LIKE                                      ��ġ�ϴ� ���� ���� �˻�
   IS NULL                                  NULL ������ ����
*/


/*
  7. BETWEEN
*/
select last_name, salary
from employees
where salary >= 2500 and salary <= 3500; -- BETWEEN 2500 AND 3500 �� ���� ����� ���´�


-- 8. IN
select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100, 101, 201);


-- 9. or
--       8���� ���� ����� ��������, 8, 9�� �߿��� 9�� ����� �� ���� �ʴ´�.
--       �׷��ٰ� 9�� or ��� ��ü�� �� ���� �ʴ°� �ƴϴ�.
--       8, 9�� ��� 2�� ����� ���������� 9�� ����� �� ���� ���� ���̴�.
select employee_id, last_name, salary, manager_id
from employees
where manager_id = 100
or manager_id = 101
or manager_id = 102;


-- 10. LIKE
select first_name
from employees
where first_name LIKE '______o%';

/*
 like ���� ������ �̿��Ͽ� �˻��� �� �� �ִ� ��ɾ��
 % : 0�� �̻�
 _ : ????????????????
 
 %b%           �ҹ��� b �� ���Ե� ���� ��� ǥ��
 %B%           �빮�� B �� ���Ե� ���� ��� ǥ��
 b%           �ҹ��� b �� ���۵Ǵ� ���� ��� ǥ��
 B%           �빮�� B �� ���۵Ǵ� ���� ��� ǥ��
 _o%             o �� 2��°�� ������ ����� ǥ�� (��ü���� ����)
 ______o%       o �� 7��°�� ������ ����� ǥ��
*/



/*
-- 11. escape
          �Ʒ� ������ SA_ �� ���Ե� ����� ǥ���Ѵ�. ESCAPE Ű����� �� ���� ��ȣ�� ' ����ǥ�� �̿��Ͽ� ǥ���ؾ� �Կ� �����Ѵ�
*/
select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' ESCAPE '\'; 

select employee_id, last_name, job_id
from employees
where job_id like '%SA$_%' ESCAPE '$'; -- �� ������(\)�� $ �� �ٲ��ִ� ȿ��


-- 12. null ����
select last_name, manager_id
from employees
where manager_id is null;

select last_name, manager_id
from employees
where manager_id = null; -- �̷����ϸ� ����� �ȳ��´� (�̷��� ���� �ȵȴ�)


-- 13. �� ������ --------- AND OR NOT �� �ִ�
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
and job_id LIKE '%MAN%';

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
or job_id LIKE '%MAN';

select employee_id, last_name, job_id, salary
from employees
--where job_id in ('IT_PROG', 'ST_CLERK', 'SA_REP'); -- 103 104 105 106 107 125 126 127 128 129 .... 144 150 151
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_REP'); -- 100 101 102 108 ... 124 145 ... 149


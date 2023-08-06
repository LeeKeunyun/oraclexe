
/*
1. JOIN

-- JOIN �� ���� : SQL ���� 2�� �̻��� ���̺��� ���õ� ����� �����ϱ� ���� ����.
-- JOIN �� ����
 Natural join : �� ���̺��� 
               ������ ������ �̸��� ��ġ�ϴ� ���� �������
               �ڵ����� ���̺��� ������ �� �ִ�.
             
*/

-- 1.1 natural join
select 
    department_id, department_name, location_id
    , city
from departments
NATURAL JOIN locations;
-- departments �� location 2�� ���̺��� �ִ�
-- departments ���� city �� ����
-- locations ���� city �� �ִ�
-- �׷��� 2�� ���̺��� location_id �� ��� �ְ�
--      departments ���� location_id �� FK �̴�.
--      locations ���� location_id �� PK �̴�.
-- �׷� ���������� location_id �� �ȴ�. 


-- �� ���� : FK (Foreign key) �� ����Ű �Ǵ� �ܷ�Ű��� �ϸ�
--          PK �� Primary key �� �⺻Ű��� �Ѵ�.


-- ==========================================
-- ���� ������ 
-- A. �� ���̺��� Ű �̸����� �����鼭
-- B. �� Ű�� �� ���̺� PK, FK �� ���ǵǾ� ���� ���
-- C. "�ڵ����� ����"�� ���ش�.
-- ==========================================




-- 1.2 USING ���� join
--  ��������� ������ �����ϰ����ϴ� ���� �����ش�.
select 
    employee_id, last_name, DEPARTMENT_ID
    ,location_id    
from employees JOIN departments
USING (DEPARTMENT_ID)
;
-- ��� ���̺��� location_id �� ����.
-- location_id �� departments ���̺��� �����;� �Ѵ�.



-- 1-3. ON ���� ����
--  ON ���� ����Ͽ� ���� ������ �����Ѵ�. (���� Ÿ�� �߿��� ���� ������ Ÿ��)
select 
    E.employee_id
    , E.last_name
    , E.DEPARTMENT_ID
    , D.DEPARTMENT_ID
    , D.location_id
from employees E JOIN departments D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);


-- 1-3-1. ON ���� ����
select 
    E.employee_id
    , E.last_name
    , E.DEPARTMENT_ID
    --, D.DEPARTMENT_ID --������ ����. �� DEPARTMENT_ID ���� E. �Ǵ� D. �� �ٿ���� �Ѵ�.
    , D.location_id
from employees E JOIN departments D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- 1-3-2. 
--  ��(1-3-1)�� ���� ����� ������ �����ش�.

--    1-3-1. �� ANSI ǥ�ع���̹Ƿ� oracle �� �ٸ� dbms �� ���۵�.
--    1-3-2. �� ����Ŭ������ ���۵ǳ� �ٸ� dbms �� Ȯ���� �ʿ�.

select 
    E.employee_id
    , E.last_name
    , E.DEPARTMENT_ID
    , D.location_id
from employees E, departments D
where E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- 1-4. ON �� ����Ͽ� 3-Way ���� ???

/* �Ʒ� ������ �����ΰ� ??
select
    E.employee_id --employees table
    , L.city --locations table
    , D.department_name --departments table
from
    employees E
    , locations L
    , departments D
ON
    (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    AND (D.LOCATION_ID = L.LOCATION_ID)
;
*/

-- �Ʒ��� ����!
select
    E.employee_id --employees table
    , L.city --locations table
    , D.department_name --departments table
from
    employees E
JOIN
    departments D
ON
    E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN
    locations L
ON
    D.LOCATION_ID = L.LOCATION_ID  
;



-- 1-5. ON join ���� ����
select
    E.employee_id --employees table
    , E.last_name
    , E.first_name
    , L.LOCATION_ID
    , L.city --locations table
    , E.DEPARTMENT_ID
    , D.department_name --departments table
from employees E
JOIN departments D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN locations L
ON D.LOCATION_ID = L.LOCATION_ID  
;


-- 1-6. ���ο� �߰� ���� ����
select 
    E.employee_id
    , E.last_name
    , E.manager_id
    , E.department_id
    , D.department_id
    , D.location_id
from
    employees E
JOIN
    departments D
ON
    E.department_id = D.department_id
    AND E.manager_id = 149
;



-- 1.7. ���̺� ��ü ����
--  ON ���� ����ϴ� Self Join
select
    worker.last_name AS emp
    , manager.last_name AS mgr
from
    employees worker
join
    employees manager
on
    worker.manager_id = manager.manager_id
;
-- ���� :
-- select * from employees; �� �����ϸ�
-- table ���� ����� �̸��� ǥ�õǳ� �Ŵ��� �̸������� ǥ�ð� �ȵȴ�.
-- �Ŵ��� �̸����� ǥ���ϰ� �Ϸ��� self join �� �ؾ� �Ѵ�.





-- 1-8. Nonequijoin
--  ��ȣ ������ ���� �ٸ� �����ڸ� �����ϴ� ���� �����̴�.




select * from employees;
select * from employees where manager_id = 149;
select * from departments;
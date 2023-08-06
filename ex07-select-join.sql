
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
--  �ϴ� �Ʒ� �ּ�ó���� ������ �����Ͽ� job_grades ���̺��� ����� �����͸� ����. �׸��� Ŀ���� ����.
--  �Ʒ� ������ ��ȣ �ܿ� �����ε� ������ �� �� ������ �����ش�.

select 
    E.last_name
    , E.salary
    , J.grade_level
from
    employees E
join
    job_grades J
ON
    E.salary BETWEEN J.lowest_sal AND J.highest_sal;
    
    
/*
CREATE TABLE job_grades (
grade_level CHAR(1),
lowest_sal NUMBER(8,2) NOT NULL,
highest_sal NUMBER(8,2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade_level)
;

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

COMMIT;
*/




/*







-- /////////////////////////////////////////////////



2. INNER join �� OUTER join

 INNER join : ��ġ���� �ʴ� ���� ��¿� ǥ�õ��� ����(������ �ش� �� ���).
 OUTER join : �� ���̺��� ���� ������� �ٸ� ���̺���� ������ ���� ����� �����Ͽ� ��ȯ��. 

*/

/*
 2-1. Left outer join
 
 ��� ���̺� data �� 107 ��.
 �׷��� inner join �� �ϸ� 106 ����.
 �� ������ �μ���ȣ�� null ����� 1�� �ֱ� �����̴�.
 ��� ����� ������ �ϴ°��� outer join �̴�.

 �׷��ٸ� left outer join �� �����ΰ� ?
 DEPARTMENTS ���̺� �����Ǵ� ���� ���
 ���� ���̺��� EMPLOYEES ���̺��� ��� ���� �˻����� �ǹ��Ѵ�.

*/
select 
    e.last_name
    , e.department_id
    , d.department_name
from
    employees e
LEFT OUTER JOIN
    departments d
ON 
    e.department_id = d.department_id
;
-- ��� 107��
-- Why ?
--  ��ü ����� 107
--  �μ��� �Ҽӵ� ����� 106 (�Ҽӵ��� ���� ����� 1)
-- ����, ����� 107 �̴� (�μ��� �Ҽӵ��� ���� ������� ��������).


-- �� ������ ���� (but, �� ������ ANSI ǥ���̴�)
select 
    e.last_name
    , e.department_id
    , d.department_name
from
    employees e, departments d
WHERE 
    e.department_id = d.department_id(+)
;




/*
 2-2. Right outer join
 EMPLOYEES ���̺� �����Ǵ� ���� ���
 ������ ���̺��� DEPARTMENTS ���̺��� ��� ���� �˻���
*/
select 
    e.last_name
    , d.department_id -- e.department_id �� �ϸ� �����Ͱ� null �� ��찡 �����Ƿ� d.department_id �� �ؾ� ��
    , d.department_name
from
    employees e
RIGHT OUTER JOIN
    departments d
ON 
    e.department_id = d.department_id
;
-- ��� : 122��
-- why ?
--  �μ� �� 27
--  ����� �ִ� �μ��� 11���̴� (���� �μ� 16��)
--  ��ü ����� 107
--  �μ��� �Ҽӵ� ����� 106 (�Ҽӵ��� ���� ����� 1)
-- ���� �μ��� �Ҽӵ� ����� 106 + ����� ���� �μ� 16 �� ���ϸ� 122�� �ȴ�.


/*
2-3. Full outer join
 DEPARTMENTS, EMPLOYEES ���̺� �����Ǵ� ���� ���
 ���̺��� ��� ���� �˻��Ѵ�.
*/
select 
    e.last_name
    , d.department_id
    , d.department_name
from
    employees e
FULL OUTER JOIN
    departments d
ON 
    e.department_id = d.department_id
;
-- 123��
-- last_name �� ���̴� (����� ���� �μ��� �ִ�)
-- department_name �� ���̴� (�μ��� �Ҽӵ��� ���� ����� �ִ�)




-- /////////////////////////////////////////////////


/*
3. Cartesian Product
 ���� ������ �߸��ǰų� ������ ������ ���
 ����� ��� ���� ������ ǥ�õǴ�
 Cartesian Product �� ��Ÿ���ϴ�.
 
 (= ����� ���� �� ���´�)
*/

/*
 Cross Join
  �� ���̺��� ���� ���� �����մϴ�.

select
    last_name
    , department_name
from
    employess
CROSS JOIN
    departments
;
-- employess * departments ���� ��� ����� ����
*/





select * from employees where department_id is not null;
select * from employees where department_id is not null;
select * from job_grades;
select * from employees;
select distinct department_id from employees;
select * from employees where manager_id = 149;
select * from departments;

SELECT DEPARTMENT_ID, LOCATION_ID
FROM DEPARTMENTS;

SELECT *
FROM DEPARTMENTS;



/* 1. ��� ������ */

select 
    last_name, 
    salary, 
    salary+300 as ADD300 -- ���� ���ϱ� �����⵵ ����
from employees;

/* 2. ������ �켱���� 

  * / + -  (���нİ� ����)

*/

select 
    last_name, 
    salary, 
    salary+300*10 as ���ռ���
from employees;


-- 3. null ���� �����ϴ� ������� null �� ��� 
--    null �� ���µ����ͷ� �Ҹ��µ�, oracle sql ������ ���µ����Ϳ� ������ �ϸ� null �� ������ �Ǿ��ִ�!
select 
    last_name, 
    salary,
    commission_pct,
    10*salary*commission_pct as ���ռ���2    
from employees;

-- 4. AS
--    �����̳� Ư�����ڰ� ���Եǰų� ��ҹ��ڸ� �����ϴ� ��� ū ����ǥ �־�� �Ѵ�!
select 
    last_name as AbC, -- ABC
    last_name AbC, -- �̰ŵ� ABC ����� �����µ� �� �÷����� ABC �� �ߺ��ǹǷ� ABC_1 �� ������ �ִ�
    salary as "AbC", -- AbC
    salary "AbC", -- AbC_1
    commission_pct as "!!!!!", -- !!!!!
    commission_pct "!!!!!", -- !!!!!_1
    10*salary*commission_pct as " ", --����
    10*salary*commission_pct " " -- ����_1
from employees;


-- 5. ���Ῥ���ڴ� || ��ȣ�̰�, ���ͷ��� ' ��ȣ�̴�
select 
    last_name,
    job_id,
    '���ξ�' || last_name || job_id || '���̾�' AS "����"
from employees;


-- 6. ��ü �ο�(q) ������?
--    q' �� ' �߰��� ' ��ȣ�� ����� �� �ְ� ����
select department_name || q'[ department's manager Id: ]' || manager_id AS "�μ��� ������"
from departments;


-- 7. ��������� �ߺ��� �����Ϸ��� distinct Ű���带 ����
select distinct department_id 
from employees;


/*
  8. ���̺� ����ǥ��?
     DESCRIBE [���̺��]
*/
DESCRIBE employees;
-- �Ǵ�
DESC employees;


--

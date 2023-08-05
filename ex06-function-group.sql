
/*
1. �׷� �Լ�

AVG, MAX, MIN, SUM

*/

SELECT 
    AVG(salary) AS "avg"
    , MAX(salary) AS "max"
    , MIN(salary) AS "min"
    , SUM(salary) AS "sum"
FROM employees
WHERE job_id LIKE '%REP%';

/*

2. COUNT �Լ� : null ���� �ƴ� ��� ���� ������ ��ȯ

*/

SELECT COUNT(*) AS "TOT"
FROM employees
WHERE department_id = 50;

-- �� ������ ���� ��� ����
SELECT COUNT(1) AS "TOT"
FROM employees
WHERE department_id = 50;





/*
 3. null �����ʹ� ��� ����ɱ� ?
*/

select commission_pct
from employees
where department_id = 50;
-- ����� ��� null

select COUNT(commission_pct) AS non_null_commission_count
from employees
where department_id = 50;
-- ����� 0 !!!!!!!!!
-- Why ? department_id = 50 �� commission_pct �� ��� null �� �����µ�, null ���� ���� �� �� ���� ������ ����Ǿ� 0 ���� ������ �ȴ�.


/*
 4. �ݸ�, not null �����ʹ� ��� ����ɱ� ?
*/

select commission_pct
from employees
where department_id = 80;
-- ����� ��� not null

select COUNT(commission_pct) AS non_null_commission_count
from employees
where department_id = 80;
-- ����� 34



/*
 5. �׷��ٸ�, not null �� null �� ���� �����ʹ� ��� ����ɱ� ?
*/

select commission_pct
from employees
where department_id in (50, 80);
-- not null, null data �� ��� ����

select COUNT(commission_pct) AS non_null_commission_count
from employees
where department_id in (50, 80);
-- ����� 34
-- 50 �μ��� ī��Ʈ�� �ȵǰ� ������ �˼��ִ�!


/*

���� : ����Ŭ DBMS ������ �ڹٿ� ����������
      �Ҽ��� ���� ����� ��Ȯ���� �ʴ� 
     (0.1f * 100 = 10 �� �ƴϴ�! 0.99999???? �� 10.00002222??? ��)
     
     �̸� �غ��Ϸ��� �Ҽ��� �����ϰų� �ڸ����� ũ�� �ϴ� ������� �����ϸ� �ȴ�.
     
*/


 
-- �ڼ��Ѱ� �ٽú����...


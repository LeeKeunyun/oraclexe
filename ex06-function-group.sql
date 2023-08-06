
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




/*

6. 3~5�� ����
 : null ��� �����ʹ�
   ī��Ʈ �Ǵ� ��հ� ������ �ȵǴ� ������ �ִ�.
   �̴� disinct �Ǵ� NVL �Լ��� 
   ��Ȳ�� �°� Ȱ���Ͽ� �ذ��Ѵ�.
 
*/

-- 12�� �߿��� department_id=null �� ������ 11�� ����� ����
SELECT COUNT(distinct department_id) as ret
from employees;

-- NVL �Լ��� null ���� �ٸ� ������ ��ü �� AVG ���� �Լ� ���
SELECT AVG(NVL(commission_pct, 0)) as ret
from employees;
-- 0.072897196261682242990654205607476635514

-- NVL �Լ��� ����� �Ͱ� ������� ���� �Ϳ� ���̰� ������ �����ְ� �ִ�. commission_pct �� null �� �����Ͱ� �ֱ� ������..
SELECT AVG(commission_pct) as ret
from employees;
-- 0.2228571428571428571428571428571428571429





/*

7. <=================== �߿�!

GROUP BY 
 ���� ���� ������ �÷� �������� �׷�ȭ�Ͽ� ���� �Լ��� �����ϱ� ���� ����

HAVING
 group by �� �Բ� ���Ǹ�, �׷�ȭ�� ����� ������ ������ �� ����

 �� where : �������� ����
    having : �׷��� ����
*/

-- 7-1. �μ��� ��� �޿��� ����
SELECT 
    department_id
    , AVG(salary) as avg_ret
from employees
GROUP BY department_id;

-- 7-2. group by ������ ���� ���� �������� �׷�ȭ �մϴ�.
SELECT 
    department_id
    , job_id
    , SUM(salary) as tot_ret
from employees
where department_id > 40
GROUP BY department_id, job_id
ORDER by department_id
-- �μ��� �������� �׷�ȭ�Ͽ���
;

-- HAVING �� ���
-- 7-3. �μ��� �ִ� �޿��� 10000���� ū �μ��� ã�ƶ�
select 
    department_id
    , MAX(SALARY) AS max_ret
from employees
group by department_id
HAVING MAX(SALARY) > 10000;

-- 7-4. ������ �� �޿��� 13000���� ū ������ ã�ƶ�
select 
    job_id
    , SUM(SALARY) AS tot_ret
from employees
where job_id not like '%REP%'
group by job_id
HAVING SUM(SALARY) > 13000
ORDER by tot_ret;






/*

 8. �׷��Լ� ��ø ����

*/
select MAX(AVG(SALARY)) as max_avg_ret
from employees
group by department_id;
-- 7-1. group by 1��° ������ max �� �߰� ������ ���̶� ���� ��




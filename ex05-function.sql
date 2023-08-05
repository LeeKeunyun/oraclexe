select employee_id, last_name, department_id
from employees
where last_name = 'higgins';

-- 1. LOWER() �Լ��� ���ڿ��� �ҹ��ڷ� ��ȯ��
select employee_id, last_name, department_id
from employees
where LOWER(last_name) = 'higgins';

/*
 2. UPPER() �Լ��� ���ڿ��� �빮�ڷ� ��ȯ��
   : from dual ? 
     - dual table �� ����Ŭ�� �ӽ����̺��̴�
*/
select UPPER('higgins') FROM dual;

select 12*3 FROM DUAL;

-- 3. INITCAP() �Լ��� ���ڿ��� ù ���ڸ� �빮�ڷ� ��ȯ
select employee_id, last_name, department_id
from employees
where last_name = INITCAP('higgins');


/*
 4. 
 
 ���� : 1���� where ������ �Լ��� ���� �Ŀ� ����ϴ� �ݸ�
       3���� ���� �Ŀ� ����ϰ� �ִ�. 
       1���� 3�� ����� �� ������ 3�� ����� (�������� ���� �ƴ����� ��ü��) ����.

 why ?  
 1�� ����� "���� ã�� �Լ� ����"�ϴ� �۾��� 1 cycle �� n �� �����ϴ� �ݸ�,
 3�� ����� INITCAP �Լ��� �� 1���� �����ϰ� �� �� ���� ã�� �۾��� n �� �����Ѵ�(ã�� �۾��� n��).
 �׷��� 3���� ��Ƽ������ ���ҽ� ��� ���� ���ϼ� �ִ�.
*/

-- 5. CONCAT �Լ��� �ΰ��� �Ķ���� ���� �����Ѵ�.
-- �Ʒ� 2������ ������ ����� ��µȴ�.
SELECT 'Hello' || 'World' FROM dual;
SELECT CONCAT('Hello', 'World') FROM dual;

-- 6. SUBSTR �Լ��� ������ ������ ���ڿ��� �����Ѵ�.
select SUBSTR('HelloWorld', 3, 3) from dual;

-- 7. LENGTH() : ���ڿ��� ���̸� ���� ������ ǥ��
select LENGTH('HelloWorld') from dual;

-- 8. INSTR() : ���ڿ����� ������ ������ ��ġ�� ã��
-- �̶� ��ҹ��� ������ �ؾ� �Կ� �����Ѵ�
select INSTR('HelloWorld', 'W') from dual;

-- 9. LPAD() : ���ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ
select LPAD('salary', 10, '*') from dual;

-- 10. RPAD() : ���ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ
select RPAD('salary', 10, '*') from dual;

-- 11. REPLACE() : ���ڿ����� ������ ���ڸ� ġȯ�մϴ�.
select REPLACE('JACK and JUE', 'J', 'BL') FROM dual; -- J ���ڸ� BL ���ڷ� �ٲ�

/*
   12. TRIM() : ���ڿ����� ���� �Ǵ� ���� ���ڸ� �ڸ���.
   �յ� ���������� �� ���� ���� (���̴� ���� �ȵ�)
*/
select TRIM('H' FROM 'HelloWorld') FROM dual;
select TRIM(' ' FROM ' HelloWorld ') FROM dual;


/*
  13. ���� �Լ�
  ROUND() : �Ҽ��� [2��° �Ķ���� �Է¼�ġ]��° �ڸ��� ���� �ݿø�
  TRUNC() : �Ҽ��� [2��° �Ķ���� �Է¼�ġ]��° �ڸ��� ���ϴ� ����
  CELL()  : �־��� ���ڸ� �ø��Ͽ� ������ ��ȯ
  MOD()   : ���� �������� ��ȯ
*/
SELECT ROUND(45.926, 2) FROM dual; -- 45.93
SELECT TRUNC(45.926, 2) FROM dual; -- 45.92
SELECT CEIL(45.111) FROM dual; -- 46
SELECT MOD(1600, 300) FROM dual; -- 100


/*
  14. ��¥ �Լ�
  
  SYSDATE �� ��ȸ�� 05-08-23 �� ǥ�� (��-��-�� �⺻��)
  

  �׷��� SQL developer ������ ȯ�漳�� (�����ͺ��̽� > NLS > ��¥����(F)) �� 
   : DD-MM-RR �� �����Ǿ� ���� ��� ����� 05-08-23 �� ����
   : RR/MM/DD �� �����Ǿ� ���� ��� ����� 23/08/05 �� ����  
*/

SELECT SYSDATE FROM dual;


-- 15. ��¥ �Լ��� ������ ����

select last_name, (sysdate - hire_date) / 7 as weeks
from employees
where department_id = 90;


/*
  16. ��¥ ���� �Լ�

  MONTHS_BETWEEN(date1, date2) : �� ��¥ ���� �� ���� ���
  ADD_MONTHS(date, n) : ��¥�� n������ �߰�
  NEXT_DAY(date, day_of_week) : ������ ��¥�� �������� �־��� ������ ������ ��¥�� ���
                                (1:������ ~ 7:�Ͽ���)
  LAST_DAY(date) : �־��� ���� ������ ��¥�� ��ȯ
  ROUND(date, format) : ��¥�� ������ �������� �ݿø�
  TRUNC(date, format) : ��¥�� ������ �������� ����
*/

select MONTHS_BETWEEN(TO_DATE('2016-12-22', 'YYYY-MM-DD'), TO_DATE('2017-05-22', 'YYYY-MM-DD')) AS "���"
from dual;
-- ����� -5 �� ǥ��

select MONTHS_BETWEEN(TO_DATE('2017-12-22', 'YYYY-MM-DD'), TO_DATE('2017-05-22', 'YYYY-MM-DD')) AS "���"
from dual;
-- ����� 7 �� ǥ��

select ADD_MONTHS(TO_DATE('2022-12-16', 'YYYY-MM-DD'), 1) AS "���"
from dual;
-- ��� : 16-JAN-23

select NEXT_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 7) AS "���"
from dual;
-- ��� : 12-AUG-23

select LAST_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD')) AS "���" from dual;
select LAST_DAY(SYSDATE) AS "���" from dual;
-- ��� : 31-AUG-23

select ROUND(TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'month') AS "���" from dual;
-- ��� : 01-AUG-23

select ROUND(TO_DATE('2023-08-26', 'YYYY-MM-DD'), 'month') AS "���" from dual;
-- ��� : 01-SEP-23

select TRUNC(TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'month') AS "���" from dual;
-- ��� : 01-AUG-23

select TRUNC(TO_DATE('2023-08-26', 'YYYY-MM-DD'), 'month') AS "���" from dual;
-- ��� : 01-AUG-23



/*
17. ��ȯ �Լ�
 
TO_CHAR() : ��¥ �Ǵ� ���ڸ� ���ڿ��� ��ȯ
 YYYY : ��ü ������ ���ڷ� ǥ��.
 YEAR : ���� ö�ڷ� ǥ��� ������ ��ȯ.
 MM : ���� 2�ڸ� ���� ��
 MONTH : ��ü �� �̸�
 MON : ���� 3�ڸ� ���
 DY : 3�ڸ� ���� ���
 DAY : ������ ��ü �̸�
 DD : ���� ��(1-31)�� ���� ����
 HH : 1�� ������ �ð�
 HH12 : ���� �ð�(1-12)
 HH24 : ���� �ð�(0-23)
 MI : ��(0-59)
 SS : ��(0-59)
 FF : �и�������(0-999)
 AM �Ǵ� PM : ���� �Ǵ� ���ĸ� ��Ÿ���� �ڿ��� ǥ�ø� ��ȯ
 A.M. �Ǵ� P.M. : ���� �Ǵ� ���ĸ� ��Ÿ���� ��ħǥ�� �ִ� �ڿ��� ǥ�ø� ��ȯ
 
*/

SELECT last_name, TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') AS HIREDATE
from employees; 


/*
18. Ÿ�ӽ����� : ��¥���� + �и�������
*/
select TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.FF2') from dual;
-- sql developer ������ ����� 2023-08-05 16:08:20.24 �� ǥ��


/*

19. TO_CHAR() �Լ��� ���ڿ� ����� ��

 9 : ����
 0 : 0 �� ǥ�õǵ��� ������ ����
 $ : �ε� �޷� ��ȣ�� ��ġ
 L : �ε� ���� ��ȭ ��ȣ�� ��� (�ѱ������� �� �� ǥ�õ�)
 . : �Ҽ���
 , : õ���� ǥ���� ��ǥ
 
*/

SELECT 
    salary
    , TO_CHAR(salary, 'L99,999.00') SALARY1
FROM employees
where last_name = 'Ernst';
--     6000    ��6,000.00



-- 20. TO_DATE() �Լ� : ���ڿ��� DATE Ÿ������ ��ȯ
select
    last_name, 
    hire_date,
    TO_CHAR(hire_date, 'YYYY-MM-DD') AS "���"
from
    employees
where
    hire_date < TO_DATE('2005-01-01', 'YYYY-MM-DD');



/*

21. �Լ� ��ø
   ���� �� �Լ��� ��� �����ε� ��ø�� �� ����.
   ��ø�� �Լ��� ���� ���� �������� ���� ���� ������ �򰡵�.
   
*/

select
    last_name, 
    UPPER(CONCAT(SUBSTR(last_name, 1, 8), '_US')) AS "���"
from
    employees
where
    department_id = 60;
    
    
    
    
/*

22. NVL() �Լ� : null ���� ���� ������ ������ ��ȯ
 ============= �߿� !
 
 �����, null �� ������ �ȵɶ� ����Ѵ�.
 null �� 
    0 ���� �ٸ� �������μ�, ������ �� �� ����.
    ���ϱ� ���ϱ� ���� ������ �ȵǸ�, �񱳴� is null �� �ؾ��Ѵ�)

*/

SELECT 
    last_name
    , salary
    , commission_pct
    , NVL(commission_pct, 0) AS "NVL comm"
    , (salary * 12) AS "Y_SAL"
    , (salary * 12) + (salary * 12 * commission_pct) AS INVALID_AN_SAL
    , (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) AS AN_SAL
FROM
    employees;
    
    
/*

23. NVL2() �Լ�
 : ù ��° ǥ������ �˻��մϴ�. ù ��° ǥ������ null �� �ƴϸ� �ι�° ǥ������ ��ȯ�մϴ�.
 :                           ù ��° ǥ������ null �̸� ����° ǥ������ ��ȯ�˴ϴ�.

*/

SELECT 
    last_name
    , salary
    , commission_pct
    , NVL2(commission_pct, 'SAL+COMM', 'SAL') AS income
FROM
    employees
WHERE
    department_id IN (50, 80);



/*

24. NULLIF() �Լ�
 : �� ǥ������ ���Ͽ� ������ null �� ��ȯ�ϰ� �ٸ��� expr1 �� ��ȯ�Ѵ�
   �׷��� expr1 �� ���� ���ͷ� NULL �� ������ �� ����.  
 
*/

SELECT 
    first_name
    , LENGTH(first_name) AS expr1
    , last_name
    , LENGTH(last_name) AS expr2
    , NULLIF(LENGTH(first_name), LENGTH(last_name)) AS result
SELECT 
    first_name
    , LENGTH(first_name) AS expr1
    , last_name
    , LENGTH(last_name) AS expr2
    , NULLIF(LENGTH(first_name), LENGTH(last_name)) AS result
FROM employees;


/*
25. COALESCE()
 : ����Ʈ���� null �� �ƴ� ù��° ǥ������ ��ȯ

 �Ʒ� �������� 3������ �ִ�.
 ����, ù��°�ĺ��� üũ�ϴµ�, 
    ù��°���� ���� �ƴϸ� ù��°���� ��ȯ�ϰ� ������.
    ù��°���� ���� ���, �ι�°���� üũ�ϴµ�,
        �ι�°���� ���� �ƴϸ� �ι�°���� ��ȯ�ϰ� ������.
        �ι�°���� ���� ���, ����°���� ��ȯ�ϰ� ������.
 
*/

select 
    last_name
    , employee_id
    , commission_pct
    , manager_id
    , COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'No commission and no manager') AS result
FROM employees;

    
/* 
26. ���Ǻ� ǥ����  ================= �߿�!

    case ��
       IF-THEN-ELSE �� �۾��� �����Ͽ� ���Ǻ� ��ȸ�� ���ϰ� �����ϵ��� �Ѵ�.

*/

SELECT
    last_name
    , job_id
    , salary
    , CASE job_id
            WHEN 'IT_PROG' THEN 1.10 * salary
            WHEN 'ST_CLERK' THEN 1.15 * salary
            WHEN 'SA_REP' THEN 1.20 * salary
            ELSE salary
      END AS REVISED_SALARY
FROM employees;


/* 
27. ���Ǻ� ǥ����2  ================= �߿�!

    decode ���� case �İ� ������ �۾��� �����Ѵ�.

*/

SELECT
    last_name
    , job_id
    , salary
    , DECODE(job_id, 'IT_PROG', 1.10 * salary,
                     'ST_CLERK', 1.15 * salary,
                     'SA_REP', 1.20 * salary,
                      salary ) AS REVISED_SALARY
FROM employees;

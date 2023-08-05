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
-- ��� : 16-01-23

select NEXT_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 7) AS "���"
from dual;
-- ��� : 12-08-23

select LAST_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD')) AS "���" from dual;
select LAST_DAY(SYSDATE) AS "���" from dual;
-- ��� : 31-08-23

select ROUND(TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'month') AS "���" from dual;
-- ��� : 01-08-23

select ROUND(TO_DATE('2023-08-26', 'YYYY-MM-DD'), 'month') AS "���" from dual;
-- ��� : 01-09-23

select TRUNC(TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'month') AS "���" from dual;
-- ��� : 01-08-23

select TRUNC(TO_DATE('2023-08-26', 'YYYY-MM-DD'), 'month') AS "���" from dual;
-- ��� : 01-08-23



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

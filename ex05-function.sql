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

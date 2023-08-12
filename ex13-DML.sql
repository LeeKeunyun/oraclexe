
/*
DML (Data Manipulation Language)
    DB ���� �����͸� �����ϰ� ó���ϴ� sql
    
    INSERT : ���̺� ���ο� ���ڵ� ����
    UPDATE : ���̺� ���� ���ڵ带 ����(������Ʈ) �ϴµ� ���
    DELETE : ���̺��� Ư�� ���ڵ带 ����
    
    SELECT �� DML �� ���Ե� �� ������, ���� DQL (Data Query Language) �� �з��Ѵ�.
    
*/


/*
1. INSERT

[�⺻����]
    INSERT INTO ���̺�� (�÷���1, �÷���2, ...)
    VALUES (��1, ��2, ...);
    
    �Ǵ�
    
    INSERT INTO ���̺�� (�÷���1, �÷���2, ...) subquery;
*/

/*
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES (280, 'public Relations', 100, 1700);

commit; -- DML ����� ���������� DB �� �ݿ�
*/
select * from DEPARTMENTS;




/*
2. NULL ���� ���� �� ���� (�� ����)  
*/

/*
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES (290, 'Purchasing');
commit; -- DML ����� ���������� DB �� �ݿ�
*/





/*
3. ROLLBACK : DML���� �������� ����� ��
*/
/*
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES (300, 'Purchasing');
ROLLBACK;
*/




/*
4. NULL Ű���� ����
*/
/*
INSERT INTO DEPARTMENTS
VALUES (300, 'Finance', NULL, NULL);
*/




/*
5. insert ��������
*/

CREATE TABLE SALES_REPS
AS (
    SELECT EMPLOYEE_ID, LAST_NAME NAME, SALARY, COMMISSION_PCT
    FROM EMPLOYEES
    WHERE 1 = 2
    )
;
select * from SALES_REPS;
DESC SALES_REPS;

-- JOB_ID ���� REP �� ���Ե� ���
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
;
INSERT INTO SALES_REPS (ID, NAME, SALARY, COMMISSION_PCT)
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
;

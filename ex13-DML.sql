
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
/*
CREATE TABLE SALES_REPS
AS (
    SELECT EMPLOYEE_ID ID, LAST_NAME NAME, SALARY, COMMISSION_PCT
    FROM EMPLOYEES
    WHERE 1 = 2
    )
;
*/
select * from SALES_REPS;
DESC SALES_REPS;

-- JOB_ID ���� REP �� ���Ե� ���
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
;
/*
INSERT INTO SALES_REPS (ID, NAME, SALARY, COMMISSION_PCT)
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'
;
*/





/*
6. UPDATE
    ���̺��� ���� ���� �����մϴ�.
    
[�⺻����]
    UPDATE ���̺��
    SET �÷���1 = ������, �÷���2 = ������, ... �÷���N = ������
    WHERE ������
*/

/*
-- �ϴ� �ӽ� ���̺��� �����
CREATE TABLE COPY_EMP
AS SELECT * FROM EMPLOYEES WHERE 1 = 2 -- ��Ű��(�Ӽ���)�� ����
;
DESC COPY_EMP;
INSERT INTO COPY_EMP
SELECT * FROM EMPLOYEES;
*/


-- 6-1. ������Ʈ�� �غ���
/*
UPDATE COPY_EMP
SET DEPARTMENT_ID = 50
WHERE EMPLOYEE_ID = 113
;
*/

-- 6-2. ��� ���� �����͸� (�ϰ�) ����
-- ����! �ϰ� ������ �׻� ��������.
/*
UPDATE COPY_EMP
SET DEPARTMENT_ID = 110;
*/



-- 6-3. �������� ���
/*
UPDATE COPY_EMP
SET DEPARTMENT_ID = (
    SELECT
        DEPARTMENT_ID
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEE_ID = 100
)
WHERE JOB_ID = (
    SELECT
        JOB_ID
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEE_ID = 200
)
;
*/
-- �����ȣ 200�� 1���� �μ���ȣ�� 10 ���� 90���� �����ض�
-- SELECT * FROM COPY_EMP WHERE JOB_ID = 'AD_ASST';











/*
7. DELETE
    DELETE ���� ����Ͽ� ���̺��� ���� ���� ������ �� �ֽ��ϴ�.

*/

-- 7-1. ���� ����
/*
DELETE FROM COPY_EMP
WHERE EMPLOYEE_ID = '200';
*/

-- 7-2. ��ü ����
-- ����! �ϰ� ������ �׻� ��������.
/*
DELETE FROM COPY_EMP;
*/








/*
8. TRUNCATE ��
    ���̺��� �� ���·�, ���̺� ���� �״�� ���ܵ�ä ���̺��� ��� ���� �����մϴ�.
    DML ���� �ƴ϶� DDL(������ ���Ǿ�) ���̹Ƿ� ���� UNDO �� �� �����ϴ�.    
*/

/*
TRUNCATE TABLE COPY_EMP;
-- ��� : Table COPY_EMP��(��) �߷Ƚ��ϴ�.
-- ����! �ѹ��ص� ������ �����ȵ�!
*/
SELECT * FROM COPY_EMP;







/*

================================================
�߿� !!!!!!!!!!!!!!!!!!!
================================================

9. Ʈ�����(Transaction)
    ������ ó���� �� �����Դϴ�.
    ����Ŭ���� �߻��ϴ� ���� ���� SQL ��ɹ���
    �ϳ��� ������ �۾� ������ ó���ϴµ� �̸� Ʈ������̶�� �մϴ�.
    
    COMMIT : SQL���� ����� ���������� DB�� �ݿ�
    ROLLBACK : SQL���� �������� ����� ��
    SAVEPOINT : Ʈ������� �� ������ ǥ���ϴ� �ӽ� ������
  
*/

/*
-- 9-1. ����
CREATE TABLE MEMBER
(
    NUM NUMBER PRIMARY KEY,
    NAME VARCHAR2(30),
    ADDR VARCHAR2(50)
)
;

-- 9-2.
-- INSERT ��,
-- ���̺��� VALUES ���� �÷��� �����Ǹ�,
-- ���̺� ��ü ����� ���� VALUE �� ����� �Ѵ�
INSERT INTO MEMBER VALUES(1, '��ī��', '���ʸ���');
COMMIT;
INSERT INTO MEMBER VALUES(2, '������', '���ʸ���');
INSERT INTO MEMBER VALUES(3, '���̸�', '���ʸ���');
INSERT INTO MEMBER VALUES(4, '���α�', '���ʸ���');

*/

SELECT * FROM MEMBER;
DESC MEMBER;

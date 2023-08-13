
/*
�����ͺ��̽� ��ü
    ���̺� : �⺻ ���� �����̸�, ������ �����Ǿ� �ֽ��ϴ�.
    �� : �ϳ� �̻��� ���̺� �ִ� �������� �κ� ������ �������� ��Ÿ���ϴ�.(���� ���̺�)
    ������ : �Ϸ��� ���ڸ� �ڵ����� �������ִ� ��ü�Դϴ�.
    �ε��� : ���̺��� �����Ϳ� ���� ���� �˻��� �������ִ� ���� ��ü�Դϴ�.
    ���Ǿ� : ��ü�� �ٸ� �̸��� �ο��մϴ�.

*/


-- 1. �� ����
/*
CREATE VIEW EMPVU80 AS 
    SELECT 
        EMPLOYEE_ID
        , LAST_NAME
        , SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 80
;
*/
DESC EMPVU80;
SELECT * FROM EMPVU80;


-- 2. ALIAS ����Ͽ� �� ����
-- �並 ������ �� ��Ī�� �̿��Ͽ� ������ �ؾ� �Ѵ�
CREATE VIEW SALVU50 AS
    SELECT 
        EMPLOYEE_ID AS ID_NUMBER
        , LAST_NAME NAME
        , SALARY*12 ANN_SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 50
;

DESC SALVU50;
SELECT * FROM SALVU50 WHERE ANN_SALARY >= 50000;


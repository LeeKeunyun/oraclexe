
/*
��������
    Ʈ�� ������ ������ �����Ϳ��� �θ�-�ڽ� ���踦 ���� �����ϴµ� ���Ǵ� SQL
    �ַ� ������, ������ ������, ������ �ּ� � Ȱ��˴ϴ�.

���� Ű����
    START WITH : ���� ������ ���� ������ �����մϴ�. �ֻ��� �θ� ��带 �����մϴ�.
    CONNECT BY : �θ�-�ڽ� ���踦 �����ϴ� Ű�����, PRIOR Ű����� �Բ� ���˴ϴ�.
    PRIOR : �θ�-�ڽ� ���踦 ǥ���ϴ� Ű����� �ڽ� �÷� �տ� ���˴ϴ�.
    NOCYCLE : ����Ŭ�� ������� �ʵ��� �����ϴ� �ɼ� �Դϴ�.
    LEVEL : �� ������ ���̸� ��Ÿ���� �ǻ� �÷����� ���˴ϴ�.
    SYS_CONNECT_BY_PATH : ���� ������ ��θ� ���ڿ��� ǥ�����ִ� �Լ��Դϴ�.
    ORDER SIBLINGS BY : ���� ������ �����ϴµ� ���˴ϴ�.
    
*/

-- 1. ����
SELECT
    E.EMPLOYEE_ID
    , E.LAST_NAME
    , E.MANAGER_ID
    , LEVEL AS DEPTH
    , LPAD(' ', LEVEL*2-2) ||  SYS_CONNECT_BY_PATH(E.LAST_NAME, '/') AS HIERARCHY_PATH
FROM
    EMPLOYEES E
START WITH
    E.MANAGER_ID IS NULL
CONNECT BY
    PRIOR E.EMPLOYEE_ID = E.MANAGER_ID
ORDER SIBLINGS BY E.EMPLOYEE_ID
;


-- 2. NOCYCLE ����Ŭ�� ������� �ʵ��� ����(���ѷ�������)
/*

... �߷� ...
CONNECT BY
    NOCYCLE PRIOR E.EMPLOYEE_ID = E.MANAGER_ID
ORDER SIBLINGS BY E.EMPLOYEE_ID
*/



-- ansi ǥ���� WITH �� ���
-- �� ������ ����Ŭ���� ���

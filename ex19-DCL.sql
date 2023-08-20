/*
DCL(Data Control Language)
    DCL�� ���̺� �����͸� ������ �� �ʿ��� ������ �����ϴ� ��ɾ�

���� Ű����
    CONNECT     : �����ͺ��̽��� �����ϴ� ������ �����մϴ�.
    RESOUCE     : ���̺�, ������ ���ν��� ���� ������ �� �ִ� ������ �ο��մϴ�.
    ALTER, DROP : ��ü�� ���� �Ǵ� ���� ������ �����մϴ�.
    DBA : �����ͺ��̽� �����ڷμ� �ý����� ������ ������ �� �ִ� ������ �ο��մϴ�.
*/

ALTER SESSION SET "_ORACLE_SCRIPT"=true;




/* 
1. ����� �����ϱ�
*/
CREATE USER scott2 IDENTIFIED BY tiger;
-- ��� : User SCOTT2��(��) �����Ǿ����ϴ�.



/* 
2. GRANT ���� �����ֱ�
*/
GRANT CREATE SESSION TO scott2;
-- �Ǵ�
GRANT CONNECT TO scott2;

-- ��� : Grant��(��) �����߽��ϴ�.



/* 
3. GRANT ���� ����
*/
REVOKE CREATE SESSION FROM scott2;
-- �Ǵ�
REVOKE CONNECT FROM scott2;

-- ��� : Revoke��(��) �����߽��ϴ�.





/*
4. OBJECT �����ֱ�
*/
GRANT CREATE SEQUENCE TO scott2;
GRANT CREATE SYNONYM TO scott2;
GRANT CREATE TABLE TO scott2;
GRANT CREATE PROCEDURE TO scott2;
GRANT CREATE VIEW TO scott2;



/*
5. ��� �����ֱ�
*/
GRANT CONNECT, DBA, RESOURCE TO scott2;
-- ��� : Grant��(��) �����߽��ϴ�.




/*
6. ���� �����ϱ�
*/
REVOKE CONNECT, DBA, RESOURCE FROM scott2;
-- ��� : Revoke��(��) �����߽��ϴ�.

-- ==============================================
-- ������� : ������, 1 -> 5 -> 6 ������ ����
-- ==============================================



/*
7. ����� ��й�ȣ ����

 �� ���� : ��� ������ �ý��� �ߴ� ����ũ�� �ִ�.
*/
-- ALTER USER scott2 IDENTIFIED BY tiger2;







/*
8. ROLE - ���� �׷�
*/

-- 8-1. role �������
CREATE ROLE role01;




-- =============================
-- �Ʒ� ���� ���� �ʿ�


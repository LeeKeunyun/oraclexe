
/*
DDL (Data Definition Language) - ������ ���Ǿ�
    ������ ���̽� ���� ���� �� ��ü(���̺�, ������ ... ��)�� ����, ����, �����ϱ� ���� ���Ǵ� sql ���Դϴ�.
*/



/*
1. CREATE TABLE ��
    �����͸� ������ ���̺��� �����մϴ�.
*/
/*
CREATE TABLE DEPT
(
    DEPTNO NUMBER(6)
    , DNAME VARCHAR2(200) -- 200 BYTE
    , LOC VARCHAR2(200) -- �������� ���� 1���ڰ� 2~4����Ʈ. �ѱ��� 1���ڰ� 2~3����Ʈ�ӿ� ����. (200 ����Ʈ ������ 200���ڰ� ���°� �ƴϴ�!)
    , CREATE_DATE DATE DEFAULT SYSDATE
)
;
*/



/*
2. ������ ����
    VARCHAR2(SIZE) : ���� ���� ���� ������ (�ִ� 4000 ����Ʈ)
    NUMBER(P,S)    : ���� ���� ���� ������
    CHAR(SIZE)     : ���� ���� ���� (�ִ� 2000)
    DATE           : ��¥ �� �ð� ��
    CLOB           : ���� ������ (�ִ� 4 �Ⱑ����Ʈ)
    BLOB           : ���̳ʸ� ������ (�ִ� 4 �Ⱑ)
    BFILE          : ������ġ�� ��Ÿ������ ���� (�ִ� 4 �Ⱑ)
*/

-- 2-1. DEPARTMENTS ���̺��� dept �� �����ͺ����ϱ�
/*
INSERT INTO DEPT
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, SYSDATE
FROM DEPARTMENTS
;
*/


/*
2-2. CTAS �� "Create Table As Select" �� ���ڷ�
�����ͺ��̽����� ���ο� ���̺��� �����ϴ� ����Դϴ�.
�� ����� ���� ���̺��� SELECT ���� ����Ͽ� �����͸� ��ȸ�� ��,
�� ����� ���ο� ���̺�� �����ϴ� ����Դϴ�.
*/

SELECT * FROM DEPT;
DESC DEPT;
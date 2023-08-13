
/*
DDL (Data Definition Language) - ������ ���Ǿ�
    ������ ���̽� ���� ���� �� ��ü(���̺�, ������ ... ��)�� ����, ����, �����ϱ� ���� ���Ǵ� sql ���Դϴ�.
*/

-- -------------------------------------------------------------

/*
1. CREATE TABLE ��
    �����͸� ������ ���̺��� �����մϴ�.
*/
/*
CREATE TABLE DEPT
(
    DEPTNO NUMBER(6)
    , DNAME VARCHAR2(200) -- 200 BYTE
    , LOC VARCHAR2(200)
    , CREATE_DATE DATE DEFAULT SYSDATE
)
;
*/


-- -------------------------------------------------------------

/*
2. ������ ����
    VARCHAR2(SIZE) : ���� ���� ���� ������ (�ִ� 4000 ����Ʈ)
    NUMBER(P,S)    : ���� ���� ���� ������
    CHAR(SIZE)     : ���� ���� ���� (�ִ� 2000)
    DATE           : ��¥ �� �ð� ��
    CLOB           : ���� ������ (�ִ� 4 �Ⱑ����Ʈ)
    BLOB           : ���̳ʸ� ������ (�ִ� 4 �Ⱑ)
    BFILE          : ������ġ�� ��Ÿ������ ���� (�ִ� 4 �Ⱑ)
    
    
    �� �ѱ� ?
     : �������� ���� 1���ڰ� 2~4����Ʈ. 
     : �ѱ��� 1���ڰ� 2~3����Ʈ�ӿ� ����. 
       (200 ����Ʈ ������ 200���ڰ� ���°� �ƴϴ�!)
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

/*
-- 2-2-1. ���̺� �����ϱ� => ���������� ���簡 �ȵȴ�.
CREATE TABLE DEPT2 AS
SELECT * FROM DEPT;

-- 2-2-2. ���̺� ������ �����ϱ� (������ �׻� ������ �Ǵ� ������)
CREATE TABLE DEPT3 AS
SELECT * FROM DEPT WHERE 1=2;
*/








-- -------------------------------------------------------------

/*
3. ALTER ��
    �����ͺ��̽� ��ü ������ �Ӽ��� ������ �� ���Ǵ� SQL ��ɹ��Դϴ�.
*/

/*
-- 3-1. ���̺� �ϴ� ����
CREATE TABLE SIMPLE (NUM NUMBER);

-- 3-2. �÷� �߰�
ALTER TABLE SIMPLE
ADD (
    NAME VARCHAR2(3)
);

-- 3-3. �÷� ����
ALTER TABLE SIMPLE
MODIFY
(
    NAME VARCHAR2(30)
);

-- 3-4. �÷� ����
ALTER TABLE SIMPLE
DROP COLUMN NAME;

-- 3-5. �÷� ���� �ٸ� ���
ALTER TABLE SIMPLE
DROP(NAME);
*/








-- -------------------------------------------------------------

/*
4. DROP ��
    ��ü�� ������ �� ���Ǵ� SQL ��ɹ� �Դϴ�.
    
    �� ���� : ���̺� �ϳ��� ��ü�Դϴ�.
*/

-- 4-1. ���̺� ����
-- DROP TABLE SIMPLE;

SELECT * FROM SIMPLE;
DESC SIMPLE;
















-- -------------------------------------------------------------

/*
5. ��������(Constraint)
    ���̺��� �ش��÷��� ������ �ʴ� �����͸� �Է�/����/���� �Ǵ� ���� �����ϱ�
    ���� ���̺� ���� �Ǵ� ����� �����ϴ� �����Դϴ�. (����� �������� �ŷڼ� ���̱� ����)
    
    NOT NULL
        NULL �� �Է��� �Ǿ�� �ȵǴ� �÷��� �ο��ϴ�
        �������� �÷� ���������� �ο� �� �� �ִ� ���������Դϴ�.
    UNIQUE KEY(����Ű)
        ����� ���� �ߺ����� �ʰ� ���� �����ϰ� �����Ǿ�� �� ��
        ����ϴ� ���������Դϴ�.(NULL ���ȴ�)    
    PRIMARY KEY(��ǥŰ �Ǵ� �⺻Ű)
        NOT NULL ���ǰ� UNIQUE KEY �� ��ģ �����Դϴ�.
    CHECK
        ���ǿ� �´� �����͸� �Էµǵ��� ������ �ο��ϴ� ���������Դϴ�.
    FOREIGN KEY(�ܷ�Ű �Ǵ� ����Ű)
        �θ� ���̺��� PRIMARY �� �����ϴ� �÷��� ���̴� ���������Դϴ�.
        
*/

/*
-- 5-1.
-- DEFAULT �� : ������ �Էµ� �� �ش� �÷��� ���� ������ �������� ���� ���, ����Ʈ���� �����ϰ� �Ѵ�
CREATE TABLE DEPT4
(
    DEPTNO NUMBER(2) CONSTRAINT DEPT4_DEPTNO_PK PRIMARY KEY
    , DNAME VARCHAR2(15) DEFAULT '������'
    , LOC CHAR(1) CONSTRAINT DEPT4_LOC_CK CHECK(LOC IN('1', '2'))
);

INSERT INTO DEPT4 (DEPTNO, DNAME, LOC) VALUES (1, null, '1'); 
-- ����
-- �� DNAME ���� �����ΰ� �ƴϰ� NULL �� �����Ǿ� �ִ°� ? 
-- �װ��� CREATE �� NULL ���� ������ �ֵ��� SQL ���� ®�� �����̴�.

INSERT INTO DEPT4 (DEPTNO, LOC) VALUES (1, '1'); 
-- ����(ORA-00001: ���Ἲ ���� ����(HR.DEPT4_DEPTNO_PK)�� ����˴ϴ�)

INSERT INTO DEPT4 (DEPTNO, LOC) VALUES (2, '1'); 
-- ����
-- DNAME �� ������ ���� �����Ǿ� �ִ�

INSERT INTO DEPT4 (DEPTNO, LOC) VALUES (3, '3'); 
-- ����(ORA-02290: üũ ��������(HR.DEPT4_LOC_CK)�� ����Ǿ����ϴ�)
*/




-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------

/*
-- 5-2. �ܷ�Ű�� ����� ���ؼ��� �θ����̺� �ʿ�
-- �θ����̺� ����
CREATE TABLE DEPT5
(
    DEPTNO NUMBER(2) PRIMARY KEY
    , DNAME VARCHAR2(15) NOT NULL
);
-- �θ����̺� DEPT5 �� �����ϴ� �ڽ����̺� ����
--DROP TABLE EMP;

-- CONSTRAINT EMP_DEPT5_FK : DEPT5 ���̺��� DEPTNO �� �����ؼ� �ܷ�Ű�� ����ڴ� �� �ǹ�.
CREATE TABLE EMP
(
    EMPNO NUMBER(4) PRIMARY KEY
    , ENAME VARCHAR2(15) NOT NULL
    , DEPTNO NUMBER(2)
    , CONSTRAINT EMP_DEPT5_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT5(DEPTNO)
);

INSERT INTO DEPT5 (DEPTNO, DNAME) VALUES (1, '���ߺ�');
INSERT INTO DEPT5 (DEPTNO, DNAME) VALUES (2, '��ȹ��');
INSERT INTO DEPT5 (DEPTNO, DNAME) VALUES (3, '������');
COMMIT;
INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (1, 'A', 1);
INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (2, 'B', 3);
COMMIT;
DELETE FROM EMP WHERE EMPNO = 2; --����
ROLLBACK;
-- ----------------- �Ʒ� �κ� ���� ! ---------------------------------
DELETE FROM DEPT5 WHERE DEPTNO = 1;
-- ����(ORA-02292: ���Ἲ ��������(HR.EMP_DEPT5_FK)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�)

DELETE FROM EMP WHERE EMPNO = 1;
DELETE FROM DEPT5 WHERE DEPTNO = 1; --����
-- ------------------------------------------------------------------
*/





-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- 5-3. �������� ��ȸ
SELECT * FROM USER_CONSTRAINTS;

-- 5-4. 5-2 ���� �ɾ����� �������� ��ȸ
SELECT * FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'EMP_DEPT5_FK';

-- 5-5. Ư�����̺� �� �������� ��ȸ
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP';

/*
-- 5-6. ���������� ���� �Ұ���. ������ �����մϴ�.
ALTER TABLE EMP
DROP CONSTRAINT EMP_DEPT5_FK;

-- 5-7. �������� �߰��ϱ�
ALTER TABLE EMP
ADD (
    CONSTRAINT EMP_DEPT5_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT5(DEPTNO)
);
*/

-- 5-8. �ܷ�Ű�� ��� ���������� �����ϴ��� Ȯ��
-- EMP �� �ܷ�Ű �������� ���� �� (R_CONSTRAINT_NAME = SYS_C008362) �� ���� ���� ��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP', 'DEPT5');





SELECT * FROM DEPT5;
SELECT * FROM EMP;
DESC DEPT5;
DESC EMP;
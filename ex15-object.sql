
/*
데이터베이스 객체
    테이블 : 기본 저장 단위이며, 행으로 구성되어 있습니다.
    뷰 : 하나 이상의 테이블에 있는 데이터의 부분 집합을 논리적으로 나타냅니다.(가상 테이블)
    시퀀스 : 일련의 숫자를 자동으로 생성해주는 객체입니다.
    인덱스 : 테이블의 데이터에 대한 빠른 검색을 지원해주는 색인 객체입니다.
    동의어 : 객체에 다른 이름을 부여합니다.

*/


-- 1. 뷰 생성
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


-- 2. ALIAS 사용하여 뷰 생성
-- 뷰를 쿼리할 때 별칭을 이용하여 쿼리를 해야 한다
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


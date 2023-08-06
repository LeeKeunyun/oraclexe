
/*
1. JOIN

-- JOIN 의 정의 : SQL 에서 2개 이상의 테이블에서 관련된 행들을 결합하기 위한 연산.
-- JOIN 의 종류
 Natural join : 두 테이블에서 
               데이터 유형과 이름이 일치하는 열을 기반으로
               자동으로 테이블을 조인할 수 있다.
             
*/

-- 1.1 natural join
select 
    department_id, department_name, location_id
    , city
from departments
NATURAL JOIN locations;
-- departments 와 location 2개 테이블이 있다
-- departments 에는 city 가 없다
-- locations 에는 city 가 있다
-- 그런데 2개 테이블에는 location_id 가 모두 있고
--      departments 에는 location_id 가 FK 이다.
--      locations 에는 location_id 가 PK 이다.
-- 그럼 결합조건은 location_id 가 된다. 


-- ※ 참고 : FK (Foreign key) 는 참조키 또는 외래키라고 하며
--          PK 는 Primary key 는 기본키라고 한다.


-- ==========================================
-- 네츄럴 조인은 
-- A. 두 테이블의 키 이름명이 같으면서
-- B. 그 키가 각 테이블에 PK, FK 로 정의되어 있을 경우
-- C. "자동으로 결합"을 해준다.
-- ==========================================




-- 1.2 USING 절로 join
--  명시적으로 결합을 수행하고자하는 열을 정해준다.
select 
    employee_id, last_name, DEPARTMENT_ID
    ,location_id    
from employees JOIN departments
USING (DEPARTMENT_ID)
;
-- 사원 테이블에는 location_id 가 없다.
-- location_id 는 departments 테이블에서 가져와야 한다.



-- 1-3. ON 절로 조인
--  ON 절을 사용하여 조인 조건을 지정한다. (조인 타입 중에서 제일 포멀한 타입)
select 
    E.employee_id
    , E.last_name
    , E.DEPARTMENT_ID
    , D.DEPARTMENT_ID
    , D.location_id
from employees E JOIN departments D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);


-- 1-3-1. ON 절로 조인
select 
    E.employee_id
    , E.last_name
    , E.DEPARTMENT_ID
    --, D.DEPARTMENT_ID --생략이 가능. 단 DEPARTMENT_ID 에는 E. 또는 D. 을 붙여줘야 한다.
    , D.location_id
from employees E JOIN departments D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- 1-3-2. 
--  위(1-3-1)과 같은 결과가 나옴을 보여준다.

--    1-3-1. 는 ANSI 표준방법이므로 oracle 외 다른 dbms 도 동작됨.
--    1-3-2. 는 오라클에서는 동작되나 다른 dbms 는 확인이 필요.

select 
    E.employee_id
    , E.last_name
    , E.DEPARTMENT_ID
    , D.location_id
from employees E, departments D
where E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- 1-4. ON 절 사용하여 3-Way 조인 ???

/* 아래 쿼리가 정답인가 ??
select
    E.employee_id --employees table
    , L.city --locations table
    , D.department_name --departments table
from
    employees E
    , locations L
    , departments D
ON
    (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    AND (D.LOCATION_ID = L.LOCATION_ID)
;
*/

-- 아래가 정답!
select
    E.employee_id --employees table
    , L.city --locations table
    , D.department_name --departments table
from
    employees E
JOIN
    departments D
ON
    E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN
    locations L
ON
    D.LOCATION_ID = L.LOCATION_ID  
;



-- 1-5. ON join 쿼리 예시
select
    E.employee_id --employees table
    , E.last_name
    , E.first_name
    , L.LOCATION_ID
    , L.city --locations table
    , E.DEPARTMENT_ID
    , D.department_name --departments table
from employees E
JOIN departments D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN locations L
ON D.LOCATION_ID = L.LOCATION_ID  
;


-- 1-6. 조인에 추가 조건 적용
select 
    E.employee_id
    , E.last_name
    , E.manager_id
    , E.department_id
    , D.department_id
    , D.location_id
from
    employees E
JOIN
    departments D
ON
    E.department_id = D.department_id
    AND E.manager_id = 149
;



-- 1.7. 테이블 자체 조인
--  ON 절을 사용하는 Self Join
select
    worker.last_name AS emp
    , manager.last_name AS mgr
from
    employees worker
join
    employees manager
on
    worker.manager_id = manager.manager_id
;
-- 설명 :
-- select * from employees; 을 쿼리하면
-- table 에는 사원의 이름은 표시되나 매니저 이름까지는 표시가 안된다.
-- 매니저 이름까지 표시하게 하려면 self join 을 해야 한다.





-- 1-8. Nonequijoin
--  등호 연산자 외의 다른 연산자를 포함하는 조인 조건이다.




select * from employees;
select * from employees where manager_id = 149;
select * from departments;

SELECT DEPARTMENT_ID, LOCATION_ID
FROM DEPARTMENTS;

SELECT *
FROM DEPARTMENTS;



/* 1. 산술 연산자 */

select 
    last_name, 
    salary, 
    salary+300 as ADD300 -- 빼기 곱하기 나누기도 가능
from employees;

/* 2. 연산자 우선순위 

  * / + -  (수학식과 동일)

*/

select 
    last_name, 
    salary, 
    salary+300*10 as 복합수식
from employees;


-- 3. null 값을 포함하는 산술식은 null 로 계산 
--    null 은 없는데이터로 불리는데, oracle sql 에서는 없는데이터와 연산을 하면 null 이 나오게 되어있다!
select 
    last_name, 
    salary,
    commission_pct,
    10*salary*commission_pct as 복합수식2    
from employees;

-- 4. AS
--    공백이나 특수문자가 포함되거나 대소문자를 구분하는 경우 큰 따옴표 넣어야 한다!
select 
    last_name as AbC, -- ABC
    last_name AbC, -- 이거도 ABC 결과가 나오는데 앞 컬럼명인 ABC 와 중복되므로 ABC_1 로 나오고 있다
    salary as "AbC", -- AbC
    salary "AbC", -- AbC_1
    commission_pct as "!!!!!", -- !!!!!
    commission_pct "!!!!!", -- !!!!!_1
    10*salary*commission_pct as " ", --공백
    10*salary*commission_pct " " -- 공백_1
from employees;


-- 5. 연결연산자는 || 기호이고, 리터럴은 ' 기호이다
select 
    last_name,
    job_id,
    '접두어' || last_name || job_id || '접미어' AS "연결"
from employees;


-- 6. 대체 인용(q) 연산자?
--    q' 와 ' 중간에 ' 기호를 사용할 수 있게 해줌
select department_name || q'[ department's manager Id: ]' || manager_id AS "부서와 관리자"
from departments;


-- 7. 결과내에서 중복을 제거하려면 distinct 키워드를 쓰자
select distinct department_id 
from employees;


/*
  8. 테이블 구조표시?
     DESCRIBE [테이블명]
*/
DESCRIBE employees;
-- 또는
DESC employees;


--

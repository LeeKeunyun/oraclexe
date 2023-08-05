
/*
1. 그룹 함수

AVG, MAX, MIN, SUM

*/

SELECT 
    AVG(salary) AS "avg"
    , MAX(salary) AS "max"
    , MIN(salary) AS "min"
    , SUM(salary) AS "sum"
FROM employees
WHERE job_id LIKE '%REP%';

/*

2. COUNT 함수 : null 값이 아닌 모든 행의 개수를 반환

*/

SELECT COUNT(*) AS "TOT"
FROM employees
WHERE department_id = 50;

-- 위 쿼리와 동일 결과 나옴
SELECT COUNT(1) AS "TOT"
FROM employees
WHERE department_id = 50;





/*
 3. null 데이터는 어떻게 적용될까 ?
*/

select commission_pct
from employees
where department_id = 50;
-- 결과는 모두 null

select COUNT(commission_pct) AS non_null_commission_count
from employees
where department_id = 50;
-- 결과는 0 !!!!!!!!!
-- Why ? department_id = 50 의 commission_pct 는 모두 null 로 나오는데, null 값을 연산 할 수 없는 원리가 적용되어 0 개가 나오게 된다.


/*
 4. 반면, not null 데이터는 어떻게 적용될까 ?
*/

select commission_pct
from employees
where department_id = 80;
-- 결과는 모두 not null

select COUNT(commission_pct) AS non_null_commission_count
from employees
where department_id = 80;
-- 결과는 34



/*
 5. 그렇다면, not null 과 null 이 섞인 데이터는 어떻게 적용될까 ?
*/

select commission_pct
from employees
where department_id in (50, 80);
-- not null, null data 가 모두 나옴

select COUNT(commission_pct) AS non_null_commission_count
from employees
where department_id in (50, 80);
-- 결과는 34
-- 50 부서는 카운트가 안되고 있음을 알수있다!


/*

참고 : 오라클 DBMS 에서도 자바와 마찬가지로
      소수점 연산 결과가 정확하지 않다 
     (0.1f * 100 = 10 이 아니다! 0.99999???? 나 10.00002222??? 등)
     
     이를 극복하려면 소수점 절삭하거나 자리수를 크게 하는 방법으로 진행하면 된다.
     
*/


 
-- 자세한건 다시보기로...


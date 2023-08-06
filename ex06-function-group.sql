
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




/*

6. 3~5번 관련
 : null 결과 데이터는
   카운트 또는 평균값 적용이 안되는 문제가 있다.
   이는 disinct 또는 NVL 함수를 
   상황에 맞게 활용하여 해결한다.
 
*/

-- 12개 중에서 department_id=null 을 제외한 11개 결과가 나옴
SELECT COUNT(distinct department_id) as ret
from employees;

-- NVL 함수로 null 값을 다른 값으로 대체 후 AVG 등의 함수 사용
SELECT AVG(NVL(commission_pct, 0)) as ret
from employees;
-- 0.072897196261682242990654205607476635514

-- NVL 함수를 사용한 것과 사용하지 않은 것에 차이가 있음을 보여주고 있다. commission_pct 가 null 인 데이터가 있기 때문에..
SELECT AVG(commission_pct) as ret
from employees;
-- 0.2228571428571428571428571428571428571429





/*

7. <=================== 중요!

GROUP BY 
 여러 행을 지정된 컬럼 기준으로 그룹화하여 집계 함수를 적용하기 위한 구문

HAVING
 group by 와 함께 사용되며, 그룹화된 결과에 조건을 적용할 때 사용됨

 ※ where : 개별행의 조건
    having : 그룹의 조건
*/

-- 7-1. 부서별 평균 급여를 구함
SELECT 
    department_id
    , AVG(salary) as avg_ret
from employees
GROUP BY department_id;

-- 7-2. group by 절에서 여러 열을 기준으로 그룹화 합니다.
SELECT 
    department_id
    , job_id
    , SUM(salary) as tot_ret
from employees
where department_id > 40
GROUP BY department_id, job_id
ORDER by department_id
-- 부서의 직군별로 그룹화하였음
;

-- HAVING 절 사용
-- 7-3. 부서별 최대 급여가 10000보다 큰 부서를 찾아라
select 
    department_id
    , MAX(SALARY) AS max_ret
from employees
group by department_id
HAVING MAX(SALARY) > 10000;

-- 7-4. 직무별 총 급여가 13000보다 큰 직무를 찾아라
select 
    job_id
    , SUM(SALARY) AS tot_ret
from employees
where job_id not like '%REP%'
group by job_id
HAVING SUM(SALARY) > 13000
ORDER by tot_ret;






/*

 8. 그룹함수 중첩 가능

*/
select MAX(AVG(SALARY)) as max_avg_ret
from employees
group by department_id;
-- 7-1. group by 1번째 예제에 max 를 추가 적용한 것이라 보면 됨




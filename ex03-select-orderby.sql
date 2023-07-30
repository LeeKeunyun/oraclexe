
/*
    1. order by 

    asc : 오름차순, 기본값
    desc : 내림차순
    
    select 문의 맨 마지막에 위치함에 주의
*/

select employee_id, last_name, job_id, salary, hire_date
from employees
order by hire_date; -- 01/01/13 , 02/06/07 순으로 표시

select employee_id, last_name, job_id, salary, hire_date
from employees
order by hire_date desc; -- 08/04/21 , 08/03/24 순으로 표시


-- 2. 열 alias 를 기준으로 정렬

select employee_id, last_name, job_id, salary*12 AS annsal
from employees
order by annsal; -- salary 에 12 를 곱한 것을 별칭으로 놓고, 별칭을 기준으로 정렬함

-- 주의사항 : 별칭은 ordey by 에서 쓸수있다







/*******************************************************

3.
select 구문이 아래와 같이 되어 있을때 각 줄은 오라클에서 어떤 순서대로 읽어들일까 ?
 => from 절을 제일 먼저 읽고, ORDER BY 절을 제일 나중에 읽는다

SELECT [distinct] 컬럼1, 컬럼2               .5
FROM                                                     .1 
WHERE                                                   .2
GROUP BY                                             .3
HAVING                                                  .4
ORDER BY                                              .6

*******************************************************/



-- 4. 열 숫자 위치를 사용하여 정렬

select employee_id, last_name, job_id, salary*12 AS annsal
from employees
order by 3; -- job_id 컬럼을 정렬


-- 5. 여러 열을 기준으로 정렬

select last_name, job_id, department_id, salary
from employees
order by department_id, salary desc;



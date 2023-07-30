
/* Q1.

*/

select
    last_name "성"
    , first_name "이름"
    , salary "급여"
from
    employees
;    
    

/* Q2.

*/
select
    job_id "직무 ID"
    , job_title "직무명"
from
    jobs
;    


/* Q3.

*/
select
    department_id "부서 ID"
    , department_name "부서명"
from
    departments
;    

/* Q4.

*/
select
    location_id "지역 ID"
    , city "도시"
from
    locations
;    

/* Q5.

*/
select
    first_name "이름"
    , salary "급여"
from employees
where salary >= 5000
--order by 급여
;    



/* Q6.

*/
select
    first_name "이름"
    , hire_date "근무 시작일"
from employees
where SUBSTR(hire_date,1,2) >= 05
order by "근무 시작일";


select
    first_name "이름"
    , hire_date "근무 시작일"
from employees
where hire_date >'05/01/01'
order by "근무 시작일";


select
    first_name "이름"
    , hire_date "근무 시작일"
from employees
where hire_date > TO_DATE('2005-01-01', 'YYYY-MM-DD')
order by "근무 시작일"; -- 이것이 올바른 답 ???



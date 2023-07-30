

-- 1. where 기본 문법

select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

-- 2. 숫자와는 달리 문자열은 ' 기호가 양옆에 붙는다
--    이때 대소문자를 구분해서 써야 함
select employee_id, last_name, job_id, department_id
from employees
where last_name = 'Whalen';

/*
   3. 날짜 값은 형식을 구분해서 써야 함  
*/
select last_name, hire_date
from employees
where hire_date = '03/06/17';

/*
      4.
       기본 날짜 표시형식은 DD-MM-RR 이다.
       그런데 SQL developer 에서는 환경설정 (데이터베이스 > NLS > 날짜형식(F)) 이 RR/MM/DD 값으로 되어 있을 경우, 결과가 RR/MM/DD 로 나온다
*/
select last_name, hire_date
from employees
where last_name  = 'King'; -- 03/06/17


/*
   5. 콘솔의 sqlplus 로 아래 쿼리를 실행하면 DD-MM-RR 결과가 나온다
*/
select last_name, hire_date
from employees
where last_name  = 'King'; -- 17-06-03



/*
 6. 연산자
  = 
  > 
  >= 
  < 
  <=                           
  <>                                         같지 않음
   BETWEEN ... AND ...                두 값 사이(경계값 포함)
   IN(set)                                   값 리스트 중 일치하는 값 검색
   LIKE                                      일치하는 문자 패턴 검색
   IS NULL                                  NULL 값인지 여부
*/


/*
  7. BETWEEN
*/
select last_name, salary
from employees
where salary >= 2500 and salary <= 3500; -- BETWEEN 2500 AND 3500 과 같은 결과가 나온다


-- 8. IN
select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100, 101, 201);


-- 9. or
--       8번과 같은 결과가 나오지만, 8, 9번 중에서 9번 방식은 잘 쓰지 않는다.
--       그렇다고 9번 or 방식 자체가 잘 쓰지 않는건 아니다.
--       8, 9번 방식 2개 방식이 있을때에는 9번 방식이 잘 쓰지 않을 뿐이다.
select employee_id, last_name, salary, manager_id
from employees
where manager_id = 100
or manager_id = 101
or manager_id = 102;


-- 10. LIKE
select first_name
from employees
where first_name LIKE '______o%';

/*
 like 문은 패턴을 이용하여 검색을 할 수 있는 명령어다
 % : 0개 이상
 _ : ????????????????
 
 %b%           소문자 b 가 포함된 것을 모두 표시
 %B%           대문자 B 가 포함된 것을 모두 표시
 b%           소문자 b 로 시작되는 것을 모두 표시
 B%           대문자 B 로 시작되는 것을 모두 표시
 _o%             o 가 2번째로 나오는 결과만 표시 (대체문자 결합)
 ______o%       o 가 7번째로 나오는 결과만 표시
*/



/*
-- 11. escape
          아래 예제는 SA_ 가 포함된 결과를 표시한다. ESCAPE 키워드와 그 뒤의 기호를 ' 따옴표를 이용하여 표기해야 함에 주의한다
*/
select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' ESCAPE '\'; 

select employee_id, last_name, job_id
from employees
where job_id like '%SA$_%' ESCAPE '$'; -- 백 슬래쉬(\)를 $ 로 바꿔주는 효과


-- 12. null 조건
select last_name, manager_id
from employees
where manager_id is null;

select last_name, manager_id
from employees
where manager_id = null; -- 이렇게하면 결과가 안나온다 (이렇게 쓰면 안된다)


-- 13. 논리 연산자 --------- AND OR NOT 가 있다
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
and job_id LIKE '%MAN%';

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
or job_id LIKE '%MAN';

select employee_id, last_name, job_id, salary
from employees
--where job_id in ('IT_PROG', 'ST_CLERK', 'SA_REP'); -- 103 104 105 106 107 125 126 127 128 129 .... 144 150 151
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_REP'); -- 100 101 102 108 ... 124 145 ... 149


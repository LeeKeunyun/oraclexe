select employee_id, last_name, department_id
from employees
where last_name = 'higgins';

-- 1. LOWER() 함수는 문자열을 소문자로 변환함
select employee_id, last_name, department_id
from employees
where LOWER(last_name) = 'higgins';

/*
 2. UPPER() 함수는 문자열을 대문자로 변환함
   : from dual ? 
     - dual table 은 오라클의 임시테이블이다
*/
select UPPER('higgins') FROM dual;

select 12*3 FROM DUAL;

-- 3. INITCAP() 함수는 문자열의 첫 글자를 대문자로 변환
select employee_id, last_name, department_id
from employees
where last_name = INITCAP('higgins');


/*
 4. 
 
 원리 : 1번은 where 절에서 함수를 좌측 식에 사용하는 반면
       3번은 우측 식에 사용하고 있다. 
       1번과 3번 방법을 비교 했을때 3번 방법이 (절대적인 것은 아니지만 대체로) 낫다.

 why ?  
 1번 방법은 "값을 찾고 함수 실행"하는 작업을 1 cycle 로 n 번 실행하는 반면,
 3번 방법은 INITCAP 함수를 딱 1번만 실행하고 그 후 값을 찾는 작업을 n 번 실행한다(찾는 작업만 n번).
 그래서 3번은 옵티마이저 리소스 사용 낭비를 줄일수 있다.
*/

-- 5. CONCAT 함수는 두개의 파라미터 값을 연결한다.
-- 아래 2가지는 동일한 결과가 출력된다.
SELECT 'Hello' || 'World' FROM dual;
SELECT CONCAT('Hello', 'World') FROM dual;

-- 6. SUBSTR 함수는 지정된 길이의 문자열을 추출한다.
select SUBSTR('HelloWorld', 3, 3) from dual;

-- 7. LENGTH() : 문자열의 길이를 숫자 값으로 표시
select LENGTH('HelloWorld') from dual;

-- 8. INSTR() : 문자열에서 지정된 문자의 위치를 찾음
-- 이때 대소문자 구분을 해야 함에 주의한다
select INSTR('HelloWorld', 'W') from dual;

-- 9. LPAD() : 왼쪽부터 문자식으로 채운 표현식을 반환
select LPAD('salary', 10, '*') from dual;

-- 10. RPAD() : 왼쪽부터 문자식으로 채운 표현식을 반환
select RPAD('salary', 10, '*') from dual;

-- 11. REPLACE() : 문자열에서 지정된 문자를 치환합니다.
select REPLACE('JACK and JUE', 'J', 'BL') FROM dual; -- J 문자를 BL 문자로 바꿈

/*
   12. TRIM() : 문자열에서 선행 또는 후행 문자를 자른다.
   앞뒤 공백제거할 때 많이 쓰임 (사이는 제거 안됨)
*/
select TRIM('H' FROM 'HelloWorld') FROM dual;
select TRIM(' ' FROM ' HelloWorld ') FROM dual;

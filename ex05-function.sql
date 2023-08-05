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


/*
  13. 숫자 함수
  ROUND() : 소숫자 [2번째 파라미터 입력수치]번째 자리수 까지 반올림
  TRUNC() : 소숫자 [2번째 파라미터 입력수치]번째 자리수 이하는 절삭
  CELL()  : 주어진 숫자를 올림하여 정수로 반환
  MOD()   : 나눈 나머지를 반환
*/
SELECT ROUND(45.926, 2) FROM dual; -- 45.93
SELECT TRUNC(45.926, 2) FROM dual; -- 45.92
SELECT CEIL(45.111) FROM dual; -- 46
SELECT MOD(1600, 300) FROM dual; -- 100


/*
  14. 날짜 함수
  
  SYSDATE 를 조회시 05-08-23 로 표시 (일-월-년 기본값)
  

  그런데 SQL developer 에서는 환경설정 (데이터베이스 > NLS > 날짜형식(F)) 이 
   : DD-MM-RR 로 설정되어 있을 경우 결과는 05-08-23 로 나옴
   : RR/MM/DD 로 설정되어 있을 경우 결과는 23/08/05 로 나옴  
*/

SELECT SYSDATE FROM dual;


-- 15. 날짜 함수는 연산이 가능

select last_name, (sysdate - hire_date) / 7 as weeks
from employees
where department_id = 90;


/*
  16. 날짜 조작 함수

  MONTHS_BETWEEN(date1, date2) : 두 날짜 간의 월 수를 계산
  ADD_MONTHS(date, n) : 날짜에 n개월을 추가
  NEXT_DAY(date, day_of_week) : 지정된 날짜의 다음으로 주어진 요일이 나오는 날짜를 계산
                                (1:월요일 ~ 7:일요일)
  LAST_DAY(date) : 주어진 월의 마지막 날짜를 반환
  ROUND(date, format) : 날짜를 지정된 형식으로 반올림
  TRUNC(date, format) : 날짜를 지정된 형식으로 절삭
*/

select MONTHS_BETWEEN(TO_DATE('2016-12-22', 'YYYY-MM-DD'), TO_DATE('2017-05-22', 'YYYY-MM-DD')) AS "결과"
from dual;
-- 결과는 -5 로 표시

select MONTHS_BETWEEN(TO_DATE('2017-12-22', 'YYYY-MM-DD'), TO_DATE('2017-05-22', 'YYYY-MM-DD')) AS "결과"
from dual;
-- 결과는 7 로 표시

select ADD_MONTHS(TO_DATE('2022-12-16', 'YYYY-MM-DD'), 1) AS "결과"
from dual;
-- 결과 : 16-JAN-23

select NEXT_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 7) AS "결과"
from dual;
-- 결과 : 12-AUG-23

select LAST_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD')) AS "결과" from dual;
select LAST_DAY(SYSDATE) AS "결과" from dual;
-- 결과 : 31-AUG-23

select ROUND(TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'month') AS "결과" from dual;
-- 결과 : 01-AUG-23

select ROUND(TO_DATE('2023-08-26', 'YYYY-MM-DD'), 'month') AS "결과" from dual;
-- 결과 : 01-SEP-23

select TRUNC(TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'month') AS "결과" from dual;
-- 결과 : 01-AUG-23

select TRUNC(TO_DATE('2023-08-26', 'YYYY-MM-DD'), 'month') AS "결과" from dual;
-- 결과 : 01-AUG-23



/*
17. 변환 함수
 
TO_CHAR() : 날짜 또는 숫자를 문자열로 변환
 YYYY : 전체 연도를 숫자로 표시.
 YEAR : 영어 철자로 표기된 연도를 반환.
 MM : 월의 2자리 숫자 값
 MONTH : 전체 월 이름
 MON : 월의 3자리 약어
 DY : 3자리 요일 약어
 DAY : 요일의 전체 이름
 DD : 월간 일(1-31)의 숫자 형식
 HH : 1일 동안의 시간
 HH12 : 반일 시간(1-12)
 HH24 : 전일 시간(0-23)
 MI : 분(0-59)
 SS : 초(0-59)
 FF : 밀리세컨드(0-999)
 AM 또는 PM : 오전 또는 오후를 나타내는 자오선 표시를 반환
 A.M. 또는 P.M. : 오전 또는 오후를 나타내는 마침표가 있는 자오선 표시를 반환
 
*/

SELECT last_name, TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') AS HIREDATE
from employees; 


/*
18. 타임스탬프 : 날짜정보 + 밀리세컨드
*/
select TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.FF2') from dual;
-- sql developer 에서는 결과가 2023-08-05 16:08:20.24 로 표시


/*

19. TO_CHAR() 함수를 숫자에 사용할 때

 9 : 숫자
 0 : 0 이 표시되도록 강제로 적용
 $ : 부동 달러 기호를 배치
 L : 부동 로컬 통화 기호를 사용 (한국에서는 ￦ 가 표시됨)
 . : 소수점
 , : 천단위 표시자 쉼표
 
*/

SELECT 
    salary
    , TO_CHAR(salary, 'L99,999.00') SALARY1
FROM employees
where last_name = 'Ernst';
--     6000    ￦6,000.00



-- 20. TO_DATE() 함수 : 문자열을 DATE 타입으로 변환
select
    last_name, 
    hire_date,
    TO_CHAR(hire_date, 'YYYY-MM-DD') AS "결과"
from
    employees
where
    hire_date < TO_DATE('2005-01-01', 'YYYY-MM-DD');



/*

21. 함수 중첩
   단일 행 함수는 어떠한 레벨로도 중첩될 수 있음.
   중첩된 함수는 가장 깊은 레벨에서 가장 낮은 레벨로 평가됨.
   
*/

select
    last_name, 
    UPPER(CONCAT(SUBSTR(last_name, 1, 8), '_US')) AS "결과"
from
    employees
where
    department_id = 60;
    
    
    
    
/*

22. NVL() 함수 : null 값을 실제 지정한 값으로 반환
 ============= 중요 !
 
 참고로, null 이 연산이 안될때 사용한다.
 null 은 
    0 과는 다른 성격으로서, 연산을 할 수 없다.
    곱하기 더하기 등의 연산이 안되며, 비교는 is null 로 해야한다)

*/

SELECT 
    last_name
    , salary
    , commission_pct
    , NVL(commission_pct, 0) AS "NVL comm"
    , (salary * 12) AS "Y_SAL"
    , (salary * 12) + (salary * 12 * commission_pct) AS INVALID_AN_SAL
    , (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) AS AN_SAL
FROM
    employees;
    
    
/*

23. NVL2() 함수
 : 첫 번째 표현식을 검사합니다. 첫 번째 표현식이 null 이 아니면 두번째 표현식을 반환합니다.
 :                           첫 번째 표현식이 null 이면 세번째 표현식이 반환됩니다.

*/

SELECT 
    last_name
    , salary
    , commission_pct
    , NVL2(commission_pct, 'SAL+COMM', 'SAL') AS income
FROM
    employees
WHERE
    department_id IN (50, 80);



/*

24. NULLIF() 함수
 : 두 표현식을 비교하여 같으면 null 을 반환하고 다르면 expr1 을 반환한다
   그러나 expr1 에 대해 리터럴 NULL 을 지정할 수 없다.  
 
*/

SELECT 
    first_name
    , LENGTH(first_name) AS expr1
    , last_name
    , LENGTH(last_name) AS expr2
    , NULLIF(LENGTH(first_name), LENGTH(last_name)) AS result
SELECT 
    first_name
    , LENGTH(first_name) AS expr1
    , last_name
    , LENGTH(last_name) AS expr2
    , NULLIF(LENGTH(first_name), LENGTH(last_name)) AS result
FROM employees;


/*
25. COALESCE()
 : 리스트에서 null 이 아닌 첫번째 표현식을 반환

 아래 예제에는 3개식이 있다.
 먼저, 첫번째식부터 체크하는데, 
    첫번째식이 널이 아니면 첫번째식을 반환하고 끝낸다.
    첫번째식이 널일 경우, 두번째식을 체크하는데,
        두번째식이 널이 아니면 두번째식을 반환하고 끝낸다.
        두번째식이 널일 경우, 세번째식을 반환하고 끝낸다.
 
*/

select 
    last_name
    , employee_id
    , commission_pct
    , manager_id
    , COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'No commission and no manager') AS result
FROM employees;

    
/* 
26. 조건부 표현식  ================= 중요!

    case 식
       IF-THEN-ELSE 문 작업을 수행하여 조건부 조회를 편리하게 수행하도록 한다.

*/

SELECT
    last_name
    , job_id
    , salary
    , CASE job_id
            WHEN 'IT_PROG' THEN 1.10 * salary
            WHEN 'ST_CLERK' THEN 1.15 * salary
            WHEN 'SA_REP' THEN 1.20 * salary
            ELSE salary
      END AS REVISED_SALARY
FROM employees;


/* 
27. 조건부 표현식2  ================= 중요!

    decode 식은 case 식과 유사한 작업을 수행한다.

*/

SELECT
    last_name
    , job_id
    , salary
    , DECODE(job_id, 'IT_PROG', 1.10 * salary,
                     'ST_CLERK', 1.15 * salary,
                     'SA_REP', 1.20 * salary,
                      salary ) AS REVISED_SALARY
FROM employees;

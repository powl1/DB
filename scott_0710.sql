-- DB 수업 2일 : 2023-07-10

-- 이름이 F로 시작하는 사람 찾는 쿼리문
-- 와일드 카드 *
-- 검색하고자 하는 값을 정확히 모를 경우 와이들 카드와 함께 사용할 수 있다.
select * from emp where ename like 'F%';

-- 위치 상관 없이 이름 중에 A가 들어있는 사람을 찾는 쿼리문
select * from emp where ename like '%A%'; /* A가 어느 곳에 위치해도 상관없다*/

-- 이름이 N으로 끝나는 사람 찾는 쿼리문
select * from emp where ename like '%N';

-- 언더바(_)는 단 한 문자에 대해서만 와일드 카드 역할을 한다.
-- 예) 이름의 두 번째 글자가 A인 사원을 찾는 쿼리문
select * from emp where ename like '_A%';

-- 이름의 세 번째 글자가 A인 사원을 찾는 쿼리문
select * from emp where ename like '__A%';

-- 이름에 A를 포함하지 않는 사람만 검색하는 쿼리문
-- NOT의 위치는 동사포현으로 like 앞에 온다.
-- ~하지 않는다. 에서는 무조건 not 사용을 생각해봐야한다.
select * from emp where ename not like '%A%';


-- NULL을 위한 연산자

-- 커미션을 받지 못하는 사람을 검색하는 퀴리문
select * from emp where comm = null;

-- IS NULL / IS NOT NULL
select * from emp where comm is not null;


-- 정렬을 위한 order by절
-- 오름차순 asc / 내림차순 desc

-- 사원들의 급여를 오름차순으로 정렬하는 쿼리문
select * from emp order by sal asc; /* 오름차순 */
select * from emp order by sal desc; /* 내림차순 */

-- 가장 최근에 입사한 사원부터 출력하는 쿼리문
select * from emp order by hiredate desc;

-- 이름을 사전순 출력하는 쿼리문
select * from emp order by ename asc;

-- 월급이 3000 이상인 사원을 이름 순으로 출력
select * from emp where sal >= 3000 order by ename asc;
-- 정렬(order by)는 무조건 맨 뒤에 작성


-- DISTINCT
-- distinct : 명령어 사용하면 중복 제거되어 출력된다.
-- 사원들이 소속되어 있는 부서의 번호를 출려하는 출력문
select distinct deptno from emp; /* distinct : 중복 제거 */


-- col 연산
select sal * 12 from emp;

-- as (별칭)
select sal * 12 as 샐러리 from emp;

-- 수직바 (||)
select ename || ' is a ' || job "연결정의 예" from emp; /* 수직바(||) 는 String 플러스(+) 역할을 한다. */
-- select ename || ' is a ' || job [as] "연결정의 예" from emp; as는 생략이 가능하지만, 가독성을 위해 as를 넣어줘야한다.
-- 홀따옴표(') : 
-- 쌍따옴표(") : 

/*
컬럼에 연산이 가능하다.
컬럼에 연산을 하게 되면 해당 컬럼에 해당되는 데이터를 같이 연산한다.
sal (월급) X 12 = 연봉

엘리얼스(as) : 별칭을 준다. 또 다른 이름을 줌
수직바(||) : 컬럼내의 문자열을 추가

*/


-- 테이블 데이터 타입 확인
desc emp;
desc dept;

-- 산술 연산의 결과를 한 줄로 얻기 위해서 오라클에서 제공하는 테이블이다.
-- 여미
-- 24 *26
-- 한 행으로 결과를 출력하기 위한 테이블이다.
-- 산술 연산이나 가상 컬럼 등의 값을 한번만 출력하고 싶을 때 많이 사용한다.

select 24 *26 from dual; /* 24 * 26(행) 624(열) */ 
select sysdate from dual; /* sysdate(행) 23/07/10(열) */
-- 오라클에서 재공하는 내장 함수들 (숫자형, 문자형, 날짜형)


-- 숫자함수
-- -10에 대한 절대값을 구하는 쿼리문
SELECT abs(-10) from dual; /* 10 */

-- 소주점 아래를 버리는 함수
select 34.5432, floor(34.5432) from dual; /* 34.5432 34*/

-- 특정 자릿수에서 34.5432을 반올림하는 쿼리문
-- ROUND(소숫점, 반올림 위치)
select 34.5432, round(34.5432, 2) from dual; /* 34.5432 34.54*/
select 34.5632, round(34.5632, 1) from dual; /* 34.5632 34.6 */
select 34.5632, round(34.5632, 0) from dual; /* 34.5632 35 */

-- 나누기 연산을 한 후 나머지를 결과 = 자바 연산자 % 와 같다
select mod(27, 5), mod(27, 5), mod(27, 7) from dual; /* 2 2 6 */


-- 문자열처리
-- upper(대문자) / lower(소문자)
select 'oracle', upper('oracle') from dual; /* ORACLE */
select lower('ORDER') from dual; /* order */

-- emp에서 ename을 소문자로 뽑아내시오
select lower(ename) from emp;

-- 이니셜만 대문자로 변환
select INITCAP('oracle') from dual; /* Oracle*/

-- 
select initcap(ename) from emp;

-- 문자 길이를 구하는 함수
select length(ename), ename from emp; /* 5 SMITH */

-- SUBSTR(시작위치, 갯수) 시작 위치부터 선택 개수만큼의 문자를 추출한다.
-- smith
select substr('oracle', 0, 1) from dual;
select substr(ename, 0 , 1) from emp; /* S : emp 테이블의 이름에서 첫번째 글자만 출력 */

-- 오라클에서 인덱스는 0이 아닌 1부터 시작한다.

-- emp에서 이름, 입사년도, 입사 달 출력
select ename, 19 || substr(hiredate, 0, 2) as 년도, substr(hiredate, 4, 2) as 달 from emp;
-- 9월에 입사한 사원을 출력하는 쿼리문
select ename, 19 || substr(hiredate, 0, 2) as 년도, substr(hiredate, 4, 2) as 달 from emp where substr(hiredate, 4, 2) = '09';


-- 공백제거
select ltrim('                    ORACLE') from dual;
select rtrim('                    ORACLE') from dual;


-- 날짜 함수 SYSDATE
select sysdate from dual; /* 23/07/10 */
-- 어제 출력
select sysdate - 1 어제 from dual; /* 23/07/09 */
-- 내일
select sysdate + 1 from dual; /* 23/07/11 */
-- 어제 오늘 내일
select sysdate - 1 어제, sysdate 오늘, sysdate + 1 내일 from dual;

-- 개월수 MONTHS_BETWEEN, ADD_MONTHS
-- 두 날짜 사이의 개월수
select ename, sysdate, hiredate, floor(months_between(sysdate, hiredate)) 근무개월수 from emp;
select ename, sysdate, hiredate, round(months_between(sysdate, hiredate)) 근무개월수 from emp;
-- 입사한 날짜에서 4개월 추가한 결과값을 나타내는 쿼리문
select ename, sysdate, add_months(hiredate, 4) 근무개월수 from emp;

-- NEXT_DAY, LAST_DAY
-- 오늘을 기준으로 가장 가까운 다음주 수요일은 언제인지 알아보는 쿼리문
select sysdate, next_day(sysdate, '수요일') from dual; /* 23/07/12 */
select sysdate, next_day(sysdate, '금요일') from dual; /* 23/07/14 */
-- 입사한 달의 마지막 날을 구하는 쿼리문
select hiredate, LAST_DAY(hiredate) from emp;

-- 문자형 TO_CHAR
-- 현재 날짜를 문자형으로 변호나하여 출력하는 쿼리문
select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual; /* 23/07/10	2023-07-10 */
-- 사원들의 입사일을 출력하되, 요일까지 함께 출력하는 쿼리문
select sysdate, to_char(hiredate, 'YY;;MM;;DD day') as 입사일 from emp; /* 23/07/10	80;;12;;17 수요일 */
-- 현재 날짜와 시간을 출력하는 쿼리문
select sysdate, to_char(sysdate, 'YYYY/MM/DD, HH24:MI:SS') from dual; /* 23/07/10	2023/07/10, 13:08:57 */

-- 각 지역별 통화 기호를 앞에 붙이고 천 단위마다 콤마를 붙여서 출력하는 쿼리문 (예: ￦1,230,000)
-- L999,999 : local 999,999 = 세 자리마다 콤마(,)를 찍는다.
desc emp;
select ename, sal, to_char(sal, 'L999,999') from emp; /* ￦1,600*/


-- TO_DATE 함수
-- 문자형 -> DATE타입
-- 1981년 2월 20일에 입사한 사운을 검색하는 쿼리문
select ename, hiredate from emp where hiredate = '19810220'; /* ALLEN 81/02/20 */
select ename, hiredate from emp where hiredate = '1981.02.20';
select ename, hiredate from emp where hiredate = '1981/02/20';
select ename, hiredate from emp where hiredate = '1981-02-20';
select ename, hiredate from emp where hiredate = to_char('19810220'); /* to_char 으로 변경해도 기본형만 맞추면 출력이 된다.*/
select ename, hiredate from emp where hiredate = to_date(19810220, 'YYYYMMDD');

-- 올해 며칠이 지났는지 현재 날짜에서 2016/01/01을 뺀 결과를 출력
select sysdate - to_date('2016/01/01', 'YYYY/MM/DD') from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;


-- NULL을 다른 값으로 변환하는 NVL함수
-- 연봉 계산하는 쿼리문
-- nvl 함수 = NULL 값을 변경한다.
select ename, sal, sal * 12 + comm from emp;
select ename, sal, sal * 12 + nvl(comm, 0) from emp; /* */
/* nvl(comm, 0) : comm에 null 값이 있으면 0으로 교체해서 계산하라. */


-- 선택을 위한 DECODE 함수 명령어
-- 여러가지 경우에 대해서 선택할 수 있도록 하는 기능을 제공한다. (SWITH CASE문과 같은 기능)
select deptno from emp order by deptno;

select deptno, decode(deptno, 10, 'A', 20, 'B', 30, 'C') from emp order by deptno;
select ename, deptno, decode(deptno, 10, 'accounting', 20, 'research', 30, 'sales') as dname from emp order by deptno;

-- CASE 함수
-- case 함수는 JAVA의 IF문이다.
SELECT ENAME, DEPTNO, /* if 문의 시작*/
    CASE WHEN DEPTNO=10 THEN 'ACCOUNTING'
         WHEN DEPTNO=20 THEN 'RESEARCH'
         WHEN DEPTNO=30 THEN 'SALES'
         WHEN DEPTNO=40 THEN 'OPERATIONS'
    END AS ENAME /* case 안에 내용을 as ename 으로 만들어라, as 별칭 필수*/
FROM EMP; /* if 문의 끝*/

-- 문제) sal 2500 이상이면 수, 2500 미만이면 가, 컬럼명 등급
select ename, sal,
    case when sal >= 2500 then '수'
         when sal < 2500 then '가'
    end as 등급
from emp;


-- 사원의 급여를 출력하되 단일행 함수 round로 천단위 이하를 반올림하는 퀴리문
select deptno, sal, round(sal, -3) from emp; /* 소수점 기준 왼쪽으로 가면 마이너스(-) 붙여서 숫자 업 */
-- 그룹 함수를 이용하여 사원의 총 급여를 구하는 쿼리문
select sum(sal) as 총급여 from emp ;
-- 함수 = 단일행 함수 와 그룹 함수
-- 단일행 함수 : 각 행에 대해서 함수
-- 예) round
-- 그룹 함수 : 복수의 행에 대해서 1개의 행으로 출력 되는 함수
-- 예) sum

select *, sum(sal) from emp ; 
/* 
위 쿼리문이 오류나는 이유
그룹 함수의 결과값은 하나인데, 그룹 함수를 적용하지 않은 단순 컬럼의 로우의 개수가 14개이기 때문에 산출되는 로우의 수가 달라 둘이 매치 시킬 수 없기 때문이다.
산출되는 로우의 수가 달라 둘을 매치 시킬 수 없기 때문이다.
so, * 은 모든 값(14)이고, sum은 sal의 합인 1개 이기 때문에 오류가 난다.
*/


-- 평균 AVG
-- 급여 평균 구하기
select avg(sal) from emp;

-- MAX 최대값, MIN 최소값
select max(sal), min(sal) from emp;

-- COUNT 갯수 구하기
-- 총 사원수 구하기
select count(*) from emp;

-- 문제 : 중복 제거를 반영하여 담당업무의 개수를 구하는 쿼리문
select COUNT(DISTINCT job) as 업무수 from emp;


-- GROUP BY 문
-- 특정 컬럼을 기준으로 그룹화
-- 테이블에 존재하는 행들을 그룹별로 구분하기 위해 사용
-- 문제 : 사원 테이블을 부서 번호로 그룹 짓는 쿼리문
select deptno from emp group by deptno; /* 중복이 제거 되면서 특정 컬럼을 기준으로 그룹됨 */


-- 소속 부서별 평균 급여를 구하는 쿼리문
select deptno, avg(sal) from emp group by deptno;

/* 선생님 풀이 
1. 컬럼은 GROUP BY 한 컬럼 명이 올 수 있다.
2. 집합 함수가 올 수 있다. 단일 함수는 올 수 가 없다.
*/
select deptno, avg(sal) from emp group by deptno;


-- 문제 : 소속 부서별 최대 급여와 최소 급여를 구하는 쿼리문
select deptno, max(sal), min(sal) from emp group by deptno;

-- 문제 : 부서별 사원의 수
select deptno, count(*) from emp group by deptno;

-- 문제 : 그룹 지어진 부서별 평균 급여가 2000 이상인 부서의 번호와 부서별 평균 급여를 출력하는 쿼리문
select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000;
/* GROUP BY문은 WHERE 이 먹히기 않고, HAVING 으로 조건을 줘야한다. */

desc emp;
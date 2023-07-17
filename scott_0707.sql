-- DB 수업 1일 : 2023-07-07

select * from dept;
 /* select * from emp; emp 테이블 */
select empno, ename from emp; /* emp 에서 empNo와 eName 두 개만 검색하고 싶다.*/
select ename from emp;
select * from emp where sal > 3000; /* emp 에서 where(조건) sal이 3000 이상인 조건만 검색*/
select * from emp where ename = 'SMITH'; /* where(조건) 이름이 smith인 사람 */
select * from emp where DEPTNO = 20; /* 부서번호가 20인 사람 */
select * from emp where sal < 3000; /* 셀러리가 3000 이하 */
select * from emp where sal != 3000; /* 셀러리가 3000 이 아닌 사람. */
-- 조건에 아닌 경우 !=, <>, ^= 세 가지 이다.

select empno, ename, sal from emp where ename = 'SMITH';

select * from emp where job = 'PRESIDENT'; /* job 이 프레지던트인 사람*/
select * from emp where HIREDATE > '1982-01-01'; /* 1982년 1월 1일 이후 입사한 사원*/
-- 날짜 타입은 String 으로 적어야한다.

select * from emp where deptno = 10 and job = 'MANAGER'; /* deptno 10번 부서이고, job manager 인 사람*/
-- 조건이 두개 이상일 경우, and 사용

select * from emp where deptno = 10 or job = 'MANAGER';
select * from emp where not deptno = 10; /* deptno 10번 부서가 아닌 사람*/

/* 급여가 2000 ~ 3000 사이의 사람*/
select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;
-- 범위 설정할 때는 between A and B 사용

/* 급여가 2000미만 ~ 3000초과 사이의 사람*/
select * from emp where sal < 2000 or sal > 3000;
select * from emp where sal not between 2000 and 3000;

/* 1982년에 입사한 사람*/
select * from emp where hiredate between '1982-01-01' and '1982-12-31';
-- 날짜 표현시 구별은 슬래시(/), 점(.), 하이픈(-) 이 있다.

/* 커미션(comm)이 300 혹은 500 혹은 1400인 사람*/
select * from emp where COMM = 300 or comm = 500 or comm = 1400;
select * from emp where COMM in(300, 500, 1400);
-- in 문법 : in(A,B,C,...) 값 중에 맞는거
select * from emp where COMM not in(300, 500, 1400); /* 300 혹은 500 혹은 1400이 아닌 사람 */





-- 컬럼명은 대소문자 안 가림. ex) emp, job, ename
-- 데이터명은 대소문자 가린다. ex) SMITH, PRESIDENT
-- 부정을 할 때 이용되는 방법 !=  <>  ^=  not [데이터 (데이터 앞 not 붙이기)]

----------------------------------------------------------------------------------------------

-- 이름이 F로 시작하는 사람 찾는 쿼리문
-- 와일드 카드 *
-- 검색하고자 하는 값을 정확히 모를 경우 와이들 카드와 함께 사용할 수 있다.
select * from emp where ename like 'F%';

-- 위치 상관 없이 이름 중에 A가 들어있는 사람을 찾는 쿼리문
select * from emp where ename like '%A%'; /* A가 어느 곳에 위치해도 상관없다*/

-- 검색하고자 하는 값을 정확히 모를 경우 와이들 카드와 함께 사용할 수 있다.
select * from emp where ename like '%N';

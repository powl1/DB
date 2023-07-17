-- DB 수업 3일 : 2023-07-11

-- 복습 : 부서의 최대값과 최쇠값을 구하되, 최대 급여가 2900 이상인 부서만 출력하는 쿼리문
select deptno, max(sal), min(sal) from emp GROUP BY deptno having max(sal) >= 2900;


-- 10. 조언의 필요성 JOIN
-- 여러 테이블에 흩어져 있는 정보 중에서 사용자가 필요한 정보만 가져와서 가상의 테이블처럼 만들어서 결과를 보여준다.
-- JOIN은 기본적으로 카테이션 곱
-- 카테이션 곱 = 집합 (*)
select * from emp, dept;

-- 사원 정보를 출력할 때, 각 사원이 소속된 부서의 상세 정보를 출력하기 위해 두 개의 테이블을 조안하는 쿼리문
select * from emp, dept where emp.deptno = dept.deptno;
/*
1. 먼저 JOIN을 시키고 select * from emp, dept
2. 조건을 입력시키고 select * from emp, dept where emp.deptno
3. 같은 조건만 출력 select * from emp, dept where emp.deptno = dept.deptno;
*/

-- SMITH인 사람의 부서명을 출력해 보는 쿼리문
select ename, dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';
select ename, dname from emp e, dept d where e.deptno = d.deptno and emp.ename = 'SMITH';
/*
점(.)을 붙이는 이유
emp와 demp 모두 deptno을 가지고 있기 때문에 .deptno로 조건을 단다

emp e 테이블에 별칭을 달아 줄 수 있다
그러면 뒤에 조건에 e.deptno 처럼 별칭으로 사용이 가능해진다.
*/

-- EQUI JOIN
-- 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치되는 행을 연결하여 결과를 생성하는 조인 기법
-- 파일 > Date Modeler > 임포트 > 데이터 딕션너리

-- NON-EQUI JOIN(비등가 조인)
-- 동일 컬럼이 없이 다른 조건을 사용하여 조인
-- 
select * from salgrade;
-- 각 사원의 급여가 몇 등급인지 살펴보는 쿼리문
select ename, sal, grade from emp, salgrade;
/*
1. 우선 모두 다 뽑아 놓기
select * from emp, salgrade; (60개)
2. 조건 넣어주기
select * from emp, salgarade order by ename; 
3. 조건을 줘서 나머지 정리
select * from emp, salgrade where sal >= losal and sal <= hisal order by ename;
select * from emp, salgrade where sal between losal and hisal order by ename;
*/
select * from emp, salgrade where sal between losal and hisal order by ename;
-- 각 사원들의 부서명도 추가하여 출력
select * from emp, salgrade, dept where sal between losal and hisal and emp.deptno = dept.deptno order by ename;
-- 해당 사원의 매니저는 누구인가
select e.ename, m.ename from emp e, emp m where e.mgr = m.empno order by e.ename;
select e.ename || '의 매니저는 ' || m.ename || '입니다' from emp e, emp m where e.mgr = m.empno order by e.ename;

-------- ANCI JOIN --------
-- emp와 dept 테이블을 deptno칼럼으로
select * from emp, dept where emp.deptno = dept.deptno;

-- emp와 dept 테이블을 INNER JOIN, 같은게 여러개 있다면 여러 조합으로 JOIN
select * from emp INNER JOIN dept on emp.deptno = dept.deptno;

-- (1) OUTER JOIN
-- LEFT OUTER JOIN
select * from dept left outer join emp on emp.deptno = dept.deptno;
select * from emp left outer join dept on emp.deptno = dept.deptno;

-- 오라클에서 OUTER JOIN
-- select * from dept left outer join emp on emp.deptno = dept.deptno;
select * from dept, emp where emp.deptno = dept.deptno;
/* 위 조건과 같게 나오기 위해서는 테이블명이 동일하게 나와야한다 */
select * from dept, emp where emp.deptno(+) = dept.deptno;
/*
(+) 의미 : 원래는 12개가 나오지만 +를 하게 되면 emp쪽에 한 줄을 넣어라.
그러면 null 값으로 줄이 추가된다.

13 - 40	OPERATIONS	BOSTON	(null)  (null)  (null)  (null  (null)  (null)  (null)  (null)
*/

-- RIGHT OUTER JOIN
select * from emp right outer join dept on emp.deptno = dept.deptno;
-- right join은 잘 사용하지 않는다
select * from dept left outer join emp on emp.deptno = dept.deptno; /* 와 같은 JOIN이다 */

---------- 유니온 ----------
-- 유니온 = 합집합
select job, deptno from emp where sal >= 3000
UNION all /* 중복되는건 나오지 않는다 */
select job, deptno from emp where deptno = 10;

-- select job, deptno
-- from (select job, deptno from emp where sal >= 3000) a, (select job, deptno from emp where deptno = 10) b;


---------- 서브쿼리 ----------
select deptno from emp where ename = 'SMITH';
select dname from dept where deptno = 20;

-- join 사용
select dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';
-- 서브쿼리
-- 하나의 select 문장 내에 포함된 또 하나의 select 문장이 있는 쿼리문
-- 비교 연산자의 오른쪽에 기술해야 하고, 반드시 괄호 안에 넣어야 한다
select dname from dept where deptno = (select deptno from emp where ename = 'SMITH');

-- 사원들의 평균 급여보다 더 많은 급여를 받는 사원을 검색하는 쿼리문
select * from emp where sal >= (select avg(sal) from emp);

-- SMITH의 급여와 동일하거나 급여를 더 많이 받는 사원과 급여를 출력하는 쿼리문
select ename, sal from emp where sal >= (select sal from emp where ename = 'SMITH');
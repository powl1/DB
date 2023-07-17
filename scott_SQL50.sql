-- DB 수업 4일_2 : 2023-07-12

-- SQL 50문제

-- 1. 부서테이블의 모든 데이터를 출력
select * from dept;

-- 2. MP테이블에서 각 사원의 직업, 사원번호, 이름, 입사일을 출력
select deptno, ename, job, hiredate from emp;

-- 3. EMP테이블에서 직업을 출력하되, 각 항목(ROW)가 중복되지 않게 출력
select distinct job from emp;

-- 4. 급여가 2850 이상인 사원의 이름 및 급여를 표시하는 출력
select ename, sal from emp where sal > 2850;

-- 5. 사원번호가 7566인 사원의 이름 및 부서번호를 표시하는 출력
select ename, deptno, empno from emp where empno = 7566;

-- 6.급여가 1500이상 ~ 2850이하의 범위에 속하지 않는 모든 사원의 이름 및 급여를 출력
select ename, sal from emp where sal not between 1500 and 2850;
/* BEWTEEN A AND B */

-- 7. 1981년 2월 20일 ~ 1981년 5월 1일에 입사한 사원의 이름,직업 및 입사일을 출력
select ename, job, hiredate from emp where hiredate between '1981/02/20' and '1981/05/01';

--- END 2023.07.12 ---

-- 8. 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를 출력하되, 이름을 알파벳순으로 정렬
select ename, deptno from emp where deptno in(10, 30) order by ENAME;

-- 9. 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는 사원의 이름 및 급여를 출력
select ename, sal, deptno from emp where deptno in(10, 30) and sal > 1500;

-- 10. 관리자가 없는 모든 사원의 이름 및 직위를 출력
select ename, job from emp where mgr is null;

-- 11. 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 급여를 기준으로 내림차순으로 정렬하여 출력
select ename, sal, comm from emp order by sal asc; /* 올림차순, 커미션 받은 조건 X */
/* 정답 */ select ename, sal, comm from emp where comm is not null order by sal desc; /* 내림차순, 커미션을 받은 조건 */

-- 12. 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력
select ename from emp where ename = '__A%';
/* 정답 */ select ename from emp where ename like '__A%'; /* like '찾는 값'; : 부등호가 아닌 like 를 넣어야한다 */

-- 13. 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 출력
select ename from emp where ename like '%L%L%' and deptno=30;

 -- 14. 직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 아닌 모든 사원의 이름, 직업 및 급여를 출력
select ename, job, sal from emp where job in('CLERK', 'ANALYST') and sal not in(1000, 3000, 5000);

-- 15. 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 컬럼명을 New Salary로 지정하여 출력
select empno, ename, sal, round(sal+(sal*0.15),0) as "new salary" from emp; -- round : 諛섏삱由?

-- 16. 15번 문제와 동일한 데이타에서 급여 인상분(새 급여에서 이전 급여를 뺀 값)을 추가해서 출력(컬럼명은 Increase)
select empno, ename, sal, round(sal+(sal*0.15)) as "new salary", (round(sal+(sal*0.15)))-sal as "Increase" from emp;

-- 17. 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력
select upper(substr(ename,1,1)) || lower(substr(ename,2,12)) as "name", length(ename) as "lenename" from emp;

--select initcap(ename)as name, length(ename) as lenght from emp;
-- 18. 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은 사원의 커미션은 'no commission'으로 출력
select ename, nvl(to_char(comm), 'no commission') from emp; -- nvl(null value) : 泥? 踰덉㎏ 媛믪씠 NULL?씤 寃쎌슦 ?몢 踰덉㎏ 媛믪쑝濡? ??泥댄븯?뒗 ?븿?닔

-- 19. 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하라.(DECODE)
select empno, deptno, decode(deptno, 10, 'ACCOUNTIG', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS') as "dname" from emp;

-- 20. 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력(議곗씤)
select e.ename, e.deptno, d.dname from emp e, dept d where e.deptno=d.deptno and e.deptno=30;

-- 21. 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력 (단, 직업 목록이 중복되지 않게 하라.)
select distinct e.job, d.loc from emp e, dept d where e.deptno = d.deptno and d.deptno = 30; -- loc : 遺??꽌 ?쐞移? , distinct 以묐났?젣嫄? 

-- 22.  커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력
select e.ename, d.dname, d.LOC from emp e, dept d where e.deptno=d.deptno and comm is not null;

-- 23. 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력
select e.ename, d.dname from emp e, dept d where e.deptno=d.deptno and e.ename like '%A%';

-- 24. Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 출력
select e.ename, e.job, e.deptno, d.dname from emp e, dept d where e.deptno=d.deptno and d.loc = 'DALLAS';

-- 25. 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되, 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력.
select e.ename as "employee", e.empno as "emp#", m.ename as "manager", m.empno as "mgr#" from emp e, emp m where e.mgr=m.empno;

-- 26. 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력
select e.ename, e.job, d.dname, e.sal, s.grade from emp e, dept d, salgrade s where e.deptno=d.deptno and e.sal between s.losal and s.hisal;

-- 27. Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE>(SELECT HIREDATE
FROM EMP
WHERE ENAME='SMITH');
--- END 2023.07.14 ---

-- 28 Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라.
select ename, hiredate from emp where hiredate > (select hiredate from emp where ename='SMITH');

-- 29. 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일, 관리자의 이름, 관리자의 입사일을 출력하되 각각 컬럼명을 Employee,EmpHiredate, Manager,MgrHiredate로 표시하여 출력
select E.ename as "Employee", E.hiredate as "EmpHiredate", M.ename as "Manager", M.hiredate as "MgrHiredate"
from emp E, emp M
where E.mgr=M.empno and E.hiredate < M.hiredate;

--- END 2023.07.17 ---

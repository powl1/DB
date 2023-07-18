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

-- 30. 모든 사원의 급여 최고액,최저액,총액 및 평균액을 출력하되 각 컬럼명을 Maximum, Minimum, Sum, Average로 지정하여 출력
SELECT max(sal) as "Maximum", min(sal) as "Minimum",
sum(sal) as "Sum", avg(sal) as "Average"
from emp;
 
-- 31. 각 직업별로 급여 최저액.최고액,총액 및 평균액을 출력
select job, max(sal), min(sal), sum(sal), avg(sal) -- 단위 행하고는 같이 사용할 수 있다.
from emp
group by job;
 
-- 32. 직업이 동일한 사람 수를 직업과 같이 출력
select job, count(job)
from emp
group by job;
 
-- 33. 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하라. 그리고, 컬럼명을 Number of Manager로 지정하여 출력
select count(distinct(MGR)) as "Number of Manager" from emp;
 
-- 34. 최고 급여와 최저 급여의 차액을 출력
SELECT max(sal)-min(sal) from emp;
 
-- 35. 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력 (단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외. 급여 기준 내림차순)
select MGR, min(sal)
from emp
where MGR is not null
group by MGR
having min(sal) >= 1000
group by min(sal);
 
-- 36. 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력0 그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시
SELECT E.DEPTNO AS "부서명", D.DNAME AS "부서이름", D.LOC AS "위치",
COUNT(E.EMPNO) AS "사원의 수", AVG(E.SAL) AS "평균급여"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME, D.LOC
 
-- 37. Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력 단, Smith는 제외
SELECT ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD')
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
FROM EMP
WHERE ENAME='SMITH')
AND ENAME!='SMITH'
 
-- 38. 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를 표시하는 질의를 작성하고 급여를 기준으로 결과를 내림차순으로 정렬
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT AVG(SAL)
FROM EMP)
ORDER BY SAL DESC
 
-- 39. 이름에 T가 들어가는 사원의 속한 부서에서 근무하는 모든 사원의 사원번호 및 이름을 출력
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
FROM EMP
WHERE ENAME LIKE '%T%')
 
-- 40. 부서위치가 Dallas인 모든 사원의 이름,부서번호 및 직위를 출력
SELECT E.ENAME, E.DEPTNO, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND D.LOC='DALLAS'
 
-- 41. KING에게 보고하는 모든 사원의 이름과 급여를 출력
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
FROM EMP
WHERE ENAME='KING')
 
-- 42. Sales 부서의 모든 사원에 대한 부서번호, 이름 및 직위를 출력
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND D.DNAME='SALES'
 
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E inner join DEPT D on E.DEPTNO=D.DEPTNO
where D.DNAME='SALES'
 
--43> 자신의 급여가 평균 급여보다 많고 이름에 T가 들어가는 사원과
동일한 부서에 근무하는 모든 사원의 사원 번호, 이름 및 급여를 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
FROM EMP)
AND DEPTNO IN(SELECT DEPTNO
FROM EMP
WHERE ENAME LIKE '%T%')
 
--44> 커미션을 받는 사원과 급여가 일치하는 사원의 이름,부서번호,급여를 출력하라.
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL IN(SELECT SAL
FROM EMP
WHERE COMM IS NOT NULL)
 
--45> Dallas에서 근무하는 사원과 직업이 일치하는 사원의 이름,부서이름, 및 급여를 출력하시오
SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.JOB IN(SELECT E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND D.LOC='DALLAS')
 
--46> Scott과 동일한 급여 및 커미션을 받는 모든 사원의 이름, 입사일 및 급여를 출력하시오
SELECT ENAME, HIREDATE, SAL
FROM EMP
WHERE SAL=(SELECT SAL
FROM EMP
WHERE ENAME='SCOTT')
AND NVL(COMM,0)=(SELECT NVL(COMM,0)
FROM EMP
WHERE ENAME='SCOTT')
 
--47> 직업이 Clerk 인 사원들보다 더 많은 급여를 받는 사원의 사원번호, 이름, 급여를 출력하되,
결과를 급여가 높은 순으로 정렬하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>ALL(SELECT SAL
FROM EMP
WHERE JOB='CLERK') --결국 최대값과 비교 any 최소값과 비교
ORDER BY SAL DESC
 
--48> 이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과 월급, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE JOB IN(SELECT JOB
FROM EMP
WHERE ENAME LIKE '%A%')
 
--49> New York 에서 근무하는 사원과 급여 및 커미션이 같은 사원의 사원이름과 부서명을 출력하라.
select * from emp join dept
on emp.deptno = dept.deptno
and dept.loc='NEW YORK';
 
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE
e.deptno= d.deptno
AND E.SAL IN(
SELECT E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK'
)
AND NVL(COMM,0) IN(
SELECT NVL(COMM,0)
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND LOC='NEW YORK');
 
--50> Dallas에서 근무하는 사원과 직업 및 관리자가 같은 사원의 사원번호,사원이름,
직업,월급,부서명,커미션을 출력하되 커미션이 책정되지 않은 사원은 NoCommission으로 표시하고,
커미션의 컬럼명은 Comm으로 나오게 출력하시오. (단, 최고월급부터 출력되게 하시오)
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME,
NVL((TO_CHAR(E.COMM)),'NoCommision') AS "COMM"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND JOB IN(SELECT JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS')
AND MGR IN(SELECT MGR
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS')
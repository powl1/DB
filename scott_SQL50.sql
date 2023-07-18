-- DB ���� 4��_2 : 2023-07-12

-- SQL 50����

-- 1. �μ����̺��� ��� �����͸� ���
select * from dept;

-- 2. MP���̺��� �� ����� ����, �����ȣ, �̸�, �Ի����� ���
select deptno, ename, job, hiredate from emp;

-- 3. EMP���̺��� ������ ����ϵ�, �� �׸�(ROW)�� �ߺ����� �ʰ� ���
select distinct job from emp;

-- 4. �޿��� 2850 �̻��� ����� �̸� �� �޿��� ǥ���ϴ� ���
select ename, sal from emp where sal > 2850;

-- 5. �����ȣ�� 7566�� ����� �̸� �� �μ���ȣ�� ǥ���ϴ� ���
select ename, deptno, empno from emp where empno = 7566;

-- 6.�޿��� 1500�̻� ~ 2850������ ������ ������ �ʴ� ��� ����� �̸� �� �޿��� ���
select ename, sal from emp where sal not between 1500 and 2850;
/* BEWTEEN A AND B */

-- 7. 1981�� 2�� 20�� ~ 1981�� 5�� 1�Ͽ� �Ի��� ����� �̸�,���� �� �Ի����� ���
select ename, job, hiredate from emp where hiredate between '1981/02/20' and '1981/05/01';

--- END 2023.07.12 ---

-- 8. 10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ� ��ȣ�� ����ϵ�, �̸��� ���ĺ������� ����
select ename, deptno from emp where deptno in(10, 30) order by ENAME;

-- 9. 10�� �� 30�� �μ��� ���ϴ� ��� ��� �� �޿��� 1500�� �Ѵ� ����� �̸� �� �޿��� ���
select ename, sal, deptno from emp where deptno in(10, 30) and sal > 1500;

-- 10. �����ڰ� ���� ��� ����� �̸� �� ������ ���
select ename, job from emp where mgr is null;

-- 11. Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼��� ����ϵ�, �޿��� �������� ������������ �����Ͽ� ���
select ename, sal, comm from emp order by sal asc; /* �ø�����, Ŀ�̼� ���� ���� X */
/* ���� */ select ename, sal, comm from emp where comm is not null order by sal desc; /* ��������, Ŀ�̼��� ���� ���� */

-- 12. �̸��� �� ��° ���ڰ� A�� ��� ����� �̸��� ���
select ename from emp where ename = '__A%';
/* ���� */ select ename from emp where ename like '__A%'; /* like 'ã�� ��'; : �ε�ȣ�� �ƴ� like �� �־���Ѵ� */

-- 13. �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� ���
select ename from emp where ename like '%L%L%' and deptno=30;

 -- 14. ������ Clerk �Ǵ� Analyst �̸鼭 �޿��� 1000,3000,5000 �� �ƴ� ��� ����� �̸�, ���� �� �޿��� ���
select ename, job, sal from emp where job in('CLERK', 'ANALYST') and sal not in(1000, 3000, 5000);

-- 15. �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ� �÷����� New Salary�� �����Ͽ� ���
select empno, ename, sal, round(sal+(sal*0.15),0) as "new salary" from emp; -- round : 반올�?

-- 16. 15�� ������ ������ ����Ÿ���� �޿� �λ��(�� �޿����� ���� �޿��� �� ��)�� �߰��ؼ� ���(�÷����� Increase)
select empno, ename, sal, round(sal+(sal*0.15)) as "new salary", (round(sal+(sal*0.15)))-sal as "Increase" from emp;

-- 17. ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ǥ���ϴ� ������ �ۼ��ϰ� �÷� ��Ī�� ������ �־ ���
select upper(substr(ename,1,1)) || lower(substr(ename,2,12)) as "name", length(ename) as "lenename" from emp;

--select initcap(ename)as name, length(ename) as lenght from emp;
-- 18. ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ���� ����� Ŀ�̼��� 'no commission'���� ���
select ename, nvl(to_char(comm), 'no commission') from emp; -- nvl(null value) : �? 번째 값이 NULL?�� 경우 ?�� 번째 값으�? ??체하?�� ?��?��

-- 19. ��� ����� �̸�,�μ���ȣ,�μ��̸��� ǥ���ϴ� ���Ǹ� �ۼ��϶�.(DECODE)
select empno, deptno, decode(deptno, 10, 'ACCOUNTIG', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS') as "dname" from emp;

-- 20. 30�� �μ��� ���� ����� �̸��� �μ���ȣ �׸��� �μ��̸��� ���(조인)
select e.ename, e.deptno, d.dname from emp e, dept d where e.deptno=d.deptno and e.deptno=30;

-- 21. 30�� �μ��� ���� ������� ��� ������ �μ���ġ�� ��� (��, ���� ����� �ߺ����� �ʰ� �϶�.)
select distinct e.job, d.loc from emp e, dept d where e.deptno = d.deptno and d.deptno = 30; -- loc : �??�� ?���? , distinct 중복?���? 

-- 22.  Ŀ�̼��� å���Ǿ� �ִ� ��� ����� �̸�, �μ��̸� �� ��ġ�� ���
select e.ename, d.dname, d.LOC from emp e, dept d where e.deptno=d.deptno and comm is not null;

-- 23. �̸��� A�� ���� ��� ����� �̸��� �μ� �̸��� ���
select e.ename, d.dname from emp e, dept d where e.deptno=d.deptno and e.ename like '%A%';

-- 24. Dallas���� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� ���
select e.ename, e.job, e.deptno, d.dname from emp e, dept d where e.deptno=d.deptno and d.loc = 'DALLAS';

-- 25. ����̸� �� �����ȣ, �ش� �������̸� �� ������ ��ȣ�� ����ϵ�, �� �÷����� employee,emp#,manager,mgr#���� ǥ���Ͽ� ���.
select e.ename as "employee", e.empno as "emp#", m.ename as "manager", m.empno as "mgr#" from emp e, emp m where e.mgr=m.empno;

-- 26. ��� ����� �̸�,����,�μ��̸�,�޿� �� ����� ���
select e.ename, e.job, d.dname, e.sal, s.grade from emp e, dept d, salgrade s where e.deptno=d.deptno and e.sal between s.losal and s.hisal;

-- 27. Smith���� �ʰ� �Ի��� ����� �̸� �� �Ի����� ���
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE>(SELECT HIREDATE
FROM EMP
WHERE ENAME='SMITH');
--- END 2023.07.14 ---

-- 28 Smith���� �ʰ� �Ի��� ����� �̸� �� �Ի����� ����϶�.
select ename, hiredate from emp where hiredate > (select hiredate from emp where ename='SMITH');

-- 29. �ڽ��� �����ں��� ���� �Ի��� ��� ����� �̸�, �Ի���, �������� �̸�, �������� �Ի����� ����ϵ� ���� �÷����� Employee,EmpHiredate, Manager,MgrHiredate�� ǥ���Ͽ� ���
select E.ename as "Employee", E.hiredate as "EmpHiredate", M.ename as "Manager", M.hiredate as "MgrHiredate"
from emp E, emp M
where E.mgr=M.empno and E.hiredate < M.hiredate;

--- END 2023.07.17 ---

-- 30. ��� ����� �޿� �ְ��,������,�Ѿ� �� ��վ��� ����ϵ� �� �÷����� Maximum, Minimum, Sum, Average�� �����Ͽ� ���
SELECT max(sal) as "Maximum", min(sal) as "Minimum",
sum(sal) as "Sum", avg(sal) as "Average"
from emp;
 
-- 31. �� �������� �޿� ������.�ְ��,�Ѿ� �� ��վ��� ���
select job, max(sal), min(sal), sum(sal), avg(sal) -- ���� ���ϰ�� ���� ����� �� �ִ�.
from emp
group by job;
 
-- 32. ������ ������ ��� ���� ������ ���� ���
select job, count(job)
from emp
group by job;
 
-- 33. �������� ���� ����ϵ�, ������ ��ȣ�� �ߺ����� �ʰ��϶�. �׸���, �÷����� Number of Manager�� �����Ͽ� ���
select count(distinct(MGR)) as "Number of Manager" from emp;
 
-- 34. �ְ� �޿��� ���� �޿��� ������ ���
SELECT max(sal)-min(sal) from emp;
 
-- 35. ������ ��ȣ �� �ش� �����ڿ� ���� ������� ���� �޿��� ��� (��, �����ڰ� ���� ��� �� ���� �޿��� 1000 �̸��� �׷��� ����. �޿� ���� ��������)
select MGR, min(sal)
from emp
where MGR is not null
group by MGR
having min(sal) >= 1000
group by min(sal);
 
-- 36. �μ����� �μ��̸�, �μ���ġ, ��� �� �� ��� �޿��� ���0 �׸��� ������ �÷����� �μ���,��ġ,����� ��,��ձ޿��� ǥ��
SELECT E.DEPTNO AS "�μ���", D.DNAME AS "�μ��̸�", D.LOC AS "��ġ",
COUNT(E.EMPNO) AS "����� ��", AVG(E.SAL) AS "��ձ޿�"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME, D.LOC
 
-- 37. Smith�� ������ �μ��� ���� ��� ����� �̸� �� �Ի����� ��� ��, Smith�� ����
SELECT ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD')
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
FROM EMP
WHERE ENAME='SMITH')
AND ENAME!='SMITH'
 
-- 38. �ڽ��� �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ, �̸�, �޿��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �޿��� �������� ����� ������������ ����
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT AVG(SAL)
FROM EMP)
ORDER BY SAL DESC
 
-- 39. �̸��� T�� ���� ����� ���� �μ����� �ٹ��ϴ� ��� ����� �����ȣ �� �̸��� ���
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
FROM EMP
WHERE ENAME LIKE '%T%')
 
-- 40. �μ���ġ�� Dallas�� ��� ����� �̸�,�μ���ȣ �� ������ ���
SELECT E.ENAME, E.DEPTNO, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND D.LOC='DALLAS'
 
-- 41. KING���� �����ϴ� ��� ����� �̸��� �޿��� ���
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
FROM EMP
WHERE ENAME='KING')
 
-- 42. Sales �μ��� ��� ����� ���� �μ���ȣ, �̸� �� ������ ���
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND D.DNAME='SALES'
 
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E inner join DEPT D on E.DEPTNO=D.DEPTNO
where D.DNAME='SALES'
 
--43> �ڽ��� �޿��� ��� �޿����� ���� �̸��� T�� ���� �����
������ �μ��� �ٹ��ϴ� ��� ����� ��� ��ȣ, �̸� �� �޿��� ����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
FROM EMP)
AND DEPTNO IN(SELECT DEPTNO
FROM EMP
WHERE ENAME LIKE '%T%')
 
--44> Ŀ�̼��� �޴� ����� �޿��� ��ġ�ϴ� ����� �̸�,�μ���ȣ,�޿��� ����϶�.
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL IN(SELECT SAL
FROM EMP
WHERE COMM IS NOT NULL)
 
--45> Dallas���� �ٹ��ϴ� ����� ������ ��ġ�ϴ� ����� �̸�,�μ��̸�, �� �޿��� ����Ͻÿ�
SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.JOB IN(SELECT E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND D.LOC='DALLAS')
 
--46> Scott�� ������ �޿� �� Ŀ�̼��� �޴� ��� ����� �̸�, �Ի��� �� �޿��� ����Ͻÿ�
SELECT ENAME, HIREDATE, SAL
FROM EMP
WHERE SAL=(SELECT SAL
FROM EMP
WHERE ENAME='SCOTT')
AND NVL(COMM,0)=(SELECT NVL(COMM,0)
FROM EMP
WHERE ENAME='SCOTT')
 
--47> ������ Clerk �� ����麸�� �� ���� �޿��� �޴� ����� �����ȣ, �̸�, �޿��� ����ϵ�,
����� �޿��� ���� ������ �����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>ALL(SELECT SAL
FROM EMP
WHERE JOB='CLERK') --�ᱹ �ִ밪�� �� any �ּҰ��� ��
ORDER BY SAL DESC
 
--48> �̸��� A�� ���� ����� ���� ������ ���� ����� �̸��� ����, �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE JOB IN(SELECT JOB
FROM EMP
WHERE ENAME LIKE '%A%')
 
--49> New York ���� �ٹ��ϴ� ����� �޿� �� Ŀ�̼��� ���� ����� ����̸��� �μ����� ����϶�.
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
 
--50> Dallas���� �ٹ��ϴ� ����� ���� �� �����ڰ� ���� ����� �����ȣ,����̸�,
����,����,�μ���,Ŀ�̼��� ����ϵ� Ŀ�̼��� å������ ���� ����� NoCommission���� ǥ���ϰ�,
Ŀ�̼��� �÷����� Comm���� ������ ����Ͻÿ�. (��, �ְ���޺��� ��µǰ� �Ͻÿ�)
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
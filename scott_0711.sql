-- DB ���� 3�� : 2023-07-11

-- ���� : �μ��� �ִ밪�� �ּ谪�� ���ϵ�, �ִ� �޿��� 2900 �̻��� �μ��� ����ϴ� ������
select deptno, max(sal), min(sal) from emp GROUP BY deptno having max(sal) >= 2900;


-- 10. ������ �ʿ伺 JOIN
-- ���� ���̺� ����� �ִ� ���� �߿��� ����ڰ� �ʿ��� ������ �����ͼ� ������ ���̺�ó�� ���� ����� �����ش�.
-- JOIN�� �⺻������ ī���̼� ��
-- ī���̼� �� = ���� (*)
select * from emp, dept;

-- ��� ������ ����� ��, �� ����� �Ҽӵ� �μ��� �� ������ ����ϱ� ���� �� ���� ���̺��� �����ϴ� ������
select * from emp, dept where emp.deptno = dept.deptno;
/*
1. ���� JOIN�� ��Ű�� select * from emp, dept
2. ������ �Է½�Ű�� select * from emp, dept where emp.deptno
3. ���� ���Ǹ� ��� select * from emp, dept where emp.deptno = dept.deptno;
*/

-- SMITH�� ����� �μ����� ����� ���� ������
select ename, dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';
select ename, dname from emp e, dept d where e.deptno = d.deptno and emp.ename = 'SMITH';
/*
��(.)�� ���̴� ����
emp�� demp ��� deptno�� ������ �ֱ� ������ .deptno�� ������ �ܴ�

emp e ���̺� ��Ī�� �޾� �� �� �ִ�
�׷��� �ڿ� ���ǿ� e.deptno ó�� ��Ī���� ����� ����������.
*/

-- EQUI JOIN
-- �� ���̺��� ���������� �����ϴ� �÷��� ���� ��ġ�Ǵ� ���� �����Ͽ� ����� �����ϴ� ���� ���
-- ���� > Date Modeler > ����Ʈ > ������ ��ǳʸ�

-- NON-EQUI JOIN(�� ����)
-- ���� �÷��� ���� �ٸ� ������ ����Ͽ� ����
-- 
select * from salgrade;
-- �� ����� �޿��� �� ������� ���캸�� ������
select ename, sal, grade from emp, salgrade;
/*
1. �켱 ��� �� �̾� ����
select * from emp, salgrade; (60��)
2. ���� �־��ֱ�
select * from emp, salgarade order by ename; 
3. ������ �༭ ������ ����
select * from emp, salgrade where sal >= losal and sal <= hisal order by ename;
select * from emp, salgrade where sal between losal and hisal order by ename;
*/
select * from emp, salgrade where sal between losal and hisal order by ename;
-- �� ������� �μ��� �߰��Ͽ� ���
select * from emp, salgrade, dept where sal between losal and hisal and emp.deptno = dept.deptno order by ename;
-- �ش� ����� �Ŵ����� �����ΰ�
select e.ename, m.ename from emp e, emp m where e.mgr = m.empno order by e.ename;
select e.ename || '�� �Ŵ����� ' || m.ename || '�Դϴ�' from emp e, emp m where e.mgr = m.empno order by e.ename;

-------- ANCI JOIN --------
-- emp�� dept ���̺��� deptnoĮ������
select * from emp, dept where emp.deptno = dept.deptno;

-- emp�� dept ���̺��� INNER JOIN, ������ ������ �ִٸ� ���� �������� JOIN
select * from emp INNER JOIN dept on emp.deptno = dept.deptno;

-- (1) OUTER JOIN
-- LEFT OUTER JOIN
select * from dept left outer join emp on emp.deptno = dept.deptno;
select * from emp left outer join dept on emp.deptno = dept.deptno;

-- ����Ŭ���� OUTER JOIN
-- select * from dept left outer join emp on emp.deptno = dept.deptno;
select * from dept, emp where emp.deptno = dept.deptno;
/* �� ���ǰ� ���� ������ ���ؼ��� ���̺���� �����ϰ� ���;��Ѵ� */
select * from dept, emp where emp.deptno(+) = dept.deptno;
/*
(+) �ǹ� : ������ 12���� �������� +�� �ϰ� �Ǹ� emp�ʿ� �� ���� �־��.
�׷��� null ������ ���� �߰��ȴ�.

13 - 40	OPERATIONS	BOSTON	(null)  (null)  (null)  (null  (null)  (null)  (null)  (null)
*/

-- RIGHT OUTER JOIN
select * from emp right outer join dept on emp.deptno = dept.deptno;
-- right join�� �� ������� �ʴ´�
select * from dept left outer join emp on emp.deptno = dept.deptno; /* �� ���� JOIN�̴� */

---------- ���Ͽ� ----------
-- ���Ͽ� = ������
select job, deptno from emp where sal >= 3000
UNION all /* �ߺ��Ǵ°� ������ �ʴ´� */
select job, deptno from emp where deptno = 10;

-- select job, deptno
-- from (select job, deptno from emp where sal >= 3000) a, (select job, deptno from emp where deptno = 10) b;


---------- �������� ----------
select deptno from emp where ename = 'SMITH';
select dname from dept where deptno = 20;

-- join ���
select dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';
-- ��������
-- �ϳ��� select ���� ���� ���Ե� �� �ϳ��� select ������ �ִ� ������
-- �� �������� �����ʿ� ����ؾ� �ϰ�, �ݵ�� ��ȣ �ȿ� �־�� �Ѵ�
select dname from dept where deptno = (select deptno from emp where ename = 'SMITH');

-- ������� ��� �޿����� �� ���� �޿��� �޴� ����� �˻��ϴ� ������
select * from emp where sal >= (select avg(sal) from emp);

-- SMITH�� �޿��� �����ϰų� �޿��� �� ���� �޴� ����� �޿��� ����ϴ� ������
select ename, sal from emp where sal >= (select sal from emp where ename = 'SMITH');
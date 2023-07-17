-- DB ���� 1�� : 2023-07-07

select * from dept;
 /* select * from emp; emp ���̺� */
select empno, ename from emp; /* emp ���� empNo�� eName �� ���� �˻��ϰ� �ʹ�.*/
select ename from emp;
select * from emp where sal > 3000; /* emp ���� where(����) sal�� 3000 �̻��� ���Ǹ� �˻�*/
select * from emp where ename = 'SMITH'; /* where(����) �̸��� smith�� ��� */
select * from emp where DEPTNO = 20; /* �μ���ȣ�� 20�� ��� */
select * from emp where sal < 3000; /* �������� 3000 ���� */
select * from emp where sal != 3000; /* �������� 3000 �� �ƴ� ���. */
-- ���ǿ� �ƴ� ��� !=, <>, ^= �� ���� �̴�.

select empno, ename, sal from emp where ename = 'SMITH';

select * from emp where job = 'PRESIDENT'; /* job �� ��������Ʈ�� ���*/
select * from emp where HIREDATE > '1982-01-01'; /* 1982�� 1�� 1�� ���� �Ի��� ���*/
-- ��¥ Ÿ���� String ���� ������Ѵ�.

select * from emp where deptno = 10 and job = 'MANAGER'; /* deptno 10�� �μ��̰�, job manager �� ���*/
-- ������ �ΰ� �̻��� ���, and ���

select * from emp where deptno = 10 or job = 'MANAGER';
select * from emp where not deptno = 10; /* deptno 10�� �μ��� �ƴ� ���*/

/* �޿��� 2000 ~ 3000 ������ ���*/
select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;
-- ���� ������ ���� between A and B ���

/* �޿��� 2000�̸� ~ 3000�ʰ� ������ ���*/
select * from emp where sal < 2000 or sal > 3000;
select * from emp where sal not between 2000 and 3000;

/* 1982�⿡ �Ի��� ���*/
select * from emp where hiredate between '1982-01-01' and '1982-12-31';
-- ��¥ ǥ���� ������ ������(/), ��(.), ������(-) �� �ִ�.

/* Ŀ�̼�(comm)�� 300 Ȥ�� 500 Ȥ�� 1400�� ���*/
select * from emp where COMM = 300 or comm = 500 or comm = 1400;
select * from emp where COMM in(300, 500, 1400);
-- in ���� : in(A,B,C,...) �� �߿� �´°�
select * from emp where COMM not in(300, 500, 1400); /* 300 Ȥ�� 500 Ȥ�� 1400�� �ƴ� ��� */





-- �÷����� ��ҹ��� �� ����. ex) emp, job, ename
-- �����͸��� ��ҹ��� ������. ex) SMITH, PRESIDENT
-- ������ �� �� �̿�Ǵ� ��� !=  <>  ^=  not [������ (������ �� not ���̱�)]

----------------------------------------------------------------------------------------------

-- �̸��� F�� �����ϴ� ��� ã�� ������
-- ���ϵ� ī�� *
-- �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ���̵� ī��� �Բ� ����� �� �ִ�.
select * from emp where ename like 'F%';

-- ��ġ ��� ���� �̸� �߿� A�� ����ִ� ����� ã�� ������
select * from emp where ename like '%A%'; /* A�� ��� ���� ��ġ�ص� �������*/

-- �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ���̵� ī��� �Բ� ����� �� �ִ�.
select * from emp where ename like '%N';

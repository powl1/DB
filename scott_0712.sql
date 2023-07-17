-- DB ���� 4�� : 2023-07-12

-- ������ ��������
-- ������ �����ڿ� �԰� ���
-- ������ 3000 �̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ������ ����ϴ� ������
select ename, sal, deptno
from emp
where deptno = (select distinct deptno from emp where sal >= 3000); /* ���� �߻�*/

select ename, sal, deptno
from emp
where deptno in (select distinct deptno from emp where sal >= 3000); /*  */

-- �μ� ��ȣ�� 30���� ������� �޿� �� ���� ���� ��(800)���� ���� �޿��� �޴� ����� �̸�,�޿��� �ⷰ�ϴ� ������
select ename, sal, deptno
from emp
where deptno in (select distinct deptno from emp where deptno = 30 and sal > 800);
/*
1. ó���� ������ �� �̾� ����
select * from emp;

2. ���� �μ� ��ȣ 30 �� �־��ش�.
select * from emp where deptno = 30;

3. ���� ���� �޿����� ���� �޿�(����)�� �߰��Ͽ� �������� ���� �ϼ� ��Ų��.
select * from emp whre deptno = 30 and sal > (select min(sal) from emp);
*/
select ename, sal from emp where sal > any(select sal from emp where depton = 30);

-- ANY
-- ������ �����ϴ� ���� �ϳ��� ������ ����� ����
select ename, sal from emp where sal > any(1650, 1250);
-- ANY ����
select * from emp where sal = any(1000, 2000, 3000); /* any(1000, 2000, 3000) : ( )��ȣ �ȿ� �� �� ��� ���̶� ����. */
select * from emp where sal in any(1000, 2000, 3000); /* �ε�ȣ = �� ���� in �� �����ϴ� */

select * from emp where sal > any(1000, 2000, 3000); /* > any() : ��ȣ �ȿ� �� �߿� �ϳ��� �ɸ��� �� �̻� = �ּҰ� �̻� ��� || �ǹ� : min(1000)*/
select * from emp where sal >= any(1000, 2000, 3000); /* >= any() : ��ȣ �ȿ� �� �߿� �ϳ��� �ɸ��� �� �̻� = �ּҰ� �̻� ��� || �ǹ� : =1000*/
select * from emp where sal < any(1000, 2000, 3000) order by sal; /* > any() : ��ȣ �ȿ� �� �߿� �ϳ��� �ɸ��� �� �̻� = �ּҰ� �̻� ��� || �ǹ� : max(3000)*/

-- ALL
-- ALL ���� ���� _ (��� ���� �����ؾ� ��)
-- 30�� �Ҽ� ����� �߿��� �޿��� ���� ���̹޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ����ϴ� ������
select ename, sal, deptno from emp where sal > (select max(sal) from emp where deptno = 30);

-- ALL ���� - ������ �����ϴ� ���� �ϳ��� ������ ����� ����
-- ALL�� AND�� �������� ��� ���� �����ؾ��Ѵ�
select * from emp where sal = all(1000,2000,3000); /* select * from emp where sal = 1000 and sal = 2000 and sal = 3000; �� �����ϴ� || ��°� ���� */
select * from emp where sal > all(1000,2000,3000); /* select * from emp where sal > 1000 and sal > 2000 and sal > 3000; �� ���� || sal > 3000 �� ��� */
select * from emp where sal >= all(1000,2000,3000); /* select * from emp where sal >= 1000 and sal >= 2000 and sal >= 3000; �� ���� || sal >= 3000 �� ��� */
select * from emp where sal < all(1000,2000,3000); /* select * from emp where sal < 1000 and sal < 2000 and sal < 3000; �� ���� || sal < 1000 �� ��� */


----- SQL 50���� Ǯ��.sql ���� Ȯ�� -----


----- DDL, DML, DCL -----
-- DDL
-- ���̺� ������ �����ϴ� CREATE TABLE
create table EMP01 (
    empno number(4),
    enmae varchar2(20),
    sal number(7, 2)
);

desc emp01;

create table emp02 as select * from emp; /* ������ �˱� : ���� */
desc emp02;
select * from emp02;

create table emp03 as select empno, ename from emp; /* emp03�� ENAME, EMPNO �÷��� EMP���� �ҷ��� ����*/
select * from emp03;

-- ���̺� ������ �����ϴ� ALTER TABLE
-- ���� ���̺��� ������ �����ϱ� ���� DDL��ɹ�
-- ���̺� ���� ���� ������ �÷��� �߰�, ����, ������ ���
alter table emp01 add (job varchar2(9)); /* JOB �̶�� �÷� �߰� */
desc emp01;

alter table emp01 modify (job varchar2(30)); /* JOB �̶�� �÷� ���� */
desc emp01;
/* alter modify ������ : �ش� �ڷᰡ ���� ��� - �÷��� ������Ÿ�԰� ũ�⸦ ���� ���� || �ش� �ڷᰡ �ִ� ��� - �÷� ������ ���� X, ũ�� ���� ���� ������ ���̱� �ȵ� */

alter table emp01 drop column job; /* JOB �̶�� �÷� ���� */
desc emp01;

-- DROP TABLE
-- �ѹ� ������ ���̺��� �ٽ� �����ϱ� ����� ������ �����ϱ� �ٶ�
-- �����ؼ� ����ؾ������� �������� ��� X
drop table emp01; /* EMP01 ���̺� ���� */

-- ���̺� ������ ���Ἲ ���� ����
-- �����ϰ��� �ϴ� ���̺��� �⺻ Ű�� ���� Ű�� �ٸ� ���̺��� �����ؼ� ����ϴ� ��쿡�� �ش� ���̺��� ���� �� �� ����.
-- �̷��� ��쿡�� �����ϴ� ���̺���� ���� ������ �Ŀ� �ش� ���̺��� �����ؾ� �Ѵ�
-- ��� : �ٸ� ���̺��� �����ϴ� ���̺��� ���� X, �������� �ٸ����̺� ���� �� �� ���̺� ���� ����

-- ���̺��� ��� �ο츦 �����ϴ� TRUNCATE TABLE
-- DROP TABLE���� �������� TRUNCATE ���븸 ���� ���� ����
TRUNCATE table emp02; /* ������ ���� �ְ� ���븸 ���� */
select * from emp02;

-- ���̺�� ����
rename emp02 to test;
desc emp02; /* ���� : ORA-04043: emp02 ��ü�� �������� �ʽ��ϴ�. */
desc test;

rename test to emp02;

/*
DELETE : ���� O, Ʋ O = �뷮 O, ���� X [���� �� �ѹ� O : �ð� ���� 48h]
TRUNCATE : ���� O ,Ʋ X = �뷮 X, ���� X [���� �� �ѹ� X]
DROP : ���� X, Ʋ X = �뷮 X, ���� X [���� �� �ѹ� X]

DELETE < TRUNCATE < DROP
*/

-- 
desc user_tables;
-- ���� ������ �����(SCOTT)�� ������ ���̺��� �̸��� �˷��ִ� TABLE_ NAME �÷��� ������ Ȯ��
select * from user_tables;

desc all_tables;
select * from all_tables;

-- DML
-- ���̺��� ������ �߰�, ����, �����ϴ� DML
-- CRUD
-- �ǽ��� ���� dept ���̺��� dept02���̺�� ������ ������ �� �����͸� �߰��� �� �����͸� ��ȸ�ϴ� ������
create table dept02 as select * from dept;

select * from dept02;
truncate table dept02;
-- inset EX
insert into dept02(deptno, dname, loc) values (10, 'ACCOUNTING', 'NEWYORK'); /* 1 �� ��(��) ���ԵǾ����ϴ�.*/
insert into dept02(deptno, dname, loc) values (20, 'ACCOUNTING', 'NEWYORK'); /* 1 �� ��(��) ���ԵǾ����ϴ�.*/
/*
desc dept02; �� ��µǴ� �� ������� �ۼ��ؾ��Ѵ�. 
insert into dept02 values (20, 'ACCOUNTING', 'NEWYORK');
dept02(deptno, dname, loc) = (20, 'ACCOUNTING', 'NEWYORK')
*/

CREATE TABLE dept03 as select * from dept where 1=0;
/* dept ���̺��� �����Ͽ� dept03�� �����Ϸ��µ� where 1=0 ������ false �̱� ������ Ʋ�� �����ȴ�. */
select * from dept03;

drop table emp01;
CREATE TABLE emp01 as select * from emp;
desc emp01;
-- ��� ����� �μ� ��ȣ�� 30������ ���� �� Ȯ���ϴ� ������
update emp01 set deptno=30;
-- ����� �޿��� 10% �λ��Ű�� update ���� ����� ������
update emp01 set sal  = sal * 1.1;
-- ��� �Ի����� ���÷� �����ϴ� ������
update emp01 set hiredate = sysdate;
-- �μ� ��ȣ�� 10���� ����� �μ� ��ȣ�� 40������ ����
update emp01 set deptno = 40 where deptno = 10;
-- job �÷����� manager�� ���, �޿��� 10% �λ��ϴ� ������
update emp01 set sal = sal * 1.1 where job = 'MANAGER';
-- 1982�⿡ �Ի��� ����� �Ի����� ���÷� �����ϴ� ������
update emp01 set hiredate = sysdate where hiredate between '1982-01-01' and '1982-12-31';
update emp01 set hiredate = sysdate where substr(hiredate, 1, 2) = '82'; /* ���� ���� */
-- SMITH ����� �μ���ȣ�� 20������, job �÷��� manager�� �ѹ��� �����ϴ� ������
update emp01 set deptno = 20, job = 'MANAGER' where ename = 'SMITH';
-- smith ����� �Ի����� ���÷�, �޿��� 50, Ŀ�̼��� 4000���� �����ϴ� ������
update emp01 set hiredate = sysdate, sal = 50, comm = 4000 where ename = 'SMITH';

select * from emp01;


DROP TABLE DEPT01;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;

-- 20�� �μ��� �������� 40�� �μ��� ���������� �����ϱ� ���ؼ� ���� �������� ����ϴ� ������
update dept01 set loc = (select loc from dept01 where deptno = 40) where deptno = 20;


commit; /* ���� ���� = H/D ���� || Ŀ�ԿϷ�. */


-- DELETE ��ɹ�
-- dept01 �μ� ���̺��� ��� �����͸� �����ϴ� ������
delete from dept01;
-- 30�� �μ��� ������ �� �μ� ���̺��� Ȯ���ϴ� ������
delete from dept01 where deptno = 30;
select * from dept01;
-- ���� ���������� �μ����� sales�� �μ��� ��ȣ���� �˾Ƴ� �� sales �μ� �Ҽ��� ����� ����
delete from emp01 where deptno = (select deptno from dept where dname = 'SALES');
select * from emp01;


----- Ʈ������ ���� -----
-- �Ϸ��� �۾� ����
-- ������ ó���ǰų� ALL-OR-NOTHING
delete from dept01;
rollback;
-- commit�� �����Ͽ� �������� �����Ƿ� rollback �� �ص� Ư�� �ο츦 �����ϱ� ������ ���� ���·� �ǵ��� �� ����. 
-- rollback�� ������ commit ��������

-- �ڵ� commit
-- DDL ������ �ڵ����� commit�� �����ϱ� ������ rollback�� �ȵ�
CREATE, ALTER, DROP, RENAME, TRUNCATE
-- DELETE�� �ѹ��� �Ǵ� ������ - DML - insert, delete, update, selete

-- ������ ���Ἲ(����)�� ���� ���� ����
-- ���Ἲ(����) = ��Ȯ��
-- 1. not null
DROP TABLE EMP02;

CREATE TABLE EMP02(
    EMPNO NUMBER(4) NOT NULL, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

desc emp02;
INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, 'ȫ�浿','SALESMAN', 20);
INSERT INTO EMP02 (EMPNO, ENAME) VALUES (1, 'ȫ�浿');

select * from emp02;

drop table emp03;
CREATE TABLE EMP03(
    EMPNO NUMBER(4) NOT NULL, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, 'ȫ�浿', null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (2, 'ȫ�浿', null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (null, 'ȫ�浿', null, null);

select * from emp03;

CREATE TABLE EMP05(
    EMPNO NUMBER(4) constraint emp05_epmno_pk primary key, 
    ENAME VARCHAR2(10) constraint emp05_enamennn NOT NULL, 
    JOB VARCHAR2(9), DEPTNO NUMBER(2)
);
select * from emp05;
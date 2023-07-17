-- DB ���� 2�� : 2023-07-10

-- �̸��� F�� �����ϴ� ��� ã�� ������
-- ���ϵ� ī�� *
-- �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ���̵� ī��� �Բ� ����� �� �ִ�.
select * from emp where ename like 'F%';

-- ��ġ ��� ���� �̸� �߿� A�� ����ִ� ����� ã�� ������
select * from emp where ename like '%A%'; /* A�� ��� ���� ��ġ�ص� �������*/

-- �̸��� N���� ������ ��� ã�� ������
select * from emp where ename like '%N';

-- �����(_)�� �� �� ���ڿ� ���ؼ��� ���ϵ� ī�� ������ �Ѵ�.
-- ��) �̸��� �� ��° ���ڰ� A�� ����� ã�� ������
select * from emp where ename like '_A%';

-- �̸��� �� ��° ���ڰ� A�� ����� ã�� ������
select * from emp where ename like '__A%';

-- �̸��� A�� �������� �ʴ� ����� �˻��ϴ� ������
-- NOT�� ��ġ�� ������������ like �տ� �´�.
-- ~���� �ʴ´�. ������ ������ not ����� �����غ����Ѵ�.
select * from emp where ename not like '%A%';


-- NULL�� ���� ������

-- Ŀ�̼��� ���� ���ϴ� ����� �˻��ϴ� ������
select * from emp where comm = null;

-- IS NULL / IS NOT NULL
select * from emp where comm is not null;


-- ������ ���� order by��
-- �������� asc / �������� desc

-- ������� �޿��� ������������ �����ϴ� ������
select * from emp order by sal asc; /* �������� */
select * from emp order by sal desc; /* �������� */

-- ���� �ֱٿ� �Ի��� ������� ����ϴ� ������
select * from emp order by hiredate desc;

-- �̸��� ������ ����ϴ� ������
select * from emp order by ename asc;

-- ������ 3000 �̻��� ����� �̸� ������ ���
select * from emp where sal >= 3000 order by ename asc;
-- ����(order by)�� ������ �� �ڿ� �ۼ�


-- DISTINCT
-- distinct : ��ɾ� ����ϸ� �ߺ� ���ŵǾ� ��µȴ�.
-- ������� �ҼӵǾ� �ִ� �μ��� ��ȣ�� ����ϴ� ��¹�
select distinct deptno from emp; /* distinct : �ߺ� ���� */


-- col ����
select sal * 12 from emp;

-- as (��Ī)
select sal * 12 as ������ from emp;

-- ������ (||)
select ename || ' is a ' || job "�������� ��" from emp; /* ������(||) �� String �÷���(+) ������ �Ѵ�. */
-- select ename || ' is a ' || job [as] "�������� ��" from emp; as�� ������ ����������, �������� ���� as�� �־�����Ѵ�.
-- Ȧ����ǥ(') : 
-- �ֵ���ǥ(") : 

/*
�÷��� ������ �����ϴ�.
�÷��� ������ �ϰ� �Ǹ� �ش� �÷��� �ش�Ǵ� �����͸� ���� �����Ѵ�.
sal (����) X 12 = ����

������(as) : ��Ī�� �ش�. �� �ٸ� �̸��� ��
������(||) : �÷����� ���ڿ��� �߰�

*/


-- ���̺� ������ Ÿ�� Ȯ��
desc emp;
desc dept;

-- ��� ������ ����� �� �ٷ� ��� ���ؼ� ����Ŭ���� �����ϴ� ���̺��̴�.
-- ����
-- 24 *26
-- �� ������ ����� ����ϱ� ���� ���̺��̴�.
-- ��� �����̳� ���� �÷� ���� ���� �ѹ��� ����ϰ� ���� �� ���� ����Ѵ�.

select 24 *26 from dual; /* 24 * 26(��) 624(��) */ 
select sysdate from dual; /* sysdate(��) 23/07/10(��) */
-- ����Ŭ���� ����ϴ� ���� �Լ��� (������, ������, ��¥��)


-- �����Լ�
-- -10�� ���� ���밪�� ���ϴ� ������
SELECT abs(-10) from dual; /* 10 */

-- ������ �Ʒ��� ������ �Լ�
select 34.5432, floor(34.5432) from dual; /* 34.5432 34*/

-- Ư�� �ڸ������� 34.5432�� �ݿø��ϴ� ������
-- ROUND(�Ҽ���, �ݿø� ��ġ)
select 34.5432, round(34.5432, 2) from dual; /* 34.5432 34.54*/
select 34.5632, round(34.5632, 1) from dual; /* 34.5632 34.6 */
select 34.5632, round(34.5632, 0) from dual; /* 34.5632 35 */

-- ������ ������ �� �� �������� ��� = �ڹ� ������ % �� ����
select mod(27, 5), mod(27, 5), mod(27, 7) from dual; /* 2 2 6 */


-- ���ڿ�ó��
-- upper(�빮��) / lower(�ҹ���)
select 'oracle', upper('oracle') from dual; /* ORACLE */
select lower('ORDER') from dual; /* order */

-- emp���� ename�� �ҹ��ڷ� �̾Ƴ��ÿ�
select lower(ename) from emp;

-- �̴ϼȸ� �빮�ڷ� ��ȯ
select INITCAP('oracle') from dual; /* Oracle*/

-- 
select initcap(ename) from emp;

-- ���� ���̸� ���ϴ� �Լ�
select length(ename), ename from emp; /* 5 SMITH */

-- SUBSTR(������ġ, ����) ���� ��ġ���� ���� ������ŭ�� ���ڸ� �����Ѵ�.
-- smith
select substr('oracle', 0, 1) from dual;
select substr(ename, 0 , 1) from emp; /* S : emp ���̺��� �̸����� ù��° ���ڸ� ��� */

-- ����Ŭ���� �ε����� 0�� �ƴ� 1���� �����Ѵ�.

-- emp���� �̸�, �Ի�⵵, �Ի� �� ���
select ename, 19 || substr(hiredate, 0, 2) as �⵵, substr(hiredate, 4, 2) as �� from emp;
-- 9���� �Ի��� ����� ����ϴ� ������
select ename, 19 || substr(hiredate, 0, 2) as �⵵, substr(hiredate, 4, 2) as �� from emp where substr(hiredate, 4, 2) = '09';


-- ��������
select ltrim('                    ORACLE') from dual;
select rtrim('                    ORACLE') from dual;


-- ��¥ �Լ� SYSDATE
select sysdate from dual; /* 23/07/10 */
-- ���� ���
select sysdate - 1 ���� from dual; /* 23/07/09 */
-- ����
select sysdate + 1 from dual; /* 23/07/11 */
-- ���� ���� ����
select sysdate - 1 ����, sysdate ����, sysdate + 1 ���� from dual;

-- ������ MONTHS_BETWEEN, ADD_MONTHS
-- �� ��¥ ������ ������
select ename, sysdate, hiredate, floor(months_between(sysdate, hiredate)) �ٹ������� from emp;
select ename, sysdate, hiredate, round(months_between(sysdate, hiredate)) �ٹ������� from emp;
-- �Ի��� ��¥���� 4���� �߰��� ������� ��Ÿ���� ������
select ename, sysdate, add_months(hiredate, 4) �ٹ������� from emp;

-- NEXT_DAY, LAST_DAY
-- ������ �������� ���� ����� ������ �������� �������� �˾ƺ��� ������
select sysdate, next_day(sysdate, '������') from dual; /* 23/07/12 */
select sysdate, next_day(sysdate, '�ݿ���') from dual; /* 23/07/14 */
-- �Ի��� ���� ������ ���� ���ϴ� ������
select hiredate, LAST_DAY(hiredate) from emp;

-- ������ TO_CHAR
-- ���� ��¥�� ���������� ��ȣ���Ͽ� ����ϴ� ������
select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual; /* 23/07/10	2023-07-10 */
-- ������� �Ի����� ����ϵ�, ���ϱ��� �Բ� ����ϴ� ������
select sysdate, to_char(hiredate, 'YY;;MM;;DD day') as �Ի��� from emp; /* 23/07/10	80;;12;;17 ������ */
-- ���� ��¥�� �ð��� ����ϴ� ������
select sysdate, to_char(sysdate, 'YYYY/MM/DD, HH24:MI:SS') from dual; /* 23/07/10	2023/07/10, 13:08:57 */

-- �� ������ ��ȭ ��ȣ�� �տ� ���̰� õ �������� �޸��� �ٿ��� ����ϴ� ������ (��: ��1,230,000)
-- L999,999 : local 999,999 = �� �ڸ����� �޸�(,)�� ��´�.
desc emp;
select ename, sal, to_char(sal, 'L999,999') from emp; /* ��1,600*/


-- TO_DATE �Լ�
-- ������ -> DATEŸ��
-- 1981�� 2�� 20�Ͽ� �Ի��� ����� �˻��ϴ� ������
select ename, hiredate from emp where hiredate = '19810220'; /* ALLEN 81/02/20 */
select ename, hiredate from emp where hiredate = '1981.02.20';
select ename, hiredate from emp where hiredate = '1981/02/20';
select ename, hiredate from emp where hiredate = '1981-02-20';
select ename, hiredate from emp where hiredate = to_char('19810220'); /* to_char ���� �����ص� �⺻���� ���߸� ����� �ȴ�.*/
select ename, hiredate from emp where hiredate = to_date(19810220, 'YYYYMMDD');

-- ���� ��ĥ�� �������� ���� ��¥���� 2016/01/01�� �� ����� ���
select sysdate - to_date('2016/01/01', 'YYYY/MM/DD') from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;


-- NULL�� �ٸ� ������ ��ȯ�ϴ� NVL�Լ�
-- ���� ����ϴ� ������
-- nvl �Լ� = NULL ���� �����Ѵ�.
select ename, sal, sal * 12 + comm from emp;
select ename, sal, sal * 12 + nvl(comm, 0) from emp; /* */
/* nvl(comm, 0) : comm�� null ���� ������ 0���� ��ü�ؼ� ����϶�. */


-- ������ ���� DECODE �Լ� ��ɾ�
-- �������� ��쿡 ���ؼ� ������ �� �ֵ��� �ϴ� ����� �����Ѵ�. (SWITH CASE���� ���� ���)
select deptno from emp order by deptno;

select deptno, decode(deptno, 10, 'A', 20, 'B', 30, 'C') from emp order by deptno;
select ename, deptno, decode(deptno, 10, 'accounting', 20, 'research', 30, 'sales') as dname from emp order by deptno;

-- CASE �Լ�
-- case �Լ��� JAVA�� IF���̴�.
SELECT ENAME, DEPTNO, /* if ���� ����*/
    CASE WHEN DEPTNO=10 THEN 'ACCOUNTING'
         WHEN DEPTNO=20 THEN 'RESEARCH'
         WHEN DEPTNO=30 THEN 'SALES'
         WHEN DEPTNO=40 THEN 'OPERATIONS'
    END AS ENAME /* case �ȿ� ������ as ename ���� ������, as ��Ī �ʼ�*/
FROM EMP; /* if ���� ��*/

-- ����) sal 2500 �̻��̸� ��, 2500 �̸��̸� ��, �÷��� ���
select ename, sal,
    case when sal >= 2500 then '��'
         when sal < 2500 then '��'
    end as ���
from emp;


-- ����� �޿��� ����ϵ� ������ �Լ� round�� õ���� ���ϸ� �ݿø��ϴ� ������
select deptno, sal, round(sal, -3) from emp; /* �Ҽ��� ���� �������� ���� ���̳ʽ�(-) �ٿ��� ���� �� */
-- �׷� �Լ��� �̿��Ͽ� ����� �� �޿��� ���ϴ� ������
select sum(sal) as �ѱ޿� from emp ;
-- �Լ� = ������ �Լ� �� �׷� �Լ�
-- ������ �Լ� : �� �࿡ ���ؼ� �Լ�
-- ��) round
-- �׷� �Լ� : ������ �࿡ ���ؼ� 1���� ������ ��� �Ǵ� �Լ�
-- ��) sum

select *, sum(sal) from emp ; 
/* 
�� �������� �������� ����
�׷� �Լ��� ������� �ϳ��ε�, �׷� �Լ��� �������� ���� �ܼ� �÷��� �ο��� ������ 14���̱� ������ ����Ǵ� �ο��� ���� �޶� ���� ��ġ ��ų �� ���� �����̴�.
����Ǵ� �ο��� ���� �޶� ���� ��ġ ��ų �� ���� �����̴�.
so, * �� ��� ��(14)�̰�, sum�� sal�� ���� 1�� �̱� ������ ������ ����.
*/


-- ��� AVG
-- �޿� ��� ���ϱ�
select avg(sal) from emp;

-- MAX �ִ밪, MIN �ּҰ�
select max(sal), min(sal) from emp;

-- COUNT ���� ���ϱ�
-- �� ����� ���ϱ�
select count(*) from emp;

-- ���� : �ߺ� ���Ÿ� �ݿ��Ͽ� �������� ������ ���ϴ� ������
select COUNT(DISTINCT job) as ������ from emp;


-- GROUP BY ��
-- Ư�� �÷��� �������� �׷�ȭ
-- ���̺� �����ϴ� ����� �׷캰�� �����ϱ� ���� ���
-- ���� : ��� ���̺��� �μ� ��ȣ�� �׷� ���� ������
select deptno from emp group by deptno; /* �ߺ��� ���� �Ǹ鼭 Ư�� �÷��� �������� �׷�� */


-- �Ҽ� �μ��� ��� �޿��� ���ϴ� ������
select deptno, avg(sal) from emp group by deptno;

/* ������ Ǯ�� 
1. �÷��� GROUP BY �� �÷� ���� �� �� �ִ�.
2. ���� �Լ��� �� �� �ִ�. ���� �Լ��� �� �� �� ����.
*/
select deptno, avg(sal) from emp group by deptno;


-- ���� : �Ҽ� �μ��� �ִ� �޿��� �ּ� �޿��� ���ϴ� ������
select deptno, max(sal), min(sal) from emp group by deptno;

-- ���� : �μ��� ����� ��
select deptno, count(*) from emp group by deptno;

-- ���� : �׷� ������ �μ��� ��� �޿��� 2000 �̻��� �μ��� ��ȣ�� �μ��� ��� �޿��� ����ϴ� ������
select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000;
/* GROUP BY���� WHERE �� ������ �ʰ�, HAVING ���� ������ ����Ѵ�. */

desc emp;
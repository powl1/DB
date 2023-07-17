-- DB 수업 4일 : 2023-07-12

-- 다중행 서브쿼리
-- 다중행 연산자와 함계 사용
-- 연봉을 3000 이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력하는 쿼리문
select ename, sal, deptno
from emp
where deptno = (select distinct deptno from emp where sal >= 3000); /* 오류 발생*/

select ename, sal, deptno
from emp
where deptno in (select distinct deptno from emp where sal >= 3000); /*  */

-- 부서 번호가 30번인 사원들의 급여 중 가장 낮은 값(800)보다 높은 급여를 받는 사원의 이름,급여를 출럭하는 쿼리문
select ename, sal, deptno
from emp
where deptno in (select distinct deptno from emp where deptno = 30 and sal > 800);
/*
1. 처음에 무조건 다 뽑아 보기
select * from emp;

2. 조건 부서 번호 30 을 넣어준다.
select * from emp where deptno = 30;

3. 가장 낮은 급여보다 높은 급여(조건)을 추가하여 쿼리문은 최종 완성 시킨다.
select * from emp whre deptno = 30 and sal > (select min(sal) from emp);
*/
select ename, sal from emp where sal > any(select sal from emp where depton = 30);

-- ANY
-- 저근을 만족하는 값이 하나라도 있으면 결과를 리턴
select ename, sal from emp where sal > any(1650, 1250);
-- ANY 연습
select * from emp where sal = any(1000, 2000, 3000); /* any(1000, 2000, 3000) : ( )괄호 안에 값 중 어느 것이라도 좋다. */
select * from emp where sal in any(1000, 2000, 3000); /* 부등호 = 일 때는 in 과 동일하다 */

select * from emp where sal > any(1000, 2000, 3000); /* > any() : 괄호 안에 값 중에 하나라도 걸리는 값 이상 = 최소값 이상 출력 || 의미 : min(1000)*/
select * from emp where sal >= any(1000, 2000, 3000); /* >= any() : 괄호 안에 값 중에 하나라도 걸리는 값 이상 = 최소값 이상 출력 || 의미 : =1000*/
select * from emp where sal < any(1000, 2000, 3000) order by sal; /* > any() : 괄호 안에 값 중에 하나라도 걸리는 값 이상 = 최소값 이상 출력 || 의미 : max(3000)*/

-- ALL
-- ALL 조건 예시 _ (모든 값을 만족해야 함)
-- 30번 소속 사원들 중에서 급여를 가장 많이받는 사원보다 더 많은 급여를 받는 사람의 이름과 급여를 출력하는 쿼리문
select ename, sal, deptno from emp where sal > (select max(sal) from emp where deptno = 30);

-- ALL 연습 - 조건을 만족하는 값이 하나라도 있으면 결과를 리턴
-- ALL은 AND의 연산으로 모든 값을 만족해야한다
select * from emp where sal = all(1000,2000,3000); /* select * from emp where sal = 1000 and sal = 2000 and sal = 3000; 과 동일하다 || 출력값 없음 */
select * from emp where sal > all(1000,2000,3000); /* select * from emp where sal > 1000 and sal > 2000 and sal > 3000; 과 동일 || sal > 3000 값 출력 */
select * from emp where sal >= all(1000,2000,3000); /* select * from emp where sal >= 1000 and sal >= 2000 and sal >= 3000; 과 동일 || sal >= 3000 값 출력 */
select * from emp where sal < all(1000,2000,3000); /* select * from emp where sal < 1000 and sal < 2000 and sal < 3000; 과 동일 || sal < 1000 값 출력 */


----- SQL 50문제 풀이.sql 파일 확인 -----


----- DDL, DML, DCL -----
-- DDL
-- 테이블 구조를 정의하는 CREATE TABLE
create table EMP01 (
    empno number(4),
    enmae varchar2(20),
    sal number(7, 2)
);

desc emp01;

create table emp02 as select * from emp; /* 팁으로 알기 : 복사 */
desc emp02;
select * from emp02;

create table emp03 as select empno, ename from emp; /* emp03는 ENAME, EMPNO 컬럼만 EMP에서 불러와 생성*/
select * from emp03;

-- 테이블 구조를 변경하는 ALTER TABLE
-- 기존 테이블의 구조를 변경하기 위한 DDL명령무
-- 테이블에 대한 구조 변경은 컬럼의 추가, 수정, 삭제시 사용
alter table emp01 add (job varchar2(9)); /* JOB 이라는 컬럼 추가 */
desc emp01;

alter table emp01 modify (job varchar2(30)); /* JOB 이라는 컬럼 수정 */
desc emp01;
/* alter modify 주의점 : 해당 자료가 없는 경우 - 컬럼의 데이터타입과 크기를 변경 가능 || 해당 자료가 있는 경우 - 컬럼 데이터 변경 X, 크기 증가 가능 하지만 줄이기 안됨 */

alter table emp01 drop column job; /* JOB 이라는 컬럼 삭제 */
desc emp01;

-- DROP TABLE
-- 한번 제거한 테이블은 다시 복구하기 힘들기 때문에 유의하기 바람
-- 주의해서 사용해야하지만 현업에서 사용 X
drop table emp01; /* EMP01 테이블 삭제 */

-- 테이블 삭제와 무결성 제약 조건
-- 삭제하고자 하는 테이블의 기본 키나 고유 키를 다른 테이블에서 참조해서 사용하는 경우에는 해당 테이블을 제거 할 수 없다.
-- 이러한 경우에는 참조하는 테이블들을 먼저 제거한 후에 해당 테이블을 삭제해야 한다
-- 결론 : 다른 테이블이 참조하는 테이블은 삭제 X, 참조중인 다른테이블 삭제 후 본 테이블 삭제 가능

-- 테이블의 모든 로우를 제거하는 TRUNCATE TABLE
-- DROP TABLE과의 차이점은 TRUNCATE 내용만 제거 구조 유지
TRUNCATE table emp02; /* 구조는 남아 있고 내용만 제거 */
select * from emp02;

-- 테이블명 변경
rename emp02 to test;
desc emp02; /* 오류 : ORA-04043: emp02 객체가 존재하지 않습니다. */
desc test;

rename test to emp02;

/*
DELETE : 구조 O, 틀 O = 용량 O, 내용 X [삭제 후 롤백 O : 시간 제한 48h]
TRUNCATE : 구조 O ,틀 X = 용량 X, 내용 X [삭제 후 롤백 X]
DROP : 구조 X, 틀 X = 용량 X, 내용 X [삭제 후 롤백 X]

DELETE < TRUNCATE < DROP
*/

-- 
desc user_tables;
-- 현재 접속한 사용자(SCOTT)가 생성한 테이블의 이름을 알려주는 TABLE_ NAME 컬럼의 내용을 확인
select * from user_tables;

desc all_tables;
select * from all_tables;

-- DML
-- 테이블의 내용을 추가, 수정, 삭제하는 DML
-- CRUD
-- 실습을 위한 dept 테이블을 dept02테이블로 구조만 복사한 후 데이터를 추가한 후 데이터를 조회하는 쿼리문
create table dept02 as select * from dept;

select * from dept02;
truncate table dept02;
-- inset EX
insert into dept02(deptno, dname, loc) values (10, 'ACCOUNTING', 'NEWYORK'); /* 1 행 이(가) 삽입되었습니다.*/
insert into dept02(deptno, dname, loc) values (20, 'ACCOUNTING', 'NEWYORK'); /* 1 행 이(가) 삽입되었습니다.*/
/*
desc dept02; 에 출력되는 값 순서대로 작성해야한다. 
insert into dept02 values (20, 'ACCOUNTING', 'NEWYORK');
dept02(deptno, dname, loc) = (20, 'ACCOUNTING', 'NEWYORK')
*/

CREATE TABLE dept03 as select * from dept where 1=0;
/* dept 테이블을 참조하여 dept03을 생성하려는데 where 1=0 조건이 false 이기 때문에 틀만 생성된다. */
select * from dept03;

drop table emp01;
CREATE TABLE emp01 as select * from emp;
desc emp01;
-- 모든 사원의 부서 번호를 30번으로 수정 후 확인하는 쿼리문
update emp01 set deptno=30;
-- 사원의 급여를 10% 인상시키는 update 문은 만드는 쿼리문
update emp01 set sal  = sal * 1.1;
-- 모든 입사일을 오늘로 수정하는 쿼리문
update emp01 set hiredate = sysdate;
-- 부서 번호가 10번인 사원의 부서 번호를 40번으로 수정
update emp01 set deptno = 40 where deptno = 10;
-- job 컬럼값이 manager인 경우, 급여를 10% 인상하는 쿼리문
update emp01 set sal = sal * 1.1 where job = 'MANAGER';
-- 1982년에 입사한 사원의 입사일을 오늘로 수정하는 쿼리문
update emp01 set hiredate = sysdate where hiredate between '1982-01-01' and '1982-12-31';
update emp01 set hiredate = sysdate where substr(hiredate, 1, 2) = '82'; /* 위와 동일 */
-- SMITH 사원의 부서번호는 20번으로, job 컬럼은 manager로 한번에 수정하는 쿼리문
update emp01 set deptno = 20, job = 'MANAGER' where ename = 'SMITH';
-- smith 사원의 입사일은 오늘로, 급여는 50, 커미션은 4000으로 수정하는 쿼리문
update emp01 set hiredate = sysdate, sal = 50, comm = 4000 where ename = 'SMITH';

select * from emp01;


DROP TABLE DEPT01;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;

-- 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서브 쿼리문을 사용하는 쿼리문
update dept01 set loc = (select loc from dept01 where deptno = 40) where deptno = 20;


commit; /* 영구 저장 = H/D 저장 || 커밋완료. */


-- DELETE 명령문
-- dept01 부서 테이블의 모든 데이터를 삭제하는 쿼리문
delete from dept01;
-- 30번 부서를 삭제한 후 부서 테이블을 확인하는 쿼리문
delete from dept01 where deptno = 30;
select * from dept01;
-- 서브 쿼리문으로 부서명이 sales인 부서의 번호부터 알아낸 뒤 sales 부서 소속의 사원을 삭제
delete from emp01 where deptno = (select deptno from dept where dname = 'SALES');
select * from emp01;


----- 트랜젝션 관리 -----
-- 일련의 작업 단위
-- 완전히 처리되거나 ALL-OR-NOTHING
delete from dept01;
rollback;
-- commit을 수행하여 영구저장 했으므로 rollback 을 해도 특정 로우를 삭제하기 이전의 이전 상태로 되돌릴 수 없다. 
-- rollback의 기준은 commit 이전까지

-- 자동 commit
-- DDL 구문은 자동으로 commit을 실행하기 때문에 rollback이 안됨
CREATE, ALTER, DROP, RENAME, TRUNCATE
-- DELETE가 롤백이 되는 이유는 - DML - insert, delete, update, selete

-- 데이터 무결성(결점)을 위한 제약 조건
-- 무결성(결점) = 정확성
-- 1. not null
DROP TABLE EMP02;

CREATE TABLE EMP02(
    EMPNO NUMBER(4) NOT NULL, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

desc emp02;
INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, '홍길동','SALESMAN', 20);
INSERT INTO EMP02 (EMPNO, ENAME) VALUES (1, '홍길동');

select * from emp02;

drop table emp03;
CREATE TABLE EMP03(
    EMPNO NUMBER(4) NOT NULL, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, '홍길동', null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (2, '홍길동', null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (null, '홍길동', null, null);

select * from emp03;

CREATE TABLE EMP05(
    EMPNO NUMBER(4) constraint emp05_epmno_pk primary key, 
    ENAME VARCHAR2(10) constraint emp05_enamennn NOT NULL, 
    JOB VARCHAR2(9), DEPTNO NUMBER(2)
);
select * from emp05;
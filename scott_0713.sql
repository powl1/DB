-- DB ���� 5�� : 2023-07-13
-- ?��?��?��?�� 무결?��
-- 4. Foreign key 
DROP TABLE EMP06;

CREATE TABLE EMP06(
    EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
    JOB VARCHAR(9),
    DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)); -- references : foreignkey 만드?�� 문법 

insert into emp06 values(7499, ' allen', 'salesman', 30); -- ?�� ?��?��
insert into emp06 values(7800, ' ?��길동', 'salesman', 30);

-- delete from dept where deptno =30; -- child record found?��류남 ! foreign key?�� ?���? 

select * from emp06; -- 결과 ?��?��

-- 5. check (좋�??�� 개발?��?��?�� ?�� ?�� ??)
create table student(
    id number(4) primary key, 
    score number(3) not null,
    constraint score_check check (score >= 0) -- ?��?��조건 
);

-- ?��?��조건 추�??��?�� 문장 
-- alter table ?��?��블명 add constraint ?��?��조건�? check(조건 ?��?�� 범위);

insert into student values (1, 100);

----- ?��???�� ----- 
drop sequence emp_seq; -- ?��???�� ?��?�� 
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000; -- ?��???��번호 1 ~ 

DROP TABLE EMP01;
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY, 
    ENAME VARCHAR(10), 
    HIREDATE DATE
);

insert into emp01 values (emp_seq.nextval, '?��길동',sysdate);
select * from emp01;

select emp_seq.currval from dual; -- currval : current values
select emp_seq.nextval from dual;

alter sequence emp_seq increment by 2;

--Database 카디?��리티.

-- DB ΌφΎχ 5ΐΟ : 2023-07-13
-- ?°?΄?°? λ¬΄κ²°?±
-- 4. Foreign key 
DROP TABLE EMP06;

CREATE TABLE EMP06(
    EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
    JOB VARCHAR(9),
    DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)); -- references : foreignkey λ§λ? λ¬Έλ² 

insert into emp06 values(7499, ' allen', 'salesman', 30); -- ? ?½?
insert into emp06 values(7800, ' ?κΈΈλ', 'salesman', 30);

-- delete from dept where deptno =30; -- child record found?€λ₯λ¨ ! foreign key? ?Ήμ§? 

select * from emp06; -- κ²°κ³Ό ??Έ

-- 5. check (μ’μ??° κ°λ°??€?΄ ? ? ??)
create table student(
    id number(4) primary key, 
    score number(3) not null,
    constraint score_check check (score >= 0) -- ? ?½μ‘°κ±΄ 
);

-- ? ?½μ‘°κ±΄ μΆκ??? λ¬Έμ₯ 
-- alter table ??΄λΈλͺ add constraint ? ?½μ‘°κ±΄λͺ? check(μ‘°κ±΄ ?? λ²μ);

insert into student values (1, 100);

----- ????€ ----- 
drop sequence emp_seq; -- ????€ ?­?  
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000; -- ?€???Έλ²νΈ 1 ~ 

DROP TABLE EMP01;
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY, 
    ENAME VARCHAR(10), 
    HIREDATE DATE
);

insert into emp01 values (emp_seq.nextval, '?κΈΈλ',sysdate);
select * from emp01;

select emp_seq.currval from dual; -- currval : current values
select emp_seq.nextval from dual;

alter sequence emp_seq increment by 2;

--Database μΉ΄λ?λ¦¬ν°.

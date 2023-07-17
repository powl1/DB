-- DB ¼ö¾÷ 5ÀÏ : 2023-07-13
-- ?°?´?„°?˜ ë¬´ê²°?„±
-- 4. Foreign key 
DROP TABLE EMP06;

CREATE TABLE EMP06(
    EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
    JOB VARCHAR(9),
    DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)); -- references : foreignkey ë§Œë“œ?Š” ë¬¸ë²• 

insert into emp06 values(7499, ' allen', 'salesman', 30); -- ?–‰ ?‚½?…
insert into emp06 values(7800, ' ?™ê¸¸ë™', 'salesman', 30);

-- delete from dept where deptno =30; -- child record found?˜¤ë¥˜ë‚¨ ! foreign key?˜ ?Š¹ì§? 

select * from emp06; -- ê²°ê³¼ ?™•?¸

-- 5. check (ì¢‹ì??° ê°œë°œ??“¤?´ ?˜ ?•ˆ ??)
create table student(
    id number(4) primary key, 
    score number(3) not null,
    constraint score_check check (score >= 0) -- ? œ?•½ì¡°ê±´ 
);

-- ? œ?•½ì¡°ê±´ ì¶”ê??•˜?Š” ë¬¸ì¥ 
-- alter table ?…Œ?´ë¸”ëª… add constraint ? œ?•½ì¡°ê±´ëª? check(ì¡°ê±´ ?˜?Š” ë²”ìœ„);

insert into student values (1, 100);

----- ?‹œ???Š¤ ----- 
drop sequence emp_seq; -- ?‹œ???Š¤ ?‚­? œ 
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000; -- ?Š¤???Š¸ë²ˆí˜¸ 1 ~ 

DROP TABLE EMP01;
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY, 
    ENAME VARCHAR(10), 
    HIREDATE DATE
);

insert into emp01 values (emp_seq.nextval, '?™ê¸¸ë™',sysdate);
select * from emp01;

select emp_seq.currval from dual; -- currval : current values
select emp_seq.nextval from dual;

alter sequence emp_seq increment by 2;

--Database ì¹´ë””?„ë¦¬í‹°.

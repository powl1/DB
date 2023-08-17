select * from mvc_board;

select * from mvc_board where bid >= 1 and bid <= 10;

-- rownum : 조회를 한 후에 순번을 매길때 사용
select rownum, a.* from emp a;

-- 
select rownum rn, m.* from mvc_board m where rownum <= 10;

select rownum rn, m.* from mvc_board m where rownum >= 10 and rownum <= 20;



begin
  for i in 1..1000 loop
   insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) values (mvc_board_seq.nextval, 'test' , '테스트', '테스트', 0, mvc_board_seq.currval, 0, 0);
  end loop;
end;

commit;
select * from mvc_board;

select * from mvc_board where bid >= 1 and bid <= 10;

-- rownum : ��ȸ�� �� �Ŀ� ������ �ű涧 ���
select rownum, a.* from emp a;

-- 
select rownum rn, m.* from mvc_board m where rownum <= 10;

select rownum rn, m.* from mvc_board m where rownum >= 10 and rownum <= 20;



begin
  for i in 1..1000 loop
   insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) values (mvc_board_seq.nextval, 'test' , '�׽�Ʈ', '�׽�Ʈ', 0, mvc_board_seq.currval, 0, 0);
  end loop;
end;

commit;
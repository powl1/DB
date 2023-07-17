-- DB ���� 7�� : 2023-07-12
-- rownum = ����Ŭ�� ����¡�� �⺻������ rownum
-- select �ؿ� ������ - �Ϸ� ��ȣ ���̱�

select rownum, emp.* from emp where rownum <= 10;

select rownum, emp.* from emp where rownum between 5 and 10;
/*
���� ����Ŭ ������ ������ ������ �Ѵ�

1. FROM/WHERE ���� ���� ó��
2. ROWNUM�� �Ҵ�ǰ� FROM/WHERE ������ ���޵Ǵ� ������ ��� �ο쿡 ���� ����
3. SELECT ����
4. GROUP BY ���� ����
5. HAVING ����
6. ORDER BY ���� ����
*/
select rownum, emp.*
from emp
where rownum between 5 and 10; rownum = -1

select * 
from (select rownum as rn, emp.* from emp)
where rn between 5 and 10;
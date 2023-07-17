-- DB 수업 7일 : 2023-07-12
-- rownum = 오라클에 페이징을 기본적으로 rownum
-- select 해온 데이터 - 일련 번호 붙이기

select rownum, emp.* from emp where rownum <= 10;

select rownum, emp.* from emp where rownum between 5 and 10;
/*
먼저 오라클 쿼리의 순서를 읽혀야 한다

1. FROM/WHERE 절이 먼저 처리
2. ROWNUM이 할당되고 FROM/WHERE 절에서 전달되는 각각의 출력 로우에 대해 증가
3. SELECT 적용
4. GROUP BY 조건 적용
5. HAVING 적동
6. ORDER BY 조건 적용
*/
select rownum, emp.*
from emp
where rownum between 5 and 10; rownum = -1

select * 
from (select rownum as rn, emp.* from emp)
where rn between 5 and 10;
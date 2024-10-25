-- ch06_db프로젝트에서 쓸 query

--ex1
SELECT * FROM EMP;
--ex2 : 입력받은 부서번호의 직원정보를 출력
SELECT * FROM DEPT; -- SELECT 태그내에 보여질 부서정보
-- 10 -> 10번 부서 직원들, ''->모든부서직원 
SELECT E.*, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO LIKE '%'||'10'
    AND E.DEPTNO=D.DEPTNO;
-- QUIZ : 사원명(일부 알파벳) 으로 직원 검색
SELECT E.*, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND ENAME 
    LIKE '%'||TRIM(UPPER(' s'))||'%'; --'%S%'




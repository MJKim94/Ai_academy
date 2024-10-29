-- 모든 GETEMPLIST
SELECT * FROM EMP;
-- QUIZ에 사용될 public ArrayList<Emp> QUERY getEmpList(Strnig schName, String schJob)
SELECT E.*
    FROM EMP
    WHERE E.DEPTNO=D.DEPTNO
    AND ENAME 
    LIKE '%'||TRIM(UPPER(' s'))||'%';

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%'||TRIM(UPPER('K'))||'%'
    AND JOB LIKE '%'||TRIM(UPPER(null))||'%';
-- [VI] Sub Query : 메인 query(SQL문) 안에 내포된 QUERY



-- SUB QUERY 단일행 사용 가능 연산자 ( =, >, >=, <, <=, <>)

SELECT ENAME, SAL
    FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');
    
-- SUB QUERY 종류 다중행 SUB QUERY : SUB QUERY 결과가 2행 이상 일때
    -- 사용가능한 복수행 연산자 (IN, NOT IN, ANY, SOME, ALL, EXISTS)
    --EX. SOCTT 이나 KING과 동일한 부서 번호에서 근무하는 사원의 정보를 출력하시오
SELECT DEPTNO, ENAME
    FROM EMP;
    
SELECT DEPTNO -- SUB QUERY (SQL 문)
    FROM EMP
    WHERE ENAME IN('SCOTT', 'KING');
    
SELECT * 
    FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME IN ('SCOTT', 'KING'));
    
    
    
    
    
    
    
    
    
    
SELECT * FROM DEPT; -- ( DEPTNO(부서번호), DNAME(부서), LOC(근무지역)
    
--★ 단일행 SUB QUERY
    --DEPT에 50번부서(DALLAS) INSERT, EMP에 50번근무 직원 INSERT
-- INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
-- INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (1000, 'HONG', 50); 
-- ROLLBACK;
    --EX. SCOTT과 동일한 근무지에서 근무하는 사원의 정보를 출력하시오

SELECT LOC
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
    AND ENAME='SCOTT'; -- SUB QUERY

SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND LOC=(SELECT LOC
                FROM DEPT D, EMP E
                WHERE D.DEPTNO = E.DEPTNO
                AND ENAME='SCOTT')
                AND ENAME <> 'SCOTT';
                
    -- EX2. 최초입사일과 최초입사한 사람의 정보
SELECT MIN(HIREDATE) 
    FROM EMP; -- SUB QUERY (단일행)
    
SELECT HIREDATE, ENAME
    FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) 
                        FROM EMP);
                        
    -- EX3 최근입사일과 최근입사한 사람의 정보
SELECT HIREDATE, ENAME                       
    FROM EMP
    WHERE HIREDATE = (SELECT MAX(HIREDATE)
                        FROM EMP);
    -- EX4. 최초입사일, 최초입사자이름, 최근입사일, 최근입사자이름
SELECT E1.HIREDATE, E1.ENAME, E2.HIREDATE, E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) 
                        FROM EMP)
                        AND E2.HIREDATE = (SELECT MAX(HIREDATE)
                                            FROM EMP);
                                            
SELECT
    (SELECT MIN(HIREDATE) FROM EMP) FIRSTDAY,
    (SELECT ENAME FROM EMP WHERE HIREDATE = 
    (SELECT MIN(HIREDATE) FROM EMP)) FIRSTMAN,
    (SELECT MAX(HIREDATE) FROM EMP) LASTDAY,
    (SELECT ENAME FROM EMP WHERE HIREDATE = 
    (SELECT MAX(HIREDATE) FROM EMP)) LASTMAN
     FROM DUAL;
 -- EX5 SCOTT과 같은 부서에 근무하는 사람들의 급여합
 
SELECT SUM(SAL)
    FROM EMP
    WHERE DEPTNO = 
    (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
-- EX6. DALLAS에 근무하는 사원의 이름과 부서번호를 출력하시오
SELECT ENAME, DEPTNO
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS'); -- SUB QUERY
    
SELECT ENAME, E.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND LOC='DALLAS'; --JOIN
    
--EX7. 'KING'이 직송상사인 사원의 이름과 급여를 출력하시오
SELECT ENAME, SAL
    FROM EMP
    WHERE MGR = 
    (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');
    
SELECT W.ENAME, W.SAL
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO
    AND M.ENAME = 'KING';
    
--EX8. 평균급여 이하로 받는 사원의 이름, 급여를 출력
SELECT AVG(SAL) 
    FROM EMP;
    
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) 
    FROM EMP);
    
--EX9. 평균급여 이하로 받는 사원의 이름, 급여, 급여 평균를 출력
SELECT ENAME, SAL,(SELECT ROUND(AVG(SAL),2)FROM EMP) "평균"
    FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) 
    FROM EMP);
--EX10. 사원이름, 급여, 평균급여와의 차이
SELECT ENAME, SAL, (SELECT ROUND(AVG(SAL),2) FROM EMP)-SAL "DIFF"
    FROM EMP;
    
--단일행 다중열 서브쿼리
    --EX. SCOTT과 JOB이 같으며 DEPTNO가 같은 직원의 모든 필드 출력하시오
SELECT JOB, DEPTNO
    FROM EMP
    WHERE ENAME='SCOTT';
    
SELECT *
    FROM EMP
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO
    FROM EMP`
    WHERE ENAME='SCOTT');

-- ★ 총 연습문제
--1. 사원테이블에서 가장 먼저 입사한 사람의 이름, 급여, 입사일
SELECT ENAME, SAL, HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE)
    FROM EMP);
--2. 회사에서 가장 급여가 적은 사람의 이름, 급여
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL = (SELECT MIN(SAL)
    FROM EMP);
--3. 회사 평균보다 급여를 많이 받는 사람의 이름, 급여, 부서코드
SELECT ENAME, SAL, DEPTNO
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL)
    FROM EMP);
--4. 회사 평균 이하의 급여를 받는 사람의 이름, 급여, 부서명
SELECT ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO 
    AND SAL <= (SELECT AVG(SAL)
    FROM EMP);
--5. SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP , SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND HIREDATE < (SELECT HIREDATE
                FROM EMP
                WHERE ENAME='SCOTT');
--6. 5번(SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급)에 부서명 추가하고 급여가 큰 순 정렬
SELECT ENAME, SAL, HIREDATE, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND HIREDATE < (SELECT HIREDATE
                FROM EMP
                WHERE ENAME = 'SCOTT')
    ORDER BY SAL DESC;
--7. BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT SAL 
                    FROM EMP 
                    WHERE ENAME='BLAKE');
--8. MILLER보다 늦게 입사한 사원의 사번, 이름, 입사일
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE > (SELECT HIREDATE 
                    FROM EMP 
                    WHERE ENAME='MILLER');
--9. 사원전체 평균 급여보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL)
                    FROM EMP);
                    
--10. CLARK와 같은 부서번호이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO 
                  FROM EMP
                  WHERE ENAME = 'CLARK')
    AND SAL > (SELECT SAL    
               FROM EMP
               WHERE EMPNO = 7698);
--11.  응용심화. CLARK와 같은 부서명이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND DNAME = (SELECT DNAME 
                  FROM EMP
                  WHERE ENAME = 'CLARK')
    AND SAL > (SELECT SAL    
               FROM EMP
               WHERE EMPNO = 7698);
--12. BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자
SELECT ENAME, HIREDATE
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO
                    FROM EMP
                    WHERE ENAME = 'BLAKE');
--13. 평균 급여 이상을 받는 모든 종업원에 대해서 사원번호와 이름 단 급여가 많은 순으로 출력)
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL >(SELECT AVG(SAL)
                    FROM EMP)
    ORDER BY SAL DESC;
-- 여기서부터는 다중행서브쿼리와 단일행서브쿼리, 이전은 단일행서브쿼리
-- 14.  이름에 “T”가 있는 사원이 근무하는 부서에서 근무하는 모든 직원의 사원 번호,이름,급여(단 사번 순 출력)

-- 15. 부서 위치가 Dallas인 모든 종업원에 대해 이름,업무,급여

-- 16. EMP 테이블에서 King에게 보고하는 모든 사원의 이름과 급여

-- 17. SALES부서 사원의 이름, 업무

-- 18. 월급이 부서 30의 최저 월급보다 높은 사원의 모든 필드

-- 19.  FORD와 업무도 월급도 같은 사원의 모든 필드

-- 20. 이름이 JONES인 직원의 JOB과 같거나 FORD의 SAL 이상을 받는 사원의 정보를 이름, 업무, 부서번호, 급여
    -- 단, 업무별 알파벳 순, 월급이 많은 순으로 출력

-- 21. SCOTT 또는 WARD와 월급이 같은 사원의 정보를 이름,업무,급여

-- 22. CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원들의 이름,업무
SELECT * FROM EMP;

SELECT ENAME, JOB
    FROM DEPT D, EMP E
    WHERE LOC = 'CHICAGO';
    
SELECT ENAME, JOB
    FROM DEPT D, EMP E
    WHERE LOC IN ('CHICAGO');
-- 23. 부서 평균 월급보다 월급이 높은 사원을 사번, 이름, 급여, 부서번호
SELECT * FROM DEPT;

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP E
    WHERE SAL < (SELECT AVG(SAL) FROM EMP WHERE DEPTNO =E.DEPTNO);
--    AND SAL <(SELECT AVG(SAL) FROM EMP WHERE DEPTNO = '20')
--    AND SAL <(SELECT AVG(SAL) FROM EMP WHERE DEPTNO = '30');
    
    
SELECT EMPNO, ENAME, SAL, E.DEPTNO
    FROM EMP E,(SELECT DEPTNO, AVG(SAL) AVGSAL FROM EMP GROUP BY DEPTNO) G
    WHERE E.DEPTNO = G.DEPTNO
    AND SAL>AVGSAL; -- EQUI JOIN/ FROM 절의 SUB QUERY 사용
-- 24. 업무별로 평균 월급보다 적은 월급을 받는 사원을 부서번호, 이름, 급여

-- 25. 적어도 한 명 이상으로부터 보고를 받을 수 있는 사원을 업무, 이름, 사번, 부서번호를 출력(단, 부서번호 순으로 오름차순 정렬)

-- 26.  말단 사원의 사번, 이름, 업무, 부서번호










































    
--★ 3. 다중행 서브쿼리                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        



















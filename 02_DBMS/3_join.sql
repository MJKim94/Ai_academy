--[III] JOIN : 2개이상의 테이블을 연결하여 데이터를 검색하는 방법
SELECT * FROM EMP WHERE ENAME='SMITH';               -- 1행
SELECT * FROM DEPT; -- 4행
SELECT * FROM EMP, DEPT WHERE ENAME='SMITH'; -- CROSS JOIN : 4행(1*4)

-- ★ 1. EQUI JOIN(동등 JOIN = 공통필드값이 일치되는 조건만 JOIN 한다)
SELECT * FROM EMP, DEPT WHERE ENAME = 'SMITH' AND EMP.DEPTNO=DEPT.DEPTNO;
    -- ENAME 에서 SMITH 값을 출력 하면서 DEPINO = DEPT.DEPINO 같은값을 출력
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;

    --EX. 모든 사원의 사번, 이름, 직책, 상사사번, 부선번호, 부서이름 근무지 
SELECT EMPNO, ENAME, JOB, MGR, E.DEPTNO, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
    
    --EX. SAL이 2000이상인 직원에 대해, 이름, 직책, 급여, 부서명, 근무지
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000;
    --EX. 20번 부서 직원의 이름, 부서번호, 근무지 출력하시오
SELECT ENAME, E.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=20;
    --EX. LOC이 CHICAGO인 사람의 이름, 업무, 급여, 부서번호 를 출력하시오
SELECT ENAME, JOB, SAL, E.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO';
    --EX. 부서번호가 10이거나 20이고, 82년도에 입사한 사람을 출력하시오
SELECT ENAME, SAL, LOC
    FROM EMP E, DEPT D
    WHERE  E.DEPTNO=D.DEPTNO 
    AND HIREDATE BETWEEN '82/01/01' AND '82/12/31'
    AND E.DEPTNO IN (10,20)
    ORDER BY SAL;
    -- BETWEEN > LIKE 로 변경하여 작성
SELECT ENAME, SAL, LOC
    FROM EMP E, DEPT D
    WHERE  E.DEPTNO=D.DEPTNO 
    AND HIREDATE LIKE '82/__/__'
    AND E.DEPTNO IN (10,20)
    ORDER BY SAL;
    -- 탄탄EX1. NEW YOTK에서 근무하는 사원의 이름과 급여를 출력 하시오
SELECT ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';
    -- 탄탄EX2. ACCOUNTING 부서 소속 사원의 이름과 입사일 출력 하시오
SELECT ENAME, HIREDATE
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
        AND DNAME = 'ACCOUNTING';
    -- 탄탄EX3. 직급이 MANAGER인 사원의 이름, 부서명 출력 하시오
SELECT ENAME, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
        AND JOB = 'MANAGER';
    -- 탄탄EX4. COMM이 NULL이 아닌 사원의 이름, 급여, 부서번호, 근무지를 출력 하시오
 SELECT ENAME, SAL, E.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
        AND COMM IS NULL;  
    --EX. COMM이 NULL이며 SAL이 1200이상 인 사원의 이름, 급여, 부서번호, 부서명 을 출력 하시오(단 부서명순, 급여큰순 정렬)
SELECT ENAME, SAL, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
        AND COMM IS NULL 
        AND SAL>1200
        ORDER BY DNAME, SAL DESC;

-- ★ 2. NON-EQUL JOIN
SELECT * FROM EMP 
    WHERE ENAME='SCOTT';
    -- 1행(직원정보)
SELECT * FROM SALGRADE;
    -- 5행(급여등급)
SELECT *
    FROM EMP, SALGRADE
    WHERE ENAME='SCOTT';
    -- CROSS JOIN 임
SELECT *
    FROM EMP, SALGRADE
    WHERE ENAME='SCOTT'
        AND SAL
        BETWEEN LOSAL
        AND HISAL;
    --EX. 모든사원의 사번, 이름 , 상사사번, 급여, 급여등급(1등급, 2등급...)
SELECT EMPNO, ENAME, MGR, SAL, GRADE||'등급' GRADE
    FROM EMP, SALGRADE
    WHERE SAL 
        BETWEEN LOSAL 
        AND HISAL;
    --탄탄EX1. COMM이 NULL이 아닌 사원의 이름, 급여, 급여등급, 부서번호, 부서명, 근무지 를 출력하시오
 SELECT ENAME, SAL, GRADE, E.DEPTNO, DNAME, LOC
    FROM EMP E, SALGRADE, DEPT D 
    WHERE SAL BETWEEN LOSAL
        AND HISAL
        AND E.DEPTNO=D.DEPTNO
        AND COMM IS NOT NULL;
 
    --탄탄EX2. 이름, 급여, 입사일, 급여등급(신입순)
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL
        AND HISAL
        ORDER BY HIREDATE DESC;
    --탄탄EX3. 이름, 급여, 급여등급, 연봉, 부서명 출력을 하시오 단(부서명 정렬, 부서명이 같으면 연봉순 정렬) 연봉=(SAL+COMM*12)
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM, 0))*12 "ANUUALSAL", DNAME
    FROM EMP E, SALGRADE, DEPT D
    WHERE SAL BETWEEN LOSAL
        AND HISAL
        AND E.DEPTNO=D.DEPTNO
        ORDER BY DNAME, ANUUALSAL DESC;
    --탄탄EX4. 이름, 직책, 급여, 급여등급, 부서번호, 부서명 을 출력하시오 단 급여가 1000~3000 사이 출력 하면서 정렬은 부서번호순,직책순, 급여큰순
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, SALGRADE, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
        AND SAL 
        BETWEEN LOSAL
        AND HISAL
        AND SAL
        BETWEEN 1000
        AND 3000
        ORDER BY DEPTNO, JOB, SAL DESC;
    --탄탄EX5. 이름, 급여, 등급, 입사일, 근무지(81년도 입사한 직원만 등급 큰순으로 출력하시오)
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO 
        AND SAL 
        BETWEEN LOSAL
        AND HISAL
        AND HIREDATE 
        LIKE '81%'
        ORDER BY GRADE DESC;

--1. 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO=D.DEPTNO;
--2. NEW YORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여, 부서명을 출력
SELECT ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO=D.DEPTNO
        AND LOC ='NEW YORK';
--3. 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
SELECT ENAME, DNAME, LOC
    FROM EMP E, DEPT D
        WHERE E.DEPTNO=D.DEPTNO
        AND COMM IS NOT NULL;
--4. 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
SELECT ENAME, JOB, ENAME, LOC
    FROM EMP E, DEPT D
        WHERE E.DEPTNO=D.DEPTNO
        AND ENAME LIKE '%L%';
--5. 사번, 사원명, 부서코드, 부서명을 검색하라(단, 사원명기준으로 오름차순 정렬)
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO=D.DEPTNO
        ORDER BY ENAME;
--6. 사번, 사원명, 급여, 부서명을 검색하라. 
    --단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정렬하시오
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP E, DEPT D, SALGRADE
        WHERE E.DEPTNO=D.DEPTNO
        AND SAL>=2000
        ORDER BY SAL DESC;
--7. 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
-- 사원에 대하여 사번을 기준으로 오름차순으로 정렬하시오.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO=D.DEPTNO
        AND JOB='MANAGER'
        AND SAL>=2500
        ORDER BY EMPNO;
--8. 사번, 사원명, 업무, 급여, 등급을 검색하시오(단, 급여기준 내림차순으로 정렬)
SELECT EMPNO, ENAME, JOB, GRADE
    FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL
        ORDER BY SAL;
    
    
    
-- ★ 3. SELF -JOIN
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'SMITH';
SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR, MANAGER.EMPNO, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.ENAME='SCOTT'
    AND WORKER.MGR = MANAGER.EMPNO;
    
    --EX. 모든 사원의 사번, 이름, 상사사번, 상사이름
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO; -- 13행(KING의 MGR이 NULL이라서 EMPNO에 NULL이 없어)
    
    --EX. SMITH의 상사는? :
SELECT W.ENAME|| '의 상사는' || M.ENAME "MSG" 
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO;
    --탄탄 전 준비작업(20부서 : DALLAS)
    INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
    INSERT INTO EMP VALUES (9999, '홍길동', NULL, NULL, NULL, 3000, NULL, 50);
SELECT * FROM DEPT;
SELECT * FROM EMP;
    --탄탄 EX1. MGR이 KING인 사원들의 이름과 직급 출력
SELECT W.ENAME, W.JOB
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO
        AND M.ENAME='KING';
    --탄탄 EX2. SCOTT과 동일한 부서번호인 사원의 이름을 출력하시오
SELECT E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.ENAME='SCOTT'
        AND E1.DEPTNO=E2.DEPTNO
        AND E2.ENAME!='SCOTT';
    --탄탄 EX3. SCOTT과 동일한 LOC에서 근무하는 사원의 이름을 출력
SELECT E2.ENAME
    FROM EMP E1, DEPT D1, EMP E2, DEPT D2
    WHERE E1.DEPTNO=D1.DEPTNO 
        AND E1.ENAME='SCOTT'
        AND E2.DEPTNO=D2.DEPTNO
        AND D1.LOC=D2.LOC
        AND E2.ENAME!='SCOTT';
    -- DML(데이터 조작어 : INSERT, DELETE, UPDATE, SELECT) 구문 실행 취소 : ROLLBACK
ROLLBACK;
SELECT * FROM EMP;
SELECT * FROM DEPT;



--★ 4. OUTER JOIN : JOIN시 조건에 만족 되지 않은 행까지 출력(정보가 부족한 쪽에 +기호 넣으면 된다)
--(1) SELF JOIN에서의 OUTER JOIN
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
    -- SMITH의 상사는 FORD에용(상사가 없는 직원은 KING의 상사는 없다)
SELECT W.ENAME || '의 상사는' || NVL(M.ENAME, '없') || '다' "MESSAGE" 
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;
    
    
    --(2) EQUL JONI에서의 OUTER JOIN
SELECT * FROM EMP E, DEPT D
    WHERE E.DEPTNO(+)=D.DEPTNO;
SELECT * FROM EMP;
SELECT * FROM DEPT;
-- 연습 문제 
--1. 이름, 직속상사명
SELECT W.ENAME, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO;
--2. 이름, 급여, 업무, 직속상사명
SELECT W.ENAME, W.SAL, M.JOB, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO;
--3. 이름, 급여, 업무, 직속상사명 . (상사가 없는 직원까지 전체 직원 다 출력.
    --상사가 없을 시 '없음'으로 출력)
SELECT W.ENAME, W.SAL, M.JOB, NVL(M.ENAME, '없다') MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
--4. 이름, 급여, 부서명, 직속상사명
SELECT W.ENAME, W.SAL, DNAME, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D
        WHERE W.DEPTNO = D.DEPTNO
            AND W.MGR = M.EMPNO;
--5. 상사가 없는 직원과 상사가 있는 직원 모두에 대해 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명을 출력하시오(단, 직속상사가 없을 경우 직속상사명에는 ‘없음’으로 대신 출력하시오)
SELECT W.ENAME, W.SAL, W.DEPTNO, DNAME, LOC, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D
    WHERE W.DEPTNO=D.DEPTNO 
        AND W.MGR=M.EMPNO(+);
--6. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D, SALGRADE
        WHERE W.SAL
            BETWEEN LOSAL
            AND HISAL
            AND W.DEPTNO = D.DEPTNO
            AND W.MGR=M.EMPNO
            AND W.SAL>=2000;
--7. 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME MANAGER
    FROM EMP W, EMP M, SALGRADE, DEPT D
        WHERE W.MGR = M.EMPNO(+)
            AND W.DEPTNO=D.DEPTNO
            AND W.SAL BETWEEN LOSAL AND HISAL
            ORDER BY DNAME;
--8. 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(급여+comm)*12으로 계산
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL + NVL(W.COMM, 0))*12 ANNUALSAL, M.ENAME MANAGER       
FROM EMP W, EMP M , DEPT D, SALGRADE                            
    WHERE W.MGR = M.EMPNO 
    AND W.SAL 
    BETWEEN LOSAL 
    AND HISAL
    AND W.DEPTNO = D.DEPTNO; 
--9. 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL + NVL(W.COMM, 0))*12 ANNUALSAL, M.ENAME MANAGER       
FROM EMP W, EMP M , DEPT D, SALGRADE                            
    WHERE W.MGR = M.EMPNO 
    AND W.SAL 
    BETWEEN LOSAL 
    AND HISAL
    AND W.DEPTNO = D.DEPTNO
    ORDER BY DNAME, SAL DESC; 
--10. 사원테이블에서 사원명, 사원의 상사를 검색하시오(상사가 없는 직원까지 전체).

--11. 사원명, 상사명, 상사의 상사명을 검색하시오(self join)

--12. 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오(outer join)

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
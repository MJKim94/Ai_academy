-- [x] VIEW, IN-LINE VIEW, ★ ★ TOP-N ★ ★
-- 1. VIEW : 가상의 테이블 (VIEW의 종류 1.단순뷰 2.복합뷰)
-- (1) 단순뷰 : 하나의 테이블을 이용해서 만든 뷰( 가상의 테이블은 물리공간과 데이터가 따로 없어용)
CREATE OR REPLACE VIEW EMPv0 -- EMP TABLE 에서 특정 FILD만 VIEW로 생성
    AS SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO
    FROM EMP;
SELECT * FROM EMPv0;
SELECT * FROM TAB; -- 현 계정에 가지고있는 테이블 목록(가상 테이블 포함)
SELECT * FROM USER_TABLES; -- 현 계정이 가지고 있는 테이블 ( 가상 테이블 미포함)
SELECT * FROM USER_VIEWS;
INSERT INTO EMPv0
    VALUES (1111, '홍', 'MANAGER', NULL, NULL, 40); -- VIEW 에 INSERT

SELECT * FROM EMPv0;
SELECT * FROM EMP;
ROLLBACK;

CREATE OR REPLACE VIEW EMPv0 -- EMP TABLE 에서 특정 행(ROW)만 VIEW로 생성
    AS SELECT * FROM EMP
    WHERE DEPTNO = 30;
SELECT * FROM EMPv0;
INSERT INTO EMPv0
    VALUES (1111, '홍', 'MANAGER', NULL, NULL, 9000, NULL, 40);
-- EMPv0 을 DEPTNO 30번 부서만 보이게 CREATE 진행을해서 DEPTNO 40번 부서를 INSERT 시 EMPv0 에서 보이지 않음

-- 단순뷰에서 INSERT 가 불가한경우 : VIEW 생성시 NOT NULL 필드를 미포함한 경우
CREATE OR REPLACE VIEW EMPv0
    AS SELECT ENAME, JOB 
    FROM EMP;
SELECT * FROM EMPv0;

INSERT INTO EMPv0
    VALUES ('홍', 'MANAGER');
ROLLBACK;

-- VIEW 생성시 제한 조건문 ( WITH CHECK OPTION 추가 : VIEW의 조건에 해당되는 데이터만 삽입, 수정, 삭제 가능)
-- WITH READ ONLY 추가 : 읽기 전용 VIEW

CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP
    WHERE DEPTNO = 30
    WITH CHECK OPTION;
    
SELECT * FROM EMPv0;
SELECT * FROM EMP;

SELECT * 
    FROM EMPv0 E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;

INSERT INTO EMPv0 (EMPNO, ENAME, DEPTNO)
    VALUES (1111, '홍', 30);

SELECT *
    FROM EMP
    WHERE ENAME = 'SMITH';
    
DELETE FROM EMPv0 WHERE ENAME = 'SMITH';

DELETE FROM EMPv0
    WHERE ENAME = '홍';
COMMIT;

-- 읽기 전용 뷰(WITH READ ONLY VIEW)
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP 
        WHERE DEPTNO = 20
        WITH READ ONLY;
        
INSERT INTO EMPv0 (EMPNO, ENAME, DEPTNO)
    VALUES (1111, '홍', 20);

ROLLBACK;


-- (2) 복합뷰 : 2개 이상의 테이블로 구성한 뷰 OR 가상의 필드를 이용한 뷰 / DML문을 제한적으로 만 이용
-- ① 2개 이상의 테이블로 구성한 복합뷰
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, DNAME
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO;
SELECT * FROM EMPv0;
INSERT INTO EMPv0
    VALUES (1111, '홍', 'MANAGER', 'SALES'); -- ERROR.............
-- ② 가상의 필드를 이용한 복합뷰 ( 컬럼에 별칭을 사용 해야 함)
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, SAL*12 YEAR_SAL -- 별칭 사용 안할시 ERROR 
        FROM EMP
        WHERE DEPTNO = 10;

CREATE OR REPLACE VIEW EMPv0 (NO, NAME, TEAR_SAL) -- 별칭들만 따로 입력
    AS SELECT EMPNO, ENAME, SAL*12
        FROM EMP
        WHERE DEPTNO = 10;

SELECT * FROM EMPv0;

INSERT INTO EMPv0
    VALUES (1111, 'LEE', 1200); -- 복합뷰는 INSERT 불가 함다

    --EX 탄탄 사번, 이름 급여 10의 자리에서 반올림 급여를 뷰로 생성 (EMPv0)
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, ROUND(SAL,-2) SAL
        FROM EMP;
        
INSERT INTO EMPv0
    VALUES (1111, 'HONG', 1300); -- 복합뷰는 INSERT 불가
    --EX 탄탄2 중복이 제거된 JOB, DEPTNO를 뷰로 생성 하시오 (EMPv1)
SELECT DISTINCT JOB, DEPTNO -- DISTINCT 필드의 중복된 데이터를 제거 
    FROM EMP;

CREATE OR REPLACE VIEW EMPv1
    AS SELECT DISTINCT JOB, DEPTNO
        FROM EMP;
    --EX 탄탄3 부서번호 최소급여, 최대급여, 부서평균(소수점 1자리에서 반올림) 을 포함한 뷰
SELECT DEPTNO, MIN(SAL), MAX(SAL), AVG(SAL)
    FROM EMP;
    
CREATE OR REPLACE VIEW EMPv0 (DEPTNO, MINSAL, MAXSAL, AVGSAL)
    AS SELECT DEPTNO, MIN(SAL), MAX(SAL), ROUND(AVG(SAL), 1)
        FROM EMP
        GROUP BY DEPTNO;

SELECT * FROM EMPv0;

    --EX 탄탄3 부서명 최소급여, 최대급여, 부서평균(소수점 1자리에서 반올림) 을 포함한 뷰
SELECT DNAME, MIN(SAL), MAX(SAL), ROUND(AVG(SAL), 1)
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
        GROUP BY DNAME;
        
CREATE OR REPLACE VIEW EMPv0 (DNAME, MINSAL, MAXSAL, AVGSAL)
    AS SELECT DNAME, MIN(SAL), MAX(SAL), ROUND(AVG(SAL), 1)
        FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
        GROUP BY DNAME;
        
SELECT * FROM EMPv0;

-- 2. IN-LINE VIEW 
-- FROM절의 SUB QUERY 를 INLINE-VIEW라 하며, FROM절에 오는 SUB QUERY는 VIEW 작용

    --EX. 급여가 2000을 초과하는 사원의 평균 급여
SELECT AVG(SAL)
    FROM EMP
    WHERE SAL > 2000;

SELECT AVG(SAL)
    FROM (SELECT SAL
            FROM EMP
            WHERE SAL>2000) E;
            
--SELECT 필드1, 필드2
--  FROM (SUB QUERY) 별칭, 테이블N, .... (테이블이 여러개 써도 상관없음)
--  WHERE 조건
    -- EX. 부서평균의 월급보다 높은 월급을 받는 사원의 사번, 이름,급여, 부서번호, 해당 부서의 평균급여(반올림)
SELECT EMPNO, ENAME, SAL, E.DEPTNO
    FROM EMP E,(SELECT DEPTNO, AVG(SAL) AVGSAL
                    FROM EMP
                    GROUP BY DEPTNO) G
    WHERE E.DEPTNO = G.DEPTNO
    AND SAL>AVGSAL;

--③ TOP-N 구문(TOP 1~10등, 11~20등 출력)
--ROWNUM : 출력될 데이터 중 테이블로부터 가져올 데이서 순서
SELECT ROWNUM, ENAME, SAL
    FROM EMP
    WHERE DEPTNO =20;

SELECT ROWNUM, ENAME, SAL -- 2번
    FROM EMP    -- 1번
    ORDER BY SAL DESC; -- 3번
    
SELECT ROWNUM RANK, ENAME, SAL
    FROM (SELECT * FROM EMP ORDER BY SAL DESC); -- 1등 부터 꼴찌까지
    
-- SAL을 기준으로 1~5등 까지 출력
SELECT ROWNUM RANK, ENAME, SAL
    FROM (SELECT * FROM EMP ORDER BY SAL)
    WHERE ROWNUM <=5;
-- SAL을 기준으로 6~10등 까지 출력
SELECT ROWNUM RANK, ENAME, SAL
    FROM (SELECT * FROM EMP ORDER BY SAL)
    WHERE ROWNUM BETWEEN 6 AND 10;

-- TOP-N
SELECT * FROM EMP ORDER BY SAL;-- 1단계 (SAL 기준으로 정렬)
SELECT ROWNUM RK, A.* FROM (SELECT * FROM EMP ORDER BY SAL) A; -- 2단계 (정렬 된 데이터에 랭킹포함)

SELECT *
    FROM (SELECT ROWNUM RK, ENAME, SAL -- INLINE - VIEW
            FROM (SELECT * FROM EMP
                    ORDER BY SAL))
    WHERE RK BETWEEN 6 AND 10; -- 3단계 (TOP-N구문)

-- EX. 이름 알파벳순으로 6~10번째 출력(순서, 이름, 사번, JOB,MGR,HIREDATE)

SELECT *
    FROM (SELECT ROWNUM RK, ENAME, EMPNO, JOB, MGR, HIREDATE
            FROM (SELECT * FROM EMP
                    ORDER BY ENAME))
    WHERE RK BETWEEN 6 AND 10;

--EX. 입사순으로 11~15번째인 사원의 모든 필드 출력(순서는 출력 안함)

SELECT *
    FROM (SELECT ROWNUM RK, A.*
            FROM (SELECT *
                    FROM EMP
                    ORDER BY HIREDATE)A)
    WHERE RK BETWEEN 11 AND 15;
                    













-- ★ ★ ★ <총 연습문제> ★ ★ ★
-- 1. 부서명과 사원명을 출력하는 용도의 뷰, DNAME_ENAME_VU 를 작성하시오
CREATE OR REPLACE VIEW EMPv0 
    AS SELECT DNAME, ENAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;

SELECT * FROM EMPv0;
-- 2. 사원명과 직속상관명을 출력하는 용도의 뷰,  WORKER_MANAGER_VU를 작성하시오
CREATE OR REPLACE VIEW EMPv1
    AS SELECT E1.ENAME WORKER, E2.ENAME MANAGER
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO;

SELECT * FROM EMPv1;
-- 3. 부서별 급여합계 등수를 출력하시오(부서번호, 급여합계, 등수). -- 학생 질문
SELECT *
    FROM (SELECT DEPTNO, SUMSAL, ROWNUM
             FROM (SELECT DEPTNO, SUM(SAL) SUMSAL
                        FROM EMP
                        GROUP BY DEPTNO
                        ORDER BY SUMSAL DESC));
    
-- 3-1. 부서별 급여합계 등수가 2~3등인 부서번호, 급여합계, 등수를 출력하시오.
SELECT *
    FROM (SELECT DEPTNO, SUMSAL, ROWNUM RK
             FROM (SELECT DEPTNO, SUM(SAL) SUMSAL
                        FROM EMP
                        GROUP BY DEPTNO
                        ORDER BY SUMSAL DESC))
    WHERE RK BETWEEN 2 AND 3;
-- 4. 사원테이블에서 사번, 사원명, 입사일을 입사일이 최신에서 오래된 사원 순으로 정렬하시오
SELECT *
    FROM (SELECT A.*
            FROM (SELECT EMPNO, ENAME, HIREDATE
                    FROM EMP
                    ORDER BY HIREDATE DESC)A);
-- 5. 사원테이블에서 사번, 사원명, 입사일을 입사일이 최신에서 오래된 사원 5명을 출력하시오
SELECT *
    FROM (SELECT ROWNUM RK, EMPNO, ENAME, HIREDATE
            FROM (SELECT *
                    FROM EMP
                    ORDER BY HIREDATE))
    WHERE RK BETWEEN 10 AND 15;
-- 6. 사원 테이블에서 사번, 사원명, 입사일을 최신부터 오래된 순으로 6번째로 늦은 사원부터 10번째 사원까지 출력
SELECT *
    FROM (SELECT ROWNUM RK, EMPNO, ENAME, HIREDATE
            FROM (SELECT *
                    FROM EMP
                    ORDER BY HIREDATE))
    WHERE RK BETWEEN 6 AND 10;
-- [XII] TRANSACTION 명령어 : COMMIT(TRANSACTION 반영), ROLLBACK(TRANSACTION 취소)
--                           SAVEPOINT(TRANSACTION 분할)

SELECT * FROM DEPT01;

DROP TABLE DEPT01;

CREATE TABLE DEPT01
    AS SELECT *
    FROM DEPT;
-----------TRANSACTION Start---------------
SELECT * FROM DEPT01;
DELETE FROM DEPT01
    WHERE DEPTNO = 10;
ROLLBACK;
-----------TRANSACTION Start---------------
SELECT * FROM DEPT01;

DELETE 
    FROM DEPT01
    WHERE DEPTNO = 40; -- 40번 부서 삭제
    
COMMIT;
-----------TRANSACTION Start---------------
SELECT * FROM DEPT01; -- 10,20,30 부서 만 존재

DELETE 
    FROM DEPT01
    WHERE DEPTNO = 30; -- 30번 부서 삭제
SAVEPOINT C1; -- ★ C1 시점 : 10,20번 부서

SELECT * FROM DEPT01;

DELETE
    FROM DEPT01
    WHERE DEPTNO = 20; -- 20번 부서 삭제
SAVEPOINT C2; -- ★ C2 시점 : 10번 부서 

SELECT * FROM DEPT01;

DELETE
    FROM DEPT01
    WHERE DEPTNO = 10;
    
SELECT * FROM DEPT01;

ROLLBACK TO C2; -- C2시점으로 ROLLBACK 

SELECT * FROM DEPT01;

ROLLBACK TO C1;

































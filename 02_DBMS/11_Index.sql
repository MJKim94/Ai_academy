-- [XI] 인덱스 : 조회를 빠르게 하는 INDEX
DROP TABLE EMP01;

CREATE TABLE EMP01
    AS SELECT *
    FROM EMP; -- EMP 필드와 같은 EMP01 테이블 생성
    
SELECT * FROM EMP01; -- 14행

INSERT INTO EMP01
    SELECT *
    FROM EMP01; -- 데이터 늘리기 
--1번 실행시 14*2 28행 / 2번 실행시 28*2 56행
SELECT TO_CHAR(COUNT(*), '9,999,999')
    FROM EMP01;
    
INSERT INTO EMP01
    SELECT *
    FROM EMP01;
    
INSERT INTO EMP01 (EMPNO, ENAME, DEPTNO)
    VALUES (1111, '홍길동', 40);
    
INSERT INTO EMP01
    SELECT *
    FROM EMP01;
    
SELECT TO_CHAR(COUNT(*), '9,999,999')
    FROM EMP01;
    
-- INDEX 생성 전 홍길동 검색
SELECT *
    FROM EMP01
    WHERE ENAME = '홍길동'; -- 0.016초 소요
    
-- INDEX 생성후 홍길동 검색
CREATE INDEX IDX_EMP01_ENAME 
    ON EMP01(ENAME); -- INDEX 생성 할때 0.454초 소요

SELECT *
    FROM EMP01
    WHERE ENAME = '홍길동'; -- 0.001초?
COMMIT;
INSERT INTO EMP01
    SELECT *
    FROM EMP01; -- 인텍스 생성후 91만개 -> 183만개 (23.848초 소요)

SELECT TO_CHAR(COUNT(*), '9,999,999')
    FROM EMP01; -- 1,835,024개
    
ROLLBACK; -- 9.836초 소요

DROP INDEX IDX_EMP01_ENAME; -- INDEX DELETE

SELECT TO_CHAR(COUNT(*), '9,999,999')
    FROM EMP01; -- 917,512개
    
INSERT INTO EMP01
    SELECT *
    FROM EMP01;

ROLLBACK; -- 0.11초 소요



















































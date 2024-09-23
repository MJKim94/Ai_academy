-- [7] DDL, DCL, DML
-- SQL = DDL(DATE DEFINITION LANGUAGE) 테이블 생성, 테이블 삭제, 테이블 구조 변경, 테이블 모든 데이터 제거)
-- DML ( DATE MANIPULATION LANGUAGE) 데이터 검색, 데이터 수정 / SELECT, INSERT, UPDATE, DELETE
-- DCL ( DATE CONTROL LANGUAGE) 사용자 계정 생성, 사용자에게 권한부여, 권한박탈, 사용자 계정 삭제 트랜잭션 명령어
--★ ★ ★ DDL ★ ★ ★
-- 1. 테이블 생성( 문법 : CREATE TABLE "테이블 이름" ) : 테이블 구조를 정의
DROP TABLE BOOK;
CREATE TABLE BOOK (
    BOOKID NUMBER(4), -- BOOKID 필드의 타입은 숫자 4자리
    BOOKNAME VARCHAR2(20), -- BOOKNAME 필드의 타입의 문자 20Byte
    PUBLISHER VARCHAR2(30), -- PUBLISHER필드의 타입은 무자 30Byte
    RDATE DATE, --RDATE 필드의 타입은 DATE
    PRICE NUMBER(8, 2), -- PRICE필드의 타입은 숫자 전체 8자리 중 소수점 2자리 저장할수있음
    PRIMARY KEY(BOOKID) -- 제약 조건 : BOOKID 필드가 주키(PRIMARY KEY: NOT NULL, UNIQUE)
);

SELECT * FROM BOOK;
DESC BOOK;

DROP TABLE BOOK; -- 테이블 삭제
CREATE TABLE BOOK (
    BOOKID NUMBER(4) PRIMARY KEY, 
    BOOKNAME VARCHAR2(20),
    PUBLISHER VARCHAR2(30),
    RDATE DATE,
    PRICE NUMBER(8, 2)
);
SELECT * FROM BOOK;


    --DEPT01 테이블 : DEPTNO(숫자 2자리:PK), DNAME(문자 14자리), LOC(문자 13자리)
    DESC DEPT;
CREATE TABLE DEPT01 (
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13),
    PRIMARY KEY(DEPTNO)
);


    --EX. EMP와 유사한 EMP01테이블 : EMPNO(숫자 4자리 :PK), ENAME(문자 10자리), SAL(숫자7,2)
                                --DEPTNO(숫자 2, DEPT01테이블의 DEPTNO와 연동: 외래키 FK)

CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    SAL NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO) --FK
);

SELECT * FROM EMP01;
-- 외래키로 연결할 경우 : 참조 테이블에 데이터를 먼저 INSERT 해야함
INSERT INTO DEPT01 VALUES (10, '신림', 'IT');
INSERT INTO EMP01 VALUES ( 1000, '홍', 9000, 10);
COMMIT; -- DML 명령어들을 데이터베이스에 적용 시킨다아아아아아아아아아아아아아아아아아아아아아아아

ROLLBACK;

--SUB QUERY 를 사용하여 테이블 생성

CREATE TABLE EMP02
    AS
    SELECT * FROM EMP; -- SUB QUERY 결과로 EMP02테이블 생성 후 데이터 가 들어감




CREATE TABLE EMP03
    AS
    SELECT EMPNO, ENAME, DEPTNO 
    FROM EMP;
    
SELECT * FROM EMP03;

























                                
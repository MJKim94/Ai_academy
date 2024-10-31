-- 테이블 및 시쿼스 제거
DROP TABLE PERSON;
DROP SEQUENCE PERSON_ID_SEQ;
-- 테이블 생성 및 시퀀스 생성
CREATE TABLE PERSON(
    ID NUMBER(6), -- PK
    NAME VARCHAR2(50) NOT NULL,
    TEL VARCHAR2(50) UNIQUE,
    ADDRESS VARCHAR2(255), --주소
    BIRTH DATE, --생년월일
    MEMO VARCHAR2(4000), --메모
    RDATE DATE DEFAULT SYSDATE NOT NULL, --등록시점
    PRIMARY KEY(ID)
);

CREATE SEQUENCE PERSON_ID_SEQ
    MAXVALUE 999999
    NOCYCLE
    NOCACHE;
    
INSERT INTO PERSON (ID, NAME, TEL, ADDRESS, BIRTH, MEMO)
    VALUES (PERSON_ID_SEQ.NEXTVAL, '홍홍홍', '010-1234-5678', '서울', NULL, '텍스트');
INSERT INTO PERSON (ID, NAME, TEL, ADDRESS, BIRTH, MEMO)
    VALUES (PERSON_ID_SEQ.NEXTVAL, '김김김', '010-4321-87654', '광주', NULL, '테스트');
INSERT INTO PERSON (ID, NAME, TEL, ADDRESS, BIRTH, MEMO)
    VALUES (PERSON_ID_SEQ.NEXTVAL, '민민민', '010-1234-87654', '경기도', NULL, '테스트1');    
COMMIT;
--DAO 에 들어갈 QUERY
-- 1. LIST 조회 (PAGING없이) : public ArrayList<Person> getPersonList()
SELECT * FROM PERSON;
--1. LIST 조회 (PAGING추가) : public ArrayList<Person> getPersonList(몇등(int startRow), 몇등까지(int endRow))
SELECT *
    FROM PERSON
    ORDER BY ID DESC;
    
SELECT ROWNUM RK, P.*
    FROM (SELECT *
        FROM PERSON
        ORDER BY ID DESC) P
    WHERE ID BETWEEN 2 AND 3;
    
SELECT *
    FROM (SELECT ROWNUM RK, P.*
            FROM (SELECT *
                FROM PERSON
                ORDER BY ID ) P)
    WHERE RK BETWEEN 2 AND 3;
--2. getCount(PAGING처리시 필요한 전체 갯수) : public int getCount()
SELECT COUNT(*)
    FROM PERSON;
--3 INSERT : public int insertPerson(Person person)
INSERT INTO PERSON (ID, NAME, TEL, ADDRESS, BIRTH, MEMO)
    VALUES (PERSON_ID_SEQ.NEXTVAL, '민민민', '010-1234-87654', '경기도', NULL, '테스트1');
--4 한명 출력 : public Person getPerson(int id)
SELECT *
    FROM PERSON
    WHERE ID = 1;
--5 수정 : public int updatePerson(Person person : person)
UPDATE PERSON
    SET NAME = '',
        TEL = '',
        ADDRESS = '',
        BIRTH = '',
        MEMO = ''
    WHERE ID = 1;
--6 삭제 : public int deletePerson(int id)
DELETE 
    FROM PERSON
    WHERE ID = 1;
















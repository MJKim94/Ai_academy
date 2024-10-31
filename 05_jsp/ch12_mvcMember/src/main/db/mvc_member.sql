-- TABLE DELETE
DROP TABLE MEMBER CASCADE CONSTRAINTS; -- 참조하는 
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    ID VARCHAR2(30),
    PW VARCHAR2(30) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    BIRTH DATE, -- 생년월일
    RDATE DATE DEFAULT SYSDATE NOT NULL, -- 등록시점
    PRIMARY KEY(ID)
);

-- 더미 데이터

INSERT INTO MEMBER (ID, PW, NAME, BIRTH)
    VALUES ('abc', '123', '가나다', '99/12/12');
    
INSERT INTO MEMBER (ID, PW, NAME, BIRTH, RDATE)
    VALUES ('cda', '321', '다나가', '01/12/12', '24/01/01');
    
SELECT * FROM MEMBER;
-- DAO에 들어갈 QUERY

--public int insertMember(Member newMember)
INSERT INTO MEMBER (ID, PW, NAME, BIRTH)
    VALUES ('dca', '321', '나다가', TO_DATE('2001-12-12', 'YYYY-MM-DD'));

--public Member getMember(String id)
SELECT *
    FROM MEMBER
    WHERE ID = 'abc';

--public int getConutMember(String id)
SELECT counT(*)
    FROM MEMBER
    WHERE ID = 'abc';

--public ArrayList<Member> getMemberList();
SELECT *
    FROM MEMBER
    ORDER BY NAME;


COMMIT;











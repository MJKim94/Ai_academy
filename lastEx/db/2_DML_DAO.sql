-- DAO에 쓸 QUERY

-- 1번기능과 2번 기능에서 입력가능한 직업명들
SELECT jNAME 
    FROM JOB;

SELECT * FROM PERSON;
-- 1번기능 : PNAME, JNAME, KOR, ENG, MAT를 입력받아 PERSON 테이블 INSERT
SELECT pNAME, jNAME, KOR, ENG, MAT
    FROM PERSON P, JOB J
    WHERE P.jNO=J.jNO;
    
INSERT INTO PERSON (PNO, PNAME, JNO, KOR, ENG, MAT)
    VALUES (PERSON_PNO_SQ.NEXTVAL, '홍길동',
    (SELECT JNO 
        FROM JOB
        WHERE JNAME= '배우'
        AND ROWNUM = 1), 90, 95, 99);

-- 2번기능 : JNAME을 입력받아 RANK, PNAME(PNO), JNAME, KOR, ENG, MAT, SUM(총합)
         -- RANK는 SUM 내림 차순으로 출력(ROWNUM과 INLINE VIEW 사용)
SELECT pNAME||'('||PNO||'번)' PNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
    FROM PERSON P, JOB  J
    WHERE P.jNO=J.jNO
    ORDER BY SUM DESC;
    
SELECT ROWNUM RK, A.*
    FROM (SELECT pNAME||'('||PNO||'번)' PNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
    FROM PERSON P, JOB  J
    WHERE P.jNO=J.jNO
    AND jNAME = '배우'
    ORDER BY SUM DESC) A ;
    
-- 3번기능 : RANK, PNAME(PNO), JNAME, KOR, ENG, MAT, SUM(총합)
SELECT ROWNUM RK, A.*
  FROM (SELECT pNAME||'('||PNO||'번)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
        FROM PERSON P, JOB J 
        WHERE P.jNO=J.jNO 
        ORDER BY SUM DESC) A ;
        
        
SELECT * FROM PERSON;
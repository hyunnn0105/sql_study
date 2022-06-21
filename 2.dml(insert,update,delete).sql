
-- DML 데이터 조작어
-- SELECT, insert , update, delete
--  조회  /          <갱신>
-- anormaly는 주로 갱신쪽에서 일어남 / 대답은 성공/실패 결과만 알려줌


-- insert : 데이터 추가
INSERT INTO board
    (bno, title, content, writer, reg_date)
VALUES
    (1, '제목1', '본문111111', '둘리', SYSDATE + 1);

-- NN 제약조건 위반 -> 삽입 실패
INSERT INTO board
    (bno, content, writer)
VALUES
    (1, '본문222222222', '둘리');
    
-- pk의 유니크 제약조건 위반
INSERT INTO board
    (bno, title, writer)
VALUES
    (1, '본문3', '둘리');

-- 삽입성공
INSERT INTO board
    (bno, title, writer)
VALUES
    (2, '본문4', '짹짹이');
    
-- 컬럼을 명시하지 않았을 경우 반드시 모든 컬럼의 값을 순서대로 채워야함(추천X)
INSERT INTO board

VALUES
    (3, '본문5', '꽥꽥이', '내용드으으으을', SYSDATE + 10);
    


-- 데이터 수정
UPDATE board
SET title = '수정된 제목이다~'
WHERE bno = 3;

-- ,로 수정하고 싶은거 나열 할 수있음
UPDATE board
SET writer = '수정맨'
    , content = '메로오오오오오옹 fix'
WHERE bno = 2;

--  WHERE절 생략시 전체가 수정된다. but 이렇게 쓸때도 있음>모든유저에게 게임머니지급 
-- -> 커밋안했으면 롤백하기
UPDATE board
SET writer = 'bad';



-- data delete
DELETE FROM board
WHERE bno = 1;

-- 전체 데이터 삭제
-- 1. WHERE절을 생략한 DELETE 절(롤백가능, 수동커밋가능, 로그남기기 가능)
DELETE FROM board;

-- 2. TRUNCATE TABLE 
-- (롤백불가능, 자동커밋, 로그를 남길 수 없음, 테이블 생성 초기상태로 복귀) 사용XX
TRUNCATE TABLE board;

-- 3. DROP TABLE
-- (롤백불가능, 자동커밋, 로그를 남길 수 없음, 테이블 구조가 완전히 삭제됨) 사용XX
DROP TABLE board;


ROLLBACK;
commit;
SELECT * FROM board;
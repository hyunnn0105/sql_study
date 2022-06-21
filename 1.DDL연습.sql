--- DDL : 데이터 정의어
--- create, alter, drop, rename, truncate

DROP TABLE board;

--- create table : 테이블을 생성
CREATE TABLE board (
    bno NUMBER(10)
    , title VARCHAR2(200) NOT NULL
    , writer VARCHAR2(40) NOT NULL
    , content CLOB 
    , reg_date DATE DEFAULT SYSDATE
    , view_count NUMBER(10) DEFAULT 0
);
-- DEFAULT '0'

-- ALTER : 데이터베이스의 구조를 변경

-- pk설정
ALTER TABLE board 
ADD CONSTRAINT pk_board_bno
PRIMARY KEY (bno);

-- 데이터 추가
INSERT INTO board
    (bno, title, writer, content)
VALUES
    (1,'안농', '키키', '하하하하하하 하하ㅏ하핳');
    
-- content에 내용이 없다면 insert도 content 지워주기 
INSERT INTO board
    (bno, title, writer)
VALUES
    (2,'두번째', '하하하');
    
commit;
-- 세미콜론마다 ctrl+enter

-- 연관관계 설정
-- 게시물과 댓글의 관계
--   1   :  Many

-- 댓글 테이블 생성
CREATE TABLE REPLY (
    rno NUMBER(10)
    , r_content VARCHAR2(400)
    , r_writer VARCHAR2(40) NOT NULL
    , bno NUMBER(10)
    , CONSTRAINT pk_reply_rno PRIMARY KEY (rno) 
    -- pk 설정, 별칭도 정해줌 pk_reply_rno
    
);

-- pk 가지고 있기
-- 외부키설정 : reply에게 bno 알려주기

-- 외래키 설정(foreign key) : 테이블간의 관계 제약 설정
ALTER TABLE reply
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY (bno)
REFERENCES board (bno);
-- board의 bno랑 연결

-- 컬럼 변경
-- 컬럼 추가
ALTER TABLE reply
ADD (r_reg_date DATE DEFAULT SYSDATE);


-- 컬럼 제거
ALTER TABLE board
DROP COLUMN view_count;

-- 컬럼 수정
ALTER TABLE board
MODIFY (title VARCHAR2(500));

SELECT * FROM board;

-- 테이블 삭제
-- TRUNCATE TABLE board; -- 테이블 내부 전체 삭제 "롤백불가!!"

DROP TABLE reply;
TRUNCATE TABLE board;

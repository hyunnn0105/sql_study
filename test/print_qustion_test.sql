
CREATE TABLE 일자별매출_93 (
    일자 DATE
    , 매출액 NUMBER(5)
);

INSERT INTO 일자별매출_93 VALUES ('2015-11-01', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-02', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-03', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-04', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-05', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-06', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-07', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-08', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-09', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-10', 1000);
COMMIT;
ROLLBACK;

SELECT * FROM 일자별매출_93;

-- 보기
SELECT a.일자, SUM(a.매출액) as 누적매출액
FROM 일자별매출_93
group by a.일자
order by a.일자
;


-- 보기2
-- 보기 2

SELECT B.일자, SUM(B.매출액) AS 누적매출액
FROM 일자별매출_93 A
JOIN 일자별매출_93 B 
ON (A.일자 >= B.일자)
GROUP BY B.일자
ORDER BY B.일자
;

SELECT A.일자, A.매출액, B.일자, B.매출액
FROM 일자별매출_93 A
JOIN 일자별매출_93 B 
ON (A.일자 >= B.일자)
ORDER BY B.일자
;




--- 86

drop table 회원기본정보_86;
drop table 회원상세정보_86;
CREATE TABLE 회원기본정보_86 (
    user_id VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE 회원상세정보_86 (
    user_id VARCHAR2(200)
    
);

ALTER TABLE 회원상세정보_86
ADD CONSTRAINT fk_user_id 
FOREIGN KEY (user_id)
references 회원기본정보_86 (user_id);

insert into 회원기본정보_86 VALUES('abc01');
insert into 회원기본정보_86 VALUES('abc02');
insert into 회원기본정보_86 VALUES('abc03'); 
insert into 회원기본정보_86 VALUES('abc04'); 
insert into 회원기본정보_86 VALUES('abc05'); 

commit;

insert into 회원상세정보_86 VALUES('abc01');
insert into 회원상세정보_86 VALUES('abc02');
insert into 회원상세정보_86 VALUES('abc03');
commit;

SELECT
    * FROM 회원기본정보_86;
SELECT
    * FROM 회원상세정보_86;

SELECT * FROM 회원기본정보_86;
SELECT * FROM 회원상세정보_86;

-- 보기 1
SELECT user_id FROM 회원기본정보_86
MINUS
SELECT user_id FROM 회원상세정보_86
;


-- 보기 2
SELECT user_id FROM 회원기본정보_86
UNION ALL
SELECT user_id FROM 회원상세정보_86
;


-- 보기 3
SELECT user_id FROM 회원기본정보_86
INTERSECT
SELECT user_id FROM 회원상세정보_86
;

SELECT A.user_id 
FROM 회원기본정보_86 A 
JOIN 회원상세정보_86 B 
ON A.user_id = B.user_id
;

-- 보기 4
SELECT user_id FROM 회원기본정보_86
INTERSECT
SELECT user_id FROM 회원상세정보_86
;

SELECT user_id FROM 회원기본정보_86
UNION
SELECT user_id FROM 회원상세정보_86
;


-- 84번

create table t1(
    A VARCHAR2(10)
    , B VARCHAR2(10)
    , c VARCHAR2(10)
);

insert INTO t1 VALUES ('a3','b2','c3');
insert INTO t1 VALUES ('a1','b1','c1');
insert INTO t1 VALUES ('a2','b1','c2');
commit;

ROLLBACK;

SELECT
    * FROM t1;

create table t2(
    A VARCHAR2(10)
    , B VARCHAR2(10)
    , c VARCHAR2(10)
);

insert INTO t2 VALUES ('a1','b1','c1');
insert INTO t2 VALUES ('a3','b2','c3');

SELECT
    * FROM t2;

SELECT A,B,C FROM t1
UNION all
SELECT A,B,C from t2
;

SELECT A,B,C FROM t1
UNION
SELECT A,B,C from t2
;

commit;


-- 83번
create table tbl1(
    COL1 VARCHAR2(10)
    , COL2 VARCHAR2(10)
);

insert into tbl1 values('AA','A1');
insert into tbl1 values('AB','A2');

SELECT
    * FROM tbl1;
    
create table tbl2(
    COL1 VARCHAR2(10)
    , COL2 VARCHAR2(10)
);
  
insert into tbl2 values('AA','A1');
insert into tbl2 values('AB','A2');
insert into tbl2 values('AC','A3');
insert into tbl2 values('AD','A4');

SELECT
    * FROM tbl2;
COMMIT;
ROLLBACK;


SELECT col1, col2, count(*) AS cnt
From(
SELECT col1, col2
FROM tbl1
UNION all
select col1, col2
from tbl2
)
group by col1, col2
;           

-- 56번
commit;
CREATE TABLE 지역별매출(
    지역
)
  
-- #91번
DROP TABLE 부서_91;

-- 테이블 작성
-- 부서테이블
CREATE TABLE 부서_91 (
 부서코드 VARCHAR2(20),
 부서명 VARCHAR2(100),
 상위부서코드 VARCHAR2(20),
 CONSTRAINT pk_부서_91 PRIMARY KEY(부서코드)
);

-- fk 선언
ALTER TABLE 부서_91 
ADD CONSTRAINT fk_상위부서코드_91 
FOREIGN KEY (상위부서코드)
REFERENCES 부서_91 (부서코드);

INSERT INTO 부서_91 VALUES(100, '아시아부', NULL);
INSERT INTO 부서_91 VALUES(110, '한국지사', 100);
INSERT INTO 부서_91 VALUES(111, '서울지점', 110);
INSERT INTO 부서_91 VALUES(112, '부산지점', 110);
INSERT INTO 부서_91 VALUES(120, '일본지사', 100);
INSERT INTO 부서_91 VALUES(121, '도쿄지점', 120);
INSERT INTO 부서_91 VALUES(122, '오사카지점', 120);
INSERT INTO 부서_91 VALUES(130, '중국지사', 100);
INSERT INTO 부서_91 VALUES(131, '베이징지점', 130);
INSERT INTO 부서_91 VALUES(132, '상하이지점', 130);
INSERT INTO 부서_91 VALUES(200, '남유럽지부', NULL);
INSERT INTO 부서_91 VALUES(210, '스페인지사', 200);
INSERT INTO 부서_91 VALUES(211, '마드리드지점', 210);
INSERT INTO 부서_91 VALUES(212, '그라나다지점', 210);
INSERT INTO 부서_91 VALUES(220, '포루투갈지사', 200);
INSERT INTO 부서_91 VALUES(221, '리스본지점', 220);
INSERT INTO 부서_91 VALUES(222, '그라나다지점', 220);

COMMIT;

-- 매출 테이블
DROP TABLE 매출_91;
CREATE TABLE 매출_91(
부서코드 VARCHAR2(20),
매출액 NUMBER(20));

INSERT INTO 매출_91 VALUES(111,1000);
INSERT INTO 매출_91 VALUES(112,2000);
INSERT INTO 매출_91 VALUES(121,1500);
INSERT INTO 매출_91 VALUES(122,1000);
INSERT INTO 매출_91 VALUES(131,1500);
INSERT INTO 매출_91 VALUES(132,2000);
INSERT INTO 매출_91 VALUES(211,2000);
INSERT INTO 매출_91 VALUES(212,1500);
INSERT INTO 매출_91 VALUES(221,1000);
INSERT INTO 매출_91 VALUES(222,2000);
COMMIT;

SELECT * FROM 부서_91;
SELECT * FROM 매출_91;

    

-- 보기 1번

SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    START WITH 부서코드 = '120'
    CONNECT BY PRIOR 상위부서코드 = 부서코드
    ;
    
SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    START WITH 부서코드 = '120'
    CONNECT BY 상위부서코드 = PRIOR 부서코드;
    
    
SELECT A.부서코드, A.부서명, A.상위부서코드, B.매출액, LVL
FROM (
    SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    START WITH 부서코드 = '120'
    CONNECT BY PRIOR 상위부서코드 = 부서코드
    UNION
    SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    START WITH 부서코드 = '120'
    CONNECT BY 상위부서코드 = PRIOR 부서코드) 
    A LEFT OUTER JOIN 매출_91 B
ON (A.부서코드 = B.부서코드)
ORDER BY A.부서코드;

-- 보기 2번
SELECT A.부서코드, A.부서명, A.상위부서코드, B.매출액, LVL
FROM (
    SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    START WITH 부서코드 = '100'
    CONNECT BY 상위부서코드 = PRIOR 부서코드
    )
    A LEFT OUTER JOIN 매출_91 B
ON (A.부서코드 = B.부서코드)
ORDER BY A.부서코드;

-- 보기 3번
SELECT A.부서코드, A.부서명, A.상위부서코드, B.매출액, LVL
FROM (
    SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    START WITH 부서코드 = '121'
    CONNECT BY PRIOR 상위부서코드 = 부서코드)
    A LEFT OUTER JOIN 매출_91 B
ON (A.부서코드 = B.부서코드)
ORDER BY A.부서코드;

-- 보기 4번

SELECT 부서코드 FROM 부서_91
    WHERE 상위부서코드 IS NULL 
    START WITH 부서코드 = '120'
    CONNECT BY PRIOR 상위부서코드 = 부서코드
    ;
    
SELECT A.부서코드, A.부서명, A.상위부서코드, B.매출액, LVL
FROM (
    SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    
    START WITH 부서코드 = (SELECT 부서코드 FROM 부서_91
    WHERE 상위부서코드 IS NULL 
    START WITH 부서코드 = '120'
    CONNECT BY PRIOR 상위부서코드 = 부서코드)
    
    CONNECT BY 상위부서코드 = PRIOR 부서코드)
    A LEFT OUTER JOIN 매출_91 B
    ON (A.부서코드 = B.부서코드)
    ORDER BY A.부서코드;


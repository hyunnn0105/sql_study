

-- 101번

CREATE TABLE 품질평가항목_101 (
    평가항목ID CHAR(7)
    , 평가항목명 VARCHAR2(50)
    , CONSTRAINT 품질평가항목_101_PK PRIMARY KEY (평가항목ID)
);

CREATE TABLE 평가대상상품_101 (
    상품ID CHAR(7)
    , 상품명 VARCHAR2(50)
    , CONSTRAINT 평가대상상품_101_PK PRIMARY KEY (상품ID)
);

CREATE TABLE 평가결과_101 (
    상품ID CHAR(7)
    , 평가회차 NUMBER
    , 평가항목ID CHAR(7)
    , 평가등급 CHAR(1)
    , 평가일자 CHAR(8)
    , CONSTRAINT 평가결과_101_PK PRIMARY KEY (상품ID, 평가회차, 평가항목ID)
);

INSERT INTO 품질평가항목_101 VALUES ('101', '강의자료');
INSERT INTO 품질평가항목_101 VALUES ('102', '기관시설');

INSERT INTO 평가대상상품_101 VALUES ('101', '자바수업');
INSERT INTO 평가대상상품_101 VALUES ('102', '파이썬수업');

INSERT INTO 평가결과_101 VALUES ('101', 1, '101', 'S', '20220629');
INSERT INTO 평가결과_101 VALUES ('101', 2, '101', 'A', '20220629');
INSERT INTO 평가결과_101 VALUES ('101', 3, '101', 'B', '20220629');

INSERT INTO 평가결과_101 VALUES ('101', 1, '102', 'B', '20220629');
INSERT INTO 평가결과_101 VALUES ('101', 2, '102', 'A', '20220629');
INSERT INTO 평가결과_101 VALUES ('101', 3, '102', 'S', '20220629');

INSERT INTO 평가결과_101 VALUES ('102', 1, '101', 'S', '20220629');
INSERT INTO 평가결과_101 VALUES ('102', 2, '101', 'A', '20220629');
INSERT INTO 평가결과_101 VALUES ('102', 3, '101', 'B', '20220629');

INSERT INTO 평가결과_101 VALUES ('102', 1, '102', 'B', '20220629');
INSERT INTO 평가결과_101 VALUES ('102', 2, '102', 'A', '20220629');
INSERT INTO 평가결과_101 VALUES ('102', 3, '102', 'S', '20220629');
INSERT INTO 평가결과_101 VALUES ('102', 4, '102', 'C', '20220629');

COMMIT;

SELECT * FROM 품질평가항목_101;
SELECT * FROM 평가대상상품_101;
SELECT * FROM 평가결과_101;


-- 보기1 (A랑 B 조인-> C도 조인)

--SELECT
--    B.상품ID, B.상품명, C.평가항목ID ,A.평가회차 ,A.평가등급 ,A.평가일자
--FROM A.평가등급 ,A.평가일자
--where 
--    B.상품ID, B.상품명, C.평가항목ID ,A.평가회차 ,A.평가등급 ,A.평가일자

-- 테이블 복사
    
--    SELECT
--        emp_no, emp_nm, emp_
--    FROM tb_emp
    
-- 
CREATE VIEW tb_emp_view
AS
SELECT emp_no, emp_nm,addr , dept_cd
FROM tb_emp;

SELECT
    * FROM tb_emp_view
; 

-- 뷰에서 삭제가 이루어져도 원본 데이터는 영향XXX


-- GROUP BY절에 쓸 수 있는 그룹핑 함수

-- 1. ROLLUP( col_a, col_b)
-- : col_a로 그룹바이해서 통계, col_a + col_g를 합쳐서 그룹바이 통계, 전체 통계

-- 2. CUBE(col_a, col_b)
-- : col_a로 그룹바이 통계, col_b 그룹바이 통계, col_a + col_b 통계, 전체 통계

-- 3. GROUPING SETS ( col_a, col_b )
-- :  col_a로 통계,   col_b로 통계

--  *  SELECT절에 쓰는 GROUPING함수
--     :  함수의 인자값이 null이면 1리턴, 아니면 0리턴
--         ex )  GROUPING( manager_id )   =>   manager_id가 null이면 1리턴


SELECT 
    emp_no, pay_de
FROM tb_sal_his
;
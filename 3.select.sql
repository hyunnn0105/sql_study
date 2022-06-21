
-- SELECT 기본

SELECT 
    emp_no, emp_nm
FROM tb_emp;
-- 뒤에서 부터 읽기 tb_emp부터 emp_no랑 emp_nm을 선택

SELECT
    certi_cd, certi_nm
FROM tb_certi;

-- '*은 모든 칼럼 조회'
SELECT
    *
FROM tb_dept;

-- 조회할 때 위치를 바꿔서 나옴
SELECT
    emp_nm, emp_no
FROM tb_emp;

-- distinct : 중복값을 제외하고 조회
SELECT DISTINCT
    issue_insti_nm 
FROM tb_certi;

-- 컬럼이 2개가 들어간다면 두개의 조건이 둘 다 동일해야 사라짐
SELECT DISTINCT
    certi_nm, issue_insti_nm
FROM tb_certi;


--- 열 별칭 (column aliaas) 지정 : AS는 항상 생략가능
-- 띄어쓰기를 사용한다면 "" 쌍따옴표 사용하기

SELECT
    certi_cd AS "자격증코드"
    , certi_nm AS 자격증명
    , issue_insti_nm 발급기관명
FROM tb_certi; 


-- 문자열 결합 연산자 '||' like java + 
-- ex) SQLD (100002) - 한국데이터진흥원
SELECT
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "자격증 정보"
FROM tb_certi;


-- 더미 테이블 (dual) : 단순 연산결과를 조회할 때 사용
SELECT 
    3 *7 AS "연산결과"
FROM DUAL;

SELECT 
    SYSDATE as "현재 날짜"
FROM DUAL;

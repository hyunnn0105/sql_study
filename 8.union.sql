-- 집합 연산자
-- ## UNION
-- 1. 합집합 연산의 의미입니다.
-- 2. 첫번째 쿼리와 두번째 쿼리의 중복정보는 한번만 보여줍니다.
-- ** 3. 첫번째 쿼리의 열의 개수와 타입이 두번째 쿼리의 열수와 타입과 동일해야 함.
-- ** 4. 자동으로 정렬이 일어남 (첫번째 컬럼 오름차가 기본값)

SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19600101' and '196912231'
UNION
SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19700101' and '197912231'
;

SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19600101' and '196912231'
UNION
SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19700101' and '197912231'
;


--


SELECT
    emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19600101' and '196912231'
UNION
SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19700101' and '197912231'
;

-- 중복삭제(이관심), 첫번째 컬럼(이름) 오름차 정렬

SELECT
    emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19600101' and '196912231'
UNION
SELECT
    emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19700101' and '197912231'
;

-- 별칭을 설정하면 위에있는 별칭 적용

SELECT
    emp_nm EN, birth_de BD
FROM tb_emp
WHERE birth_de between '19600101' and '196912231'
UNION
SELECT
    emp_nm EN2, birth_de BD2
FROM tb_emp
WHERE birth_de between '19700101' and '197912231'
;


-- union이 끝난 다음에 orderby

SELECT
    emp_nm EN, birth_de BD
FROM tb_emp
WHERE birth_de between '19600101' and '196912231'
UNION
SELECT
    emp_nm EN2, birth_de BD2
FROM tb_emp
WHERE birth_de between '19700101' and '197912231'
ORDER BY BD DESC
;

-- ## UNION ALL
-- 1. UNION과 같이 두 테이블로 수직으로 합쳐서 보여줍니다.
-- 2. UNION과는 달리 중복된 데이터도 한번 더 보여줍니다.
-- 3. 자동 정렬 기능을 지원하지 않아 성능상 유리합니다.

SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19600101' and '196912231'
UNION ALL
SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de between '19700101' and '197912231'
;


SELECT
    emp_nm EN, birth_de BD
FROM tb_emp
WHERE birth_de between '19600101' and '196912231'
UNION ALL
SELECT
    emp_nm EN2, birth_de BD2
FROM tb_emp
WHERE birth_de between '19700101' and '197912231'
;

-- ## INTERSECT
-- 1. 첫번째 쿼리와 두번째 쿼리에서 중복된 행만을 출력합니다.
-- 2. 교집합의 의미입니다.

SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE C.certi_nm = 'SQLD'
INTERSECT
SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%용인%';


SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%용인%'
    AND C.certi_nm = 'SQLD'
;

-- ## MINUS(EXCEPT) 
-- 1. 두번째 쿼리에는 없고 첫번째 쿼리에만 있는 데이터를 보여줍니다.
-- 2. 차집합의 개념입니다.

SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100001'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100004'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE sex_cd = '1'
;

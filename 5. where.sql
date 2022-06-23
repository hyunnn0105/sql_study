
-- < where 조건절 > 
-- : 조회 결과 행을 제한하는 조건절


SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
-- '='는 동일하다
WHERE sex_cd = 2
;

-- PK로 WHERE절 동등조건을 만들면 반드시 단일행이 조회된다.
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
-- '='는 동일하다
WHERE emp_no = 1000000003
;

-- < 비교연산자 >
-- 1990년대 생 조회
SELECT
    emp_no, emp_nm, birth_de, tel_no 
FROM tb_emp
WHERE birth_de >= '19900101'
    AND birth_de <= '19991231';

-- BETWEEN 연산자 : A와 B사이
SELECT
    emp_no, emp_nm, birth_de, tel_no 
FROM tb_emp
WHERE birth_de between '19900101' AND '19991231';

-- or 연산 (plus)
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
    OR dept_cd = '100006'
;

-- IN 연산 (or)
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd IN ('100004', '100006')
;

-- 특정부서 빼고 조회하기
-- NOT IN 연산 (or)
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN ('100004', '100006')
;

-- Like 연산자
-- 검색시에 자주사용하는 연산자
-- 와일드 카드 맵핑 (% : 0글자 이상, _ : 단 1글자만)
SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '이__';
-- WHERE emp_nm LIKE '이__';
-- 언더바 하나 = 성 이씨 + 외자 / 두개 이씨 + 이름 두자리
-- WHERE emp_nm LIKE '이%';
-- 이로 시작하는 사람(글자 범위 제한 없이) 검색

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '%심';
-- WHERE emp_nm LIKE '%심';
-- 이름 끝글자가 심

-- 주소가 용인인 사람들 찾기
-- '%용인%'이렇게 쓰면 주소에서 용인이 처음/끝에있던 위치 상관XX
SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%용인%';


-- 성씨가 김씨이면서, 부서가 100003, 100004, 100006번 중에 하나이면서, 
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회 (김호영)

SELECT
    emp_no, emp_nm, birth_de ,dept_cd
FROM tb_emp
-- WHERE 뒤에 무조건 만족하는 조건두기 => 조건 수정하기 편함
WHERE 1=1 
AND emp_nm Like '김%'
    AND dept_cd IN ('100003', '100004', '100006')
        AND birth_de BETWEEN '19900101' AND '19991231'
        ;
        -- 세미콜론은 식 아래에 적기 => 조건 수정하기 편함


-- 부정 일치 비교 연산자(not equal) != , ^= , <>, NOT 
-- 성별이 여자가 아닌사람
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd != 2
;

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd ^= 2
;

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd <> 2
;

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE NOT sex_cd = 2
;

-- 성별코드가 1이 아니면서 성씨가 이씨가 아닌 사람들의
-- 사번, 이름, 성별코드를 조회하세요.

SELECT
    emp_no, emp_nm, sex_cd
FROM tb_emp
WHERE sex_cd <> 1
    AND emp_nm not Like '이%'
;

-- ** null 값 조회 : 반즈시 is null 연산자로 조회
-- 반대 is not null
-- 상사가 없는 김회장 조회
SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no is not null
;

-- 연산자 우선순위 : not > and > or
-- 사원정보중에 김씨이면서 수원 또는 일산에 사는 사원들의 정보 조회
-- 우선순위때문에 ()로 묶어주기
SELECT
    emp_no
    , emp_nm
    , addr
from tb_emp
WHERE 1=1
    And emp_nm like '김%'
    and (addr LIKE '%수원%' or addr LIKE '%일산%')
;
-- sdfwe
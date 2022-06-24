
-- 사원들의 사번, 이름, 주소, 부서명
SELECT
    E.emp_no, E.emp_nm, E.addr, d.dept_nm
FROM tb_emp E
JOIN tb_dept D
ON e.dept_cd = d.dept_cd
;

-- 조인 기초 테스트 데이터
-- 게시글 테이블
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);

-- 댓글 테이블
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, 'ㄱㄱㄱ', 1);
INSERT INTO TEST_B  VALUES (2, 'ㄴㄴㄴ', 1);
INSERT INTO TEST_B  VALUES (3, 'ㄷㄷㄷ', 2);
INSERT INTO TEST_B  VALUES (4, 'ㄹㄹㄹ', 3);
COMMIT;

SELECT * FROM test_a;
SELECT * FROM test_b;

-- from 절에 ,로 연결하기ㅣㅣㅣㅣㅣㅣ
SELECT
    * FROM test_a, test_b;
-- cross join : 카테시안 곱
-- catesiob
 -- 별칭도 가능
 -- CROSS JOIN, 카테시안 곱
SELECT 
    *
FROM test_a, test_b
;

-- INNER JOIN (EQUI JOIN의 한 종류)
SELECT 
    *
FROM test_a, test_b
WHERE test_a.id = test_b.a_id -- 조인 조건
;

SELECT 
    test_a.id, test_a.content, test_b.reply
FROM test_a, test_b
WHERE test_a.id = test_b.a_id 
;

SELECT 
    A.id, A.content, B.reply
FROM test_a A, test_b B
WHERE A.id = B.a_id 
;




-- 자격증 관련 테이블
SELECT
    * FROM tb_emp;
SELECT
    * FROM tb_emp_certi;
SELECT
    * FROM tb_certi;
    
 -- 사원의 사원번호와 취득 자격증명 조회
SELECT
    A.emp_no, B.certi_nm 
FROM tb_emp_certi A, tb_certi B
WHERE a.certi_cd = B.certi_cd
ORDER BY A.emp_no, B.certi_cd
;   

-- 사원의 사원번호와 사원이름과 취득 자격증명을 조회 - 3개 조회
SELECT
    A.emp_no, c.emp_nm, B.certi_nm 
FROM tb_emp_certi A, tb_certi B, tb_emp C
WHERE a.certi_cd = B.certi_cd
    And a.emp_no = c.emp_no
ORDER BY A.emp_no, B.certi_cd
; 

-- 사원의 사원번호와 사원이름과 부서이름과 취득 자격증명을 조회
SELECT
    A.emp_no, c.emp_nm, D.dept_cd , B.certi_nm 
FROM tb_emp_certi A, tb_certi B, tb_emp C, tb_dept D
WHERE a.certi_cd = B.certi_cd
    And a.emp_no = c.emp_no
    And C.dept_cd = d.dept_cd
ORDER BY A.emp_no, B.certi_cd
; 

-- dept 부서 from에 추가 ,where and에 코드가져오는 조건추가 ,group 추가
SELECT
   b.dept_cd, c.dept_nm , Count(a.certi_cd) "부서별 자격증 수" 
FROM tb_emp_certi A, tb_emp B, tb_dept c
Where A.emp_no = B.emp_no
    and B.dept_cd = c.dept_cd
GROUP BY b.dept_cd, c.dept_nm
ORDER BY b.dept_cd
;

-- inner join
-- 2개이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법
-- WHERE 절에 사용된 컬럼들이 동등연산자에 의해 조인됨

-- 용인시에 사느 사원의 사원번호, 사원명, 주소, 부서코드, 부서명 조회
SELECT 
    a.emp_no, a.emp_nm , a.addr, a.dept_cd
FROM tb_emp A, tb_dept B
WHERE a.addr Like '%용인%'
    and a.dept_cd = b.dept_cd
    and a.emp_nm like '김%'
Order by A.emp_no
;

-- join on (ansi 표준 조인)
-- from절 뒤, where절 앞
-- 2. 조안 키원드 뒤에는 조인 테이블명을 명시
-- 3. 온 키워드 뒤에는 조인 조건을 명시
-- 4. 조인조건서술부(ON절) 일반조건 서술부를 분리해서 작성하는 방법
-- 5. ON절을 이용하려면 JOIN 이후의 논리연산이란 서브쿼리같은 추가 서술이 가능

SELECT
  A.emp_no, A.emp_nm, A.addr, A.dept_cd, B.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE A.addr LIKE '%용인%'
    AND A.emp_nm LIKE '김%'
ORDER BY A.emp_no
;


-- 1980년대생 사원들의 사번, 사원명, 부서명, 자격증명, 취득일자를 조회
SELECT
    E.emp_no, E.emp_nm, D.dept_nm, C.certi_nm, EC.acqu_de
FROM tb_emp E, tb_dept D, tb_emp_certi EC, tb_certi C
WHERE E.dept_cd = D.dept_cd
    AND EC.certi_cd = C.certi_cd
    AND E.emp_no = EC.emp_no
    AND E.birth_de BETWEEN '19800101' AND '19891231'
;
    
    
SELECT
    E.emp_no, E.emp_nm, E.birth_de, D.dept_nm, C.certi_nm, EC.acqu_de
FROM tb_emp E 
JOIN tb_dept D 
ON E.dept_cd = D.dept_cd
JOIN tb_emp_certi EC 
ON E.emp_no = EC.emp_no
JOIN tb_certi C
ON EC.certi_cd = C.certi_cd
WHERE E.birth_de BETWEEN '19800101' AND '19891231'
;


-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];


-- join on 구문으로 카테시안 곱 만들기
SELECT
    *
FROM test_a , test_b
;

-- non if 조인

SELECT
    *
FROM test_a
CROSS JOIN test_b
;

-- natural JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동으로 조인조건을 생성하는 기법
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 이너조인을 수행합니다
-- 3. 이때조인되는 동일 이름의 칼럼은 데이터 타입이 같아야하며,
--   ALIAS나 테이블명을 자동 조인 컬럼 앞에 표기하면 안됩니다.
-- 4. SELECT * 문법을 사용하면, 공통 칼럼은 집합에서 한번만 표기됨
-- 5. 공통 컬럼이 n개 이상이면 조인 조건이 n개로 처리된다

-- 사원테이블과 부서테이블을 조인(사번, 사원명, 부서코드, 부서명)

SELECT
    a.emp_no, a.emp_nm, b.dept_cd, b.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

-- NATURAL JOIN 'b.' 이런거생략하기

SELECT
    a.emp_no, a.emp_nm, dept_cd, b.dept_nm
FROM tb_emp A
NATURAL JOIN tb_dept B
;


-- using절 조인
-- 1. NATURAL 조인에서는 자동으로 이름과 타입이 일치하는 모든 컬럼에 대해 조인이 일어나지만
--    USING을 사용하면 원하는 컬럼에 대해서면 선택적 조인조건을 부여힐 수 있습니당
-- 2. USING절에서도 조인 칼럼에대해 ALIAS나 테이블명 표기X

SELECT
    a.emp_no, a.emp_nm, dept_cd, b.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
USING (dept_cd)
;

SELECT
    *
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

SELECT 
    *
FROM tb_emp A
INNER JOIN tb_dept B
USING (dept_cd)
;








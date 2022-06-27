
-- 계층형 쿼리
-- start with : 계층의 첫 단계를 어디서 시작할지에 대한 조건
-- connect by prior 자식 => 부모 -> 순방향탐색
-- connect by 자식 => prior 부모 -> 역방향탐색
-- order siblings by : 같은 레벨끼리의 정렬을 정함


SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
START WITH A.direct_manager_emp_no IS NULL
CONNECT BY PRIOR A.emp_no = A.direct_manager_emp_no
;
-- 오류는 있지만 실행 잘됨




SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    a.direct_manager_emp_no
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
START WITH A.emp_no = '1000000037'
CONNECT BY A.emp_no = PRIOR A.direct_manager_emp_no
;


-- 


SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
START WITH A.direct_manager_emp_no IS NULL
CONNECT BY A.emp_no = PRIOR A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no DESC
;


-- SELF JOIn
-- 1. 하나의 테이블에서 자기자신의 테이블끼리 조인하는 기법입니다
-- 2. 자기 자신의 태이블에서 pk와 p로 동등조인한다

SELECT
    A.emp_no, A.emp_nm, A.direct_manager_emp_no, B.emp_nm
FROM tb_emp A
INNER JOIN tb_emp B
on a.direct_manager_emp_no = b.emp_no
ORDER BY emp_no
;

-- lEFT JOIN tb_emp B을 한다면 직속상사가 없는 사람들도 등장함
SELECT
    A.emp_no
    , A.emp_nm "사원명" 
    , A.direct_manager_emp_no
    , B.emp_nm "직속상사의 이름"
    , B.addr
FROM tb_emp A
INNER JOIN tb_emp B
on a.direct_manager_emp_no = b.emp_no
ORDER BY emp_no
;

-- 제약조건은 방어장치이다
-- 셀프 참조 등록 : fk_dm_emp_no 이름 마음대로 설정 가능

-- ALTER TABLE tb_emp(바꿀 칼럼? 설정할 칼럼?)
-- ADD CONSTRAINT 이름설정
-- foreign key (연결할 pk)
-- REFERENCES 테이블명(pk 걸위치);

ALTER TABLE tb_emp
ADD CONSTRAINT fk_dm_emp_no
foreign key (direct_manager_emp_no)
REFERENCES tb_emp(emp_no)
;






-- GROUP BY, HAVING

-- 집계 함수 (다중행 함수)
-- : 여러행을 묶어서 함수를 적용
SELECT * FROM tb_sal_his
-- 그룹화 전처리
WHERE pay_de BETWEEN '20190101' and '20191231'
ORDER by emp_no, pay_DE
;

SELECT * FROM tb_sal_his
WHERE emp_no  = '1000000005'
;

-- 단일행 함수 : 모두에게 하나씩 적용함 => from의 행수만큼 적용 + 출력됨
-- 단일열???
SELECT
    SUBSTR(emp_nm,1,1) 성씨
FROM tb_emp
;

-- 다중행 함수 - 다중열?
--GROUP BY로 소그룹화 하지 않으면 집계함수는 전체 행수를 기준으로 집계한다.
SELECT
    SUM(pay_amt) "지급총액"
    , AVG(pay_amt) "평균 지급액"
    , count(pay_amt) "지급 횟수"
FROM tb_sal_his
;

SELECT
    * FROM tb_emp
;

SELECT
    COUNT(emp_no) as "총사원수"
    , COUNT(direct_manager_emp_no) AS "상사번호"
    , COUNT(*) as 전부
    -- count 함수는 컬럼이나 표현식에서 null이 나오면 집계를 하지않음
    -- COUNT(*)는 select from해서 나오는 모든 표현식을 다 셈(null도 센당)
    , MIN(birth_de) "최연장자의 생일"
    , MIN(birth_de) "최연소자의 생일"
FROM tb_emp
;

--GROUO BY : 지정된 컬럼으로 소그룹화 한 후 집계함수 적용
-- 부서별로 가장 어린사람의 생일, 연장자의 생일 부서별 총 사원수를 조회

SELECT * FROM tb_emp
ORDER BY dept_cd
;

SELECT
    -- gropby에서 사용한 컬럼음 바로 사용할 수 있다
    dept_cd,
    MAX(birth_de) as 최연소자
    , MIN (birth_de) as 최연장자
    ,count(emp_no)
FROM tb_emp
GROUP BY dept_cd
;

-- 사원별 누적 급여수령액 조회
SELECT
    emp_no "사번"
    , SUM(pay_amt) 누적수령액
FROM tb_sal_his
-- 웨어랑 오더 전에 그룹바이
GROUP By emp_no
ORDER BY emp_no
;

-- 사원별로 급여를 제일 많이 받았을때, 제일 적게받았을때, 평균적으로 얼마 받았는지 조회
SELECT
    emp_no "사번"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') 최고수령액
        , TO_CHAR(MIN(pay_amt), 'L999,999,999') 최저수령액
        , TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99') 평균수령액
        -- , ROUND((pay_amt),2) 통계를 낸 후(집계가 끝난) 조회하는건 가능
FROM tb_sal_his
GROUP By emp_no
ORDER BY emp_no
;

-- 사원별로 2019년 급여를 제일 많이 받았을때, 제일 적게받았을때, 평균적으로 얼마 받았는지 조회
-- 평균급여가 450만원 이상인 사람들만 조회
SELECT
    emp_no "사번"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') 최고수령액
        , TO_CHAR(MIN(pay_amt), 'L999,999,999') 최저수령액
        , TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99') 평균수령액
        , TO_CHAR(SUM(pay_amt), 'L999,999,999') 연봉
        -- , ROUND((pay_amt),2) 통계를 낸 후(집계가 끝난) 조회하는건 가능
FROM tb_sal_his
where pay_de BETWEEN '20190101' AND '20191231'
GROUP By emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;



-- ==================================================================================================

-- having : 그룹화 된 결과에서 조건을 걸어 행수를 제한

-- 부서별로 가장 어린사람의 생일, 연장자의 생년월일, 부서별 총 사원수를 조회
-- 그런데 부서별 사원이 한명인 부서의 정보는 조회하고 싶지 않음
SELECT
    dept_cd,
    MAX(birth_de) as 최연소자
    , MIN (birth_de) as 최연장자
    , COUNT (emp_no) as 직원수
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT (emp_no) > 1
ORDER BY dept_cd
;




-- 사원별로 급여를 제일 많이 받았을때, 제일 적게받았을때, 평균적으로 얼마 받았는지 조회
SELECT
    emp_no "사번"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') 최고수령액
        , TO_CHAR(MIN(pay_amt), 'L999,999,999') 최저수령액
        , TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99') 평균수령액
        -- , ROUND((pay_amt),2) 통계를 낸 후(집계가 끝난) 조회하는건 가능
FROM tb_sal_his
GROUP By emp_no
ORDER BY emp_no
;


-- 사원별로 2019년 평균 수령액이 450만원 이상인 사원의 사원번호와 2019년 연봉 조회 

SELECT
    emp_no "사번"
        , TO_CHAR(SUM(pay_amt), 'L999,999,999') 연봉
FROM tb_sal_his
where pay_de BETWEEN '20190101' AND '20191231'
GROUP By emp_no
HAVING AVG(pay_amt) >= 4500000
;

-- 이거 이상함**
SELECT
    emp_no
    ,sex_cd
    , dept_cd
FROM tb_emp
Group by dept_cd, sex_cd
ORDER BY dept_cd, sex_cd
;

-- ORDER BY : 정렬
-- ASC : 오름차 정렬(기본값),  DESC : 내림차 정렬
-- SELECT절의 맨 마지막의 위치

SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm
;

SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, 1 DESC
-- order by가 항상 피니쉬
;


SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;









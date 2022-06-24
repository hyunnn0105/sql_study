
 -- 1. emp 테이블과 dept 테이블을 inner join 하여
 -- 사번, first_name, last_name, department_id, department_name을 조회하세요
 -- but 부서 null인 사람은 조회 안됨
SELECT
    e.employee_id , e.first_name, e.last_name, e.department_id, dep.department_name
FROM employees E
inner JOIN departments dep
on e.department_id = dep.department_id
ORDER BY e.employee_id
; 
 
 -- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
-- 동일한 칼럼이 2개여서 인출된 행이 32건이됨
SELECT
    e.employee_id , e.first_name, e.last_name
    , department_id, dep.department_name
FROM employees E
NATURAL JOIN departments dep
ORDER BY e.employee_id
; 

-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    e.employee_id , e.first_name, e.last_name,department_id, dep.department_name
FROM employees E
INNER JOIN departments dep
USING (department_id)
ORDER BY e.employee_id
; 

-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
SELECT
    e.employee_id , e.first_name,dep.department_name 
    , lo.city
FROM employees E
inner JOIN departments dep
on e.department_id = dep.department_id
inner JOIN locations lo
on dep.location_id = lo.location_id
ORDER BY e.employee_id
; 


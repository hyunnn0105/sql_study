
 -- 1. emp ���̺�� dept ���̺��� inner join �Ͽ�
 -- ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���
 -- but �μ� null�� ����� ��ȸ �ȵ�
SELECT
    e.employee_id , e.first_name, e.last_name, e.department_id, dep.department_name
FROM employees E
inner JOIN departments dep
on e.department_id = dep.department_id
ORDER BY e.employee_id
; 
 
 -- 2. employees���̺�� departments���̺��� natural join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
-- ������ Į���� 2������ ����� ���� 32���̵�
SELECT
    e.employee_id , e.first_name, e.last_name
    , department_id, dep.department_name
FROM employees E
NATURAL JOIN departments dep
ORDER BY e.employee_id
; 

-- 3. employees���̺�� departments���̺��� using���� ����Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    e.employee_id , e.first_name, e.last_name,department_id, dep.department_name
FROM employees E
INNER JOIN departments dep
USING (department_id)
ORDER BY e.employee_id
; 

-- 4. employees���̺�� departments���̺�� locations ���̺��� 
--    join�Ͽ� employee_id, first_name, department_name, city�� ��ȸ�ϼ���
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


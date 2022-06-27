-- ���� ������
-- ## UNION
-- 1. ������ ������ �ǹ��Դϴ�.
-- 2. ù��° ������ �ι�° ������ �ߺ������� �ѹ��� �����ݴϴ�.
-- ** 3. ù��° ������ ���� ������ Ÿ���� �ι�° ������ ������ Ÿ�԰� �����ؾ� ��.
-- ** 4. �ڵ����� ������ �Ͼ (ù��° �÷� �������� �⺻��)

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

-- �ߺ�����(�̰���), ù��° �÷�(�̸�) ������ ����

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

-- ��Ī�� �����ϸ� �����ִ� ��Ī ����

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


-- union�� ���� ������ orderby

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
-- 1. UNION�� ���� �� ���̺�� �������� ���ļ� �����ݴϴ�.
-- 2. UNION���� �޸� �ߺ��� �����͵� �ѹ� �� �����ݴϴ�.
-- 3. �ڵ� ���� ����� �������� �ʾ� ���ɻ� �����մϴ�.

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
-- 1. ù��° ������ �ι�° �������� �ߺ��� �ุ�� ����մϴ�.
-- 2. �������� �ǹ��Դϴ�.

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
WHERE A.addr LIKE '%����%';


SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%����%'
    AND C.certi_nm = 'SQLD'
;

-- ## MINUS(EXCEPT) 
-- 1. �ι�° �������� ���� ù��° �������� �ִ� �����͸� �����ݴϴ�.
-- 2. �������� �����Դϴ�.

SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100001'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100004'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE sex_cd = '1'
;

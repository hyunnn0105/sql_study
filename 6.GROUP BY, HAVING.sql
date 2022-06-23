-- GROUP BY, HAVING

-- ���� �Լ� (������ �Լ�)
-- : �������� ��� �Լ��� ����
SELECT * FROM tb_sal_his
-- �׷�ȭ ��ó��
WHERE pay_de BETWEEN '20190101' and '20191231'
ORDER by emp_no, pay_DE
;

SELECT * FROM tb_sal_his
WHERE emp_no  = '1000000005'
;

-- ������ �Լ� : ��ο��� �ϳ��� ������ => from�� �����ŭ ���� + ��µ�
-- ���Ͽ�???
SELECT
    SUBSTR(emp_nm,1,1) ����
FROM tb_emp
;

-- ������ �Լ� - ���߿�?
--GROUP BY�� �ұ׷�ȭ ���� ������ �����Լ��� ��ü ����� �������� �����Ѵ�.
SELECT
    SUM(pay_amt) "�����Ѿ�"
    , AVG(pay_amt) "��� ���޾�"
    , count(pay_amt) "���� Ƚ��"
FROM tb_sal_his
;

SELECT
    * FROM tb_emp
;

SELECT
    COUNT(emp_no) as "�ѻ����"
    , COUNT(direct_manager_emp_no) AS "����ȣ"
    , COUNT(*) as ����
    -- count �Լ��� �÷��̳� ǥ���Ŀ��� null�� ������ ���踦 ��������
    -- COUNT(*)�� select from�ؼ� ������ ��� ǥ������ �� ��(null�� ����)
    , MIN(birth_de) "�ֿ������� ����"
    , MIN(birth_de) "�ֿ������� ����"
FROM tb_emp
;

--GROUO BY : ������ �÷����� �ұ׷�ȭ �� �� �����Լ� ����
-- �μ����� ���� ������ ����, �������� ���� �μ��� �� ������� ��ȸ

SELECT * FROM tb_emp
ORDER BY dept_cd
;

SELECT
    -- gropby���� ����� �÷��� �ٷ� ����� �� �ִ�
    dept_cd,
    MAX(birth_de) as �ֿ�����
    , MIN (birth_de) as �ֿ�����
    ,count(emp_no)
FROM tb_emp
GROUP BY dept_cd
;

-- ����� ���� �޿����ɾ� ��ȸ
SELECT
    emp_no "���"
    , SUM(pay_amt) �������ɾ�
FROM tb_sal_his
-- ����� ���� ���� �׷����
GROUP By emp_no
ORDER BY emp_no
;

-- ������� �޿��� ���� ���� �޾�����, ���� ���Թ޾�����, ��������� �� �޾Ҵ��� ��ȸ
SELECT
    emp_no "���"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') �ְ���ɾ�
        , TO_CHAR(MIN(pay_amt), 'L999,999,999') �������ɾ�
        , TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99') ��ռ��ɾ�
        -- , ROUND((pay_amt),2) ��踦 �� ��(���谡 ����) ��ȸ�ϴ°� ����
FROM tb_sal_his
GROUP By emp_no
ORDER BY emp_no
;

-- ������� 2019�� �޿��� ���� ���� �޾�����, ���� ���Թ޾�����, ��������� �� �޾Ҵ��� ��ȸ
-- ��ձ޿��� 450���� �̻��� ����鸸 ��ȸ
SELECT
    emp_no "���"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') �ְ���ɾ�
        , TO_CHAR(MIN(pay_amt), 'L999,999,999') �������ɾ�
        , TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99') ��ռ��ɾ�
        , TO_CHAR(SUM(pay_amt), 'L999,999,999') ����
        -- , ROUND((pay_amt),2) ��踦 �� ��(���谡 ����) ��ȸ�ϴ°� ����
FROM tb_sal_his
where pay_de BETWEEN '20190101' AND '20191231'
GROUP By emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;



-- ==================================================================================================

-- having : �׷�ȭ �� ������� ������ �ɾ� ����� ����

-- �μ����� ���� ������ ����, �������� �������, �μ��� �� ������� ��ȸ
-- �׷��� �μ��� ����� �Ѹ��� �μ��� ������ ��ȸ�ϰ� ���� ����
SELECT
    dept_cd,
    MAX(birth_de) as �ֿ�����
    , MIN (birth_de) as �ֿ�����
    , COUNT (emp_no) as ������
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT (emp_no) > 1
ORDER BY dept_cd
;




-- ������� �޿��� ���� ���� �޾�����, ���� ���Թ޾�����, ��������� �� �޾Ҵ��� ��ȸ
SELECT
    emp_no "���"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') �ְ���ɾ�
        , TO_CHAR(MIN(pay_amt), 'L999,999,999') �������ɾ�
        , TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99') ��ռ��ɾ�
        -- , ROUND((pay_amt),2) ��踦 �� ��(���谡 ����) ��ȸ�ϴ°� ����
FROM tb_sal_his
GROUP By emp_no
ORDER BY emp_no
;


-- ������� 2019�� ��� ���ɾ��� 450���� �̻��� ����� �����ȣ�� 2019�� ���� ��ȸ 

SELECT
    emp_no "���"
        , TO_CHAR(SUM(pay_amt), 'L999,999,999') ����
FROM tb_sal_his
where pay_de BETWEEN '20190101' AND '20191231'
GROUP By emp_no
HAVING AVG(pay_amt) >= 4500000
;

-- �̰� �̻���**
SELECT
    emp_no
    ,sex_cd
    , dept_cd
FROM tb_emp
Group by dept_cd, sex_cd
ORDER BY dept_cd, sex_cd
;

-- ORDER BY : ����
-- ASC : ������ ����(�⺻��),  DESC : ������ ����
-- SELECT���� �� �������� ��ġ

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
-- order by�� �׻� �ǴϽ�
;


SELECT 
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;










-- < where ������ > 
-- : ��ȸ ��� ���� �����ϴ� ������


SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
-- '='�� �����ϴ�
WHERE sex_cd = 2
;

-- PK�� WHERE�� ���������� ����� �ݵ�� �������� ��ȸ�ȴ�.
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
-- '='�� �����ϴ�
WHERE emp_no = 1000000003
;

-- < �񱳿����� >
-- 1990��� �� ��ȸ
SELECT
    emp_no, emp_nm, birth_de, tel_no 
FROM tb_emp
WHERE birth_de >= '19900101'
    AND birth_de <= '19991231';

-- BETWEEN ������ : A�� B����
SELECT
    emp_no, emp_nm, birth_de, tel_no 
FROM tb_emp
WHERE birth_de between '19900101' AND '19991231';

-- or ���� (plus)
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
    OR dept_cd = '100006'
;

-- IN ���� (or)
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd IN ('100004', '100006')
;

-- Ư���μ� ���� ��ȸ�ϱ�
-- NOT IN ���� (or)
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN ('100004', '100006')
;

-- Like ������
-- �˻��ÿ� ���ֻ���ϴ� ������
-- ���ϵ� ī�� ���� (% : 0���� �̻�, _ : �� 1���ڸ�)
SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '��__';
-- WHERE emp_nm LIKE '��__';
-- ����� �ϳ� = �� �̾� + ���� / �ΰ� �̾� + �̸� ���ڸ�
-- WHERE emp_nm LIKE '��%';
-- �̷� �����ϴ� ���(���� ���� ���� ����) �˻�

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '%��';
-- WHERE emp_nm LIKE '%��';
-- �̸� �����ڰ� ��

-- �ּҰ� ������ ����� ã��
-- '%����%'�̷��� ���� �ּҿ��� ������ ó��/�����ִ� ��ġ ���XX
SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%����%';


-- ������ �达�̸鼭, �μ��� 100003, 100004, 100006�� �߿� �ϳ��̸鼭, 
-- 90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ (��ȣ��)

SELECT
    emp_no, emp_nm, birth_de ,dept_cd
FROM tb_emp
-- WHERE �ڿ� ������ �����ϴ� ���ǵα� => ���� �����ϱ� ����
WHERE 1=1 
AND emp_nm Like '��%'
    AND dept_cd IN ('100003', '100004', '100006')
        AND birth_de BETWEEN '19900101' AND '19991231'
        ;
        -- �����ݷ��� �� �Ʒ��� ���� => ���� �����ϱ� ����


-- ���� ��ġ �� ������(not equal) != , ^= , <>, NOT 
-- ������ ���ڰ� �ƴѻ��
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

-- �����ڵ尡 1�� �ƴϸ鼭 ������ �̾��� �ƴ� �������
-- ���, �̸�, �����ڵ带 ��ȸ�ϼ���.

SELECT
    emp_no, emp_nm, sex_cd
FROM tb_emp
WHERE sex_cd <> 1
    AND emp_nm not Like '��%'
;

-- ** null �� ��ȸ : ����� is null �����ڷ� ��ȸ
-- �ݴ� is not null
-- ��簡 ���� ��ȸ�� ��ȸ
SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no is not null
;

-- ������ �켱���� : not > and > or
-- ��������߿� �达�̸鼭 ���� �Ǵ� �ϻ꿡 ��� ������� ���� ��ȸ
-- �켱���������� ()�� �����ֱ�
SELECT
    emp_no
    , emp_nm
    , addr
from tb_emp
WHERE 1=1
    And emp_nm like '��%'
    and (addr LIKE '%����%' or addr LIKE '%�ϻ�%')
;
-- sdfwe
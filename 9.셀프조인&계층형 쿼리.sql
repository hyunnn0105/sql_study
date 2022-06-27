
-- ������ ����
-- start with : ������ ù �ܰ踦 ��� ���������� ���� ����
-- connect by prior �ڽ� => �θ� -> ������Ž��
-- connect by �ڽ� => prior �θ� -> ������Ž��
-- order siblings by : ���� ���������� ������ ����


SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
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
-- ������ ������ ���� �ߵ�




SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
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
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
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
-- 1. �ϳ��� ���̺��� �ڱ��ڽ��� ���̺��� �����ϴ� ����Դϴ�
-- 2. �ڱ� �ڽ��� ���̺��� pk�� p�� ���������Ѵ�

SELECT
    A.emp_no, A.emp_nm, A.direct_manager_emp_no, B.emp_nm
FROM tb_emp A
INNER JOIN tb_emp B
on a.direct_manager_emp_no = b.emp_no
ORDER BY emp_no
;

-- lEFT JOIN tb_emp B�� �Ѵٸ� ���ӻ�簡 ���� ����鵵 ������
SELECT
    A.emp_no
    , A.emp_nm "�����" 
    , A.direct_manager_emp_no
    , B.emp_nm "���ӻ���� �̸�"
    , B.addr
FROM tb_emp A
INNER JOIN tb_emp B
on a.direct_manager_emp_no = b.emp_no
ORDER BY emp_no
;

-- ���������� �����ġ�̴�
-- ���� ���� ��� : fk_dm_emp_no �̸� ������� ���� ����

-- ALTER TABLE tb_emp(�ٲ� Į��? ������ Į��?)
-- ADD CONSTRAINT �̸�����
-- foreign key (������ pk)
-- REFERENCES ���̺��(pk ����ġ);

ALTER TABLE tb_emp
ADD CONSTRAINT fk_dm_emp_no
foreign key (direct_manager_emp_no)
REFERENCES tb_emp(emp_no)
;







-- SELECT �⺻

SELECT 
    emp_no, emp_nm
FROM tb_emp;
-- �ڿ��� ���� �б� tb_emp���� emp_no�� emp_nm�� ����

SELECT
    certi_cd, certi_nm
FROM tb_certi;

-- '*�� ��� Į�� ��ȸ'
SELECT
    *
FROM tb_dept;

-- ��ȸ�� �� ��ġ�� �ٲ㼭 ����
SELECT
    emp_nm, emp_no
FROM tb_emp;

-- distinct : �ߺ����� �����ϰ� ��ȸ
SELECT DISTINCT
    issue_insti_nm 
FROM tb_certi;

-- �÷��� 2���� ���ٸ� �ΰ��� ������ �� �� �����ؾ� �����
SELECT DISTINCT
    certi_nm, issue_insti_nm
FROM tb_certi;


--- �� ��Ī (column aliaas) ���� : AS�� �׻� ��������
-- ���⸦ ����Ѵٸ� "" �ֵ���ǥ ����ϱ�

SELECT
    certi_cd AS "�ڰ����ڵ�"
    , certi_nm AS �ڰ�����
    , issue_insti_nm �߱ޱ����
FROM tb_certi; 


-- ���ڿ� ���� ������ '||' like java + 
-- ex) SQLD (100002) - �ѱ������������
SELECT
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "�ڰ��� ����"
FROM tb_certi;


-- ���� ���̺� (dual) : �ܼ� �������� ��ȸ�� �� ���
SELECT 
    3 *7 AS "������"
FROM DUAL;

SELECT 
    SYSDATE as "���� ��¥"
FROM DUAL;

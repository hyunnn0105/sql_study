

-- 101��

CREATE TABLE ǰ�����׸�_101 (
    ���׸�ID CHAR(7)
    , ���׸�� VARCHAR2(50)
    , CONSTRAINT ǰ�����׸�_101_PK PRIMARY KEY (���׸�ID)
);

CREATE TABLE �򰡴���ǰ_101 (
    ��ǰID CHAR(7)
    , ��ǰ�� VARCHAR2(50)
    , CONSTRAINT �򰡴���ǰ_101_PK PRIMARY KEY (��ǰID)
);

CREATE TABLE �򰡰��_101 (
    ��ǰID CHAR(7)
    , ��ȸ�� NUMBER
    , ���׸�ID CHAR(7)
    , �򰡵�� CHAR(1)
    , ������ CHAR(8)
    , CONSTRAINT �򰡰��_101_PK PRIMARY KEY (��ǰID, ��ȸ��, ���׸�ID)
);

INSERT INTO ǰ�����׸�_101 VALUES ('101', '�����ڷ�');
INSERT INTO ǰ�����׸�_101 VALUES ('102', '����ü�');

INSERT INTO �򰡴���ǰ_101 VALUES ('101', '�ڹټ���');
INSERT INTO �򰡴���ǰ_101 VALUES ('102', '���̽����');

INSERT INTO �򰡰��_101 VALUES ('101', 1, '101', 'S', '20220629');
INSERT INTO �򰡰��_101 VALUES ('101', 2, '101', 'A', '20220629');
INSERT INTO �򰡰��_101 VALUES ('101', 3, '101', 'B', '20220629');

INSERT INTO �򰡰��_101 VALUES ('101', 1, '102', 'B', '20220629');
INSERT INTO �򰡰��_101 VALUES ('101', 2, '102', 'A', '20220629');
INSERT INTO �򰡰��_101 VALUES ('101', 3, '102', 'S', '20220629');

INSERT INTO �򰡰��_101 VALUES ('102', 1, '101', 'S', '20220629');
INSERT INTO �򰡰��_101 VALUES ('102', 2, '101', 'A', '20220629');
INSERT INTO �򰡰��_101 VALUES ('102', 3, '101', 'B', '20220629');

INSERT INTO �򰡰��_101 VALUES ('102', 1, '102', 'B', '20220629');
INSERT INTO �򰡰��_101 VALUES ('102', 2, '102', 'A', '20220629');
INSERT INTO �򰡰��_101 VALUES ('102', 3, '102', 'S', '20220629');
INSERT INTO �򰡰��_101 VALUES ('102', 4, '102', 'C', '20220629');

COMMIT;

SELECT * FROM ǰ�����׸�_101;
SELECT * FROM �򰡴���ǰ_101;
SELECT * FROM �򰡰��_101;


-- ����1 (A�� B ����-> C�� ����)

--SELECT
--    B.��ǰID, B.��ǰ��, C.���׸�ID ,A.��ȸ�� ,A.�򰡵�� ,A.������
--FROM A.�򰡵�� ,A.������
--where 
--    B.��ǰID, B.��ǰ��, C.���׸�ID ,A.��ȸ�� ,A.�򰡵�� ,A.������

-- ���̺� ����
    
--    SELECT
--        emp_no, emp_nm, emp_
--    FROM tb_emp
    
-- 
CREATE VIEW tb_emp_view
AS
SELECT emp_no, emp_nm,addr , dept_cd
FROM tb_emp;

SELECT
    * FROM tb_emp_view
; 

-- �信�� ������ �̷������ ���� �����ʹ� ����XXX


-- GROUP BY���� �� �� �ִ� �׷��� �Լ�

-- 1. ROLLUP( col_a, col_b)
-- : col_a�� �׷�����ؼ� ���, col_a + col_g�� ���ļ� �׷���� ���, ��ü ���

-- 2. CUBE(col_a, col_b)
-- : col_a�� �׷���� ���, col_b �׷���� ���, col_a + col_b ���, ��ü ���

-- 3. GROUPING SETS ( col_a, col_b )
-- :  col_a�� ���,   col_b�� ���

--  *  SELECT���� ���� GROUPING�Լ�
--     :  �Լ��� ���ڰ��� null�̸� 1����, �ƴϸ� 0����
--         ex )  GROUPING( manager_id )   =>   manager_id�� null�̸� 1����


SELECT 
    emp_no, pay_de
FROM tb_sal_his
;
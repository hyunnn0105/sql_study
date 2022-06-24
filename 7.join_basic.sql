
-- ������� ���, �̸�, �ּ�, �μ���
SELECT
    E.emp_no, E.emp_nm, E.addr, d.dept_nm
FROM tb_emp E
JOIN tb_dept D
ON e.dept_cd = d.dept_cd
;

-- ���� ���� �׽�Ʈ ������
-- �Խñ� ���̺�
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);

-- ��� ���̺�
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);
COMMIT;

SELECT * FROM test_a;
SELECT * FROM test_b;

-- from ���� ,�� �����ϱ�ӤӤӤӤӤ�
SELECT
    * FROM test_a, test_b;
-- cross join : ī�׽þ� ��
-- catesiob
 -- ��Ī�� ����
 -- CROSS JOIN, ī�׽þ� ��
SELECT 
    *
FROM test_a, test_b
;

-- INNER JOIN (EQUI JOIN�� �� ����)
SELECT 
    *
FROM test_a, test_b
WHERE test_a.id = test_b.a_id -- ���� ����
;

SELECT 
    test_a.id, test_a.content, test_b.reply
FROM test_a, test_b
WHERE test_a.id = test_b.a_id 
;

SELECT 
    A.id, A.content, B.reply
FROM test_a A, test_b B
WHERE A.id = B.a_id 
;




-- �ڰ��� ���� ���̺�
SELECT
    * FROM tb_emp;
SELECT
    * FROM tb_emp_certi;
SELECT
    * FROM tb_certi;
    
 -- ����� �����ȣ�� ��� �ڰ����� ��ȸ
SELECT
    A.emp_no, B.certi_nm 
FROM tb_emp_certi A, tb_certi B
WHERE a.certi_cd = B.certi_cd
ORDER BY A.emp_no, B.certi_cd
;   

-- ����� �����ȣ�� ����̸��� ��� �ڰ������� ��ȸ - 3�� ��ȸ
SELECT
    A.emp_no, c.emp_nm, B.certi_nm 
FROM tb_emp_certi A, tb_certi B, tb_emp C
WHERE a.certi_cd = B.certi_cd
    And a.emp_no = c.emp_no
ORDER BY A.emp_no, B.certi_cd
; 

-- ����� �����ȣ�� ����̸��� �μ��̸��� ��� �ڰ������� ��ȸ
SELECT
    A.emp_no, c.emp_nm, D.dept_cd , B.certi_nm 
FROM tb_emp_certi A, tb_certi B, tb_emp C, tb_dept D
WHERE a.certi_cd = B.certi_cd
    And a.emp_no = c.emp_no
    And C.dept_cd = d.dept_cd
ORDER BY A.emp_no, B.certi_cd
; 

-- dept �μ� from�� �߰� ,where and�� �ڵ尡������ �����߰� ,group �߰�
SELECT
   b.dept_cd, c.dept_nm , Count(a.certi_cd) "�μ��� �ڰ��� ��" 
FROM tb_emp_certi A, tb_emp B, tb_dept c
Where A.emp_no = B.emp_no
    and B.dept_cd = c.dept_cd
GROUP BY b.dept_cd, c.dept_nm
ORDER BY b.dept_cd
;

-- inner join
-- 2���̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α��
-- WHERE ���� ���� �÷����� ������ڿ� ���� ���ε�

-- ���νÿ� ��� ����� �����ȣ, �����, �ּ�, �μ��ڵ�, �μ��� ��ȸ
SELECT 
    a.emp_no, a.emp_nm , a.addr, a.dept_cd
FROM tb_emp A, tb_dept B
WHERE a.addr Like '%����%'
    and a.dept_cd = b.dept_cd
    and a.emp_nm like '��%'
Order by A.emp_no
;

-- join on (ansi ǥ�� ����)
-- from�� ��, where�� ��
-- 2. ���� Ű���� �ڿ��� ���� ���̺���� ���
-- 3. �� Ű���� �ڿ��� ���� ������ ���
-- 4. �������Ǽ�����(ON��) �Ϲ����� �����θ� �и��ؼ� �ۼ��ϴ� ���
-- 5. ON���� �̿��Ϸ��� JOIN ������ �������̶� ������������ �߰� ������ ����

SELECT
  A.emp_no, A.emp_nm, A.addr, A.dept_cd, B.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE A.addr LIKE '%����%'
    AND A.emp_nm LIKE '��%'
ORDER BY A.emp_no
;


-- 1980���� ������� ���, �����, �μ���, �ڰ�����, ������ڸ� ��ȸ
SELECT
    E.emp_no, E.emp_nm, D.dept_nm, C.certi_nm, EC.acqu_de
FROM tb_emp E, tb_dept D, tb_emp_certi EC, tb_certi C
WHERE E.dept_cd = D.dept_cd
    AND EC.certi_cd = C.certi_cd
    AND E.emp_no = EC.emp_no
    AND E.birth_de BETWEEN '19800101' AND '19891231'
;
    
    
SELECT
    E.emp_no, E.emp_nm, E.birth_de, D.dept_nm, C.certi_nm, EC.acqu_de
FROM tb_emp E 
JOIN tb_dept D 
ON E.dept_cd = D.dept_cd
JOIN tb_emp_certi EC 
ON E.emp_no = EC.emp_no
JOIN tb_certi C
ON EC.certi_cd = C.certi_cd
WHERE E.birth_de BETWEEN '19800101' AND '19891231'
;


-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];


-- join on �������� ī�׽þ� �� �����
SELECT
    *
FROM test_a , test_b
;

-- non if ����

SELECT
    *
FROM test_a
CROSS JOIN test_b
;

-- natural JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ���
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� �̳������� �����մϴ�
-- 3. �̶����εǴ� ���� �̸��� Į���� ������ Ÿ���� ���ƾ��ϸ�,
--   ALIAS�� ���̺���� �ڵ� ���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� Į���� ���տ��� �ѹ��� ǥ���
-- 5. ���� �÷��� n�� �̻��̸� ���� ������ n���� ó���ȴ�

-- ������̺�� �μ����̺��� ����(���, �����, �μ��ڵ�, �μ���)

SELECT
    a.emp_no, a.emp_nm, b.dept_cd, b.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

-- NATURAL JOIN 'b.' �̷��Ż����ϱ�

SELECT
    a.emp_no, a.emp_nm, dept_cd, b.dept_nm
FROM tb_emp A
NATURAL JOIN tb_dept B
;


-- using�� ����
-- 1. NATURAL ���ο����� �ڵ����� �̸��� Ÿ���� ��ġ�ϴ� ��� �÷��� ���� ������ �Ͼ����
--    USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ���������� �ο��� �� �ֽ��ϴ�
-- 2. USING�������� ���� Į�������� ALIAS�� ���̺�� ǥ��X

SELECT
    a.emp_no, a.emp_nm, dept_cd, b.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
USING (dept_cd)
;

SELECT
    *
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

SELECT 
    *
FROM tb_emp A
INNER JOIN tb_dept B
USING (dept_cd)
;








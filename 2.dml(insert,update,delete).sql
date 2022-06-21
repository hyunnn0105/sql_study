
-- DML ������ ���۾�
-- SELECT, insert , update, delete
--  ��ȸ  /          <����>
-- anormaly�� �ַ� �����ʿ��� �Ͼ / ����� ����/���� ����� �˷���


-- insert : ������ �߰�
INSERT INTO board
    (bno, title, content, writer, reg_date)
VALUES
    (1, '����1', '����111111', '�Ѹ�', SYSDATE + 1);

-- NN �������� ���� -> ���� ����
INSERT INTO board
    (bno, content, writer)
VALUES
    (1, '����222222222', '�Ѹ�');
    
-- pk�� ����ũ �������� ����
INSERT INTO board
    (bno, title, writer)
VALUES
    (1, '����3', '�Ѹ�');

-- ���Լ���
INSERT INTO board
    (bno, title, writer)
VALUES
    (2, '����4', '±±��');
    
-- �÷��� ������� �ʾ��� ��� �ݵ�� ��� �÷��� ���� ������� ä������(��õX)
INSERT INTO board

VALUES
    (3, '����5', '�в���', '�������������', SYSDATE + 10);
    


-- ������ ����
UPDATE board
SET title = '������ �����̴�~'
WHERE bno = 3;

-- ,�� �����ϰ� ������ ���� �� ������
UPDATE board
SET writer = '������'
    , content = '�޷ο����������� fix'
WHERE bno = 2;

--  WHERE�� ������ ��ü�� �����ȴ�. but �̷��� ������ ����>����������� ���ӸӴ����� 
-- -> Ŀ�Ծ������� �ѹ��ϱ�
UPDATE board
SET writer = 'bad';



-- data delete
DELETE FROM board
WHERE bno = 1;

-- ��ü ������ ����
-- 1. WHERE���� ������ DELETE ��(�ѹ鰡��, ����Ŀ�԰���, �α׳���� ����)
DELETE FROM board;

-- 2. TRUNCATE TABLE 
-- (�ѹ�Ұ���, �ڵ�Ŀ��, �α׸� ���� �� ����, ���̺� ���� �ʱ���·� ����) ���XX
TRUNCATE TABLE board;

-- 3. DROP TABLE
-- (�ѹ�Ұ���, �ڵ�Ŀ��, �α׸� ���� �� ����, ���̺� ������ ������ ������) ���XX
DROP TABLE board;


ROLLBACK;
commit;
SELECT * FROM board;
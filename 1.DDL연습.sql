--- DDL : ������ ���Ǿ�
--- create, alter, drop, rename, truncate

DROP TABLE board;

--- create table : ���̺��� ����
CREATE TABLE board (
    bno NUMBER(10)
    , title VARCHAR2(200) NOT NULL
    , writer VARCHAR2(40) NOT NULL
    , content CLOB 
    , reg_date DATE DEFAULT SYSDATE
    , view_count NUMBER(10) DEFAULT 0
);
-- DEFAULT '0'

-- ALTER : �����ͺ��̽��� ������ ����

-- pk����
ALTER TABLE board 
ADD CONSTRAINT pk_board_bno
PRIMARY KEY (bno);

-- ������ �߰�
INSERT INTO board
    (bno, title, writer, content)
VALUES
    (1,'�ȳ�', 'ŰŰ', '������������ ���Ϥ����K');
    
-- content�� ������ ���ٸ� insert�� content �����ֱ� 
INSERT INTO board
    (bno, title, writer)
VALUES
    (2,'�ι�°', '������');
    
commit;
-- �����ݷи��� ctrl+enter

-- �������� ����
-- �Խù��� ����� ����
--   1   :  Many

-- ��� ���̺� ����
CREATE TABLE REPLY (
    rno NUMBER(10)
    , r_content VARCHAR2(400)
    , r_writer VARCHAR2(40) NOT NULL
    , bno NUMBER(10)
    , CONSTRAINT pk_reply_rno PRIMARY KEY (rno) 
    -- pk ����, ��Ī�� ������ pk_reply_rno
    
);

-- pk ������ �ֱ�
-- �ܺ�Ű���� : reply���� bno �˷��ֱ�

-- �ܷ�Ű ����(foreign key) : ���̺��� ���� ���� ����
ALTER TABLE reply
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY (bno)
REFERENCES board (bno);
-- board�� bno�� ����

-- �÷� ����
-- �÷� �߰�
ALTER TABLE reply
ADD (r_reg_date DATE DEFAULT SYSDATE);


-- �÷� ����
ALTER TABLE board
DROP COLUMN view_count;

-- �÷� ����
ALTER TABLE board
MODIFY (title VARCHAR2(500));

SELECT * FROM board;

-- ���̺� ����
-- TRUNCATE TABLE board; -- ���̺� ���� ��ü ���� "�ѹ�Ұ�!!"

DROP TABLE reply;
TRUNCATE TABLE board;

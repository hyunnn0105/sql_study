
CREATE TABLE ���ں�����_93 (
    ���� DATE
    , ����� NUMBER(5)
);

INSERT INTO ���ں�����_93 VALUES ('2015-11-01', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-02', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-03', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-04', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-05', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-06', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-07', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-08', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-09', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-10', 1000);
COMMIT;
ROLLBACK;

SELECT * FROM ���ں�����_93;

-- ����
SELECT a.����, SUM(a.�����) as ���������
FROM ���ں�����_93
group by a.����
order by a.����
;


-- ����2
-- ���� 2

SELECT B.����, SUM(B.�����) AS ���������
FROM ���ں�����_93 A
JOIN ���ں�����_93 B 
ON (A.���� >= B.����)
GROUP BY B.����
ORDER BY B.����
;

SELECT A.����, A.�����, B.����, B.�����
FROM ���ں�����_93 A
JOIN ���ں�����_93 B 
ON (A.���� >= B.����)
ORDER BY B.����
;




--- 86

drop table ȸ���⺻����_86;
drop table ȸ��������_86;
CREATE TABLE ȸ���⺻����_86 (
    user_id VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE ȸ��������_86 (
    user_id VARCHAR2(200)
    
);

ALTER TABLE ȸ��������_86
ADD CONSTRAINT fk_user_id 
FOREIGN KEY (user_id)
references ȸ���⺻����_86 (user_id);

insert into ȸ���⺻����_86 VALUES('abc01');
insert into ȸ���⺻����_86 VALUES('abc02');
insert into ȸ���⺻����_86 VALUES('abc03'); 
insert into ȸ���⺻����_86 VALUES('abc04'); 
insert into ȸ���⺻����_86 VALUES('abc05'); 

commit;

insert into ȸ��������_86 VALUES('abc01');
insert into ȸ��������_86 VALUES('abc02');
insert into ȸ��������_86 VALUES('abc03');
commit;

SELECT
    * FROM ȸ���⺻����_86;
SELECT
    * FROM ȸ��������_86;

SELECT * FROM ȸ���⺻����_86;
SELECT * FROM ȸ��������_86;

-- ���� 1
SELECT user_id FROM ȸ���⺻����_86
MINUS
SELECT user_id FROM ȸ��������_86
;


-- ���� 2
SELECT user_id FROM ȸ���⺻����_86
UNION ALL
SELECT user_id FROM ȸ��������_86
;


-- ���� 3
SELECT user_id FROM ȸ���⺻����_86
INTERSECT
SELECT user_id FROM ȸ��������_86
;

SELECT A.user_id 
FROM ȸ���⺻����_86 A 
JOIN ȸ��������_86 B 
ON A.user_id = B.user_id
;

-- ���� 4
SELECT user_id FROM ȸ���⺻����_86
INTERSECT
SELECT user_id FROM ȸ��������_86
;

SELECT user_id FROM ȸ���⺻����_86
UNION
SELECT user_id FROM ȸ��������_86
;


-- 84��

create table t1(
    A VARCHAR2(10)
    , B VARCHAR2(10)
    , c VARCHAR2(10)
);

insert INTO t1 VALUES ('a3','b2','c3');
insert INTO t1 VALUES ('a1','b1','c1');
insert INTO t1 VALUES ('a2','b1','c2');
commit;

ROLLBACK;

SELECT
    * FROM t1;

create table t2(
    A VARCHAR2(10)
    , B VARCHAR2(10)
    , c VARCHAR2(10)
);

insert INTO t2 VALUES ('a1','b1','c1');
insert INTO t2 VALUES ('a3','b2','c3');

SELECT
    * FROM t2;

SELECT A,B,C FROM t1
UNION all
SELECT A,B,C from t2
;

SELECT A,B,C FROM t1
UNION
SELECT A,B,C from t2
;

commit;


-- 83��
create table tbl1(
    COL1 VARCHAR2(10)
    , COL2 VARCHAR2(10)
);

insert into tbl1 values('AA','A1');
insert into tbl1 values('AB','A2');

SELECT
    * FROM tbl1;
    
create table tbl2(
    COL1 VARCHAR2(10)
    , COL2 VARCHAR2(10)
);
  
insert into tbl2 values('AA','A1');
insert into tbl2 values('AB','A2');
insert into tbl2 values('AC','A3');
insert into tbl2 values('AD','A4');

SELECT
    * FROM tbl2;
COMMIT;
ROLLBACK;


SELECT col1, col2, count(*) AS cnt
From(
SELECT col1, col2
FROM tbl1
UNION all
select col1, col2
from tbl2
)
group by col1, col2
;           

-- 56��
commit;
CREATE TABLE ����������(
    ����
)
  
-- #91��
DROP TABLE �μ�_91;

-- ���̺� �ۼ�
-- �μ����̺�
CREATE TABLE �μ�_91 (
 �μ��ڵ� VARCHAR2(20),
 �μ��� VARCHAR2(100),
 �����μ��ڵ� VARCHAR2(20),
 CONSTRAINT pk_�μ�_91 PRIMARY KEY(�μ��ڵ�)
);

-- fk ����
ALTER TABLE �μ�_91 
ADD CONSTRAINT fk_�����μ��ڵ�_91 
FOREIGN KEY (�����μ��ڵ�)
REFERENCES �μ�_91 (�μ��ڵ�);

INSERT INTO �μ�_91 VALUES(100, '�ƽþƺ�', NULL);
INSERT INTO �μ�_91 VALUES(110, '�ѱ�����', 100);
INSERT INTO �μ�_91 VALUES(111, '��������', 110);
INSERT INTO �μ�_91 VALUES(112, '�λ�����', 110);
INSERT INTO �μ�_91 VALUES(120, '�Ϻ�����', 100);
INSERT INTO �μ�_91 VALUES(121, '��������', 120);
INSERT INTO �μ�_91 VALUES(122, '����ī����', 120);
INSERT INTO �μ�_91 VALUES(130, '�߱�����', 100);
INSERT INTO �μ�_91 VALUES(131, '����¡����', 130);
INSERT INTO �μ�_91 VALUES(132, '����������', 130);
INSERT INTO �μ�_91 VALUES(200, '����������', NULL);
INSERT INTO �μ�_91 VALUES(210, '����������', 200);
INSERT INTO �μ�_91 VALUES(211, '���帮������', 210);
INSERT INTO �μ�_91 VALUES(212, '�׶󳪴�����', 210);
INSERT INTO �μ�_91 VALUES(220, '������������', 200);
INSERT INTO �μ�_91 VALUES(221, '����������', 220);
INSERT INTO �μ�_91 VALUES(222, '�׶󳪴�����', 220);

COMMIT;

-- ���� ���̺�
DROP TABLE ����_91;
CREATE TABLE ����_91(
�μ��ڵ� VARCHAR2(20),
����� NUMBER(20));

INSERT INTO ����_91 VALUES(111,1000);
INSERT INTO ����_91 VALUES(112,2000);
INSERT INTO ����_91 VALUES(121,1500);
INSERT INTO ����_91 VALUES(122,1000);
INSERT INTO ����_91 VALUES(131,1500);
INSERT INTO ����_91 VALUES(132,2000);
INSERT INTO ����_91 VALUES(211,2000);
INSERT INTO ����_91 VALUES(212,1500);
INSERT INTO ����_91 VALUES(221,1000);
INSERT INTO ����_91 VALUES(222,2000);
COMMIT;

SELECT * FROM �μ�_91;
SELECT * FROM ����_91;

    

-- ���� 1��

SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    START WITH �μ��ڵ� = '120'
    CONNECT BY PRIOR �����μ��ڵ� = �μ��ڵ�
    ;
    
SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    START WITH �μ��ڵ� = '120'
    CONNECT BY �����μ��ڵ� = PRIOR �μ��ڵ�;
    
    
SELECT A.�μ��ڵ�, A.�μ���, A.�����μ��ڵ�, B.�����, LVL
FROM (
    SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    START WITH �μ��ڵ� = '120'
    CONNECT BY PRIOR �����μ��ڵ� = �μ��ڵ�
    UNION
    SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    START WITH �μ��ڵ� = '120'
    CONNECT BY �����μ��ڵ� = PRIOR �μ��ڵ�) 
    A LEFT OUTER JOIN ����_91 B
ON (A.�μ��ڵ� = B.�μ��ڵ�)
ORDER BY A.�μ��ڵ�;

-- ���� 2��
SELECT A.�μ��ڵ�, A.�μ���, A.�����μ��ڵ�, B.�����, LVL
FROM (
    SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    START WITH �μ��ڵ� = '100'
    CONNECT BY �����μ��ڵ� = PRIOR �μ��ڵ�
    )
    A LEFT OUTER JOIN ����_91 B
ON (A.�μ��ڵ� = B.�μ��ڵ�)
ORDER BY A.�μ��ڵ�;

-- ���� 3��
SELECT A.�μ��ڵ�, A.�μ���, A.�����μ��ڵ�, B.�����, LVL
FROM (
    SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    START WITH �μ��ڵ� = '121'
    CONNECT BY PRIOR �����μ��ڵ� = �μ��ڵ�)
    A LEFT OUTER JOIN ����_91 B
ON (A.�μ��ڵ� = B.�μ��ڵ�)
ORDER BY A.�μ��ڵ�;

-- ���� 4��

SELECT �μ��ڵ� FROM �μ�_91
    WHERE �����μ��ڵ� IS NULL 
    START WITH �μ��ڵ� = '120'
    CONNECT BY PRIOR �����μ��ڵ� = �μ��ڵ�
    ;
    
SELECT A.�μ��ڵ�, A.�μ���, A.�����μ��ڵ�, B.�����, LVL
FROM (
    SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    
    START WITH �μ��ڵ� = (SELECT �μ��ڵ� FROM �μ�_91
    WHERE �����μ��ڵ� IS NULL 
    START WITH �μ��ڵ� = '120'
    CONNECT BY PRIOR �����μ��ڵ� = �μ��ڵ�)
    
    CONNECT BY �����μ��ڵ� = PRIOR �μ��ڵ�)
    A LEFT OUTER JOIN ����_91 B
    ON (A.�μ��ڵ� = B.�μ��ڵ�)
    ORDER BY A.�μ��ڵ�;


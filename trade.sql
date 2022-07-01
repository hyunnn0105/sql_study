


CREATE TABLE trade(
    tra_nu NUMBER(10)
    , tra_nm VARCHAR2(20) NOT NULL
    , item VARCHAR2(20) NOT NULL
    , price NUMBER(10) NOT NULL
    , tra_phone VARCHAR2(11)
    , post_method VARCHAR(20)
    , post_addr VARCHAR2(100)
    , post_num NUMBER(20)
);

alter table trade
add CONSTRAINT trade PRIMARY KEY (tra_nu)
;

SELECT
    * FROM trade;

commit;
    
    
INSERT INTO trade VALUES (1, '������', '�Ƿ�', 20000, '01012345678','�ص��', '��⵵ 00�� 00�� 00����Ʈ 00', 123456789);
INSERT INTO trade VALUES (2, '������', '�Ƿ�', 25000, '01043215678','�ݰ��ù�', '����Ư���� 00�� 00����Ʈ 00', 987654321);
INSERT INTO trade VALUES (3, '�ٴٴ�', '����', 10000, '01043215678','�ù�', '������ 00�� 00����Ʈ 00','');

commit;

ROLLBACK;

DROP TABLE trade;



SELECT
    * FROM trade;
    
Alter table trade MODIFY (post_num NUMBER(38));

commit;

TRUNCATE table trade;

Alter table trade MODIFY (post_num VARCHAR2(38));

commit;

INSERT INTO trade VALUES (1, '������', '�Ƿ�', 20000, '01012345678','�ص��', '��⵵ 00�� 00�� 00����Ʈ 00', '123456789123');
INSERT INTO trade VALUES (2, '������', '�Ƿ�', 25000, '01043215678','�ݰ��ù�', '����Ư���� 00�� 00����Ʈ 00', '987654321123');
INSERT INTO trade VALUES (3, '�ٴٴ�', '����', 10000, '01043215678','�ù�', '������ 00�� 00����Ʈ 00','');

SELECT
    * FROM trade;




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
    
    
INSERT INTO trade VALUES (1, '가나다', '의류', 20000, '01012345678','준등기', '경기도 00시 00구 00아파트 00', 123456789);
INSERT INTO trade VALUES (2, '나나나', '의류', 25000, '01043215678','반값택배', '서울특별시 00구 00아파트 00', 987654321);
INSERT INTO trade VALUES (3, '다다다', '음식', 10000, '01043215678','택배', '강원도 00시 00아파트 00','');

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

INSERT INTO trade VALUES (1, '가나다', '의류', 20000, '01012345678','준등기', '경기도 00시 00구 00아파트 00', '123456789123');
INSERT INTO trade VALUES (2, '나나나', '의류', 25000, '01043215678','반값택배', '서울특별시 00구 00아파트 00', '987654321123');
INSERT INTO trade VALUES (3, '다다다', '음식', 10000, '01043215678','택배', '강원도 00시 00아파트 00','');

SELECT
    * FROM trade;

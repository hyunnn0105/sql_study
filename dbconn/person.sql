
drop table person;

create table PERSON (
    ssn CHAR(14) PRIMARY KEY
    , person_name VARCHAR2(50) NOT NULL
    , age NUMBER NOT NULL
);

SELECT
    * FROM person;
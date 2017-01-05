CREATE TABLE JSP_member(
    idx NUMBER(4) PRIMARY KEY,
    id VARCHAR(20),
    pwd VARCHAR(40),
    name VARCHAR(20),
    tel VARCHAR(20),
    addr VARCHAR(40),
    joindate DATE 
)

CREATE SEQUENCE JSP_member_idx MINVALUE 0 START WITH 1 
DROP SEQUENCE JSP_member_idx;
CREATE SEQUENCE JSP_member_idx MINVALUE 0 START WITH 1
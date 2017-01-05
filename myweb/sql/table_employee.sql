SELECT * FROM tab;

CREATE TABLE employee(
    idx number(4) primary key,
    name VARCHAR2(20),
    email VARCHAR2(100),
    dept VARCHAR2(20)
);

CREATE SEQUENCE employee_idx MINVALUE 0 START WITH 1;

SELECT * FROM employee;

INSERT INTO employee VALUES(employee_idx.NEXTVAL, '홍길동', 'hong@naver.com', '인사과'); 

DELETE FROM employee;

DROP SEQUENCE employee_idx;

CREATE SEQUENCE employee_idx MINVALUE 0 START WITH 1;

INSERT INTO employee VALUES(employee_idx.NEXTVAL, '홍길동', 'hong@naver.com', '인사과'); 

SELECT * FROM employee;
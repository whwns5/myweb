CREATE TABLE jsp_bbs(
	idx NUMBER(4) PRIMARY KEY,
	writer VARCHAR2(30),
	pwd VARCHAR2(20),
	subject VARCHAR2(100),
	content VARCHAR2(4000),
	writedate date,
	readnum NUMBER(4),
	ref NUMBER(4),
	lev NUMBER(4),
	sunbun NUMBER(4)
);

CREATE SEQUENCE JSP_bbs_idx 

INSERT INTO JSP_bbs VALUES(jsp_bbs_idx.NEXTVAL, '홍길동', '1234', '첫글입니다.', '안녕하세요', SYSDATE, 0, 0, 0, 0);
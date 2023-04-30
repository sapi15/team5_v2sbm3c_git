**********************************/
/* Table Name: 도서 그룹 */
/**********************************/
DROP TABLE bookgrp;
CREATE TABLE bookgrp(
    bookgrpno                         NUMERIC(10)    NOT NULL    PRIMARY KEY,
    grpname                           VARCHAR(50)    NOT NULL,
    seqno                             NUMERIC(7)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL
);

COMMENT ON TABLE bookgrp is '도서 그룹';
COMMENT ON COLUMN bookgrp.bookgrpno is '도서 그룹 번호';
COMMENT ON COLUMN bookgrp.grpname is '그룹이름';
COMMENT ON COLUMN bookgrp.seqno is '출력 순서';
COMMENT ON COLUMN bookgrp.rdate is '그룹 생성일';

DROP SEQUENCE bookgrp_seq;  

CREATE SEQUENCE bookgrp_seq            -- 이부분부터만 실행
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지

INSERT INTO bookgrp(bookgrpno, grpname, seqno,rdate)
VALUES(bookgrp_seq.nextval, '역사', 1,sysdate);
INSERT INTO bookgrp(bookgrpno, grpname, seqno,rdate)
VALUES(bookgrp_seq.nextval, '문학', 2,sysdate);
INSERT INTO bookgrp(bookgrpno, grpname, seqno,rdate)
VALUES(bookgrp_seq.nextval, 'IT',3,sysdate);
INSERT INTO bookgrp(bookgrpno, grpname, seqno,rdate)
VALUES(bookgrp_seq.nextval, '외국어',4,sysdate);

--bookgrp,book,contents 테이블 조인
SELECT   r.bookgrpno,b.bookno,c.contentsno,c.memberno, r.seqno, r.grpname, b.bookname, b.rdate,
             c.title, c.content
FROM contents c
INNER JOIN book b
     ON  b.bookno=c.bookno
INNER JOIN bookgrp r
     ON  b.bookgrpno=r.bookgrpno
ORDER BY b.bookgrpno ASC;
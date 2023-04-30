/**********************************/
/* Table Name: 도서 */
/**********************************/
DROP TABLE book;
CREATE TABLE book(
    bookno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    bookgrpno                         NUMBER(10)     NULL ,
    bookname                          VARCHAR2(50)     NOT NULL,
    rdate                             DATE     NOT NULL,
  FOREIGN KEY (bookgrpno) REFERENCES bookgrp (bookgrpno)
);

COMMENT ON TABLE book is '도서';
COMMENT ON COLUMN book.bookno is '종류번호';
COMMENT ON COLUMN book.bookgrpno is '도서 그룹 번호';
COMMENT ON COLUMN book.bookname is '종류명';
COMMENT ON COLUMN book.rdate is '등록일';


DROP SEQUENCE book_seq;  

CREATE SEQUENCE book_seq            -- 이부분부터만 실행
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 1, '한국사', sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 2, '웹개발',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 2, '소설',sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, '토익', sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, 'HSK', sysdate);

INSERT INTO book(bookno, bookgrpno, bookname, rdate)
VALUES(book_seq.nextval, 4, 'TSC', sysdate);

--테이블 조인
SELECT   r.bookgrpno,b.bookno, r.grpname, r.seqno, b.bookname, b.rdate
FROM book b,bookgrp r
WHERE b.bookgrpno=r.bookgrpno
ORDER BY b.bookgrpno ASC;
/**********************************/
/* Table Name: 자주묻는질문 */
/**********************************/
DROP TABLE faq;
CREATE TABLE faq(
faqno                          NUMBER(10)  NOT NULL  PRIMARY KEY,
faqgrpno                       NUMBER(10)  NOT NULL,
title                          VARCHAR2(500)  NOT NULL,
answer                         CLOB  NOT NULL,
  FOREIGN KEY (faqgrpno) REFERENCES faqgrp (faqgrpno)
);

COMMENT ON TABLE faq is '자주묻는질문';
COMMENT ON COLUMN faq.faqno is '질문번호';
COMMENT ON COLUMN faq.faqgrpno is '질문그룹번호';
COMMENT ON COLUMN faq.title is '질문제목';
COMMENT ON COLUMN faq.answer is '질문답변';

DROP SEQUENCE faq_seq;
CREATE SEQUENCE faq_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999
    CACHE 2
    NOCYCLE;
    
--등록
INSERT INTO faq(faqgrpno, faqno, title, answer)
VALUES('1', faq_seq.nextval, '1', '제목', '답변내용');
COMMIT;

--목록
SELECT faqgrpno, faqno, title, answer
FROM faq
WHERE faqgrpno = 1
ORDER BY faqno ASC;

--수정
UPDATE faq
SET title='수정', answer='답변수정'
WHERE faqno=1;
COMMIT;

--삭제
DROP FROM faq
WHERE faqno=1;
COMMIT; 
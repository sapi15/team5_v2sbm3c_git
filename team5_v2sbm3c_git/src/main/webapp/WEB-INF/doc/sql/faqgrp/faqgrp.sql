/**********************************/
/* Table Name: faq질문그룹 */
/**********************************/
DROP TABLE faqgrp;
CREATE TABLE faqgrp(
faqgrpno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
name                           VARCHAR2(200)  NOT NULL
);

COMMENT ON TABLE faqgrp is 'faq질문그룹';
COMMENT ON COLUMN faqgrp.faqgrpno is '질문그룹번호';
COMMENT ON COLUMN faqgrp.name is '그룹이름';

DROP SEQUENCE faqgrp_seq;
CREATE SEQUENCE faqgrp_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999
    CACHE 2
    NOCYCLE;
    
--등록
INSERT INTO faqgrp(faqgrpno,  name)
VALUES(faqgrp_seq.nextval, '주문/결제');
INSERT INTO faqgrp(faqgrpno,  name)
VALUES(faqgrp_seq.nextval, '배송/수령일안내');
INSERT INTO faqgrp(faqgrpno,  name)
VALUES(faqgrp_seq.nextval, '반품/교환/환불');
INSERT INTO faqgrp(faqgrpno,  name)
VALUES(faqgrp_seq.nextval, '도서/상품');
INSERT INTO faqgrp(faqgrpno,  name)
VALUES(faqgrp_seq.nextval, '서비스');
INSERT INTO faqgrp(faqgrpno,  name)
VALUES(faqgrp_seq.nextval, '기타');
COMMIT;

--목록
SELECT faqgrpno,  name
FROM faqgrp
ORDER BY faqgrpno ASC;

--수정
UPDATE faqgrp
SET name='반품'
WHERE faqgrpno=1;
COMMIT;

--삭제
DELETE FROM faqgrp
WHERE faqgrpno=1;
COMMIT;
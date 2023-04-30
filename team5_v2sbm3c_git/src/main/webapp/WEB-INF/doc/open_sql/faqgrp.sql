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
VALUES(faqgrp_seq.nextval, '반품/교환');
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
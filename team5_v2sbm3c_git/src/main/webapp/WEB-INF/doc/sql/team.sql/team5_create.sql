-- member
CREATE TABLE member(
memberno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
name                           VARCHAR(20)  NOT NULL,
id                             VARCHAR(20)  NOT NULL,
passwd                         VARCHAR(30)  NOT NULL,
postcode                       VARCHAR(5)  NOT NULL,
address1                       VARCHAR(50)  NOT NULL,
address2                       VARCHAR(50)  NOT NULL,   
tel                            VARCHAR(13)  NOT NULL,
rdate                          DATE  NOT NULL,
grade                          NUMBER(2)  DEFAULT 11  NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원번호';
COMMENT ON COLUMN member.name is '이름';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.passwd is '비밀번호';
COMMENT ON COLUMN member.postcode is '우편번호';
COMMENT ON COLUMN member.address1 is '주소1';
COMMENT ON COLUMN member.address2 is '주소2';
COMMENT ON COLUMN member.tel is '전화번호';
COMMENT ON COLUMN member.rdate is '가입일';
COMMENT ON COLUMN member.grade is '등급';

CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지


-- bookgrp  
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

CREATE SEQUENCE bookgrp_seq            -- 이부분부터만 실행
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지  

-- book  
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

CREATE SEQUENCE book_seq            -- 이부분부터만 실행
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지

-- contents
CREATE TABLE contents(
    contentsno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    bookno                            NUMBER(10)     NULL ,
        memberno                          NUMBER(10)     NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB   NOT NULL,
    recom                             NUMBER(7)    NOT NULL,
    word                              VARCHAR2(300)    NULL ,
    rdate                             DATE     NOT NULL,
    file1                             VARCHAR2(100)    NULL ,
    file1saved                        VARCHAR2(100)    NULL ,
    thumb1                            VARCHAR2(100)    NULL ,
    size1                             NUMBER(10)     NULL ,
    price                             NUMBER(10)     NULL ,
    saleprice                         NUMBER(10)     NULL ,
    dc                                NUMBER(10)     NULL ,
    point                             NUMBER(10)     NULL ,
    salecnt                           NUMBER(10)     NULL ,
    cartno                            NUMBER(10)     NULL ,
  FOREIGN KEY (bookno) REFERENCES book (bookno),
    FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE contents is '컨텐츠 - 도서 상품';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.bookno is '종류번호';
COMMENT ON COLUMN contents.memberno is '회원 번호';
COMMENT ON COLUMN contents.title is '제목';
COMMENT ON COLUMN contents.content is '내용';
COMMENT ON COLUMN contents.recom is '추천수';
COMMENT ON COLUMN contents.word is '검색어';
COMMENT ON COLUMN contents.rdate is '등록일';
COMMENT ON COLUMN contents.file1 is '메인 이미지';
COMMENT ON COLUMN contents.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN contents.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN contents.size1 is ' 메인 이미지 크기';
COMMENT ON COLUMN contents.price is '정가';
COMMENT ON COLUMN contents.saleprice is '판매가';
COMMENT ON COLUMN contents.dc is '할인률';
COMMENT ON COLUMN contents.point is '포인트';
COMMENT ON COLUMN contents.salecnt is '수량';
COMMENT ON COLUMN contents.cartno is '쇼핑카트 번호';  

CREATE SEQUENCE contents_seq            -- 이부분부터만 실행
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지

-- cart
  CREATE TABLE cart(
cartno                         NUMBER(10)  NOT NULL  PRIMARY KEY,
memberno                       NUMBER(10)  NOT NULL,
contentsno                     NUMBER(10)  NOT NULL,
cnt                            NUMBER(5)  DEFAULT 1  NOT NULL,
rdate                          DATE  NOT NULL,
   FOREIGN KEY (memberno) REFERENCES member (memberno),
   FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cartno is '장바구니번호';
COMMENT ON COLUMN cart.memberno is '회원번호';
COMMENT ON COLUMN cart.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN cart.cnt is '수량';
COMMENT ON COLUMN cart.rdate is '등록일';

CREATE SEQUENCE cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
-- myroom
CREATE TABLE myroom(
myroomno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
memberno                       NUMBER(10)  NOT NULL ,
contentsno                     NUMBER(10)  NOT NULL ,
rdate                          DATE  NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE myroom is '보관함';
COMMENT ON COLUMN myroom.myroomno is '보관함번호';
COMMENT ON COLUMN myroom.memberno is '회원번호';
COMMENT ON COLUMN myroom.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN myroom.rdate is '등록일';

CREATE SEQUENCE myroom_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

-- evnet  
  CREATE TABLE event(
eventno                        NUMBER(10)  NOT NULL  PRIMARY KEY,
title                          VARCHAR2(200)  NOT NULL,
contents                       CLOB  NOT NULL,
file1                           VARCHAR2(100)  NULL ,
file1saved                      VARCHAR2(100)  NULL ,
thumb                          VARCHAR2(100)  NULL ,
size1                           NUMBER(10)  NULL ,
rdate                          DATE  NOT NULL
);

COMMENT ON TABLE event is '이벤트';
COMMENT ON COLUMN event.eventno is '이벤트번호';
COMMENT ON COLUMN event.title is '이벤트제목';
COMMENT ON COLUMN event.contents is '이벤트내용';
COMMENT ON COLUMN event.file1 is '이벤트이미지';
COMMENT ON COLUMN event.file1saved is '실제저장된이벤트이미지';
COMMENT ON COLUMN event.thumb is '이벤트이미지 preview';
COMMENT ON COLUMN event.size1 is '이미지크기';
COMMENT ON COLUMN event.rdate is '날짜';

CREATE SEQUENCE event_seq
    START WITH 1  --시작번호
    INCREMENT BY 1  --증가값
    MAXVALUE 999999 --최대값
    CACHE 2  
    NOCYCLE;
    
 -- faqgrp
 CREATE TABLE faqgrp(
faqgrpno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
name                           VARCHAR2(200)  NOT NULL
);

COMMENT ON TABLE faqgrp is 'faq질문그룹';
COMMENT ON COLUMN faqgrp.faqgrpno is '질문그룹번호';
COMMENT ON COLUMN faqgrp.name is '그룹이름';

CREATE SEQUENCE faqgrp_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999
    CACHE 2
    NOCYCLE;
 
-- faq   
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

CREATE SEQUENCE faq_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999
    CACHE 2
    NOCYCLE;
    
-- notice
CREATE TABLE notice(
noticeno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
title                          VARCHAR2(200)  NOT NULL,
contents                       CLOB  NOT NULL,
rdate                          DATE  NOT NULL,
views                          NUMBER(10)  DEFAULT 0  NOT NULL
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지사항번호';
COMMENT ON COLUMN notice.title is '공지사항제목';
COMMENT ON COLUMN notice.contents is '공지사항내용';
COMMENT ON COLUMN notice.rdate is '날짜';
COMMENT ON COLUMN notice.views is '조회수';

CREATE SEQUENCE notice_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999
    CACHE 2
    NOCYCLE;    

-- order_item
CREATE TABLE order_item(
    order_itemno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    contentsno                        NUMBER(10)     NULL ,
    order_payno                       NUMBER(10)     NOT NULL,
    memberno                          NUMERIC(10)    NULL ,
    cnt                               NUMBER(5)    DEFAULT 1     NOT NULL,
    tot                               NUMBER(10)     DEFAULT 0     NOT NULL,
    stateno                           NUMBER(1)    DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
  FOREIGN KEY (order_payno) REFERENCES order_pay (order_payno),
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE order_item is '주문상세';
COMMENT ON COLUMN order_item.order_itemno is '주문상세번호';
COMMENT ON COLUMN order_item.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN order_item.order_payno is '주문 번호';
COMMENT ON COLUMN order_item.memberno is '회원번호';
COMMENT ON COLUMN order_item.cnt is '수량';
COMMENT ON COLUMN order_item.tot is '합계';
COMMENT ON COLUMN order_item.stateno is '주문상태';
COMMENT ON COLUMN order_item.rdate is '주문날짜';

CREATE SEQUENCE order_item_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지   
  
-- order_pay
CREATE TABLE order_pay(
    order_payno                       NUMBER(10)     NOT NULL    PRIMARY KEY,
    rname                             VARCHAR2(30)     NOT NULL,
    rtel                              VARCHAR2(14)     NOT NULL,
    rzipcode                          VARCHAR2(5)    NULL ,
    raddress1                         VARCHAR2(80)     NOT NULL,
    raddress2                         VARCHAR2(50)     NOT NULL,
    paytype                           NUMBER(1)    DEFAULT 0     NOT NULL,
    amount                            NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    memberno                          NUMBER(10)    NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE order_pay is '주문_결재';
COMMENT ON COLUMN order_pay.order_payno is '주문 번호';
COMMENT ON COLUMN order_pay.rname is '수취인성명';
COMMENT ON COLUMN order_pay.rtel is '수취인 전화번호';
COMMENT ON COLUMN order_pay.rzipcode is '수취인 우편번호';
COMMENT ON COLUMN order_pay.raddress1 is '수취인 주소1';
COMMENT ON COLUMN order_pay.raddress2 is '수취인 주소2';
COMMENT ON COLUMN order_pay.paytype is '결재 종류';
COMMENT ON COLUMN order_pay.amount is '결재금액';
COMMENT ON COLUMN order_pay.rdate is '주문날짜';
COMMENT ON COLUMN order_pay.memberno is '회원번호';

CREATE SEQUENCE order_pay_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

-- qna  
CREATE TABLE qna(
    qnano                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    order_itemno                      NUMBER(10)     NOT NULL,
    title                             VARCHAR2(100)    NULL ,
    content                           CLOB     NULL ,
    qdate                             DATE     NULL ,
    reply                             CLOB     NULL ,
    rdate                             DATE     NULL ,
    file1                             VARCHAR2(100)    NULL ,
    file1saved                        VARCHAR2(100)    NULL ,
    thumb1                            VARCHAR2(100)    NULL ,
    size1                             NUMBER(10)     NULL ,
    memberno                          NUMBER(10)     NULL ,
    state                             NUMBER(1)    NULL ,
  FOREIGN KEY (order_itemno) REFERENCES order_item (order_itemno)
);

COMMENT ON TABLE qna is '질문답변관리';
COMMENT ON COLUMN qna.qnano is '질문답변 관리번호';
COMMENT ON COLUMN qna.order_itemno is '주문상세번호';
COMMENT ON COLUMN qna.title is '질문 제목';
COMMENT ON COLUMN qna.content is '질문 내용';
COMMENT ON COLUMN qna.qdate is '질문 등록일';
COMMENT ON COLUMN qna.reply is '답변';
COMMENT ON COLUMN qna.rdate is '답변 등록일';
COMMENT ON COLUMN qna.file1 is '고객 이미지';
COMMENT ON COLUMN qna.file1saved is '실제 저장된 고객 이미지';
COMMENT ON COLUMN qna.thumb1 is '고객 이미지 preview';
COMMENT ON COLUMN qna.size1 is '파일크기';
COMMENT ON COLUMN qna.memberno is '회원 번호';
COMMENT ON COLUMN qna.state is '답변 상태';

CREATE SEQUENCE qna_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지 
    
/**********************************/
/* Table Name: 질문답변관리 */
/**********************************/
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

DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

 -- 관리자 질문 등록
 INSERT INTO qna(qnano, order_itemno, title, content, qdate, file1, file1saved, thumb1, size1, memberno, state)
 VALUES (qna_seq.nextval, 1,  'QnA 관리자 질문 제목', 'QnA 관리자 질문 내용', sysdate, 'file1', 'file1saved',  'thumb1', 1024, 1, 0);
 
  -- 회원 질문 등록
 INSERT INTO qna(qnano, order_itemno, title, content, qdate, file1, file1saved, thumb1, size1, memberno, state)
 VALUES (qna_seq.nextval, 1, 'QnA 회원 질문 제목', 'QnA 회원 질문 내용', sysdate, 'file1', 'file1saved',  'thumb1', 1024, 3, 0);
 
 -- 답변 등록
 UPDATE qna
 SET reply = '첫번째 답변입니다', rdate = sysdate, state=1
 WHERE qnano = 1;
 
 -- 회원별 QnA 목록 조회 (회원)
 SELECT qnano, memberno, title, order_itemno, qdate, state, file1, thumb1, file1saved
 FROM qna
 WHERE memberno = 1
 ORDER BY qdate DESC;
 
 -- 문의 건별 QnA 상세 조회 (회원, 관리자)
 SELECT qnano, order_itemno, title, content, qdate, file1, file1saved, thumb1, size1, memberno, state
 FROM qna
 WHERE qnano = 1;
 
 -- QnA 목록 조회 (관리자)
 SELECT qnano, order_itemno, title, content, qdate, file1, file1saved, thumb1, size1, memberno, state
 FROM qna
 WHERE state < 1
 ORDER BY qdate DESC;
 
 -- QnA 삭제 
 DELETE FROM qna
 WHERE qnano = 1;
 
/**********************************/
/* Table Name: 컨텐츠 - 도서 상품 */
/**********************************/
DROP TABLE contents;
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		bookno                        		NUMBER(10)		 NOT NULL ,
        memberno                          NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB	 NOT NULL,
		recom                         		NUMBER(7)		 NOT NULL,
		word                          		VARCHAR2(300)		 NULL ,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file1saved                    		VARCHAR2(100)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		price                         		NUMBER(10)		 NULL ,
		saleprice                     		NUMBER(10)		 NULL ,
		dc                            		NUMBER(10)		 NULL ,
		point                         		NUMBER(10)		 NULL ,
                        writer                                 VARCHAR2(100)  NOT NULL,
                        publisher                            VARCHAR2(100)  NOT NULL,
        
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
COMMENT ON COLUMN contents.writer is '저자';
COMMENT ON COLUMN contents.publisher is '출판사';
DROP SEQUENCE contents_seq;  

CREATE SEQUENCE contents_seq            -- 이부분부터만 실행
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                 -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO contents(contentsno, bookno, memberno, title, content, recom, word, rdate,
      file1,file1saved,thumb1,size1,price,saleprice,dc,point,writer,publisher)
VALUES(contents_seq.nextval, 1, 1, '한국사능력검정시험고급', '최태성 선생님의 최고의 역사 교육!',0,'한국사',sysdate,
      'history.jpg', 'history_1.jpg','history_t.jpg' ,1000,20000,18000,20,100,'가나다','라마바');
      
INSERT INTO contents(contentsno, bookno, memberno, title, content, recom, word, rdate,
      file1,file1saved,thumb1,size1,price,saleprice,dc,point,writer,publisher)
VALUES(contents_seq.nextval, 4, 1, '해커스 TOEIC 한권으로 합격!', '베스트 셀러 1위 책!',0,'토익',sysdate,
      'history.jpg', 'history_1.jpg','history_t.jpg' ,1000,20000,18000,20,100,100,'가나다','라마바');
--컬럼 제거 
ALTER TABLE contents DROP COLUMN cartno;
--조회  
  SELECT contentsno, bookno, memberno, title, content, recom, word, rdate
             ,file1saved,thumb1,size1,price,saleprice,dc,point,writer,publisher
  FROM contents
  ORDER BY contentsno ASC;

--수정
UPDATE contents 
SET price=3000,dc=20,saleprice=2000,point=120
WHERE contentsno=2;

--삭제
DELETE FROM contents
WHERE contentsno=24;

--bookno 별 갯수 산출 
SELECT COUNT(*) as cnt
FROM contents
WHERE bookno=1;



--bookgrp,book,contents 테이블 조인
SELECT   r.bookgrpno,b.bookno,c.contentsno,c.memberno, r.seqno, r.grpname, b.bookname, b.rdate,
             c.title, c.content
FROM contents c
INNER JOIN book b
     ON  b.bookno=c.bookno
INNER JOIN bookgrp r
     ON  b.bookgrpno=r.bookgrpno
ORDER BY b.bookgrpno ASC;

commit;

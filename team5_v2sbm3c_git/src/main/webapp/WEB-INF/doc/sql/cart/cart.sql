/**********************************/
/* Table Name: 장바구니 */
/**********************************/
DROP TABLE cart;

CREATE TABLE cart(
		cartno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		contentsno                    		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(5)	 DEFAULT 1		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
   FOREIGN KEY (memberno) REFERENCES member (memberno),
   FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cartno is '장바구니번호';
COMMENT ON COLUMN cart.memberno is '회원번호';
COMMENT ON COLUMN cart.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN cart.cnt is '수량';
COMMENT ON COLUMN cart.rdate is '등록일';

DROP SEQUENCE cart_seq;

CREATE SEQUENCE cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
--CRUD

--등록
INSERT INTO cart(cartno, memberno, contentsno, cnt, rdate)
VALUES(cart_seq.nextval,1,2,1,sysdate);

INSERT INTO cart(cartno, memberno, contentsno, cnt, rdate)
VALUES(cart_seq.nextval,1,3,1,sysdate);

INSERT INTO cart(cartno, memberno, contentsno, cnt, rdate)
VALUES(cart_seq.nextval,1,11000,1,sysdate);

commit;

--조회
SELECT c.cartno, c.memberno, c.contentsno, c.cnt, c.rdate, i.title
FROM cart c, contents i
WHERE c.contentsno = i.contentsno and c.memberno=4
ORDER BY cartno DESC;


--전체 조회
SELECT m.cartno, m.memberno, m.contentsno, m.cnt, m.rdate, 
          c.title, c.content, c.thumb1, c.price, c.saleprice, c.dc, c.point
FROM cart m, contents c 
WHERE c.memberno=21 AND m.contentsno = c.contentsno 
ORDER BY cartno DESC;

--수정
UPDATE cart
SET cnt=10
WHERE cartno=1;

commit;

--전체 삭제 
DELETE FROM cart;

--선택 삭제 
DELETE FROM cart
WHERE cartno=17 and memberno=21;

commit;

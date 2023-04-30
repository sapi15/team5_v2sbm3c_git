/**********************************/
/* Table Name: 보관함 */
/**********************************/
DROP TABLE myroom;

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


DROP SEQUENCE myroom_seq;
CREATE SEQUENCE myroom_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
  
--등록
INSERT INTO myroom(myroomno, memberno, contentsno, rdate)
VALUES(myroom_seq.nextval, 4, 1, sysdate);

commit;

--조회
SELECT m.myroomno, m.memberno, m.contentsno, i.title, m.rdate
FROM myroom m, contents i
WHERE m.contentsno = i.contentsno and m.memberno = 4
ORDER BY myroomno DESC;

--전체 조회
SELECT m.myroomno, m.memberno, m.contentsno, i.title, m.rdate
FROM myroom m, contents i
WHERE m.contentsno = i.contentsno
ORDER BY myroomno DESC;

--수정 x

--전체 삭제 ?
DELETE FROM myroom;

--선택 삭제 ?
DELETE FROM myroom
WHERE myroomno=1;

commit;

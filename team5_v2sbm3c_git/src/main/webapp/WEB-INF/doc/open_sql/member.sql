/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE member;

CREATE TABLE member(
memberno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
name                           VARCHAR(20)  NOT NULL,
id                             VARCHAR(20)  NOT NULL,
passwd                         VARCHAR(30)  NOT NULL,
postcode		       VARCHAR(5)  NOT NULL,
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

DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

--등록
INSERT INTO member(memberno, name, id, passwd, postcode, address1, address2, tel, rdate, grade)
VALUES(member_seq.nextval, '홍길동', 'user1', '1234', '12345','주소1', '상세주소', '010-1234-5678', sysdate, 11);

INSERT INTO member(memberno, name, id, passwd, postcode, address1, address2, tel, rdate, grade)
VALUES(member_seq.nextval, '이길동', 'user2', '1234', '12345', '주소1', '상세주소', '010-1234-5678', sysdate, 11);

INSERT INTO member(memberno, name, id, passwd, postcode, address1, address2, tel, rdate, grade)
VALUES(member_seq.nextval, '최길동', 'user2', '1234', '12345', '주소1', '상세주소', '010-1234-5678', sysdate, 11);

COMMIT;


--조회
SELECT memberno, name, id, passwd, postcode, address1, address2, tel, rdate, grade
FROM member
WHERE memberno = 1;

SELECT memberno, name, id, passwd, postcode, address1, address2, tel, rdate, grade
FROM member
WHERE id = 'user1';


-- 목록
SELECT memberno, name, id, passwd, postcode, address1, address2, tel, rdate, grade
FROM member
ORDER BY memberno ASC;


--수정
UPDATE member
SET passwd='1234', postcode='11111', address1='주소1', address2='상세주소', tel='010-1234-5678'
WHERE memberno = 1;

COMMIT;


--삭제
DELETE FROM member
WHERE memberno=1;

COMMIT;


-- 로그인
SELECT COUNT(memberno) as cnt
FROM member
WHERE id='user1' AND passwd='1234';

    
-- 패스워드 변경 
-- 1) 패스워드 검사
SELECT COUNT(memberno) as cnt
FROM member
WHERE memberno=1 AND passwd='1234';
 
-- 2) 패스워드 수정
UPDATE member
SET passwd='1111'   
WHERE memberno=1;

COMMIT;


--아이디 찾기
SELECT id
FROM member
WHERE memberno=4;
 
 --패스워드 찾기
SELECT passwd
FROM member
WHERE memberno=4;

--회원등급 변경  ?
UPDATE member
set grade=99
where memberno=4;
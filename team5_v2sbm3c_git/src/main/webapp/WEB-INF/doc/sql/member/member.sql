/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE member cascade constraints;

CREATE TABLE member(
    memberno                          NUMBER(10)     NOT NULL  PRIMARY KEY,
    name                              VARCHAR2(20)     NOT NULL,
    id                                VARCHAR2(20)     NOT NULL,
    passwd                            VARCHAR2(30)     NOT NULL,
    email1                             VARCHAR2(20)        NOT NULL,
    email2                             VARCHAR2(20)       NOT NULL,
    email_yn                             VARCHAR2(1)       NOT NULL,
    postcode                          VARCHAR2(5)    NOT NULL,
    address1                          VARCHAR2(100)     NOT NULL,
    address2                          VARCHAR2(80)     NOT NULL,
    tel                               VARCHAR2(13)     NOT NULL,
    rdate                             DATE     NOT NULL,
    grade                             NUMBER(2)    DEFAULT 11    NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원번호';
COMMENT ON COLUMN member.name is '이름';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.passwd is '비밀번호';
COMMENT ON COLUMN member.email1 is '이메일주소1';
COMMENT ON COLUMN member.email2 is '이메일주소2';
COMMENT ON COLUMN member.email_yn is '이메일수신여부';
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
INSERT INTO member(memberno, name, id, passwd, email1, email2, email_yn, postcode, address1, address2, tel, rdate, grade)
VALUES(member_seq.nextval, '관리자', 'admin1', '1234', 'admin1', 'naver.com', 'Y', '12345', '주소1', '상세주소', '010-1234-5678', sysdate, 1);

INSERT INTO member(memberno, name, id, passwd, email1, email2, email_yn, postcode, address1, address2, tel, rdate, grade)
VALUES(member_seq.nextval, '홍길동', 'user1', '1234', 'user1', 'naver.com', 'Y', '12345','주소1', '상세주소', '010-1234-5678', sysdate, 99);

INSERT INTO member(memberno, name, id, passwd, email1, email2, email_yn, postcode, address1, address2, tel, rdate, grade)
VALUES(member_seq.nextval, '이길동', 'user2', '1234', 'user2', 'naver.com', 'Y', '12345', '주소1', '상세주소', '010-1234-5678', sysdate, 11);

INSERT INTO member(memberno, name, id, passwd, email1, email2, email_yn, postcode, address1, address2, tel, rdate, grade)
VALUES(member_seq.nextval, '최길동', 'user3', '1234', 'user3', 'naver.com', 'Y', '12345', '주소1', '상세주소', '010-1234-5678', sysdate, 11);

COMMIT;


--조회
SELECT memberno, name, id, passwd, email1, email2, email_yn, postcode, address1, address2, tel, rdate, grade
FROM member
WHERE memberno = 4;

SELECT memberno, name, id, passwd, email1, email2, email_yn, postcode, address1, address2, tel, rdate, grade
FROM member
WHERE id = 'user1';


-- 목록
SELECT memberno, name, id, passwd, email1, email2, email_yn, postcode, address1, address2, tel, rdate, grade
FROM member
ORDER BY memberno ASC;


--수정
UPDATE member
SET passwd='1234', postcode='11111', address1='주소1', address2='상세주소', tel='010-1234-5678',
        email1='email1', email2='email2', email_yn='N' 
WHERE memberno = 4;

COMMIT;


--삭제
DELETE FROM member
WHERE memberno=4;

DELETE FROM member;

COMMIT;


-- 로그인
SELECT COUNT(memberno) as cnt
FROM member
WHERE id='user1' AND passwd='1234';

SELECT COUNT(memberno) as cnt
FROM member
WHERE id='user2' AND passwd='1234' AND grade between 1 and 20;

    
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

--id 중복 확인, null값을 가지고 있으면 count에서 제외됨) 
SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';


--아이디 찾기
SELECT id
FROM member
WHERE memberno=19 AND grade between 1 and 20;
 
 --패스워드 찾기
SELECT passwd
FROM member
WHERE memberno=19 AND grade between 1 and 20;

--회원등급 변경  ?
UPDATE member
set grade=1
where memberno=3;


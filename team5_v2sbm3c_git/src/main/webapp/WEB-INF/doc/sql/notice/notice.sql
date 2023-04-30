/**********************************/
/* Table Name: 공지사항 */
/**********************************/
DROP TABLE notice;
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

DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999
    CACHE 2
    NOCYCLE;

--등록
INSERT INTO notice(noticeno, title, contents, rdate, views)
VALUES(notice_seq.nextval, '공지사항제목1', '공지사항내용1', sysdate, 0);

INSERT INTO notice(noticeno,  title, contents, rdate, views)
VALUES(notice_seq.nextval, '공지사항제목2', '공지사항내용2', sysdate, 0);

INSERT INTO notice(noticeno, title, contents, rdate, views)
VALUES(notice_seq.nextval, '공지사항제목3', '공지사항내용3', sysdate, 0);

COMMIT;


--목록
SELECT noticeno,  title, contents, rdate, views
FROM notice
ORDER BY noticeno DESC;

--조회
SELECT noticeno,  title, contents, rdate, views
FROM notice
WHERE noticeno=1;


--수정
UPDATE notice
SET title='공지사항제목수정', contents='공지사항내용수정'
WHERE noticeno=1;
COMMIT;

--삭제
DELETE FROM notice
WHERE noticeno=1;

COMMIT;
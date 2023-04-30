/**********************************/
/* Table Name: 이벤트 */
/**********************************/
DROP TABLE event;
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


DROP SEQUENCE event_seq;
CREATE SEQUENCE event_seq
    START WITH 1  --시작번호
    INCREMENT BY 1  --증가값
    MAXVALUE 999999 --최대값
    CACHE 2  
    NOCYCLE;
    
--등록
INSERT INTO event(eventno,  title, contents,  file1, file1saved, size1, thumb, rdate)
VALUES(event_seq.nextval, '이벤트제목2', '이벤트내용','', '', '', '', sysdate);

COMMIT;

--목록
SELECT eventno, title, contents, file1, file1saved, thumb, size1, rdate
FROM event
ORDER BY eventno DESC;

--조회
SELECT eventno, title, contents, file1, file1saved, thumb, size1, rdate
FROM event
WHERE eventno=1;

SELECT eventno, title, contents, file1, file1saved, thumb, size1, rdate
FROM event
WHERE title='이벤트제목1';

--수정
UPDATE event
SET title='이벤트제목수정', contents='이벤트내용수정', file1='', file1saved='', thumb='', size1=''
WHERE eventno=1;
COMMIT;

--삭제
DELETE FROM event
WHERE eventno=1;

COMMIT;
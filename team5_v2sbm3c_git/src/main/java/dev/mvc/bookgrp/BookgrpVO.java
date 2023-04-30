package dev.mvc.bookgrp;

/*
bookgrpno                         NUMERIC(10)    NOT NULL    PRIMARY KEY,
grpname                           VARCHAR(50)    NOT NULL,
seqno                             NUMERIC(7)     DEFAULT 0     NOT NULL,
rdate                             DATE     NOT NULL
*/
public class BookgrpVO {
  /**도서 그룹 번호   */
private int bookgrpno;
/**그룹이름   */
private String grpname;
/**출력 순서  */
private int seqno;
/**그룹 생성일  */
private String rdate;

public int getBookgrpno() {
  return bookgrpno;
}
public void setBookgrpno(int bookgrpno) {
  this.bookgrpno = bookgrpno;
}
public String getGrpname() {
  return grpname;
}
public void setGrpname(String grpname) {
  this.grpname = grpname;
}
public int getSeqno() {
  return seqno;
}
public void setSeqno(int seqno) {
  this.seqno = seqno;
}
public String getRdate() {
  return rdate;
}
public void setRdate(String rdate) {
  this.rdate = rdate;
}
}

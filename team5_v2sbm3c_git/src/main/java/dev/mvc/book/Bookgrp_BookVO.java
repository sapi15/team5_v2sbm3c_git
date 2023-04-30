package dev.mvc.book;

public class Bookgrp_BookVO {
  /**도서 그룹 번호   */
  private int r_bookgrpno;
  /**그룹이름   */
  private String r_grpname;
  /** 종류번호 */
  private int bookno;
  /** 도서 그룹 번호 */
  private int bookgrpno;
  /** 종류명 */
  private String bookname;
  /** 등록일 */
  private String rdate;
  public int getR_bookgrpno() {
    return r_bookgrpno;
  }
  public void setR_bookgrpno(int r_bookgrpno) {
    this.r_bookgrpno = r_bookgrpno;
  }
  public String getR_grpname() {
    return r_grpname;
  }
  public void setR_grpname(String r_grpname) {
    this.r_grpname = r_grpname;
  }
  public int getBookno() {
    return bookno;
  }
  public void setBookno(int bookno) {
    this.bookno = bookno;
  }
  public int getBookgrpno() {
    return bookgrpno;
  }
  public void setBookgrpno(int bookgrpno) {
    this.bookgrpno = bookgrpno;
  }
  public String getBookname() {
    return bookname;
  }
  public void setBookname(String bookname) {
    this.bookname = bookname;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}

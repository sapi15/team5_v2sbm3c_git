package dev.mvc.book;

/*
bookno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
bookgrpno                         NUMBER(10)     NULL ,
bookname                          VARCHAR2(50)     NOT NULL,
rdate                             DATE     NOT NULL,
*/
public class BookVO {
  /** 종류번호 */
  private int bookno;
  /** 도서 그룹 번호 */
  private int bookgrpno;
  /** 종류명 */
  private String bookname;
  /** 등록일 */
  private String rdate;

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

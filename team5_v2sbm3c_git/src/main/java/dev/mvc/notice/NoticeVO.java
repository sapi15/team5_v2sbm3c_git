package dev.mvc.notice;

/*
 * noticeno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
title                          VARCHAR2(200)  NOT NULL,
contents                       CLOB  NOT NULL,
rdate                          DATE  NOT NULL,
views                          NUMBER(10)  DEFAULT 0  NOT NULL
 */
public class NoticeVO {
  private int noticeno;
  private String title;
  private String contents;
  private String rdate;
  private int views;
  
  public int getNoticeno() {
    return noticeno;
  }
  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getViews() {
    return views;
  }
  public void setViews(int views) {
    this.views = views;
  }
  
  
}

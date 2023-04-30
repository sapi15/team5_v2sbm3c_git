package dev.mvc.event;

import org.springframework.web.multipart.MultipartFile;

/*
 *  eventno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    title                             VARCHAR2(200)    NOT NULL,
    contents                          CLOB  NOT NULL,
    file1                             VARCHAR2(100)    NULL ,
    file1saved                        VARCHAR2(100)    NULL ,
    thumb                             VARCHAR2(100)    NULL ,
    size1                             NUMBER(10)     NULL ,
    rdate                             DATE     NOT NULL
 */
public class EventVO {
  private int eventno;
  private String title ="";
  private String contents="";
  private String file1="";
  private String file1saved="";
  private String thumb="";
  private long size1;
  private String rdate="";
  
  /*
   * 이미지 MultipartFile
   */
  private MultipartFile file1MF;
  
  /**
   * 파일 크기 단위 출력
   */
  private String size1_label;
  
  
  
  
  
  public String getSize1_label() {
    return size1_label;
  }
  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  public int getEventno() {
    return eventno;
  }
  public void setEventno(int eventno) {
    this.eventno = eventno;
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
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile1saved() {
    return file1saved;
  }
  public void setFile1saved(String file1saved) {
    this.file1saved = file1saved;
  }
  public String getThumb() {
    return thumb;
  }
  public void setThumb(String thumb) {
    this.thumb = thumb;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}

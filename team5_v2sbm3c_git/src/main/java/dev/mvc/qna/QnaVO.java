package dev.mvc.qna;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {
  /**
   * CREATE TABLE qna(
      qnano                             NUMBER(10)     NOT NULL    PRIMARY KEY,
      order_itemno                      NUMBER(10)     NOT NULL,
      title                             VARCHAR2(100)    NULL ,
      content                           CLOB     NULL ,
      qdate                             DATE     NULL ,
      reply                             CLOB     NULL ,
      rdate                             DATE     NULL ,
      file1                             VARCHAR2(100)    NULL ,
      file1saved                        VARCHAR2(100)    NULL ,
      thumb1                            VARCHAR2(100)    NULL ,
      size1                             NUMBER(10)     NULL ,
      memberno                          NUMBER(10)     NULL ,
      state                             NUMBER(1)    NULL ,
    FOREIGN KEY (order_itemno) REFERENCES order_item (order_itemno)
  );
    */
  private int qnano;
  private int order_itemno;
  private long size1;
  private int memberno;
  private int state = 0;
  
  private String title = "";
  private String content = "";
  private String qdate = "";
  private String rdate = "";
  private String file1 = "";
  private String file1saved = "";
  private String thumb1 = "";
  private String reply = "";
  
  /** 
  이미지 MultipartFile 
  <input type='file' class="form-control" name='file1MF' id='file1MF' 
                   value='' placeholder="파일 선택">
  */
  private MultipartFile file1MF;
  
  /**
   * 파일 크기 단위 출력
   */
  private String size1_label;
  
  public int getQnano() {
    return qnano;
  }
  public void setQnano(int qnano) {
    this.qnano = qnano;
  }
  public int getOrder_itemno() {
    return order_itemno;
  }
  public void setOrder_itemno(int order_itemno) {
    this.order_itemno = order_itemno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getQdate() {
    return qdate;
  }
  public void setQdate(String qdate) {
    this.qdate = qdate;
  }
  public String getReply() {
    return reply;
  }
  public void setReply(String reply) {
    this.reply = reply;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
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
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getState() {
    return state;
  }
  public void setState(int state) {
    this.state = state;
  }
  
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  public String getSize1_label() {
    return size1_label;
  }
  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }
  @Override
  public String toString() {
    return "QnaVO [qnano=" + qnano + ", state=" + state + ", qdate=" + qdate + ", rdate=" + rdate + ", reply=" + reply
        + "]";
  }
  
}

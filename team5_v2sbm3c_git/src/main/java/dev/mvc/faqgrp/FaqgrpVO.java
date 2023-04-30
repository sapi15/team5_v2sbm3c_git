package dev.mvc.faqgrp;

/*
 * CREATE TABLE faqgrp(
faqgrpno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
name                           VARCHAR2(200)  NOT NULL
);
 */
public class FaqgrpVO {

  private int faqgrpno;
  private String name;
  
  public int getFaqgrpno() {
    return faqgrpno;
  }
  public void setFaqgrpno(int faqgrpno) {
    this.faqgrpno = faqgrpno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  
  
}

package dev.mvc.faq;
/*
 * faqno                          NUMBER(10)  NOT NULL  PRIMARY KEY,
faqgrpno                       NUMBER(10)  NOT NULL,
title                          VARCHAR2(500)  NOT NULL,
answer                         CLOB  NOT NULL,
 */
public class FaqVO {

  private int faqno;
  private int faqgrpno;
  private String title;
  private String answer;
  public int getFaqno() {
    return faqno;
  }
  public void setFaqno(int faqno) {
    this.faqno = faqno;
  }
  public int getFaqgrpno() {
    return faqgrpno;
  }
  public void setFaqgrpno(int faqgrpno) {
    this.faqgrpno = faqgrpno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getAnswer() {
    return answer;
  }
  public void setAnswer(String answer) {
    this.answer = answer;
  }
  
  
  
}

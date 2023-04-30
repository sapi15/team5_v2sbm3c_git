package dev.mvc.faq;
/*
 * SELECT r.faqgrpno as r_faqgrpno, r.name as r_name,
           c.faqno, c.faqgrpno, c.title
    FROM faqgrp r, faq c
    WHERE r.faqgrpno = c.faqgrpno
    ORDER BY faqgrpno ASC, faqno ASC
 */
public class Faqgrp_FaqVO {

  private int r_faqgrpno;
  private String r_name;
  
  private int faqno;
  private int faqgrpno;
  private String title;
  private String answer;
  public int getR_faqgrpno() {
    return r_faqgrpno;
  }
  public void setR_faqgrpno(int r_faqgrpno) {
    this.r_faqgrpno = r_faqgrpno;
  }
  public String getR_name() {
    return r_name;
  }
  public void setR_name(String r_name) {
    this.r_name = r_name;
  }
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

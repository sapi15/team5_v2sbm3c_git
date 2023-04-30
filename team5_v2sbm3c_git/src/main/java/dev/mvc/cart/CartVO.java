package dev.mvc.cart;

public class CartVO {
/*
 *  cartno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                          NUMBER(10)     NOT NULL,
    contentsno                        NUMBER(10)     NOT NULL,
    cnt                               NUMBER(5)  DEFAULT 1     NOT NULL,
    rdate                             DATE     NOT NULL,
 */

  /** cart 컬럼 */
  private int cartno;
  private int memberno;
  private int contentsno;
  private int cnt;
  private String rdate;
  
  /*
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB   NOT NULL,
    thumb1                            VARCHAR2(100)    NULL ,
    price                             NUMBER(10)     NULL ,
    saleprice                         NUMBER(10)     NULL ,
    dc                                NUMBER(10)     NULL ,
    point                             NUMBER(10)     NULL ,
   */
  
  /** contents 컬럼*/
  private String title;
  private String content;
  private String thumb1;  // 사진
  private int price;
  private int saleprice;
  private int dc;
  private int point;
  
  /** 추가 */
  /** 최종 금액*/
  private int tot;
  /** 총 수량*/
  private int tot_cnt;

  
  public int getCartno() {
    return cartno;
  }

  public void setCartno(int cartno) {
    this.cartno = cartno;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getContentsno() {
    return contentsno;
  }

  public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
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

  public String getThumb1() {
    return thumb1;
  }

  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public int getSaleprice() {
    return saleprice;
  }

  public void setSaleprice(int saleprice) {
    this.saleprice = saleprice;
  }

  public int getDc() {
    return dc;
  }

  public void setDc(int dc) {
    this.dc = dc;
  }

  public int getPoint() {
    return point;
  }

  public void setPoint(int point) {
    this.point = point;
  }

  public int getTot() {
    return tot;
  }

  public void setTot(int tot) {
    this.tot = tot;
  }

  public int getTot_cnt() {
    return tot_cnt;
  }

  public void setTot_cnt(int tot_cnt) {
    this.tot_cnt = tot_cnt;
  }
  
  

  
  
  
  
}

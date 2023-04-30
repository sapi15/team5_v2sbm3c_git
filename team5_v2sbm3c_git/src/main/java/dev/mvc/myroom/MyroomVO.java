package dev.mvc.myroom;

public class MyroomVO {
  /*
    myroomno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                          NUMBER(10)     NOT NULL ,
    contentsno                        NUMBER(10)     NOT NULL ,
    rdate                             DATE     NOT NULL,
   */

    /** myroom 컬럼 */
    private int myroomno;
    private int memberno;
    private int contentsno;
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
    
    
    
    public int getMyroomno() {
      return myroomno;
    }
    public void setMyroomno(int myroomno) {
      this.myroomno = myroomno;
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
    
    

}

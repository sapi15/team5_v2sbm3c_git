package dev.mvc.contents;

import org.springframework.web.multipart.MultipartFile;

/*
    contentsno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    bookno                            NUMBER(10)     NOT NULL ,
    memberno                          NUMBER(10)     NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB   NOT NULL,
    recom                             NUMBER(7)    NOT NULL,
    word                              VARCHAR2(300)    NULL ,
    rdate                             DATE     NOT NULL,
    file1                             VARCHAR2(100)    NULL ,
    file1saved                        VARCHAR2(100)    NULL ,
    thumb1                            VARCHAR2(100)    NULL ,
    size1                             NUMBER(10)     NULL ,
    price                             NUMBER(10)     NULL ,
    saleprice                         NUMBER(10)     NULL ,
    dc                                NUMBER(10)     NULL ,
    point                             NUMBER(10)     NULL ,
    salecnt                           NUMBER(10)     NULL ,
    writer                            VARCHAR2(10)     NULL ,
    publisher                         VARCHAR2(10)     NULL ,
 */
public class ContentsVO {
  /** 컨텐츠 번호 */
  private int contentsno;
  /** 회원 번호 */
  private int memberno;
  /** 종류 번호*/
  private int bookno;
  /** 제목 */
  private String title = "";
  /** 내용 */
  private String content = "";
  /** 추천수 */
  private int recom;
  /** 조회수 */
  private int cnt = 0;
  /** 댓글수 */
  private int replycnt = 0;
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String word = "";
  /** 등록 날짜 */
  private String rdate = "";
  
  /** 메인 이미지 */
  private String file1 = "";
  /** 실제 저장된 메인 이미지 */
  private String file1saved = "";  
  /** 메인 이미지 preview */
  private String thumb1 = "";
  /** 메인 이미지 크기 */
  private long size1;

  /** 정가 */
  private int price;
  /** 할인률 */
  private int dc;
  /** 판매가 */
  private int saleprice;
  /** 포인트 */
  private int point;
  /** 재고 수량 */
  private int salecnt;
  
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
  /** 저자  */
  private String writer;
  /** 출판사  */
  private String publisher;
  public int getContentsno() {
    return contentsno;
  }
  public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
  }

  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
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
  public int getRecom() {
    return recom;
  }
  public void setRecom(int recom) {
    this.recom = recom;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getReplycnt() {
    return replycnt;
  }
  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
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
  public int getSalecnt() {
    return salecnt;
  }
  public void setSalecnt(int salecnt) {
    this.salecnt = salecnt;
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
  public int getBookno() {
    return bookno;
  }
  public void setBookno(int bookno) {
    this.bookno = bookno;
  }
  public String getWriter() {
    return writer;
  }
  public void setWriter(String writer) {
    this.writer = writer;
  }
  public String getPublisher() {
    return publisher;
  }
  public void setPublisher(String publisher) {
    this.publisher = publisher;
  } 
  
  
}



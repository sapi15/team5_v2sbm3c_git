package dev.mvc.member;

public class MemberVO {
  
  /*
   memberno                          NUMBER(10)     NOT NULL,
    name                              VARCHAR2(20)     NOT NULL,
    id                                VARCHAR2(20)     NOT NULL,
    passwd                            VARCHAR2(30)     NOT NULL,
    postcode                          VARCHAR2(5)    NOT NULL,
    address1                          VARCHAR2(50)     NOT NULL,
    address2                          VARCHAR2(50)     NOT NULL,
    tel                               VARCHAR2(13)     NOT NULL,
    rdate                             DATE     NOT NULL,
    grade                             NUMBER(2)    DEFAULT 11    NOT NULL,
    email1                             VARCHAR2(20)        NOT NULL,
    email2                             VARCHAR2(20)       NOT NULL,
    email_yn                             VARCHAR2(1)       NOT NULL
   * 
   */
  
  /** 회원 번호*/
  private int memberno;
  /** 회원 이름*/
  private String name;
  /** 회원 아이디*/
  private String id;
  /** 회원 패스워드*/
  private String passwd;
  /** 이메일주소1 */
  private String email1;
  /** 이메일주소2 */
  private String email2;
  /** 이메일수신여부 */
  private String email_yn;
  /** 회원 우편번호*/
  private String postcode;
  /** 주소1*/
  private String address1;
  /** 상세주소*/
  private String address2;
  /** 전화번호 */
  private String tel;
  /** 등록번호 */
  private String rdate;
  /** 회원등급 */
  private int grade;
  
  
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getEmail1() {
    return email1;
  }
  public void setEmail1(String email1) {
    this.email1 = email1;
  }
  public String getEmail2() {
    return email2;
  }
  public void setEmail2(String email2) {
    this.email2 = email2;
  }
  public String getEmail_yn() {
    return email_yn;
  }
  public void setEmail_yn(String email_yn) {
    this.email_yn = email_yn;
  }
  public String getPostcode() {
    return postcode;
  }
  public void setPostcode(String postcode) {
    this.postcode = postcode;
  }
  public String getAddress1() {
    return address1;
  }
  public void setAddress1(String address1) {
    this.address1 = address1;
  }
  public String getAddress2() {
    return address2;
  }
  public void setAddress2(String address2) {
    this.address2 = address2;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getGrade() {
    return grade;
  }
  public void setGrade(int grade) {
    this.grade = grade;
  }
  @Override
  public String toString() {
    return "MemberVO [memberno=" + memberno + ", name=" + name + ", id=" + id + ", passwd=" + passwd + ", email1="
        + email1 + ", email2=" + email2 + ", email_yn=" + email_yn + ", postcode=" + postcode + ", address1=" + address1
        + ", address2=" + address2 + ", tel=" + tel + ", rdate=" + rdate + ", grade=" + grade + "]";
  }
  
  

  
  
  

}

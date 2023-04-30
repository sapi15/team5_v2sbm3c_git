package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberProcInter {
  
  /**
   * 회원 가입
   * @param meberVO
   * @return
   */
  public int create(MemberVO meberVO);
  
  /**
   * ID중복 확인
   * @param id
   * @return
   */
  public int checkID(String id);
  
  /**
   * 회원번호로 회원정보 조회
   * @param memberno
   * @return
   */
  public MemberVO read(int memberno);
  
  /**
   * 회원id로 회원정보 조회
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  /**
   * 로그인 처리
   */
  public int login(Map<String, Object> map);
  
  /**
   * 로그인된 회원 계정인지 검사.
   * @param session
   * @return true: 관리자
   */
  public boolean isMember(HttpSession session);   
  
  /**
   * 로그인된 관리자 계정인지 검사.
   * @param session
   * @return true: 관리자
   */
  public boolean isAdmin(HttpSession session);   
  
  /**
   * 회원목록
   * @return
   */
  public List<MemberVO> list();
  
  /**
   * 회원정보 수정
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * 삭제
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  /**
   * 현재 패스워드 검사
   * @param map
   * @return 0: 일치하지 않음, 1: 일치함
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * 패스워드 변경
   * @param map
   * @return
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * id찾기 전 개인정보 검사
   * @param map
   * @return
   */
  public int id_personal_check(HashMap<Object, Object> map);
  
  /**
   * id찾기 전 memberno 추출
   * @param map
   * @return
   */
  public int id_memberno_check(HashMap<Object, Object> map);
  
  /**
   * ID 찾기
   * @param memberno
   * @return
   */
  public String id_find(int memberno);
  
  /**
   *  passwd찾기 전 개인정보 검사
   * @param map
   * @return
   */
  public int passwd_personal_check(HashMap<Object, Object> map);
  
  /**
   * passwd찾기 전 memberno 추출
   * @param map
   * @return
   */
  public int passwd_memberno_check(HashMap<Object, Object> map);
  
  /**
   * passwd 찾기
   * @param memberno
   * @return
   */
  public String passwd_find(int memberno);
  
  /**
   * 회원 탈퇴
   * @param map
   * @return
   */
  public int grade_update(HashMap<Object, Object> map);
  

  

}

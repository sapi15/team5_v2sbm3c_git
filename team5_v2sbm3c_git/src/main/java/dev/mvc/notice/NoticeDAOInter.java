package dev.mvc.notice;

import java.util.List;


public interface NoticeDAOInter {
  /*
   * 등록
   */
  public int create(NoticeVO noticeVO);
  /*
   * 목록
   */
  public List<NoticeVO> list();
  
  /*
   * 조회
   */
  public NoticeVO read(int noticeno);
  /*
   * 수정
   */
  public int update(NoticeVO noticeVO);
  
  /*
   * 삭제
   */
  public int delete(int noticeno);

}

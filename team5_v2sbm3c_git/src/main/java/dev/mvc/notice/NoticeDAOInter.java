package dev.mvc.notice;

import java.util.List;


public interface NoticeDAOInter {
  /*
   * ���
   */
  public int create(NoticeVO noticeVO);
  /*
   * ���
   */
  public List<NoticeVO> list();
  
  /*
   * ��ȸ
   */
  public NoticeVO read(int noticeno);
  /*
   * ����
   */
  public int update(NoticeVO noticeVO);
  
  /*
   * ����
   */
  public int delete(int noticeno);

}

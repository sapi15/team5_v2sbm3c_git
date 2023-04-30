package dev.mvc.myroom;

import java.util.List;

public interface MyroomDAOInter {
  
  /**
   * 보관함 담기
   * @param myroomVO
   * @return
   */
  public int create(MyroomVO myroomVO);
  
  /**
   * 삭제
   * @param myroomno
   * @return
   */
  public int delete(int myroomno);
  
  /**
   * 보관함 목록
   * @param memberno
   * @return
   */
  public List<MyroomVO> list_by_memberno(int memberno);
  
  

}

package dev.mvc.book;

import java.util.List;

public interface BookProcInter {
  /**
   * 등록
   * 
   * @param chVO
   * @return 등록된 레코드 갯수
   */
  public int create(BookVO bookVO);

  /**
   * 목록
   * 
   * @return
   */
  public List<BookVO> list_all();
  
  /**
   * bookgrpno별 목록
   * 
   * @return
   */
  public List<BookVO> list_by_bookgrpno(int bookgrpno);
  
  /**
   * bookgrp + book join, 연결 목록
   * 
   * @return
   */
  public List<Bookgrp_BookVO> list_all_join();
 
  /**
   * 조회, 수정폼
   * 
   * @param - 카테고리 그룹 번호, PK
   * @return
   */
  public BookVO read(int bookno);

  /**
   * 수정 처리
   * 
   * @param bookVO
   * @return 처리된 레코드 갯수
   */
  public int update(BookVO bookVO);
  
  /**
   * 삭제 처리
   * @param bookno
   * @return 처리된 레코드 갯수
   */
  public int delete(int bookno);
  
  /**
   * 특정 그룹에 속한 레코드 갯수 산출
   * @param bookgrpno
   * @return
   */
  public int count_by_bookgrpno(int bookgrpno);
  
  /**
   * bookgrpno가 같은 모든 레코드 삭제
   * @param bookgrpno
   * @return
   */
  public int delete_by_bookgrpno(int bookgrpno);
}

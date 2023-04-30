package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

import dev.mvc.contents.ContentsVO;

public interface EventProcInter {
  /*
   * 등록
   */
  public int create(EventVO eventVO);
  /*
   * 목록
   */
  public List<EventVO> list();
  /*
   * 검색
   */
  public List<EventVO> list_search(HashMap<String, Object> hashMap);
  /*
   * 검색 갯수
   */
  public int search_count(HashMap<String, Object> hashMap);
  /*
   * 조회
   */
  public EventVO read(int eventno);
  /*
   * 조회 데이터 6개
   */
  public List<EventVO> read_index();
    /*
     * 수정
     */
  public int update(EventVO eventVO);
  /*
   * 삭제
   */
  public int delete(int eventno);
  

}

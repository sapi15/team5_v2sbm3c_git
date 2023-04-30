package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.mvc.event.EventVO;

public interface ContentsDAOInter {
  /**
   * �벑濡�
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);
  
  /**
   * 移댄뀒怨좊━蹂� 寃��깋 �젅肄붾뱶 媛��닔
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 寃��깋 + �럹�씠吏� 紐⑸줉
   * @param map
   * @return
   */
  public List<ContentsVO> list_by_bookno_search_paging(HashMap<String, Object> map);
  

  
  /**
   * 議고쉶
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
  
  /**
   * �뀓�뒪�듃 �젙蹂� �닔�젙
   * @param contentsVO
   * @return
   */
  public int update_text(ContentsVO contentsVO);
  
  /**
   * �뙆�씪 �젙蹂� �닔�젙
   * @param contentsVO
   * @return
   */
  public int update_file(ContentsVO contentsVO);
  /**
   * �듅�젙 洹몃９�뿉 �냽�븳 �젅肄붾뱶 媛��닔 �궛異�
   * @param bookno
   * @return
   */
  public int count_by_bookno(int bookno);
  
  /**
   * �궘�젣
   * @param contentsno
   * @return
   */
   public int delete(int contentsno);
  
   /**
    * 異붿쿇�닔 利앷�
    * @param contentsno
    * @return
    */
   public int update_recom(int contentsno);
   

   /*
    * 조회 데이터 6개
    */
   public List<ContentsVO> read_index();
}







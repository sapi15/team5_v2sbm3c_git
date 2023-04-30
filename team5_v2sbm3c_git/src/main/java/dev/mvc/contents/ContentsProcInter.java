package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ContentsProcInter {
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
   * �럹�씠吏� 紐⑸줉 臾몄옄�뿴 �깮�꽦, Box �삎�깭
   * @param list_file 紐⑸줉 �뙆�씪紐� 
   * @param bookno 醫낅쪟踰덊샇
   * @param search_count 寃��깋 媛��닔
   * @param now_page �쁽�옱 �럹�씠吏�, now_page�뒗 1遺��꽣 �떆�옉
   * @param word 寃��깋�뼱
   * @return
   */
  public String pagingBox(String list_file, int bookno, int search_count, int now_page, String word);
  
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
   * �뀓�뒪�듃 �닔�젙�슜 議고쉶
   * @param contentsno
   * @return
   */
  public ContentsVO read_update_text(int contentsno);
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











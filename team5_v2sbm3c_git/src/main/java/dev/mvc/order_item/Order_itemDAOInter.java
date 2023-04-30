package dev.mvc.order_item;

import java.util.HashMap;
import java.util.List;

public interface Order_itemDAOInter {
  /**
   * 등록
   * @param order_itemVO
   * @return
   */
  public int create(Order_itemVO order_itemVO);
  
  /**
   * 회원별 주문 결재 목록
   * @param order_payno
   * @return
   */
  public List<Order_itemVO> list_by_memberno(HashMap<String, Object> map);
  
  /**
   * qna 관련 read
   * @param map
   * @return
   */
  public Order_itemVO read_itemInfo_qna(HashMap<String, Object> hashMap);
} 


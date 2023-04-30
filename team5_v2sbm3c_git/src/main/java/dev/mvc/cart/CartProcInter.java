package dev.mvc.cart;

import java.util.List;

public interface CartProcInter {
  
  /**
   * cart 담기
   * @param cartVO
   * @return
   */
  public int create(CartVO cartVO);
  
  /**
   * 삭제
   * @param cartno
   * @return
   */
  public int delete(int cartno);

  
  /**
   * 장바구니 목록
   * @param memebrno
   * @return
   */
  public List<CartVO> list_by_memberno(int memebrno);
  
  /**
   * 수량 업데이트
   * @param cartVO
   * @return
   */
  public int update_cnt(CartVO cartVO);

}

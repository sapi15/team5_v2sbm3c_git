package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

public interface QnaProcInter {

  /**
   * QnA 등록
   * @param qnaVO
   * @return
   */
  public int create(QnaVO qnaVO);
  
  /**
   * 회원별 QnA 목록 조회 (회원)
   * @param memberno
   * @return
   */
  public List<QnaVO> list_by_member(int memberno);
  
  /**
   * QnA 목록 조회 (관리자)
   * 답변완료 된 QnA 제외
   * @return
   */
  public List<QnaVO> list_by_admin();
  
  /**
   * 문의 건별 QnA 상세 조회 (회원 관리자)
   * @param hashMap
   * @return
   */
  public QnaVO read_qnaInfo(int qnano);
  
  /**
   * 문의 답글 달기 (관리자)  
   * @param hashMap
   * @return
   */

  public int write_reply(HashMap<String, Object> hashMap);
}

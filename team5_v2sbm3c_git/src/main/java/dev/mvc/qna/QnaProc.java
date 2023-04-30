package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.qna.QnaProc")
public class QnaProc implements QnaProcInter{

  @Autowired
  private QnaDAOInter QnaDAO;
  
  @Override
  public int create(QnaVO qnaVO) {
    int cnt = this.QnaDAO.create(qnaVO);
    return cnt;
  }
  
  @Override
  public List<QnaVO> list_by_member(int memberno) {
    List<QnaVO> list = this.QnaDAO.list_by_member(memberno);
    return list;
  }
  
  @Override
  public List<QnaVO> list_by_admin() {
    List<QnaVO> list = this.QnaDAO.list_by_admin();
    return list;
  }

  @Override
  public QnaVO read_qnaInfo(int qnano) {
    QnaVO qnaVO = this.QnaDAO.read_qnaInfo(qnano);
    return qnaVO;
  }

  @Override
  public int write_reply(HashMap<String, Object> hashMap) {
    int cnt = this.QnaDAO.write_reply(hashMap);
    return cnt;
  }


}

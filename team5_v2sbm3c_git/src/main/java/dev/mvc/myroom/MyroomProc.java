package dev.mvc.myroom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.myroom.MyroomProc")
public class MyroomProc implements MyroomProcInter{
  @Autowired
  private MyroomDAOInter myroomDAO;

  @Override
  public int create(MyroomVO myroomVO) {
    int cnt = this.myroomDAO.create(myroomVO);
    return cnt;
  }

  @Override
  public int delete(int myroomno) {
    int cnt = this.myroomDAO.delete(myroomno);
    return cnt;
  }

  @Override
  public List<MyroomVO> list_by_memberno(int memberno) {
    List<MyroomVO> list = this.myroomDAO.list_by_memberno(memberno);
    return list;
  }
  
  
}

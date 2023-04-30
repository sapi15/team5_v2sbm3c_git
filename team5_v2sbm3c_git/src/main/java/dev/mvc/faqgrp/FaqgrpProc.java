package dev.mvc.faqgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.faqgrp.FaqgrpProc")
public class FaqgrpProc implements FaqgrpProcInter {

  @Autowired
  private FaqgrpDAOInter faqgrpDAO;
  
  
  @Override
  public int create(FaqgrpVO faqgrpVO) {
    int cnt = faqgrpDAO.create(faqgrpVO);
    
    return cnt;
  }


  @Override
  public List<FaqgrpVO> list() {
    List<FaqgrpVO> list=null;
    list = this.faqgrpDAO.list();
    return list;
  }


  @Override
  public FaqgrpVO read(int faqgrpno) {
    FaqgrpVO faqgrpVO = this.faqgrpDAO.read(faqgrpno);
    return faqgrpVO;
  }


  @Override
  public int update(FaqgrpVO faqgrpVO) {
    int cnt = 0;
    cnt = this.faqgrpDAO.update(faqgrpVO);
    
    return cnt;
  }


  @Override
  public int delete(int faqgrpno) {
    int cnt = 0;
    cnt = this.faqgrpDAO.delete(faqgrpno);
    
    return cnt;
  }

}

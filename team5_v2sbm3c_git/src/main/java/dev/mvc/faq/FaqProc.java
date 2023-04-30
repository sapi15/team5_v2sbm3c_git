package dev.mvc.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.faq.FaqProc")
public class FaqProc implements FaqProcInter {

  @Autowired
  private FaqDAOInter faqDAO;
  
  public FaqProc() {
    System.out.println("-> FaqProc created.");
  }
  @Override
  public int create(FaqVO faqVO) {
    int cnt = this.faqDAO.create(faqVO);
    return cnt;
  }
  @Override
  public List<FaqVO> list_by_faqgrpno(int faqgrpno) {
    List<FaqVO> list=this.faqDAO.list_by_faqgrpno(faqgrpno);
    
   return list;
  }
  @Override
  public List<Faqgrp_FaqVO> list_join() {
   List<Faqgrp_FaqVO> list = this.faqDAO.list_join();
   return list;
  }
  @Override
  public FaqVO read(int faqno) {
    FaqVO faqVO = this.faqDAO.read(faqno);
    return faqVO;
  }
  @Override
  public int update(FaqVO faqVO) {
    int cnt = this.faqDAO.update(faqVO);
    return cnt;
  }
  @Override
  public int delete(int faqno) {
   int cnt = this.faqDAO.delete(faqno);
   return cnt;
  }
  
  
  

}

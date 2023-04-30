package dev.mvc.faq;

import java.util.List;

public interface FaqDAOInter {

  public int create(FaqVO faqVO);
  public List<FaqVO> list_by_faqgrpno(int faqgrpno);
  public List<Faqgrp_FaqVO> list_join();
  public FaqVO read(int faqno);
  public int update(FaqVO faqVO);
  public int delete(int faqno);
}

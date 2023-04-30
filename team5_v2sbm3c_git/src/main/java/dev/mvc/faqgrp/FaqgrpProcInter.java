package dev.mvc.faqgrp;

import java.util.List;

public interface FaqgrpProcInter {
  public int create(FaqgrpVO faqgrpVO);
  public List<FaqgrpVO> list();
  public FaqgrpVO read(int faqgrpno);
  public int update(FaqgrpVO faqgrpVO);
  public int delete(int faqgrpno);
}

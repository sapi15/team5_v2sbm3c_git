package dev.mvc.bookgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component("dev.mvc.bookgrp.BookgrpProc")
public class BookgrpProc implements BookgrpProcInter {
  @Autowired 
  private BookgrpDAOInter BookgrpDAO;
  
  @Override
  public int create(BookgrpVO bookgrpVO) {
    int cnt =BookgrpDAO.create(bookgrpVO);
    return cnt;
  }

  @Override
  public List<BookgrpVO> list_bookgrpno_asc() {
    List<BookgrpVO> list=this.BookgrpDAO.list_bookgrpno_asc();
    return list;
  }

  @Override
  public List<BookgrpVO> list_seqno_asc() {
    List<BookgrpVO> list=this.BookgrpDAO.list_seqno_asc();
    return list;
  }

  @Override
  public BookgrpVO read(int bookgrpno) {
    BookgrpVO bookgrpVO=this.BookgrpDAO.read(bookgrpno);
    return bookgrpVO;
  }

  @Override
  public int update(BookgrpVO bookgrpVO) {
    int cnt =this.BookgrpDAO.update(bookgrpVO);
    return cnt;
  }

  @Override
  public int delete(int bookgrpno) {
    int cnt =this.BookgrpDAO.delete(bookgrpno);
    return cnt;
  }

}

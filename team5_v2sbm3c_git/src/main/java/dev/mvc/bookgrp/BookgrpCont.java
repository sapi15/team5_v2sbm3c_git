package dev.mvc.bookgrp;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.book.BookProcInter;



@Controller
public class BookgrpCont {
  @Autowired 
  @Qualifier("dev.mvc.bookgrp.BookgrpProc")
  private BookgrpProcInter bookgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.book.BookProc")
  private BookProcInter bookProc;
  
  public BookgrpCont() {
    System.out.println("-> BookgrpCont created.");
  }
  
  // http://localhost:9091/bookgrp/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/bookgrp/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/bookgrp/create");
    
    return mav; // forward
}
  
  // http://localhost:9091/bookgrp/create.do
  /**
   * 등록 처리
   * @param bookgrpVO
   * @return
   */
  @RequestMapping(value="/bookgrp/create.do", method=RequestMethod.POST )
  public ModelAndView create(BookgrpVO bookgrpVO) { 
    ModelAndView mav = new ModelAndView();
    int cnt = this.bookgrpProc.create(bookgrpVO); // 등록 처리
    
    if (cnt == 1) {
      mav.setViewName("redirect:/bookgrp/list.do");   
    } else {
      mav.addObject("code", "create"); 
      mav.setViewName("/bookgrp/error_msg"); 
    }

    return mav; // forward
  }
  
  /**
   * Ajax 기반 목록
   * http://localhost:9091/bookgrp/list.do
   * @return
   */
  @RequestMapping(value="/bookgrp/list.do", method=RequestMethod.GET )
  public ModelAndView list_ajax() {
    ModelAndView mav = new ModelAndView();
    
    // 등록 순서별 출력    
    // List<CategrpVO> list = this.bookgrpProc.list_bookgrpno_asc();
    
    // 출력 순서별 출력
    List<BookgrpVO> list = this.bookgrpProc.list_seqno_asc();
        
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/bookgrp/list_ajax"); // /WEB-INF/views/categrp/list_ajax.jsp
    return mav;
  }
  
  /**
   * 조회 + 수정폼/삭제폼 + Ajax, , VO에서 각각의 필드를 JSON으로 변환하는경우
   * http://localhost:9091/bookgrp/read_ajax.do?bookgrpno=1
   * {"seqno":1,"rdate":"2021-07-02 15:04:12","grpname":"역사","bookgrpno":1}
   * @param bookgrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/bookgrp/read_ajax.do", 
                              method=RequestMethod.GET )
  @ResponseBody
  public String read_ajax(int bookgrpno) {
    BookgrpVO bookgrpVO = this.bookgrpProc.read(bookgrpno);
    
    JSONObject json = new JSONObject();
    json.put("bookgrpno", bookgrpVO.getBookgrpno());
    json.put("grpname", bookgrpVO.getGrpname());
    json.put("seqno", bookgrpVO.getSeqno());
    json.put("rdate", bookgrpVO.getRdate());
    
    // 자식 레코드의 갯수 추가
    int count_by_bookgrpno = this.bookProc.count_by_bookgrpno(bookgrpno);
    json.put("count_by_bookgrpno", count_by_bookgrpno);
    
    return json.toString();

  }

  
  // http://localhost:9091/bookgrp/update.do
  /**
   * 수정 처리
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/bookgrp/update.do", 
                              method=RequestMethod.POST )
  public ModelAndView update(BookgrpVO bookgrpVO) {
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.bookgrpProc.update(bookgrpVO);
    mav.addObject("cnt", cnt); // request에 저장
    //cnt=0; 에러 메세지 확인
    if (cnt == 1) {
      mav.setViewName("redirect:/bookgrp/list.do");   
    } else {
      mav.addObject("code", "update");
      mav.setViewName("/bookgrp/error_msg"); // /WEB-INF/views/categrp/update_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9091/bookgrp/delete.do
  /**
   * 삭제 처리
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/bookgrp/delete.do", 
                              method=RequestMethod.POST )
  public ModelAndView delete(int bookgrpno) {
    ModelAndView mav = new ModelAndView();
    
    BookgrpVO bookgrpVO = this.bookgrpProc.read(bookgrpno); // 삭제 정보
    mav.addObject("bookgrpVO", bookgrpVO);  // request 객체에 저장
    
    int cnt = this.bookgrpProc.delete(bookgrpno); // 삭제 처리
    mav.addObject("cnt", cnt);  // request 객체에 저장
    
    if (cnt == 1) {
      mav.setViewName("redirect:/bookgrp/list.do");   
    } else {
      mav.addObject("code", "delete");
      mav.setViewName("/bookgrp/delete_msg"); // /WEB-INF/views/categrp/delete_msg.jsp
    }

    return mav;
  }
 
}

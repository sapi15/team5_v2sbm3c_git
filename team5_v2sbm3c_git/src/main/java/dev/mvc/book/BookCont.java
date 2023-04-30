package dev.mvc.book;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.bookgrp.BookgrpProcInter;
import dev.mvc.bookgrp.BookgrpVO;
import dev.mvc.contents.ContentsProcInter;






@Controller
public class BookCont {

  @Autowired
  @Qualifier("dev.mvc.book.BookProc")
   private BookProcInter  bookProc;
  
  @Autowired
  @Qualifier("dev.mvc.bookgrp.BookgrpProc")
   private BookgrpProcInter  bookgrpProc;
  
   @Autowired
   @Qualifier("dev.mvc.contents.ContentsProc") 
    private ContentsProcInter contentsProc;
  
  
  public BookCont(){
    System.out.println("-->BookCont created");
  }
  
  // http://localhost:9091/book/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/book/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/book/create");
    return mav; // forward
  }
  
  /**
   * 새로고침을 방지
   * @return
   */
  @RequestMapping(value = "/book/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward

    return mav; // forward
  }
  
  /**
   * 등록 처리
   * 
   * @param chVO
   * @return
   */

  @RequestMapping(value = "/book/create.do", method = RequestMethod.POST)
  public ModelAndView create(BookVO bookVO) {

    ModelAndView mav = new ModelAndView();

    int cnt = this.bookProc.create(bookVO);// 등록 처리
    mav.setViewName("redirect:/book/msg.do"); 
    //cnt=0;
    if(cnt==1) {
    mav.addObject("bookgrpno", bookVO.getBookgrpno());
    mav.setViewName("redirect:/book/list_by_bookgrpno.do"); // /webapp/WEB-INF/views/favfield/create_msg.jsp
    }else {
      mav.addObject("code", "create");
      mav.addObject("bookgrpno", bookVO.getBookgrpno());
      mav.setViewName("/book/error_msg");
    }
    return mav; // forward
  }
  
  /**
   * 목록
   * 
   * @return
   */
  // http://localhost:9091/book/list_all.do
  @RequestMapping(value = "/book/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();

    // 등록 순서별 출력
    List<BookVO> list = this.bookProc.list_all();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/book/list_all"); // /webapp/WEB-INF/views/favfieldgrp/list_all.jsp
    return mav;
  }
  
  /**
   * 카테고리 그룹별 전체 목록 http://localhost:9091/book/list_by_bookgrpno.do?bookgrpno=1
   * ajax 기반
   * @return
   */
  @RequestMapping(value = "/book/list_by_bookgrpno.do", method = RequestMethod.GET)
  public ModelAndView list_by_chgrpno_ajax(int bookgrpno) {
    ModelAndView mav = new ModelAndView();

    List<BookVO> list = this.bookProc.list_by_bookgrpno(bookgrpno);
    mav.addObject("list", list); // request.setAttribute("list", list);

    BookgrpVO bookgrpVO = bookgrpProc.read(bookgrpno);// 카테고리 그룹 정보
    mav.addObject("bookgrpVO", bookgrpVO);

    mav.setViewName("/book/list_by_bookgrpno_ajax");
    return mav;
  }

  /**
   * bookgrp +book join, 연결 목록 http://localhost:9091/book/list_all_join.do
   * 
   * @return
   */
  @RequestMapping(value = "/book/list_all_join.do", method = RequestMethod.GET)
  public ModelAndView list_all_join() {
    ModelAndView mav = new ModelAndView();

    List<Bookgrp_BookVO> list = this.bookProc.list_all_join();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/book/list_all_join");
    return mav;
  }
  
  /**
   * 조회 + 수정폼 + Ajax, , VO에서 각각의 필드를 JSON으로 변환하는경우
   * http://localhost:9091/book/read_ajax.do?bookno=3
   * {"bookno":3,"rdate":"2021-07-02 16:49:59","bookname":"소설","bookgrpno":2}
   * @param bookgrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/book/read_ajax.do", 
                              method=RequestMethod.GET )
  @ResponseBody
  public String read_ajax(int bookno) {
   BookVO bookVO = this.bookProc.read(bookno);
    
    JSONObject json = new JSONObject();
    json.put("bookno", bookVO.getBookno());
    json.put("bookgrpno", bookVO.getBookgrpno());
    json.put("bookname", bookVO.getBookname());
    json.put("rdate", bookVO.getRdate());
    
    //자식 레코드의 갯수 추가 
    int count_by_bookno=this.contentsProc.count_by_bookno(bookno);
    json.put("count_by_bookno", count_by_bookno);
    
    return json.toString();

  }
  /**
   * 수정 처리
   * 
   * @param bookVO
   * @return
   */
  @RequestMapping(value = "/book/update.do", method = RequestMethod.POST)
  public ModelAndView update(BookVO bookVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.bookProc.update(bookVO);
    //cnt=0;
    if(cnt==1) {
    mav.addObject("cnt", cnt);
    mav.addObject("bookgrpno", bookVO.getBookgrpno());
    mav.addObject("bookname", bookVO.getBookname());
    mav.addObject("url", "/book/update_msg");
    mav.setViewName("redirect:/book/list_by_bookgrpno.do"); // update_msg.jsp
    }
    else {
      mav.addObject("code", "update"); // request에 저장
      mav.addObject("bookgrpno", bookVO.getBookgrpno());
      mav.setViewName("/book/error_msg");
    }
    return mav;
  }
  
  
  /**
   * 삭제 처리
   * 
   * @param bookVO
   * @return
   */
  @RequestMapping(value = "/book/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int bookno, int bookgrpno) {
    ModelAndView mav = new ModelAndView();
    BookVO bookVO = this.bookProc.read(bookno);
    int cnt = this.bookProc.delete(bookno);
    //cnt=0;
    if(cnt==1) {
      mav.addObject("cnt", cnt);
      mav.addObject("bookgrpno", bookVO.getBookgrpno());
      mav.addObject("bookname", bookVO.getBookname());
    mav.addObject("url", "/book/delete_msg");
    mav.setViewName("redirect:/book/list_by_bookgrpno.do"); // update_msg.jsp
    }else {
      mav.addObject("code", "delete");
      mav.addObject("bookgrpno", bookgrpno);
      mav.setViewName("/book/error_msg"); // delete_msg.jsp
    }
    return mav;
  }

  /**
   * bookgrpno가 같은 모든 레코드 삭제
   * 
   * @param bookVO
   * @return
   */
  @RequestMapping(value = "/book/delete_by_bookgrpno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_bookgrpno(int bookgrpno) {
    ModelAndView mav = new ModelAndView();
    int cnt = this.bookProc.delete_by_bookgrpno(bookgrpno);

    mav.addObject("bookgrpno", bookgrpno);

    mav.setViewName("redirect:/book/list_by_bookgrpno.do"); // 새로고침 문제 해결, request 초기화

    return mav;
  }
  
}

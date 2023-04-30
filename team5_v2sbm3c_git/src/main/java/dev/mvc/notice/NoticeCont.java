package dev.mvc.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class NoticeCont {

  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")
  private NoticeProcInter noticeProc;
  
  public NoticeCont() {
    System.out.println("-> NoticeCont created.");
  }
  
  /*
   * 새로고침방지
   */
  @RequestMapping(value="/notice/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    mav.setViewName(url);
    return mav; 
  }
  
  /*
   * 등록폼
   */
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();   
    mav.setViewName("/notice/create");
    return mav; 
  }
  
  /*
   * 등록처리
   */
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();   
    int cnt = this.noticeProc.create(noticeVO);

    mav.setViewName("redirect:./list.do");

    return mav; 
  }
  
  /*
   * 목록
   */
  @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
  public ModelAndView list() { 
    ModelAndView mav = new  ModelAndView(); 
    List<NoticeVO> list = this.noticeProc.list();
    mav.addObject("list", list);
    
    mav.setViewName("/notice/list");
    return mav; 
  }
  
  @RequestMapping(value = "/notice/list_admin.do", method = RequestMethod.GET)
  public ModelAndView list_admin() { 
    ModelAndView mav = new  ModelAndView(); 
    List<NoticeVO> list = this.noticeProc.list();
    mav.addObject("list", list);
    
    mav.setViewName("/notice/list_admin");
    return mav; 
  }
  
  /*
   * 조회
   */
  @RequestMapping(value="/notice/read.do", method=RequestMethod.GET )
  public ModelAndView read(int noticeno) {
    ModelAndView mav = new ModelAndView();

    NoticeVO noticeVO = this.noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);     
    mav.setViewName("/notice/read");        
    return mav;
  }
  
  /*
   * 수정
   */
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
  public ModelAndView update_text(int noticeno) {
    ModelAndView mav = new ModelAndView();
    
    NoticeVO noticeVO = this.noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);

    mav.setViewName("/notice/update"); 
    return mav;
  }
  
  
  /*
   * 수정 처리
   */
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
  public ModelAndView update(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.noticeProc.update(noticeVO); 
   
    
    mav.setViewName("redirect:./list.do"); 
    return mav; 
  }
  
  /*
   * 삭제
   */
  @RequestMapping(value="/notice/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int noticeno) { 
    ModelAndView mav = new  ModelAndView();
    NoticeVO noticeVO = this.noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);     
    mav.setViewName("/notice/delete"); 
    return mav; 
  }
  
  /*
   * 삭제 처리
   */
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpServletRequest request, int noticeno) {
    ModelAndView mav = new ModelAndView();
    NoticeVO vo = noticeProc.read(noticeno);
    int cnt = this.noticeProc.delete(noticeno); 
    
    mav.setViewName("redirect:/notice/list.do");
    return mav; 
  }   
}

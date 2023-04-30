package dev.mvc.faq;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.event.EventVO;
import dev.mvc.faqgrp.FaqgrpProcInter;
import dev.mvc.faqgrp.FaqgrpVO;
import dev.mvc.notice.NoticeVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class FaqCont {


  
  @Autowired
  @Qualifier("dev.mvc.faqgrp.FaqgrpProc")
  private FaqgrpProcInter faqgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.faq.FaqProc")
  private FaqProcInter faqProc;
  
  public FaqCont() {
    System.out.println("->FaqCont created.");
  }
  
  /*
   * 새로고침 방지
   */
  @RequestMapping(value="/faq/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); 
    
    return mav;
  }
  
  /*
   * 등록
   */
  @RequestMapping(value = "/faq/create.do", method = RequestMethod.GET)
  public ModelAndView create(int faqgrpno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/create"); 

    return mav;
  }
  
  /*
   * 등록처리
   */
  @RequestMapping(value = "/faq/create.do", method = RequestMethod.POST)
  public ModelAndView create(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.faqProc.create(faqVO);
    mav.addObject("cnt", cnt);
    mav.addObject("faqgrpno", faqVO.getFaqgrpno());
    mav.addObject("title", faqVO.getTitle());
    mav.addObject("answer", faqVO.getAnswer());
    //mav.addObject("url", "/faq/create_msg"); 
    
    mav.setViewName("redirect:./list_by_faqgrpno.do");
    return mav;
  }
  
  /*
   * 그룹별 목록
   */
  @RequestMapping(value = "/faq/list_by_faqgrpno.do", method = RequestMethod.GET)
  public ModelAndView list_by_faqgrpno(int faqgrpno) { 
    ModelAndView mav = new  ModelAndView();  
   
    FaqgrpVO faqgrpVO = this.faqgrpProc.read(faqgrpno);
    mav.addObject("faqgrpVO", faqgrpVO);
    
    List<FaqVO> list = this.faqProc.list_by_faqgrpno(faqgrpno);
    mav.addObject("list", list);

    mav.setViewName("/faq/list_by_faqgrpno");   
    return mav;
  }
  
  @RequestMapping(value = "/faq/list_by_faqgrpno_admin.do", method = RequestMethod.GET)
  public ModelAndView list_by_faqgrpno_admin(int faqgrpno) { 
    ModelAndView mav = new  ModelAndView();  
   
    FaqgrpVO faqgrpVO = this.faqgrpProc.read(faqgrpno);
    mav.addObject("faqgrpVO", faqgrpVO);
    
    List<FaqVO> list = this.faqProc.list_by_faqgrpno(faqgrpno);
    mav.addObject("list", list);

    mav.setViewName("/faq/list_by_faqgrpno_admin");   
    return mav;
  }
  
  /*
   * join
   */
  @RequestMapping(value="/faq/service_home.do", method=RequestMethod.GET )
  public ModelAndView list_join() {
    ModelAndView mav = new ModelAndView();
    
    List<Faqgrp_FaqVO> list = this.faqProc.list_join();
    mav.addObject("list", list); 

    mav.setViewName("/faq/service_home"); 
    return mav;
  }
  
  /*
   * 조회
   */
  @RequestMapping(value = "/faq/read.do", method = RequestMethod.GET)
  public ModelAndView read_update(int faqno, int faqgrpno) {
    ModelAndView mav = new ModelAndView();

    FaqgrpVO faqgrpVO = this.faqgrpProc.read(faqgrpno);
    mav.addObject("faqgrpVO", faqgrpVO);
    
    FaqVO faqVO = this.faqProc.read(faqno);
    mav.addObject("faqVO", faqVO);

    List<FaqVO> list = this.faqProc.list_by_faqgrpno(faqgrpno);
    mav.addObject("list", list);
    mav.setViewName("/faq/read"); 
    return mav;
  }
  
  
  /*
   * 수정
   */
  @RequestMapping(value = "/faq/update.do", method = RequestMethod.GET)
  public ModelAndView update(int faqno, int faqgrpno) {
    ModelAndView mav = new ModelAndView();
    FaqgrpVO faqgrpVO = this.faqgrpProc.read(faqgrpno);
    FaqVO faqVO = this.faqProc.read(faqno);
    mav.addObject("faqVO", faqVO);
    
    mav.setViewName("/faq/update");
    return mav; 
  }
  
  
  /*
   * 수정처리
   */
  @RequestMapping(value = "/faq/update.do", method = RequestMethod.POST)
  public ModelAndView update(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.faqProc.update(faqVO);
    mav.addObject("faqgrpno", faqVO.getFaqgrpno());
    mav.setViewName("redirect:/faq/list_by_faqgrpno.do");    
    
    return mav;
  }
  
  
  /*
   * 삭제
   */
  @RequestMapping(value="/faq/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int faqno, int faqgrpno) { 
    ModelAndView mav = new  ModelAndView(); 
    
    FaqVO faqVO = this.faqProc.read(faqno);
    mav.addObject("faqVO", faqVO);     
    
    mav.setViewName("/faq/delete"); 
    return mav; 
  }
  
  /*
   * 삭제처리
   */
  @RequestMapping(value = "/faq/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_post(int faqno, int faqgrpno) {
    ModelAndView mav = new ModelAndView();
    FaqVO faqVO = faqProc.read(faqno);
    mav.addObject("faqno", faqno);
    FaqgrpVO faqgrpVO = faqgrpProc.read(faqgrpno);
    mav.addObject("faqgrpno", faqgrpno);
    int cnt = this.faqProc.delete(faqno); 
    

    
    mav.setViewName("redirect:./list_by_faqgrpno.do");
    return mav; 
  }   
  
}

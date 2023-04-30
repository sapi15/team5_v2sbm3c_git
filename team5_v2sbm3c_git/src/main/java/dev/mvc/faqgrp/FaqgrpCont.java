package dev.mvc.faqgrp;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class FaqgrpCont {

  @Autowired
  @Qualifier("dev.mvc.faqgrp.FaqgrpProc")
  private FaqgrpProcInter faqgrpProc;
  
  public FaqgrpCont() {
    System.out.println("-> FaqgrpCont create.");
  }
  
  @RequestMapping(value="/faqgrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqgrp/create");
    
    return mav;
  }
  
  @RequestMapping(value="/faqgrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(FaqgrpVO faqgrpVO) {
    ModelAndView mav = new ModelAndView();
    int cnt = this.faqgrpProc.create(faqgrpVO);
    
    if(cnt==1) {
      mav.setViewName("redirect:/faqgrp/list.do");
    }else {
      mav.addObject("code", "create");
      mav.setViewName("/faqgrp/error_msg");
    }
  
    return mav;
  }
  

  @RequestMapping(value="/faqgrp/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    List<FaqgrpVO> list=this.faqgrpProc.list();
    mav.addObject("list", list);
    mav.setViewName("/faqgrp/list");
    return mav;
  }
  
  @RequestMapping(value="/faqgrp/read.do", method=RequestMethod.GET )
  @ResponseBody
  public String read(int faqgrpno) {
    FaqgrpVO faqgrpVO = this.faqgrpProc.read(faqgrpno);
    
    JSONObject json = new JSONObject();
    json.put("faqgrpno", faqgrpVO.getFaqgrpno());
    json.put("name", faqgrpVO.getName());
    
    return json.toString();
  }
  
  
  @RequestMapping(value="/faqgrp/update.do", method=RequestMethod.POST )
  public ModelAndView update(FaqgrpVO faqgrpVO) {
    ModelAndView mav = new ModelAndView();
    int cnt = this.faqgrpProc.update(faqgrpVO);
    mav.addObject("cnt", cnt);
    
    if(cnt == 1) {
      mav.setViewName("redirect:/faqgrp/list.do");
    }else {
      mav.setViewName("/faqgrp/update_msg");
    }
    
    return mav;
  }
  
  @RequestMapping(value = "/faqgrp/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int faqgrpno) {
    ModelAndView mav = new ModelAndView();

    FaqgrpVO faqgrpVO = this.faqgrpProc.read(faqgrpno); 
    mav.addObject("faqgrpVO", faqgrpVO); 

    int cnt = this.faqgrpProc.delete(faqgrpno); 
   

    if (cnt == 1) {
      mav.setViewName("redirect:/faqgrp/list.do");
    } else {
      mav.setViewName("/faqgrp/delete_msg"); 
    }

    return mav;
  }

  
  
  
}

package dev.mvc.team5;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.event.EventProcInter;
import dev.mvc.event.EventVO;

@Controller
public class HomeCont {
  public HomeCont() {
    System.out.println("-> HomeCont created.");
  }

  @Autowired
  @Qualifier("dev.mvc.event.EventProc")
  private EventProcInter eventProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;

  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public ModelAndView home() {
    ModelAndView mav = new ModelAndView();
    
    List<ContentsVO> list_contents = this.contentsProc.read_index();
    mav.addObject("list_contents", list_contents);
    
    List<EventVO> list_event = this.eventProc.read_index();
    mav.addObject("list_event", list_event);

    
    
    mav.setViewName("/index");     
    return mav;
  }
  
  
  
}



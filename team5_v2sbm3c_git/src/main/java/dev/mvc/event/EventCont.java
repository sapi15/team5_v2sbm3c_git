package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class EventCont {
  @Autowired
  @Qualifier("dev.mvc.event.EventProc")
  private EventProcInter eventProc;

  public EventCont() {
    System.out.println("-> EventCont created.");
  }
  
  /*
   * ���ΰ�ħ����
   */
  @RequestMapping(value="/event/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    mav.setViewName(url);
    return mav; 
  }
  
  /*
   * �����
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();   
    mav.setViewName("/event/create");
    return mav; 
  }
  
  /*
   * ���ó��
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, EventVO eventVO) {
    ModelAndView mav = new ModelAndView();   
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String file1 = "";          // ���� ���ϸ� image
    String file1saved = "";  // ����� ���ϸ�, image
    String thumb = "";     // preview image

    // ���� ��� Ȯ��
    String user_dir = System.getProperty("user.dir");
    System.out.println("--> User dir: " + user_dir);

    String upDir =  user_dir + "/src/main/resources/static/event/storage/"; // ���� ���
    
    // ���� ������ ����� fnamesMF ��ü�� ������.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="���� ����">
    MultipartFile mf = eventVO.getFile1MF();
    
    file1 = mf.getOriginalFilename(); // ���� ���ϸ�
    long size1 = mf.getSize();  // ���� ũ��
    
    if (size1 > 0) { // ���� ũ�� üũ
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      file1saved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1saved)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 200, height: 150
        thumb = Tool.preview(upDir, file1saved, 200, 150); 
      }
      
    }    
    
    eventVO.setFile1(file1);
    eventVO.setFile1saved(file1saved);
    eventVO.setThumb(thumb);
    eventVO.setSize1(size1);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    // Call By Reference: �޸� ����, Hashcode ����
    int cnt = this.eventProc.create(eventVO); 
    
    // -------------------------------------------------------------------
    // PK�� return
    // -------------------------------------------------------------------
    // System.out.println("--> contentsno: " + contentsVO.getContentsno());
    // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter ����
    // -------------------------------------------------------------------
    
//    if (cnt == 1) {
//      cateProc.increaseCnt(contentsVO.getCateno()); // �ۼ� ����
//    }
    mav.addObject("cnt", cnt);
    mav.addObject("eventno", eventVO.getEventno());
  
    mav.addObject("url", "/event/list_search");

    mav.setViewName("redirect:/event/list_search.do"); 
    
    return mav; 
  }
  
  /*
   * ���
   */
  @RequestMapping(value = "/event/list.do", method = RequestMethod.GET)
  public ModelAndView list() { 
    ModelAndView mav = new  ModelAndView();  
    List<EventVO> list = this.eventProc.list();
    mav.addObject("list", list);
    mav.setViewName("/event/list");
    return mav; 
  }
  
  /*
   * ��� + �˻�
   */
  @RequestMapping(value = "/event/list_search.do", method = RequestMethod.GET)
  public ModelAndView list_search(@RequestParam(value="word", defaultValue="") String word ) {
  ModelAndView mav = new ModelAndView(); 
  HashMap<String, Object> map = new HashMap<String, Object>(); 
  map.put("word", word); 
  List<EventVO> list = eventProc.list_search(map);
  mav.addObject("list", list);
  
  int search_count = eventProc.search_count(map);
  mav.addObject("search_count", search_count);

  mav.setViewName("/event/list_search");  
  return mav; 
}
  
  /*
   * Grid
   */
  @RequestMapping(value = "/event/list_grid.do", method = RequestMethod.GET)
  public ModelAndView list_grid(@RequestParam(value="word", defaultValue="") String word) {
    ModelAndView mav = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>(); 
    map.put("word", word); 
    
    List<EventVO> list = this.eventProc.list_search(map);
    mav.addObject("list", list);

    
    int search_count = eventProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    mav.setViewName("/event/list_grid");
    return mav; 
  }
  
  /*
   * ��ȸ
   */
  @RequestMapping(value="/event/read.do", method=RequestMethod.GET )
  public ModelAndView read(int eventno) {
    ModelAndView mav = new ModelAndView();
    
    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);
    
    mav.setViewName("/event/read");  
    return mav;
  }
  
  /*
   * ����
   */
  @RequestMapping(value = "/event/update.do", method = RequestMethod.GET)
  public ModelAndView update(int eventno) {
    ModelAndView mav = new ModelAndView();
    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);
    
    mav.setViewName("/event/update");
    return mav; 
  }
  /*
   * ����ó��
   */
  @RequestMapping(value = "/event/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpServletRequest request, EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
    EventVO vo = eventProc.read(eventVO.getEventno());
    String file1saved = vo.getFile1saved();
    String thumb = vo.getThumb();
    long size1 = 0;
    boolean sw = false;

    String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/event/storage/"; 

    sw = Tool.deleteFile(upDir, file1saved);  
    sw = Tool.deleteFile(upDir, thumb);    
   
    String file1 = "";        

    MultipartFile mf = eventVO.getFile1MF();
    
    file1 = mf.getOriginalFilename(); 
    size1 = mf.getSize(); 
    
    if (size1 > 0) { 
      file1saved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1saved)) { 
        thumb = Tool.preview(upDir, file1saved, 250, 200); 
      }
      
    }    
    
    eventVO.setFile1(file1);
    eventVO.setFile1saved(file1saved);
    eventVO.setThumb(thumb);
    eventVO.setSize1(size1);
    
    
    int cnt = this.eventProc.update(eventVO);
    mav.addObject("eventno", eventVO.getEventno());
//    mav.addObject("cnt", cnt); 
   
    
    mav.setViewName("redirect:./list_search.do"); 
    return mav; 
  }
  
  /*
   * ����
   */
  @RequestMapping(value="/event/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int eventno) { 
    ModelAndView mav = new  ModelAndView(); 
    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);     
    mav.setViewName("/event/delete"); 
    return mav; 
  }
  
  /*
   * ����ó��
   */
  @RequestMapping(value = "/event/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpServletRequest request, int eventno) {
    ModelAndView mav = new ModelAndView();

    EventVO vo = eventProc.read(eventno);

    
    String file1saved = vo.getFile1saved();
    String thumb = vo.getThumb();
    long size1 = 0;
    boolean sw = false;

    String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/event/storage/"; 

    sw = Tool.deleteFile(upDir, file1saved);  
    sw = Tool.deleteFile(upDir, thumb);    
  
    
    int cnt = this.eventProc.delete(eventno);
    
    mav.setViewName("redirect:/event/list_search.do"); 

    return mav; // forward
  }   
}

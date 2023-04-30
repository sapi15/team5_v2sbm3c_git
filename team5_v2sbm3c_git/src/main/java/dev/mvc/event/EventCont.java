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
   * 새로고침방지
   */
  @RequestMapping(value="/event/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    mav.setViewName(url);
    return mav; 
  }
  
  /*
   * 등록폼
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();   
    mav.setViewName("/event/create");
    return mav; 
  }
  
  /*
   * 등록처리
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, EventVO eventVO) {
    ModelAndView mav = new ModelAndView();   
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = "";          // 원본 파일명 image
    String file1saved = "";  // 저장된 파일명, image
    String thumb = "";     // preview image

    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir");
    System.out.println("--> User dir: " + user_dir);

    String upDir =  user_dir + "/src/main/resources/static/event/storage/"; // 절대 경로
    
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택">
    MultipartFile mf = eventVO.getFile1MF();
    
    file1 = mf.getOriginalFilename(); // 원본 파일명
    long size1 = mf.getSize();  // 파일 크기
    
    if (size1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1saved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1saved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        thumb = Tool.preview(upDir, file1saved, 200, 150); 
      }
      
    }    
    
    eventVO.setFile1(file1);
    eventVO.setFile1saved(file1saved);
    eventVO.setThumb(thumb);
    eventVO.setSize1(size1);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    // Call By Reference: 메모리 공유, Hashcode 전달
    int cnt = this.eventProc.create(eventVO); 
    
    // -------------------------------------------------------------------
    // PK의 return
    // -------------------------------------------------------------------
    // System.out.println("--> contentsno: " + contentsVO.getContentsno());
    // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
    // -------------------------------------------------------------------
    
//    if (cnt == 1) {
//      cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가
//    }
    mav.addObject("cnt", cnt);
    mav.addObject("eventno", eventVO.getEventno());
  
    mav.addObject("url", "/event/list_search");

    mav.setViewName("redirect:/event/list_search.do"); 
    
    return mav; 
  }
  
  /*
   * 목록
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
   * 목록 + 검색
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
   * 조회
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
   * 수정
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
   * 수정처리
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
   * 삭제
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
   * 삭제처리
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

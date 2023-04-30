package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.event.EventProc")
public class EventProc implements EventProcInter {
  
  @Autowired
  private EventDAOInter eventDAO;
  
  @Override
  public int create(EventVO eventVO) {
    int cnt = this.eventDAO.create(eventVO);
    return cnt;
  }

  @Override
  public List<EventVO> list() {
    List<EventVO> list = this.eventDAO.list();
    return list;
  }
  
  @Override
  public List<EventVO> read_index() {
    List<EventVO> list = this.eventDAO.read_index();
    return list;
  }

  @Override
  public List<EventVO> list_search(HashMap<String, Object> hashMap) {
    List<EventVO> list = eventDAO.list_search(hashMap);
    
    for(EventVO eventVO:list) {
      String contents=eventVO.getContents();
      if(contents.length() > 200) {
        contents = contents.substring(0, 200)+"...";
        eventVO.setContents(contents);
      }
    }
    
    return list;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = eventDAO.search_count(hashMap);
    return count;
  }

  @Override
  public EventVO read(int eventno) {
    EventVO eventVO = this.eventDAO.read(eventno);
    
    String title = eventVO.getTitle();
    String contents = eventVO.getContents();
    
    title = Tool.convertChar(title);  // 특수 문자 처리
    contents = Tool.convertChar(contents); 
    
    eventVO.setTitle(title);
    eventVO.setContents(contents);  
    
    long size1 = eventVO.getSize1();
    eventVO.setSize1_label(Tool.unit(size1));
    
    return eventVO;
  }

  @Override
  public int update(EventVO eventVO) {
   int cnt=this.eventDAO.update(eventVO);
   return cnt;
  }

  @Override
  public int delete(int eventno) {
   int cnt =this.eventDAO.delete(eventno);
   return cnt;
  }

}

package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;
@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter {

  @Autowired
  private NoticeDAOInter noticeDAO;
  
  @Override
  public int create(NoticeVO noticeVO) {
   int cnt = this.noticeDAO.create(noticeVO);
    return cnt;
  }

  @Override
  public List<NoticeVO> list() {
    List<NoticeVO> list = this.noticeDAO.list();
    return list;
  }

  @Override
  public NoticeVO read(int noticeno) {
    NoticeVO noticeVO = this.noticeDAO.read(noticeno);
    
    String title = noticeVO.getTitle();
    String contents = noticeVO.getContents();
    
    title = Tool.convertChar(title);
    contents = Tool.convertChar(contents);
    
    noticeVO.setTitle(title);
    noticeVO.setContents(contents);
    return noticeVO;
  }

  @Override
  public int update(NoticeVO noticeVO) {
    int cnt = this.noticeDAO.update(noticeVO);
    return cnt;
  }

  @Override
  public int delete(int noticeno) {
    int cnt = this.noticeDAO.delete(noticeno);
    return cnt;
  }

}

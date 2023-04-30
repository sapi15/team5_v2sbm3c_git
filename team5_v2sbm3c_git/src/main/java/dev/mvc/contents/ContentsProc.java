package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.event.EventVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.contents.ContentsProc")
public class ContentsProc implements ContentsProcInter {
  @Autowired
  private ContentsDAOInter contentsDAO;
  
  @Override
  public int create(ContentsVO contentsVO) {
    int cnt=this.contentsDAO.create(contentsVO);
    return cnt;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = contentsDAO.search_count(hashMap);
    return count;
  }
  


  @Override
  public String pagingBox(String list_file, int bookno, int search_count, int now_page, String word) {
    int total_page = (int)(Math.ceil((double)search_count/Contents.RECORD_PER_PAGE)); // �쟾泥� �럹�씠吏� �닔 
    int total_grp = (int)(Math.ceil((double)total_page/Contents.PAGE_PER_BLOCK)); // �쟾泥� 洹몃９  �닔
    int now_grp = (int)(Math.ceil((double)now_page/Contents.PAGE_PER_BLOCK));  // �쁽�옱 洹몃９ 踰덊샇
    
    // 1 group: 1 2 3
    // 2 group: 4 5 6
    // 3 group: 7 8 9
    int start_page = ((now_grp - 1) * Contents.PAGE_PER_BLOCK) + 1; // �듅�젙 洹몃９�쓽 �떆�옉  �럹�씠吏�  
    int end_page = (now_grp * Contents.PAGE_PER_BLOCK);               // �듅�젙 洹몃９�쓽 留덉�留� �럹�씠吏�   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*�쐞, �삤瑜몄そ, �븘�옒, �쇊履�*/"); 
    str.append("    margin:1px 2px 1px 2px; /*�쐞, �삤瑜몄そ, �븘�옒, �쇊履�*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*�쐞, �삤瑜몄そ, �븘�옒, �쇊履�*/"); 
    str.append("    margin:1px 2px 1px 2px; /*�쐞, �삤瑜몄そ, �븘�옒, �쇊履�*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("�쁽�옱 �럹�씠吏�: " + nowPage + " / " + totalPage + "  "); 
 
    // �씠�쟾 10媛� �럹�씠吏�濡� �씠�룞
    // now_grp: 1 (1 ~ 10 page)
    // now_grp: 2 (11 ~ 20 page)
    // now_grp: 3 (21 ~ 30 page) 
    // �쁽�옱 2洹몃９�씪 寃쎌슦: (2 - 1) * 10 = 1洹몃９�쓽 留덉�留� �럹�씠吏� 10
    // �쁽�옱 3洹몃９�씪 寃쎌슦: (3 - 1) * 10 = 2洹몃９�쓽 留덉�留� �럹�씠吏� 20
    int _now_page = (now_grp - 1) * Contents.PAGE_PER_BLOCK;  
    if (now_grp >= 2){ // �쁽�옱 洹몃９踰덊샇媛� 2�씠�긽�씠硫� �씠�쟾 洹몃９�쑝濡� 媛덉닔 �엳�뒗 留곹겕 �깮�꽦 
      str.append("<span class='span_box_1'><A href='"+list_file+"?&word="+word+"&now_page="+_now_page+"&bookno="+bookno+"'>�씠�쟾</A></span>"); 
    } 
 
    // 以묒븰�쓽 �럹�씠吏� 紐⑸줉
    for(int i=start_page; i<=end_page; i++){ 
      if (i > total_page){ // 留덉�留� �럹�씠吏�瑜� �꽆�뼱媛붾떎硫� �럹�씠 異쒕젰 醫낅즺
        break; 
      } 
  
      if (now_page == i){ // 紐⑸줉�뿉 異쒕젰�븯�뒗 �럹�씠吏�媛� �쁽�옱�럹�씠吏��� 媛숇떎硫� CSS 媛뺤“(李⑤퀎�쓣 �몺)
        str.append("<span class='span_box_2'>"+i+"</span>"); // �쁽�옱 �럹�씠吏�, 媛뺤“ 
      }else{
        // �쁽�옱 �럹�씠吏�媛� �븘�땶 �럹�씠吏��뒗 �씠�룞�씠 媛��뒫�븯�룄濡� 留곹겕瑜� �꽕�젙
        str.append("<span class='span_box_1'><A href='"+list_file+"?word="+word+"&now_page="+i+"&bookno="+bookno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10媛� �떎�쓬 �럹�씠吏�濡� �씠�룞
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // �쁽�옱 1洹몃９�씪 寃쎌슦: (1 * 10) + 1 = 2洹몃９�쓽 �떆�옉�럹�씠吏� 11
    // �쁽�옱 2洹몃９�씪 寃쎌슦: (2 * 10) + 1 = 3洹몃９�쓽 �떆�옉�럹�씠吏� 21
    _now_page = (now_grp * Contents.PAGE_PER_BLOCK)+1;  
    if (now_grp < total_grp){ 
      str.append("<span class='span_box_1'><A href='"+list_file+"?&word="+word+"&now_page="+_now_page+"&bookno="+bookno+"'>�떎�쓬</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public List<ContentsVO> list_by_bookno_search_paging(HashMap<String, Object> map) {
    /* 
    �럹�씠吏��뿉�꽌 異쒕젰�븷 �떆�옉 �젅肄붾뱶 踰덊샇 怨꾩궛 湲곗�媛�, nowPage�뒗 1遺��꽣 �떆�옉
    1 �럹�씠吏� �떆�옉 rownum: now_page = 1, (1 - 1) * 10 --> 0 
    2 �럹�씠吏� �떆�옉 rownum: now_page = 2, (2 - 1) * 10 --> 10
    3 �럹�씠吏� �떆�옉 rownum: now_page = 3, (3 - 1) * 10 --> 20
    */
    int begin_of_page = ((Integer)map.get("now_page") - 1) * Contents.RECORD_PER_PAGE;
   
    // �떆�옉 rownum 寃곗젙
    // 1 �럹�씠吏� = 0 + 1, 2 �럹�씠吏� = 10 + 1, 3 �럹�씠吏� = 20 + 1 
    int start_num = begin_of_page + 1;
    
    //  醫낅즺 rownum
    // 1 �럹�씠吏� = 0 + 10, 2 �럹�씠吏� = 0 + 20, 3 �럹�씠吏� = 0 + 30
    int end_num = begin_of_page + Contents.RECORD_PER_PAGE;   
    /*
    1 �럹�씠吏�: WHERE r >= 1 AND r <= 10
    2 �럹�씠吏�: WHERE r >= 11 AND r <= 20
    3 �럹�씠吏�: WHERE r >= 21 AND r <= 30
    */
    map.put("start_num", start_num);
    map.put("end_num", end_num);
   
    List<ContentsVO> list = this.contentsDAO.list_by_bookno_search_paging(map);
    
    for (ContentsVO contentsVO : list) { // �궡�슜�씠 160�옄 �씠�긽�씠硫� 160�옄留� �꽑�깮
      String content = contentsVO.getContent();
      if (content.length() > 160) {
        content = content.substring(0, 160) + "...";
        contentsVO.setContent(content);
      }
      
      String title = Tool.convertChar(contentsVO.getTitle());
      contentsVO.setTitle(title);
      
      // CKEditor �뿉�꽌�뒗 二쇱꽍 泥섎━ �븷 寃�.
      // content = Tool.convertChar(content);
      // contentsVO.setContent(content);
    }
    
    return list;
  }
  /**
   * 議고쉶
   */
  @Override
  public ContentsVO read(int contentsno) {
    ContentsVO contentsVO = this.contentsDAO.read(contentsno);
    
    String title = contentsVO.getTitle();
    String content = contentsVO.getContent();
    
    title = Tool.convertChar(title);  // �듅�닔 臾몄옄 泥섎━
    // content = Tool.convertChar(content); 
    
    contentsVO.setTitle(title);
    // contentsVO.setContent(content);  <--異붽��븯�땲猿� read�뿉�꽌 �뀒洹멸� 洹몃�濡� �굹�삤�뒗 臾몄젣 諛쒖깮
    
    long size1 = contentsVO.getSize1();
    contentsVO.setSize1_label(Tool.unit(size1));
    
    return contentsVO;
  }

  @Override
  public ContentsVO read_update_text(int contentsno) {
    ContentsVO contentsVO = this.contentsDAO.read(contentsno);
    return contentsVO;
  }
  

  @Override
  public int update_text(ContentsVO contentsVO) {
    int cnt = this.contentsDAO.update_text(contentsVO);
    return cnt;
  }

  @Override
  public int update_file(ContentsVO contentsVO) {
    int cnt = this.contentsDAO.update_file(contentsVO);
    return cnt;
  }
  @Override
  public int count_by_bookno(int bookno) {
    int cnt=this.contentsDAO.count_by_bookno(bookno);
    return cnt;
  }



  @Override
  public int delete(int contentsno) {
    int cnt=this.contentsDAO.delete(contentsno);
    return cnt;
  }

  @Override
  public int update_recom(int contentsno) {
    int cnt=this.contentsDAO.update_recom(contentsno);
    return cnt;
  }

  @Override
  public List<ContentsVO> read_index() {
    List<ContentsVO> list = this.contentsDAO.read_index();
    return list;
  }

}

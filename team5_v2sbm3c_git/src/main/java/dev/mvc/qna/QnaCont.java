package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.order_item.Order_itemProcInter;
import dev.mvc.order_item.Order_itemVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class QnaCont {

  @Autowired
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;

  @Autowired
  @Qualifier("dev.mvc.order_item.Order_itemProc")
  private Order_itemProcInter order_itemProc;

  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;

  public QnaCont() {
    System.out.println("-> QnaCont created.");
  }

  /**
   * QnA 등록
   * @param session
   * @param order_itemno
   * 
   * this.order_itemProc.read_itemInfo_qna(hashMap);
   * hashMap(memberno, order_itemno) memberno, order_itemno를
   * 통해 Order_itemVO를 조회하고 Order_itemVO의 contentsno를 통해
   * contents의 title을 가져옴 title은 qna페이지에서 어떠한 상품을 문의하는 것인지 알려줌
   * @return
   */
  @RequestMapping(value = "/qna/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session, int order_itemno) {
    ModelAndView mav = new ModelAndView();
    if (session.getAttribute("memberno") != null) {
      int memberno = (int) session.getAttribute("memberno");

      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("memberno", memberno);
      hashMap.put("order_itemno", order_itemno);
      Order_itemVO order_itemVO = this.order_itemProc.read_itemInfo_qna(hashMap);

      int contentsno = order_itemVO.getContentsno();
      ContentsVO contentsVO = this.contentsProc.read(contentsno);

      String book_title = contentsVO.getTitle();

      mav.addObject("book_title", book_title);
      mav.addObject("order_itemVO", order_itemVO);

      mav.setViewName("/qna/create");
    } else {
      mav.addObject("return_url","/qna/create");
      mav.setViewName("/member/login"); // return url로 수정
    }
    return mav;
  }

  /**
   * 등록 폼 처리
   * @param qnaVO
   * @return
   */
  @RequestMapping(value = "/qna/create.do", method = RequestMethod.POST)
  public ModelAndView create(QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = ""; // 원본 파일명 image
    String file1saved = ""; // 저장된 파일명, image
    String thumb1 = ""; // preview image

    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir");
    // System.out.println("-> User dir: " + user_dir);
    // --> User dir: F:\ai8\ws_frame\resort_v1sbm3a

    // 파일 접근임으로 절대 경로 지정, static 지정
    // 완성된 경로
    // F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage
    String upDir = user_dir + "/src/main/resources/static/qna/storage/"; // 절대 경로
    System.out.println("-> upDIr: " + upDir);
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF'
    // value='' placeholder="파일 선택">
    MultipartFile mf = qnaVO.getFile1MF();

    file1 = mf.getOriginalFilename(); // 원본 파일명
    long size1 = mf.getSize(); // 파일 크기

    if (size1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1saved = Upload.saveFileSpring(mf, upDir);

      if (Tool.isImage(file1saved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
        thumb1 = Tool.preview(upDir, file1saved, 250, 200);
      }

    }

    qnaVO.setFile1(file1);
    qnaVO.setFile1saved(file1saved);
    qnaVO.setThumb1(thumb1);
    qnaVO.setSize1(size1);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------

    int cnt = this.qnaProc.create(qnaVO);
    mav.addObject("cnt", cnt);
    mav.setViewName("/qna/create_msg");

    return mav;
  }

  /**
   * QnA 목록 (회원, 관리자)
   * @param session
   * @return
   */
  @RequestMapping(value = "/qna/list_qna.do", method = RequestMethod.GET)
  public ModelAndView read_by_memberno(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if (session.getAttribute("memberno") != null) { // 로그인 한 경우
      
      if ((int) session.getAttribute("grade") < 10) { // 관리자인 경우
        List<QnaVO> list = this.qnaProc.list_by_admin();
        mav.addObject("list", list);
        mav.setViewName("/qna/list_by_admin"); // 관리자 목록으로 이동
        
      } else { // 회원인 경우
        int memberno = (int) session.getAttribute("memberno");
        List<QnaVO> list = this.qnaProc.list_by_member(memberno);
        mav.addObject("list", list);
        mav.setViewName("/qna/list_by_member"); // 회원 QnA 목록으로 이동
      }
    } else { // 로그인 하지 않은 경우
      mav.addObject("return_url", "/qna/list_by_member.do");
      mav.setViewName("redirect:/member/login.do");
    }
    return mav;
  }
  
  /**
   * 문의 건별 QnA 상세 조회 (회원 관리자)
   * @param session
   * @param order_itemno
   * @return
   */
  @RequestMapping(value = "/qna/read_qnaInfo.do", method = RequestMethod.GET)
  public ModelAndView read_qnaInfo(HttpSession session, int qnano) {
    ModelAndView mav = new ModelAndView();
    if (session.getAttribute("memberno") != null) {
//      int memberno = (int)session.getAttribute("memberno");

      QnaVO qnaVO = this.qnaProc.read_qnaInfo(qnano);
      
      mav.addObject("qnaVO", qnaVO);
      mav.setViewName("/qna/read_qnaInfo");
    } else {
      mav.addObject("return_url", "/qna/read_qnaInfo.do");
      mav.setViewName("redirect:/member/login.do");
    }
    return mav;
  }
  
  /**
   * 답변.. (관리자)
   * @param session
   * @return
   */
  @RequestMapping(value = "/qna/write_reply.do", method = RequestMethod.GET)
  public ModelAndView write_reply(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    int cnt = 0;
    if((int) session.getAttribute("grade") < 10) {// 관리자만 답변 가능
      
      mav.setViewName("/qna/write_reply");
      
    } else { // 관리자가 아닌 경우

      mav.addObject("cnt", cnt);
//      mav.setViewName("/qna/error");
      mav.setViewName("redirect:/index.do"); // 추후 변경
    }
    return mav;
  }
  
  /**
   * 질문답변 처리 (관리자)
   * @param session
   * @param qnano
   * @param reply
   * @param state
   * @return
   */
  @RequestMapping(value = "/qna/write_reply.do", method = RequestMethod.POST)
  public ModelAndView write_reply(HttpSession session, int qnano, String reply, int state) {
    ModelAndView mav = new ModelAndView();
      
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("qnano", qnano);
      hashMap.put("reply", reply);
      hashMap.put("state", 1); // 답변상태 1로 변경
      int cnt = this.qnaProc.write_reply(hashMap);
      mav.addObject("cnt", cnt);
      mav.setViewName("redirect:/qna/list_qna.do");
    
    return mav;
  }
}

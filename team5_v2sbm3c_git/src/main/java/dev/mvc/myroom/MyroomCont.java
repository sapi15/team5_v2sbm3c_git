package dev.mvc.myroom;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cart.CartVO;

@Controller
public class MyroomCont {
  @Autowired
  @Qualifier("dev.mvc.myroom.MyroomProc")
  private MyroomProcInter myroomProc;
  
  public MyroomCont() {
    System.out.println("-> MyroomCont created.");
  }
  
  /**
   * 회원별 목록
   * http://localhost:9091/myroom/list_by_memberno.do
   * @return
   */
  @RequestMapping(value="/myroom/list_by_memberno.do", method=RequestMethod.GET )
  public ModelAndView list_by_memberno(HttpSession session,
                  @RequestParam(value="myroomno", defaultValue="0") int myroomno ) {
    ModelAndView mav = new ModelAndView();
    
    if (session.getAttribute("memberno") != null) { // 회원으로 로그인을 했다면 쇼핑카트로 이동
      int memberno = (int)session.getAttribute("memberno");
      // 출력 순서별 출력
      List<MyroomVO> list = this.myroomProc.list_by_memberno(memberno);
          
      mav.addObject("list", list); // request.setAttribute("list", list);
      mav.addObject("myroomno", myroomno); // 쇼핑계속하기에서 사용
      
      mav.setViewName("/myroom/list_by_memberno"); // /WEB-INF/views/categrp/list_by_memberno.jsp
      
    } else { // 회원으로 로그인하지 않았다면
      mav.addObject("return_url", "/myroom/list_by_memberno.do"); // 로그인 후 이동할 주소 ★
      
      mav.setViewName("redirect:/member/login.do"); // /WEB-INF/views/member/login_ck_form.jsp
    }
    return mav;
  }
  
/**
 * Ajax 등록 처리
 * @param session
 * @param contentsno
 * @return
 */
  @RequestMapping(value="/myroom/create_ajax.do", method=RequestMethod.POST )
  @ResponseBody
  public String create_ajax(HttpSession session, int contentsno) {
    MyroomVO myroomVO = new MyroomVO();
    myroomVO.setContentsno(contentsno);
    
    int memberno = (Integer)session.getAttribute("memberno");
    myroomVO.setMemberno(memberno);

    int cnt = this.myroomProc.create(myroomVO); // 등록 처리
    
    System.out.println(cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    System.out.println("-> myroomCont create: " + json.toString());

    return json.toString();
  }
  
  /**
   * 상품 삭제
   * http://localhost:9091/myroom/delete.do
   * @return
   */
  @RequestMapping(value="/myroom/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(HttpSession session,
                   @RequestParam(value="myroomno", defaultValue="0") int myroomno ) {
    ModelAndView mav = new ModelAndView();
    
    this.myroomProc.delete(myroomno);      
    mav.setViewName("redirect:/myroom/list_by_memberno.do");
    
    return mav;
  }
  
  /**
   * 선택/모두 삭제
   * @param categrpno
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/myroom/delete_ajax.do", method=RequestMethod.POST )
  public int delete_ajax(HttpSession session,
      @RequestParam(value = "chkbox[]") List<String> checkArr) {  
    
    // 세션 값 조회하기
    int memberno = (int)session.getAttribute("memberno"); 
    int myroomno=0;
    int result = 0; // '세션 없음' 을 의미
    
    if(memberno != 0) {  
       for(String cartMyroomno : checkArr) {   
         myroomno = Integer.parseInt(cartMyroomno);  
         this.myroomProc.delete(myroomno);  // 삭제 처리
       }   
       result = 1; // '세션 있음' 을 의미
     }  
    return result;  
   }
  
  
  
  
}

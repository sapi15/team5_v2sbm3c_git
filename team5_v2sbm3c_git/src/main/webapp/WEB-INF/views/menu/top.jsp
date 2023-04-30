<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(document).ready(function(){
    $('.book').click(function(){
      if($('.book').hasClass('book')){
         $('.book').addClass('close').removeClass('book');
         $('.board').css('visibility', 'visible');
      }else if($('.close').hasClass('close')){
         $('.close').addClass('book').removeClass('close');  
         $('.board').css('visibility', 'hidden');
      }
    });
  });

$(function(){
 $('#search_check').on('click', search_check); 
});

function search_check(){
	 
	   var word = $('#word').val(); 


  if($.trim(word).length==0){
/*    alert('검색어를 입력하세요'); */
 /*   location.href  ="/index.do"; */
    alert("검색어를 입력하세요");
     }else{
       location.href  ="/contents/list_by_bookno_search_paging.do?word="+word;
         } 
}

</script>

<DIV class='container_main'>

  <DIV class='main_header'>  
    <div class='logo'>   
    <A class='menu_link'  href='/' ><img src="/css/image/image.png" alt="My Image"></A>
    </div><!-- logo -->  
    <div class="login_menu">
        
         <c:choose>
        <c:when test="${sessionScope.id == null}"> <%-- 로그인 안 한 경 우 --%>
          <span><A class='menu_link'  href='/member/login.do' >로그인</A></span> |  &nbsp
          <span><a class="menu_link" href="/member/create.do">회원가입</a></span>  

        </c:when>
        <c:otherwise>
          
          
       
        
        
         ${sessionScope.id } <span><A class='menu_link'  href='/member/logout.do' >로그아웃</A></span> &nbsp
       
         
         <c:choose>
            <c:when test="${grade >= 1 and grade <= 10}"> <span><A class='menu_link'  href='/member/list.do' >회원목록</A></span>  &nbsp
             <span><a class="menu_link" class='menu_link' href='/member/read.do?memberno=${memberno }'>회원정보관리</a></span> &nbsp
            </c:when>    
           </c:choose>
        </c:otherwise>
      </c:choose>
      
               <c:choose>
            <c:when test="${grade >= 10}"> 
              <span><a class="menu_link" href="/order_pay/list_by_memberno.do">주문/결재내역</a></span> &nbsp
             <span><a class="menu_link" class='menu_link' href='/member/read.do?memberno=${memberno }'>회원정보관리</a></span> &nbsp
            </c:when>    
           </c:choose>

      <!-- <span><a class="menu_link" href="#">주문</a></span>  &nbsp -->
      <span><a class="menu_link" href="/cart/list_by_memberno.do">장바구니</a></span>  &nbsp
      <span><a class="menu_link" href="/myroom/list_by_memberno.do">보관함</a></span>  &nbsp
      
      <span><a class="menu_link" href="../faq/service_home.do">고객센터</a></span>
      
     
    </div><!-- login_menu --> 
    
<!--      <div class="search">
      <div class="search_input_main">
        <input type="text" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" placeholder="검색어 입력">
       </div>
       <div class="button_wrap">
        <a class="button" href="#"></a>
       </div>
     </div>
      -->
      
           <div class="search">
     
      
     

        
        
          <div class="search_input_main">
          <input style="border:none;" type='text' name='word' id='word' value='${param.word }'  >
          </div>
       
        <!-- search_input_main -->
      <button  id="search_check" class="button"></button>
      
      

 
   
    
      </div>
    
  </DIV><!-- main_header -->
 
<%--   <div class="main_gnb">
    <ul class="menu">

      <li class="menu1"><a class="menu_link" href="#">국내도서</a>
        <ul class="submenu">
          <li><a class="menu_link" href="#">sub1-1</a></li>
          <li><a class="menu_link" href="#">sub1-2</a></li>
        </ul>      
      </li>
      <li class="menu"><a class="menu_link" href="#">해외도서</a>
        <ul class="submenu">
          <li><a class="menu_link" href="#">sub2-1</a></li>
          <li><a class="menu_link" href="#">sub2-2</a></li>
        </ul>
       </li>
      <li class="menu"><a class="menu_link" href="#">e-book</a></li>
      
      
      
       
         
   <c:set var="grade" value="${sessionScope.grade}" />
  

    <c:choose>
      <c:when test="${grade >= 1 and grade <= 10}"><li class="menu"><span><A class='menu_link'  href='/event/list_search.do' >이벤트</A></span></li></c:when>    
      <c:when test="${grade >= 11 or grade == null}"><li class="menu"><span><A class='menu_link'  href='/event/list_grid.do' >이벤트</A></span></li></c:when>
    </c:choose>  
   
  
      
      

    </ul> 
  </div> --%>


<div>
    <ul class="menu">
       <li class="empty1"></li>
       <li><a class="book menu_link">도서 </a>

<div class="board">
  <ul class="list">
    <li style="font-size:15px;"><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=10100&now_page=1&word= ">소설</a></li>
    <br>
    <li style="font-size:15px;"><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=20100&now_page=1&word= ">시/에세이</a></li>
    <br>
    <li style="font-size:15px;"><a class="menu_link" href="#">경제/경영</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=30100&now_page=1&word= ">경영</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=30200&now_page=1&word= ">경제</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=30300&now_page=1&word= ">세무/회계</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=30400&now_page=1&word= ">마케팅/광고</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=30500&now_page=1&word= ">유통/창업</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=30600&now_page=1&word= ">재테크/금융</a></li>
  </ul>
  
  <ul class="list">
    <li style="font-size:15px;">인문</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=40100&now_page=1&word= ">인문학일반</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=40200&now_page=1&word= ">심리학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=40300&now_page=1&word= ">교육학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=40400&now_page=1&word= ">유아교육</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=40500&now_page=1&word= ">철학</a></li>
    <br>
    <li style="font-size:15px;">자기계발</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=50100&now_page=1&word= ">성공/처세</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=50200&now_page=1&word= ">자기능력계발</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=50300&now_page=1&word= ">인간관계</a></li>
  </ul>
  <ul class="list">
    <li style="font-size:15px;">과학</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=60100&now_page=1&word= ">과학이론</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=60200&now_page=1&word= ">수학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=60300&now_page=1&word= ">물리학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=60400&now_page=1&word= ">화학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=60500&now_page=1&word= ">생물학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=60600&now_page=1&word= ">지구과학</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=60700&now_page=1&word= ">천문학</a></li>
  </ul>
  <ul class="list">
    <li style="font-size:15px;">기술/공학</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=70100&now_page=1&word= ">토목/건설</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=70200&now_page=1&word= ">건축/인테리어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=70300&now_page=1&word= ">자동차/운전</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=70400&now_page=1&word= ">기계</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=70500&now_page=1&word= ">전기/전자</a></li>
    <br>
    <li style="font-size:15px;">자격증</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=80100&now_page=1&word= ">토익</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=80200&now_page=1&word= ">컴퓨터</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=80300&now_page=1&word= ">기능사</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=80400&now_page=1&word= ">산업기사</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=80500&now_page=1&word= ">기사</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=80600&now_page=1&word= ">기타자격증</a></li>
    </ul>
    <ul class="list">
    <li style="font-size:15px;">IT</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=90100&now_page=1&word= ">IT일반</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=90200&now_page=1&word= ">OS</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=90300&now_page=1&word= ">네트워크</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=90400&now_page=1&word= ">보안/해킹</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=90500&now_page=1&word= ">데이터베이스</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=90600&now_page=1&word= ">웹프로그래밍</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=90700&now_page=1&word= ">프로그래밍/언어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=90800&now_page=1&word= ">모바일프로그래밍</a></li>
  </ul>
  <ul class="list">
    <li style="font-size:15px;">중/고등참고서</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=100100&now_page=1&word= ">고등학교</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=100200&now_page=1&word= ">중학교</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=100300&now_page=1&word= ">논술/면접</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=100400&now_page=1&word= ">검정고시</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=100500&now_page=1&word= ">EBS</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=100600&now_page=1&word= ">올림피아드</a></li>
    <br>
    <li style="font-size:15px;">외국어</li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=110100&now_page=1&word= ">영어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=110200&now_page=1&word= ">중국어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=110300&now_page=1&word= ">일본어</a></li>
    <li><a class="menu_link" href="/contents/list_by_bookno_search_paging.do?bookno=110400&now_page=1&word= ">그 외 언어</a></li>
  </ul>
</div>

</li>
 <li><a class="menu_link" href="/">홈 </a></li>
 <c:choose>
      <c:when test="${grade >= 1 and grade <= 10}"><li ><A class='menu_link'  href='/event/list_search.do' >이벤트</A></li></c:when>    
      <c:when test="${grade >= 11 or grade == null}"><li><A class='menu_link'  href='/event/list_grid.do' >이벤트</A></li></c:when>
    </c:choose>  
</ul>
</div>
</DIV><!-- container_main -->

<%--내용--%>

 <DIV class='content'>
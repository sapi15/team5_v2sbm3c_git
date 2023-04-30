<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book World</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />

<DIV class='content_body'>
<DIV class='title_line'>고객센터</DIV>

<DIV class="side_menu">
  <ul>
     <li><span><A class='menu_link'  href="/qna/list_qna.do">1:1문의</A></span>
  </ul>
  
    <c:choose>
      <c:when test="${grade >= 1 and grade <= 10}">
      <div style="border-bottom:1px solid #666666; margin-top:5px; text-align:center;">관리자 전용 faq</div>
      <ul>    
     <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=1">주문/결제</A></span></li>
     <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=2">배송/수령일 안내</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=3">반품/교환/환불</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=4">도서/상품</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=5">서비스</A></span></li></ul>
      
      <div style="border-bottom:1px solid #666666; margin-top:5px; text-align:center;">관리자 전용 공지사항</div>
      <ul>
     <li class="side_menu_admin"><span><A class='menu_link'  href="/notice/list_admin.do">공지사항</A></span></li></ul>
     
      
      </c:when>    
    </c:choose> 
    
</DIV>


<DIV class="main">

<!-- <DIV class="faq_search">

  
      <div class="search_input">
        <input type="text"placeholder="검색어 입력" >
       </div>
       <div class="button_wrap">
        <a class="button" href="#"></a>
       </div>




</DIV> -->

<DIV class="notice_link">
  <a class="menu_link" href="../notice/list.do">공지사항</a>

</DIV>

<DIV class="faq_table">
  <TABLE>
    <colgroup>
      <col style="width:25%">
      <col style="width:15%">
      <col style="width:15%">
      <col style="width:15%">
      <col style="width:15%">
      <col style="width:15%">
     </colgroup>
      <TR>
        <TH class="th_head">주요 FAQ ></TH>
        <TH class="th"><a class="menu_link" href="/faq/list_by_faqgrpno.do?faqgrpno=1">주문/결제</a></TH>
        <TH class="th"><a class="menu_link" href="/faq/list_by_faqgrpno.do?faqgrpno=2">배송/수령일 안내</a></TH>
        <TH class="th"><a class="menu_link" href="/faq/list_by_faqgrpno.do?faqgrpno=3">반품/교환/환불</a></TH>
        <TH class="th"><a class="menu_link" href="/faq/list_by_faqgrpno.do?faqgrpno=4">도서/상품</a></TH>
        <TH class="th"><a class="menu_link" href="/faq/list_by_faqgrpno.do?faqgrpno=5">서비스</a></TH>
      </TR>
  </TABLE>
</DIV>

<DIV class="faq_new_list" style="height:100%;">
  <DIV class="sub_title">자주 묻는 질문</DIV>
  <div style="float:right; margin-right:10px;">
  
  </div>
    <TABLE class='table table-hover table-bordered'>
    <colgroup>
      <col style='width: 40%;'/>
      <col style='width: 60%;'/>
  

    </colgroup>
   
    <thead>  
    <TR class="th_head">
      <TH class="text-center">그룹</TH>
      <TH class="text-center">질문</TH>
 
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="faqgrp_FaqVO" items="${list}">
      <c:set var="r_faqgrpno" value="${faqgrp_FaqVO.r_faqgrpno }" />
      <c:set var="faqno" value="${faqgrp_FaqVO.faqno }" />
      <TR>
        <TD class="text-center">${faqgrp_FaqVO.r_name }</TD>
        <TD class="text-left"><a class="menu_link"  href="./read.do?faqgrpno=${r_faqgrpno}&faqno=${faqno}">${faqgrp_FaqVO.title }</a></TD>
        
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>

</DIV>

</DIV>


</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
 
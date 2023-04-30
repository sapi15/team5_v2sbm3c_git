<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
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
<DIV class='title_line'>
  <A href="../event/list.do" class='title_link'>공지사항</A>
  
     <ASIDE class="aside_right">
   <span><A class='menu_link'
              href='/faq/service_home.do'>고객센터</A></span>  &nbsp

  </ASIDE> 
   
</DIV>

<DIV class="side_menu">
 <ul>
      <li><span><A class='menu_link'  href="/qna/list_qna.do">1:1문의</A></span>
  </ul>
  
    <c:choose>
      <c:when test="${grade >= 1 and grade <= 10}">
      <ul><div style="border-bottom:1px solid #666666; margin-top:5px; text-align:center;">관리자 전용 faq</div>
     <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=1">주문/결제</A></span></li>
     <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=2">배송/수령일 안내</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=3">반품/교환/환불</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=4">도서/상품</A></span></li>
      <li class="side_menu_admin"><span><A class='menu_link'  href="/faq/list_by_faqgrpno_admin.do?faqgrpno=5">서비스</A></span></li></ul>
      
      <ul><div style="border-bottom:1px solid #666666; margin-top:5px; text-align:center;">관리자 전용 공지사항</div>
     <li class="side_menu_admin"><span><A class='menu_link'  href="/notice/list_admin.do">공지사항</A></span></li>
     
      
      </c:when>    
    </c:choose> 
</DIV>

<DIV class="main">



  <TABLE class="table  table-hover table-bordered">
    <colgroup>
  
      <col style='width: 100%;'/>    

    </colgroup>
   
    <thead>  
    <TR>
      <TH class="text-center">공지사항</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="noticeVO" items="${list}">
      <c:set var="noticeno" value="${noticeVO.noticeno }" /> 
      <c:set var="title" value="${noticeVO.title }" />
      <TR>
        <TD><a class="menu_link" href="../notice/read.do?noticeno=${noticeno}">${title }</a></TD>
        
      </TR>   
    </c:forEach> 
    </tbody>   
  </TABLE>

  
</DIV>


 </DIV>
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
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
<DIV class='title_line'>자주묻는 질문</DIV>


<DIV class="faq_search">


</DIV>

<DIV class="notice_link">


</DIV>






  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 60%;'/>
      <col style='width: 20%;'/>    

    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">그룹</TH>
      <TH class="th_bs">질문</TH>
      <TH class="th_bs">수정/삭제</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="faqgrp_FaqVO" items="${list}">
      <c:set var="r_faqgrpno" value="${faqgrp_FaqVO.r_faqgrpno }" />
      <c:set var="faqno" value="${faqVO.faqno }" />
      <TR>
        <TD class="td_bs">${faqgrp_FaqVO.r_name }</TD>
        <TD class="td_bs"><A class="menu_link"  href="./read.do?faqno=${faqno }"> ${faqgrp_FaqVO.title }</A></TD>
        
        <TD class="td_bs">
          <A href="./read_update.do?faqno=${faqno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?faqno=${faqno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
 
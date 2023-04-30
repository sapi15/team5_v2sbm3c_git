<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="title" value="${contentsVO.title }" />
<c:set var="content" value="${contentsVO.content }" />
<c:set var="word" value="${contentsVO.word }" />
<c:set var="price" value="${contentsVO.price }" />
<c:set var="dc" value="${contentsVO.dc }" />
<c:set var="saleprice" value="${contentsVO.saleprice }" />
<c:set var="point" value="${contentsVO.point }" />
<c:set var="writer" value="${contentsVO.writer }" />
<c:set var="publisher" value="${contentsVO.publisher }" />
<c:set var="contentsno" value="${contentsVO.contentsno }" />
         
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book World</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script> <!-- /static 기준 -->

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">

  
  $(function() {
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  });


</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 <DIV class='content_body'>
<DIV class='title_line'>
  <A href="../bookgrp/list.do" class='title_link'>도서 그룹</A> > 
  ${bookgrpVO.grpname } > ${bookVO.bookname } >
  ${title } 수정
</DIV>


  <ASIDE class="aside_right">
    <A href="./create.do?bookno=${bookVO.bookno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_bookno_search_paging.do?bookno=${bookVO.bookno }&now_page=${param.now_page}">기본 목록형</A>    
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_bookno_search.do'>
      <input type='hidden' name='bookno' value='${bookVO.bookno }'>
      <input type='hidden' name='now_page' value='${param.now_page }'>
      
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_bookno_search.do?bookno=${bookVO.bookno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type='hidden' name='now_page' value='${param.now_page }'>
    <input type='hidden' name='contentsno' value='${contentsno }'>
    <input type="hidden" name="bookno" value="${bookVO.bookno }">
 
    
    <div class="form-group">
       <label class="control-label col-md-2">상품명</label>
       <div class="col-md-10">
         <input type='text' name='title' value='${title }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">상품 설명</label>
       <div class="col-md-10">
         <textarea name='content' id='content' required="required" class="form-control" rows="20" style='width: 100%;'>${content }</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">검색어</label>
       <div class="col-md-10">
         <input type='text' name='word' value='${word }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>   
    <div class="form-group">
    
        <label class="control-label col-md-2">정가</label>
        
         <input type='number' name='price' value='${price }' required="required" autofocus="autofocus"
                    min="0" max="10000000" step="100" 
                    class="form-control" style='width: 10%;'>
        
       <label class="control-label col-md-2">할인률</label>

         <input type='number' name='dc' value='${dc }' required="required"
                    min="0" max="100" step="1" 
                    class="form-control" style='width: 10%;'>
             
        <label class="control-label col-md-2">판매가</label>
       
         <input type='number' name='saleprice' value='${saleprice }' required="required"
                    min="0" max="10000000" step="100" 
                    class="form-control" style='width: 10%;'>
    
         <label class="control-label col-md-2">포인트</label>
   
         <input type='number' name='point' value='${point }' required="required"
                    min="0" max="10000000" step="10" 
                    class="form-control" style='width: 10%;'>
               
    </div> 
       
    
    <div class="form-group">
       <label class="control-label col-md-2">저자</label>
       <div class="col-md-10">
         <input type='text' name='writer' value='${writer }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 20%;'>
       </div>
    </div>   
    
        <div class="form-group">
       <label class="control-label col-md-2">출판사</label>
       <div class="col-md-10">
         <input type='text' name='publisher' value='${publisher }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 20%;'>
       </div>
    </div> 
    
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


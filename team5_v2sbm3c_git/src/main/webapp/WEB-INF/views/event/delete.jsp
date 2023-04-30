<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="eventno" value="${eventVO.eventno }" />
<c:set var="title" value="${eventVO.title }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 <DIV class='content_body'>
 
<DIV class='title_line_update'>
  <A href="../event/list.do" class='title_link'>이벤트</A> > 
  ${title } 삭제
  
   <ASIDE class="aside_right">
    <A class='menu_link'  href="../event/list_search.do">리스트형</A>
    <span class='menu_divide' >│</span>
    <A class='menu_link'  href="../event/list_grid.do">갤러리형</A>
  </ASIDE> 
</DIV><!-- title_line_update -->



  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
      
        <DIV style='text-align: center; width: 100%; float: left;'>
          <c:set var="file1saved" value="${eventVO.file1saved.toLowerCase() }" />
          <c:set var="thumb" value="${eventVO.thumb }" />
          <c:choose>
            <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
              <IMG src="/event/storage/${file1saved }" style='width: 70%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              첨부 파일: ${file1}
            </c:otherwise>
          </c:choose>
        </DIV>

        <DIV style='text-align: left; width: 100%; float: left;'>
          
          <br>
          <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='eventno' value='${param.eventno}'>
              
              <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto;"></DIV>
                    
              <div class="form_update">   
                <div class="col-md-12" style='text-align: center; margin: 10px auto;'>
                  삭제 되는글: ${eventVO.title }<br><br>
                  삭제 되는 첨부파일: ${eventVO.file1 }<br><br>
                  삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
                </div>
                 
                 
                 <div class="container-fluid center-block"
          style="width: 250px; position: static; padding: 10px;">
                  <button type = "submit" class="btn bg-warning">삭제 진행</button>
                  <button type = "button" onclick = "history.back()" class="btn bg-warning">취소</button>
                </div>
              </div>   
          </FORM>
        </DIV>
      </li>
      <li class="li_none">

      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

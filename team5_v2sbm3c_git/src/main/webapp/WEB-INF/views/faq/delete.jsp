<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="faqno" value="${faqVO.faqno }" />
<c:set var="title" value="${faqVO.title }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book World</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">

</script>
</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 <DIV class='content_body'>
 
<DIV class='title_line_update'>
  <A href="../faq/list.do" class='title_link'>자주묻는질문 삭제</A>  
</DIV><!-- title_line_update -->

    <DIV class="main_update">
      <fieldset class="fieldset_basic">
        <ul>
          <li class="li_none"><span style='font-size: 1.5em;'>${title}</span>
            <br>
            <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='faqno' value='${param.faqno}'>
              <input type='hidden' name='faqgrpno'
                value='${param.faqgrpno}'>
              <DIV id='panel1'
                style="width: 40%; text-align: center; margin: 10px auto;"></DIV>

              <div class="form-group">
                <div class="col-md-12"
                  style='text-align: center; margin: 10px auto;'>
                  삭제 되는글: ${title }<br>
                  <br> 삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br>
                  <br>
                  <button type="submit" class="btn bg-warning">삭제
                    진행</button>
                  <button type="button" onclick="history.back()"
                    class="btn bg-warning">취소</button>
                </div>
              </div>
            </FORM></li>
          <li class="li_none"></li>
        </ul>
      </fieldset>
    </DIV>
    <!-- main_update -->

  </DIV><!-- content_body -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book World</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    
<script type="text/javascript">
  $(function(){ 
    $('#btn_retry').on('click', function() { 
      location.href="./login.do"
    });

    $('#btn_home').on('click', function() { 
      location.href="/index.do"
    });    
  });
</script>
 
</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
   <DIV class='content_body'>
<DIV class='title_line' style="width: 90%">알림</DIV>
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
<%--         <c:choose>
          <c:when test="${grade == 99}"> 
            <li class='li_none'>· 회원이 아닙니다.</li>
              <button type="button" id="btn_retry" class="btn btn-primary btn-md">로그인 다시 시도</button>
              <button type="button" id="btn_home" class="btn btn-primary btn-md">확인</button>
          </c:when>
          <c:otherwise> --%>
            <li class='li_none'>· 회원 로그인에 실패했습니다.</li>
            <li class='li_none' style="color: red;">· ID 또는 패스워드가 일치하지 않습니다.</li>
            <li class='li_none'>
              <button type="button" id="btn_retry" class="btn btn-primary btn-md">로그인 다시 시도</button>
              <button type="button" id="btn_home" class="btn btn-primary btn-md">확인</button>
            </li>
<%--           </c:otherwise>
        </c:choose> --%>
      </ul>
    </fieldset>    
  </DIV>
 </DIV>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
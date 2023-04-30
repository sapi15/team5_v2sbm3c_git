<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 천단위 콤마 -->
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book World</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
   <DIV class='content_body'>
  <DIV class='message'>
    <H3>관리자 권한이 필요한 페이지입니다.</H3>
    <BR><BR>
    <form id="frm" name="frm" action="/member/login.do" method="get">
    <input type="hidden" id="return_url" name="return_url" value="${param.return_url }">
     <button type="submit" class="btn btn-primary">로그인</button>  
    </form>     
  </DIV>
 </DIV>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="noticeno" value="${noticeVO.noticeno }" />
<c:set var="title" value="${noticeVO.title }" />
<c:set var="contents" value="${noticeVO.contents }" />
<c:set var="rdate" value="${noticeVO.rdate }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Book World</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript">

</script>

</head>
<body>
  <jsp:include page="../menu/top.jsp" flush='false' />
  <DIV class='content_body'>

    <DIV class='title_line'>
      <A href="../event/list_grid.do" class='title_link'>공지사항</A>


      <ASIDE class="aside_right">
        <A class="menu_link" href="../notice/list.do">목록</A> 
        
        <c:choose>
            <c:when test="${grade >= 1 and grade <= 10}"> <span><span class='menu_divide'>│</span><A class="menu_link" href="../notice/update.do?noticeno=${param.noticeno }">수정</A></span>  &nbsp</c:when>    
           </c:choose>
        
      </ASIDE>
    </DIV><!-- title_line -->




    <DIV class='menu_line'>
      <div class="title">${title }</div>
    </DIV>

    <DIV class="main_update">
      <div>${contents }</div>
      
      <div class="date">${rdate }</div>
    </DIV>

  </DIV>




  <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
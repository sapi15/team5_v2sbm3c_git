<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="faqgrpno" value="${param.faqgrpno }" />
<c:set var="faqno" value="${faqVO.faqno }" />
<c:set var="title" value="${faqVO.title }" />
<c:set var="answer" value="${faqVO.answer }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Book</title>

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
      <A href="../faq/list.do" class='title_link'>자주 묻는 질문</A>

      <ASIDE class="aside_right">
        <A class="menu_link" onclick="history.back()">목록</A>
          <c:choose>
            <c:when test="${grade >= 1 and grade <= 10}"> <span><span class='menu_divide'>│</span><A class="menu_link" href="../faq/update.do?faqgrpno=${param.faqgrpno }&faqno=${param.faqno}">수정</A></span>  &nbsp</c:when>    
           </c:choose>
      </ASIDE>
    </DIV>
    <!-- title_line -->

    <DIV class='menu_line'>
      <DIV>
        <span class="title">${title }</span>
      </DIV>
    </DIV><!-- menu_line -->
      <DIV class="contents">${answer }</DIV>
 
  </DIV>
  <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
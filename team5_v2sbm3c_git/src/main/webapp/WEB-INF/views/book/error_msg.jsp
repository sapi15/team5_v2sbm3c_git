<%@ page contentType="text/html; charset=UTF-8" %>
<!--'c'라는 것으로 접근,if문처럼 쓰는것 c:choose는 if문과 같다  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book World</title>
 <%-- /static/css/style.css --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<DIV class='title_line'>카테고리 그룹 > 알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
   <c:choose>
        <c:when test="${code == 'create'}"><!--Javaif(cnt==1) -->
          <LI class='li_none'>
              <span class="span_fail">새로운 카테고리 그룹  등록에 실패했습니다.</span>
          </LI>
        </c:when>
            <c:when test="${code == 'update'}"><!--Javaif(cnt==1) -->
          <LI class='li_none'>
              <span class="span_fail">수정에 실패했습니다.</span>
          </LI>
        </c:when>
            <c:when test="${code == 'delete'}"><!--Javaif(cnt==1) -->
          <LI class='li_none'>
              <span class="span_fail">삭제에 실패했습니다.</span>
          </LI>
        </c:when>
        <c:otherwise><!--else -->
          <LI class='li_none_left'>
            <span class="span_fail">알수없는 오류가 발생했습니다</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <button type='button' onclick="history.back()" class="btn btn-primary" >다시 시도</button>
        <button type='button' onclick="location.href='./list_by_bookgrpno.do?bookgrpno=${bookgrpno}'" class="btn btn-primary">목록</button>
      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
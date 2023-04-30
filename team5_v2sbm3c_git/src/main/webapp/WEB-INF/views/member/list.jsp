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
    <DIV class='title_line'>
      회원 목록
        <ASIDE class="aside_right">
        <A href="javascript:location.reload();">새로고침</A>
      </ASIDE>
    </DIV>
 

   
    <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <TR>
      <TH class='th_bs'>번호</TH>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>성명</TH>
      <TH class='th_bs'>전화번호</TH>
      <TH class='th_bs'>주소</TH>
      <TH class='th_bs'>등록일</TH>
      <TH class='th_bs'>회원등급</TH>
      <TH class='th_bs'>기타</TH>
    </TR>
   
    <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="name" value ="${memberVO.name}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="email1" value ="${memberVO.email1}" />
      <c:set var="email2" value ="${memberVO.email2}" />
      <c:set var="email_yn" value ="${memberVO.email_yn}" />
      <c:set var="address1" value ="${memberVO.address1}" />
      <c:set var="address2" value ="${memberVO.address2}" />
      <c:set var="rdate" value ="${memberVO.rdate}" />
      <c:set var="grade" value ="${memberVO.grade}" />
       
    <TR>
      <TD class=td_basic>${memberno}</TD>
      <TD class='td_basic'><A href="./readById.do?id=${id}">${id}</A></TD>
      <TD class='td_basic'><A href="./read.do?memberno=${memberno}">${name}</A></TD>
      <TD class='td_basic'>${tel}</TD>
      <TD class='td_left'>
        <c:choose>
          <c:when test="${address1.length() > 15 }"> <!-- 긴 주소 처리 -->
            ${address1.substring(0, 15) }...
          </c:when>
          <c:otherwise>
            ${address1}, ${address2 }
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class='td_basic'>${rdate.substring(0, 10)}</TD> <!-- 년월일 -->
      <c:choose>
        <c:when test="${grade == 99 }">
          <TD class='td_basic'>${grade }(탈퇴회원)</TD>
        </c:when>
        <c:otherwise>
          <TD class='td_basic'>${grade }</TD>
        </c:otherwise>
      </c:choose>
      <TD class='td_basic'>
       <%--  <A href="./passwd_update.do?memberno=${memberno}"></A> --%>
        <A href="./read.do?memberno=${memberno}"><IMG src='/member/images/update.png' title='수정'></A>
        <A href="./delete.do?memberno=${memberno}"><IMG src='/member/images/delete.png' title='삭제'></A>
      </TD>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV style="text-align: center;">
    <button type='button' onclick="location.href='/member/create.do'" class="btn btn-primary">등록</button>
  </DIV>
</DIV>

 <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
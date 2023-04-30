
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book World</title>
<!-- /static 기준 -->
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
  
  <DIV class="main_contents" style='text-align: center;'>
  <A href="#" class='title_link' style="margin-left:150px;">신작</A> 
     
    <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="contentsVO" items="${list_contents }" varStatus="status">
      <c:set var="contentsno" value="${contentsVO.contentsno }" />
      <c:set var="bookno" value="${contentsVO.bookno }" />
      <c:set var="title" value="${contentsVO.title }" />
      <c:set var="content" value="${contentsVO.content }" />
      <c:set var="thumb1" value="${contentsVO.thumb1 }" />
      <c:set var="writer" value="${contentsVO.writer }" />
      <c:set var="size1" value="${contentsVO.size1 }" />
      
      <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
      <c:if test="${status.index % 1 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 80%; 
              float: right;  height:100%;
              margin: 0.5%; padding: 0.5%; background-color: #ffcab2; text-align: center;'>
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="/contents/read.do?contentsno=${contentsno}">               
                  <IMG src="/contents/storage/${thumb1 }" style='width: 100%; height: 445px;'>
                </a><br>
                ${title} <br>
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="/contents/read.do?contentsno=${contents}">${file1}</a><br>
                  </DIV>
                </DIV>
                ${title} (${cnt})              
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="/contents/read.do?contentsno=${contentsno}">
              <img src='/contents/images/none.gif' style='width: 100%; height: 445px;'>
            </a><br>
            <a href="/contents/read.do?contentsno=${contentsno}">${title }</a>
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>
  </DIV><!-- main_contents -->
  
  
   <DIV class="sub_contents" style='text-align: center; margin-left:20px;'>
     <A href="../event/list_grid.do" class='title_link' style="margin-right:20px;">이벤트</A> 
     
    <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="eventVO" items="${list_event }" varStatus="status">
      <c:set var="eventno" value="${eventVO.eventno }" />
      <c:set var="title" value="${eventVO.title }" />
      <c:set var="contents" value="${eventVO.contents }" />
      <c:set var="file1" value="${eventVO.file1 }" />
      <c:set var="size1" value="${eventVO.size1 }" />
      <c:set var="thumb" value="${eventVO.thumb }" />
      
      
      <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
      <c:if test="${status.index % 3 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 30%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #ffcab2; text-align: center;'>
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="/event/read.do?eventno=${eventno}">               
                  <IMG src="/event/storage/${thumb }" style='width: 100%; height: 200px;'>
                </a><br>
                ${title} <br>
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="/event/read.do?eventno=${eventno}">${file1}</a><br>
                  </DIV>
                </DIV>
                ${title} (${cnt})              
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="/event/read.do?eventno=${eventno}">
              <img src='/event/image/none.gif' style='width: 100%; height: 200px;'>
            </a><br>
            <a href="/event/read.do?eventno=${eventno}">${title }</a>
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>
   
  
  
  </DIV><!-- sub_contents -->
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
 <DIV>

 
 
 </DIV>
 
<jsp:include page="./menu/bottom.jsp" flush='false' />
 
</body>
</html>
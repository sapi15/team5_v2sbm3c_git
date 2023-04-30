<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 <DIV class='content_body'>
<DIV class='title_line'> 
  <A href="../event/list.do" class='title_link'>이벤트</A> 
<ASIDE class="aside_right">
   
     
      
        
        <c:choose>
            
            <c:when test="${grade >= 1 or grade <= 10}"> <span><A class='menu_link'  href='/event/list_search.do' >리스트형</A></span>  &nbsp</c:when>    
           </c:choose>


      
    </ASIDE>
</DIV>


<DIV style="text-align: right; clear: both;">
      <form name='frm' id='frm' method='get'
        action='./list_grid.do'>
        <c:choose>
          <c:when test="${param.word != '' }">
            <%-- 검색하는 경우 --%>
            <input type='text' name='word' id='word'
              value='${param.word }' style='width: 20%;'>
          </c:when>
          <c:otherwise>
            <%-- 검색하지 않는 경우 --%>
            <input type='text' name='word' id='word' value=''
              style='width: 20%;'>
          </c:otherwise>
        </c:choose>
        <button type='submit'>검색</button>
        <c:if test="${param.word.length() > 0 }">
          <button type='button'
            onclick="location.href='./list_grid.do?word='">검색
            취소</button>
        </c:if>
      </form>
    </DIV>


  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="eventVO" items="${list }" varStatus="status">
      <c:set var="eventno" value="${eventVO.eventno }" />
      <c:set var="title" value="${eventVO.title }" />
      <c:set var="contents" value="${eventVO.contents }" />
      <c:set var="file1" value="${eventVO.file1 }" />
      <c:set var="size1" value="${eventVO.size1 }" />
      <c:set var="thumb" value="${eventVO.thumb }" />
      
      
      <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 24%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: center;'>
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="./read.do?eventno=${eventno}">               
                  <IMG src="/event/storage/${thumb }" style='width: 100%; height: 150px;'>
                </a><br>
                ${title} <br>
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="./read.do?eventno=${eventno}">${file1}</a><br>
                  </DIV>
                </DIV>
                ${title} (${cnt})              
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="./read.do?eventno=${eventno}">
              <img src='/event/image/none.gif' style='width: 100%; height: 150px;'>
            </a><br>
            <a href="./read.do?eventno=${eventno}">${title }</a>
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
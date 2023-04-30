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
    <A class='menu_link'  href="../event/create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A class='menu_link'  href="../event/list_grid.do">갤러리형</A>
  </ASIDE> 
  
</DIV>



  <DIV  style="text-align: right;">  
    <form  name='frm' id='frm' method='get' action='./list_search.do'>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_search.do?word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
<!--     <thead>
      <tr>
        <th style='text-align: center;'>파일</th>
        <th style='text-align: center;'>상품명</th>
        <th style='text-align: center;'>정가, 할인률, 판매가, 포인트</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    
    </thead> -->
    
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="eventVO" items="${list }">
        <c:set var="eventno" value="${eventVO.eventno }" />
        <c:set var="thumb" value="${eventVO.thumb }" />
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <a href="./read.do?eventno=${eventno}"><IMG src="/event/storage/${thumb }" style="width: 120px; height: 80px;"></a> 
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                ${eventVO.file1}
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle; text-align:left;'>
            <a href="./read.do?eventno=${eventno}" ><strong>${eventVO.title}</strong></a> 
          </td>
          
           <td style='vertical-align: middle; text-align: center;'>
          <strong>${eventVO.rdate}</strong>
          </td>
               
         <TD class="td_bs">
          <A href="./update.do?eventno=${eventno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
         </TD>
         <TD class="td_bs"> 
          <A href="./delete.do?eventno=${eventno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
         </TD>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
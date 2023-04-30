<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
  <html lang="ko">
  <head>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
    <title>Book World</title>
    <link href="../css/style.css" rel="Stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
  </head>

  <body>
    <jsp:include page="../menu/top.jsp" />
      <DIV class='content_body'>
    <DIV class='title_line'>
      <A href="/faq/service_home.do" class='title_link'>고객 센터</A> > 
      <A href="/qna/list_qna.do" class='title_link'>1:1 문의</A> > 
      <A href="/qna/list_qna.do" class='title_link'>문의 내역</A>
    </DIV>    
<!--     <DIV style="text-align: left;">
      <ASIDE class="aside_right">
        <A href="/qna/create.do">등록</A>
        <span class='menu_divide'>│</span> <A href="javascript:location.reload();">새로고침</A>
      </ASIDE>
    </DIV> -->

  
      <table class="table table-striped" style='width: 100%;'>
        <colgroup>
          <col style="width: 20%;"></col>
          <col style="width: 20%;"></col>
          <col style="width: 30%;"></col>
          <col style="width: 10%;"></col>
        </colgroup>
        
        <%-- table 컬럼 --%>
        <thead>
          <tr>
            <th style='text-align: center;'>첨부파일</th>
            <th style='text-align: center;'>제목</th>
            <th style='text-align: center;'>문의날짜</th>
            <th style='text-align: center;'>답변상태</th>
            </tr>
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
            <c:choose>
              <c:when test="${list.size() > 0 }">
                <c:forEach var="qnaVO" items="${list }" varStatus="status">
                  <c:set var="qnano" value="${qnaVO.qnano }" />
                  <c:set var="order_itemno" value="${qnaVO.order_itemno }" />
                  <c:set var="memberno" value="${qnaVO.memberno }" />
                  <c:set var="title" value="${qnaVO.title }" />
                  <c:set var="content" value="${qnaVO.content }" />
                  <c:set var="thumb1" value="${qnaVO.thumb1 }" />
                  <c:set var="qdate" value="${qnaVO.qdate }" />
                  <c:set var="state" value="${qnaVO.state }" />
                  <tr>
                    <td style='vertical-align: middle; text-align: center;'>
                      <c:choose>
                        <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                          <IMG src="/qna/storage/${thumb1 }" style="width: 120px; height: 80px;">
                        </c:when>
                        <c:otherwise>
                          <!-- 이미지가 아닌 일반 파일 -->
                          <IMG src="/qna/images/none_img.png" style="width: 120px; height: 80px;">
                        </c:otherwise>
                      </c:choose>
                    </td>
                    
                    <td style='vertical-align: middle;'><a
                      href="/qna/read_qnaInfo.do?qnano=${qnano }">
                     <strong>${title }</strong>
                    </a>
                    </td>
                    
                    <td style='vertical-align: middle; text-align: center;'>
                      ${qdate }
                    </td>
                    
                    <td style='vertical-align: middle; text-align: center;'>
                      <c:choose>
                        <c:when test="${state eq '0'}">
                          처리중
                        </c:when>
                        <c:otherwise>
                          답변완료
                        </c:otherwise>
                      </c:choose>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
            <c:otherwise>
               <tr>
                <td colspan="6" style="text-align: center; font-size: 1.3em;">과거 문의 내역이 없습니다.</td>
              </tr>
            </c:otherwise>
          </c:choose>
        </tbody>
            
      </table>
    
      <%-- <DIV class='bottom_menu'>${paging }</DIV> --%>
    </DIV>  
    <jsp:include page="../menu/bottom.jsp" />
  </body>

</html>



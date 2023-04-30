    <%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="ko"> 
  <head> 
    <meta charset="UTF-8"> 
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
    <title>Book World</title>
    
    <link href="../css/style.css" rel="Stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> 
    
    <c:set var="qnano" value="${qnaVO.qnano }" />
    <c:set var="order_itemno" value="${qnaVO.order_itemno }" />
    <c:set var="memberno" value="${qnaVO.memberno }" />
    <c:set var="title" value="${qnaVO.title }" />
    <c:set var="content" value="${qnaVO.content }" />
    <c:set var="thumb1" value="${qnaVO.thumb1 }" />
    <c:set var="file1saved" value="${qnaVO.file1saved }" />
    <c:set var="reply" value="${qnaVO.reply }" />
    <c:set var="qdate" value="${qnaVO.qdate }" />
    <c:set var="rdate" value="${qnaVO.rdate }" />
    <c:set var="state" value="${qnaVO.state }" />
  
   
  </head> 
 
  <body>
    <jsp:include page="../menu/top.jsp" />
    <DIV class='content_body'>
    <DIV class='title_line'>
      <A href="/faq/service_home.do" class='title_link'>고객 센터</A> > 
      <A href="/qna/list_qna.do" class='title_link'>1:1 문의</A> > 
      <A href="/qna/list_qna.do" class='title_link'>문의 내역 ></A>
      <A href="/qna/read_qnaInfo.do?qnano=${qnano }" class='title_link'>${title }</A>
    </DIV>    
  

      <DIV class='menu_line'></DIV>
          
        <fieldset class="fieldset_basic">
          <ul>
            <li class="li_none">
              <c:set var="file1saved" value="${qnaVO.file1saved.toLowerCase() }" />
              <c:choose>
                <c:when test="${file1saved.endsWith('jpg') || file1saved.endsWith('png') || file1saved.endsWith('gif')}">
                  <DIV style="width: 50%; float: left;">
                    <IMG src="/qna/storage/${qnaVO.file1saved }" style="width: 50%;">
                  </DIV>
                </c:when>
                <c:otherwise>
                  <!-- 이미지가 아닌 일반 파일 -->
                  <DIV style="width: 50%; float: left; margin-right: 10px;">
                    <IMG src="/qna/images/none_img.png" style="width: 120px;">
                  </DIV>
                </c:otherwise>
              </c:choose>   
              
              
              <DIV class="form_update" style="width: 100%; height: 100%; float: left; margin-right: 10px; ">
                      <label class="control-label col-md-2">주문 상세 번호</label>
                <div class="col-md-10">
                 <span style="font-size: 1.2em; font-weight: bold;">${order_itemno }</span><br>
                </div>
                <br><br>
               <label class="control-label col-md-2">문의 제목</label>
                <div class="col-md-10">
                 <span style="font-size: 1.2em; font-weight: bold;">${title }</span><br>
                </div>
                <br><br>
              <label class="control-label col-md-2" >문의 내용</label>
              <div class="col-md-10">
                <span style="font-size: 15px; ">${content }</span><br>
                </div>
                
            <br><br>
                
                <label class="control-label col-md-2">문의 날짜</label>
                  <div class="col-md-10">
                <span style="font-size: 15px;">${qdate }</span><br>
                </div>
                <%-- (state == 0) ? 처리중 : 답변완료; --%>
                <c:if test="${state eq '1' }">
                  <span style="font-size: 1.5em; font-weight: bold;">${reply }</span><br>
                    <span style="font-size: 1.5em; font-weight: bold;">${rdate }</span><br>
                </c:if> 
                
              </DIV>
              
            </li>
            <li>
              <%-- 관리자면 답글 등록이 보임 --%>
              <c:if test="${sessionScope.grade lt '10' }">
                
                <form name='frm' method='POST' action="/qna/write_reply.do" class="form-horizontal">
                <input type="hidden" name="qnano" value="${qnano }">
                <input type="hidden" name="state" value="${state }">
                  <div class="form_update">
                   <label class="control-label col-md-2">답변</label>
                    <div class="col-md-10">
                      <textarea class="form-control" name='reply' id='reply' rows='10'
                        placeholder="문의에 대한 답변을 입력하세요" style="border:1px solid #d3d3d3;"></textarea>
                    </div>
                  </div>
                    <div class="container-fluid center-block" style="width:250px; position:static; padding:10px; ">  
                  <input type="submit" class="btn bg-warning"  style="float:left; margin:5px;" value="답변 등록">
                  </div>
                </form>
              </c:if> 
            </li>

          </ul>
        </fieldset>
      </DIV>
    <jsp:include page="../menu/bottom.jsp" />
  </body>
</html>
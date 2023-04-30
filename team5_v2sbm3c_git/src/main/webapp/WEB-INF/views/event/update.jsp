<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="eventno" value="${eventVO.eventno }" />
<c:set var="title" value="${eventVO.title }" />
<c:set var="contents" value="${eventVO.contents }" />

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
	$(function() {

	});
</script>
</head>
<body>
  <jsp:include page="../menu/top.jsp" flush='false' />
  <DIV class='content_body'>
  
    <DIV class='title_line_update'>
      <A href="../event/list_search.do" class='title_link'>이벤트</A> >
      ${eventVO.title } 수정
      
      <ASIDE class="aside_right">
    <A class='menu_link'  href="../event/list_search.do">리스트형</A>
    <span class='menu_divide' >│</span>
    <A class='menu_link'  href="../event/list_grid.do">갤러리형</A>
  </ASIDE>
    </DIV><!-- title_line_update -->

      <DIV class="main_update">
    <fieldset class="fieldset_basic">
      <ul>
        <li class="li_none">
          <DIV style='text-align: center; width: 100%; float: left;'>
            <c:set var="file1saved"
              value="${eventVO.file1saved.toLowerCase() }" />
            <c:set var="thumb" value="${eventVO.thumb }" />
            <c:choose>
              <c:when
                test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <IMG src="/event/storage/${file1saved }"
                  style='width: 70%;'>
                  
                  
           <DIV class="form_update">
        

            <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
              <input type="hidden" name="eventno"
                value="${eventno}">

              <div class="form_update">
                <label class="control-label col-md-2">이벤트명</label>
                <div class="col-md-10">
                  <input type='text' name='title' value='${title }'
                    required="required" autofocus="autofocus"
                    class="form-control" style='width: 100%;'>
                </div>
              </div>

              <div class="form_update">
                <label class="control-label col-md-2">이벤트 설명</label>
                <div class="col-md-10">
                  <textarea name='contents' required="required"
                    class="form-control" rows="12" style='width: 100%;'>${contents }</textarea>
                </div>
              </div>
                
              <div class="form_update">  
               <input style="margin:0px auto;" type='file' name='file1MF' id='file1MF' value='${eventVO.file1 }'
                placeholder="파일 선택"><br>
                첨부 파일: ${eventVO.file1}
                </div>
                
              <div class="container-fluid center-block"
          style="width: 250px; position: static; padding: 10px;">
                <button type="submit" class="btn bg-warning">이벤트
                  수정</button>
                <button type="button" onclick="history.back();"
                  class="btn bg-warning">취소</button>
              </div>
            </FORM>
          </DIV>
              </c:when>
              
              
              
              
              
              <c:otherwise>
                <!-- 이미지가 아닌 일반 파일 -->
                       <DIV style='text-align: left; width: 100%; float: left;'>
           

            <FORM name='frm' method='POST' action='./update.do'
              enctype="multipart/form-data">
              <input type="hidden" name="eventno"
                value="${eventno}">

              <div class="form_update">
                <label class="control-label col-md-2">이벤트명</label>
                <div class="col-md-10">
                  <input type='text' name='title' value='${title }'
                    required="required" autofocus="autofocus"
                    class="form-control" style='width: 100%;'>
                </div>
              </div>

              <div class="form_update">
                <label class="control-label col-md-2">이벤트 설명</label>
                <div class="col-md-10">
                  <textarea name='contents' required="required"
                    class="form-control" rows="12" style='width: 100%;'>${contents }</textarea>
                </div>
              </div>
                
              <div class="form_update" style="text-align:center; margin-bottom:20px;">  
               <input style="margin:0px auto;"type='file' name='file1MF' id='file1MF' value='${eventVO.file1 }'
                placeholder="파일 선택"><br>
 
                 첨부 파일: ${eventVO.file1}
            
                 </div>
                 
            <div class="container-fluid center-block"
          style="width: 250px; position: static; padding: 10px;">
                <button type="submit" class="btn bg-warning">이벤트
                  수정</button>
                <button type="button" onclick="history.back();"
                  class="btn bg-warning">취소</button>
              </div>
            </FORM>
          </DIV>
             
           
            </c:otherwise>
            </c:choose>
          </DIV>


 
        </li>
        <li class="li_none"></li>
      </ul>
    </fieldset>
  </DIV><!-- main_update -->

</DIV><!-- content_body -->
  <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
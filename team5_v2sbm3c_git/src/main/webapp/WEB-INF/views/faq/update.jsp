<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="faqgrpno" value="${faqVO.faqgrpno }" />
<c:set var="faqno" value="${faqVO.faqno }" />
<c:set var="title" value="${faqVO.title }" />
<c:set var="answer" value="${faqVO.answer }" />

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
	$(function() {

	});
</script>
</head>
<body>
  <jsp:include page="../menu/top.jsp" flush='false' />
  <DIV class='content_body'>
    <DIV class='title_line_update'>
      <A href="../faq/list.do" class='title_link'>자주묻는질문 수정</A>
    </DIV>
    <!-- title_line_update -->

    <DIV class="main_update">
      <FORM name='frm' method='POST' action='./update.do'
        enctype="multipart/form-data">
        <input type="hidden" name="faqno" value="${faqno}"> <input
          type="hidden" name="faqgrpno" value="${faqgrpno}">

        <div class="form_update">
          <label class="control-label col-md-2">질문</label>
          <div class="col-md-10">
            <input type='text' name='title' value='${title }'
              required="required" autofocus="autofocus"
              class="form-control" style='width: 100%;'>
          </div>
        </div>

        <div class="form_update">
          <label class="control-label col-md-2">답변</label>
          <div class="col-md-10">
            <textarea name='answer' required="required"
              class="form-control" rows="12" style='width: 100%;'>${answer }</textarea>
          </div>
        </div>

        <div class="container-fluid center-block"
          style="width: 250px; position: static; padding: 10px;">
          <button type="submit" class="btn bg-warning"
            style="float: left; margin: 5px;">공지사항 수정</button>
          <button type="button" onclick="history.back();"
            class="btn bg-warning" style="float: left; margin: 5px;">취소</button>
        </div>
      </FORM>
    </DIV>
    <!-- main_update -->
    
  </DIV>
  <!-- content_body -->
  <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
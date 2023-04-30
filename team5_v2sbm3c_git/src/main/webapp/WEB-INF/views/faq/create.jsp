<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="faqgrpno" value="${param.faqgrpno }" />

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
  
    <DIV class='title_line_update'>자주묻는질문 등록 (카테고리:
      ${faqgrpno })</DIV><!-- title_line_update -->

    <DIV class="main_update">
      <FORM name='frm' method='POST' action='./create.do'
        class="form-horizontal">
        <input type="hidden" name="faqgrpno" value="${faqgrpno }">

        <div class="form_update">
          <label class="control-label col-md-2">질문</label>
          <div class="col-md-10">
            <input type='text' name='title' value='' required="required"
              autofocus="autofocus" class="form-control">
          </div>
        </div>

        <div class="form_update">
          <label class="control-label col-md-2">답변</label>
          <div class="col-md-10">
            <textarea name='answer' required="required"
              class="form-control" rows="12"></textarea>
          </div>
        </div>

        <div class="container-fluid center-block"
          style="width: 250px; position: static; padding: 10px;">
          <button type="submit" class="btn bg-warning"
            style="float: left; margin: 5px;">등록</button>
          <button type="button"
            onclick="location.href='./list_by_faqgrpno.do?faqgrpno=${param.faqgrpno}'"
            class="btn bg-warning" style="float: left; margin: 5px;">목록</button>
        </div>
      </FORM>
      
    </DIV><!-- main_update -->
    
  </DIV><!-- content_body -->
  <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
      공지사항 수정
    </DIV>


      <DIV class="main_update">
        
        <FORM name='frm' method='POST' action='./update.do'
          enctype="multipart/form-data">
          <input type="hidden" name="noticeno" value="${noticeVO.noticeno}">

          <div class="form_update">
            <label class="control-label col-md-2">공지사항</label>
            <div class="col-md-10">
              <input type='text' name='title' value='${noticeVO.title }'
                required="required" autofocus="autofocus"
                class="form-control" style='width: 100%;'>
            </div>
          </div>

          <div class="form_update">
            <label class="control-label col-md-2">내용</label>
            <div class="col-md-10">
              <textarea name='contents' required="required"
                class="form-control" rows="12" style='width: 100%;'>${noticeVO.contents }</textarea>
            </div>
          </div>




          <div class="container-fluid center-block" style="width:250px; position:static; padding:10px; ">
            
    
            <button type="submit" class="btn bg-warning"  style="float:left; margin:5px;">공지사항
              수정</button>
           
            <button type="button" onclick="history.back();"
              class="btn bg-warning" style="float:left; margin:5px;">취소</button>

          </div>
          </FORM>

      </DIV>
    </DIV>




  <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
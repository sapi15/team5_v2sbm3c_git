<%@ page contentType="text/html; charset=UTF-8" %>
 
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
<script type="text/javascript">
  
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

  <DIV class='content_body'>
  <DIV class='title_line'>
    아이디 찾기
  </DIV>


    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
      
    <FORM name='frm' id='frm' method='POST' action='./id_find.do' class="form-horizontal">
      <div class="form-group">
        <label class="col-md-5 control-label" style="font-size: 0.9em;">성명</label>    
        <div class="col-md-7">
          <input type="text" class="form-control" name='name' id='name' value='' required="required" autofocus="autofocus"
                    style='width: 30%;' placeholder="성명">
        </div>
      </div>   
                      
      <div class="form-group">
        <label class="col-md-5 control-label" style="font-size: 0.9em;">이메일</label>    
        <div class="col-md-7">
          <input type="text" class="form-control" name='email1' id='email1' 
                    style="width: 15%; float: left;" placeholder="이메일" required="required">  
          <p style="float: left;">@</p>
          <input type="text" class="form-control" name="email2" id='email2' 
                    style="width: 15%; float: left;" placeholder=".com" required="required">
        </div>
      </div>    
      
      <div class="form-group">
        <div class="col-md-offset-5 col-md-7">
          <button type="submit" id='btn_send' class="btn btn-primary">찾기</button>
          <button type="button" onclick="location.href='/'" class="btn btn-primary">취소</button>
        </div>
      </div>   
    </FORM>
  </DIV> <%--  <DIV class='content_body'> END --%>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
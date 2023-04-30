
<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
  <meta charset="UTF-8"> 
  <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
  <title>Book World</title>
   
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
   
  <script type="text/JavaScript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
</head> 
 
<body>
  <jsp:include page="../menu/top.jsp" flush='false' />

    <DIV class='content_body'>
    <DIV class='title_line'>
      <A href="/faq/service_home.do" class='title_link'>고객 센터 ></A> 
      <A href="/qna/list_qna.do" class='title_link'>1:1 문의 ></A>
      <A href=""  class='title_link'>문의 등록</A>
    </DIV> 
  
    
    <DIV style='width: 100%;'>
      <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
               enctype="multipart/form-data">
        <input type="hidden" name="memberno" value="${order_itemVO.memberno }">        
        <input type="hidden" name="order_itemno" value="${order_itemVO.order_itemno }">
        
        <div class="form_update">
        <label class="control-label col-md-2">문의 제목</label>   
          <div class="col-md-10">
            <input type='text' class="form-control" name='title' value='' placeholder="제목을 입력하세요" required="required" style='width: 100%;'>
          </div>
        </div>   
        
        <div class="form_update">
        <label class="control-label col-md-2">문의 내용</label>   
          <div class="col-md-10">
            <textarea class="form-control
            " name='content' id='content' rows='10' placeholder="문의하실 내용을 입력하세요" ></textarea>
          </div>
        </div>
        
        <div class="form_update">
        <label class="control-label col-md-2">참고 파일</label>   
          <div class="col-md-10">
            <%-- 실제 컬럼명: file1, Spring File 객체 대응: file1MF --%>
            <input type='file' class="form-control" name='file1MF' id='file1MF' value='' placeholder="파일 선택">
          </div>
        </div>
        
        <div class="container-fluid center-block" style="width:250px; position:static; padding:10px; "> 
          <button type="submit" class="btn bg-warning"  style="float:left; margin:5px;">등록</button>
          <button type="button" 
                      onclick="history.back()" 
                      class="btn bg-warning"  style="float:left; margin:5px;">취소[목록]</button>
        </DIV>
         
      </FORM>
    </DIV>
  </DIV>
  
    
  <jsp:include page="../menu/bottom.jsp" flush='false' />
  </body>
 
</html>
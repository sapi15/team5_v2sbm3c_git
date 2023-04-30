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
 
<script type="text/JavaScript">
   window.onload=function(){
   CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
   };

  $(function() {
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값 
  });
 
</script> 
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

        
 
  <DIV class='content_body'>
  <DIV class='title_line'>
    <A href="../bookgrp/list.do" class='title_link'>도서 그룹</A> > <A
      href="../book/list_by_bookgrpno.do?bookgrpno=${bookgrpVO.bookgrpno }"
      class='title_link'>${bookgrpVO.grpname }</A> > <A
      href="./list_by_bookno_search_paging.do?bookno=${bookVO.bookno }" class='title_link'>${bookVO.bookname }</A>
  </DIV>

 
  <div class='menu_line'></div>
  

    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
             enctype="multipart/form-data">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='memberno' id='memberno' value='1'>
      <!-- FK bookno 지정 -->
      <input type='hidden' name='bookno' id='bookno' value="${param.bookno}">
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='title' value='' placeholder="제목을 입력하세요" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control
          " name='content' id='content' rows='10' placeholder="내용을 입력하세요" ></textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <%-- 실제 컬럼명: file1, Spring File 객체 대응: file1MF --%>
          <input type='file' class="form-control" name='file1MF' id='file1MF' value='' placeholder="파일 선택" style='width: 30%;'>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='word'  value='' placeholder="검색어" style='width: 90%;'>
        </div>
      </div>
       
        <div class="form-group">
    
        <label class="control-label col-md-2">정가</label>
         <input type='number' name='price' value='' required="required" autofocus="autofocus"
                    min="0" max="10000000" step="100"  placeholder="정가" 
                    class="form-control" style='width: 10%;'>
        
      <label class="control-label col-md-2">할인률</label>

         <input type='number' name='dc' value='' required="required"
                    min="0" max="100" step="1"  placeholder="할인률" 
                    class="form-control" style='width: 10%;'>
             
        <label class="control-label col-md-2">판매가</label>
       
         <input type='number' name='saleprice' value='' required="required"
                    min="0" max="10000000" step="100"  placeholder="판매가" 
                    class="form-control" style='width: 10%;'>
    
         <label class="control-label col-md-2">포인트</label>
   
         <input type='number' name='point' value='' required="required"
                    min="0" max="10000000" step="10"   placeholder="포인트" 
                    class="form-control" style='width: 10%;'>
               
    </div> 
      
         
<div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='writer'  value='' placeholder="저자" style='width: 20%;'>
        </div>
      </div>

             <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='publisher'  value='' placeholder="출판사" style='width: 20%;'>
        </div>
      </div>
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list_by_bookno_search_paging.do?bookno=${param.bookno}&word= '" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
</DIV>
  
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
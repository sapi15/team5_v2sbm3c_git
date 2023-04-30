<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book World</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">

	$(function() {
		$('#btn_update_cancel').on('click', cancel);
	  $('#btn_delete_cancel').on('click', cancel);
	});

	function cancel() {
		$('#panel_create').css("display", "");
		$('#panel_update').css("display", "none");
		$('#panel_delete').css("display", "none");
	}


	  function update_ajax(faqgrpno) {
	    $('#panel_create').css("display","none");  
	    $('#panel_update').css("display","");
	    $('#panel_delete').css("display","none");  
	    

	    var params = "";
	    
	    params = 'faqgrpno=' + faqgrpno; 
	    $.ajax(
	      {
	        url: '/faqgrp/read.do',
	        type: 'get',  
	        cache: false, 
	        async: true,  
	        dataType: 'json', 
	        data: params,     
	        success: function(rdata) {
	          var faqgrpno = rdata.faqgrpno;
	          var name = rdata.name;

	          var frm_update = $('#frm_update');
	          $('#faqgrpno', frm_update).val(faqgrpno);
	          $('#name', frm_update).val(name);
	       
	        },

	        error: function(request, status, error) { 
	          console.log(error);
	        }
	      }
	    );  
	  } 


	  function delete_ajax(faqgrpno) {
		    $('#panel_create').css("display","none");
		    $('#panel_update').css("display","none"); 
		    $('#panel_delete').css("display",""); 
		 
		    var params = "";
		    params = 'faqgrpno=' + faqgrpno; 
		    
		    $.ajax(
		      {
		        url: '/faqgrp/read.do',
		        type: 'get', 
		        cache: false, 
		        async: true, 
		        dataType: 'json', 
		        data: params,    
		        success: function(rdata) { 
		          var faqgrpno = rdata.faqgrpno;
		          var name = rdata.name;

		          <%--
		          var count_by_categrpno = parseInt(rdata.count_by_categrpno);
		          console.log('count_by_categrpno: ' + count_by_categrpno);
      --%>

		          var frm_delete = $('#frm_delete');
		          $('#faqgrpno', frm_delete).val(faqgrpno);	          
		          $('#frm_delete_name').html(name);

		          <%--
		          if (count_by_categrpno > 0) {
		          
		            $('#frm_delete_count_by_categrpno_panel').html('관련자료 ' + count_by_categrpno + ' 건');
		            $('#frm_delete_count_by_categrpno').show();

		          
		            $('#a_list_by_categrpno').attr('href', '../cate/list_by_categrpno.do?categrpno=' + categrpno);
		            
		          } else {
		            $('#frm_delete_count_by_categrpno').hide();
		          }
		         --%>
		        },
		        
		        error: function(request, status, error) { 
		          console.log(error);
		        }
		      }
		    );  
		 
		  }     
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 <DIV class='content_body'>
<DIV class='title_line'>자주묻는질문 그룹</DIV>

  <!-- 등록 -->
    <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
      <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
        <label>그룹 이름</label>
        <input type='text' name='name' id='name' value='' required="required" style='width: 25%;' autofocus="autofocus">
        <button type="submit" id='submit'>등록</button>
        <button type="button" onclick="cancel();">취소</button>
      </FORM>
    </DIV>
    
    <!-- 수정 -->
  <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%;  text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='faqgrpno' id='faqgrpno' value=''>
      
      <label>그룹 수정</label>
      <input type='text' name='name' id='name' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
    
      <button type="submit" id='submit'>저장</button>
      <button type="button" id='btn_update_cancel'>취소</button>
    </FORM>
  </DIV>
    
    
   <!-- 삭제 -->
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; 
          width: 100%; text-align: center; display: none;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='faqgrpno' id='faqgrpno' value=''>
        
      <label>그룹 이름</label><span id='frm_delete_name'></span>  
    
      
      <%-- 자식 레코드 갯수 출력 
      <div id='frm_delete_count_by_faqgrpno' 
             style='color: #FF0000; font-weight: bold; display: none; margin: 10px auto;'>
        <span id='frm_delete_count_by_faqgrpno_panel'></span>     
        『<A id='a_list_by_faqgrpno' href="../faq/list_by_faqgrpno.do?faqgrpno=${faqgrpno }">관련 자료 삭제하기</A>』
      </div>
       --%>
       
      <button type="submit" id='submit' class='btn btn-primary'>삭제</button>
      <button type="button" id='btn_delete_cancel' class='btn btn-primary'>취소</button>
    </FORM>
  </DIV>
    

   
    
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 70%;'/>
      <col style='width: 30%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">이름</TH>
      <TH class="th_bs">수정/삭제</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="faqgrpVO" items="${list}">
      <c:set var="faqgrpno" value="${faqgrpVO.faqgrpno }" />
      <TR>
  
        <TD class="td_bs_left">${faqgrpVO.name }</TD>

        <TD class="td_bs">
          <A href="javascript: update_ajax(${faqgrpVO.faqgrpno })" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="javascript: delete_ajax(${faqgrpVO.faqgrpno })" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
            
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
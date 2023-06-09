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
    $('#panel_create').css("display","");  
    $('#panel_update').css("display","none"); 
    $('#panel_delete').css("display","none");
  }

 
  // 수정폼
  function read_update_ajax(bookgrpno) {
    $('#panel_create').css("display","none"); // hide, 태그를 숨김 
    $('#panel_delete').css("display","none"); // hide, 태그를 숨김
    $('#panel_update').css("display",""); // show, 숨겨진 태그 출력 
    
    // console.log('-> categrpno:' + categrpno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'bookgrpno=' + bookgrpno; // 공백이 값으로 있으면 안됨.

    $.ajax(
      {
        url: '/bookgrp/read_ajax.do',
        type: 'get',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
          var bookgrpno = rdata.bookgrpno;
          var grpname = rdata.grpname;
          var seqno = rdata.seqno;
          var rdate = rdata.rdate;

          var frm_update = $('#frm_update');
          $('#bookgrpno', frm_update).val(bookgrpno);
          $('#grpname', frm_update).val(grpname);
          $('#seqno', frm_update).val(seqno);
          $('#rdate', frm_update).val(rdate);
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END
  } 

  // 삭제 폼(자식 레코드가 없는 경우의 삭제)
  function read_delete_ajax(bookgrpno) {
    $('#panel_create').css("display","none"); // hide, 태그를 숨김
    $('#panel_update').css("display","none"); // hide, 태그를 숨김  
    $('#panel_delete').css("display",""); // show, 숨겨진 태그 출력 
    // return;
    
    // console.log('-> bookgrpno:' + bookgrpno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'bookgrpno=' + bookgrpno; // 공백이 값으로 있으면 안됨.
    
    $.ajax(
      {
        url: '/bookgrp/read_ajax.do',
        type: 'get',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
          // {"categrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
          var bookgrpno = rdata.bookgrpno;
          var grpname = rdata.grpname;
          var seqno = rdata.seqno;
          // var rdate = rdata.rdate;
          var count_by_bookgrpno = parseInt(rdata.count_by_bookgrpno);
          console.log('count_by_bookgrpno: ' + count_by_bookgrpno);

          var frm_delete = $('#frm_delete');
          $('#bookgrpno', frm_delete).val(bookgrpno);
          
          $('#frm_delete_grpname').html(grpname);
          $('#frm_delete_seqno').html(seqno);
          
          if (count_by_bookgrpno > 0) { // 자식 레코드가 있다면
            $('#frm_delete_count_by_bookgrpno_panel').html('관련자료 ' + count_by_bookgrpno + ' 건');
            $('#frm_delete_count_by_bookgrpno').show();
            $('#a_list_by_bookgrpno').attr('href', '../book/list_by_bookgrpno.do?bookgrpno=' +bookgrpno);
            
          } else {
            $('#frm_delete_count_by_bookgrpno').hide();
          }

        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END
  } 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 <DIV class='content_body'>
<DIV class='title_line'>도서 그룹</DIV>


<c:choose> 
      <c:when test="${grade <= 10 }">
  <!-- 신규 등록 -->
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
    
      <!-- <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">  -->     
    
      <label>그룹 이름</label>
      <input type='text' name='grpname' id='name' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
  
      <label>순서</label>
      <input type='number' name='seqno' id='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>

      
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
   
  <!-- 수정 -->
  <DIV id='panel_update' 
          style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                    text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='bookgrpno' id='bookgrpno' value=''>
<!-- <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">  -->  

      <label>그룹 이름</label>
      <input type='text' name='grpname' id='grpname' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
  
      <label>순서</label>
      <input type='number' name='seqno' id='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
       
      <button type="submit" id='submit'>저장</button>
      <button type="button" id='btn_update_cancel'>취소</button>
    </FORM>
  </DIV>
  
  <%-- 삭제 --%>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; 
          width: 100%; text-align: center; display: none;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <%-- <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"> --%>
      <input type='hidden' name='bookgrpno' id='bookgrpno' value=''>
        
      <label>그룹 이름</label><span id='frm_delete_grpname'></span>  
      <label>순서</label>: <span id='frm_delete_seqno'></span>
      
      <%-- 자식 레코드 갯수 출력 --%>
      <div id='frm_delete_count_by_bookgrpno' 
             style='color: #FF0000; font-weight: bold; display: none; margin: 10px auto;'>
        <span id='frm_delete_count_by_bookgrpno_panel'></span>     
        『<A id='a_list_by_bookgrpno' href="../book/list_by_bookgrpno.do?bookgrpno=${bookgrpno }">관련 자료 삭제하기</A>』
      </div>
       
      <button type="submit" id='submit' class='btn btn-primary'>삭제</button>
      <button type="button" id='btn_delete_cancel' class='btn btn-primary'>취소</button>
    </FORM>
  </DIV>
      </c:when>
      </c:choose>
  <TABLE class='table table-striped'>
    <colgroup>
        <c:choose> 
      <c:when test="${grade <= 10 }">
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 20%;'/>  
      <col style='width: 10%;'/>
       </c:when>
       <c:otherwise>
       <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 30%;'/>  
       </c:otherwise>
       </c:choose>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs" style="margin-bottom: auto;">출력 순서</TH>
      <TH class="th_bs" style="margin-bottom: auto;">이름</TH>
      <TH class="th_bs">그룹 생성일</TH>
       <c:choose> 
      <c:when test="${grade <= 10 }">
      <TH class="th_bs">기타</TH>
      </c:when>
      </c:choose>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="bookgrpVO" items="${list}">
      <c:set var="bookgrpno" value="${bookgrpVO.bookgrpno }" />
      <TR>
        <TD class="td_bs">${bookgrpVO.seqno }</TD>
        <TD class="td_bs_left">
          <A href="../book/list_by_bookgrpno.do?bookgrpno=${bookgrpno }">${bookgrpVO.grpname }</A>
        </TD>
        <TD class="td_bs">${bookgrpVO.rdate.substring(0, 10) }</TD>
       <c:choose> 
      <c:when test="${grade <= 10 }">
        <TD class="td_bs">
        
          <%-- Ajax 기반 수정폼--%>
          <A href="javascript: read_update_ajax(${bookgrpno })" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>

          <%-- Ajax 기반 Delete폼--%>
          <A href="javascript: read_delete_ajax(${bookgrpno })" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>        
        </TD>   
        </c:when>
        </c:choose>
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


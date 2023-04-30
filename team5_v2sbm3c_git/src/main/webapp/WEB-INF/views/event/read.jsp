<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="eventno" value="${eventVO.eventno }" />
<c:set var="title" value="${eventVO.title }" />
<c:set var="contents" value="${eventVO.contents }" />
<c:set var="rdate" value="${eventVO.rdate }" />

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
<!--
  $(function() {
    $('#btn_recom').on("click", function() { update_recom_ajax(${eventno}); });
  });

  function update_recom_ajax(eventno) {
    
      var params = "";
     
      params = 'eventno=' + eventno; 
      $.ajax(
        {
          url: '/event/update_recom_ajax.do',
          type: 'post',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { 

            var str = '';
            if (rdata.cnt == 1) {
       
              $('#btn_recom').html('♥좋아요('+rdata.recom+')');
              $('#span_animation').hide();
            } else {
              $('#span_animation').html("지금은 추천을 할 수 없습니다.");
            }
          },
          // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        }
      );  //  $.ajax END

      // $('#span_animation').css('text-align', 'center');
      $('#span_animation').html("<img src='/event/images/ani04.gif' style='width: 8%;'>");
      $('#span_animation').show(); // 숨겨진 태그의 출력
    }-->
</script>

</head>

<body>
  <jsp:include page="../menu/top.jsp" flush='false' />

 <DIV class='content_body'>



  <DIV class='title_line'>
    <A href="../event/list_grid.do" class='title_link'>이벤트</A>
    
    <ASIDE class="aside_right">
    <A href="../event/list_grid.do">목록</A>
    
    <c:choose>
            <c:when test="${grade >= 1 and grade <= 10}"> <span class='menu_divide' >│</span>
    <A href="../event/update.do?eventno=${param.eventno }">수정</A>  &nbsp</c:when>    
           </c:choose>

  </ASIDE> 
  </DIV>

 
    
    
   
    <DIV class="menu_line">
      <span class="title">${title }</span>
    


   <span class="date">
      ${rdate }
    </span>
    
      
    </DIV>
    
 
    

    <DIV class="contents">
    <fieldset class="fieldset_basic">
      <ul>

        <li>
        <DIV class="image">
        <c:set var="file1saved"  value="${eventVO.file1saved.toLowerCase() }" />
         <c:if test="${file1saved.endsWith('jpg') || file1saved.endsWith('png') || file1saved.endsWith('gif')}">
            
              <IMG src="/event/storage/${eventVO.file1saved }"
                style="width: 100%;">
           

          </c:if>
          </DIV>
          <DIV class="contents">${contents }</DIV></li>

      </ul>
    </fieldset>
  </DIV>
  </DIV>

  <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Book World</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript">


function recom_ajax(contentsno, status_count) {
  console.log("-> recom_" + status_count + ": " + $('#recom_' + status_count).html());  // A tag body      
  var params = "";
  // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  params = 'contentsno=' + contentsno; // 공백이 값으로 있으면 안됨.

  // csrf 파라미터 추가
  // <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
  // params += '&${ _csrf.parameterName }=${ _csrf.token }';
  
  $.ajax(
    {
      url: '/contents/update_recom_ajax.do',
      type: 'post',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우
        var str = '';
        if (rdata.cnt == 1) {
          // $('#span_animation_' + status_count).hide();   // SPAN 태그에 animation 출력
          $('#recom_' + status_count).html('♥('+rdata.recom+')');     // A 태그에 animation 출력
        } else {
          // $('#span_animation_' + status_count).html("X");
          $('#recom_' + status_count).html('♥(X)');
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    }
  );  //  $.ajax END

  $('#recom_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
  // $('#span_animation_' + status_count).css('text-align', 'center');
  // $('#span_animation_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
  // $('#span_animation_' + status_count).show(); // 숨겨진 태그의 출력
    
}  

$(function(){
  $('#btn_login').on('click', login_ajax);
  $('#btn_loadDefault').on('click', loadDefault);
});


<%-- 로그인 --%>
function login_ajax() {
  var params = "";
  // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  params = $('#frm_login').serialize(); 
  
  $.ajax(
    {
      url: '/member/login_ajax.do',
      type: 'post',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우
        var str = '';
        console.log('-> login cnt: ' + rdata.cnt);  // 1: 로그인 성공
        
        if (rdata.cnt == 1) {  // 로그인 성공
          $('#div_login').hide();
          
          // 쇼핑카트에 insert 처리 Ajax 호출
          cart_ajax_post();            
          
        } else {
          alert('로그인에 실패했습니다. \n아이디/비밀번호를 확인해 주세요.');
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    });  

}

function loadDefault() {
  $('#id').val('admin1');
  $('#passwd').val('1234');
} 

<%-- 쇼핑 카트에 상품 추가 --%>
function cart_ajax(contentsno) {
  var f = $('#frm_login');
  $('#contentsno', f).val(contentsno);  // 쇼핑카트 등록시 사용할 상품 번호를 저장.
  
  console.log('-> contentsno: ' + $('#contentsno', f).val()); 
  
  // console.log('-> id:' + '${sessionScope.id}');
  if ('${sessionScope.id}' == '') {  // 로그인이 안되어 있다면
    $('#div_login').show();    // 로그인폼 출력  
    
  } else {  // 로그인 한 경우
    cart_ajax_post();   // 쇼핑카트에 insert 처리 Ajax 호출 
  }

}

<%-- 쇼핑카트 상품 등록 --%>
function cart_ajax_post() {
  var f = $('#frm_login');
  var contentsno = $('#contentsno', f).val();  // 쇼핑카트 등록시 사용할 상품 번호.
  
  var params = "";
  params += 'contentsno=' + contentsno;
  console.log('-> cart_ajax_post: ' + params);
  // return;
  
  $.ajax(
    {
      url: '/cart/create_ajax.do',
      type: 'post',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우
        var str = '';
        console.log('-> cart_ajax_post cnt: ' + rdata.cnt);  // 1: 쇼핑카트 등록 성공
        
        if (rdata.cnt == 1) {
          var sw = confirm('선택한 상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?');
          if (sw == true) {
            // 쇼핑카트로 이동
           location.href='/cart/list_by_memberno.do?bookno=' + ${bookVO.bookno };
          }else{
            location.reload(); 
          }             
        } else {
          alert('선택한 상품을 장바구니에 담지못했습니다.\n잠시후 다시 시도해주세요.');
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    });
}


</script>

</head>

<body>
  <jsp:include page="../menu/top.jsp" />
 <DIV class='content_body'>
 <c:choose>
 <c:when test="${param.word != '' }">
   </c:when>
   <c:otherwise>
  <DIV class='title_line'>
    <A href="../bookgrp/list.do" class='title_link'>도서 그룹</A> > <A
      href="../book/list_by_bookgrpno.do?bookgrpno=${bookgrpVO.bookgrpno }"
      class='title_link'>${bookgrpVO.grpname }</A> > ${bookVO.bookname }
  </DIV>
</c:otherwise>
  </c:choose>
      
      
 
    <DIV style="text-align: left;">
      <ASIDE class="aside_right">
                  <c:choose> 
           <c:when test="${grade <= 10 }">
        <A
          href="./create.do?bookno=${bookVO.bookno }&bookgrpno=${bookVO.bookgrpno }">등록</A>
        <span class='menu_divide'>│</span>
          </c:when>
          </c:choose>
          <A
          href="javascript:location.reload();">새로고침</A>
      </ASIDE>
    </DIV>
    <DIV style="text-align: right; clear: both;">
      <form name='frm' id='frm' method='get'
        action='./list_by_bookno_search_paging.do'>
        <input type='hidden' name='bookno' value='${bookVO.bookno }'>
        <c:choose>
          <c:when test="${param.word != '' }">
            <%-- 검색하는 경우 --%>
            <input type='text' name='word' id='word'
              value='${param.word }' style='width: 20%;'>
          </c:when>
          <c:otherwise>
            <%-- 검색하지 않는 경우 --%>
            <input type='text' name='word' id='word' value=''
              style='width: 20%;'>
          </c:otherwise>
        </c:choose>
        <button type='submit'>검색</button>
        <c:if test="${param.word.length() > 0 }">
          <button type='button'
            onclick="location.href='./list_by_bookno_search_paging.do?bookno=${bookVO.bookno}&now_page=${param.now_page }&word='">검색
            취소</button>
        </c:if>
      </form>
    </DIV>

     <DIV class='menu_line'></DIV>
  
    <%-- ******************** Ajax 기반 로그인 폼 시작 ******************** --%>
    <DIV id='div_login' style='width: 80%; margin: 0px auto; display: none;'>
    <FORM name='frm_login' id='frm_login' method='POST' action='/member/login.do' class="form-horizontal">
      
      <input type="hidden" name="contentsno" id="contentsno" value="contentsno">
      
      <div class="form-group">
        <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
        <div class="col-md-8">
          <input type='text' class="form-control" name='id' id='id' 
                     value='${ck_id }' required="required" 
                     style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <Label>   
            <input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>                   
        </div>
      </div>   
   
      <div class="form-group">
        <label class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
        <div class="col-md-8">
          <input type='password' class="form-control" name='passwd' id='passwd' 
                    value='${ck_passwd }' required="required" style='width: 30%;' placeholder="패스워드">
          <Label>
            <input type='checkbox' name='passwd_save' value='Y' 
                      ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>
        </div>
      </div>   
   
      <div class="form-group">
        <div class="col-md-offset-4 col-md-8">
          <button type="button" id='btn_login' class="btn btn-primary btn-md">로그인</button>
          <button type='button' onclick="location.href='/member/create.do'" class="btn btn-primary btn-md">회원가입</button>
          <button type='button' id='btn_loadDefault' class="btn btn-primary btn-md">테스트 계정</button>
          <button type='button' id='btn_cancel' class="btn btn-primary btn-md"
                      onclick="$('#div_login').hide();">취소</button>
        </div>
      </div>   
      
    </FORM>
    </DIV>
    <%-- ******************** Ajax 기반 로그인 폼 종료 ******************** --%>
  


    <table class="table table-striped" style='width: 100%; border:none;'>
    
          <colgroup>
            <c:choose> 
           <c:when test="${grade <= 10 }">
            <col style="width: 10%;"></col>
            <col style="width: 50%;"></col>
            <col style="width: 30%;"></col>
            <col style="width: 10%;"></col>
            </c:when>
                <c:otherwise>
                  <col style="width: 10%;"></col>
                    <col style="width: 60%;"></col>
                    <col style="width: 30%;"></col>
                </c:otherwise>
            </c:choose>
          </colgroup>
          <%-- table 컬럼 --%>
          <thead>
            <tr>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
              <th style='text-align: center;'></th>
            </tr>
          </thead>

          <%-- table 내용 --%>
          <tbody>
           <c:choose>
          <c:when test="${list.size() > 0 }">
            <c:forEach var="contentsVO" items="${list }" varStatus="status">
              <c:set var="contentsno" value="${contentsVO.contentsno }" />
              <c:set var="thumb1" value="${contentsVO.thumb1 }" />
              <c:set var="recom" value="${contentsVO.recom }" />
              
                <c:set var="price" value="${contentsVO.price }" />
                <c:set var="dc" value="${contentsVO.dc }" />
                <c:set var="saleprice" value="${contentsVO.saleprice }" />
                <c:set var="point" value="${contentsVO.point }" />
              <tr>
                <td style='vertical-align: middle; text-align: center;'>
                  <c:choose>
                    <c:when
                      test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                      <%-- /static/contents/storage/ --%>
                      <a href="./read.do?contentsno=${contentsno}&now_page=${param.now_page }"><IMG
                        src="/contents/storage/${thumb1 }"
                        style="width: 120px; height: 80px;"></a>
                    </c:when>
                    <c:otherwise>
                      <!-- 이미지가 아닌 일반 파일 -->
                ${contentsVO.file1}
              </c:otherwise>
                  </c:choose>
                </td>
                <td style='vertical-align: middle;'><a
                  href="./read.do?contentsno=${contentsno }&now_page=${param.now_page }">
                 <strong>${contentsVO.title }</strong>
                </a>
               <div style='font-size:30% '> ${contentsVO.writer } 지음/${contentsVO.publisher }/${contentsVO.rdate} </div>
                </td>
             <td style='vertical-align: middle; text-align: center;'>
            <del><fmt:formatNumber value="${price}" pattern="#,###" /></del><br>
            <span style="color: #FF0000; font-size: 1.2em;">${dc} %</span>
            <strong><fmt:formatNumber value="${saleprice}" pattern="#,###" /></strong><br>
            <span style="font-size: 0.8em;">포인트: <fmt:formatNumber value="${point}" pattern="#,###" /></span>
            <span><A id="recom_${status.count }" href="javascript:recom_ajax(${contentsno }, ${status.count })" class="recom_link">♥(${recom })</A></span>
     
            <br>
            <button type='button' id='btn_cart' class="btn btn-info" style='margin-bottom: 2px;'
                        onclick="cart_ajax(${contentsno })">장바 구니</button><br>
            <button type='button' id='btn_ordering' class="btn btn-info" 
                        onclick="cart_ajax(${contentsno })">바로 구매</button>  
          </td>
            <c:choose> 
           <c:when test="${grade <= 10 }">
                <td style='vertical-align: middle; text-align: center;'>
              
                  <A
                  href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page }"><span
                    class="glyphicon glyphicon-pencil"></span></A> <A
                  href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page }"><span
                    class="glyphicon glyphicon-trash"></span></A>
                </td>
                </c:when>
                </c:choose>
              </tr>
            </c:forEach>
           </c:when>
                
          <c:otherwise>
              <tr>
                <td colspan="6" style="text-align: center; font-size: 1.3em;">"${param.word }"에 대한 검색 내역이 없습니다.
                <br> 검색어의 철자가 정확한지 다시 한번 확인해주세요
              <br> 검색어의 단어 수를 줄이거나, 두 단어 이상의 검색어인 경우, 띄어쓰기를 해주세요</td>
              </tr>
   
          </c:otherwise>
          </c:choose>
          </tbody>
    
    </table>
    
    <DIV class='bottom_menu'>${paging }</DIV>
  </DIV>


  <jsp:include page="../menu/bottom.jsp" />
</body>

</html>



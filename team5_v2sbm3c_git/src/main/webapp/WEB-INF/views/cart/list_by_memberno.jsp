<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 천단위 콤마 --> 
 
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
$(function(){

});

  // GET -> POST 전송, 상품 삭제
  function delete_func(cartno) { 
    var frm = $('#frm_post');
    frm.attr('action', './delete.do');
    $('#cartno',  frm).val(cartno);
    
    frm.submit();
  }   
  // 수량
  function update_cnt(cartno) { 
    var frm = $('#frm_post');
    frm.attr('action', './update_cnt.do');
    $('#cartno',  frm).val(cartno);
    
    var new_cnt = $('#' + cartno + '_cnt').val();  // $('#1_cnt').val()로 변환됨.
    $('#cnt',  frm).val(new_cnt);
  
    // alert('cnt: ' + $('#cnt',  frm).val());
    // alert('cartno: ' + $('#cartno',  frm).val());
    // return;
    
    frm.submit();
    
  }
  
  $(document).ready(function(){  
    // 모두 체크
     $("#allCheck").click(function(){                    
        var chk = $("#allCheck").prop("checked");  // true 반환
        if(chk) {
         $("input[name=chkBox]:checkbox").prop("checked", true);    //cf) name 속성은 중복 가능, id는 고유한 속성(중복 불가)
        } else {
         $("input[name=chkBox]:checkbox").prop("checked", false);
        }
       });
     
    // 선택 체크
     $("input[name=chkBox]:checkbox").click(function(){
       $("#allCheck").prop("checked", false);
      });

     //선택 삭제
     $(".selectDelete_btn").click(function(){
       var msg = confirm("정말 삭제하시겠습니까?");  // true/false
       
       if(msg) {
        var checkArr = new Array(); // 다수의 cartno를 저장하기 위함
        $("input[id='chkBox']:checked").each(function(){   //체크된 체크박스 value 가져오기
         checkArr.push($(this).attr("data-cartNum"));  
        });
        
        console.log("-> checkArr: " + checkArr);
        
        $.ajax({
          url : "/cart/delete_ajax.do",
          type : "post",  // post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
         // dataType: 'json', // 응답 형식: json, html, xml...
          data: { chkbox : checkArr },     // 데이터
          success: function(rdate) { 
            if(rdate == 1) {          
              location.href = "/cart/list_by_memberno.do";
             } else {
               alert("삭제 실패");
             }
         }
        });
        
       } 
      }); 
    
  });

  <%-- 보관함에 상품 등록 --%>
  function myroom_ajax(contentsno) {
    var params = "";
    params += 'contentsno=' + contentsno;
    console.log('-> myroom_ajax params: ' + params); 
    //return;
    
    $.ajax({
        url: '/myroom/create_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          console.log('-> myroom_ajax cnt: ' + rdata.cnt);  // 1: 관심모델 등록 성공
          
          if (rdata.cnt == 1) {
            var sw = confirm('선택한 상품이 보관함에 담겼습니다.\n클릭하면 보관함으로 이동합니다.');
            if (sw == true) {
              // 보관함으로 이동
             location.href='/myroom/list_by_memberno.do';
            }else{
              location.reload(); 
            }             
          } else {
            alert('선택한 상품을 보관함에 담지못했습니다.\n잠시후 다시 시도해주세요.');
          }},
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

<%-- GET -> POST: 상품 삭제, 수량 변경용 폼 --%>
<form name='frm_post' id='frm_post' action='' method='post'>
  <input type='hidden' name='cartno' id='cartno'>
  <input type='hidden' name='cnt' id='cnt'>
</form>

<DIV class='content_body'>
<DIV class='title_line'>
  장바구니
</DIV>

  <ASIDE style="float: left;  font-size: 1.3em;">
   <input type="checkbox" id="allCheck"> 
    <label for="allCheck">모두 선택</label>
  </ASIDE>
  
  <ASIDE style="float: right; font-size: 0.9em;">
    <c:if test="${bookno != null}">
      <A href="/contents/list_by_cateno_search_paging?bookno=${bookno}">쇼핑 계속하기</A>
      <span class='menu_divide' >│</span>    
    </c:if>
    <div class="delBtn">
    <button class="selectDelete_btn" type="button">선택 삭제</button>
    </div>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 3%"></col>
      <col style="width: 5%;"></col>
      <col style="width: #"></col>
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col> 
      <col style="width: 10%;"></col>
    </colgroup>
   
    <thead>
      <tr>
        <th style='text-align: center;'></th>
        <th style='text-align: center;' colspan="2">상품정보</th> <!-- colspan: 열 합치기  -->
        <th style='text-align: center;'>판매가</th>
        <th style='text-align: center;'>수량</th>
        <th style='text-align: center;'>합계</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    </thead>
    
    <tbody>
      <c:choose>
       <c:when test="${list.size() > 0 }">
        <c:forEach var="cartVO" items="${list }" varStatus="status">
          <c:set var="cartno" value="${cartVO.cartno }" />
          <c:set var="contentsno" value="${cartVO.contentsno }" />
          <c:set var="memberno" value="${cartVO.memberno }" />
          <c:set var="cnt" value="${cartVO.cnt }" />
          <c:set var="rdate" value="${cartVO.rdate }" />
          
          <c:set var="title" value="${cartVO.title }" />
          <c:set var="content" value="${cartVO.content }" />
          <c:set var="thumb1" value="${cartVO.thumb1 }" />
          <c:set var="price" value="${cartVO.price }" />
          <c:set var="saleprice" value="${cartVO.saleprice }" />
          <c:set var="dc" value="${cartVO.dc }" />
          <c:set var="point" value="${cartVO.point }" />
          
          <c:set var="tot" value="${cartVO.tot }" />
          <c:set var="tot_cnt" value="${cartVO.tot_cnt }" />
            
          <tr>
            <td>
              <input type="checkbox" id="chkBox" name="chkBox" data-cartNum="${cartno }">
            </td>
                
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                  <%-- /static/contents/storage/ --%>
                  <a href="/contents/read.do?contentsno=${contentsno}"><IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;"></a> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${contentsVO.file1}
                </c:otherwise>
              </c:choose>
            </td>  
            
            <td style='vertical-align: middle; text-align: left;'>
              <a href="/contents/read.do?contentsno=${contentsno}"><strong>${title}</strong></a> 
            </td>
            
            <td style='vertical-align: middle; text-align: center;'>
              <del><fmt:formatNumber value="${price}" pattern="#,###" /></del><br>
              <span style="color: #FF0000; font-size: 1.2em;">${dc} %</span>
              <strong><fmt:formatNumber value="${saleprice}" pattern="#,###" /></strong><br>
              <span style="font-size: 0.8em;">포인트: <fmt:formatNumber value="${point}" pattern="#,###" /></span>
            </td>
            
            <td style='vertical-align: middle; text-align: center;'>
              <input type='number' id='${cartno }_cnt' min='1' max='100' step='1' value="${cnt }" 
                style='width: 52px;'><br>
              <button type='button' onclick="update_cnt(${cartno})" class='btn' style='margin-top: 5px;'>변경</button>
            </td>
            
            <td style='vertical-align: middle; text-align: center;'>
              <fmt:formatNumber value="${tot}" pattern="#,###" />
            </td>
            
            <td style='vertical-align: middle; text-align: center;'>
              <!-- <A href="#"><IMG src="#" title="보관함담기"></A><br> -->
              <button type="button" id='btn_myroom' onclick="myroom_ajax(${contentsno})">보관함담기</button><br>
              <A href="javascript: delete_func(${cartno })"><IMG src="/cart/images/delete4.png" title="삭제"></A>
              <%-- <button type="button" id='btn_del' data-cartno="${cartno}">삭제</button> --%>
            </td>
          </tr>
        </c:forEach> 
       </c:when>
       <c:otherwise>
         <tr>
          <td colspan="7"  style="text-align: center; font-size: 1.3em; padding: 50px;">장바구니에 담은 상품이 없습니다.</td>
         </tr>
       </c:otherwise>
      </c:choose>
      
    </tbody>
  </table>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 25%;"></col>
      <col style="width: 25%;"></col>
      <col style="width: 25%;"></col> 
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    
     <thead>
      <tr>
        <th style='text-align: left; border-right: 1px solid;'>상품금액/수량(${tot_cnt}개)</th>
        <th style='text-align: left; border-right: 1px solid;'>배송비</th>
        <th style='text-align: left; border-right: 1px dotted;'>결제 예정금액</th>
        <th style='text-align: left;'>적립예정</th>
        <th style='text-align: right;'>${point_tot } 원P</th>
      </tr>
    </thead>
  
    <tbody>
      <tr>
        <td style='vertical-align: middle; text-align: right;'>
          <strong><fmt:formatNumber value="${tot_sum }" pattern="#,###" /></strong> 원
         </td>
         
        <td style='vertical-align: middle; text-align: right;'>
        <div>
          <span style="float: left;"><img src="/cart/images/addition.gif" alt="+"></span>
          <strong><fmt:formatNumber value="${baesong_tot }" pattern="#,###" /></strong> 원
        </div>
        </td>
         
         
        <td style='vertical-align: middle; text-align: right; border-right: 1px dotted;'>
        <div>
         <span style="float: left;"><img src="/cart/images/equals.gif" alt="+"></span>
          <strong style="color: red;"><fmt:formatNumber value="${total_order }" pattern="#,###" /></strong> 원
        </div>  
        </td>
        
        <td style='vertical-align: middle; text-align: left;'>
          <span>기본적립</span>
        </td>
          
        <td style='vertical-align: middle; text-align: right;'>
          <strong ><fmt:formatNumber value="${point_tot }" pattern="#,###" /></strong> 원
        </td>
   
      </tr>
    </tbody>
  </table>
  <div style="text-align: center;">
    <c:choose>
      <c:when test="${list.size() > 0 }">   
        <form name='frm' id='frm' style='margin-top: 50px;' action="/order_pay/create.do" method='get'>
          <button type='submit' id='btn_order' class="btn btn-primary">주문하기</button>
        </form>
      </c:when>
      <c:otherwise>
      
      </c:otherwise>
    </c:choose>
  </div>
  
</DIV>
          
     
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
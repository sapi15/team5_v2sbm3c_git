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

  function delete_func(myroomno) {  //GET -> POST 전송, 상품 삭제
    var frm = $('#frm_post');
    frm.attr('action', './delete.do');
    $('#myroomno',  frm).val(myroomno);
    
    frm.submit();
  }   

  function cart_ajax(contentsno){
    var frm = $('#frm_post');
    frm.attr('action', '/cart/create.do');
    $('#contentsno',  frm).val(contentsno);
    
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
         checkArr.push($(this).attr("data-Myroomno"));  // $(this).val()
        });
        
        console.log("-> checkArr: " + checkArr);
        
        $.ajax({
          url : "/myroom/delete_ajax.do",
          type : "post",  // post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
         // dataType: 'json', // 응답 형식: json, html, xml...
          data: { chkbox : checkArr },     // 데이터
          success: function(rdate) { 
            if(rdate == 1) {          
              location.href = "/myroom/list_by_memberno.do";
             } else {
               alert("삭제 실패");
             }
         }
        });
        
       } 
      }); 
    
  });

  <%-- 장바구니에 상품 등록 --%>
  function cart_ajax(contentsno) {
    var params = "";
    params += 'contentsno=' + contentsno;
    console.log('-> myroom_ajax params: ' + params); 
    //return;
    
    $.ajax({
        url: '/cart/create_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          console.log('-> myroom_ajax cnt: ' + rdata.cnt);  // 1: 관심모델 등록 성공
          
          if (rdata.cnt == 1) {
            var sw = confirm('선택한 상품이 장바구니에 담겼습니다.\n클릭하면 장바구니로 이동합니다.');
            if (sw == true) {
              // 보관함으로 이동
             location.href='/cart/list_by_memberno.do';
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
  <input type='hidden' name='myroomno' id='myroomno'>
  <input type='hidden' name='contentsno' id='contentsno'>
</form>

<DIV class='content_body'>
<DIV class='title_line'>
  보관함
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
      <col style="width: 20%;"></col>
      <col style="width: 9%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
   
    <thead>
      <tr>
        <th style='text-align: center;'></th>
        <th style='text-align: center;' colspan="2">상품정보</th> <!-- colspan: 열 합치기  -->
        <th style='text-align: center;'>판매가</th>
        <th style='text-align: center;'>등록일</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    </thead>
    
    <tbody>
      <c:choose>
       <c:when test="${list.size() > 0 }">
        <c:forEach var="myroomVO" items="${list }">
          <c:set var="myroomno" value="${myroomVO.myroomno }" />
          <c:set var="contentsno" value="${myroomVO.contentsno }" />
          <c:set var="memberno" value="${myroomVO.memberno }" />
          <c:set var="rdate" value="${myroomVO.rdate }" />
          
          <c:set var="title" value="${myroomVO.title }" />
          <c:set var="content" value="${myroomVO.content }" />
          <c:set var="thumb1" value="${myroomVO.thumb1 }" />
          <c:set var="price" value="${myroomVO.price }" />
          <c:set var="saleprice" value="${myroomVO.saleprice }" />
          <c:set var="dc" value="${myroomVO.dc }" />
          <c:set var="point" value="${myroomVO.point }" />
          
          
                   
        <tr>
          <td>
            <input type="checkbox" id="chkBox" name="chkBox" data-Myroomno="${myroomno }">
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
              ${rdate.substring(0, 10)} <!-- 년월일 -->
            </td>
            
            <td style='vertical-align: middle; text-align: center;'>
             <button type="submit" id="btn_cart" onclick='cart_ajax(${contentsno })'>장바구니</button><br>
             <A href="javascript: delete_func(${myroomno })"><IMG src="/cart/images/delete4.png" title="삭제"></A> 
            </td>
          </tr>
        </c:forEach>
        </c:when>
        <c:otherwise>
          <tr>
            <td colspan="7"  style="text-align: center; font-size: 1.3em; padding: 50px;">보관함에 담은 상품이 없습니다.</td>
         </tr>
        </c:otherwise>
      </c:choose>
    </tbody>
  </table>
    
</DIV>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
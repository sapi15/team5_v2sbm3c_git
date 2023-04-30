<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  $(function() { // 자동 실행
    // id가 'btn_send'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 send 함수를 등록
    // document.getElementById('btn_checkID').addEventListener('click', checkID); 동일
    $('#btn_checkID').on('click', checkID);  
   
    $('#btn_DaumPostcode').on('click', DaumPostcode); // 다음 우편 번호
    $('#btn_close').on('click', setFocus); // Dialog창을 닫은후의 focus 이동
    $('#btn_send').on('click', send); 
    
    //체크여부 확인
/*     if($("input:checkbox[name=eamil_yn]").is(":checked") == true) {
      $('#eamil_yn').val('Y');
    }else{
      $('#eamil_yn').val('N');
    } */
  });

  // jQuery ajax 요청
  function checkID() {
    // $('#btn_close').attr("data-focus", "이동할 태그 지정");
    
    var frm = $('#frm'); // id가 frm인 태그 검색
    var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
    var params = '';
    var msg = '';

    if ($.trim(id).length == 0) { // id를 입력받지 않은 경우
      msg = '· ID를 입력하세요.<br>· ID 입력은 필수 입니다.<br>· ID는 3자이상 권장합니다.';
      
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('ID 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#btn_close').attr("data-focus", "id");  // 닫기 버큰 클릭시 id 입력으로 focus 이동
      $('#modal_panel').modal();              // 다이얼로그 출력
      return false;
    } else {  // when ID is entered
      params = 'id=' + id;
      // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      // alert('params: ' + params);

      $.ajax({
        url: './checkID.do', 
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { 
          // alert(rdata);
          var msg = "";
          
          if (rdata.cnt > 0) {
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
            msg = "이미 사용중인 ID 입니다.";
            $('#btn_close').attr("data-focus", "id");     // id 입력으로 focus 이동
          } else {
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            msg = "사용 가능한 ID 입니다.";
            $('#btn_close').attr("data-focus", "passwd");  // passwd 입력으로 focus 이동
            // $.cookie('checkId', 'TRUE'); // Cookie 기록
          }
          
          $('#modal_title').html('ID 중복 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      });
    }
  }

  function setFocus() {  // focus 이동
    console.log('btn_close click!');
    
    var tag = $('#btn_close').attr('data-focus'); // data-focus 속성에 선언된 값을 읽음
    console.log('tag: ' + tag);
    
    $('#' + tag).focus(); // data-focus 속성에 선언된 태그를 찾아서 포커스 이동
  }

  function send() { // 회원 가입 처리
    // 패스워드를 정상적으로 2번 입력했는지 확인
    if ($('#passwd').val() != $('#passwd2').val()) {
      msg = '입력된 패스워드가 일치하지 않습니다.<br>';
      msg += "패스워드를 다시 입력해주세요.<br>"; 
      
      $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
      $('#modal_title').html('패스워드 일치 여부  확인'); // 제목 
      $('#modal_content').html(msg);  // 내용
      $('#modal_panel').modal();         // 다이얼로그 출력
      
      $('#btn_send').attr('data-focus', 'passwd');
      
      return false; // submit 중지
    }

    $('#frm').submit();
  }

  // select에서 옵션 값을 email2에 값 넣기
  $(function(){  
    $(document).ready(function(){  // window.onload와 비슷한 기능?

       // readonly 속성: 읽기 전용으로 변경. form으로 값 전달 된다. boolean형
      // cf) disabled 속성 : readonly와 기능은 같으나 form으로 값 전달이 되지 않는다.
      $('select[name=email2_select]').change(function() {
        if($(this).val()=="non"){
          $('#email2').val('');
          $('#email2').attr("readonly", false); // 읽기 전용 해제
        } else {
          $('#email2').val($(this).val());
          $('#email2').attr("readonly",true);  // 읽기 전용 설정
        }
      });
      
    });
  });


</script>
</head> 


<body>
<jsp:include page="../menu/top.jsp" flush='false' />

  <!-- ************************ Modal 알림창 시작 ************************ -->
  <div id="modal_panel" class="modal fade"  role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id="btn_close" data-focus="" class="btn btn-default" 
                      data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ************************ Modal 알림창 종료 ************************ -->
  <DIV class='content_body'>
  <DIV class='title_line'>
    회원 가입
  </DIV>

   <div class='menu_line'></div>
    
    <FORM name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">
      <div class="form-group">
        <label for="id" class="col-md-2 control-label" style='font-size: 0.9em;'>아이디*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='id' id='id' value='' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <button type='button' id="btn_checkID" class="btn btn-info btn-md">중복확인</button>
          <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
        </div>
      </div>   
                  
      <div class="form-group">
        <label for="passwd" class="col-md-2 control-label" style='font-size: 0.9em;'>패스워드*</label>    
        <div class="col-md-10">
          <input type='password' class="form-control" name='passwd' id='passwd' value='' required="required" style='width: 30%;' placeholder="패스워드">
        </div>
      </div>   
  
      <div class="form-group">
        <label for="passwd2" class="col-md-2 control-label" style='font-size: 0.9em;'>패스워드 확인*</label>    
        <div class="col-md-10">
          <input type='password' class="form-control" name='passwd2' id='passwd2' value='' required="required" style='width: 30%;' placeholder="패스워드">
        </div>
      </div>   
      
      <div class="form-group">
        <label for="name" class="col-md-2 control-label" style='font-size: 0.9em;'>성명*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='name' id='name' 
                     value='' required="required" style='width: 30%;' placeholder="성명">
        </div>
      </div>   
  
      <div class="form-group">
        <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>전화번호*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='tel' id='tel' 
                     value='' required="required" style='width: 30%;' placeholder="전화번호"> 예) 010-0000-0000
        </div>
      </div>   
      
      <div class="form-group">
        <label for="email1 email2" class="col-md-2 control-label" style='font-size: 0.9em;'>이메일<br>(e-mail)*</label>    
        <div class="col-md-10">
          <input type="text" class="form-control" name='email1' id='email1' 
                     style="width: 15%; float: left;" placeholder="email1" required="required">  
          <p style="float: left;">@</p>
          <input type="text" class="form-control" name="email2" id='email2' 
                    style="width: 15%; float: left;" placeholder=".com" required="required">
          <select name='email2_select' id='email2_select' class="form-control" onChange="" style="width: 20%;">
              <option value="non">직접입력</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="naver.com">naver.com</option>
              <option value="yahoo.co.kr">yahoo.co.kr</option>
              <option value="hotmail.com">hotmail.com</option>
              <option value="paran.com">paran.com</option>
              <option value="nate.com">nate.com</option>
              <option value="google.com">google.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="empal.com">empal.com</option>
              <option value="korea.com">korea.com</option>
              <option value="freechal.com">freechal.com</option>
          </select><br>
          <fieldset>
            <input type="radio" name='email_yn' id='email_y' value="Y" checked="checked" >
            <label for='email_y' >메일 수신</label>
            <input type="radio" name='email_yn' id='email_n' value="N">
            <label for='email_n'>메일 수신 안함</label>
          </fieldset>
          <!-- <input type="checkbox" name='email_yn' id ='email_yn' value="Y"checked="checked"> BOOK에서 발송하는 e-mail을 수신합니다. -->
        </div>
      </div>    
  
      <div class="form-group">
        <label for="postcode" class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='postcode' id='postcode' 
                     value='' style='width: 30%;' placeholder="우편번호">
          <input type="button" id="btn_DaumPostcode" value="우편번호 찾기" class="btn btn-info btn-md">
        </div>
      </div>  
  
      <div class="form-group">
        <label for="address1" class="col-md-2 control-label" style='font-size: 0.9em;'>주소</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='address1' id='address1' 
                     value='' style='width: 80%;' placeholder="주소">
        </div>
      </div>   
  
      <div class="form-group">
        <label for="address2" class="col-md-2 control-label" style='font-size: 0.9em;'>상세 주소</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='address2' id='address2' 
                     value='' style='width: 80%;' placeholder="상세 주소">
        </div>
      </div>   
  
      <div class="form-group">
      <div class="col-md-12">
  
  <!-- ---------- DAUM 우편번호 API 시작 ---------- -->
  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
    <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
  </div>
  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_wrap = document.getElementById('wrap');
  
      function foldDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_wrap.style.display = 'none';
      }
  
      function DaumPostcode() {
          // 현재 scroll 위치를 저장해놓는다.
          var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = data.address; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수
  
                  // 기본 주소가 도로명 타입일때 조합한다.
                  if(data.addressType === 'R'){
                      //법정동명이 있을 경우 추가한다.
                      if(data.bname !== ''){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있을 경우 추가한다.
                      if(data.buildingName !== ''){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                      fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  $('#postcode').val(data.zonecode); //5자리 새우편번호 사용 ★
                  $('#address1').val(fullAddr);  // 주소 ★
  
                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_wrap.style.display = 'none';
  
                  // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                  document.body.scrollTop = currentScroll;
                  
                  $('#address2').focus(); //  ★
              },
              // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
              onresize : function(size) {
                  element_wrap.style.height = size.height+'px';
              },
              width : '100%',
              height : '100%'
          }).embed(element_wrap);
  
          // iframe을 넣은 element를 보이게 한다.
          element_wrap.style.display = 'block';
      }
  </script>
  <!-- ---------- DAUM 우편번호 API 종료 ---------- -->
  
        </div>
      </div>
      
      <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
          <button type="button" id='btn_send' class="btn btn-primary btn-md">가입</button>
          <button type="reset" class="btn btn-primary btn-md">다시입력</button>
          <button type="button" onclick="history.back()" class="btn btn-primary btn-md">취소</button>
        </div>
      </div>   
    </FORM>
 </DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
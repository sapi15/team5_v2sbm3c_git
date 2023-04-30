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
 
  
</script>

</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'><A href="../chinesegrp/list.do" class='title_link'>주제</A></DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
    </colgroup>
   
    <thead>  
    <TR>
     <TH class="th_bs">즐겨찾기 <br>그룹 번호 </TH>
      <TH class="th_bs">주제</TH>
       <TH class="th_bs">즐겨찾기<br> 번호</TH>
       <TH class="th_bs">세부 주제</TH>
      <TH class="th_bs">내용</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="Chinesegrp_ChVO" items="${list}">
      <c:set var="r_chgrpno" value="${Chinesegrp_ChVO.r_chgrpno }" />
      <c:set var="r_chfield" value="${Chinesegrp_ChVO.r_chfield }" />
      <c:set var="chno" value="${Chinesegrp_ChVO.chno }" />
      <c:set var="chgrpno" value="${Chinesegrp_ChVO.chgrpno }" />
      <c:set var="chtitle" value="${Chinesegrp_ChVO.chtitle }" />
      <c:set var="chex" value="${Chinesegrp_ChVO.chex }" />
      <c:set var="rdate" value="${Chinesegrp_ChVO.rdate.substring(0, 10) }" />
      <TR>
      <TD class="td_bs">${r_chgrpno }</TD>
      <TD class="td_bs">${r_chfield }</TD>
      <TD class="td_bs">${chno }</TD>
      <TD class="td_bs_left">${chtitle }</TD>
         <TD class="td_bs_left">${chex }</TD>
        <TD class="td_bs">${rdate }</TD>
        
        
        <TD class="td_bs">
          <A href="./read_update.do?chno=${chno }&chgrpno=${chgrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?chno=${chno }&chgrpno=${chgrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A> 
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
   
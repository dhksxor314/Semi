<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
   href="bootstrap/css/bootstrap-responsive.min.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">

<style>
#title {
   font-size: 30px;
}

.pull-right{
   margin-right:50px;
}
</style>
<script>
//라디오를 버튼모양으로 만듬
$(function() {
    $( "#radio" ).buttonset();
  });
</script>
</head>
<body>
   <c:if test="${fail!=null }">
      <script>
         //로그인에 실패했을 시 알림
         alert("${fail}");
      </script>
   </c:if>
   <%@ include file="include/header.jsp" %>
   
   <div class="container">
      <div class="row">
         <div class="span3"></div>
         <div class="span6" id="loginDiv">
            <span id="title">로그인</span>
            <hr/>
            <form class="form-horizontal" method="post" action="manage" name="login">
               <input type="hidden" name="cmd" value="login"/>
               <div id="radio" style="margin-left:50px;">
                      <input type="radio" id="radio2" name="option" value="member" checked="checked"><label for="radio2">일반회원</label>
                      <input type="radio" id="radio4" name="option" value="speaker"><label for="radio4">강연자</label>
                         <input type="radio" id="radio3" name="option" value="manager"><label for="radio3">관리자</label>
               </div>
               <br/>
               <div class="control-group">
                  <label class="control-label" for="inputId">ID</label>
                  <div class="controls">
                     <input type="text" id="inputId" placeholder="ID" name="id" required="required">
                  </div>
               </div>
               <div class="control-group">
                  <label class="control-label" for="inputPassword">Password</label>
                  <div class="controls">
                     <input type="password" id="inputPassword" placeholder="Password" name="pass" required="required">
                  </div>
               </div>
               
               
               <div class="control-group">
                  <div class="controls">
                     <button type="submit" class="btn">로그인</button>
                  </div>
               </div>
               
            </form>
            <span>아직 회원이 아니신가요?&nbsp;&nbsp;&nbsp;<a href="move?cmd=sign_up">회원가입</a></span>
            <hr style="border:1px solid black"/>
            <a href="move?cmd=findId">아이디를 잊어버리셨나요?</a>
            <a href="move?cmd=findPw" class="pull-right" style="margin-bottom:20px;">비밀번호를 잊어버리셨나요?</a>
            
         </div>
      </div>
      
   </div>
   <%@ include file="include/footer.jsp" %>
</body>
</html>
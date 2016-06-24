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
//������ ��ư������� ����
$(function() {
    $( "#radio" ).buttonset();
  });
</script>
</head>
<body>
   <c:if test="${fail!=null }">
      <script>
         //�α��ο� �������� �� �˸�
         alert("${fail}");
      </script>
   </c:if>
   <%@ include file="include/header.jsp" %>
   
   <div class="container">
      <div class="row">
         <div class="span3"></div>
         <div class="span6" id="loginDiv">
            <span id="title">�α���</span>
            <hr/>
            <form class="form-horizontal" method="post" action="manage" name="login">
               <input type="hidden" name="cmd" value="login"/>
               <div id="radio" style="margin-left:50px;">
                      <input type="radio" id="radio2" name="option" value="member" checked="checked"><label for="radio2">�Ϲ�ȸ��</label>
                      <input type="radio" id="radio4" name="option" value="speaker"><label for="radio4">������</label>
                         <input type="radio" id="radio3" name="option" value="manager"><label for="radio3">������</label>
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
                     <button type="submit" class="btn">�α���</button>
                  </div>
               </div>
               
            </form>
            <span>���� ȸ���� �ƴϽŰ���?&nbsp;&nbsp;&nbsp;<a href="move?cmd=sign_up">ȸ������</a></span>
            <hr style="border:1px solid black"/>
            <a href="move?cmd=findId">���̵� �ؾ�����̳���?</a>
            <a href="move?cmd=findPw" class="pull-right" style="margin-bottom:20px;">��й�ȣ�� �ؾ�����̳���?</a>
            
         </div>
      </div>
      
   </div>
   <%@ include file="include/footer.jsp" %>
</body>
</html>
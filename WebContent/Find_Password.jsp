<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="bootstrap/css/bootstrap-responsive.min.css">
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
#title {
	font-size: 30px;
}

.pull-right {
	margin-right: 50px;
}
</style>
<script>
	$(document).ready(function(){
		//찾기 버튼을 눌렀을 시 입력된 값이 있는지 확인하고 전송
		$("#find").click(function(){
			var $id = $("#inputId").val();
			var $email = $("#inputEmail").val();
			
			if(!$id){
				alert("이름을 입력해주세요");
				return;
			}
			if(!$email){
				alert("이메일을 입력해주세요");
				return;
			}
			
			$("#findForm").submit();
		});
	});
</script>
</head>
<body>
<c:if test="${foundPw!=null }">
	<script>
		//일치하는 값이 없을 경우 출력
		alert("${foundPw}");
	</script>
</c:if>
	<%@ include file="WEB-INF/manage/common.jsp" %>
	<div>
		<ul class="nav nav-pills">
			<li><a href="#"><img src="../images/logo.PNG"></a></li>
			<li><a href="#" class="btn btn-info btn-large">개설하기</a></li>
			<li class="dropdown"><a class="dropdown-toggle btn-large"
				data-toggle="dropdown" href="#">참가하기<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">강연</a></li>
					<li><a href="#">모임</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<div class="container">
		<div class="row">
			<div class="span3"></div>
			<div class="span6" id="loginDiv">
				<span id="title">비밀번호 찾기</span>
				<hr />
				<form class="form-horizontal" action="manage" method="post" id="findForm">
					<input type="hidden" name="cmd" value="findPw"/>
					<div class="control-group">
						<label class="control-label" for="inputId">ID</label>
						<div class="controls">
							<input type="text" id="inputId" placeholder="ID" name="id">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputEmail">E-mail</label>
						<div class="controls">
							<input type="text" id="inputEmail" placeholder="email" name="email">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="button" class="btn" id="find">찾기</button>
						</div>
					</div>
				</form>
				<label>가입하실 때 사용하신 아이디와 이메일를 입력해주세요</label>
			</div>
		</div>
	</div>

	<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


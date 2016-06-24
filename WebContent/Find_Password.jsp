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
		//ã�� ��ư�� ������ �� �Էµ� ���� �ִ��� Ȯ���ϰ� ����
		$("#find").click(function(){
			var $id = $("#inputId").val();
			var $email = $("#inputEmail").val();
			
			if(!$id){
				alert("�̸��� �Է����ּ���");
				return;
			}
			if(!$email){
				alert("�̸����� �Է����ּ���");
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
		//��ġ�ϴ� ���� ���� ��� ���
		alert("${foundPw}");
	</script>
</c:if>
	<%@ include file="WEB-INF/manage/common.jsp" %>
	<div>
		<ul class="nav nav-pills">
			<li><a href="#"><img src="../images/logo.PNG"></a></li>
			<li><a href="#" class="btn btn-info btn-large">�����ϱ�</a></li>
			<li class="dropdown"><a class="dropdown-toggle btn-large"
				data-toggle="dropdown" href="#">�����ϱ�<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">����</a></li>
					<li><a href="#">����</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<div class="container">
		<div class="row">
			<div class="span3"></div>
			<div class="span6" id="loginDiv">
				<span id="title">��й�ȣ ã��</span>
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
							<button type="button" class="btn" id="find">ã��</button>
						</div>
					</div>
				</form>
				<label>�����Ͻ� �� ����Ͻ� ���̵�� �̸��ϸ� �Է����ּ���</label>
			</div>
		</div>
	</div>

	<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


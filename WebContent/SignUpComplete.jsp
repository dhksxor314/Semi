<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ֹ�������</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"
	media="screen" title="no title" />
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<link rel=��stylesheet��
	href=��http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css��>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			location.href="Login.jsp";
		});
	});
	
</script>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="container">
	<div class="span3"></div>
<section><div class="span5">
	<pre>
<div align="center"><h2>���� ȸ������ �Ϸ�</h2>
<img src="pang.jpg" width="30" height="30" />���Ͽ����丮 ȸ���� �ǽŰ� �����մϴ�.<img
				src="pang.jpg" width="30" height="30" />
</div></pre>
	<br />
	<div align="center">
		<img src="pang.jpg" /> <br /> <br />
		<h3>ȸ�������� �Ϸ�Ǿ����ϴ�.</h3>
		<br /> �پ��� ���Ӱ� �̺�Ʈ�� �����ϰ� ���� ���ϰ� �̿��� �� �ֽ��ϴ�.<br /> <br /> <br />
	</div>

	<p align="center">
		<button BORDER="9" class=" btn btn-large btn-info " id="btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�α���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
	</p>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>

</section>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>

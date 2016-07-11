<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자주묻는질문</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"
	media="screen" title="no title" />
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<link rel=”stylesheet”
	href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“>
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
<div align="center"><h2>모임 회원가입 완료</h2>
<img src="pang.jpg" width="30" height="30" />노하우팩토리 회원이 되신걸 축하합니다.<img
				src="pang.jpg" width="30" height="30" />
</div></pre>
	<br />
	<div align="center">
		<img src="pang.jpg" /> <br /> <br />
		<h3>회원가입이 완료되었습니다.</h3>
		<br /> 다양한 모임과 이벤트를 제공하고 쉽고 편리하게 이용할 수 있습니다.<br /> <br /> <br />
	</div>

	<p align="center">
		<button BORDER="9" class=" btn btn-large btn-info " id="btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
	</p>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>

</section>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>

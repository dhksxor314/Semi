<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<style>
.menu-header {
	width: 100%;
	padding: 20px 0px;
	background-color: #ebebeb;
	border-bottom: 1px solid #ddd;
}

.menu-header h4 {
	padding-top: 14px;
}
</style>
<style>
ul.page-list li {
	font-size: 12px;
	border-left: 0;
	border-right: 0;
	padding: 10px;
}

ul.ad-list li {
	border: 0;
	padding: 1px 0px;
}

ul.ad-list li img {
	border: 1px solid #eee;
}

.pagination {
	font-size: 12px;
}

.pagination>li:first-child>a, .pagination>li:first-child>span {
	border-radius: 0px;
}

.pagination>li:last-child>a, .pagination>li:last-child>span {
	border-radius: 0px;
}

.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover,
	.pagination>.active>span:hover, .pagination>.active>a:focus,
	.pagination>.active>span:focus {
	background-color: #F35A55;
	border-color: #F35A55;
}
</style>
<style>
body {
	margin: 0px;
	padding: 0px;
}

.jbTitle {
	text-align: center;
}

.jbMenu {
	text-align: center;
	background-color: yellow;
	padding: 10px 0px;
	width: 100%;
}

.jbContent {
	height: 2000px;
}

.jbFixed {
	position: fixed;
	top: 0px;
}
</style>
<style>
#toTopBtn .top {
	visibility: visible;
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 50px;
	height: 50px;
	padding-top: 6px;
	border: 1px solid #eee;
	background-color: #fff;
	z-index: 999;
	text-align: center;
	font-size: 12px;
	font-weight: 600;
	color: #777;
	line-height: 1.4em;
	cursor: pointer;
	-webkit-box-shadow: 0px 0px 4px 1px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0px 0px 4px 1px rgba(0, 0, 0, 0.1);
	box-shadow: 0px 0px 4px 1px rgba(0, 0, 0, 0.1);
	display: none;
}
</style>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container" style="margin-top: 15px;">
		<div class="row">
			<div class="col-md-12" style="text-align: center;">
				<div style="margin-top: 20px;">
					<i class="fa fa-check fa-5x"></i>
				</div>
				<h1>참가신청 완료</h1>
				<div style="margin: 20px 0 30px; font-weight: bold; color: #df5b5a">
					" 옛 사람 이야기 "</div>
				<div>
					만남 당일, <strong>문자</strong>로 사람책 연락처가 안내됩니다.<br /> 정해진 시간과 장소에서
					사람책을 만나보세요.
				</div>
				<div style="margin: 30px 0;">
					<a href="control?cmd=joinlist" class="btn btn-default">참가하기로 가기</a>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
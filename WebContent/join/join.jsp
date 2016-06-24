<%@page import="join.listDto"%>
<%@page import="join.listDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
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
	<%
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));

		listDao dao = new listDao();
		listDto dto = dao.getinfo(num);
	%>
	<%@ include file="../include/header.jsp"%>

	<div class="container" style="margin-top: 15px;">
		<div class="row">
			<div class="col-md-12 hidden-xs"
				style="margin: 10px 0 20px; font-size: 15pt;">
				STEP1. 정보 입력 <span style="opacity: 0.2;">&rsaquo; STEP2. 결제수단
					선택 &rsaquo; STEP3. 최종 확인</span>
			</div>
			<div class="col-md-12 visible-xs"
				style="margin-bottom: 15px; font-size: 12pt;"><%=dto.getTitle()%></div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-5 hidden-xs">
				<img src="/upload/<%=dto.getImage()%>"
					class="img-responsive img-rounded"
					style="margin: auto; border: 1px solid #dfe1e0;" />
				<table class="table wTable wisdome-info">
					<tr>
						<th>제목</th>
						<td><%=dto.getTitle()%></td>
					</tr>
					<tr>
						<th>날짜</th>
						<td><%=dto.getReporting_date().substring(0, 10)%> &nbsp;<i
							class="fa fa-arrow-right"></i>&nbsp;<strong
							style="color: #F1645D;"> </strong></td>
					</tr>
					<tr>
						<th>시간</th>
						<td><%=dto.getStarttime()%> ~ <%=dto.getEndtime()%></td>
					</tr>
					<tr>
						<th>장소</th>
						<td><%=dto.getPlace_name()%></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><%=dto.getPrice()%>원 / 1명</td>
					</tr>
				</table>
			</div>
			<div class="col-md-8 col-sm-7">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="pull-left">
							<b>정보 입력</b>
						</div>
						<div class="pull-right">
							<span class="label" style="color: #ddd; border: 1px solid #333;">STEP1</span>
							<span class="label label-danger" style="border: 1px solid #ddd;">STEP2</span>
							<span class="label" style="border: 1px solid #ddd;">STEP3</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<form method="post" rule="form" class="form" action="control">
							<input type="hidden" id="cmd" name="cmd" value="join2" />
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
									<table class="table wTable vTable domee-info"
										style="margin-left: 25px; margin-bottom: 0 !important;">
										<tr>
											<th>이름</th>
											<td><input type="text" name="name" value="오완택"
												class="form-control" /></td>
										</tr>
										<tr>
											<th>직업</th>
											<td><input type="text" name="job"
												value="<%=dto.getJob()%>" class="form-control" /></td>
										</tr>
										<tr>
											<th>연락처</th>
											<td><input type="text" name="phone"
												value="<%=dto.getPhone()%>" class="form-control" /></td>
										</tr>

									</table>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<input type="hidden" name="num" value="<%=num%>" />
									<div class="text-center" style="margin: 30px 0 15px;">
										<input type="submit" value="다음" class="btn btn-primary" /> <a
											href="/17072" class="btn btn-default">취소</a>
									</div>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>

	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
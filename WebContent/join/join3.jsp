<%@page import="join.listDto"%>
<%@page import="join.listDao"%>
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
<%
	request.setCharacterEncoding("euc-kr");
	int num = (Integer) request.getAttribute("num");
	int cash = (Integer) request.getAttribute("cash");
	String paymentType = (String) request.getAttribute("paymentType");
	listDao dao = new listDao();
	listDto dto = dao.getinfo(num);
	int price = dto.getPrice();
%>
<script>
	$(document)
			.ready(
					function() {
						$("#payment")
								.click(
										function() {
											if (
<%=paymentType.equals("1")%>
	) {
												document.ini.submit();
											} else {
												url = "control?cmd=payment&num="
														+ document.ini.num.value
														+ "&price="
														+
<%=price%>
	+ "&cash="
														+
<%=cash%>
	;
												open(
														url,
														"",
														"toolbar=no, location=no, status=no, menubar=no, scrollbar=no, resizable=no, width=400, height=600, left=800, top=200")
											}
										});
						$("#cart").click(function() {
							$("#cart1").val("cart1");
							document.ini.submit();
						});
					});
</script>
<body>

	<%@ include file="../include/header.jsp"%>
	<div class="container" style="margin-top: 15px;">
		<div class="row">
			<div class="col-md-12 hidden-xs"
				style="margin: 10px 0 20px; font-size: 15pt;">
				<span style="opacity: 0.2;">STEP1. 정보 입력 &rsaquo; STEP2. 결제수단
					선택</span> &rsaquo; STEP3. 최종 확인
			</div>
			<div class="col-md-12 visible-xs"
				style="margin-bottom: 15px; font-size: 12pt;">결제</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="pull-left">
							<b>최종금액 확인</b>
						</div>
						<div class="pull-right">
							<span class="label" style="border: 1px solid #ddd;">STEP1</span>
							<span class="label" style="border: 1px solid #ddd;">STEP2</span>
							<span class="label label-danger"
								style="color: #ddd; border: 1px solid #333;">STEP3</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<div class="col-md-3 hidden-xs"></div>
						<div class="col-md-6 col-xs-12">
							<form name="ini" action="control" method="post">
								<input type="hidden" id="cmd" name="cmd" value="paymentproc" />
								<input type="hidden" id="cmd" name="cmd" value="cart" />
								<table class="table wTable vTable">
									<tr>
										<th style="border-top: 0;">주문금액</th>
										<td style="border-top: 0;"><%=price%>원</td>
									</tr>
									<tr>
										<th>적립금 사용</th>
										<td><%=cash%>원</td>
									</tr>
									<tr class="hidden-xs">
										<th>결제수단</th>
										<td>
											<%
												if (request.getParameter("paymentType").equals("1")) {
											%>무료 <%
												} else {
											%>계좌이체 <%
												}
											%>
										</td>

									</tr>
									<tr class="warning">
										<th style="border-bottom: 1px solid #dfe1e0;">최종금액</th>
										<td style="border-bottom: 1px solid #dfe1e0;"><%=price - cash%>원</td>
									</tr>
								</table>
								<div style="margin: 30px 0 15px; text-align: center;">
									<input type="hidden" id="num" name="num" value="<%=num%>" />
									<input type="hidden" id="s_m" name="s_m"
										value="<%=dto.getS_m()%>" /> <input type="hidden"
										id="paymenttype" name="paymenttype"
										value="<%=request.getParameter("paymentType")%>" /> <input
										type="hidden" id="cart1" name="cart1" value="" /> <input
										type="hidden" id="price" name="price" value="<%=price%>" /> <input
										type="hidden" id="cash" name="cash" value="<%=cash%>" />
										<input
										type="button" id="cart" name="cart" value="장바구니"
										class="btn btn-primary" /> <input type="button" id="payment"
										name="payment" value="결제하기" class="btn btn-primary" /> &nbsp;<a
										href="/payment/7267bb5598654f8db674a940a52b6078/do-cancel"
										class="btn btn-default">결제취소</a>
								</div>
							</form>
						</div>
						<div class="col-md-3 hidden-xs"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>

	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
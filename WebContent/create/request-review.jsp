<%@page import="create.placeDto"%>
<%@page import="create.createDao"%>
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
.basic-info input.form-control, .section input.form-control, .wisdomer input.form-control.solo,
	.request-review input.form-control.solo {
	border: none;
	box-shadow: none;
	-webkit-box-shadow: none;
	border-bottom: 1px solid #ddd;
}

.basic-info input.form-control:focus, .section input.form-control:focus,
	.wisdomer input.form-control.solo:focus, .request-review input.form-control.solo:focus
	{
	outline: none !important;
}

.basic-info textarea.form-control, .section textarea.form-control,
	.wisdomer textarea.form-control.solo, .request-review textarea.form-control
	{
	border: none;
	border-bottom: 1px solid #ddd;
}

.basic-info textarea.form-control:focus, .section textarea.form-control:focus,
	.wisdomer textarea.form-control.solo:focus, .request-review textarea.form-control:focus
	{
	outline: none !important;
}

.basic-info ul, .section ul, .wisdomer ul, .request-review ul {
	padding-left: 15px;
}

.basic-info .col-md-8, .section .col-md-8, .wisdomer .col-md-8,
	.request-review .col-md-8 {
	border-right: 1px solid #eee;
}

.basic-info .col-md-4, .section .col-md-4, .wisdomer .col-md-4,
	.request-review .col-md-4 {
	border-left: 1px solid #df5b5a;
	margin-top: 20px;
	font-size: 13px;
	color: #848484;
}

.basic-info .form-group, .section .form-group, .wisdomer .form-group,
	.request-review .form-group {
	margin-top: 15px;
}

.submit-group {
	margin-top: 30px;
}

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
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		createDao dao = new createDao();
		placeDto dto=new placeDto();
		
		dto=dao.getplace2(Integer.parseInt((String)session.getAttribute("placeno")));
		
		
		

		Object title = null, description = null, category = null;
		Object tickets = null, price = null, date = null, startTime = null, endTime = null,
				placeAddress = null, placeName = null;
		
		
		
		if (session.getAttribute("title") != null) {
			title = session.getAttribute("title");
		} else {
			title = "제목이 입력되지 않았습니다.";
		}
		if (session.getAttribute("description") != null) {
			description = session.getAttribute("description");
		} else {
			description = "상세 내용이 입력되지 않았습니다.";
		}
		if (session.getAttribute("tickets") != null) {
			tickets = session.getAttribute("tickets");
		} else {
			tickets = "최소 1명 이상으로 입력해주세요.";
		}
		if (session.getAttribute("startTime") != null) {
			startTime = session.getAttribute("startTime");
		} else {
			startTime = "만남 시작 시간이 입력되지 않았습니다.";
		}
		if (session.getAttribute("endTime") != null) {
			endTime = session.getAttribute("endTime");
		} else {
			endTime = "만남 종료 시간이 입력되지 않았습니다.";
		}
		if (session.getAttribute("placeno") != null) {
			placeName = dto.getPlace_name();
		} else {
			placeName = "장소 이름이 입력되지 않았습니다.";
		}
		if (session.getAttribute("placeAddress") != null) {
			placeAddress = session.getAttribute("placeAddress");
		} else {
			placeAddress = "주소가 입력되지 않았습니다";
		}
	%>
	<%@ include file="../include/header.jsp" %>
	
	<br />
	<br />
	<div class="hidden-sm hidden-xs" style="padding-bottom: 60px;">
		<div class="menu-header">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="pull-left">
							<h4>제목을 입력해주세요</h4>
						</div>
						<div class="pull-right"></div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="span12">
				<ul class="nav nav-pills nav-justified make-step">
					<li id="nav-basic-info" class=""><a href="basic-info.jsp">STEP1.
							만남 내용</a></li>
					<li id="nav-section" class=""><a href="section.jsp">STEP2.
							시간,장소,가격</a></li>
					<li id="nav-wisdomer" class=""><a href="wisdomer.jsp">STEP3.
							사람책 정보</a></li>
					<li id="nav-request-review" class=""><a
						href="request-review.jsp">완료!</a></li>
				</ul>
			</div>
		</div>

		<div class="row request-review">
			<div class="span12">
				<div class="panel panel-default">
					<div class="panel-body" style="padding: 40px;">
						<form class="form" id="formWisdomer" method="post" action="control">
							<input type="hidden" id="cmd" name="cmd" value="createproc"/>
							<div class="page-header" style="margin-top: 0;">
								<h5>아래 항목을 다시 한 번 확인하시고 수정해주세요.</h5>
							</div>
							<table class="table wTable nonInput">
								<tr>
									<th>제목</th>
									<td><%=title%></td>
								</tr>
								<tr>
									<th>상세 내용</th>
									<td><%=description%></td>
								</tr>
								<tr>
									<th>인원</th>
									<td><%=tickets%></td>
								</tr>
								<tr>
									<th>시간</th>
									<td><%=startTime%></td>
								</tr>
								<tr>
									<th>시간</th>
									<td><%=endTime%></td>
								</tr>
								<tr>
									<th>장소 이름</th>
									<td><%=placeName%></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><%=placeAddress%></td>
								</tr>

							</table>

							<div class="text-center" style="margin: 30px 0 15px;">
								<a href="#theModal" class="btn" data-toggle="modal">모객 시작하기</a>
							</div>
							<div class="clear"></div>
							<div class="modal hide fade" id="theModal">
								<div class="modal-header">
									<a href="#" class="close" data-dismiss="modal">&times;</a>
								</div>
								<div class="modal-body" style="text-align: center;">
									<p>
										'확인'을 누르시면 바로 모객이 시작됩니다. <br> 참가자가 1명이라도 있을 경우 만남 수정이
										불가능하오니 신중하게 결정해주세요.
									</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
									<button type="submit" class="btn btn-primary">확인</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>

	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
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

<body>
	<%
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));

		listDao dao = new listDao();
		listDto dto = dao.getinfo(num);
	%>
	<script>
		$(document).ready(function() {
			$("#btnCashUseAll").click(function() {
				$("#inputCash").val(<%=dto.getPoint()%>)
			})
		})
	</script>
	<%@ include file="../include/header.jsp" %>


	<div class="container" style="margin-top: 15px;">
		<div class="row">
			<div class="col-md-12 hidden-xs"
				style="margin: 10px 0 20px; font-size: 15pt;">
				<span style="opacity: 0.2;">STEP1. ���� �Է� &rsaquo; </span>STEP2. ��������
				����<span style="opacity: 0.2;"> &rsaquo; STEP3. ���� Ȯ��</span>
			</div>
			<div class="col-md-12 visible-xs"
				style="margin-bottom: 15px; font-size: 12pt;"><%=dto.getTitle()%></div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-5 hidden-xs">
				<img src="/KnowHowFactory/upload/<%=dto.getImage()%>"
					class="img-responsive img-rounded"
					style="margin: auto; border: 1px solid #dfe1e0;" />
				<table class="table wTable wisdome-info">
					<tr>
						<th>����</th>
						<td><%=dto.getTitle()%></td>
					</tr>
					<tr>
						<th>��¥</th>
						<td><%=dto.getReporting_date()%> &nbsp;<i
							class="fa fa-arrow-right"></i>&nbsp;<strong
							style="color: #F1645D;"> </strong></td>
					</tr>
					<tr>
						<th>�ð�</th>
						<td><%=dto.getStarttime()%> ~ <%=dto.getEndtime()%></td>
					</tr>
					<tr>
						<th>���</th>
						<td><%=dto.getPlace_name()%></td>
					</tr>
					<tr>
						<th>����</th>
						<td><%=dto.getPrice()%>�� / 1��</td>
					</tr>
				</table>
			</div>
			<div class="col-md-8 col-sm-7">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="pull-left">
							<b>�������� ����</b>
						</div>
						<div class="pull-right">
							<span class="label" style="border: 1px solid #ddd;">STEP1</span>
							<span class="label label-danger"
								style="color: #ddd; border: 1px solid #333;">STEP2</span> <span
								class="label" style="border: 1px solid #ddd;">STEP3</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<form action="control" method="post">
							<input type="hidden" id="cmd" name="cmd" value="join3"/>
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
									<table class="table wTable vTable domee-info"
										style="margin-left: 25px;">
										<tr>
											<th>���ݾ�</th>
											<td><%=dto.getPrice()%>��</td>
										</tr>
										<tr>
											<th>������</th>
											<td><input type="text" name="inputCash" id="inputCash"
												class="form-control inline" style="width: 100px;" value=""/>
												��&nbsp;&nbsp;
												<div class="visible-sm visible-xs" style="height: 5px;"></div>
												(���� ����Ʈ : <%=dto.getPoint()%>��)&nbsp;&nbsp; <input
												type="button" id="btnCashUseAll" name="btnCashUseAll"
												class="btn btn-default btn-xs" value="���� ���" /></td>
										</tr>
										<tr>
											<th>�������</th>
											<td>
												<div>
													<%
														if (dto.getPrice() == 0) {
													%>
													<label class="wsd-tab-nav" data-tab="inicis-bank">
														<input type="radio" name="paymentType" value="1"
														checked="checked" /> ����
													</label>
													<%
														} else {
													%>
													<label class="wsd-tab-nav" data-tab="inicis-bank">
														<input type="radio" name="paymentType" value="2"
														checked="checked" /> ������ü
													</label>
													<%
														}
													%>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="text-center" style="margin: 30px 0 15px;">
										<input type="button" value="����" class="btn btn-primary"
											data-toggle="modal" data-target="#theModal" /> <a
											href="javascript:history.back();" class="btn btn-default">�ڷ�</a>
										<div class="modal hide fade" id="theModal">
											<div class="modal-header">
												<a href="#" class="close" data-dismiss="modal">&times;</a>
											</div>
											<h4 class="modal-title" id="myModalLabel">���/ȯ�� ��å ����</h4>

											<div class="modal-body">
												<ol>
													<li style="padding: 5px 0;">���/ȯ���� <span
														style="color: #f00; font-weight: bold;">���� �Ϸ� �� ��
															12�ñ�����</span> �����մϴ�.
													</li>
													<li style="padding: 5px 0;">���� ���Ͽ� �����Ͻø� ��� �� ȯ����
														����������, ���� ��Ź�帳�ϴ�.</li>
													<li style="padding: 5px 0;">���� ���� ���� 8�ÿ� �����ڰ� ������ �ּ�
														�ο� �̴� �� ��ҵ� �� �ֽ��ϴ�.</li>
													<li style="padding: 5px 0;">�츮���� �̿��� ���·� ȯ�ҹ����� ���
														��ü������(500��)�� �߻��մϴ�.</li>
													<li style="padding: 5px 0;">���� ��ҷ� ���� ȯ���̳� ���������� ȯ����
														��ü�����ᰡ �߻����� �ʽ��ϴ�.</li>
												</ol>
											</div>
											<div class="modal-footer">
												<input type="hidden" value="<%=num%>" name="num" /> <input
													type="submit" value="�����մϴ�" class="btn btn-primary" />
												<button type="button" class="btn btn-default"
													data-dismiss="modal">�ݱ�</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js">
		
	</script> <!-- jquery�� �׻� ���� �־�� �� (���� �߿�) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>

						</body>
</html>
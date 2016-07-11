<%-- 
������ - ����������_��������
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - �����ʿ�
--%>

<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="dto.SpeakerDto"%>
<%@ page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script>
	$(document)
			.ready(
					function() {

						$("#req")
								.click(
										function() {

											var email = $("#email").val();
											var CheckEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

											if (!$("#password").val()) {
												alert("��й�ȣ�� �Է����ּ���.");
												return false;
											} else if (!$("#password2").val()) {
												alert("��й�ȣ Ȯ���� �Է����ּ���.");
												return false;
											} else if ($("#password").val() != $(
													"#password2").val()) {
												alert("��й�ȣ�� �������� �ʽ��ϴ�. �ٽ� �Է����ּ���.");

												return false;

											} else {
												if (!$("#phone").val()) {
													alert("��ȭ��ȣ�� �Է����ּ���.");
													return false;
												} else if ($("#phone").val().length != 13) {
													alert("��ȣ�� �ٽ� Ȯ�����ּ���.");
													return false;
												} else if (!$("#email").val()) {
													alert("�̸����� �Է����ּ���.");
													return false;
												} else if (CheckEmail
														.test(email) == false) {
													alert("�̸����� �ٽ� Ȯ�����ּ���.");
													return false;
												} else {
													$("#f").submit();
													$("#intro").focuse();
													alert("�����Ǿ����ϴ�.");
												}
											}
										});
					});

	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>

<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
</head>
<body>
	<%!int totalRecord = 0;
	int bmcount = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>

	<jsp:useBean id="dao" class="dao.UpdateDao" />
	<jsp:useBean id="dto" class="dto.SpeakerDto" />

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));
		dto = dao.SpeakerUpdateList(Integer.parseInt(mem_num));
	%>
	<!-- header -->
	<%@ include file="../../../include/header.jsp"%>
	<!-- main -->
	<div id="sidebar">
		<div class="span3">
			<div align="center">
				<img src="upload/${loginImage }"width="110" height="110">
				<h4>${loginName }</h4>
				<br />
				<br />
				<ul class="nav nav-list span2">
					<li><a href="front?cmd=speaker_open">Ȱ������</a></li>
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=speaker_update">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=speaker_leave">ȸ��Ż��</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>


	<div class="container" id="main2">
		<div class="span9">
			<ul class="nav nav-pills nav-stacked" style="width: 95px">
				<li class="active"><a href="#" id="btn">���� ����</a></li>
			</ul>


			<div class="span4.5">
				<form action="front" class="form-horizontal" method="post" id="f"
					enctype="multipart/form-data">
					<input type="hidden" name="cmd" value="speaker_update_proc" />
					<div class="control-group">
						<label class="control-label">���̵�</label>
						<div class="controls">
							<input type="text" name="id" value="<%=dto.getId()%>"
								readonly="readonly" />

						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">��й�ȣ</label>
						<div class="controls">
							<input type="password" value="" required="required" /> <input
								type="hidden" name="password" id="password"
								value="<%=dto.getPassword()%>" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password2">��й�ȣ Ȯ��</label>
						<div class="controls">
							<input type="password" name="password2" id="password2"
								placeholder="��й�ȣ Ȯ��" value="" required="required" />
						</div>
					</div>
					<hr />
					<div class="control-group">
						<label class="control-label">�̸�</label>
						<div class="controls">
							<input type="text" name="name" value="<%=dto.getName()%>"
								readonly="readonly" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">��ȭ��ȣ</label>
						<div class="controls">
							<input type="tel" name="phone" id="phone"
								value="<%=dto.getPhone()%>" required="required" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�̸���</label>
						<div class="controls">
							<input type="text" name="email" id="email"
								value="<%=dto.getEmail()%>" required="required" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�̹���</label>
						<div class="controls">
							<img src="upload/<%=dto.getImage()%>" width="110" height="110" /><br />
							<input type="file" name="image">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="row">
		<div id="check" align="center">
			<div class="modal hide fade" id="modify">
				<div class="modal-body">
					<br />
					<h4>
						<strong>�����Ǿ����ϴ�.</strong>
					</h4>
					<br />
				</div>
				<div class="modal-footer" style="text-align: center">
					<button class="btn btn-primary" data-dismiss="modal" id="upBtn">Ȯ��</button>
					<button class="btn btn-primary" data-dismiss="modal">���</button>
				</div>
			</div>

			<div class="btn-group">
				<button class="btn btn-primary" data-target="#modify"
					data-toggle="modal" id="req">�����Ϸ�</button>
			</div>
			<a href="/KnowHowFactory/main.jsp" class="btn">���</a>
		</div>
	</div>
	<br />
	<br />
	<br />
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
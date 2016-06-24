<%-- 
������ - ����������_��������
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - jquery_��й�ȣ Ȯ�κκ� ���ǹ� �����ʿ� !!
--%>

<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="dto.MemberDto"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<link rel=��stylesheet��
	href=��http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css��>
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="../bootstrap/js/holder.js"></script>
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
												} else if ($("#phone").val().length != 11) {
													alert("��ȭ��ȣ�� �ٽ� Ȯ�����ּ���.");
													return false;
												} else if (!$("#email").val()) {
													alert("�̸����� �Է����ּ���.");
													return false;
												} else if (CheckEmail
														.test(email) == false) {
													alert("�̸����� �ٽ� Ȯ�����ּ���.");
													return false;
												} else {
													alert("�����Ǿ����ϴ�.");
													$("#f").submit();

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
<link href="../../style.css" rel="stylesheet">
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

	<jsp:useBean id="dao_b" class="dao.BookmarkDao" />
	<jsp:useBean id="dao" class="dao.UpdateDao" />
	<jsp:useBean id="dto" class="dto.MemberDto"></jsp:useBean>

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));
		dto = dao.UpdateList(Integer.parseInt(mem_num));

		//���ã�� ����		
		Vector<Bookmark_Dto> list_b = dao_b.BookmarkList(Integer.parseInt(mem_num));
		bmcount = list_b.size();
	%>
	<!-- header -->
	<%@ include file="../../../include/header.jsp"%>
	<!-- main -->
	<div id="sidebar">
		<div class="span3">
			<div align="center">
				<img src="/upload/${loginImage }" width="110" height="110">
				<h4>${loginName }</h4>
				<form class="form-horizontal">
					<div class="control-group">
						<h5 style="margin-bottom: -50px;">
							������&nbsp;&nbsp;<input type="button"
								class="icon-envelope icon-white" onclick="fnMessage()" />&nbsp;&nbsp;
							���ã��&nbsp;<a href="front?cmd=bookmark"><%=bmcount%></a>
						</h5>
					</div>
					<br />
				</form>
				<ul class="nav nav-list span2">
					<li class="divider"></li>
					<li><a href="front?cmd=speech">Ȱ������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=cart">��ٱ���</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=bookmark">���ã��</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=point">����Ʈ����</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=payment">��������</a></li>
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=update">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">ȸ��Ż��</a></li>
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
					<input type="hidden" name="cmd" value="update_member" />
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
						<label class="control-label">�������</label>
						<div class="controls">
							<select name="birthdate" disabled="disabled">
								<option selected="selected"><%=dto.getBirthdate()%>
								</option>
							</select>
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
						<label class="control-label">�ʴ���ſ���</label>
						<div class="controls">
							<%
								if (dto.getInvite_agree().equals("Y") || dto.getInvite_agree().equals("on")) {
							%>
							<label style="float: left"> <input type="radio"
								name="invite_agree" checked="checked">����&nbsp;&nbsp;
							</label> <label style="float: left"> <input type="radio"
								name="invite_agree">�ź�<br />
							</label>
							<%
								} else {
							%>
							<label style="float: left"> <input type="radio"
								name="invite_agree">����&nbsp;&nbsp;
							</label> <label style="float: left"> <input type="radio"
								name="invite_agree" checked="checked">�ź�<br />
							</label>
							<%
								}
							%>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�̹���</label>
						<div class="controls">
							<img src="upload/<%=dto.getImage()%>" width="110" height="100" /><br /><br />
							<input type="file" name="image">
						</div>
					</div>
				</form>
				<br/><br/>
				<div align="center" style="margin-right: -40px">
					<p>
						<button class="btn btn-primary" id="req">�����Ϸ�</button>
						<a href="../../main.jsp" class="btn">���</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<br />
	<br />
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
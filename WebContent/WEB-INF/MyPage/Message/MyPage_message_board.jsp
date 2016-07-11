<%--
������ - ����������_������
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ���ã���� �������� ������ ������ ��� �����Կ� ����ȴ�.
 --%>


<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Message_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="/KnowHowFactory//KnowHowFactory/style_m.css" type="text/css"
	media="screen" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script>
	$(document).ready(
			function() {
				$("#all").click(
						function() {
							if ($("#all").is(":checked")) {
								$('input:checkbox[name=check]:not(checked)')
										.prop("checked", true);
							} else {
								$('input:checkbox[name=check]:checked').prop(
										"checked", false);

							}
						});
				$("#delBtn").click(function() {
					if ($('input:checked').length > 0) {
						$("#f").submit();
					} else {
						alert("������ �޽����� �������ּ���");
					}
				});
			});
</script>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
<style>
body{
	font-family:�������, NanumGothic, ng;
	margin-right: 0px
	}

.msg {
	margin-top: 35px;
}

.table {
	margin-top: 15px;
}

#msg_btn {
	margin-top: 10px;
}
</style>
</head>
<body>
	<%!int totalRecord = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>

	<jsp:useBean id="dao" class="dao.BookmarkDao" />

	<%
		Vector<Message_Dto> list = dao.MessageList();
		totalRecord = list.size();
	%>
	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_message_board" />

		<div class="msg">
			<div class="btn-group btn-group-justified">
				<a href="#" class="btn btn-sm btn-black active">������</a>
			</div>

			<table class="div-table table">
				<tbody>
					<tr class="active">
						<th><input type="checkbox" id="all"></th>
						<th>��ȣ</th>
						<th>������</th>
						<th>����</th>
						<th>������¥</th>
						<th>Ȯ�ο���</th>

					</tr>
					<tr>
						<%
							if (list.size() == 0) {
						%>
						<td colspan="9" class="text-muted text-center" height="150"><br />
							<br /> <br />
							<h5>�ڷᰡ �����ϴ�.</h5></td>
					</tr>
					<%
						} else {
							for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
								if (i == totalRecord)
									break;
								Message_Dto dto = list.get(i);
					%>
					<tr>
						<td><input type="checkbox" name="check"></td>
						<td id="msg_num"><%=dto.getMsg_num()%> <input type="hidden"
							name="msg_num" value="<%=dto.getMsg_num()%>" /></td>
						<td><%=dto.getName()%></td>
						<td id="title" style="text-align: center"><%=dto.getTitle()%>
						</td>
						<td><%=dto.getReporting_date()%></td>
						<td>
							<%
								String confirm = null;

										if (dto.getConfirmation().equals("n")) {
											confirm = "��Ȯ��";
										} else {
											confirm = "Ȯ��";
										}
							%> <%=confirm%></td>
					</tr>
					<%
						}
						}
					%>
					<tr>
						<td colspan="9" class="text-center"><br /> <br />���� �����ϼ��� <strong>30</strong>��
							�Դϴ�.</td>
					</tr>
				</tbody>
			</table>
			<div class="pagination">
				<ul>
					<%
						if (nowBlock > 0) {
					%>
					<li><a href="javascript:ch(0, 0)">���� <%=pagePerBlock%>��
					</a></li>

					<%
						}
					%>

					<%
						for (int i = 0; i < pagePerBlock; i++) {
							if ((nowBlock * pagePerBlock) + i == totalPage) {
								break;
							}
					%>

					<li><a href="javascript:ch(<%=i%>, 1)"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
					<%
						}
					%>
					<%
						if (totalBlock > nowBlock + 1) {
					%>
					<li><a href="javascript:ch(0, 2)">���� <%=pagePerBlock%>��
					</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<br />
			<p class="text-center" id="msg_btn">
				<button type="button" class="btn" id="delBtn">Ȯ��</button>
				<button type="button" onclick="window.close();" class="btn">�ݱ�</button>
			</p>
		</div>
	</form>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

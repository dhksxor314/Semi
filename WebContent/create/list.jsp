<%@page import="create.createDao"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html >
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	function create() {
		window.location.href = "control?cmd=basicinfo";
	}
</script>
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

<body>
	<%
		request.setCharacterEncoding("euc-kr");
		int loginMem_num = Integer.parseInt(String.valueOf(session.getAttribute("loginMem_num")));
		Vector<create.createDto> vector = new Vector<create.createDto>();
		Vector<create.createDto> vector1 = new Vector<create.createDto>();
		createDao dao = new createDao();
		vector = dao.getList(loginMem_num);
		vector1 = dao.endmetting(loginMem_num);
	%>
	<%@ include file="../include/header.jsp"%>

	<div class="hidden-sm hidden-xs" style="padding-bottom: 60px;">
		<div class="menu-header">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="pull-left">
							<h4>�����ϱ�</h4>
						</div>
						<div class="pull-right">
							<a href="#theModal" class="btn" data-toggle="modal">���ο� ����
								�����ϱ�</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="modal hide fade" id="theModal">
						<div class="modal-header">
							<a href="#" class="close" data-dismiss="modal">&times;</a>
						</div>
						<div class="modal-body">
							<ol style="margin-bottom: 5px;">
								<li>&nbsp;�Է����ֽ� ����ó�� ���� Ȯ�� �����ڵ鿡�� ���޵˴ϴ�.</li>
								<li>&nbsp;��� �÷��� ������� �� �������� 20%�Դϴ�.<small>(PG�� ����
										������ �� SNSȫ����, �ΰ��� ����)</small></li>
								<li>&nbsp;���� ���׿� �ش��� ���, ���� �뺸 ���� ����ε� ��ġ�� �� �ֽ��ϴ�.</li>
								<li style="list-style: none;">- ���۱ǿ� ������ �ִ� ����(�̹���, ��Ʈ ��)��
									����� ���</li>
								<li style="list-style: none;">- ��� �÷��� �ܿ��� ������ ������ �����ϴ� ���</li>
								<li style="list-style: none;">- Ÿ���� ����ϴ� ǥ�� �� ������ ������ ���</li>
							</ol>
							<span class="text"><a href="/about/policy" target="_blank"><strong>������
										���</strong></a>�� �������� �ʾ� �߻��ϴ� å���� ��� �����ڿ��� �ͼӵ˴ϴ�.</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger btn-block"
								onclick="create()">���� ��å�� �����ϰ� �����ϱ�</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="tabbable tab-below">
				<!-- tabbable��  �� ����� �������� �ѹ��� �����ִ� ����, tab-below�� �� �Ʒ� ������ �����Բ� -->
				<ul class="nav nav-tabs">
					<!-- �� �޴��� Ž���� �� �ְ� ������� -->
					<li class="active"><a href="#tab1" data-toggle="tab">�ۼ���
							����</a></li>
					<!-- data-toggle�� ���� ������ �� ������ �� �ְ� ���� -->
					<li><a href="#tab2" data-toggle="tab">����� ����</a></li>
					<!-- active�� �̸� ���õǾ� �ֵ��� Ȱ��ȭ ���ѳ��� -->
				</ul>
				<div class="tab-content">
					<!-- �ǿ� �ش��ϴ� ������ ���� �κ� / �� ���� �ĺ��� ���̵� ���� -->
					<div class="tab-pane active" id="tab1">
						<table align="center" width="80%" border="0" cellspacing="0"
							cellpadding="3">
							<tr>
								<td align=center colspan=2>
								<%
											if (vector.size() > 0) {
												%>
									<table border="0" width="100%" cellpadding="2" cellspacing="0">
									
										<tr align=center bgcolor=#D0D0D0 height=120%>
											<td>��ȣ</td>
											<td>����</td>
											<td>���</td>
											<td>�����ο�</td>
											<td>���ο���</td>
										</tr>
										<%
										for (int i = 0; i < vector.size(); i++) {
										%>
										<tr>
											<td><%=i + 1%></td>
											<td><a
												href="control?cmd=info&num=<%=vector.get(i).getNum()%>"><%=vector.get(i).getTitle()%></a></td>
											<td><%=vector.get(i).getPlace_name()%></td>
											<td><%=vector.get(i).getNow_person()%></td>
											<td><%=vector.get(i).getApproval()%></td>
										</tr>
										<%
											}
										%>
									</table> <%
 									} else {
 									%> �� �׷쿡�� �ۼ����� ������ �����ϴ� <%
 									}
 									%>
								</td>
							</tr>
						</table>
					</div>
					<div class="tab-pane" id="tab2">
						<table align="center" width="80%" border="0" cellspacing="0"
							cellpadding="3">
							<tr>
								<td align=center colspan=2>
									<%
										if (vector1.size() > 0) {
									%>
									<table border="0" width="100%" cellpadding="2" cellspacing="0">
										<tr align=center bgcolor=#D0D0D0 height=120%>
											<td>��ȣ</td>
											<td>����</td>
											<td>���</td>
											<td>�����ο�</td>
											<td>���ο���</td>
										</tr>
										<%
											for (int i = 0; i < vector1.size(); i++) {
										%>
										<tr>
											<td><%=i + 1%></td>
											<td><a
												href="control?cmd=info&num=<%=vector1.get(i).getNum()%>"><%=vector1.get(i).getTitle()%></a></td>
											<td><%=vector1.get(i).getPlace_name()%></td>
											<td><%=vector1.get(i).getNow_person()%></td>
											<td><%=vector1.get(i).getApproval()%></td>
										</tr>
										<%
											}
										%>
									</table>
								</td>
							</tr>
						</table>
						<%
							} else {
						%>
						�� �׷쿡�� ����� ������ �����ϴ�
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery�� �׻� ���� �־�� �� (���� �߿�) -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
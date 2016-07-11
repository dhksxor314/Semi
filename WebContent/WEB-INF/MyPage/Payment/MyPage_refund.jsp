<%--
������ - ����������_������
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ���ã���� �������� ������ ������ ��� �����Կ� ����ȴ�.
 --%>

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Payment_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="/KnowHowFactory/style_m.css"
	type="text/css" media="screen" />
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>	
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script>
	$(document).ready(function() {
		$("#req").click(function() {
			if (!$("#bank").val()) {
				alert("������ �Է����ּ���.");
				return false;
			} else if (!$("#account").val()) {
				alert("���¹�ȣ�� �Է����ּ���.");
				return false;
			} else {
				alert("ȯ��ó���� �Ϸ�Ǿ����ϴ�.");
				$("#f").submit();
				window.close();
			}
		});
	});
</script>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
<style>
body {
	font-family: �������, NanumGothic, ng;
	margin-right: 0px
}

h5 {
	text-align: center;
	text-indent: 10px;
}

#btn {
	margin-top: 10px;
}

#color {
	background-color: #BBDDFA;
}
</style>
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

	<jsp:useBean id="dao" class="dao.PaymentDao" />

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		Vector<Payment_Dto> list = dao.Refund();
		totalRecord = list.size();

		totalPage = ((int) Math.ceil((double) totalRecord / numPerPage));
		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));
		beginPerPage = nowPage * numPerPage;
	%>
	
	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_payment" /> <br />
		<div>
			<div class="btn-group btn-group-justified">
				<a href="#" class="btn btn-sm btn-black active"><strong>����</strong></a>
			</div>
			<h5> ȯ�ҹ��� ����� ���¹�ȣ�� �Է����ּ���.</h5>
		</div>
		<div class="row">
			<hr style="border: 1px solid #6DB6D4;" />
			<div class="span12" style="text-align: center">
				<table class="table">
					<%
						if (list.size() > 0) {
							for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
								if (i == totalRecord)
									break;
								Payment_Dto dto = list.get(i);
					%>
					<tr>
						<td id="color"><strong>���Ӹ�</strong></td>
						<td><strong><%=dto.getTitle()%></strong></td>
					</tr>
					<tr>
						<td id="color"><strong>�ݾ�</strong></td>
						<td><strong><%=dto.getPrice()%></strong></td>
					</tr>

					<tr>
						<td id="color"><strong>����</strong></td>
						<td><input type="text" id="bank"
							placeholder="2���� �Է�      ex)����" /></td>
					</tr>
					<tr>
						<td id="color"><strong>���¹�ȣ</strong></td>
						<td><input type="text" id="account"
							placeholder="���� �Է�      ex) 111-111-111111" /></td>
					</tr>
					<%
					break;
						}
						}
					%>
				</table>
				<hr style="border: 1px solid #6DB6D4;" />
				<h5>
					ȯ���� ���� ������ ó���Ǿ� �Ա޵˴ϴ�.<br /> ���� ���û��׿� ���ؼ��� �����Ϳ� ���Ǻ�Ź�帳�ϴ�.
				</h5>
			</div>
		</div>
		<br />
	</form>
	<p class="text-center" id="btn">
		<button type="button" class="btn btn-primary" id="req">Ȯ��</button>
		<button type="button" onclick="window.close();" class="btn">�ݱ�</button>
	</p>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

<%@page import="join.listDto"%>
<%@page import="join.listDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<script>
	$(document).ready(function() {
		$("#ok").click(function() {
			opener.document.ini.submit();
			window.close();
		});
		$("#close").click(function() {
			window.close();
		});
		
	});
</script>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		int num = (Integer)request.getAttribute("num");
		int price = (Integer)request.getAttribute("price");
		int cash = (Integer)request.getAttribute("cash");
		listDao dao = new listDao();
		listDto dto = dao.getinfo(num);
	%>
	<h3>�ǽð�������ü</h3>
	<div class="container">
		<div class="row">
			<div class="span12"
				style="border: 5px solid #eee; background-color: #eee;">
				<table class="table">
					<tr>
						<td>���Ӹ�</td>
						<td><%=dto.getTitle()%></td>
					</tr>
					<tr>
						<td>�����ݾ�</td>
						<td><%=dto.getPrice()%>��</td>
					</tr>
				</table>
			</div>
			<hr style="border: 1px solid red;">
			<div class="span12">
				<table class="table">
					<tr>
						<td>�Աݱݾ�</td>
						<td><%=price-cash%>��</td>
					</tr>
					<tr>
						<td></td>
						<td><strong>���� ���ɽð� :</strong> 00:00~24:00</td>
					</tr>
					<tr>
						<td>���¹�ȣ</td>
						<td>111-1111-11111</td>
					</tr>
					<tr>
						<td>�����ָ�</td>
						<td>kh��������</td>
					</tr>
				</table>
			</div>
			<hr style="border: 1px solid red;">
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="span12">
				<table class="table">
					<tr>
						<td>���� �ݾ�</td>
						<td><input type="text" name="inputmoney" id="inputmoney" readonly="readonly" value="<%=price-cash%>"/></td>
					</tr>
				</table>
			</div>
			<hr style="border: 1px solid red;">
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="span12" style="text-align:center;">
				<input type="button" id="ok" name="ok" value="Ȯ��" /> <input
					type="button" id="close" name="close" value="���" />
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>

	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery�� �׻� ���� �־�� �� (���� �߿�) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
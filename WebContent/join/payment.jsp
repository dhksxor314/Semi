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
	<h3>실시간계좌이체</h3>
	<div class="container">
		<div class="row">
			<div class="span12"
				style="border: 5px solid #eee; background-color: #eee;">
				<table class="table">
					<tr>
						<td>모임명</td>
						<td><%=dto.getTitle()%></td>
					</tr>
					<tr>
						<td>결제금액</td>
						<td><%=dto.getPrice()%>원</td>
					</tr>
				</table>
			</div>
			<hr style="border: 1px solid red;">
			<div class="span12">
				<table class="table">
					<tr>
						<td>입금금액</td>
						<td><%=price-cash%>원</td>
					</tr>
					<tr>
						<td></td>
						<td><strong>서비스 가능시간 :</strong> 00:00~24:00</td>
					</tr>
					<tr>
						<td>계좌번호</td>
						<td>111-1111-11111</td>
					</tr>
					<tr>
						<td>예금주명</td>
						<td>kh교육센터</td>
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
						<td>투입 금액</td>
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
				<input type="button" id="ok" name="ok" value="확인" /> <input
					type="button" id="close" name="close" value="취소" />
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>

	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
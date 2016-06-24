<%@ page contentType="text/html; charset=EUC-KR"  %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
</head>
<body>
	<%@ include file="navbar.jsp" %>

	<br />
	<br />

	<div class="row">
		<%@ include file="inline.jsp" %>
		<div class="span10">
			<table class="table table-bordered" style="width:700px">
				<thead>
					<tr>
						<td
							style="background-color: silver; color: black; font-weight: bold;">제목
							</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>만남의 이름</td>
					</tr>
					<tr>
						<td style="height:400px">만납의 후기를 적는곳</td>
					</tr>
				</tbody>
			</table>
			
			<button type="submit" class="btn">등록</button>&nbsp;&nbsp;<button type="reset" class="btn" onclick="history.back()">취소</button>
			
		</div>
	</div>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
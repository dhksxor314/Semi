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
		<div class="span12">
			<table style="width:100%" >
				<tr>
					<td><input style="width:50%" type="text" name="title" placeholder="������ �Է����ּ���" required="required"/></td>
				</tr>
				<tr>
					<td>
						<select style="width:50%">
							<option>�����̳��� ���� �����ߴ� ����</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><textarea style="width:50%" rows="20" placeholder="������ �Է����ּ���" required="required"></textarea></td>
				</tr>
			</table>
			
			<button type="submit" class="btn">���</button>&nbsp;&nbsp;<button type="reset" class="btn" onclick="history.back()">���</button>
			
		</div>
	</div>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
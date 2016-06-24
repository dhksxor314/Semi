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
					<td><input style="width:50%" type="text" name="title" placeholder="제목을 입력해주세요" required="required"/></td>
				</tr>
				<tr>
					<td>
						<select style="width:50%">
							<option>몇일이내에 내가 참가했던 모임</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><textarea style="width:50%" rows="20" placeholder="내용을 입력해주세요" required="required"></textarea></td>
				</tr>
			</table>
			
			<button type="submit" class="btn">등록</button>&nbsp;&nbsp;<button type="reset" class="btn" onclick="history.back()">취소</button>
			
		</div>
	</div>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
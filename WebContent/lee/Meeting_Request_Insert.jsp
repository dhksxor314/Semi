<%@ page contentType="text/html; charset=EUC-KR"  %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
</head>
<body>
	<%@ include file="navbar.jsp" %>

	<br />
	<br />

	<div class="row">
		<%@ include file="inline.jsp" %>
		<div class="span12">
			<b style="font-size:20px">만남요청</b><br/><br/>
			<table style="width:500px" >
				<tr>
					<td><input style="width:90%" type="text" name="title" placeholder="제목을 입력해주세요" required="required"/></td>
				</tr>
				<tr>
					<td><textarea style="width:90%" rows="20" placeholder="내용을 입력해주세요" required="required"></textarea></td>
				</tr>
			</table>
			
			<button type="submit" class="btn">등록</button>&nbsp;&nbsp;<button type="reset" class="btn" onclick="history.back()">취소</button>
			
		</div>
	</div>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
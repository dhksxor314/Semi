<%@ page contentType="text/html; charset=EUC-KR"%>
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
		<div class="span8">
			<table
				class="table table-bordered table-hover table-striped table-condensed">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>이름</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="Meeting_Postscript_Read.jsp">2</a></td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
					</tr>
				</tbody>
			</table>
			<button class="btn pull-right" onclick="javascript:location.href='Meeting_Postscript_Insert.jsp'">글쓰기</button>
			
		</div>
	</div>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
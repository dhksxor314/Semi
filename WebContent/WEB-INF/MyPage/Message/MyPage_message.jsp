<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Message_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="../bootstrap/js/holder.js"></script>
<script>
	$(document).ready(function() {
		$("#Confirm").click(function() {
			$("#f").submit();
				window.open("../../main.jsp", "",
						"width=1955, height=1000, scrollbars=yes");	
				window.close();		
		});
	});
</script>
<!-- Custom CSS -->
<link href="../style.css" rel="stylesheet">
<style>
#msg_btn {
	margin-top: 60px;
	margin-bottom: -100px;
}
#text {
	text-align: center;
	font-weight: bold;
}
</style>
</head>
<body>
	<%!int totalRecord = 0;
	int numPerPage = 10;
	int beginPerPage = 0;%>

	<jsp:useBean id="dao" class="dao.BookmarkDao" />

	<%
		Vector<Message_Dto> list = dao.MessageList();
		totalRecord = list.size();
	%>

	<div class="btn-group btn-group-justified">
		<a href="#" class="btn btn-sm btn-black active">쪽지</a> <br /> <br />
		<br />
	</div>
	<%	
		if (list.size() == 0) {
	%>
	<%
		} else {
			for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
				if (i == totalRecord)
					break;

				Message_Dto dto = list.get(i);
	%>
	<form class="form-horizontal" action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="message" />
		<div class="control-group">
			<h5>
				<span class="pull-right">보낸 날짜&nbsp;&nbsp;<strong><%=dto.getReporting_date()%></strong></span>
			</h5>
		</div>

		<div class="well">
			<br /> <h4 id="text"><span>
					<%=dto.getName()%>의
					<%=dto.getTitle()%>
					강연이 개설되었습니다.
				<br /><br/></span></h4>
		</div>
	<%
			}
		}
		%>
		<div>    <!-- 확인 눌렸을 경우 그 강연페이지로 이동한다. -->
			<p class="text-center" id="msg_btn">
				<button type="button" class="btn" id="Confirm">확인</button>
				<button type="button" onclick="window.close();" class="btn">닫기</button>
			</p>
		</div>
	</form>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
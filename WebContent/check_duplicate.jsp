<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page contentType="text/html; charset=EUC-KR" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../../bootstrap/css/bootstrap-responsive.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
	$(document).ready(function(){
		$("#closeBtn").click(function(){
			window.close();
		});		
	});
</script>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();

	boolean check = dao.confirmId(id);
	
	if(check){ 
%>		
		<br/>
		<p style="font-weight: bold; margin-left:10%">사용가능한 아이디</p>
		<script>
			opener.document.f.duplicate.value=1;
		</script>
<% 	} else { %>

		<p style="font-weight: bold">중복된 아이디</p>
		<script>
			opener.document.f.duplicate.value=-1;
		</script>
<%	} %>
	<button class="btn" id="closeBtn" style="margin-left:30%">확인</button>
	<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

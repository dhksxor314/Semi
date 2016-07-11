<!-- 
	페이지 : 아이디 중복검사 페이지
	작성자 : 전현영
	설명 : 회원가입 페이지에서 입력한 아이디를 중복검사할 때 사용한다.
		  해당 아이디가 사용가능한지 불가능한지 메시지를 출력한다.
 -->


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
	//입력된 아이디가 사용가능 한지 true or false로 받는다. true가 사용가능
	boolean check = dao.confirmId(id);
	//opener를 사용하여 회원가입 페이지의 duplicate 값을 설정 1이면 중복검사가 완료된것
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

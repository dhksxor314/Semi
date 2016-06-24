<!-- 
페이지 : 강연자 승인 결정 페이지
작성자 : 전현영
설명 : 관리자가 선택한 강연자 신청자에 대한 정보를 보고 승인 및 거부를 하는 페이지
 		
 -->


<%@page import="dto.SpeakerDto"%>
<%@page import="dao.SpeakerDao"%>
<%@page import="dto.MeetingDto"%>
<%@page import="dao.MeetingDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
.container{
	margin-top:100px;
}
</style>
<script>
	$(document).ready(function(){
		//승인
		$("#grantBtn").click(function(){
			$("#grantForm").submit();
		});
		//거부
		$("#rejectBtn").click(function(){
			$("#rejectForm").submit();
		})
	});
</script>
</head>

<body>
<%
	SpeakerDao dao = new SpeakerDao();

	int speaker_num = Integer.parseInt(request.getParameter("speaker_num"));
	SpeakerDto dto = dao.getSpeaker(speaker_num);
	ServletContext ctx = getServletContext();
	String path = ctx.getRealPath("upload");
	System.out.println(path);
%>
<%@ include file="common.jsp" %>
<div class="container">
	<div class="row">
		<div class="span12">
			<table border=1 style="width:90%">
				<tr>
					<td style="width:10%;text-align: center"><img src="/upload/<%=dto.getImage()%>"/></td>
				</tr>
				<tr>
					<td style="width:10%;text-align: center" >신청자</td><td style="text-align: center"><%=dto.getName() %></td><td style="width:10%;text-align: center">전화번호</td><td style="text-align: center"><%=dto.getPhone() %></td>
				</tr>
				<tr>
					<td style="width:10%;text-align: center">전문분야</td><td style="text-align: center"><%=dto.getField() %></td><td style="width:10%;text-align: center">이메일</td><td style="text-align: center"><%=dto.getEmail() %></td>
				</tr>
				
				<tr>
					<td colspan="6" style="width:10%;text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모임설명</td>
				</tr>
				<tr>
					<td colspan="6">
						<%=dto.getResume() %>
						asdfadsfasfasfasfafafasfaf<br>
						asdfadsfasfasfasfafafasfaf<br>
						asdfadsfasfasfasfafafasfaf<br>
						asdfadsfasfasfasfafafasfaf<br>
						asdfadsfasfasfasfafafasfaf<br>
						asdfadsfasfasfasfafafasfaf<br>
					</td>
				</tr>
			</table>
			<br/>
			<a href="#myModal" role="button" class="btn pull-right"
						data-toggle="modal"
						style="margin-right: 10%;">승인</a>
			<a href="#myModal1" role="button" class="btn pull-right"
						data-toggle="modal"
						>거부</a>
			
					<div id="myModal" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabel">승인</h3>
						</div>
						<div class="modal-body">
							<p>정말로 승인하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true"
								id="grantBtn">예</button>
							<button class="btn btn-primary" data-dismiss="modal">아니오</button>
						</div>
					</div>
			
			
					<div id="myModal1" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabel">거부</h3>
						</div>
						<div class="modal-body">
							<p>정말로 거부하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true"
								id="rejectBtn">예</button>
							<button class="btn btn-primary" data-dismiss="modal">아니오</button>
						</div>
					</div>

		</div>
	</div>
</div>
<form action="manage" method="post" id="grantForm">
	<input type="hidden" name="cmd" value="grant_meeting"/>
	<input type="hidden" name="num" value="<%=speaker_num %>"/>
</form>
<form action="manage" method="post" id="rejectForm">
	<input type="hidden" name="cmd" value="reject_meeting"/>
	<input type="hidden" name="num" value="<%=speaker_num %>"/>
</form>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
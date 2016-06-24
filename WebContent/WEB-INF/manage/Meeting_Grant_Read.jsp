<!-- 
페이지 : 모임 승인 결정페이지(일반회원 접근불가)
작성자 : 전현영
설명 : 관리자가 이 페이지에서 모임을 승인할 것인지 거부할 것인지 판단하고 승인
 		or 거부한다.
 		
 -->

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
	MeetingDao dao = new MeetingDao();

	int num = Integer.parseInt(request.getParameter("num"));
	MeetingDto dto = dao.getMeeting("m", num);
%>
<%@ include file="common.jsp" %>
<div class="container">
	<div class="row">
		<div class="span12">
			<table border=1 style="width:90%">
				<tr>
					<td style="width:10%;text-align: center" >신청자</td><td style="text-align: center"><%=dto.getName() %></td><td style="width:10%;text-align: center">장소</td><td style="text-align: center"><%=dto.getPlace_name() %></td>
				</tr>
				<tr>
					<td style="width:10%;text-align: center">직업</td><td style="text-align: center"><%=dto.getJob() %></td><td style="width:10%;text-align: center">등록일</td><td style="text-align: center"><%=dto.getReporting_date() %></td>
				</tr>
				<tr>
					<td style="width:10%;text-align: center">모임명</td><td colspan="5" style="text-align: left;">&nbsp;&nbsp;&nbsp;<%=dto.getTitle() %></td>
				</tr>
				<tr>
					<td colspan="6" style="width:10%;text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모임설명</td>
				</tr>
				<tr>
					<td colspan="6">
						<%=dto.getDescription() %>
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
	<input type="hidden" name="num" value="<%=num %>"/>
</form>
<form action="manage" method="post" id="rejectForm">
	<input type="hidden" name="cmd" value="reject_meeting"/>
	<input type="hidden" name="num" value="<%=num %>"/>
</form>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
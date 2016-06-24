<!-- 
������ : ������ ���� ���� ������
�ۼ��� : ������
���� : �����ڰ� ������ ������ ��û�ڿ� ���� ������ ���� ���� �� �źθ� �ϴ� ������
 		
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
		//����
		$("#grantBtn").click(function(){
			$("#grantForm").submit();
		});
		//�ź�
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
					<td style="width:10%;text-align: center" >��û��</td><td style="text-align: center"><%=dto.getName() %></td><td style="width:10%;text-align: center">��ȭ��ȣ</td><td style="text-align: center"><%=dto.getPhone() %></td>
				</tr>
				<tr>
					<td style="width:10%;text-align: center">�����о�</td><td style="text-align: center"><%=dto.getField() %></td><td style="width:10%;text-align: center">�̸���</td><td style="text-align: center"><%=dto.getEmail() %></td>
				</tr>
				
				<tr>
					<td colspan="6" style="width:10%;text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���Ӽ���</td>
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
						style="margin-right: 10%;">����</a>
			<a href="#myModal1" role="button" class="btn pull-right"
						data-toggle="modal"
						>�ź�</a>
			
					<div id="myModal" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">��</button>
							<h3 id="myModalLabel">����</h3>
						</div>
						<div class="modal-body">
							<p>������ �����Ͻðڽ��ϱ�?</p>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true"
								id="grantBtn">��</button>
							<button class="btn btn-primary" data-dismiss="modal">�ƴϿ�</button>
						</div>
					</div>
			
			
					<div id="myModal1" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">��</button>
							<h3 id="myModalLabel">�ź�</h3>
						</div>
						<div class="modal-body">
							<p>������ �ź��Ͻðڽ��ϱ�?</p>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true"
								id="rejectBtn">��</button>
							<button class="btn btn-primary" data-dismiss="modal">�ƴϿ�</button>
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
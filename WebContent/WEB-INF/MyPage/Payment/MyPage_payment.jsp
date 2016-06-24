<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="dto.Payment_Dto"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(function() {

		var option = $("#option");
		option.click(function() {
			for (var i = 0; option.length; i++) {
				if (option[i].val() == -1) {
					alert("�̹� ȯ��ó���� �Ϸ�Ǿ����ϴ�.");
					return false;
				} else {
					return true;
				}
			}
		});

		$("#delBtn").click(function() {
			$("#f").submit();
		});
	});

	function fnMessage() {
		window.open("front?action=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<!-- Custom CSS -->
<link href="../../../style.css" rel="stylesheet">
<style>
p {
	font-size: 16px;
	text-align: left;
	text-indent: 10px;
}
</style>
</head>
<body>
	<%!int totalRecord = 0;
	int bmcount = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>

	<jsp:useBean id="dao_b" class="dao.BookmarkDao" />
	<jsp:useBean id="dao" class="dao.PaymentDao" />

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		Vector<Payment_Dto> list = dao.PaymentList();
		totalRecord = list.size();

		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));	
		//���ã�� ����		
		Vector<Bookmark_Dto> list_b = dao_b.BookmarkList(Integer.parseInt(mem_num));
		bmcount = list_b.size();

		totalPage = ((int) Math.ceil((double) totalRecord / numPerPage));

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));

		beginPerPage = nowPage * numPerPage;
	%>
	<!-- header -->
	<%@ include file="../../../include/header.jsp"%>
	<!-- main -->
	<div id="sidebar">
		<div class="span3">
			<div align="center">
		<img src="/upload/${loginImage }" width="110" height="110">
				<h4>${loginName }</h4>
				<form class="form-horizontal">
					<div class="control-group">
						<h5 style="margin-bottom: -50px;">
							������&nbsp;&nbsp;<input type="button"
								class="icon-envelope icon-white" onclick="fnMessage()" />&nbsp;&nbsp;
							���ã��&nbsp;<a href="front?action=bookmark"><%=bmcount%></a>
						</h5>
					</div>
					<br />
				</form>
	<ul class="nav nav-list span2">
					<li class="divider"></li>
					<li><a href="front?cmd=speech">Ȱ������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=cart">��ٱ���</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=bookmark">���ã��</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=point">����Ʈ����</a></li>
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=payment">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=update">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">ȸ��Ż��</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_payment" />


		<div class="container" id="main1">
			<div class="span9">
				<ul class="nav nav-pills nav-stacked" id="menu">
					<li class="active"><a href="#" id="btn">��������</a></li>
				</ul>
			</div>

			<div class="span9" id="table">
				<table class="div-table table bsk-tbl bg-white">
					<thead>
						<tr class="bg-black">
							<th><strong>�����׸�</strong></th>
							<th><strong>�ݾ�</strong></th>
							<th><strong>�������</strong></th>
							<th><strong>����</strong></th>
							<th><strong>��¥</strong></th>
							<th><strong>���/ȯ��</strong></th>
						</tr>
					</thead>
					<tbody>
						<%
							if (list.size() == 0) {
						%>
						<tr>
							<td colspan="9" style="text-align: center"><h5>
									<br />������ ������ �����ϴ�.
								</h5></td>
						</tr>
						<%
							} else {
								for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
									if (i == totalRecord)
										break;
									Payment_Dto dto = list.get(i);
						%>
						<tr>
							<td><%=dto.getTitle()%></td>
							<td><%=dto.getPrice()%></td>
							<td>
								<%
									String option = null;
									out.print(dto.getPayment_option());
											if (dto.getPayment_option() == 1) {
												option = "�������Ա�";
											}else {
												option = "";
											}
								%> <%=option%></td>
							<td id="opt">
								<%
									String condition = null;
											if (dto.getPayment_option() == -1) {
												condition = "ȯ�� ó��";
											} else if (dto.getPrice() >= 0) {
												condition = "���� ����";
											}
								%> <%=condition%></td>
							<td><%=dto.getReporting_date()%></td>
							<td>
								<button class="btn btn-warning" data-target="#cencle<%=i%>"
									data-toggle="modal" name="part_num<%=i%>" id="part_num<%=i%>" value="<%=dto.getPart_num()%>">��û</button>
									
								<div class="modal hide fade" id="cencle<%=i%>">
									<div class="modal-header">
										<a href="#" class="close" data-dismiss="modal">&times;</a>
										<h4>
											<strong>
<%=dto.getTitle()%> 
�� ��� �� ȯ���Ͻðڽ��ϱ�?
											</strong>
										</h4>
									</div>
									<div class="modal-body">
										<p style="font-size: 16px">
										<p style="text-align: left">1. ��� �� ȯ���� ���� �� ���ӿ� ���ؼ� ���û��
											�����մϴ�.</p>
										<p style="text-align: left">
											2. ȯ��ó���� <font class="cencel"><strong>1��</strong></font> ���Ŀ�
											�̷�����ϴ�.
										</p>
									</div>
									<div class="modal-footer">
										<button class="btn btn-primary" data-dismiss="modal"
											id="delBtn">Ȯ��</button>
										<input type="hidden" name="option"
											value="<%=dto.getPayment_option()%>">
										<button class="btn" data-dismiss="modal">�ݱ�</button>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
					<%
						}
						}
					%>

				</table>
					<br/>					
					<div class="pagination" style="text-align: center">
							<ul>
								<% if(nowBlock > 0){ %>
									<li><a href="javascript:ch(0, 0)">���� <%=pagePerBlock%>��</a></li>
					
								<% } %>
								
								<%
									for(int i=0; i<pagePerBlock; i++){
										if((nowBlock*pagePerBlock)+i == totalPage){
											break;
										}
								%>
									
									<li><a href="javascript:ch(<%=i%>, 1)">
										<%=i+1+(nowBlock*pagePerBlock)%></a></li>
								<% 
									}
								%>
								<% if(totalBlock > nowBlock+1){ %>
									<li><a href="javascript:ch(0, 2)">���� <%=pagePerBlock%>��</a></li>
								<%} %>
							</ul>
						</div><br/><br/>		
				</div>	
			</div>		
	</form>
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

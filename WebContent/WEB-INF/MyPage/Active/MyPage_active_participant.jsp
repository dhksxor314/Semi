<%--
������ - ����������_�����ڳ���
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ������ ��� 
 --%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@ page import="dto.MemberDto"%>
<%@ page import="dto.Speech_Meeting_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<title>Know-�Ͽ� Factory_active</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="../bootstrap/js/holder.js"></script>
<script>
	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<!-- Custom CSS -->
<link href="../../../style.css" rel="stylesheet">
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
	<jsp:useBean id="dao" class="dao.ActiveDao" />

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));		
		Vector<Speech_Meeting_Dto> list_o = dao.OpenList(Integer.parseInt(mem_num));
			
		Vector<MemberDto> list = dao.ParticipantList(Integer.parseInt(mem_num));
		totalRecord = list.size();

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
			<img src="/upload/${loginImage }"width="110" height="110">
				<h4></h4>
				<form class="form-horizontal">
					<div class="control-group">
						<h5 style="margin-bottom: -50px;">
							������&nbsp;&nbsp;<input type="button"
								class="icon-envelope icon-white" onclick="fnMessage()" />&nbsp;&nbsp;
							���ã��&nbsp;<a href="front?cmd=bookmark"><%=bmcount%></a>
						</h5>
					</div>
					<br />
				</form>
				<ul class="nav nav-list span2">
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=speech">Ȱ������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=cart">��ٱ���</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=bookmark">���ã��</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=point">����Ʈ����</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=payment">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=update">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">ȸ��Ż��</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container" id="main1">
		<div class="span9">
			<ul class="nav nav-pills nav-stacked" id="menu">
				<li class="active"><a href="#" id="btn">Ȱ������</a></li>
			</ul>
		</div>

		<!-- ������ ��� -->
		<div class="span9">
			<table class="div-table table bsk-tbl bg-white">
				<caption style="text-align: left; margin-bottom: 15px">
				<%
					if (list.size() == 0) {				
				%>
				<strong>���� 0 ��</strong> / ����  <%=session.getAttribute("max") %> ��
				<%
					}else if (list.size() > 0) {
							for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
								if (i == 1)
									break;

								MemberDto dto = list.get(i);

								int max = dto.getMax_person();
					%>
					<strong>���� <%=totalRecord%> ��</strong> / ���� <%=max%> ��
				</caption>
				<%
					}
				}
				%>
				<thead>
					<tr class="bg-black">
						<th><strong>�̸�</strong></th>
						<th><strong>�̸���</strong></th>
						<th><strong>����ó</strong></th>
						<th><strong>���</strong></th>
					</tr>
				</thead>
				<%
					if (list.size() == 0) {
				%>
				<tr>
					<td colspan="9" style="text-align: center"><h5>
							<br /> <br />���� ������ �ο��� �����ϴ�.<br /> <br />
						</h5></td>
				</tr>
				<%
					} else {
						for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
							if (i == totalRecord)
								break;

							MemberDto dto = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=dto.getName()%></td>
						<td><%=dto.getEmail()%></td>
						<td><%=dto.getPhone()%></td>
						<td></td>
					</tr>
				</tbody>
				<%
					}
					}
				%>
			</table>
		</div>
	</div>

	<div class="check" align="center">
	<br/>
	<div class="pagination">
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
								<% } %>
							</ul>
						</div><br/><br/>
		<p>
			<button class="btn btn-primary" data-dismiss="modal">Ȯ��</button>
			<a href="../../main.jsp" class="btn">���</a>
		</p>
	</div>
<br/><br/><br/>
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
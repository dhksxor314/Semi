<%--
������ - ����������_Ȱ������_�Ϸ�� ����
�ۼ��� - ���ֿ�
������¥ - 2016/06/26
���� - 30�� ���Ŀ� �ڵ� ���� / 
 --%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="dto.Participation_Dto"%>
<%@page import="dto.Speech_Meeting_Dto"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<title>Know-�Ͽ� Factory_active</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script>
	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}

	$(document).ready(function() {
		$("#f").submit;
	});
</script>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
</head>
<body>
	<%!int totalRecord_s = 0;
	int totalRecord_m = 0;
	int totalRecord_o = 0;
	int totalRecord_c = 0;
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

		Vector<Participation_Dto> list_s = dao.SpeechList(Integer.parseInt(mem_num));
		Vector<Participation_Dto> list_m = dao.MeetingList(Integer.parseInt(mem_num));
		Vector<Speech_Meeting_Dto> list_o = dao.OpenList(Integer.parseInt(mem_num));
		Vector<Participation_Dto> list_c = dao.CompleteList(Integer.parseInt(mem_num));

		totalRecord_s = list_s.size();
		totalRecord_m = list_m.size();
		totalRecord_o = list_o.size();
		totalRecord_c = list_c.size();

		String count_s = Integer.toString(totalRecord_s);
		String count_m = Integer.toString(totalRecord_m);
		String count_o = Integer.toString(totalRecord_o);
		String count_c = Integer.toString(totalRecord_c);

		
		//���ã�� ����	
		Vector<Bookmark_Dto> list = dao_b.BookmarkList(Integer.parseInt(mem_num));
		bmcount = list.size();

		totalPage = ((int) Math.ceil((double) totalRecord_c / numPerPage));

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
				<img src="upload/${loginImage }"width="110" height="110">
				<h4>${loginName }</h4>
				<form class="form-horizontal" style="text-decoration: none">
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
					<li class="active"><a href="front?cmd=active">Ȱ������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=cart">��ٱ���</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=bookmark">���ã��</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=point">����Ʈ����</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=payment">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=update_check">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">ȸ��Ż��</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_complete" />

		<div class="container" id="main1">
			<div class="span9">
				<ul class="nav nav-pills nav-stacked" id="menu">
					<li class="active"><a href="#" id="btn">Ȱ������</a></li>
				</ul>
			</div>
			<div class="span9">
				<ul class="nav nav-tabs">
					<li><a href="front?cmd=speech">������ ����<span class="badge"><%=count_s%></span>
					</a></li>
					<li><a href="front?cmd=meeting">������ ����<span class="badge">
								<%=count_m%>
						</span>
					</a></li>
					<li><a href="front?cmd=open">������ ����<span class="badge">
								<%=count_o%>

						</span></a></li>
					<li class="active"><a href="front?cmd=complete">�Ϸ�� ����<span
							class="badge badge-info"><%=count_c%> </span></a></li>
				</ul>
			</div>

			<div class="span9">
				<div class="well">
					<table class="div-table table bsk-tbl bg-white">
						<thead>
							<tr class="bg-black">
								<th scope="col"><strong>�̹���</strong></th>
								<th scope="col"><strong>����</strong></th>
								<th scope="col"><strong>��¥</strong></th>
								<th scope="col"><strong>���</strong></th>
								<th scope="col"><strong>����</strong></th>
							</tr>
						</thead>
						<tbody>
							<%
								if (list_c.size() == 0) {
							%>
							<tr>
								<td colspan="9" style="text-align: center"><h5>
										<br />������ ����, ������ �����ϴ�.
									</h5></td>
							</tr>
							<%
								} else {
									for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
										if (i == totalRecord_c)
											break;

										Participation_Dto dto = list_c.get(i);
							%>
							<tr>
								<td class="text-center">
									<div class="item-img">
										<img src="upload/<%=dto.getImage()%>" width="110" height="110" alt="">
									</div> <input type="hidden" name="s_m" value="<%=dto.getS_m()%>" />
									<input type="hidden" name="num" value="<%=dto.getNum()%>" />
								</td>
								<td><b><%=dto.getTitle()%></b></td>
								<td><%=dto.getReporting_date()%></td>
								<td><%=dto.getPlace_name()%></td>
								<td><%=dto.getPrice()%></td>
							</tr>
						</tbody>
						<%
							}
							}
						%>
					</table>
				</div>
				<table class="div-table table bsk-tbl bg-white">
					<thead>
						<tr>
							<td colspan="9" class="text-center"><br />
								<h5>�Ϸ�� ����, ���� ����Ʈ�� 30�� ���� �����˴ϴ�.</h5></td>
						</tr>
					</thead>
				</table>
				<br />
				<div class="pagination" align="center">
					<ul>
						<%
							if (nowBlock > 0) {
						%>
						<li><a href="javascript:ch(0, 0)">���� <%=pagePerBlock%>��
						</a></li>

						<%
							}
						%>

						<%
							for (int i = 0; i < pagePerBlock; i++) {
								if ((nowBlock * pagePerBlock) + i == totalPage) {
									break;
								}
						%>

						<li><a href="javascript:ch(<%=i%>, 1)"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
						<%
							}
						%>
						<%
							if (totalBlock > nowBlock + 1) {
						%>
						<li><a href="javascript:ch(0, 2)">���� <%=pagePerBlock%>��
						</a></li>
						<%
							}
						%>
					</ul>
				</div>
				<br />
				<br />
			</div>
		</div>
	</form>
	<br />
	<br />
	<br />
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
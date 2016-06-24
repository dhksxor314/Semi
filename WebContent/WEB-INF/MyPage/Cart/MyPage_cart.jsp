<%--
������ - ����������_��ٱ��ϳ���
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ��ٱ��� ���/����/�ֹ� 
�ֹ� ��ư Ŭ���� ������������ �̵��ϵ��� �����ؾ��Ѵ�. 
 --%>
<%@page import="java.util.Vector"%>
<%@page import="dto.PutInDto"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="/../bootstrap/js/holder.js"></script>
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
			function() {
				
				$("#all").click(
						function() {
							if ($("#all").is(":checked")) {
								$('input:checkbox[name=check]:not(checked)')
										.prop("checked", true);
							} else {
								$('input:checkbox[name=check]:checked').prop(
										"checked", false);
							}
						});
				
				$("#del").click(function(){
					if ($("input:checked").length > 0) {
						return true;
					}else{
						alert("������ ������ �������ּ���.");
						return false;
					}
				})
				
				$("#req").click(function(){
						if ($("input:checked").length > 0) {
							return true;
						}else{
							alert("�ֹ��� ������ �������ּ���.");
							return false;
						}
					});
				
				
				$("#delBtn").click(function() {
					$("#f").submit();
				});
			});

	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<!-- Custom CSS -->
<link href="../../style.css" rel="stylesheet">
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
	<jsp:useBean id="dao" class="dao.CartDao" />

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		Vector<PutInDto> list = dao.CartList();

		totalRecord = list.size();

		//���ã�� ����		
		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));	
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
							���ã��&nbsp;<a href="front?cmd=bookmark"><%=bmcount%></a>
						</h5>
					</div>
					<br />
				</form>
				<ul class="nav nav-list span2">
					<li class="divider"></li>
					<li><a href="front?cmd=speech">Ȱ������</a></li>
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=cart">��ٱ���</a></li>
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
	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_cart" />
		<input type="hidden" name="cmd" value="order_cart" />

		<div class="container" id="main1">
			<div class="span9">
				<ul class="nav nav-pills nav-stacked" id="menu">
					<li class="active"><a href="#" id="btn">��ٱ���</a></li>
				</ul>
			</div>

			<div class="span9">
				<table class="div-table table bsk-tbl bg-white" id="table">
					<thead>
						<tr class="bg-black">
							<!-- ��ü���� -->
							<th scope="col" align="center"><input type="checkbox"
								id="all" name="all"></th>
							<th scope="col"><strong>����</strong></th>
							<th scope="col"><strong>�̹���</strong></th>
							<th scope="col"><strong>����</strong></th>
							<th scope="col"><strong>����</strong></th>
							<th scope="col"><strong>����Ʈ</strong></th>
						</tr>
					</thead>
					<tbody>
						<%
							if (list.size() == 0) {
						%>
						<tr>
							<td colspan="9" style="text-align: center"><h5>
									<br /> <br />��ٱ��ϰ� ����ֽ��ϴ�.<br /> <br />
								</h5></td>
						</tr>
						<%
							} else {
								for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
									if (i == totalRecord)
										break;

									PutInDto dto = list.get(i);
						%>
						<tr>
							<td class="text-center"><input type="checkbox" name="check"
								value="<%=dto.getPutIn_num()%>"></td>
							<td>
								<%
									String meeting = null;
											if (dto.getS_m().equals("s")) {
												meeting = "����";
											} else {
												meeting = "����";
											}
								%> <%=meeting%></td>
							<td class="text-center">
								<div class="item-img">
									<img src="upload/<%=dto.getImage()%>" width="110" height="110" alt="">
								</div>
							</td>
							<td class="text-center"><a href="#"><b><%=dto.getTitle()%></b>
							</a></td>
							<td class="text-center"><%=dto.getPrice()%></td>
							<td class="text-center"><%int point = dto.getPrice()/100; %>
													<%=point%></td>
						</tr>
					</tbody>
					<%
						}
						}
					%>
				</table>
			</div>

			<div class="row">
				<div class="span9">
					<div class="well bg-white" align="center" id="total">
						<div class="col-xs-6 text-right">
							<strong>�� ����&nbsp;/����Ʈ&nbsp;&nbsp;&nbsp;&nbsp;</strong>
							<%
								if (list.size() == 0) {
							%>

							<%
								} else {
									int sum = 0;
									int point = 0;

									for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
										if (i == totalRecord)
											break;

										PutInDto dto = list.get(i);

										if (dto.getPrice() == 0) {
											sum += 0;
							%>
							<%
								} else {
											sum += dto.getPrice();
							%>
							<%
								}
							%>
							<%
								if (dto.getPrice()/100 == 0) {
											point += 0;
							%>

							<%
								} else {
											point += dto.getPrice()/100;
										}
							%>
							<%
								}
							%>
							<strong> <%=sum%>&nbsp;�� / <%=point%>&nbsp;��
							</strong>
							<%
								} 
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal hide fade inverse" id="delete">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" style="text-align: center">
						<br />
						<h4>
							<strong>�����Ͻðڽ��ϱ�?</strong>
						</h4>
						<br />
					</div>
					<div class="modal-footer" style="text-align: center">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							id="delBtn">Ȯ��</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
					</div>
				</div>
			</div>
		</div>
		<div id="order" align="center">
			<p>
			<div class="btn-group btn-group-justified">
				<div class="btn-group">
					<a href="#" class="btn btn-primary" id="req">�ֹ�</a>
				</div>
				<div class="btn-group">
					<button class="btn btn-default" data-target="#delete"
						data-toggle="modal" id="del" >����</button>
				</div>
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<a href="../../main.jsp" class="btn">�� ���</a>
					</div>
				</div>
			</div>			
		</div>
	</form>
<br/><br/><br/>
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
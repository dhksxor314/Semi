<%--
������ - ����������_ȸ��Ż�𳻿�
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� -  �α����� ȸ���� ������ �����Ѵ�.
 --%>

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(function() {
		$("#delLeave").click(function() {
			var check = $("input:checked");
			if (check.length == 3) {
				$("#f").submit();
			} else {
				alert("�׸��� üũ���ּ���.");
			}
		});		
	});
	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<style>
	#text{
		text-indent: 15px;
		color: block;
	}
</style>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
</head>
<body>
<%
int bmcount = 0;
%>

<jsp:useBean id="dao_b" class="dao.BookmarkDao" />
<%
	//���ã�� ����		
		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));	
		Vector<Bookmark_Dto> list_b = dao_b.BookmarkList(Integer.parseInt(mem_num));
		bmcount = list_b.size();

%>
	<!-- header -->
	<%@ include file="../../../include/header.jsp"%>

	<!-- main -->
	<div id="sidebar">
		<div class="span3">
			<div align="center">
			<img src="upload/${loginImage }" width="110" height="110">
				<h4>${loginName }</h4>
				<form class="form-horizontal">
					<div class="control-group">
						<h5 style="margin-bottom: -50px;">
							������&nbsp;&nbsp;<input type="button"
								class="icon-envelope icon-white" onclick="fnMessage()" />&nbsp;&nbsp;
							���ã��&nbsp;<a href="front?cmd=bookmark"><%=bmcount %></a>
						</h5>
					</div>
					<br/>
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
					<li><a href="front?cmd=payment">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=update_check">��������</a></li>
					<li class="divider"></li>
					<li  class="active"><a href="front?cmd=leave">ȸ��Ż��</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_leave" />
		<div class="container" id="main1">
			<div class="span9">
				<ul class="nav nav-pills nav-stacked" id="menu">
					<li class="active"><a href="#" id="btn">ȸ��Ż��</a></li>
				</ul>
			</div>
			<div class="span9">
				<h4 id="text">���Ͽ� Factory ���̵�� ���� �� ���� �Ұ� �ȳ�</h4>
				<br/>
				<div class="well well-large" >
					ȸ��Ż�� ����� ������ ������ Ÿ�� ��� ���̵� �����̳� ������ �Ұ����մϴ�. <input type="checkbox"
						class="pull-right" />
				</div>
				<br />
				<h4 id="text">������ �� ������ ���� �̿� ��� ����</h4>
				<br/>
				<div class="well well-large">
					�� ���� �� ������ ���� �̿����� ��� �����Ǹ�, ������ �����ʹ� �������� �ʽ��ϴ�. <input
						type="checkbox" class="pull-right" />
				</div>
				<br />
				<h4 id="text">����Ʈ�� ���� �Ҹ� �ȳ�</h4>
				<br/>
				<div class="well well-large">				
					Ż��� ������ ����Ʈ�� �ڵ������� �Ҹ�Ǹ�, �簡�Խ� �������� �ʽ��ϴ�. <input type="checkbox"
						class="pull-right" />
				</div>
				<br />
			</div>
		</div>
		<div class="modal hide fade inverse" id="leave">
			<div class="modal-body" style="text-align: center">
				<br />
				<p>
					<br />
				<h4>
					<strong>Ż�� �Ŀ��� ���̵�� �����ʹ� ������ �� �����ϴ�. </strong>
				</h4>
				<h4>
					<strong>�׷��� Ż���Ͻðڽ��ϱ�?</strong>
				</h4>
				<br />
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" data-dismiss="modal">Ȯ��</button>
				<button class="btn btn-default" data-dismiss="modal">���</button>
			</div>
		</div>

		<div id="complete" align="center">
		<br/><br/>
			<p>
				<a href="#" data-toggle="modal" class="btn btn-primary"
					id="delLeave">Ȯ��</a>
				<a href="/KnowHowFactory/main.jsp" class="btn">���</a>
			</p>
		</div>
	</form>
<br/><br/><br/>	
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
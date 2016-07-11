<%-- 
������ - ����������_��������
�ۼ��� - ���ֿ�
������¥ - 2016/07/02
���� - 
--%>

<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="dto.MemberDto"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script>
	$(document).ready(function() {
		$("#req").click(function() {
			if (!$("#password").val()) {
				alert("��й�ȣ�� �Է����ּ���.");
				return false;
			} else if ($("#password").val() != $("#loginPassword").val()) {
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			}else{
				document.location.href ="front?cmd=update";
			}
		});
	});
	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<style>
#pw_check {
	margin-left: 150px
}

#pw_check {
	margin-left: 100px
}

#pw {
	margin-right: 100px
}
</style>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
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
	<jsp:useBean id="dao" class="dao.UpdateDao" />
	<jsp:useBean id="dto" class="dto.MemberDto"></jsp:useBean>

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));
		String password = String.valueOf(session.getAttribute("loginPassword"));
		
		//���ã�� ����		
		Vector<Bookmark_Dto> list_b = dao_b.BookmarkList(Integer.parseInt(mem_num));
		bmcount = list_b.size();
	%>
	<!-- header -->
	<%@ include file="../../../include/header.jsp"%>
	<!-- main -->
	<div id="sidebar">
		<div class="span3">
			<div align="center">
				<img src="upload/${loginImage }" width="110"
					height="110">
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
					<li><a href="front?cmd=cart">��ٱ���</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=bookmark">���ã��</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=point">����Ʈ����</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=payment">��������</a></li>
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=update_check">��������</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">ȸ��Ż��</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

		<div class="container" id="main2">
			<div class="row">
				<div class="span4.5" id="pw_check">
					<div class="form-box">
						<div class="form-header">
							<ul class="nav nav-pills nav-stacked" style="width: 85px">
								<li class="active"><a href="#" id="btn">��������</a></li>
							</ul>
						</div>
						<div class="form-body">
							<h5>
								<strong>ȸ������ ������ �����ϱ� ���� ��й�ȣ�� �̸� Ȯ���մϴ�. </strong>
							</h5>
							<br />
							<div class="well" id="pw_check2">
								<b>���̵�&nbsp;:&nbsp;<%=session.getAttribute("loginId")%></b><br />
								<br /> <input type="password" name="password" id="password"
									required="required" value=""> <br /> <br />
									<input type="hidden" id="loginPassword" 
											value="<%=session.getAttribute("loginPassword") %>"/>
								<button type="submit" style="width: 220px"
									class="btn btn-primary" id="req">Ȯ���ϱ�</button>
								<br /> <br />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<br />
	<br />
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
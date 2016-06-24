<!-- 
������ : ��� ����Ʈ(�Ϲ�ȸ�� ���ٺҰ�)
�ۼ��� : ������
���� : ���� ��ϵǾ� �ִ� ��ҵ��� ����ϴ� ������

 -->
<%@page import="dao.PlaceDao"%>
<%@page import="dto.PlaceDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../../bootstrap/css/bootstrap-responsive.min.css">
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
.container {
	margin-top: 80px;
}

#title {
	text-align: left;
	font-size: 30px;
	font-family: fantasy;
}

body {
	margin-top: 50px
}

select {
	float: left;
	margin-top: 5px;
	margin-right: 10px;
	width: 120px;
}

#search-div {
	float: left;
}

#search-form {
	float: left;
}

#date-search {
	margin-top: 4px;
	float: right;
}

.pull-right {
	margin-right: 5px;
}
</style>
<script type="text/javascript">
	function Move_Insert() {
		location.href = "manage?cmd=Place_Insert";
	}

	function check() {
		if (document.search.keyWord.value == "") {
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
		}
		<% nowPage=0;nowBlock=0;%>
		document.search.submit();
	}

	function Chk_Del() {
		var e = $("input:checked");
		if (e.length == 0) {
			$("#delBtn").attr("href", "#myModal1");
			return;
		}
		$("#delBtn").attr("href", "#myModal");
		//document.del.submit();
	}

	$(document).ready(function() {
		$("#delBtn2").click(function() {
			$("#del").submit();
		});
	});
</script>
</head>
<body>
	<%!int totalRecord = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		PlaceDao dao = new PlaceDao();

		String keyField = (String) request.getAttribute("keyField");
		String keyWord = (String) request.getAttribute("keyWord");
		//String reload = request.getParameter("reload");

		if (keyField == null) {
			keyField = "place_name";
			keyWord = "";
		}

		/*
		if(reload != null){
			if(reload.equals("true")){
				keyWord = "";
			}
		}
		*/
		Vector<PlaceDto> list = dao.getPlaceList(keyField, keyWord);

		totalRecord = list.size();
		totalPage = ((int) Math.ceil((double) totalRecord / numPerPage));

		if (request.getAttribute("nowPage") != null)
			nowPage = (Integer) request.getAttribute("nowPage");

		if (request.getAttribute("nowBlock") != null)
			nowBlock = (Integer) request.getAttribute("nowBlock");

		totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));

		beginPerPage = nowPage * numPerPage;
	%>

	<%@ include file="common.jsp"%>
	<div class="container">
		<div class="row">
			<div class="span12">
				<span id="title">��� ����Ʈ</span><br /> <br /> <br />
				<div id="search-div">
					<form class="navbar-form pull-letf" id="search-form"
						action="manage" method="post" name="search">
						<input type="hidden" name="cmd" value="search" /> <input
							type="hidden" name="classify" value="place" /> <select
							name="keyField">
							<option value="place_name" <%if (keyField.equals("place_name")) {%>
								selected="selected" <%}%>>����̸�</option>
							<option value="address" <%if (keyField.equals("address")) {%>
								selected="selected" <%}%>>�ּ�</option>
						</select> <input type="text" size="16" name="keyWord" value="<%=keyWord%>">
						<input class="btn" type="button" value="�˻�" onClick="check()">
					</form>
				</div>
				<br/><br/><br/><br/><br/>
				<form action="manage" method="post" name="del" id="del">
					<input type="hidden" name="cmd" value="delete" /> <input
						type="hidden" name="classify" value="place" />
					<table
						class="table table-bordered table-hover table-striped table-condensed">
						<thead>
							<tr>
								<th>��ҹ�ȣ</th>
								<th>����̸�</th>
								<th>�ּ�</th>
								<th>�ִ�����ο�</th>
								<th>��ȭ��ȣ</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
							<%
								if (list.size() == 0) {
							%>
							<tr>
								<td colspan="6" align="center">������ ����</td>
							</tr>
							<%
								} else {
									for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
										if (i == totalRecord)
											break;

										PlaceDto dto = list.get(i);
							%>
							<tr>
								<td><%=dto.getPlace_num()%></td>
								<td><a
									href="manage?cmd=go_placeUpdate&place_num=<%=dto.getPlace_num()%>"><%=dto.getPlace_name()%></a></td>
								<td><%=dto.getAddress()%></td>
								<td><%=dto.getCapacity()%></td>
								<td><%=dto.getPhone()%></td>
								<td><input type="checkbox" name="check"
									value="<%=dto.getPlace_num()%>" /></td>
							</tr>
							<%
								}
								}
							%>

						</tbody>
					</table>
				</form>
				<div class="pagination">
					<ul>
						<%
							if (nowBlock > 0) {
						%>
						<li><a href="javascript:ch(0, 0)">���� </a></li>

						<%
							}
						%>

						<%
						for (int i = 0; i < pagePerBlock; i++) {
							if ((nowBlock * pagePerBlock) + i == totalPage) {
								break;
							}
							if (((nowPage - i) % pagePerBlock) == 0) {//���纸�� �ִ� �������� ���ڻ��� �ٲ۴�
						%>

						<li><a href="javascript:ch(<%=i%>, 1)" style="color: red">
								<%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
						<%
						} else {
						%>
						<li><a href="javascript:ch(<%=i%>, 1)"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
						<%
							}
						}
						%>
						<%
							if (totalBlock > nowBlock + 1) {
						%>
						<li><a href="javascript:ch(0, 2)">���� </a></li>
						<%
							}
						
						%>
					</ul>
				</div>


				<input class="btn pull-right" type="button" value="���"
					onclick="Move_Insert()" />&nbsp;&nbsp; <a href="#" role="button"
					class="btn pull-right" data-toggle="modal" onclick="Chk_Del()"
					id="delBtn">����</a>

				<div id="myModal" class="modal hide fade" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">��</button>
						<h3 id="myModalLabel">����</h3>
					</div>
					<div class="modal-body">
						<p>������ ������ ���ڵ带 �����Ͻðڽ��ϱ�?</p>
					</div>
					<div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true"
							id="delBtn2">��</button>
						<button class="btn btn-primary" data-dismiss="modal">�ƴϿ�</button>
					</div>
				</div>

				<div id="myModal1" class="modal hide fade" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">��</button>
						<h3 id="myModalLabel">���� ����</h3>
					</div>
					<div class="modal-body">
						<p>������ �����͸� �������� �����̽��ϴ�</p>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" data-dismiss="modal"
							aria-hidden="true">Ȯ��</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function ch(i, j) {
			if (j == 0) {
				document.hiddenF.nowPage.value =<%=(nowBlock - 1) * pagePerBlock + pagePerBlock - 1%>;
				document.hiddenF.nowBlock.value =<%=nowBlock - 1%>;
			} else if (j == 1) {
				document.hiddenF.nowPage.value =<%=(nowBlock * pagePerBlock)%>+ i;
				document.hiddenF.nowBlock.value =<%=nowBlock%>;
			} else if (j == 2) {
				document.hiddenF.nowPage.value =<%=(nowBlock + 1) * pagePerBlock%>;
				document.hiddenF.nowBlock.value =<%=nowBlock + 1%>;
			}
			document.hiddenF.keyWord.value = document.search.keyWord.value;
			document.hiddenF.keyField.value = document.search.keyField.value;
			document.hiddenF.submit();
		}
	</script>
	<form action="manage" method="post" name="hiddenF">
		<input type="hidden" name="cmd" value="paging" /> <input
			type="hidden" name="classify" value="place" /> <input type="hidden"
			name="nowPage" value="" /> <input type="hidden" name="nowBlock"
			value="" /> <input type="hidden" name="keyWord" value="" /> <input
			type="hidden" name="keyField" value="" />
	</form>
	<script src="../../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
<!-- 
������ : ȸ������Ʈ(�Ϲ�ȸ�� ���ٺҰ�)
�ۼ��� : ������
���� : ���� ��ϵǾ� �ִ� ��� ȸ������ ����Ʈ�� ������ �ִ� ������
 -->


<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>

<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="bootstrap/css/bootstrap-responsive.min.css">
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
body {
	margin-top: 50px
}
.container{
	margin-top:100px;
}
#title {
	text-align: left;
	margin-bottom: -90px;
	font-size: 30px;
	font-family: fantasy;
}
select {
	float:left;
	margin-top:5px;
	margin-right:10px;
	width:120px;
}
#search-div{
	float:left;
}
#search-form{
	float:left;
}
#date-search{
	margin-top:4px;
	float: right;
}
.pull-right{
	margin-right:5px;
}
</style>
<script>
	//�˻����� �ִ��� Ȯ���ϰ� ����
	function check(){
		if(document.search.keyWord.value == ""){
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
		}
		<% nowPage=0;nowBlock=0;%>
		document.search.submit();
	}
	//������ ���ڵ带 �����ߴ��� Ȯ���ϰ� ��Ȳ�� �´� ���â�� ����
	function Chk_Del(){
		var e = $("input:checked");
		if(e.length==0){
			$("#delBtn").attr("href","#myModal1");
			return;
		}
		$("#delBtn").attr("href","#myModal");
		//document.del.submit();
	}
	//����
	$(document).ready(function(){
		$("#delBtn2").click(function(){
			$("#del").submit();
		});
	});

</script>
</head>
<body>
<%! 
	int totalRecord = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;
%>

<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

	MemberDao dao = new MemberDao();

	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	if(keyField == null){
		keyField = "name";
		keyWord = "";
	}

	Vector<MemberDto> list = dao.getMemList(keyField, keyWord); 
	
	totalRecord = list.size();
	totalPage = ((int)Math.ceil((double)totalRecord/numPerPage));
	
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock") != null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	totalBlock = ((int)Math.ceil((double)totalPage/pagePerBlock));
	
	beginPerPage = nowPage * numPerPage;
%>
	<%@ include file="common.jsp" %>
	<div class="container">
		<div class="row">
			<div class="span12">
				<span id="title">ȸ�� ����Ʈ</span><br/><br/><br/>
				<div id="search-div">
				<form class="navbar-form pull-letf" id="search-form" name="search" action="manage" method="post">
					<input type="hidden" name="cmd" value="search"/>
					<input type="hidden" name="classify" value="member"/>
					<select name="keyField">
						<option value="name" <%if(keyField.equals("name")){%>selected="selected"<%}%>>�̸�</option>
						<option value="phone" <%if(keyField.equals("phone")){%>selected="selected"<%}%>>��ȭ��ȣ</option>
						<option value="email" <%if(keyField.equals("email")){%>selected="selected"<%}%>>�̸���</option>
					</select>
				
					<input type="text" name="keyWord" value="<%=keyWord %>"/> <input class="btn" type="button"
						value="�˻�" onclick="check()"/>
				</form>
				<br/><br/><br/>
				</div>
				<form action="manage" method="post" name="del" id="del">
				<input type="hidden" name="cmd" value="delete" />
				<input type="hidden" name="classify" value="member"/>
				<table
					class="table table-bordered table-hover table-striped table-condensed" style="margin-top:5%">
					<thead>
						<tr>
							<th>ȸ����ȣ</th>
							<th>���̵�</th>
							<th>�̸�</th>
							<th>��ȭ��ȣ</th>
							<th>�̸���</th>
							<th>����Ʈ</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<% if(list.size()==0){ %>
						<tr>
							<td colspan="7" align="center">������ ����</td>
						</tr>
					<% 	}
						else{
							for(int i=beginPerPage; i<beginPerPage + numPerPage; i++){
								if(i == totalRecord)
									break;
								
								MemberDto dto = list.get(i);
					%>
						<tr>
							<td><a href="javascript:window.open('move?cmd=Member_Activity&mem_num=<%=dto.getMem_num() %>', '', 'width=500, height=500, scrollbar=yes, resizable=no')"><%=dto.getMem_num() %></a></td>
							<td><%=dto.getId() %></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getPhone() %></td>
							<td><%=dto.getEmail() %></td>
							<td><a href="javascript:window.open('move?cmd=Member_Point&mem_num=<%=dto.getMem_num() %>', '', 'width=500, height=500, scrollbar=yes, resizable=no')"><%=dto.getPoint() %></a></td>
							<td><input type="checkbox" name="check" value="<%=dto.getMem_num()%>"/></td>
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
						<% if(nowBlock > 0){ %>
							<li><a href="javascript:ch(0, 0)">����</a></li>
			
						<% } %>
						
						<%
									for (int i = 0; i < pagePerBlock; i++) {
										if ((nowBlock * pagePerBlock) + i == totalPage) {
											break;
										}
										if(((nowPage-i)%pagePerBlock)==0){//���纸�� �ִ� �������� ���ڻ��� �ٲ۴�
								%>

								<li><a href="javascript:ch(<%=i%>, 1)" style="color:red"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
								<%		}
										else{
								%>
								<li><a href="javascript:ch(<%=i%>, 1)"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
								<%			
										}
									}
								%>
						<% if(totalBlock > nowBlock+1){ %>
							<li><a href="javascript:ch(0, 2)">����</a></li>
						<% } %>
					</ul>
				</div>

				<a href="#" role="button" class="btn pull-right" data-toggle="modal" onclick="Chk_Del()" id="delBtn">����</a>

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
						<button class="btn" data-dismiss="modal" aria-hidden="true" id="delBtn2">��</button>
						<button class="btn btn-primary" data-dismiss="modal">�ƴϿ�</button>
					</div>
				</div>
				
				<div id="myModal1" class="modal hide fade" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">��</button>
					</div>
					<div class="modal-body">
						<p>������ �����͸� �������� �����̽��ϴ�</p>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Ȯ��</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	//�˻��� ����¡�� ���� ������ �����ϱ� ���� �Լ�
	function ch(i, j) {
		if(j==0){
			document.hiddenF.nowPage.value =<%=(nowBlock-1)*pagePerBlock+pagePerBlock-1%>;
			document.hiddenF.nowBlock.value =<%=nowBlock - 1%>;
		}else if(j==1){
			document.hiddenF.nowPage.value =<%=(nowBlock * pagePerBlock)%>+ i;
			document.hiddenF.nowBlock.value =<%=nowBlock%>;
		}else if(j==2){
			document.hiddenF.nowPage.value =<%=(nowBlock + 1) * pagePerBlock%>;
			document.hiddenF.nowBlock.value =<%=nowBlock + 1%>;
		}
		document.hiddenF.keyWord.value = document.search.keyWord.value;
		document.hiddenF.keyField.value = document.search.keyField.value;
		document.hiddenF.submit();
	}
	</script>
	<form action="manage" method="post" name="hiddenF">
		<input type="hidden" name="cmd" value="paging"/>
		<input type="hidden" name="classify" value="member"/>
		<input type="hidden" name="nowPage" value=""/>
		<input type="hidden" name="nowBlock" value=""/>
		<input type="hidden" name="keyWord" value=""/>
		<input type="hidden" name="keyField" value=""/>
	</form>
	<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
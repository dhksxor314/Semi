<!-- 
������ : ������ ���� ��û ������
�ۼ��� : ������
���� : �����ڷ� ���� �ޱ⸦ ���ϴ� ��û�ڵ��� ��û�� ��� ��µǴ� ������ 		
 -->

<%@page import="dao.SpeakerDao"%>
<%@page import="dto.SpeakerDto"%>
<%@page import="dto.MeetingDto"%>
<%@page import="dao.MeetingDao"%>
<%@page import="java.util.Vector"%>

<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
.container{
	margin-top:100px;
}

#title {
		text-align: left;
		margin-bottom:-90px;
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
<%!int totalRecord = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>
</head>
<script>

	$(document).ready(function() {

		//����
		$("#delBtn2").click(function() {
			<% nowPage=0;nowBlock=0;%>
			$("#del1").submit();
		});

		//���� �˻�
		$("input[type=checkbox]").change(function(){
			if ($("input:checked").length == 0) {
				$("#delBtn").attr("href", "#myModal1");
			} else {
				$("#delBtn").attr("href", "#myModal");
			}
		});
		
		$("#progression").change(function(){
			<% nowPage=0;nowBlock=0;%>
			$("#search-form").submit();
		});
		
		$("#searchBtn1").click(function(){
			
			if($("#keyWord").val()=="" && $("#start").val()=="" && $("#end").val()==""){
				alert("�˻�� �Է��ϼ���");
				return;
			}
			if($("#keyWord").val()!="" && $("#start").val()=="" && $("#end").val()==""){
				<% nowPage=0;nowBlock=0;%>
				$("#search-form").submit();
				return;
			}
			if($("#keyWord").val()=="" && $("#start").val()!="" && $("#end").val()!=""){			
				if($("#start").val()>$("#end").val()){
					alert("���� ��¥�� ���� ��¥���� ���ų� ������ �ʽ��ϴ�.");
					return;
				}
				<% nowPage=0;nowBlock=0;%>
				$("#search-form").submit();	
				return;
			}
			if($("#keyWord").val()!="" && $("#start").val()!="" && $("#end").val()!=""){			
				if($("#start").val()>$("#end").val()){
					alert("���� ��¥�� ���� ��¥���� ���ų� ������ �ʽ��ϴ�.");
					return;
				}
				<% nowPage=0;nowBlock=0;%>
				$("#search-form").submit();	
				return;
			}
			if($("#keyWord").val()=="" && ($("#start").val()=="" || $("#end").val()=="")){
				alert("��¥�� ��Ȯ�� �Էµ��� �ʾҽ��ϴ�.");
				return;
			}			
			
		});
	});
</script>
<body>

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		SpeakerDao dao = new SpeakerDao();

		Vector<SpeakerDto> list = dao.getSpeakerGrantList();
		totalRecord = list.size();
		totalPage = ((int) Math.ceil((double) totalRecord / numPerPage));

		if (request.getAttribute("nowPage") != null)
			nowPage = (Integer) request.getAttribute("nowPage");

		if (request.getAttribute("nowBlock") != null)
			nowBlock = (Integer) request.getAttribute("nowBlock");

		totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));

		beginPerPage = nowPage * numPerPage;
	%>
	<%@ include file="common.jsp" %>
	<div class="container">
		<div class="row">
			<div class="span12">
				<span id="title">������ ����</span><br/><br/><br/>
				<div id="search-div" class="span11">
							
				</div>
	
				
				<table
					class="table table-bordered table-hover table-striped table-condensed">
					<thead>
						<tr>
							<th>��û��ȣ</th>
							<th>��û��</th>
							<th>�����о�</th>
							<th>�̸���</th>
						</tr>
					</thead>
					<tbody>
									<%
										if (list.size() == 0) {
									%>
									<tr>
										<td colspan="8" align="center">������ ����</td>
									</tr>
									<%
										} else {
											for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
												if (i == totalRecord)
													break;

												SpeakerDto dto = list.get(i);
									%>

									<tr>
										<td><a href="manage?cmd=Speaker_Grant_Read&speaker_num=<%=dto.getSpeaker_num()%>"><%=dto.getSpeaker_num()%></a></td>
										<td><%=dto.getName()%></td>
										<td><%=dto.getField()%></td>
										<td><%=dto.getEmail()%></td>
									</tr>
									<%
										}
										}
									%>
					</tbody>
				</table>
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
								<%
									if (totalBlock > nowBlock + 1) {
								%>
								<li><a href="javascript:ch(0, 2)">���� </a></li>
								<%
									}
								%>
							</ul>
						</div>
					<input class="btn pull-right" type="button" value="�������" onclick="javascript:location.href='manage?cmd=Speaker_List'"/>				
			</div>
		</div>
	</div>
	<script>
		function ch(i, j) {
			if (j == 0) {
				document.hiddenF.nowPage.value =
	<%=(nowBlock - 1) * pagePerBlock + pagePerBlock - 1%>
		;
				document.hiddenF.nowBlock.value =
	<%=nowBlock - 1%>
		;
			} else if (j == 1) {
				document.hiddenF.nowPage.value =
	<%=(nowBlock * pagePerBlock)%>
		+ i;
				document.hiddenF.nowBlock.value =
	<%=nowBlock%>
		;
			} else if (j == 2) {
				document.hiddenF.nowPage.value =
	<%=(nowBlock + 1) * pagePerBlock%>
		;
				document.hiddenF.nowBlock.value =
	<%=nowBlock + 1%>
		;
			}
			document.hiddenF.keyWord.value = document.search.keyWord.value;
			document.hiddenF.keyField.value = document.search.keyField.value;
			document.hiddenF.start.value = document.search.start.value;
			document.hiddenF.end.value = document.search.end.value;
			document.hiddenF.submit();
		}
	</script>
	<form action="manage" method="post" name="hiddenF">
		<input type="hidden" name="cmd" value="paging" /> <input
			type="hidden" name="classify" value="speaker_grant" /> <input
			type="hidden" name="nowPage" value="" /> <input type="hidden"
			name="nowBlock" value="" />
	</form>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
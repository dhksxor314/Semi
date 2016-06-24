
<!-- 
페이지 : 강연자 리스트
작성자 : 전현영
설명 : 승인된 강연자들이 모두 출력되는 페이지
 		
 -->

<%@page import="dao.SpeakerDao"%>
<%@page import="dto.SpeakerDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.MeetingDao"%>
<%@page import="dto.MeetingDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
.container {
	margin-top: 100px;
}

#title {
	margin-bottom: 30px;
	text-align: left;
	font-size: 30px;
	font-family: fantasy;
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

.pull-right {
	margin-right: 5px;
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
<script>
	$(document).ready(function() {

		//삭제
		$("#delBtn2").click(function() {
			<% nowPage=0;nowBlock=0;%>
			$("#del1").submit();
		});

		//삭제 검사
		$("input[type=checkbox]").change(function(){
			if ($("input:checked").length == 0) {
				$("#delBtn").attr("href", "#myModal1");
			} else {
				$("#delBtn").attr("href", "#myModal");
			}
		});

	});
</script>
</head>
<body>
	

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		SpeakerDao dao = new SpeakerDao();
		

		String keyField = (String) request.getAttribute("keyField");
		String keyWord = (String) request.getAttribute("keyWord");


		if (keyField == null) {
			keyField = "name";
			keyWord = "";
		}

		Vector<SpeakerDto> list = dao.getSpeakerList(keyField, keyWord);

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



						<span id="title">강연자 리스트</span><br /> <br /> <br />
						<div id="search-div" class="span11">
							<form class="navbar-form pull-letf" id="search-form" name="search"
								action="manage" method="post" style="width:100%">
								<input type="hidden" name="cmd" value="search" /> <input
									type="hidden" name="classify" value="speech" /> 
									<select	name="keyField">
									<option value="name" <%if (keyField.equals("name")) {%>
										selected="selected" <%}%>>이름</option>
									<option value="id"
										<%if (keyField.equals("id")) {%> selected="selected"
										<%}%>>ID</option>
									<option value="field"
										<%if (keyField.equals("field")) {%> selected="selected"
										<%}%>>전문분야</option>
								</select> <input type="text" name="keyWord" id="keyWord"
									value="<%=keyWord%>"/> <input
										class="btn" type="button" id="searchBtn1" value="검색">
							</form>
						</div>
						<br/><br/><br/><br/>

						<form action="manage" method="post" name="del" id="del1">
							<input type="hidden" name="cmd" value="delete" /> <input
								type="hidden" name="classify" value="speech" />
							<table
								class="table table-bordered table-hover table-striped table-condensed">
								<thead>
									<tr>
										<th>강연자번호</th>
										<th>이름</th>
										<th>아이디</th>
										<th>비밀번호</th>
										<th>전문분야</th>
										<th>이메일</th>
										<th>전화번호</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
										if (list.size() == 0) {
									%>
									<tr>
										<td colspan="8" align="center">데이터 없음</td>
									</tr>
									<%
										} else {
											for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
												if (i == totalRecord)
													break;

												SpeakerDto dto = list.get(i);
									%>

									<tr>
										<td><%=dto.getSpeaker_num()%></td>
										<td><%=dto.getName()%></td>
										<td><%=dto.getId()%></td>
										<td><%=dto.getPassword()%></td>
										<td><%=dto.getField()%></td>
										<td><%=dto.getEmail()%></td>
										<td><%=dto.getPhone()%></td>
										<td><input type="checkbox" name="check" id="check"
											value="<%=dto.getSpeaker_num()%>" /></td>
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
								<li><a href="javascript:ch(0, 0)">이전 </a></li>

								<%
									}
								%>

								<%
									for (int i = 0; i < pagePerBlock; i++) {
										if ((nowBlock * pagePerBlock) + i == totalPage) {
											break;
										}
										if(((nowPage-i)%pagePerBlock)==0){
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
								<li><a href="javascript:ch(0, 2)">다음 </a></li>
								<%
									}
								%>
							</ul>
						</div>
					</div>

					<div class="tab-pane" id="Speech"></div>

					<a href="#myModal1" role="button" class="btn pull-right"
						data-toggle="modal" id="delBtn"
						style="margin-right: 5px;">삭제</a>

					<div id="myModal" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabel">삭제</h3>
						</div>
						<div class="modal-body">
							<p>정말로 선택한 레코드를 삭제하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true"
								id="delBtn2">예</button>
							<button class="btn btn-primary" data-dismiss="modal">아니오</button>
						</div>
					</div>

					<div id="myModal1" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<p>삭제할 데이터를 선택하지 않으셨습니다</p>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" data-dismiss="modal"
								aria-hidden="true">확인</button>
						</div>
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
			document.hiddenF.progression.value = document.search.progression.value;
			document.hiddenF.submit();
		}
	</script>
	<form action="manage" method="post" name="hiddenF">
		<input type="hidden" name="cmd" value="paging" /> <input
			type="hidden" name="classify" value="speech" /> <input
			type="hidden" name="nowPage" value="" /> <input type="hidden"
			name="nowBlock" value="" /> <input type="hidden" name="keyWord"
			value="" /> <input type="hidden" name="keyField" value="" />
			<input type="hidden" name="start" value="" />
			<input type="hidden" name="end" value="" />
	</form>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
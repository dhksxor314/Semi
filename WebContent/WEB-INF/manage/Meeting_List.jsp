<!-- 
페이지 : 개설된 모임들의 리스트 페이지(일반회원 접근불가)
작성자 : 전현영
설명 : 승인된 상태의 모임들을 모두 출력하고있는 페이지
 -->

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
		
		$("#progression").change(function(){
			<% nowPage=0;nowBlock=0;%>
			$("#search-form").submit();
		});
		
		$("input[id^=searchBtn]").click(function(){
			
			if($("#keyWord").val()=="" && $("#start").val()=="" && $("#end").val()==""){
				alert("검색어를 입력하세요");
				return;
			}
			if($("#keyWord").val()!="" && $("#start").val()=="" && $("#end").val()==""){
				<% nowPage=0;nowBlock=0;%>
				$("#search-form").submit();
				return;
			}
			if($("#keyWord").val()=="" && $("#start").val()!="" && $("#end").val()!=""){			
				if($("#start").val()>$("#end").val()){
					alert("앞의 날짜가 뒤의 날짜보다 같거나 빠르지 않습니다.");
					return;
				}
				<% nowPage=0;nowBlock=0;%>
				$("#search-form").submit();	
				return;
			}
			if($("#keyWord").val()!="" && $("#start").val()!="" && $("#end").val()!=""){			
				if($("#start").val()>$("#end").val()){
					alert("앞의 날짜가 뒤의 날짜보다 같거나 빠르지 않습니다.");
					return;
				}
				<% nowPage=0;nowBlock=0;%>
				$("#search-form").submit();	
				return;
			}
			if($("#keyWord").val()=="" && ($("#start").val()=="" || $("#end").val()=="")){
				alert("날짜가 정확히 입력되지 않았습니다.");
				return;
			}			
			
		});
	});
</script>
</head>
<body>
	

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		MeetingDao dao = new MeetingDao();
		
		String progression = (String) request.getAttribute("progression");
		String keyField = (String) request.getAttribute("keyField");
		String keyWord = (String) request.getAttribute("keyWord");
		String start = (String) request.getAttribute("start");
		String end = (String) request.getAttribute("end");

		if(progression==null){
			progression="all";
		}
		
		if (keyField == null) {
			keyField = "m.name";
			keyWord = "";
		}
		if(start==null){
			start="";
			end="";
		}

		Vector<MeetingDto> list = dao.getMeetingList(keyField, keyWord, start, end, progression);

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
				<ul class="nav nav-tabs" id="myTab">
					<li class="active"><a href="#Meeting">모임</a></li>
					<li><a href="manage?cmd=Speech_List">강연</a></li>
				</ul>

				<div class="tab-content">

					<div class="tab-pane active" id="Meeting">
						<span id="title">모임 리스트</span><br /> <br /> <br />
						<div id="search-div" class="span11">
							<form class="navbar-form pull-letf" id="search-form" name="search"
								action="manage" method="post" style="width:100%">
								<select name="progression" id="progression">
									<option value="all" <%if (progression.equals("all")) {%> selected="selected"<%}%>>전체</option>
									<option value="y" <%if (progression.equals("y")) {%> selected="selected"<%}%>>진행중</option>
									<option value="n" <%if (progression.equals("n")) {%> selected="selected"<%}%>>종료</option>
								</select>
								<input type="hidden" name="cmd" value="search" /> <input
									type="hidden" name="classify" value="meeting" /> 
									<select	name="keyField">
									<option value="m.name" <%if (keyField.equals("m.name")) {%>
										selected="selected" <%}%>>주최자</option>
									<option value="p.place_name"
										<%if (keyField.equals("p.place_name")) {%> selected="selected"
										<%}%>>장소</option>
									<option value="sm.title"
										<%if (keyField.equals("sm.title")) {%> selected="selected"
										<%}%>>모임명</option>
								</select> <input type="text" name="keyWord" id="keyWord"
									value="<%=keyWord%>"/> <input
										class="btn" type="button" id="searchBtn1" value="검색">
								<div class="navbar-form pull-right">
									<input type="date" name="start" id="start" value="<%=start%>"/>&nbsp;-
									<input type="date" name="end" id="end" value="<%=end%>"/> <input
										class="btn" type="button" id="searchBtn2" value="검색">
								</div>
							</form>
						</div>
						<br/><br/><br/><br/>

						<form action="manage" method="post" name="del" id="del1">
							<input type="hidden" name="cmd" value="delete" /> <input
								type="hidden" name="classify" value="meeting" />
							<table
								class="table table-bordered table-hover table-striped table-condensed">
								<thead>
									<tr>
										<th>모임번호</th>
										<th>주최자</th>
										<th>모임명</th>
										<th>장소</th>
										<th>만남일</th>
										<th>참가인원</th>
										<th>진행상황</th>
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

												MeetingDto dto = list.get(i);
									%>

									<tr>
										<td><%=dto.getNum()%></td>
										<td><%=dto.getName()%></td>
										<td><%=dto.getTitle() %></td>
										<td><%=dto.getPlace_name()%></td>
										<td><%=dto.getReporting_date() + " " + dto.getStarttime()%></td>
										<td><%=dto.getNow_person() + "/" + dto.getMax_person()%></td>
										<td><%=dto.getProgression()%></td>
										<td><input type="checkbox" name="check" id="check"
											value="<%=dto.getNum()%>" /></td>
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
										if(((nowPage-i)%pagePerBlock)==0){//현재보고 있는 페이지의 글자색을 바꾼다
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
			type="hidden" name="classify" value="meeting" /> <input
			type="hidden" name="nowPage" value="" /> <input type="hidden"
			name="nowBlock" value="" /> <input type="hidden" name="keyWord"
			value="" /> <input type="hidden" name="keyField" value="" />
			<input type="hidden" name="start" value="" />
			<input type="hidden" name="end" value="" />
			<input type="hidden" name="progression" value=""/>
	</form>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
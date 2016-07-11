<%--
페이지 - 마이페이지_쪽지함
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 즐겨찾기한 강연자의 강연이 개설된 경우 쪽지함에 저장된다.
 --%>


<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Message_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="/KnowHowFactory//KnowHowFactory/style_m.css" type="text/css"
	media="screen" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
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
				$("#delBtn").click(function() {
					if ($('input:checked').length > 0) {
						$("#f").submit();
					} else {
						alert("삭제할 메시지를 선택해주세요");
					}
				});
			});
</script>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
<style>
body{
	font-family:나눔고딕, NanumGothic, ng;
	margin-right: 0px
	}

.msg {
	margin-top: 35px;
}

.table {
	margin-top: 15px;
}

#msg_btn {
	margin-top: 10px;
}
</style>
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

	<jsp:useBean id="dao" class="dao.BookmarkDao" />

	<%
		Vector<Message_Dto> list = dao.MessageList();
		totalRecord = list.size();
	%>
	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_message_board" />

		<div class="msg">
			<div class="btn-group btn-group-justified">
				<a href="#" class="btn btn-sm btn-black active">쪽지함</a>
			</div>

			<table class="div-table table">
				<tbody>
					<tr class="active">
						<th><input type="checkbox" id="all"></th>
						<th>번호</th>
						<th>개설자</th>
						<th>강연</th>
						<th>보낸날짜</th>
						<th>확인여부</th>

					</tr>
					<tr>
						<%
							if (list.size() == 0) {
						%>
						<td colspan="9" class="text-muted text-center" height="150"><br />
							<br /> <br />
							<h5>자료가 없습니다.</h5></td>
					</tr>
					<%
						} else {
							for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
								if (i == totalRecord)
									break;
								Message_Dto dto = list.get(i);
					%>
					<tr>
						<td><input type="checkbox" name="check"></td>
						<td id="msg_num"><%=dto.getMsg_num()%> <input type="hidden"
							name="msg_num" value="<%=dto.getMsg_num()%>" /></td>
						<td><%=dto.getName()%></td>
						<td id="title" style="text-align: center"><%=dto.getTitle()%>
						</td>
						<td><%=dto.getReporting_date()%></td>
						<td>
							<%
								String confirm = null;

										if (dto.getConfirmation().equals("n")) {
											confirm = "미확인";
										} else {
											confirm = "확인";
										}
							%> <%=confirm%></td>
					</tr>
					<%
						}
						}
					%>
					<tr>
						<td colspan="9" class="text-center"><br /> <br />쪽지 보관일수는 <strong>30</strong>일
							입니다.</td>
					</tr>
				</tbody>
			</table>
			<div class="pagination">
				<ul>
					<%
						if (nowBlock > 0) {
					%>
					<li><a href="javascript:ch(0, 0)">이전 <%=pagePerBlock%>개
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
					<li><a href="javascript:ch(0, 2)">다음 <%=pagePerBlock%>개
					</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<br />
			<p class="text-center" id="msg_btn">
				<button type="button" class="btn" id="delBtn">확인</button>
				<button type="button" onclick="window.close();" class="btn">닫기</button>
			</p>
		</div>
	</form>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

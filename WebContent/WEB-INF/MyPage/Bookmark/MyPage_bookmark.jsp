<%--
페이지 - 마이페이지_즐겨찾기내역
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 즐겨찾기 출력 / 중복되는 경우 예외처리필요함.
 --%>

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@ page import="dto.Message_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" href="/KnowHowFactory/css/style.css" type="text/css"
	media="screen" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script>
	$(document).ready(function() {

		var date = $("#date").val();
		var title = $("#title");
		if (title.length == 0) {
		} else if (title.length > 0) {
			$('#slidebox').animate({
				bottom : '0px'
			}, 300);

			//클릭하지 않으면 자동으로 사라짐	
			$('#slidebox').delay(8000).animate({
				bottom : '-300px',
			}, 1000);
		} else {
			$('#slidebox').animate({
				bottom : '-300px'
			}, 1000);
			return true;
		}

		$('#slidebox').click(function() {
			window.open("front?cmd=message", "", "width=500, height=500, scrollbars=yes");
			$('#slidebox').stop(true).animate({
				bottom : '-300px',
			}, 1000);
		});

		$("#req").click(function() {
			if ($("input:checked").length > 0) {
				return true;
			} else {
				alert("삭제할 즐겨찾기를 선택해주세요.");
				return false;
			}
		})

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
<link href="/KnowHowFactory/style.css" rel="stylesheet">
<style>
#menu {
	margin-left: 1px;
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
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		int book_num = 0;
		boolean a = dao.Overlap(book_num);

		if (a == false) {

		} else {

			String mem_num = String.valueOf(session.getAttribute("loginMem_num"));
			Vector<Bookmark_Dto> list = dao.BookmarkList(Integer.parseInt(mem_num));
			totalRecord = list.size();
	%>
	<%
		beginPerPage = nowPage * numPerPage;
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
							쪽지함&nbsp;&nbsp;<input type="button"
								class="icon-envelope icon-white" onclick="fnMessage()" />&nbsp;&nbsp;
							즐겨찾기&nbsp;<a href="#"><%=totalRecord%></a>
						</h5>
					</div>
					<br />
				</form>
				<ul class="nav nav-list span2">
					<li class="divider"></li>
					<li><a href="front?cmd=speech">활동내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=cart">장바구니</a></li>
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=bookmark">즐겨찾기</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=point">포인트내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=payment">결제내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=update_check">정보수정</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">회원탈퇴</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_bookmark" />
		<div class="container" id="main1">
			<div class="span9">
				<div class="row">
					<ul class="nav nav-pills nav-stacked" id="menu">
						<li class="active"><a href="#" id="btn">즐겨찾기</a></li>
					</ul>
				</div>
			</div>

			<div class="span9">
				<table class="div-table table bsk-tbl bg-white">
					<thead>
						<tr class="bg-black">
							<th style="width: 50px"><strong>번호</strong></th>
							<th><strong>분야</strong></th>
							<th><strong>즐겨찾기</strong></th>
							<th><strong>삭제</strong></th>
						</tr>
					</thead>
					<tbody>
						<%
							if (list.size() == 0) {
						%>
						<tr>
							<td colspan="9" style="text-align: center"><h5>
									<br />즐겨찾기한 회원이 없습니다.
								</h5></td>
						</tr>
						<%
							} else {
									for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
										if (i == totalRecord)
											break;

										Bookmark_Dto dto = list.get(i);
						%>
						<tr>
							<td>
								<%
									int num = dto.getBookmark_num();
								%><%=dto.getBookmark_num()%>
							</td>
							<td><%=dto.getField()%></td>
							<td><%=dto.getName()%> <input type="hidden" id="title"
								name="title" value="<%=dto.getTitle()%>" /></td>
							<td><input type="checkbox" name="check"
								value="<%=dto.getBookmark_num()%>" /> <input type="hidden"
								id="date" value="<%=dto.getReporting_date()%>" /></td>
						</tr>
					</tbody>
					<%
						}
							}
					%>
				</table>
				<br />
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
				<br />

			</div>


			<div class="span9" align="center"
				style="margin-right: 80px; margin-top: 200px">
				<p>
					<input type="button" data-target="#bookmark"
						class="btn btn-primary" value="요청" id="req" data-toggle="modal" />
					<a href="/KnowHowFactory/main.jsp" class="btn">취소</a>
				</p>
			</div>
		</div>
		<div class="modal hide fade inverse" id="bookmark">
			<div class="modal-body" style="text-align: center">
				<h4>
					<strong> <%
 	for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
 			if (i == totalRecord)
 				break;

 			Bookmark_Dto dto = list.get(i);

 			if (dto.getBookmark_num() == i) {
 %><%=dto.getName()%> <%
 	}
 		}
 	}
 %>강연자를 즐겨찾기에서 삭제하시겠습니까?
					</strong>
				</h4>
			</div>

			<div class="modal-footer">
				<button class="btn btn-primary" data-dismiss="modal" id="delBtn">확인</button>
				<button class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>

		<!-- 슬라이드 메시지 -->

		<div id="slidebox">
			<a class="close"></a>
			<h2>메시지가 도착했습니다.</h2>
		</div>
	</form>

	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
